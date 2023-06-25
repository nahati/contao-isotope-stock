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

use Contao\Database;
use Isotope\Message;
use Isotope\Model\Product;
use Isotope\Model\ProductCollection;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("saveCollection")
 */
class SaveCollectionListener
{
    // private string $inventory_status;
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    /**
     * @param ProductCollection $objCart // cart
     */
    public function __invoke($objCart): void
    {
        foreach ($objCart->getItems() as $objItem) {
            /** @var Product|null $objProduct */
            $objProduct = $objItem->getProduct(true) ?? null;

            if (!$objProduct) {
                continue;
            }

            // inventory_status is not in use (in theory: FALSE, not defined, NULL, '0' or '')
            if (!$objProduct->inventory_status) {
                // quantity activated
                if (null !== $objProduct->quantity) {
                    throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName())); // todo: fix the configuration of producttype
                }

                continue; // no stock-management
            }

            // Return without stock-management if not limited edition
            if (!($objProduct->quantity >= '0')) {
                continue; // no stock-management
            }

            // If quantity is zero: set SOLDOUT, message, delete item from cart
            if ('0' === $objProduct->quantity) {
                Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->SOLDOUT, $objProduct->id);

                Message::addError(sprintf(
                    $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                    $objProduct->getName()
                ));

                $objItem->quantity = 0;
                $objItem->save();
            }
        } // foreach
    }
}
