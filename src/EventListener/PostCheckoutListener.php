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
use Isotope\Model\Product;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("postCheckout")
 */
class PostCheckoutListener
{
    private string $SOLDOUT = '4'; /* product bought, no remaining quantity */

    /**
     * Set SOLDOUT and set quantity zero (if applicable) with all variants.
     *
     * @param Product $objParentProduct
     */
    private function setVariantsSoldout(Product $objParentProduct): void
    {
        /** @var IsotopeProductCollection|null $objVariants */
        $objVariants = Database::getInstance()->prepare('SELECT * FROM ' . Product::getTable() . ' WHERE pid = ?')->execute($objParentProduct->getId());

        /** @var Product|null $objVariant */
        foreach ($objVariants->getItems(true) as $objVariant) {
            // If quantity NOT NULL AND NOT empty AND not yet ZERO
            if ($objVariant->quantity) {
                Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET quantity = ?,  inventory_status = ?  WHERE id = ?')->execute('0', $this->SOLDOUT, $objVariant->id);
            }

            // Quantity IS NULL OR empty OR already ZERO
            else {
                Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET  inventory_status = ?  WHERE id = ?')->execute($this->SOLDOUT, $objVariant->id);
            }
        }
    }

    /**
     * Manage Stock for a given product and a given quantity bought
     * Return true, if Soldout.
     *
     * @param Product $objProduct
     * @param int     $quantityBought
     *
     * @return bool // returns true if product soldout
     */
    private function manageStockAndCheckSoldout(Product $objProduct, int $quantityBought)
    {
        switch ($objProduct->quantity ?? null) {
            case null:
            case '':
                return false; // no stock-management

            default: // case 0,1,2,..
                // decrease available quantity by bought quantity
                $objProduct->quantity -= $quantityBought;

                // Quantity left
                if ($objProduct->quantity > 0) {
                    Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET quantity = ? WHERE id = ?')->execute($objProduct->quantity, $objProduct->getId());

                    return false;
                }
                // Soldout
                $objProduct->quantity = 0;
                Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET quantity = ?, inventory_status = ? WHERE id = ?')->execute('0', $this->SOLDOUT, $objProduct->getId());

                return true;
        }
    }

    /**
     *  Updates the quantity. Marks as SOLDOUT in all bought products/variants with no remaining quantity.
     *
     * @param IsotopeProductCollection $objOrder // ProductCollection in order
     */
    public function __invoke(IsotopeProductCollection $objOrder): void
    {
        foreach ($objOrder->getItems() as $objItem) {
            /** @var Product|null $objProduct */
            $objProduct = $objItem->getProduct(true) ?? null;

            if (!$objProduct) {
                continue;
            }

            // inventory_status is not in use (in theory: FALSE, NULL, '0' or '')
            if (!$objProduct->inventory_status) {
                // quantity activated
                if (null !== $objProduct->quantity) {
                    throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
                }

                continue; // no stock-management
            }

            // single product (not having any variants)
            if (!$objProduct->isVariant()) {
                $this->manageStockAndCheckSoldout($objProduct, $objItem->quantity);
            }

            // product is a variant
            else {
                switch ($objProduct->quantity ?? null) {
                    case null:
                    case '':
                        $objParentProduct = Product::findByPk($objProduct->pid);

                        if ($this->manageStockAndCheckSoldout($objParentProduct, $objItem->quantity)) {
                            $this->setVariantsSoldout($objParentProduct); // if soldout
                        }
                        break;

                    default: // case 0,1,2,..
                        $this->manageStockAndCheckSoldout($objProduct, $objItem->quantity);

                        $objParentProduct = Product::findByPk($objProduct->pid);

                        if ($this->manageStockAndCheckSoldout($objParentProduct, $objItem->quantity)) {
                            $this->setVariantsSoldout($objParentProduct); // if soldout
                        }
                }
            }
        } // foreach
    }
}
