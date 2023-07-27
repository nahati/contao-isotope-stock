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

use Contao\CoreBundle\Framework\ContaoFramework;
use Contao\CoreBundle\Framework\Adapter;
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

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    /**
     * @var Helper // make use of methods from the Helper class
     */
    private $helper;

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * Invoked when product is added to cart.
     *
     * Checks if the requested quantity exceeds stock.
     * Reduces requested quantity if neccessary; set inventory_status to RESERVED if no quantity left.
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

        /** @var Standard|null $objProduct */

        // No product
        if (!$objProduct) {
            return 0;
        }

        // Stockmanagement not or not correctly configured
        if (!$this->helper->checkStockmanagement($objProduct)) {
            // if not correctly configured, throw exception

            return $quantityRequestedForCart; // return unchanged requested quantity
        }

        // Fetch the quantity already in cart for this product
        $qtyAlreadyInCart = $this->helper->fetchQuantityInCart($objProduct, $objCart);

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            // Manage stock for product with quantity of this product plus the quantity already in cart for this product
            /** @var int $surplus */
            $surplus = $this->helper->manageStockAndReturnSurplus($objProduct, $quantityRequestedForCart + $qtyAlreadyInCart);

            $quantityRequestedForCart -= $surplus; // decrease by surplus quantity

            if ($surplus > 0 && $objProduct->inventory_status !== $this->SOLDOUT) {
                $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
            }

            return $quantityRequestedForCart;
        }
        // Variant product
        else {
            //
            // Manage stock for variant product with quantity of this variant plus the quantity already in cart for this variant
            $surplusVariant = $this->helper->manageStockAndReturnSurplus($objProduct, $quantityRequestedForCart + $qtyAlreadyInCart);

            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $setInventoryStatusTo = null;
            $anzSiblingsInCart = 0;

            // Get the sum of the quantity of all siblings in cart (i.e. not including the current product) and add the quantity in cart of the current product.
            /** @var int qtyFamily // overall quantity in cart for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $quantityRequestedForCart;

            // Manage stock for parent product with overall quantity in cart for all it's childs plus the requested quantity for the current product
            $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $qtyFamily + $qtyAlreadyInCart, $setInventoryStatusTo);

            if ($setInventoryStatusTo === $this->AVAILABLE) {
                $this->helper->setParentAndSiblingsProductsAvailable($objParentProduct, $objProduct->id);
            } elseif ($setInventoryStatusTo === $this->RESERVED) {
                $this->helper->setParentAndChildProductsReserved($objParentProduct);
            } elseif ($setInventoryStatusTo === $this->SOLDOUT) {
                $this->helper->setParentAndChildProductsSoldout($objParentProduct);
            }
            // do nothing if $setInventoryStatusTo = \null

            // More in cart than the variant can afford
            if ($surplusVariant > 0 && $objProduct->inventory_status !== $this->SOLDOUT) {
                $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
            }

            // More in cart than the parent can afford
            if ($surplusParent > 0 && $objParentProduct->inventory_status !== $this->SOLDOUT) {
                $this->helper->issueErrorMessage('quantityNotAvailable', $objParentProduct->getName(), $objParentProduct->quantity);
            }

            $quantityRequestedForCart -= max($surplusVariant, $surplusParent); // decrease by max surplus quantity

            return $quantityRequestedForCart < 0 ? 0 : $quantityRequestedForCart; // limit to zero
        }
    }
}
