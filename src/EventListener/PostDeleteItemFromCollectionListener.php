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

namespace nahati\ContaoIsotopeStockBundle\EventListener;

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
        $objProduct = $objItem->getProduct();

        // quantity activated but inventory_status not activated
        if ((null === $objProduct->inventory_status) && (null !== $objProduct->quantity)) { //@phpstan-ignore-line as still working
            throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
        }

        // inventory_status is not in use: return without stock-management
        if (!$objProduct->inventory_status) { //@phpstan-ignore-line as still working
            return;
        }

        // Return without stock-management: if quantity not >= '0'
        // e.g. not exists, NUll, empty
        if (!($objProduct->quantity >= '0')) { //@phpstan-ignore-line as still working
            return;
        }

        $this->inventory_status = $objProduct->quantity > 0 ? $this->AVAILABLE : $this->SOLDOUT;

        Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
    }
}
