<?php

// src/EventListener/UpdateItemInCollectionListener.php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\EventListener;

use Contao\CoreBundle\Framework\Adapter;
use Contao\CoreBundle\Framework\ContaoFramework;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("updateItemInCollection")
 */
class UpdateItemInCollectionListener
{
    private ContaoFramework $framework;

    private bool $itemIsModified = false;

    private bool $cartNeedsModification = false;

    /**
     * @var Helper // make use of methods from the Helper class
     */
    private $helper;

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /** Stock Management Type A.
     *
     *  Handling of stock management per product.
     *
     * @param Standard     $objProduct // Product
     * @param array<mixed> $arrSet     // Properties of item in cart, esp. quantity in Cart
     *                                 // call by reference, giving the newly calculated quantity in cart
     * @param Cart         $objCart    // Cart
     *
     * @return mixed // $arrSet (changed or unchanged quantity)
     */
    private function stockManagementA($objProduct, &$arrSet, $objCart)
    {
        // Get the return of the stock management for the product
        /** @var int $surplusProduct */
        $surplusProduct = $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']);

        // More in cart than the product can afford
        if ($surplusProduct > 0 && Helper::SOLDOUT !== $objProduct->inventory_status) {
            $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            $arrSet['quantity'] -= $surplusProduct; // decrease by surplus quantity

            $arrSet['quantity'] = $arrSet['quantity'] < 0 ? 0 : $arrSet['quantity']; // limit to zero
        }

        // Variant product
        else {
            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $setInventoryStatusTo = null;
            $anzSiblingsInCart = 0;

            // Get the sum of the quantity of all siblings in cart (i.e. not including the current product) and add the quantity in cart of the current product.
            /** @var int qtyFamily // overall quantity in cart for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $arrSet['quantity'];

            // Manage stock for parent product with overall quantity in cart for all it's childs
            $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $qtyFamily, $setInventoryStatusTo);

            // More in cart than the parent can afford
            if ($surplusParent > 0 && Helper::SOLDOUT !== $objParentProduct->inventory_status) {
                $this->helper->issueErrorMessage('quantityNotAvailable', $objParentProduct->getName(), $objParentProduct->quantity);
            }

            // When parent is still available, we do not know here what to do with the children.
            // if (Helper::AVAILABLE === $setInventoryStatusTo) {
            //     $this->helper->setParentAndSiblingsProductsAvailable($objParentProduct, $objProduct->id);
            // } elseif (Helper::RESERVED === $setInventoryStatusTo) {

            if (Helper::RESERVED === $setInventoryStatusTo) {
                $this->helper->setParentAndChildProductsReserved($objParentProduct);
            } elseif (Helper::SOLDOUT === $setInventoryStatusTo) {
                $this->helper->setParentAndChildProductsSoldout($objParentProduct);
            }
            // do nothing if $setInventoryStatusTo = \null or AVAILABLE

            $arrSet['quantity'] -= max($surplusProduct, $surplusParent); // decrease by max surplus quantity

            $arrSet['quantity'] = $arrSet['quantity'] < 0 ? 0 : $arrSet['quantity']; // limit to zero
        }

        return $arrSet;
    }

    /** Stock Management Type B.
     *
     *  Handling of stock management per order.
     *
     * @param Standard     $objProduct // Product
     * @param array<mixed> $arrSet     // Properties of item in cart, esp. quantity in Cart
     *                                 // call by reference, giving the newly calculated quantity in cart
     * @param Cart         $objCart    // Cart
     *
     * @return mixed // $arrSet (changed or unchanged quantity or false)
     */
    private function stockManagementB($objProduct, &$arrSet, $objCart)
    {
        // Get the return of the stock management for the product
        $returnProduct = $this->helper->manageStockTypeBAndReturnDifferences($objProduct, $arrSet['quantity']);

        if ($returnProduct['surMinus'] > 0) {
            $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objProduct->getName(), $objProduct->minQuantityPerOrder);
        }

        if ($returnProduct['surPlus'] > 0) {
            $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objProduct->getName(), $objProduct->maxQuantityPerOrder);
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            // Increase quantity in cart by the quantity below minQuantityPerOrder
            $arrSet['quantity'] += $returnProduct['surMinus'];

            // Decrease quantity in cart by the quantity above maxQuantityPerOrder
            $arrSet['quantity'] -= $returnProduct['surPlus'];

            $arrSet['quantity'] = $arrSet['quantity'] < 0 ? 0 : $arrSet['quantity']; // limit to zero
        }

        // Variant product
        else {
            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $anzSiblingsInCart = 0;

            // Get the sum of the quantity in cart of all siblings in cart (i.e. not including the current product) and add the quantity in cart of the current product.
            /** @var int qtyFamily // overall quantity in cart for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $arrSet['quantity'];

            // Get the return of the stock management for the parent product with overall quantity in cart for all it's childs
            $returnParent = $this->helper->manageStockTypeBAndReturnDifferences($objParentProduct, $qtyFamily);

            if ($returnParent['surMinus'] > 0) {
                $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objParentProduct->getName(), $objParentProduct->minQuantityPerOrder);
            }

            if ($returnParent['surPlus'] > 0) {
                $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objParentProduct->getName(), $objParentProduct->maxQuantityPerOrder);
            }

            // Now we do the changes in cart

            // Min quantity unreached
            if ($returnProduct['surMinus'] > 0 || $returnParent['surMinus'] > 0) {
                // Increase quantity in cart by the max of variant and parent quantity below minQuantityPerOrder
                $arrSet['quantity'] += max($returnProduct['surMinus'], $returnParent['surMinus']);
            }

            // Max quantity exceeded
            if ($returnProduct['surPlus'] > 0 || $returnParent['surPlus'] > 0) {
                // Decrease quantity in cart by the max of variant and parent quantity above maxQuantityPerOrder
                $arrSet['quantity'] -= max($returnProduct['surPlus'], $returnParent['surPlus']);
            }

            $arrSet['quantity'] = $arrSet['quantity'] < 0 ? 0 : $arrSet['quantity']; // limit to zero
        }

        return $arrSet;
    }

    /**
     * Invoked when cart is refreshed and when cart is checked out.
     *
     * Handles changes of quantity in cart and also handles concurring changes.
     *
     * Includes Stock Management Type A (regarding to quantity per product) and Type B (regarding to min and max quantity per order).
     *
     * If the quantity in cart has been modified, the user is asked for confirmation.
     *
     * If the product can not be bought in the newly calculated quantity, the user is asked for action. This might happen if the min and max quantities of variant and parent product are not in line with each other.
     *
     * Restriction: As the given cart is updated item by item, checks will be done item by item also (i.e. the lower part of the cart appears as it was before user changes).
     *
     * @param ProductCollectionItem $objItem // Item in Cart
     * @param array<mixed>          $arrSet  // Properties of item in cart, esp. quantity in Cart
     * @param Cart                  $objCart // Cart
     *
     * @return mixed // $arrSet (changed or unchanged quantity or false)
     */
    public function __invoke($objItem, $arrSet, $objCart)
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        /** @var Standard|null $objProduct */
        $objProduct = $objItem->getProduct() ?? null;

        // No product
        if (!$objProduct) {
            return false;
        }

        // none or invalid quantity in Cart
        if (!(\array_key_exists('quantity', $arrSet) && $arrSet['quantity'])) {
            return false;
        }

        /** @var int $qtyInCartBefore */
        $qtyInCartBefore = (int) ($arrSet['quantity']);

        // Stock Management Type B, which might change the quantity in cart ($arrSet is newly calculated - call by reference).
        $this->stockManagementB($objProduct, $arrSet, $objCart);

        // Stock Management Type A, which might decrease the quantity in cart ($arrSet is newly calculated - call by reference).
        $this->stockManagementA($objProduct, $arrSet, $objCart);

        $this->itemIsModified = ($arrSet['quantity'] !== $qtyInCartBefore);

        // Check if the quantity in cart is within the allowed range.

        // minQuantityPerOrder is set
        if ($this->helper->checkStockmanagementTypeB($objProduct)['min']) {
            // Check if the new quantity in cart reaches the minQuantityPerOrder
            if ($arrSet['quantity'] < $objProduct->minQuantityPerOrder) {
                $this->helper->issueErrorMessage('productNotSellableAsMinQuantityPerOrderUnreached', $objProduct->getName(), $objProduct->minQuantityPerOrder);

                $this->cartNeedsModification = true;
            }
        }

        // maxQuantityPerOrder is set
        if ($this->helper->checkStockmanagementTypeB($objProduct)['max']) {
            // Check if the new quantity in cart does not exceed the maxQuantityPerOrder
            if ($arrSet['quantity'] > $objProduct->maxQuantityPerOrder) {
                $this->helper->issueErrorMessage('productNotSellableAsMaxQuantityPerOrderExceeded', $objProduct->getName(), $objProduct->maxQuantityPerOrder);

                $this->cartNeedsModification = true;
            }
        }

        // Ask for user action if item has been modified or cart needs modification

        if ($this->itemIsModified || $this->cartNeedsModification) {
            if ($this->itemIsModified) {
                $message = 'confirmCheckout';
            } else {
                $message = 'makeModifications';
            }

            // issue message here "manually" as the message given to addError() might not be used furthermore
            $this->helper->issueErrorMessage($message);

            $objCart->addError($message);
            // leads to cart being issued again
        }

        return $arrSet;
    }
}
