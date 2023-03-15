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
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

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

        // inventory_status is not in use: return without stock-management
        if (!$objProduct->inventory_status) { //@phpstan-ignore-line as still working
            return $arrSet; // return unchanged
        }

        // Return without stock-management: if quantity not >= '0'
        // e.g. not exists, NUll, empty
        if (!($objProduct->quantity >= '0')) { //@phpstan-ignore-line as still working
            return $arrSet; // return unchanged
        }

        // If quantity is zero: Set quantity in cart to zero; Set SOLDOUT;  message
        if ('0' === $objProduct->quantity) {
            $this->inventory_status = $this->SOLDOUT;
            Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id); // @phpstan-ignore-line as still working

            if (\array_key_exists('quantity', $arrSet) && $arrSet['quantity']) {
                $arrSet['quantity'] = 0;
            }

            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return $arrSet;
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
