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
    // private string $inventory_status;
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    /**
     * Set RESERVED with all variants.
     *
     * @param Product $objParentProduct
     */
    private function setVariantsReserved($objParentProduct): void
    {
        /** @var IsotopeProductCollection|null $objVariants */
        $objVariants = Database::getInstance()->prepare('SELECT * FROM ' . Product::getTable() . ' WHERE pid = ?')->execute($objParentProduct->getId());

        /** @var Product|null $objVariant */
        foreach ($objVariants->getItems(true) as $objVariant) {
            Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET  inventory_status = ?  WHERE id = ?')->execute($this->RESERVED, $objVariant->id);
        }
    }

    /**
     * Manage Stock for a given product and a given quantity in cart.
     *
     * @param Product $objProduct
     * @param int     $qtyInCart  // quantity of product in cart
     * @param bool    $reserved   // returns true if product reserved
     *
     * @return int // returns quantity to be held in cart (unchanged or decreased)
     */
    private function manageStockAndCheckReserved($objProduct, $qtyInCart, &$reserved = false)
    {
        switch ($objProduct->quantity ?? null) {
            case null:
            case '':
                return $qtyInCart; // return unchanged quantity

            default: // case 0,1,2,..

                // if product quantity <= quantity in cart: set RESERVED
                if ($objProduct->quantity <= $qtyInCart) {
                    Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->RESERVED, $objProduct->id);

                    // if reduced quantity, give back true, warning message
                    if ($objProduct->quantity < $qtyInCart) {
                        $reserved = true;

                        Message::addError(sprintf(
                            $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                            $objProduct->getName(),
                            $objProduct->quantity
                        ));
                    } else {
                        $reserved = false;
                    }

                    return $objProduct->quantity; // return product quantity
                } else {
                    return $qtyInCart;
                } // return unchanged quantity
        }
    }

    /**
     * Handles the quantity in cart. Also sets inventory_status.
     *
     * @param IsotopeProductCollection $objSource old cart
     * @param ProductCollection        $objTarget new cart
     * @param array<int>               $arrIds    oldItem->id / newItem->id
     */
    public function __invoke($objSource, $objTarget, $arrIds): void
    {
        // Loop over all newItem ids
        foreach ($arrIds as $key => $itemId) {
            if ($key); // To prevent ECS from this "error": Unused variable $key

            $objItem = $objTarget->getItemById($itemId) ?? null; // Item in cart

            /** @var Product|null $objProduct */
            $objProduct = $objItem?->getProduct() ?? null; // Corresp. product

            if (!$objProduct) {
                continue;
            }

            // inventory_status is not in use (in theory: FALSE, not defined, NULL, '0' or '')
            if (!$objProduct->inventory_status) {
                // quantity activated
                if (null !== $objProduct->quantity) {
                    throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName())); // todo: fix the configuration of producttype
                }

                continue; // no stock-management
            }

            // Return without stock-management if not limited edition
            if (!($objProduct->quantity >= '0')) {
                continue; // no stock-management
            }

            // If quantity is zero: set SOLDOUT, message, set quantity in cart zero
            if ('0' === $objProduct->quantity) {
                Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->SOLDOUT, $objProduct->id);

                Message::addError(sprintf(
                    $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                    $objProduct->getName()
                ));

                $objItem->quantity = 0;
                $objItem->save();

                continue;
            }

            // (else) quantity > 0

            // single product (not having any variants)
            if (!$objProduct->isVariant()) {
                $$objItem->quantity = $this->manageStockAndCheckReserved($objProduct, $objItem->quantity);
                $objItem->save();

                continue;
            }

            // (else) product is a variant
            switch ($objProduct->quantity ?? null) {
                case null:
                case '':

                    $objParentProduct = Product::findByPk($objProduct->pid);
                    $reserved = false;
                    /** @var int $qtyForCartParent */ // new quantity in cart after checking the parents quantity
                    $qtyForCartParent = $this->manageStockAndCheckReserved($objParentProduct, $objItem->quantity, $reserved);

                    if ($reserved) {
                        $this->setVariantsReserved($objParentProduct);
                    }

                    //Set new quantity in cart
                    $objItem->quantity = $qtyForCartParent;
                    $objItem->save();

                    // no break
                default: // case 0,1,2,..

                    /** @var int $qtyForCartVariant */ // new quantity in cart after checking the variants quantity
                    $qtyForCartVariant = $this->manageStockAndCheckReserved($objProduct, $objItem->quantity);

                    $objParentProduct = Product::findByPk($objProduct->pid);
                    $reserved = false;
                    /** @var int $qtyForCartParent */ // allowed quantity in cart corresponding to the parents quantity
                    $qtyForCartParent = $this->manageStockAndCheckReserved($objParentProduct, $objItem->quantity, $reserved);

                    if ($reserved) {
                        $this->setVariantsReserved($objParentProduct);
                    }

                    //Set new quantity for cart
                    $objItem->quantity = min($qtyForCartVariant, $qtyForCartVariant);
                    $objItem->save();
            }
        } // foreach
    }
}
