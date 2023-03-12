<?php

// src/EventListener/AddProductToCollectionListener.php

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
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("addProductToCollection")
 */
class AddProductToCollectionListener
{
    private string $inventory_status;
    private string $AVAILABLE = '1'; /* product available for sale */
    private string $RESERVED = '2'; /* product in cart, no quantity left */
    private string $SOLDOUT = '3'; /* product sold, no quantity left */

    /**
     * Checks if the requested quantity exceeds stock when adding product to cart.
     * Reduces requested quantity if neccessary; set inventory_status to 'reserved' if no quantity left.
     *
     * @param Product                  $objProduct    // Product to be added to cart
     * @param mixed                    $intQuantity   // quantity requested for cart
     * @param IsotopeProductCollection $objCollection // ProductCollection in cart
     *
     * @return mixed
     */
    public function __invoke($objProduct, $intQuantity, $objCollection)
    {
        // quantity activated but inventory_status not activated
        if ((null === $objProduct->inventory_status) && (null !== $objProduct->quantity)) {
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'],
                $objProduct->getName()
            ));

            return false;
        }

        // quantity activated but inventory_status is not AVAILABLE
        if ((null !== $objProduct->quantity) && ($objProduct->inventory_status !== $this->AVAILABLE)) {
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['productNotAvailable'],
                $objProduct->getName()
            ));

            return false;
        }

        // Return without stock-management: if quantity not exists or is NULL or empty
        if (!('0' === $objProduct->quantity || $objProduct->quantity > '0' ? true : false)) {
            // exclude case string = '0' which would be evaluated as falsy otherwise
            return $intQuantity; // return unchanged requested quantity
        }

        // If quantity is zero: Set SOLDOUT; message; return false
        if ('0' === $objProduct->quantity) {
            $this->inventory_status = $this->SOLDOUT;
            Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id);

            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return false;
        }

        // If quantity > 0:
        // find product in cart
        $oInCart = null;
        $oInCart = $objCollection->getItemForProduct($objProduct);

        // calculate quantity that can be added to cart ($qtyAddToCart)
        $qtyInCart = $oInCart->quantity ?? 0; // quantity already in cart
        $qtyAddToCart = $objProduct->quantity - $qtyInCart;
        $qtyAddToCart = $qtyAddToCart < 0 ? 0 : $qtyAddToCart; // limit to zero at bottom

        // if quantity to add to cart <= requested quantity: set RESERVED
        if ($qtyAddToCart <= $intQuantity) {
            $this->inventory_status = $this->RESERVED;
            Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id);

            // if reduced requested quantity, warning message
            if ($qtyAddToCart < $intQuantity) {
                Message::addError(sprintf(
                    $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                    $objProduct->getName(),
                    $objProduct->quantity
                ));
            }

            return $qtyAddToCart; // return unchanged or reduced requested quantity
        } // available quantity exceeds requested quantity

        // - else - available quantity exceeds requested quantity
        return $intQuantity; // return unchanged requested quantity
    }
}
