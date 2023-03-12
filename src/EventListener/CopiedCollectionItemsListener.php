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
            $objItem = null;
            $objItem = $objTarget->getItemById($itemId); // Item in cart

            $objProduct = null;
            $objProduct = $objItem->getProduct(); // Corresp. product

            if ('' === $objProduct->quantity || null === $objProduct->quantity) { // @phpstan-ignore-line as still working
                continue; // next in loop if no quantity has been set for the product
            }

            if ($objProduct->quantity > 0) { // Product quantity nonzero
                if ($objItem->quantity > $objProduct->quantity) {
                    // Prevents setting the quantity in cart higher than given in product-quantity (available quantity).
                    $objItem->quantity = $objProduct->quantity;
                    $objItem->save();

                    Message::addError(sprintf(
                        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                        $objProduct->getName(),
                        $objProduct->quantity
                    ));

                    // Also sets inventory_status to "reserved".
                    $this->inventory_status = $this->RESERVED;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                } elseif ($objItem->quantity === $objProduct->quantity) {
                    // Sets inventory_status to "reserved" if quantity in cart is equal to given in product-quantity (available quantity).
                    $this->inventory_status = $this->RESERVED;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                } else { // ($objItem->quantity < $objProduct->quantity)
                    // Sets inventory_status to "available" if quantity in cart is less than given in product-quantity (available quantity).

                    $this->inventory_status = $this->AVAILABLE;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->getId());
                }
            } else { // procuct quantity zero
                $objItem->quantity = 0; // set quantity in cart to zero
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
