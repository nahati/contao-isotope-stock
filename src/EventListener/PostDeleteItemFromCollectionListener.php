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

    private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for selling */
    private string $SOLDOUT = '4'; /* product bought, no remaining quantity */

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

        // Stockmanagement not or not correctly configured
        if (!$this->helper->checkStockmanagement($objProduct)) {
            // if not correctly configured, throw exception

            return; // no stock-management
        }

        // Get an adapter for the Database class
        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // Get an adapter for the Standard class
        /** @var Adapter<Standard> $standardAdapter */
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Set inventory_status according to quantity
        $this->inventory_status = '0' === $objProduct->quantity ? $this->SOLDOUT : $this->AVAILABLE;

        // Set inventory_status SOLDOUT if parent product is SOLDOUT
        if ($objProduct->pid > 0) {
            $objParentProduct = $standardAdapter->findByPk($objProduct->pid);

            if ($objParentProduct->inventory_status === $this->SOLDOUT) {
                $this->inventory_status = $this->SOLDOUT;
            }
        }

        $databaseAdapter->getInstance()->prepare('UPDATE ' . Standard::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
    }
}
