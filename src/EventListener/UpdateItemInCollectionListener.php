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
    private string $inventory_status;
    private string $AVAILABLE = '1'; /* product available for selling */
    private string $RESERVED = '2'; /* product in cart, no reamining quantity */
    private string $SOLDOUT = '3'; /* product sold, no quantity left */

    /**
     * Prevents setting the quantity in cart higher than given in product-quantity.
     * Also sets inventory_status.
     *
     * @param ProductCollectionItem $objItem
     * @param array<mixed>          $arrSet
     * @param Cart                  $objCart
     *
     * @return mixed
     */
    public function __invoke($objItem, $arrSet, $objCart)
    {
        $objProduct = $objItem->getProduct();

        // quantity activated but inventory_status not activated
        if ((null === $objProduct->inventory_status) && (null !== $objProduct->quantity)) { //@phpstan-ignore-line as still working
            throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
        }

        // Return without stock-management: if quantity not exists or is NULL or empty
        if (!('0' === $objProduct->quantity || $objProduct->quantity > '0' ? true : false)) { //@phpstan-ignore-line as still working
            // exclude case string = '0' which would be evaluated as falsy otherwise

            return $arrSet; // return unchanged
        }

        // If quantity is zero: Set SOLDOUT; message; return false
        if ('0' === $objProduct->quantity) {
            $this->inventory_status = $this->SOLDOUT;
            Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id); // @phpstan-ignore-line as still working

            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return false;
        }

        // If quantity > 0: stock-management
        if (\array_key_exists('quantity', $arrSet) && $arrSet['quantity']) {
            // If quantity in cart is higher then the available quantity: limits quantity in cart to the available quantity. Message. Sets RESERVED.
            if ($arrSet['quantity'] > $objProduct->quantity) {
                $arrSet['quantity'] = $objProduct->quantity;

                Message::addError(sprintf(
                    $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                    $objProduct->getName(),
                    $objProduct->quantity
                ));

                $this->inventory_status = $this->RESERVED;
                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
            }

            // If quantity in cart is equal to the available quantity, set RESERVED.
            elseif ($arrSet['quantity'] === $objProduct->quantity) {
                $this->inventory_status = $this->RESERVED;
                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
            }

            // If quantity in cart is less then the available quantity, sets AVAILABLE
            else {
                $this->inventory_status = $this->AVAILABLE;
                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
            }
        }

        return $arrSet;
    }
}
