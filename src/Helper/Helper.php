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
use Isotope\Model\ProductCollection;

/**
 * Reuseable small services for stockmanagement.
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 */
class Helper
{
    private ContaoFramework $framework;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in collection, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * @param string $message
     * @param string $name     of the product
     * @param int    $quantity of the product
     */
    public function issueErrorMessage($message, $name, $quantity = 0): void
    {
        // Get an adapter for the Message class
        $messageAdapter = $this->framework->getAdapter(Message::class);

        if (0 === $quantity) {
            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR'][$message] ?? 'Non available message for product %s',
                $name
            ));
        } else {
            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR'][$message] ?? 'Non available message for product %s with quantity %s',
                $name,
                $quantity
            ));
        }
    }

    /**
     * @param Standard $objProduct
     * @param string   $inventory_status, set empty if not to be updated
     * @param string   $quantity,         leave away or set empty if not to be updated
     * @param bool     $strict            update even if product has changed in the meantime
     *
     * @return Boolean // update done
     */
    public function updateInventory($objProduct, $inventory_status = '', $quantity = '', $strict = false)
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        $objProductDouble = $standardAdapter->findPublishedByPk($objProduct->id);

        // Get an adapter for the Database class
        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // We check if relevant properties of the product have been changed in the meantime
        if (($objProductDouble->quantity === $objProduct->quantity && $objProductDouble->inventory_status === $objProduct->inventory_status) || $strict) {
            // no changes or strict -> update inventory_status
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
        } else {
            // changes and not strict -> notify the user
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
     * Set parent product and all available child products SOLDOUT.
     */
    public function setParentAndChildProductsSoldout(Standard $objParentProduct): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Get all children of the parent product (variants)
        $objVariants = $standardAdapter->findPublishedBy('pid', $objParentProduct->id);

        // Set parent product SOLDOUT
        $this->updateInventory($objParentProduct, $this->SOLDOUT, '0');

        // Set all variants SOLDOUT
        foreach ($objVariants as $variant) {
            $this->updateInventory($variant, $this->SOLDOUT, '0');
        }
    }

    /**
     * Set parent product and all reserved siblings products AVAILABLE.
     *
     * @param int $id of the product to be excluded
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
            $this->updateInventory($objProduct, '', '0');

            $this->issueErrorMessage('productOutOfStock', $objProduct->getName());

            return true;
        }

        // not SOLDOUT
        return false;
    }

    /**
     * Sum up quantity of all siblings of the product in product collection and give back their number.
     *
     * @param Standard          $objProductToCheck       // product to check
     * @param ProductCollection $objCollection           // unchanged (old) product collection (before Update!)
     * @param int               $pid                     // parent id
     * @param int               $anzSiblingsInCollection // number of siblings in collection // passed by reference
     *
     * @return int // returns sum of quantitis in collection for all siblings (not including the productToCheck itself)
     */
    public function sumSiblings($objProductToCheck, $objCollection, $pid, &$anzSiblingsInCollection = 0)
    {
        $sum = 0;
        $anzSiblingsInCollection = 0;

        foreach ($objCollection->getItems() as $objItem) {
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
            ++$anzSiblingsInCollection;
        }

        return $sum;
    }

    /**
     * Fetch the quantity already in cart for the given product.
     *
     * @param Standard          $objProduct // product
     * @param ProductCollection $objCart    // cart
     *
     * @return int // quantity already in cart
     */
    public function fetchQuantityInCart($objProduct, $objCart)
    {
        $sum = 0;

        foreach ($objCart->getItems() as $objItem) {
            /** @var Standard|null $objProductInCart */
            $objProductInCart = $objItem->getProduct() ?? null;

            // No product
            if (!$objProductInCart) {
                continue;
            }

            // not the same product
            if ($objProductInCart->id !== $objProduct->id) {
                continue;
            }

            $sum += $objItem->quantity;
        }

        return $sum;
    }

    /**
     * Manage Stock for a given product and a given quantity in Collection and return the surplus.
     *
     * @param Standard $objProduct
     * @param int      $qtyInCollection      // quantity in Collection (product retr. all siblings)
     * @param mixed    $setInventoryStatusTo // returns the Value, to which the inventory-status has been set
     *
     * @return int // returns surplus quantity
     */
    public function manageStockAndReturnSurplus($objProduct, $qtyInCollection, &$setInventoryStatusTo = null)
    {
        // Unlimited quantity: no stockmanagement, no surplus quantity
        if (null === $objProduct->quantity || '' === $objProduct->quantity) {
            return 0; // no surplus quantity
        }

        // Product SOLDOUT
        if ($this->isSoldout($objProduct)) {
            $setInventoryStatusTo = $this->SOLDOUT;

            return $qtyInCollection; // return surplus quantity
        }

        // Quantity in Collection < Product quantity
        if ((int) $qtyInCollection < (int) $objProduct->quantity) {
            $this->updateInventory($objProduct, $this->AVAILABLE);

            $setInventoryStatusTo = $this->AVAILABLE;

            return 0; // no surplus quantity
        }

        // Quantity in Collection == Product quantity
        if ((int) $qtyInCollection === (int) $objProduct->quantity) {
            $this->updateInventory($objProduct, $this->RESERVED);

            $setInventoryStatusTo = $this->RESERVED;

            return 0; // no surplus quantity
        }

        // (else) Quantity in Collection > Product quantity

        $this->updateInventory($objProduct, $this->RESERVED);

        $setInventoryStatusTo = $this->RESERVED;

        return (int) $qtyInCollection - (int) $objProduct->quantity; // return surplus quantity
    }

    /**
     * Try: Manage Stock for a given product and a given quantity bought. No Updates!
     *
     * @param Standard $objProduct
     * @param int      $qtyBought  // quantity bought
     * @param bool $overbought // more bought than available ,passed by reference
     * 
     * @return bool // true if soldout
     */
    public function manageStockBeforeCheckout($objProduct, $qtyBought, &$overbought = false)
    {
        // Unlimited quantity: no stockmanagement
        if (null === $objProduct->quantity || '' === $objProduct->quantity) {
            return false; // not soldout
        }

        // Quantity bought < Product quantity

        if ((int) $qtyBought < (int) $objProduct->quantity) {
            // decrease product quantity in strict mode
            // $this->updateInventory($objProduct, '', (string) ((int) $objProduct->quantity - (int) $qtyBought), true);

            return false; // not soldout
        }

        // Quantity in Collection == Product quantity
        if ((int) $qtyBought === (int) $objProduct->quantity) {
            // Decrease product quantity to zero and set inventory_status SOLDOUT in strict mode
            // $this->updateInventory($objProduct, $this->SOLDOUT, '0', true);

            return true; // soldout
        }

        // (else) Quantity in Collection > Product quantity

        // Decrease product quantity to zero and set inventory_status SOLDOUT in strict mode
        // $this->updateInventory($objProduct, $this->SOLDOUT, '0', true);

        $overbought = true;

        return true; // soldout
    }

    /**
     * Manage Stock for a given product and a given quantity bought.
     *
     * @param Standard $objProduct
     * @param int      $qtyBought  // quantity bought
     * @param bool $overbought // more bought than available ,passed by reference
     * 
     * @return bool // true if soldout
     */
    public function manageStockAfterCheckout($objProduct, $qtyBought, &$overbought = false)
    {
        // Unlimited quantity: no stockmanagement
        if (null === $objProduct->quantity || '' === $objProduct->quantity) {
            return false; // not soldout
        }

        // Quantity bought < Product quantity

        if ((int) $qtyBought < (int) $objProduct->quantity) {
            // decrease product quantity in strict mode
            $this->updateInventory($objProduct, '', (string) ((int) $objProduct->quantity - (int) $qtyBought), true);

            return false; // not soldout
        }

        // Quantity in Collection == Product quantity
        if ((int) $qtyBought === (int) $objProduct->quantity) {
            // Decrease product quantity to zero and set inventory_status SOLDOUT in strict mode
            $this->updateInventory($objProduct, $this->SOLDOUT, '0', true);

            return true; // soldout
        }

        // (else) Quantity in Collection > Product quantity

        // Decrease product quantity to zero and set inventory_status SOLDOUT in strict mode
        $this->updateInventory($objProduct, $this->SOLDOUT, '0', true);

        $overbought = true;

        return true; // soldout
    }

    /**
     *  Walk through the list of soldout parent product ids and set all child products to SOLDOUT.
     *
     * @param array<int> $soldoutParentProductIds // array of parent product ids, which are soldout
     */
    public function setChildProductsSoldout($soldoutParentProductIds): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Fetch all products given by the list of soldout parent ids into an array
        /** @var array<Standard> $objSoldoutParentProducts */
        $objSoldoutParentProducts = $standardAdapter->findMultipleByIds($soldoutParentProductIds);

        // Loop over all soldout parent products
        foreach ($objSoldoutParentProducts as $objSoldoutParentProduct) {
            // Fetch all child products
            $objChildProducts = $standardAdapter->findBy('pid', $objSoldoutParentProduct->id);

            // Loop over all child products
            foreach ($objChildProducts as $objChildProduct) {
                // Set SOLDOUT
                $this->updateInventory($objChildProduct, $this->SOLDOUT, '0');
            }
        }
    }

    /**
     *  Handle overbought situation
     *  Issue an error message 
     *  Send notification mail to admin
     * 
     * @param array<int,string> $overboughtProducts // array of product ids, which are overbought
     * 
     */
    public function handleOverbought($overboughtProducts): void
    {
        foreach ($overboughtProducts as $overboughtProduct) {
            $this->issueErrorMessage('overbought', $overboughtProduct['name'], $overboughtProduct['id']);

            $this->sendNotificationMail('overbought', $overboughtProduct['name'], $overboughtProduct['id']);
        }
    }

    /**
     *  sendNotificationMail
     * 
     * @param string $subject // subject of the mail
     * @param string $text // text of the mail
     * 
     */
    public function sendNotificationMail($subject, $name, $id): void
    {
        // TODO: implement!
        dump('sendNotificationMail');
        dump($subject);
        dump($name);
        dump($id);
        dump('---');

        // $objEmail = new Email();

        // $objEmail->from = $GLOBALS['TL_ADMIN_EMAIL'];
        // $objEmail->subject = $subject;
        // $objEmail->text = $text;

        // $objEmail->sendTo($GLOBALS['TL_ADMIN_EMAIL']);
    }
}
