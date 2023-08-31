<?php

// src/EventListener/CopiedCollectionItemsListener.php

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
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("copiedCollectionItems")
 */
class CopiedCollectionItemsListener
{
    private ContaoFramework $framework;

    /**
     * @var Helper // make use of methods from the Helper class
     */
    private $helper;

    private bool $cartNeedsModification = false;

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /** Stock Management Type A.
     *
     *  Handling of stock management per product.
     *
     * @param Standard              $objProduct // Product
     * @param ProductCollectionItem $objItem    // Item in Cart
     *                                          // call by reference, containing the newly calculated quantity in cart
     * @param Cart                  $objTarget  // Cart
     */
    private function stockManagementA($objProduct, &$objItem, $objTarget): void
    {
        // Get the return of the stock management for the product
        /** @var int $surplusProduct */
        $surplusProduct = $this->helper->manageStockAndReturnSurplus($objProduct, $objItem->quantity);

        // More in cart than the product can afford
        if ($surplusProduct > 0 && Helper::SOLDOUT !== $objProduct->inventory_status) {
            $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            $objItem->quantity -= $surplusProduct; // decrease by surplus quantity
        }

        // Variant product
        else {
            //
            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $setInventoryStatusTo = null;
            $anzSiblingsInCollection = 0;

            // Get the sum of the quantity of all siblings in collection (i.e. not including the current product) and add the quantity in collection of the current product.
            /** @var int qtyFamily // overall quantity in collection for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objTarget, $objProduct->pid, $anzSiblingsInCollection) + $objItem->quantity;

            // Manage stock for parent product with overall quantity in collection for all it's childs
            $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $qtyFamily, $setInventoryStatusTo);

            // More in cart than the parent can afford
            if ($surplusParent > 0) {
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

            // Not Soldout
            if (Helper::SOLDOUT !== $objProduct->inventory_status && Helper::SOLDOUT !== $objParentProduct->inventory_status) {
                // Evaluate possible new quantity in cart as given quantity in cart minus max surplus quantity
                $test = $objItem->quantity - max($surplusProduct, $surplusParent);

                // Keep quantity in cart if otherwise it would be negative or zero; this will ensure that the item is kept in cart so that user can decide
                $objItem->quantity = $test > 0 ? $test : $objItem->quantity;
            }
            // Product or parent soldout
            else {
                $objItem->quantity = 0;
            }
        }

        // Update the quantity in cart
        $objItem->save();
    }

    /** Stock Management Type B.
     *
     *  Handling of stock management per order.
     *
     * @param Standard              $objProduct // Product
     * @param ProductCollectionItem $objItem    // Item in Cart
     *                                          // call by reference, containing the newly calculated quantity in cart
     * @param Cart                  $objTarget  // Cart
     */
    private function stockManagementB($objProduct, &$objItem, $objTarget): void
    {
        // Get the return of the stock management for the product
        $returnProduct = $this->helper->manageStockTypeBAndReturnDifferences($objProduct, $objItem->quantity);

        if ($returnProduct['surMinus'] > 0) {
            $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objProduct->getName(), $objProduct->minQuantityPerOrder);
        }

        if ($returnProduct['surPlus'] > 0) {
            $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objProduct->getName(), $objProduct->maxQuantityPerOrder);
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            // Increase quantity in cart by the quantity below minQuantityPerOrder
            $objItem->quantity += $returnProduct['surMinus'];

            // Decrease quantity in cart by the quantity above maxQuantityPerOrder
            $objItem->quantity -= $returnProduct['surPlus'];

            $objItem->quantity = $objItem->quantity < 0 ? 0 : $objItem->quantity; // limit to zero
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
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objTarget, $objProduct->pid, $anzSiblingsInCart) + $objItem->quantity;

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
                $objItem->quantity += max($returnProduct['surMinus'], $returnParent['surMinus']);
            }

            // Max quantity exceeded
            if ($returnProduct['surPlus'] > 0 || $returnParent['surPlus'] > 0) {
                // Decrease quantity in cart by the max of variant and parent quantity above maxQuantityPerOrder
                $objItem->quantity -= max($returnProduct['surPlus'], $returnParent['surPlus']);
            }

            $objItem->quantity = $objItem->quantity < 0 ? 0 : $objItem->quantity; // limit to zero
        }

        // Update the quantity in cart
        $objItem->save();
    }

    /**
     * Invoked when product collection items from another collection have been copied to this one (e.g. cart to order or cart to cart).
     *
     * We let this listener return without any processing unless the source collection is a cart and the target collection is a cart.
     *
     * Handles changes of quantity in collection and also handles concurring changes.
     *
     * Includes Stock Management Type A (regarding to quantity per product) and Type B (regarding to min and max quantity per order).
     *
     * If the product can not be bought in the newly calculated quantity, the user is asked for action. This might happen if the min and max quantities of variant and parent product are not in line with each other.
     *
     * @param ProductCollection $objSource // source collection, not used here
     * @param ProductCollection $objTarget // target collection, after copying
     * @param array<int>        $arrIds    // oldItem->id => newItem->id, not used here
     */
    public function __invoke($objSource, $objTarget, $arrIds): void
    {
        // We want this listener to be processed only if the source collection is a cart and the target collection is a cart.
        if (!($objSource instanceof Cart && $objTarget instanceof Cart)) {
            return;
        }

        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        // Check that target collection is a non empty collection
        if (!$objTarget->getItems()) {
            return;
        }

        // Loop over all Items in the target collection
        foreach ($objTarget->getItems() as $objItem) {
            /** @var Standard|null $objProduct */
            $objProduct = $objItem->getProduct() ?? null;

            // No product
            if (!$objProduct) {
                continue;
            }

            // Stock Management Type B, which might change the quantity in cart ($objItem has changed - call by reference).
            $this->stockManagementB($objProduct, $objItem, $objTarget);

            // Stock Management Type A, which might decrease the quantity in cart ($objItem has changed - call by reference).
            $this->stockManagementA($objProduct, $objItem, $objTarget);

            // Check if the quantity in cart is within the allowed range.

            // minQuantityPerOrder is set
            if ($this->helper->checkStockmanagementTypeB($objProduct)['min']) {
                // Check if the new quantity in cart reaches the minQuantityPerOrder
                if ($objItem->quantity < $objProduct->minQuantityPerOrder) {
                    $this->helper->issueErrorMessage('productNotSellableAsMinQuantityPerOrderUnreached', $objProduct->getName(), $objProduct->minQuantityPerOrder);

                    $this->cartNeedsModification = true;
                }
            }

            // maxQuantityPerOrder is set
            if ($this->helper->checkStockmanagementTypeB($objProduct)['max']) {
                // Check if the new quantity in cart does not exceed the maxQuantityPerOrder
                if ($objItem->quantity > $objProduct->maxQuantityPerOrder) {
                    $this->helper->issueErrorMessage('productNotSellableAsMaxQuantityPerOrderExceeded', $objProduct->getName(), $objProduct->maxQuantityPerOrder);

                    $this->cartNeedsModification = true;
                }
            }
        }

        // After going through all items we ask for user action if cart needs modification

        if ($this->cartNeedsModification) {
            $message = 'makeModifications';

            // issue message here "manually" as the message given to addError() might not be used furthermore
            $this->helper->issueErrorMessage($message);

            $objTarget->addError($message);
            // leads to cart being issued again
        }
    }
}
