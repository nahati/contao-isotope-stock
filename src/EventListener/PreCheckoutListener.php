<?php

// src/EventListener/PreCheckoutListener.php

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
use Isotope\Module\Checkout;
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("PreCheckout")
 */
class PreCheckoutListener
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
     * Invoked during the checkout process.
     *
     *  Does the same processing as in PostCheckoutListener, but without any updates. This way we can stop the checkout process if there are overbought products. We do this by returning false.
     *
     * @param Order $objOrder // ProductCollection in order, not empty
     * @param Checkout $objCheckout // Checkout object
     * @return bool // false if checkout should be stopped
     */
    public function __invoke($objOrder, $objCheckout)
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        // Array of all soldout parent product's IDs in the order
        $soldoutParentProductIds = [];

        // Array of all overbought product's (ID / name) in the order
        $overboughtProducts = [];

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
                $overbought = false;

                $this->helper->manageStockBeforeCheckout($objProduct, $objItem->quantity, $overbought);

                // if overbought add product id and name to array of overbought products
                if ($overbought) {
                    $overboughtProducts[] = [
                        'id' => $objProduct->id,
                        'name' => $objProduct->name
                    ];
                }
            }

            // product is a variant
            else {
                // Manage stock for variant product with quantity of this variant
                $overbought = false;

                $this->helper->manageStockBeforeCheckout($objProduct, $objItem->quantity, $overbought);

                // if overbought add product id and name to array of overbought products
                if ($overbought) {
                    $overboughtProducts[] = [
                        'id' => $objProduct->id,
                        'name' => $objProduct->name
                    ];
                }

                // Get an adapter for the Standard class
                /** @var Adapter<Standard> $adapter */
                $adapter = $this->framework->getAdapter(Standard::class);

                // Get the parent product
                $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);
                // $objParentProduct->refresh(); // refresh the parent product, otherwise we would not get the changes made in an previous loop

                // Manage stock for parent product with quantity of this variant
                $overbought = false;

                $soldout = $this->helper->manageStockBeforeCheckout($objParentProduct, $objItem->quantity, $overbought);

                // if overbought add product id and name to array of overbought products
                if ($overbought) {
                    $overboughtProducts[] = [
                        'id' => $objProduct->id,
                        'name' => $objProduct->name
                    ];
                }

                // If parent product is soldout, add it's ID to the array of soldout parent products, avoid duplicates
                if ($soldout && !\in_array($objParentProduct->id, $soldoutParentProductIds, true)) {
                    $soldoutParentProductIds[] = $objParentProduct->id;
                }
            }
        } // foreach

        // Walk through the list of soldout parent product ids and set all child products to SOLDOUT.
        if ($soldoutParentProductIds) {
            // $this->helper->setChildProductsSoldout($soldoutParentProductIds);
        }

        // Handle overbought situation
        if ($overboughtProducts) {
            return false;
        }
    }
}
