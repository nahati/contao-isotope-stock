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
    /* inventory status: */
    /**
     * @var string
     */
    private $inventory_status;
    private string $AVAILABLE = '1'; /* product available for selling */
    private string $SOLDOUT = '3'; /* product bought, no remaining quantity */

    /**
     * Sets inventory_status.
     *
     * @param ProductCollectionItem $objItem
     * @param Cart                  $objCart
     */
    public function __invoke($objItem, $objCart): void
    {
        $objProduct = null;
        $objProduct = $objItem->getProduct();

        if ('' === $objProduct->quantity || null === $objProduct->quantity) { // @phpstan-ignore-line as still working
            return; // return if no quantity has been set for the product
        }

        if ($objProduct->quantity > 0) {
            $this->inventory_status = $this->AVAILABLE;
        } else { // No quantity available at all.
            $this->inventory_status = $this->SOLDOUT;
        }
        Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
    }
}
