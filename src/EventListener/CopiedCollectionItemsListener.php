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

use Contao\CoreBundle\Framework\ContaoFramework;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Cart;
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

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * Invoked when product collection items from another collection have been copied to this one (e.g. cart to order or cart to cart).
     *
     * We let this listener return without any processing unless the source collection is a cart and the target collection is a cart.
     *
     * Includes handling of limited editions (regarding to quantity per product) and handling of order limits (regarding to min and max quantity per order).
     *
     * If the product can not be bought in the newly calculated quantity, the user is asked to make changes to the cart. This might happen if the min quantity per order and the quantity are not in line with each other.
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

            /** @var int $quantity */
            $quantity = $objItem->quantity;

            // Correct any deviations from the allowed range. This might change the quantity in cart (quantity has changed - call by reference).
            $this->helper->handleOrderLimits($objProduct, $quantity, $objTarget);

            $quantityInCartInLineWithAllowedRange = $quantity;

            // Handling of limited editions. This might decrease the quantity in cart (quantity has changed - call by reference).
            $parentIsSoldout = $this->helper->handleLimitedEditions($objProduct, $quantity, $objTarget);

            $quantityInCartInLineWithAllowedRangeAndStock = $quantity;

            // Not Soldout
            if (Helper::SOLDOUT !== $objProduct->inventory_status && !$parentIsSoldout) {
                // Keep quantity in cart (resulting from Order Quantity Control) if otherwise it would be negative or zero; this will ensure that the item is kept in cart so that user can decide
                $resultingQuantity = $quantityInCartInLineWithAllowedRangeAndStock > 0 ? $quantityInCartInLineWithAllowedRangeAndStock : $quantityInCartInLineWithAllowedRange;
            }
            // Product or parent soldout
            else {
                $resultingQuantity = 0;
            }

            // Update the quantity in cart if changed
            if ($objItem->quantity !== $resultingQuantity) {
                $objItem->quantity = $resultingQuantity;
                $objItem->save();
            }

            // Quantity in cart is not within the allowed range.
            if ($this->helper->quantityIsNotInTheAllowedRange($objProduct, $objItem->quantity, $objTarget)) {
                // issue message here "manually" as the message given to addError() might not be used furthermore
                $this->helper->issueErrorMessage('makeModifications');

                $objTarget->addError('makeModifications');
                // leads to cart being issued again
            }
        }
    }
}
