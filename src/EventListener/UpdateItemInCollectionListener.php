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

    /**
     * @var Helper // make use of methods from the Helper class
     */
    private $helper;

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * Invoked when cart is refreshed and when cart is checked out.
     *
     * Includes handling of limited editions (regarding to quantity per product) and handling of order limits (regarding to min and max quantity per order).
     *
     * If the quantity in cart has been modified, the user is asked for confirmation.
     *
     * If the product can not be bought in the newly calculated quantity, the user is asked to make changes to the cart. This might happen if the min quantity per order and the quantity are not in line with each other.
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

        // This would prevent items with quantity zero being deleted from cart
        // // none or invalid quantity in Cart
        // if (!(\array_key_exists('quantity', $arrSet) && $arrSet['quantity'])) {
        //     return false;
        // }

        /** @var int $qtyInCartBefore */
        $qtyInCartBefore = (int) ($arrSet['quantity']);

        // Handling of limited orders. This might change the quantity in cart ($arrSet['quantity'] is newly calculated - call by reference).
        $this->helper->handleOrderLimits($objProduct, $arrSet['quantity'], $objCart);

        // Handling of limited editions. This might decrease the quantity in cart ($arrSet['quantity'] is newly calculated - call by reference).
        $this->helper->handleLimitedEditions($objProduct, $arrSet['quantity'], $objCart);

        // Check if any user actions are asked for.

        $message = '';

        // quantity in cart has been changed.
        if (($arrSet['quantity'] !== $qtyInCartBefore)) {
            $message = 'confirmCheckout';
        }

        // Quantity in cart is not within the allowed range.
        if ($this->helper->quantityIsNotInTheAllowedRange($objProduct, $arrSet['quantity'], $objCart)) {
            // This error overwrites the previous one (if exists) as it is more severe
            $message = 'makeModifications';
        }

        // Ask for user action if a message has been set before
        if ($message) {
            // issue message here "manually" as the message given to addError() might not be used furthermore
            $this->helper->issueErrorMessage($message);

            $objCart->addError($message);
            // leads to cart being issued again
        }

        return $arrSet;
    }
}
