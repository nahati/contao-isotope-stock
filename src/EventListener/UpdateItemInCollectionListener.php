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
use Isotope\Message;
use Isotope\Model\Product;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\ServiceAnnotation\IsotopeHook;
use nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * @IsotopeHook("updateItemInCollection")
 */
class UpdateItemInCollectionListener
{
    /**
     * @var Helper
     */
    private $helper;

    /**
     * Handles changes of quantity in cart.
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
        $objProduct = $objItem->getProduct() ?? null;

        if (!$objProduct) {
            return false;
        }

        // Instatiate an Database object
        $database = Database::getInstance();

        // Instantiate a Helper object
        $helper = new Helper($database);

        // Stockmanagement not or not correctly configured
        if (!$this->helper->checkStockmanagement($objProduct)) {
            return $arrSet; // return unchanged
        }

        if (!(\array_key_exists('quantity', $arrSet) && $arrSet['quantity'])) {
            return false;
        }

        // Product SOLDOUT
        if ($this->helper->isSoldout($objProduct)) {
            $arrSet['quantity'] = 0;

            return $arrSet;
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            $arrSet['quantity'] -= $this->helper->manageStock($objProduct, $arrSet['quantity']); // decrease by surplus quantity

            return $arrSet;
        }

        // (else) Variant product

        // Manage stock for variant product with quantity of this variant
        $surplusVariant = $this->helper->manageStock($objProduct, $arrSet['quantity']);

        // Manage stock for parent product with sum of all siblings quantities
        $objParentProduct = Product::findByPk($objProduct->pid);

        $reserved = false;
        $anzSiblingsInCart = 0;
        $surplusParent = $this->helper->manageStock($objParentProduct, $this->helper->sumSiblings($objCart, $objProduct->pid, $anzSiblingsInCart), $reserved);

        if ($reserved) {
            $this->helper->setVariantsReserved($objParentProduct);
        }

        // Only 1 sibling in cart: reduce quantity by max surplus quantity
        if (1 === $anzSiblingsInCart) {
            $arrSet['quantity'] -= max($surplusVariant, $surplusParent); // decrease by max surplus quantity
        }

        // More than 1 sibling in cart: unclear which siblings are meant to be changed
        else {
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['adaptCart'],
                $objProduct->getName()
            ));
        }

        return $arrSet;
    }
}
