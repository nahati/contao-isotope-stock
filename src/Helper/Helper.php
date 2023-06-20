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

use Contao\CoreBundle\Framework\ContaoFramework;
use Contao\Database;
use Isotope\Message;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;

/**
 * Reuseable small services for stockmanagement.
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 */
class Helper
{
    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    public function __construct(private readonly ContaoFramework $framework)
    {
    }

    /**
     * @param string   $inventory_status
     * @param Standard $objProduct
     */
    public function updateInventoryStatus($objProduct, $inventory_status): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        $objProductDouble = $standardAdapter->findPublishedByPk($objProduct->id);

        // Get an adapter for the Database class
        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // We check if relevant properties of the product have been changed in the meantime
        if ($objProductDouble->quantity === $objProduct->quantity && $objProductDouble->inventory_status === $objProduct->inventory_status) {
            // no changes -> update inventory_status
            $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=? FOR UPDATE')->execute($objProduct->id);
            $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute($inventory_status, $objProduct->id);
        } else {
            // Get an adapter for the Message class
            $messageAdapter = $this->framework->getAdapter(Message::class);

            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['productHasChanged'],
                $objProduct->getName() ?: $standardAdapter->findPublishedByPk($objProduct->pid)->getName()
            ));
        }
    }

    /**
     * @param string   $quantity;
     * @param Standard $objProduct;
     * */
    public function updateQuantity($objProduct, $quantity): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        $objProductDouble = $standardAdapter->findPublishedByPk($objProduct->id);

        // Get an adapter for the Database class
        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // We check if relevant properties of the product have been changed in the meantime
        if ($objProductDouble->quantity === $objProduct->quantity && $objProductDouble->inventory_status === $objProduct->inventory_status) {
            // no changes -> update quantity
            $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=? FOR UPDATE')->execute($objProduct->id);
            $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantity, $objProduct->id);
        } else {
            // Get an adapter for the Message class
            $messageAdapter = $this->framework->getAdapter(Message::class);

            // Changes -> error message
            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['productHasChanged'],
                $objProduct->getName() ?: $standardAdapter->findPublishedByPk($objProduct->pid)->getName()
            ));
        }
    }

    /**
     * Set all AVAILABLE variants RESERVED.
     */
    public function setAvailableVariantsReserved(Standard $objParentProduct): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Get all children of the parent product (variants)
        $objVariants = $standardAdapter->findPublishedBy('pid', $objParentProduct->id);

        // Set all AVAILABLE variants RESERVED
        foreach ($objVariants as $variant) {
            if ($variant->inventory_status === $this->AVAILABLE) {
                $this->updateInventoryStatus($variant, $this->RESERVED);
            }
        }
    }

    /**
     * Check configuration of stockmanagement.
     *
     * @param Standard $objProduct
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
     * @param Standard $objProduct
     *
     * @return bool // true if product is SOLDOUT
     */
    public function isSoldout($objProduct)
    {
        // Quantity zeroquantity
        if ('0' === $objProduct->quantity) {
            $this->updateInventoryStatus($objProduct, $this->SOLDOUT);

            // Get an adapter for the Message class
            $messageAdapter = $this->framework->getAdapter(Message::class);

            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return true;
        }

        // InventoryStatus SOLDOUT
        if ($this->SOLDOUT === $objProduct->inventory_status) {
            $this->updateQuantity($objProduct, '0');

            $messageAdapter = $this->framework->getAdapter(Message::class);

            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return true;
        }

        // not SOLDOUT
        return false;
    }

    /**
     * Sum up quantity of all siblings of the product in cart and give back their number.
     *
     * @param Standard $objProductToCheck // product to check
     * @param Cart     $objCart           // unchanged (old) cart (before Update!)
     * @param int      $pid               // parent id
     * @param int      $anzSiblingsInCart // number of siblings in Cart
     *
     * @return int // returns sum of quantitis in Cart for all siblings, not including the productToCheck itself
     */
    public function sumSiblings($objProductToCheck, $objCart, $pid, &$anzSiblingsInCart)
    {
        $sum = 0;
        $anzSiblingsInCart = 0;

        foreach ($objCart->getItems() as $objItem) {
            /** @var Standard|null $objProduct */
            $objProduct = $objItem->getProduct() ?? null;

            if (!$objProduct) {
                continue;
            } // no product

            if ($objProduct->id === $objProductToCheck->id) {
                continue;
            } // only siblings, not the productToCheck itself

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
     * @param Standard $objProduct
     * @param int      $qtyInCart      // quantity in cart (product retr. all siblings)
     * @param bool     $isToBeReserved // returns true if product reserved
     *
     * @return int // returns surplus quantity
     */
    public function manageStockAndReturnSurplus($objProduct, $qtyInCart, &$isToBeReserved = false)
    {
        // Unlimited quantity: no stockmanagement, no surplus quantity
        if (null === $objProduct->quantity || '' === $objProduct->quantity) {
            return 0;
        }

        // Quantity in Cart < Product quantity
        if ((int) $qtyInCart < (int) $objProduct->quantity) {
            $this->updateInventoryStatus($objProduct, $this->AVAILABLE);

            $isToBeReserved = false;

            return 0; // no surplus quantity
        }

        // Quantity in Cart == Product quantity
        if ((int) $qtyInCart === (int) $objProduct->quantity) {
            $this->updateInventoryStatus($objProduct, $this->RESERVED);

            $isToBeReserved = true;

            return 0; // no surplus quantity
        }

        // (else) Quantity in Cart > Product quantity

        $this->updateInventoryStatus($objProduct, $this->RESERVED);

        $isToBeReserved = true;

        return (int) $qtyInCart - (int) $objProduct->quantity; // return surplus quantity
    }
}
