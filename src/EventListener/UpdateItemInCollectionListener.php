<?php

// src/EventListener/UpdateItemInCollectionListener.php

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
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("updateItemInCollection")
 */
class UpdateItemInCollectionListener
{
    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    /**
     * sum up quantity of all siblings in cart.
     *
     * @param Cart $objCart
     * @param int  $pid     // parent id
     *
     * @return int // returns sum
     */
    private function sumSiblings($objCart, $pid)
    {
        $sum = 0;

        foreach ($objCart->getItems() as $objItem) {
            /** @var Product|null $objProduct */
            $objProduct = $objItem->getProduct() ?? null;

            if (!$objProduct) {
                continue;
            }

            if ($pid !== $objProduct->pid) {
                continue;
            } // not a sibling

            $sum += $objItem->quantity;
        }

        return $sum;
    }

    /**
     * Set all variants RESERVED.
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
     * @param int     $qtyInCart  // quantity in cart (product retr. all siblings)
     * @param bool    $reserved   // returns true if product reserved
     *
     * @return int // returns surplus quantity
     */
    private function manageStock($objProduct, $qtyInCart, &$reserved = false)
    {
        switch ($objProduct->quantity ?? null) {
            case null:
            case '':
                return 0; // no stockmanagement, no surplus quantity

            default: // case 0,1,2,..
                // if product quantity <= quantity in cart: set RESERVED unless SOLDOUT
                if ((int) $objProduct->quantity <= $qtyInCart) {
                    if ($objProduct->inventory_status !== $this->SOLDOUT) {
                        Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->RESERVED, $objProduct->id);

                        $reserved = true;
                    }

                    // if reduced quantity, warning message
                    if ((int) $objProduct->quantity < $qtyInCart) {
                        Message::addError(sprintf(
                            $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                            $objProduct->getName(),
                            $objProduct->quantity
                        ));
                    }

                    return $qtyInCart - (int) $objProduct->quantity; // surplus quantity
                }
                // More than sufficient quantity: set AVAILABLE unless SOLDOUT
                else {
                    if ($objProduct->inventory_status !== $this->SOLDOUT) {
                        Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->AVAILABLE, $objProduct->id);
                    }

                    return 0; // no surplus quantity
                }
        }
    }

    /**
     * Prevents setting the quantity in cart higher than given in product-quantity.
     * Also sets inventory_status.
     *
     * @param ProductCollectionItem $objItem // item in cart
     * @param array<mixed>          $arrSet  // properties of item in cart
     * @param Cart                  $objCart // cart
     *
     * @return mixed // new arrSet (changed or unchanged quantity)
     */
    public function __invoke($objItem, $arrSet, $objCart)
    {
        /** @var Product|null $objProduct */
        $objProduct = $objItem->getProduct(true) ?? null;

        if (!$objProduct) {
            return false;
        }

        // inventory_status is not in use
        if (!$objProduct->inventory_status) {
            // quantity activated: configure ProductType correctly!
            if (null !== $objProduct->quantity) {
                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
            }

            return $arrSet; // return unchanged
        }

        // No limited edition: return without stock-management
        if (!($objProduct->quantity >= '0')) {
            return $arrSet; // return unchanged
        }

        if (!(\array_key_exists('quantity', $arrSet) && $arrSet['quantity'])) {
            return false;
        }

        // Quantity zero: Set SOLDOUT; message; set quantity in cart to zero
        if ('0' === $objProduct->quantity) {
            Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->SOLDOUT, $objProduct->id);

            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            $arrSet['quantity'] = 0;

            return $arrSet;
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            $arrSet['quantity'] -= $this->manageStock($objProduct, $arrSet['quantity']); // decrease by surplus quantity

            return $arrSet;
        }

        // Variant product
        else {
            // Manage stock for variant product
            $surplusVariant = $this->manageStock($objProduct, $arrSet['quantity']);

            // Manage stock for parent product with sum of all siblings
            $objParentProduct = Product::findByPk($objProduct->pid);
            $reserved = false;
            $surplusParent = $this->manageStock($objParentProduct, $this->sumSiblings($objCart, $objProduct->pid), $reserved);

            if ($reserved) {
                $this->setVariantsReserved($objParentProduct);
            }

            $arrSet['quantity'] -= max($surplusVariant, $surplusParent); // decrease by max surplus quantity
            $arrSet['quantity'] = $arrSet['quantity'] > 1 ?: 1; // min 1 to prevent deletion from cart

            return $arrSet;
        }
    }
}
