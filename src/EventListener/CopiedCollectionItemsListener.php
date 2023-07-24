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
     * Invoked when product collection items from another collection have been copied to this one (e.g. cart to order or cart to cart).
     *
     * We let this listener return without any processing unless the source collection is a cart and the target collection is a cart.
     *
     * Handles changes of quantity in collection and also handles concurring changes.
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

            // Stockmanagement not or not correctly configured
            if (!$this->helper->checkStockmanagement($objProduct)) {
                // if not correctly configured, throw exception

                continue; // no stock-management
            }

            // Single product (not having any variants)
            if (!$objProduct->isVariant()) {
                /** @var int $surplus */
                $surplus = $this->helper->manageStockAndReturnSurplus($objProduct, $objItem->quantity);

                $objItem->quantity -= $surplus; // decrease by surplus quantity

                if ($surplus > 0) {
                    $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
                }

                $objItem->save();

                continue;
            }

            // Variant product
            else {
                //
                // Manage stock for variant product with quantity of this variant
                $surplusVariant = $this->helper->manageStockAndReturnSurplus($objProduct, $objItem->quantity);

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

                if ($setInventoryStatusTo === $this->AVAILABLE) {
                    $this->helper->setParentAndSiblingsProductsAvailable($objParentProduct, $objProduct->id);
                } elseif ($setInventoryStatusTo === $this->RESERVED) {
                    $this->helper->setParentAndChildProductsReserved($objParentProduct);
                } elseif ($setInventoryStatusTo === $this->SOLDOUT) {
                    $this->helper->setParentAndChildProductsSoldout($objParentProduct);
                }
                // do nothing if $setInventoryStatusTo = \null

                // More in collection than the variant can afford
                if ($surplusVariant > 0) {
                    $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
                }

                // More in collection than the parent can afford
                if ($surplusParent > 0) {
                    $this->helper->issueErrorMessage('quantityNotAvailable', $objParentProduct->getName(), $objParentProduct->quantity);
                }

                // Not Soldout
                if ($objProduct->inventory_status !== $this->SOLDOUT && $objParentProduct->inventory_status !== $this->SOLDOUT) {
                    // Evaluate possible new quantity in cart as given quantity in cart minus max surplus quantity
                    $test = $objItem->quantity - max($surplusVariant, $surplusParent);

                    // Keep quantity in cart if otherwise it would be negative or zero; this will ensure that the item is kept in cart so that user can decide
                    $objItem->quantity = $test > 0 ? $test : $objItem->quantity;
                }
                // Product or parent soldout
                else {
                    $objItem->quantity = 0;
                }

                $objItem->save();

                continue;
            }
        }
    }
}
