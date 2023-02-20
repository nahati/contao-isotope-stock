<?php

// src/EventListener/UpdateItemInCollectionListener.php

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
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("updateItemInCollection")
 */
class UpdateItemInCollectionListener
{
    /* inventory status: */
    /**
     * @var string
     */
    private $inventory_status;
    private string $AVAILABLE = '1'; /* product available for selling */

    /**
     * Prevents setting the quantity in cart higher than given in product-quantity.
     *
     * @param ProductCollectionItem $objItem
     * @param array<mixed>          $arrSet
     * @param Cart                  $objCart
     *
     * @return array<mixed>
     */
    public function __invoke($objItem, $arrSet, $objCart)
    {
        $objProduct = null;
        $objProduct = $objItem->getProduct();

        if ($objProduct->quantity > 0) { // @phpstan-ignore-line as still working by some magic
            // Prevents setting the quantity in cart higher than given in product-quantity (available quantity).
            if (\array_key_exists('quantity', $arrSet) && $arrSet['quantity'] && $arrSet['quantity'] > $objProduct->quantity) {
                $arrSet['quantity'] = $objProduct->quantity;

                Message::addError(sprintf(
                    $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                    $objProduct->getName(),
                    $objProduct->quantity
                ));
            }
            // Resets inventory_status back to "available" if quantity in cart is less than given in product-quantity (available quantity).
            elseif (\array_key_exists('quantity', $arrSet) && $arrSet['quantity'] && $arrSet['quantity'] < $objProduct->quantity) {
                $this->inventory_status = $this->AVAILABLE;

                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
            }
        }

        return $arrSet;
    }
}
