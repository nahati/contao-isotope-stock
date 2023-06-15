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
     * @param string   $inventory_status;
     * @param Standard $objProduct;
     */
    // public function updateInventoryStatus($objProduct, $inventory_status): void
    // {
    //     // To save the product we need to get a new instance of the product
    //     // see https://github.com/deployphp/deployer/blob/dea01e1dc919c4354dfdff7595b7eec161edece9/projects/contao413/vendor/contao/core-bundle/src/Resources/contao/models/PageModel.php#L1322

    //     // Get an adapter for the Standard class
    //     $adapter = $this->framework->getAdapter(Standard::class);

    //     // Get a new instance of the product
    //     $objProduct1 = $adapter->findPublishedByPk($objProduct->id);

    //     // Saving the object like so assumes that there have not been any other changes to the given object. But it is not so good a solution, as generally methods should be agnostic.

    //     // We check that the product has not been changed in the meantime by comparing tstamp, quantity and inventory_status
    //     if ($objProduct1->quantity === $objProduct->quantity && $objProduct1->inventory_status === $objProduct->inventory_status && $objProduct1->tstamp === $objProduct->tstamp) {
    //         $objProduct1->inventory_status = $inventory_status;
    //         $objProduct1->save();
    //     } else {
    //         Message::addError(sprintf(
    //             $GLOBALS['TL_LANG']['ERR']['productHasChanged'],
    //             $objProduct->getName() ?: $adapter->findPublishedByPk($objProduct->pid)->getName()
    //         ));
    //     }

    //     // TODO: check this solution with the Contao team!
    // }

    public function updateInventoryStatus($objProduct, $inventory_status): void
    {
        // Get an adapter for the Database class
        $adapter = $this->framework->getAdapter(Database::class);

        // update inventory_status
        $adapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute($inventory_status, $objProduct->id);
    }

    /**
     * @param string   $quantity;
     * @param Standard $objProduct;
     * */
    public function updateQuantity($objProduct, $quantity): void
    {
        // To save the product we need to get a new instance of the product
        // see https://github.com/contao/core/issues/6506

        // Get an adapter for the Standard class
        $adapter = $this->framework->getAdapter(Standard::class);

        // Get a new instance of the product
        $objProduct1 = $adapter->findPublishedByPk($objProduct->id);

        // We check that the product has not been changed in the meantime by comparing tstamp, quantity and inventory_status
        if ($objProduct1->quantity === $objProduct->quantity && $objProduct1->inventory_status === $objProduct->inventory_status && $objProduct1->tstamp === $objProduct->tstamp) {
            $objProduct1->quantity = $quantity;
            $objProduct1->save();
        } else {
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['productHasChanged'],
                $objProduct->getName() ?: $adapter->findPublishedByPk($objProduct->pid)->getName()
            ));
        }

        // TODO: check this solution with the Contao team!
    }

    /**
     * Set all AVAILABLE variants RESERVED.
     */
    public function setAvailableVariantsReserved(Standard $objParentProduct): void
    {
        // Get an adapter for the Standard class
        $adapter = $this->framework->getAdapter(Standard::class);

        // Get all children of the parent product (variants)
        $objVariants = $adapter->findPublishedBy('pid', $objParentProduct->id);

        // dump('objVariants ', $objVariants);
        // die();

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
        return false;
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
            /** @var Standard|null $objProduct */
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
