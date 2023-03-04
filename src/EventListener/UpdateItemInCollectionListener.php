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
    private string $RESERVED  = '2'; /* product in cart, no reamining quantity */

    /**
     * Prevents setting the quantity in cart higher than given in product-quantity.
     * Also sets inventory_status.
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

            if (\array_key_exists('quantity', $arrSet) && $arrSet['quantity']) {
                if ($arrSet['quantity'] > $objProduct->quantity) {
                    // Prevents setting the quantity in cart higher than given in product-quantity (available quantity). Also sets inventory_status to "reserved".

                    $arrSet['quantity'] = $objProduct->quantity;
                    Message::addError(sprintf(
                        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                        $objProduct->getName(),
                        $objProduct->quantity
                    ));

                    $this->inventory_status = $this->RESERVED;
                    Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                } elseif ($arrSet['quantity'] = $objProduct->quantity) {
                    // Sets inventory_status to "reserved" if quantity in cart is equal to given in product-quantity (available quantity).

                    $this->inventory_status = $this->RESERVED;
                    Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                } else {   // ($arrSet['quantity'] < $objProduct->quantity)
                    // Sets inventory_status to "available" if quantity in cart is less than given in product-quantity (available quantity).

                    $this->inventory_status = $this->AVAILABLE;
                    Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                }
            }
        } else {
            // No quantity available at all. Set quantity to zero.
            $arrSet['quantity'] = 0;
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                $objProduct->getName(),
                $objProduct->quantity
            ));
        }

        return $arrSet;
    }
}
