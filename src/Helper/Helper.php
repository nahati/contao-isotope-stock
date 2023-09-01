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
use Isotope\Model\OrderStatus;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Order;

/**
 * Reuseable small services for stockmanagement.
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 */
class Helper
{
    private ContaoFramework $framework;

    // inventory_status
    public const AVAILABLE = '2'; /* product available for sale */
    public const RESERVED = '3'; /* product in collection, no quantity left */
    public const SOLDOUT = '4'; /* product sold, no quantity left */

    public const OVERBOUGHT = 'Overbought'; // status for overbought orders

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * @param string $message
     * @param string $productName (optional)
     * @param int    $quantity    (optional)
     */
    public function issueErrorMessage($message, $productName = '', $quantity = 0): string
    {
        // Get an adapter for the Message class
        $messageAdapter = $this->framework->getAdapter(Message::class);

        // Get the error message
        $errorMessage = sprintf($GLOBALS['TL_LANG']['ERR'][$message], $productName, $quantity);

        // Add the error
        $messageAdapter->addError($errorMessage);

        return $errorMessage;
    }

    /**
     * Update quantity / inventory_status of a product.
     * If strict is set to true, the update is done even if the product has changed in the meantime.
     *
     * @param Standard $objProduct
     * @param string   $inventory_status, set empty if not to be updated
     * @param string   $quantity,         omit or set empty if not to be updated
     * @param bool     $strict            update even if product has changed in the meantime
     *
     * @return Boolean // update done
     */
    public function updateInventory($objProduct, $inventory_status = '', $quantity = '', $strict = false)
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        $objProductDouble = $standardAdapter->findPublishedByPk($objProduct->id);

        // We check if relevant properties of the product have been changed in the meantime
        if (($objProductDouble->quantity === $objProduct->quantity && $objProductDouble->inventory_status === $objProduct->inventory_status) || $strict) {
            // no changes or strict -> update inventory

            // Get an adapter for the Database class
            $databaseAdapter = $this->framework->getAdapter(Database::class);

            // Fetch the real database state of quantity and inventory_status
            $result = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($objProduct->id);

            $updateQuantity = (null !== $result->quantity && '' !== $result->quantity && '' !== $quantity);

            $updateInventoryStatus = (null !== $result->inventory_status && '' !== $result->inventory_status && '' !== $inventory_status);

            // If we have to update any of the two fields, we have to lock the row for update
            if ($updateQuantity || $updateInventoryStatus) {
                $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=? FOR UPDATE')->execute($objProduct->id);
            }

            if ($updateQuantity && $updateInventoryStatus) {
                $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=?, inventory_status=? WHERE id=?')->execute($quantity, $inventory_status, $objProduct->id);
            } elseif ($updateInventoryStatus) {
                $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute($inventory_status, $objProduct->id);
            } elseif ($updateQuantity) {
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
    public function setParentAndChildProductsReserved(Standard $parentProduct): void
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Get all children of the parent product (variants)
        $childProducts = $standardAdapter->findPublishedBy('pid', $parentProduct->id);

        // Set parent product RESERVED
        $this->updateInventory($parentProduct, self::RESERVED);

        // Get an adapter for the Database class
        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // Set all AVAILABLE variants RESERVED
        foreach ($childProducts as $childProduct) {
            // Fetch the real database state of inventory_status
            $result = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($childProduct->id);

            if (self::AVAILABLE === $result->inventory_status) {
                $this->updateInventory($childProduct, self::RESERVED);
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
        $this->updateInventory($objParentProduct, self::SOLDOUT, '0');

        // Set all variants SOLDOUT
        foreach ($objVariants as $variant) {
            $this->updateInventory($variant, self::SOLDOUT, '0');
        }
    }

    // We do not use this method, as it might result in wrong constellations!
    // /**
    //  * Set parent product and all reserved siblings products AVAILABLE.
    //  *
    //  * @param int $objProduct of the product to be excluded
    //  */
    // public function setParentAndSiblingsProductsAvailable(Standard $objParentProduct, int $id): void
    // {
    //     // Get an adapter for the Standard class
    //     $standardAdapter = $this->framework->getAdapter(Standard::class);

    //     // Get all children of the parent product (variants) except the product with the given id
    //     $objVariants = $standardAdapter->findPublishedBy('pid', $objParentProduct->id, ['exclude' => $id]);

    //     // TODO: This does not exclude $id; fix that!

    //     // Set parent product AVAILABLE
    //     $this->updateInventory($objParentProduct, self::AVAILABLE);

    //     // Set all RESERVED variants AVAILABLE

    //     // TODO: This is wrong! The sibling should be kept reserved in case its limit is reached
    //     foreach ($objVariants as $variant) {
    //         if (self::RESERVED === $variant->inventory_status) {
    //             $this->updateInventory($variant, self::AVAILABLE);
    //         }
    //     }
    // }

    /**
     * Check configuration of stockmanagement type A.
     *
     * @param Standard $objProduct
     *
     * @throws \InvalidArgumentException // if configuration is falsy
     *
     * @return bool // true if stockmanagement is enabled
     */
    public function checkStockmanagementTypeA($objProduct)
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
     * Check configuration of stockmanagement type B.
     *
     * @param Standard $objProduct
     *
     * @throws \InvalidArgumentException // if configuration is falsy
     *
     * @return array <string, bool> ['min' => <bool>, 'max' => <bool>]
     *                              min is true if minQuantityPerOrder is set and > '1'
     *                              max is true if maxQuantityPerOrder is set and > '0'
     */
    public function checkStockmanagementTypeB($objProduct): array
    {
        $min = false;
        $max = false;

        // minQuantityPerOrder activated
        if ((($objProduct->minQuantityPerOrder ?? '') !== '') && $objProduct->minQuantityPerOrder > '1') {
            $min = true;
        }

        // maxQuantityPerOrder activated
        if ((($objProduct->maxQuantityPerOrder ?? '') !== '') && $objProduct->maxQuantityPerOrder > '0') {
            $max = true;
        }

        if ($min && $max && $objProduct->minQuantityPerOrder > $objProduct->maxQuantityPerOrder) {
            throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['minGreaterMax'], $objProduct->getName()));
        }

        return ['min' => $min, 'max' => $max];
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
            $this->updateInventory($objProduct, self::SOLDOUT);
            $this->issueErrorMessage('productOutOfStock', $objProduct->getName());

            return true;
        }

        // InventoryStatus SOLDOUT
        if (self::SOLDOUT === $objProduct->inventory_status) {
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
     * @param Standard               $objProduct // product
     * @param ProductCollection|null $objCart    // cart
     *
     * @return int // quantity already in cart
     */
    public function fetchQuantityInCart($objProduct, $objCart)
    {
        $quantityInCart = 0;

        if (!$objCart) {
            return $quantityInCart;
        }

        foreach ($objCart->getItems() as $objCartItem) {
            /** @var Standard|null $objProductInCart */
            $objProductInCart = $objCartItem->getProduct() ?? null;

            // No product
            if (!$objProductInCart) {
                continue;
            }

            // not the same product
            if ($objProductInCart->id !== $objProduct->id) {
                continue;
            }

            $quantityInCart += $objCartItem->quantity;
        }

        return $quantityInCart;
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
        // Stockmanagement not enabled or not correctly configured
        if (!$this->checkStockmanagementTypeA($objProduct)) {
            return 0; // no surplus quantity
        }

        // Unlimited quantity: no stockmanagement, no surplus quantity
        if (null === $objProduct->quantity || '' === $objProduct->quantity) {
            return 0; // no surplus quantity
        }

        // Product SOLDOUT
        if ($this->isSoldout($objProduct)) {
            $setInventoryStatusTo = self::SOLDOUT;

            return $qtyInCollection; // return surplus quantity
        }

        // Quantity in Collection < Product quantity
        if ((int) $qtyInCollection < (int) $objProduct->quantity) {
            $this->updateInventory($objProduct, self::AVAILABLE);

            $setInventoryStatusTo = self::AVAILABLE;

            return 0; // no surplus quantity
        }

        // Quantity in Collection == Product quantity
        if ((int) $qtyInCollection === (int) $objProduct->quantity) {
            $this->updateInventory($objProduct, self::RESERVED);

            $setInventoryStatusTo = self::RESERVED;

            return 0; // no surplus quantity
        }

        // (else) Quantity in Collection > Product quantity

        $this->updateInventory($objProduct, self::RESERVED);

        $setInventoryStatusTo = self::RESERVED;

        return (int) $qtyInCollection - (int) $objProduct->quantity; // return surplus quantity
    }

    /**
     * Manage Stock Type B for a given product and a given quantity in Collection and return the surPlus and surMinus.
     *
     * @param Standard $objProduct
     * @param int      $qtyInCollection // quantity in Collection (product retr. all siblings)
     *
     * @return array <string, int> ['surMinus' => <int>, 'surPlus' => <int>]
     *                             $surMinus is the quantity that is missing to reach MinQuantityPerOrder (>= 0)
     *               $surplus is the quantity that exceeds MaxQuantityPerOrder (>= 0)*/
    public function manageStockTypeBAndReturnDifferences($objProduct, $qtyInCollection): array
    {
        $return = ['surMinus' => 0, 'surPlus' => 0];

        // minQuantityPerOrder is set
        if ($this->checkStockmanagementTypeB($objProduct)['min']) {
            // return quantity below minQuantityPerOrder if any; otherwise return 0
            $return['surMinus'] = $objProduct->minQuantityPerOrder - $qtyInCollection > 0 ? $objProduct->minQuantityPerOrder - $qtyInCollection : 0;
        }
        // maxQuantityPerOrder is set
        if ($this->checkStockmanagementTypeB($objProduct)['max']) {
            // return quantity above maxQuantityPerOrder if any; otherwise return 0
            $return['surPlus'] = $qtyInCollection - $objProduct->maxQuantityPerOrder > 0 ? $qtyInCollection - $objProduct->maxQuantityPerOrder : 0;
        }

        return $return;
    }

    /**
     * Manage Stock for a given product and a given quantity bought.
     *
     * @param Standard $objProduct
     * @param int      $qtyBought  // quantity bought
     * @param int      $overbought // quantity overbought ,passed by reference
     *
     * @return bool // true if soldout
     */
    public function manageStockAfterCheckout($objProduct, $qtyBought, &$overbought = 0)
    {
        // Unlimited quantity: no stockmanagement

        // Models take quantity from parent
        // if (null === $objProduct->quantity || '' === $objProduct->quantity) {

        // So we use database queries instead of models
        $databaseAdapter = $this->framework->getAdapter(Database::class);
        $result = $databaseAdapter->getInstance()->prepare('SELECT quantity FROM tl_iso_product WHERE id=?')->execute($objProduct->id);

        if (null === $result->quantity || '' === $result->quantity) {
            return false; // not soldout
        }

        // Quantity bought < Product quantity

        if ((int) $qtyBought < (int) $result->quantity) {
            // decrease product quantity in strict mode
            $this->updateInventory($objProduct, '', (string) ((int) $objProduct->quantity - (int) $qtyBought), true);

            return false; // not soldout
        }

        // Quantity in Collection == Product quantity
        if ((int) $qtyBought === (int) $result->quantity) {
            // Decrease product quantity to zero and set inventory_status SOLDOUT in strict mode
            $this->updateInventory($objProduct, self::SOLDOUT, '0', true);

            return true; // soldout
        }

        // (else) Quantity in Collection > Product quantity

        // Decrease product quantity to zero and set inventory_status SOLDOUT in strict mode
        $this->updateInventory($objProduct, self::SOLDOUT, '0', true);

        $overbought = (int) $qtyBought - (int) $result->quantity;

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
                $this->updateInventory($objChildProduct, self::SOLDOUT, '0');
            }
        }
    }

    /**
     * Check if any available child product exists.
     *
     * @param Standard $objParentProductId
     *
     * @return bool
     */
    public function existsAnyAvailableChild($objParentProductId)
    {
        // Get an adapter for the Standard class
        $standardAdapter = $this->framework->getAdapter(Standard::class);

        // Fetch all child products
        $objChildProducts = $standardAdapter->findBy('pid', $objParentProductId);

        // If no child products are found, we can stop here
        if (null === $objChildProducts) {
            return false;
        }

        // Check if at least one child is available
        foreach ($objChildProducts as $objChildProduct) {
            // Refresh the object to make sure we have the latest data
            $objChildProduct->refresh();

            // If one sibling is available, we can stop the loop
            if (self::AVAILABLE === $objChildProduct->inventory_status) {
                return true;
            }
        }

        return false;
    }

    /**
     *  Handle overbought order
     *  Issue an error message
     *  Update order status to overbought.
     *
     * @param int                                                                             $orderId            the order id
     * @param array<array{productId: int, itemId: int, productName: string, overbought: int}> $overboughtProducts array of overbought products
     */
    public function handleOverbought($orderId, $overboughtProducts): void
    {
        // Issue an error message per overbought product
        foreach ($overboughtProducts as $overboughtProduct) {
            $productName = $overboughtProduct['productName'];
            $overboughtQuantity = $overboughtProduct['overbought'];
            $this->issueErrorMessage('overbought', $productName, $overboughtQuantity);
        }

        // Update orderstatus to 'Overbought'
        $this->updateOrderStatus($orderId, self::OVERBOUGHT);
    }

    /**
     * Update orderstatus
     * If the order or the orderstatus is not found, ignore and do nothing.
     *
     * @param int    $orderId     the order id
     * @param string $orderStatus the name of the order status
     */
    public function updateOrderStatus($orderId, $orderStatus): void
    {
        // Fetch the order
        $objOrder = Order::findByPk($orderId);

        // If the order is not found, return
        if (null === $objOrder) {
            return;
        }

        // Fetch the orderstatus
        /** @var OrderStatus|null $objOrderStatus */
        $objOrderStatus = OrderStatus::findOneBy('name', $orderStatus);

        // If the orderstatus is not found, return
        if (null === $objOrderStatus) {
            return;
        }

        // Set the orderstatus
        $objOrder->updateOrderstatus(['order_status' => $objOrderStatus->id]);
    }
}
