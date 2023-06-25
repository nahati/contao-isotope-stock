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

use Contao\Database;
use Isotope\Model\Product;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("postDeleteItemFromCollection")
 */
class PostDeleteItemFromCollectionListener
{
    private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for selling */
    private string $SOLDOUT = '4'; /* product bought, no remaining quantity */

    /**
     * Sets inventory_status.
     *
     * @param ProductCollectionItem $objItem
     * @param Cart                  $objCart
     */
    public function __invoke($objItem, $objCart): void
    {
        /** @var Product|null $objProduct */
        $objProduct = $objItem->getProduct(true) ?? null;

        if (!$objProduct) {
            return;
        }

        // inventory_status is not in use (in theory: FALSE, not defined, NULL, '0' or '')
        if (!$objProduct->inventory_status) {
            // quantity activated
            if (null !== $objProduct->quantity) {
                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName())); // todo: fix the configuration of producttype
            }

            return; // no stock-management
        }

        // Return without stock-management if not limited edition
        if (!($objProduct->quantity >= '0')) {
            return; // no stock-management
        }

        $this->inventory_status = $objProduct->quantity > 0 ? $this->AVAILABLE : $this->SOLDOUT;

        Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
    }
}
