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
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

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

            $objProduct = $objItem?->getProduct() ?? null; // Corresp. product

            // quantity activated but inventory_status not activated
            if ((null === $objProduct?->inventory_status) && (null !== $objProduct?->quantity)) { //@phpstan-ignore-line as still working
                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
            }

            // inventory_status is not in use
            if (!$objProduct->inventory_status) { //@phpstan-ignore-line as still working
                continue; // next in loop
            }

            // Return without stock-management: if quantity not >= '0'
            // e.g. not exists, NUll, empty
            if (!($objProduct->quantity >= '0')) { //@phpstan-ignore-line as still working
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

            // If procuct quantity zero: set quantity in cart zero, set SOLDOUT, message
            else {
                $objItem->quantity = 0;
                $objItem->save();

                $this->inventory_status = $this->SOLDOUT;
                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id); // @phpstan-ignore-line as still working

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
