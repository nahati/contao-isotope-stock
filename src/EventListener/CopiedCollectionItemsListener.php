<?php

// src/EventListener/CopiedCollectionItemsListener.php

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
use Isotope\Interfaces\IsotopeProductCollection;
use Isotope\Message;
use Isotope\Model\Product;
use Isotope\Model\ProductCollection;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("copiedCollectionItems")
 */
class CopiedCollectionItemsListener
{
    private string $inventory_status;
    private string $AVAILABLE = '1'; /* product available for selling */
    private string $RESERVED = '2'; /* product in cart, no reamining quantity */

    /**
     * Handles the quantity in cart. Also sets inventory_status.
     *
     * @param IsotopeProductCollection $objSource old cart
     * @param ProductCollection        $objTarget new cart
     * @param array<int>               $arrIds    oldItem->id / newItem->id
     *
     * @return bool
     */
    public function __invoke($objSource, $objTarget, $arrIds)
    {
        foreach ($arrIds as $key => $itemId) {
            if ($key) {
            } // To prevent ECS from this "error": Unused variable $key

            $objItem = $objTarget->getItemById($itemId) ?? null; // Item in cart

            $objProduct = $objItem->getProduct() ?? null; // Corresp. product

            // quantity activated but inventory_status not activated
            if ((null === $objProduct->inventory_status) && (null !== $objProduct->quantity)) { //@phpstan-ignore-line as still working
                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
            }

            if (!('0' === $objProduct->quantity || $objProduct->quantity > '0' ? true : false)) { //@phpstan-ignore-line as still working
                // (exclude case string = '0' which would be evaluated as falsy otherwise)
                // If quantity not exists or is NULL or empty
                continue; // next in loop
            }

            if ($objProduct->quantity > 0) { // Product quantity positiv
                // Prevents setting the quantity in cart higher than the available quantity.
                if ($objItem->quantity > $objProduct->quantity) {
                    $objItem->quantity = $objProduct->quantity;
                    $objItem->save();

                    Message::addError(sprintf(
                        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                        $objProduct->getName(),
                        $objProduct->quantity
                    ));

                    // Set RESERVED
                    $this->inventory_status = $this->RESERVED;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                }

                // Set RESERVED if quantity in cart is equal to the available quantity.
                elseif ($objItem->quantity === $objProduct->quantity) {
                    $this->inventory_status = $this->RESERVED;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                }

                // Set AVAILABLE if quantity in cart is less than the available quantity.
                else {
                    $this->inventory_status = $this->AVAILABLE;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                }
            }

            // If procuct quantity zero: set quantity in cart zero, message
            else {
                $objItem->quantity = 0;
                $objItem->save();
                Message::addError(sprintf(
                    $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                    $objProduct->getName(),
                    $objProduct->quantity
                ));
            }
        } // foreach

        return true;
    }
}
