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

    /**
     * Resets inventory_status back to "available" if quantity in cart is less than given in product-quantity (available quantity).
     *
     * @param ProductCollectionItem $objItem
     * @param Cart                  $objCart
     */
    public function __invoke($objItem, $objCart): void
    {
        $objProduct = null;
        $objProduct = $objItem->getProduct();

        if ($objProduct->quantity > 0) { // @phpstan-ignore-line as still working by some magic
            if ($objItem->quantity >= $objProduct->quantity) {
                $this->inventory_status = $this->AVAILABLE;

                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
            }
        }
    }
}
