<?php

// src/EventListener/PostCheckoutListener.php

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
// use Isotope\Model\ProductCollection;
use Isotope\Model\Product;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("postCheckout")
 */
class PostCheckoutListener
{
    private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for selling */
    private string $SOLDOUT = '4'; /* product bought, no remaining quantity */

    /**
     *  Updates the quantity. Marks as SOLDOUT in all bought products with no remaining quantity.
     *
     * @param IsotopeProductCollection $objOrder
     */
    public function __invoke($objOrder): void
    {
        foreach ($objOrder->getItems() as $objItem) {
            $objProduct = $objItem->getProduct(true);

            // quantity activated but inventory_status not activated
            if ((null === $objProduct->inventory_status) && (null !== $objProduct->quantity)) { //@phpstan-ignore-line as still working
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

            if ($objProduct?->quantity > 0) { // @phpstan-ignore-line as still working
                // decrease available quantity by bought quantity
                $objProduct->quantity -= $objItem->quantity;

                // Set SOLDOUT and quantity zero if there is no quantity left
                if ($objProduct->quantity <= 0) {
                    $objProduct->quantity = 0;

                    $this->inventory_status = $this->SOLDOUT;

                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET quantity = ?,  inventory_status = ?  WHERE id = ?')->execute($objProduct->quantity, $this->inventory_status, $objProduct->getId());
                }

                // Set new quantity in any other case
                else {
                    $this->inventory_status = $this->AVAILABLE;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET quantity = ?, inventory_status = ? WHERE id = ?')->execute($objProduct->quantity, $this->inventory_status, $objProduct->getId());
                }
            } else {
                // Product out of stock ($objProduct->quantity = 0):
                $this->inventory_status = $this->SOLDOUT;
                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id); //@phpstan-ignore-line as still working
            }
        } // foreach
    }
}
