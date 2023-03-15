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

namespace nahati\ContaoIsotopeStockBundle\EventListener;

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
    private string $inventory_status;
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    /**
     * @param ProductCollection $objCart
     */
    public function __invoke($objCart): void
    {
        foreach ($objCart->getItems() as $objItem) {
            $objProduct = $objItem->getProduct(true);

            // quantity activated but inventory_status not activated
            if ((null === $objProduct->inventory_status) && (null !== $objProduct->quantity)) { //@phpstan-ignore-line as still working
                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
            }

            // inventory_status is not in use: return without stock-management
            if (!$objProduct->inventory_status) { //@phpstan-ignore-line as still working
                continue; // next in loop
            }

            // Return without stock-management: if quantity not >= '0'
            // e.g. not exists, NUll, empty
            if (!($objProduct->quantity >= '0')) { //@phpstan-ignore-line as still working
                continue; // next in loop
            }

            if ('0' === $objProduct?->quantity) { // @phpstan-ignore-line as still working
                // If procuct quantity zero: delete Item from cart, set SOLDOUT, message
                $objItem->delete();

                $this->inventory_status = $this->SOLDOUT;
                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id); // @phpstan-ignore-line as still working

                Message::addError(sprintf(
                    $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                    $objProduct->getName()
                ));
            }
        } // foreach
    }
}
