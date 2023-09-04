<?php

// src/EventListener/PostDeleteItemFromCollectionListener.php

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
use Contao\Database;
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
 * @IsotopeHook("postDeleteItemFromCollection")
 */
class PostDeleteItemFromCollectionListener
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
     * Invoked when am Item has been deleted from the Cart
     * Handles boundary conditions for stock-management.
     *
     * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
     *
     * @param ProductCollectionItem $objItem
     * @param Cart                  $objCart
     */
    public function __invoke($objItem, $objCart): void
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        /** @var Standard|null $objProduct */
        $objProduct = $objItem->getProduct(true) ?? null;

        if (!$objProduct) {
            return;
        }

        // HandleLimitedEditions: type A not enabled.
        // If not correctly configured, throw exception.
        if (!$this->helper->checkConfigurationForLimitedEditions($objProduct)) {
            return; // no stock-management
        }

        // Get an adapter for the Database class
        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // Get an adapter for the Standard class
        /** @var Adapter<Standard> $standardAdapter */
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Set SOLDOUT if quantity zero
        if ('0' === $objProduct->quantity) {
            $databaseAdapter->getInstance()->prepare('UPDATE ' . Standard::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute(Helper::SOLDOUT, $objProduct->getId());
        }

        // Set SOLDOUT if parent product is SOLDOUT
        if ($objProduct->pid > 0) {
            $objParentProduct = $standardAdapter->findByPk($objProduct->pid);

            if (Helper::SOLDOUT === $objParentProduct->inventory_status) {
                $databaseAdapter->getInstance()->prepare('UPDATE ' . Standard::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute(Helper::SOLDOUT, $objProduct->getId());
            }
        }
    }
}
