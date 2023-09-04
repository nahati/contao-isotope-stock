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

    /**
     * Invoked when product is added to cart.
     *
     * Includes handling of limited editions (regarding to quantity per product) and handling of order limits (regarding to min and max quantity per order).
     *
     * If the quantity is not in the allowed range, the product will not be added to cart.
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

        // Resulting quantity requested if we add the requested quantity to the quantity already in cart
        $quantityRequested = $quantityRequestedForCart + $qtyAlreadyInCart;

        // Correct any deviations from the allowed range. This might decrease the quantity requested (call by reference).
        $this->helper->handleOrderLimits($objProduct, $quantityRequested, $objCart);

        // Handling of limited editions. This might decrease the quantity requested (call by reference).
        $this->helper->handleLimitedEditions($objProduct, $quantityRequested, $objCart);

        // Quantity in cart is not within the allowed range.
        if ($this->helper->quantityIsNotInTheAllowedRange($objProduct, $quantityRequested, $objCart)) {
            return 0; // return 0 to prevent adding the product to cart
        }

        return $quantityRequested - $qtyAlreadyInCart; // return the (maybe modified) requested quantity for cart
    }
}
