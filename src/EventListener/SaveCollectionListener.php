<?php

// src/EventListener/SaveCollectionListener.php

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
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("saveCollection")
 */
class SaveCollectionListener
{
    private ContaoFramework $framework;

    // private string $inventory_status;
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
     * Invoked when Cart is saved
     * Handles boundary conditions for stock-management.
     *
     * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
     *
     * @param ProductCollection $objCart // Cart
     * @return void
     */
    public function __invoke($objCart): void
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        foreach ($objCart->getItems() as $objItem) {

            /** @var Standard|null $objProduct */
            $objProduct = $objItem->getProduct(true) ?? null;

            // No product
            if (!$objProduct) {
                continue;
            }

            // Stockmanagement not or not correctly configured
            if (!$this->helper->checkStockmanagement($objProduct)) {
                // if not correctly configured, throw exception

                continue; // no stock-management
            }

            // Product SOLDOUT: message, set quantity in cart zero
            if ($this->helper->isSoldout($objProduct)) {

                $this->helper->issueErrorMessage('productOutOfStock', $objProduct->getName());

                $objItem->quantity = 0;
                $objItem->save();

                continue;
            }
        }
    }
}
