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

namespace Nahati\ContaoIsotopeStockBundle\Helper;

use Contao\CoreBundle\Framework\ContaoFramework;
use Contao\Database;
use Isotope\Message;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;
use PhpParser\Node\Expr\BinaryOp\BooleanOr;

/**
 * Reuseable small services for stockmanagement.
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 */
class Helper
{
    private ContaoFramework $framework;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * @param string $message
     * @param string $name of the product
     * @param int    $quantity of the product
     *
     * @return void
     */
    public function issueErrorMessage($message, $name, $quantity = 0): void
    {
        // Get an adapter for the Message class
        $messageAdapter = $this->framework->getAdapter(Message::class);

        if (0 === $quantity) {
            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR'][$message],
                $name
            ));
        } else {
            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR'][$message],
                $name,
                $quantity
            ));
        }
    }


    /**
     * @param string   $inventory_status, set empty if not to be updated
     * @param string   $quantity, leave away if not to be updated
     * @param Standard $objProduct
     *
     * @return Boolean // update done
     */
    public function updateInventory($objProduct, $inventory_status = '', $quantity = '')
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

            if ('' !== $quantity && '' !== $inventory_status) {

                // update quantity and inventory_status
                $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=?, inventory_status=? WHERE id=?')->execute($quantity, $inventory_status, $objProduct->id);
            } elseif ('' !== $inventory_status) {

                // update inventory_status
                $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute($inventory_status, $objProduct->id);
            } elseif ('' !== $quantity) {

                // update quantity
                $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantity, $objProduct->id);
            }
            return true;
            //
        } else {

            // changes -> notify the user
            $this->issueErrorMessage('productHasChanged', $objProduct->getName() ?: $standardAdapter->findPublishedByPk($objProduct->pid)->getName());

            return false;
        }
    }


    /**
     * Set parent product and all available child products RESERVED.
     */
    public function setParentAndChildProductsReserved(Standard $objParentProduct): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Get all children of the parent product (variants)
        $objVariants = $standardAdapter->findPublishedBy('pid', $objParentProduct->id);

        // Set parent product RESERVED
        $this->updateInventory($objParentProduct, $this->RESERVED);

        // Set all AVAILABLE variants RESERVED
        foreach ($objVariants as $variant) {
            if ($variant->inventory_status === $this->AVAILABLE) {
                $this->updateInventory($variant, $this->RESERVED);
            }
        }
    }

    /**
     * Set parent product and all reserved siblings products AVAILABLE.
     */
    public function setParentAndSiblingsProductsAvailable(Standard $objParentProduct, int $id): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Get all children of the parent product (variants) except the product with the given id
        $objVariants = $standardAdapter->findPublishedBy('pid', $objParentProduct->id, ['exclude' => $id]);

        // Set parent product AVAILABLE
        $this->updateInventory($objParentProduct, $this->AVAILABLE);

        // Set all RESERVED variants AVAILABLE
        foreach ($objVariants as $variant) {
            if ($variant->inventory_status === $this->RESERVED) {
                $this->updateInventory($variant, $this->AVAILABLE);
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

            // quantity activated
            if (isset($objProduct->quantity)) {

                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
            }

            return false;
        }
        // inventory_status activated 
        else {

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
        // Quantity zero
        if ('0' === $objProduct->quantity) {
            $this->updateInventory($objProduct, $this->SOLDOUT);

            $this->issueErrorMessage('productOutOfStock', $objProduct->getName());

            return true;
        }

        // InventoryStatus SOLDOUT
        if ($this->SOLDOUT === $objProduct->inventory_status) {

            // update quantity to zero
            $this->updateInventory($objProduct, '', '0');

            $this->issueErrorMessage('productOutOfStock', $objProduct->getName());

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
     * @param int      $anzSiblingsInCart // number of siblings in Cart // passed by reference
     *
     * @return int // returns sum of quantitis in Cart for all siblings (not including the productToCheck itself)
     */
    public function sumSiblings($objProductToCheck, $objCart, $pid, &$anzSiblingsInCart)
    {
        $sum = 0;
        $anzSiblingsInCart = 0;

        foreach ($objCart->getItems() as $objItem) {
            /** @var Standard|null $objProduct */
            $objProduct = $objItem->getProduct() ?? null;

            // No product
            if (!$objProduct) {
                continue;
            }

            // Not a siblings (but the productToCheck itself)
            if ($objProduct->id === $objProductToCheck->id) {
                continue;
            }

            // not a sibling (no or different parent)
            if ($pid !== $objProduct->pid) {
                continue;
            }

            $sum += $objItem->quantity;
            ++$anzSiblingsInCart;
        }

        return $sum;
    }

    /**
     * Manage Stock for a given product and a given quantity in cart and return the surplus.
     *
     * @param Standard $objProduct
     * @param int      $qtyInCart            // quantity in cart (product retr. all siblings)
     * @param mixed    $setInventoryStatusTo // returns the Value, to which the inventory-status has been set
     *
     * @return int // returns surplus quantity
     */
    public function manageStockAndReturnSurplus($objProduct, $qtyInCart, &$setInventoryStatusTo = null)
    {
        // Unlimited quantity: no stockmanagement, no surplus quantity
        if (null === $objProduct->quantity || '' === $objProduct->quantity) {
            return 0; // no surplus quantity
        }

        // Quantity in Cart < Product quantity
        if ((int) $qtyInCart < (int) $objProduct->quantity) {
            $this->updateInventory($objProduct, $this->AVAILABLE);

            $setInventoryStatusTo = $this->AVAILABLE;

            return 0; // no surplus quantity
        }

        // Quantity in Cart == Product quantity
        if ((int) $qtyInCart === (int) $objProduct->quantity) {
            $this->updateInventory($objProduct, $this->RESERVED);

            $setInventoryStatusTo = $this->RESERVED;

            return 0; // no surplus quantity
        }

        // (else) Quantity in Cart > Product quantity

        $this->updateInventory($objProduct, $this->RESERVED);

        $setInventoryStatusTo = $this->RESERVED;

        return (int) $qtyInCart - (int) $objProduct->quantity; // return surplus quantity
    }
}
