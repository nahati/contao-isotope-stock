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

namespace Nahati\ContaoIsotopeStockBundle\EventListener;

use Contao\CoreBundle\Framework\Adapter;
use Contao\CoreBundle\Framework\ContaoFramework;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * /**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("updateItemInCollection")
 */
class UpdateItemInCollectionListener
{
    private ContaoFramework $framework;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */

    /**
     * @var Helper // make use of methods from the Helper class
     */
    private $helper;

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * Invoked when Cart is refreshed
     * Handles changes of quantity in cart and also handles concurring changes.
     *
     * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
     *
     * @param ProductCollectionItem $objItem // Item in Cart
     * @param array<mixed>          $arrSet  // Properties of item in cart, esp. quantity in Cart
     * @param Cart                  $objCart // Cart
     *
     * @return mixed // New arrSet (changed or unchanged quantity or false)
     */
    public function __invoke($objItem, $arrSet, $objCart)
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        /** @var Standard|null $objProduct */
        $objProduct = $objItem->getProduct() ?? null;

        // No product
        if (!$objProduct) {
            return false;
        }

        // Stockmanagement not or not correctly configured
        if (!$this->helper->checkStockmanagement($objProduct)) {
            // if not correctly configured, throw exception

            return $arrSet; // return unchanged quantity
        }

        // none or invalid quantity in Cart
        if (!(\array_key_exists('quantity', $arrSet) && $arrSet['quantity'])) {
            return false;
        }

        // Product SOLDOUT
        if ($this->helper->isSoldout($objProduct)) {
            $arrSet['quantity'] = 0;

            return $arrSet; // return quantity = 0
        }

        // Single product (not having any variants)
        if (!$objProduct->isVariant()) {
            /** @var int $surplus */
            $surplus = $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']);

            $arrSet['quantity'] -= $surplus; // decrease by surplus quantity

            if ($surplus > 0) {
                $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
            }

            return $arrSet;
        }
        // Variant product
        else {
            //
            // Manage stock for variant product with quantity of this variant
            $surplusVariant = $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']);

            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $setInventoryStatusTo = null;
            $anzSiblingsInCart = 0;

            // Get the sum of the quantity of all siblings in cart (i.e. not including the current product) and add the quantity of the current product.
            /** @var int qtyFamily // overall quantity in cart for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $arrSet['quantity'];

            // Manage stock for parent product with overall quantity in cart for all it's childs
            $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $qtyFamily, $setInventoryStatusTo);

            if ($setInventoryStatusTo === $this->AVAILABLE) {
                $this->helper->setParentAndSiblingsProductsAvailable($objParentProduct, $objProduct->id);
            } elseif ($setInventoryStatusTo === $this->RESERVED) {
                $this->helper->setParentAndChildProductsReserved($objParentProduct);
            }
            // do nothing if $setInventoryStatusTo = \null

            // More in cart than the variant can afford
            if ($surplusVariant > 0) {
                $arrSet['quantity'] -= $surplusVariant; // decrease by surplus quantity

                $this->helper->issueErrorMessage('variantQuantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
            }

            // More in cart than the parent can afford
            if ($surplusParent > 0) {
                $this->helper->issueErrorMessage('parentQuantityNotAvailable', $objParentProduct->getName(), $objParentProduct->quantity);

                // No sibling in cart
                if (0 === $anzSiblingsInCart) {
                    $arrSet['quantity'] -= max($surplusVariant, $surplusParent); // decrease by surplus quantity

                    return $arrSet;
                }

                // Siblings in cart
                else {
                    return false; //  user is asked to check his cart
                }
            }

            // $surplusParent = 0
            else {
                return $arrSet;
            }
        }
    }
}
