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
 * @IsotopeHook("updateItemInCollection")
 */
class UpdateItemInCollectionListener
{
    private ContaoFramework $framework;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */

    /**
     * @var Helper
     */
    private $helper;

    // Inspired by contao/calendar-bundle (constructor injection of ContaoFramework to enable testing)

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
     * @param ProductCollectionItem $objItem // item in cart
     * @param array<mixed>          $arrSet  // properties of item in cart
     * @param Cart                  $objCart // cart
     *
     * @return mixed // new arrSet (changed or unchanged quantity)
     */
    public function __invoke($objItem, $arrSet, $objCart)
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        /** @var Standard|null $objProduct */
        $objProduct = $objItem->getProduct() ?? null;

        if (!$objProduct) {
            return false;
        }

        // Stockmanagement not or not correctly configured
        if (!$this->helper->checkStockmanagement($objProduct)) {
            return $arrSet; // return unchanged or throw exception
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
            /** @var int $surplus */
            $surplus = $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']);

            $arrSet['quantity'] -= $surplus; // decrease by surplus quantity

            if ($surplus > 0) {
                $this->helper->issueMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
            }

            return $arrSet;
        }

        // (else) Variant product

        // Manage stock for variant product with quantity of this variant
        $surplusVariant = $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']);

        // Manage stock for parent product with sum of all siblings quantities

        // Get an adapter for the Standard class
        /** @var Adapter<Standard> $adapter */
        $adapter = $this->framework->getAdapter(Standard::class);
        $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

        $setInventoryStatusTo = null;
        $anzSiblingsInCart = 0;

        // Take the sum of all siblings quantities in cart (not including the current product) and add the quantity of the current product
        $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $arrSet['quantity'], $setInventoryStatusTo);

        if ($setInventoryStatusTo === $this->AVAILABLE) {
            $this->helper->setParentAndSiblingsProductsAvailable($objParentProduct, $objProduct->id);
        } elseif ($setInventoryStatusTo === $this->RESERVED) {
            $this->helper->setParentAndChildProductsReserved($objParentProduct);
        }
        // do nothing if $setInventoryStatusTo = \null

        if ($surplusParent > 0) {
            $this->helper->issueMessage('parentQuantityNotAvailable', $objParentProduct->getName(), $objParentProduct->quantity);
        }

        if ($surplusVariant > 0) {
            $arrSet['quantity'] -= $surplusVariant; // decrease by surplus quantity

            $this->helper->issueMessage('variantQuantityNotAvailable', $objProduct->getName(), $objProduct->quantity);
        }

        if ($surplusParent) {
            // No sibling in cart: reduce quantity by max surplus quantity
            if (0 === $anzSiblingsInCart) {
                $arrSet['quantity'] -= max($surplusVariant, $surplusParent); // decrease by max surplus quantity

                return $arrSet;
            }

            // Siblings in Cart: user is asked to check his Cart
            else {
                return false;
            }
        }

        // $surplusParent = 0
        else {
            return $arrSet;
        }
    }
}
