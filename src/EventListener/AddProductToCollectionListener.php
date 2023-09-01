<?php

// src/EventListener/AddProductToCollectionListener.php

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
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("addProductToCollection")
 */
class AddProductToCollectionListener
{
    private ContaoFramework $framework;

    // // private string $inventory_status;
    // private string $AVAILABLE = '2'; /* product available for sale */
    // private string $RESERVED = '3'; /* product in cart, no quantity left */
    // private string $SOLDOUT = '4'; /* product sold, no quantity left */

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
     * @param Standard $objProduct      // Product
     * @param int      $quantityForCart // total quantity requested for cart
     *                                  // call by reference, giving the newly calculated quantity for cart
     * @param Cart     $objCart         // Cart
     */
    private function stockManagementA($objProduct, &$quantityForCart, $objCart): void
    {
        // Get the return of the stock management for the product
        /** @var int $surplusProduct */
        $surplusProduct = $this->helper->manageStockAndReturnSurplus($objProduct, $quantityForCart);

        // More for cart than the product can afford
        if ($surplusProduct > 0 && Helper::SOLDOUT !== $objProduct->inventory_status) {
            $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            $quantityForCart -= $surplusProduct; // decrease by surplus quantity

            $quantityForCart = $quantityForCart < 0 ? 0 : $quantityForCart; // limit to zero
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
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $quantityForCart;

            // Manage stock for parent product with overall quantity in cart for all it's childs plus the requested quantity for the current product
            $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $qtyFamily, $setInventoryStatusTo);

            // More in cart than the parent can afford
            if ($surplusParent > 0 && Helper::SOLDOUT !== $objParentProduct->inventory_status) {
                $this->helper->issueErrorMessage('quantityNotAvailable', $objParentProduct->getName(), $objParentProduct->quantity);
            }

            // When parent is still AVAILABLE, we do not know here what to do with the children.
            // if (Helper::AVAILABLE === $setInventoryStatusTo) {
            //     $this->helper->setParentAndSiblingsProductsAvailable($objParentProduct, $objProduct->id);
            // } elseif (Helper::RESERVED === $setInventoryStatusTo) {

            if (Helper::RESERVED === $setInventoryStatusTo) {
                $this->helper->setParentAndChildProductsReserved($objParentProduct);
            } elseif (Helper::SOLDOUT === $setInventoryStatusTo) {
                $this->helper->setParentAndChildProductsSoldout($objParentProduct);
            }
            // do nothing if $setInventoryStatusTo = \null or AVAILABLE

            $quantityForCart -= max($surplusProduct, $surplusParent); // decrease by max surplus quantity

            $quantityForCart = $quantityForCart < 0 ? 0 : $quantityForCart; // limit to zero
        }
    }

    /** Stock Management Type B.
     *
     *  Handling of stock management per order.
     *
     * @param Standard $objProduct      // Product
     * @param int      $quantityForCart // total quantity requested for cart
     *                                  // call by reference, giving the newly calculated quantity for cart
     * @param Cart     $objCart         // Cart
     */
    private function stockManagementB($objProduct, &$quantityForCart, $objCart): void
    {
        // Get the return of the stock management for the product
        $returnProduct = $this->helper->manageStockTypeBAndReturnDifferences($objProduct, $quantityForCart);

        if ($returnProduct['surMinus'] > 0) {
            $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objProduct->getName(), $objProduct->minQuantityPerOrder);
        }

        if ($returnProduct['surPlus'] > 0) {
            $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objProduct->getName(), $objProduct->maxQuantityPerOrder);
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            // Increase quantity in cart by the quantity below minQuantityPerOrder
            $quantityForCart += $returnProduct['surMinus'];

            // Decrease quantity in cart by the quantity above maxQuantityPerOrder
            $quantityForCart -= $returnProduct['surPlus'];

            $quantityForCart = $quantityForCart < 0 ? 0 : $quantityForCart; // limit to zero
        }

        // Variant product
        else {
            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $anzSiblingsInCart = 0;

            // Get the sum of the quantity in cart of all siblings in cart (i.e. not including the current product) and add the quantity for cart of the current product.
            /** @var int qtyFamily // overall quantity in cart for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $quantityForCart;

            // Get the return of the stock management for the parent product with overall quantity in cart for all it's childs
            $returnParent = $this->helper->manageStockTypeBAndReturnDifferences($objParentProduct, $qtyFamily);

            if ($returnParent['surMinus'] > 0) {
                $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objParentProduct->getName(), $objParentProduct->minQuantityPerOrder);
            }

            if ($returnParent['surPlus'] > 0) {
                $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objParentProduct->getName(), $objParentProduct->maxQuantityPerOrder);
            }

            // Now we do the changes with $quantityForCart

            // Min quantity unreached
            if ($returnProduct['surMinus'] > 0 || $returnParent['surMinus'] > 0) {
                // Increase quantity for cart by the max of variant and parent quantity below minQuantityPerOrder
                $quantityForCart += max($returnProduct['surMinus'], $returnParent['surMinus']);
            }

            // Max quantity exceeded
            if ($returnProduct['surPlus'] > 0 || $returnParent['surPlus'] > 0) {
                // Decrease quantity for cart by the max of variant and parent quantity above maxQuantityPerOrder
                $quantityForCart -= max($returnProduct['surPlus'], $returnParent['surPlus']);
            }

            $quantityForCart = $quantityForCart < 0 ? 0 : $quantityForCart; // limit to zero
        }
    }

    /**
     * Invoked when product is added to cart.
     *
     * Includes Stock Management Type A (regarding to quantity per product) and Type B (regarding to min and max quantity per order).
     *
     * @param Standard $objProduct               // Product to be added to cart
     * @param mixed    $quantityRequestedForCart // Quantity requested for cart
     * @param Cart     $objCart                  // Cart
     *
     * @return int // returns quantity to be added to cart
     */
    public function __invoke($objProduct, $quantityRequestedForCart, $objCart)
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        // Fetch the quantity already in cart for this product
        $qtyAlreadyInCart = $this->helper->fetchQuantityInCart($objProduct, $objCart);

        // Resulting quantity in cart if we add the requested quantity to the quantity already in cart
        $quantityForCart = $quantityRequestedForCart + $qtyAlreadyInCart;

        // Stock Management TypeB, which might decrease the quantity for cart (call by reference).
        $this->stockManagementB($objProduct, $quantityForCart, $objCart);

        // Stock Management Type A, which might decrease the quantity for cart (call by reference).
        $this->stockManagementA($objProduct, $quantityForCart, $objCart);

        // Check if the quantity is within the allowed range.

        // minQuantityPerOrder is set
        if ($this->helper->checkStockmanagementTypeB($objProduct)['min']) {
            // Check if the new quantity in cart reaches the minQuantityPerOrder
            if ($quantityForCart < $objProduct->minQuantityPerOrder) {
                $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objProduct->getName(), $objProduct->minQuantityPerOrder);

                return 0; // return 0 to prevent adding the product to cart
            }
        }

        // maxQuantityPerOrder is set
        if ($this->helper->checkStockmanagementTypeB($objProduct)['max']) {
            // Check if the new quantity in cart does not exceed the maxQuantityPerOrder
            if ($quantityForCart > $objProduct->maxQuantityPerOrder) {
                $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objProduct->getName(), $objProduct->maxQuantityPerOrder);

                return 0; // return 0 to prevent adding the product to cart
            }
        }

        return $quantityForCart - $qtyAlreadyInCart; // return the (maybe modified) requested quantity for cart
    }
}
