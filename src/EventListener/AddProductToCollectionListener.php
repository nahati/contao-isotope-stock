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

namespace Nahati\ContaoIsotopeStockBundle\EventListener;

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
    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
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
     * Manage Stock for a given product and a given quantity bought.
     *
     * @param Product $objProduct
     * @param int     $qtyInCart   // quantity of product already in cart
     * @param int     $intQuantity // requested quantity to be added to cart
     * @param bool    $reserved    // returns true if product reserved
     *
     * @return int // returns quantity to be added to cart
     */
    private function manageStockAndCheckReserved($objProduct, $qtyInCart, $intQuantity, &$reserved = false)
    {
        switch ($objProduct->quantity ?? null) {
            case null:
            case '':
                return $intQuantity; // return unchanged requested quantity

            default: // case 0,1,2,..

                $qtyAddToCart = $objProduct->quantity - $qtyInCart; //  max quantity that could be added to cart
                $qtyAddToCart = $qtyAddToCart < 0 ? 0 : $qtyAddToCart; // prevent being negative

                // if max quantity that could be added to cart <= requested quantity: set RESERVED
                if ($qtyAddToCart <= $intQuantity) {
                    Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->RESERVED, $objProduct->id);

                    // if reduced requested quantity, give back true, warning message
                    if ($qtyAddToCart < $intQuantity) {
                        $reserved = true;

                        Message::addError(sprintf(
                            $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                            $objProduct->getName(),
                            $objProduct->quantity
                        ));
                    } else {
                        $reserved = false;
                    }

                    return $qtyAddToCart; // return unchanged or reduced requested quantity
                } else {
                    return $intQuantity;
                } // return unchanged requested quantity
        }
    }

    /**
     * Checks if the requested quantity exceeds stock when adding product to cart.
     * Reduces requested quantity if neccessary; set inventory_status to RESERVED if no quantity left.
     *
     * @param Product                  $objProduct    // Product to be added to cart
     * @param mixed                    $intQuantity   // quantity requested for cart
     * @param IsotopeProductCollection $objCollection // ProductCollection in cart
     *
     * @return mixed // returns false (product not available or soldout) or quantity to be added to cart
     */
    public function __invoke($objProduct, $intQuantity, $objCollection)
    {
        if (!$objProduct) {
            return false;
        }

        // inventory_status is not in use
        if (!$objProduct->inventory_status) {
            // quantity activated
            if (null !== $objProduct->quantity) {
                throw new \InvalidArgumentException(sprintf($GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'], $objProduct->getName()));
            }

            return $intQuantity; // return unchanged requested quantity
        }

        // inventory_status is not AVAILABLE
        if ($objProduct->inventory_status !== $this->AVAILABLE) {
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['productNotAvailable'],
                $objProduct->getName()
            ));

            return false;
        }

        // Return without stock-management if not limited edition
        if (!($objProduct->quantity >= '0')) {
            return $intQuantity; // return unchanged requested quantity
        }

        // If quantity is zero: Set SOLDOUT; message; return false
        if ('0' === $objProduct->quantity) {
            Database::getInstance()->prepare('UPDATE ' . Product::getTable() . ' SET inventory_status = ?  WHERE id = ?')->execute($this->SOLDOUT, $objProduct->id);

            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
                $objProduct->getName()
            ));

            return false;
        }

        // Fetch item for product in cart
        $item = $objCollection->getItemForProduct($objProduct) ?? null;

        // calculate quantity that can be added to cart ($qtyAddToCart)
        $qtyInCart = $item?->quantity ?? 0; // quantity already in cart

        // single product (not having any variants)
        if (!$objProduct->isVariant()) {
            return $this->manageStockAndCheckReserved($objProduct, $qtyInCart, $intQuantity);
        }

        // product is a variant
        else {
            switch ($objProduct->quantity ?? null) {
                case null:
                case '':
                    $objParentProduct = Product::findByPk($objProduct->pid);
                    $reserved = false;
                    $returnParent = $this->manageStockAndCheckReserved($objParentProduct, $qtyInCart, $intQuantity, $reserved);

                    if ($reserved) {
                        $this->setVariantsReserved($objParentProduct);
                    }

                    return $returnParent;

                default: // case 0,1,2,..
                    $returnVariant = $this->manageStockAndCheckReserved($objProduct, $qtyInCart, $intQuantity);

                    $objParentProduct = Product::findByPk($objProduct->pid);
                    $reserved = false;
                    $returnParent = $this->manageStockAndCheckReserved($objParentProduct, $qtyInCart, $intQuantity, $reserved);

                    if ($reserved) {
                        $this->setVariantsReserved($objParentProduct);
                    }

                    return min($returnVariant, $returnParent);
            }
        }
    }
}
