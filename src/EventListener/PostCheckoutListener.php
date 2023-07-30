<?php

// src/EventListener/PostCheckoutListener.php

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
use Isotope\Model\ProductCollection\Order;
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("postCheckout")
 */
class PostCheckoutListener
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
     * Invoked after the checkout process has been completed.
     *
     *  Updates the quantity. Marks as SOLDOUT in all bought products/variants with no remaining quantity.
     *
     * @param Order $objOrder // ProductCollection in order
     */
    public function __invoke($objOrder): void
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        // Array of all soldout parent product's IDs in the order
        $soldoutParentProductIds = [];

        // Loop over all Items in the order
        foreach ($objOrder->getItems() as $objItem) {
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
                $this->helper->manageStockAfterCheckout($objProduct, $objItem->quantity);
            }

            // product is a variant
            else {
                // Manage stock for variant product with quantity of this variant
                $this->helper->manageStockAfterCheckout($objProduct, $objItem->quantity);

                // Get an adapter for the Standard class
                /** @var Adapter<Standard> $adapter */
                $adapter = $this->framework->getAdapter(Standard::class);

                // Get the parent product
                $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

                // Get the sum of the quantity of all siblings in the order (i.e. not including the current product) and add the quantity  of the current product in the order.
                /** @var int qtyFamily // overall quantity for all the parent's childs in the order */
                $qtyFamily = $this->helper->sumSiblings($objProduct, $objOrder, $objProduct->pid) + $objItem->quantity;

                // Manage stock for parent product with overall quantity in collection for all it's childs
                $soldout = $this->helper->manageStockAfterCheckout($objParentProduct, $qtyFamily);

                // If parent product is soldout, add it's ID to the array of soldout parent products, avoid duplicates
                if ($soldout && !\in_array($objParentProduct->id, $soldoutParentProductIds, true)) {
                    $soldoutParentProductIds[] = $objParentProduct->id;
                }
            }
        } // foreach

        // Set all child products to SOLDOUT, if the parent product of a product in the order is soldout.
        $this->helper->setChildProductsSoldout($objOrder, $soldoutParentProductIds);
    }
}
