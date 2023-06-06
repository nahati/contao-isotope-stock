<?php

// src/Helper/Helper.php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace nahati\ContaoIsotopeStockBundle\Helper;

use Isotope\Message;
use Isotope\Model\Product;
use Isotope\Model\ProductCollection\Cart;

/**
 * Reuseable coding for stockmanagement.
 */
class Helper
{
    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    /**
     * @param Product $objProduct
     * @param string  $inventory_status
     */
    public function updateInventoryStatus($objProduct, $inventory_status): void
    {
        // Update of product inventory status
        $objProduct->inventory_status = $inventory_status;
        $objProduct->save();

        //Todo: check if update was successful?
    }

    /**
     * @param Product $objProduct
     * @param string  $quantity
     */
    private function updateQuantity($objProduct, $quantity): void
    {
        // Update of product quantity
        $objProduct->quantity = $quantity;
        $objProduct->save();

        //Todo: check if update was successful?
    }

    /**
     * Check configuration of stockmanagement.
     *
     * @param Product $objProduct
     *
     * @throws \InvalidArgumentException // if configuration is falsy
     *
     * @return bool // true if stockmanagement is enabled
     */
    public function checkStockmanagement($objProduct)
    {
        // inventory_status not activated
        if (!isset($objProduct->inventory_status)) {
            // quantity activated: configure ProductType correctly!
            if (isset($objProduct->quantity)) {
                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
            }

            return false;
        } else {
            return true;
        }
    }

    /**
     * Handle if product is SOLDOUT.
     *
     * @param Product $objProduct
     *
     * @return bool // true if product is SOLDOUT
     */
    public function isSoldout($objProduct)
    {
        // Quantity zero
        if ('0' === $objProduct->quantity) {
            $this->updateInventoryStatus($objProduct, $this->SOLDOUT);
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return true;
        }

        // InventoryStatus SOLDOUT
        if ($this->SOLDOUT === $objProduct->inventory_status) {
            $this->updateQuantity($objProduct, '0');
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return true;
        }

        // not SOLDOUT
        else {
            return false;
        }
    }

    /**
     * Sum up quantity of all siblings in cart and give back their number.
     *
     * @param Cart $objCart
     * @param int  $pid               // parent id
     * @param int  $anzSiblingsInCart // number of siblings in Cart
     *
     * @return int // returns sum
     */
    public function sumSiblings($objCart, $pid, &$anzSiblingsInCart)
    {
        $sum = 0;
        $anzSiblingsInCart = 0;

        foreach ($objCart->getItems() as $objItem) {
            /** @var Product|null $objProduct */
            $objProduct = $objItem->getProduct() ?? null;

            if (!$objProduct) {
                continue;
            } // no product

            if ($pid !== $objProduct->pid) {
                continue;
            } // not a sibling

            $sum += $objItem->quantity;
            ++$anzSiblingsInCart;
        }

        return $sum;
    }

    /**
     * Manage Stock for a given product and a given quantity in cart and return the surplus.
     *
     * @param Product $objProduct
     * @param int     $qtyInCart  // quantity in cart (product retr. all siblings)
     * @param bool    $reserved   // returns true if product reserved
     *
     * @return int // returns surplus quantity
     */
    public function manageStockAndReturnSurplus($objProduct, $qtyInCart, &$reserved = false)
    {
        // Unlimited quantity: no stockmanagement, no surplus quantity
        if (null === $objProduct->quantity || '' === $objProduct->quantity) {
            return 0;
        }

        // Quantity in Cart < Product quantity
        if ((int) $qtyInCart < (int) $objProduct->quantity) {
            $this->updateInventoryStatus($objProduct, $this->AVAILABLE);
            $reserved = false;

            return 0; // no surplus quantity
        }

        // Quantity in Cart == Product quantity
        if ((int) $qtyInCart === (int) $objProduct->quantity) {
            $this->updateInventoryStatus($objProduct, $this->RESERVED);
            $reserved = true;

            return 0; // no surplus quantity
        }

        // (else) Quantity in Cart > Product quantity

        $this->updateInventoryStatus($objProduct, $this->RESERVED);
        $reserved = true;
        Message::addError(sprintf(
            $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
            $objProduct->getName(),
            $objProduct->quantity
        ));

        return (int) $qtyInCart - (int) $objProduct->quantity; // return surplus quantity
    }
}
