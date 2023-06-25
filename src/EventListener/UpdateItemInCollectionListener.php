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

use Contao\CoreBundle\Framework\ContaoFramework;
use Isotope\Message;
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
    /**
     * @var Helper
     */
    private $helper;

    // Inspired by contao/calendar-bundle (constructor injection of ContaoFramework to enable testing)
    public function __construct(private readonly ContaoFramework $framework)
    {
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
                // Get an adapter for the Message class
                $messageAdapter = $this->framework->getAdapter(Message::class);

                $messageAdapter->addError(sprintf(
                    $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                    $objProduct->getName(),
                    $objProduct->quantity
                ));
            }

            return $arrSet;
        }

        // (else) Variant product

        // Manage stock for variant product with quantity of this variant
        $surplusVariant = $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']);

        // Manage stock for parent product with sum of all siblings quantities

        // Get an adapter for the Standard class
        $adapter = $this->framework->getAdapter(Standard::class);
        $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

        $reserved = false;
        $anzSiblingsInCart = 0;
        // Take the sum of all siblings quantities in cart, except the current item, the quantity of which will be added
        $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $this->helper->sumSiblings($objProduct, $objCart, $objProduct->pid, $anzSiblingsInCart) + $arrSet['quantity'], $reserved);

        if ($reserved) {
            $this->helper->setAvailableVariantsReserved($objParentProduct);
        }

        if ($surplusParent > 0) {
            // Get an adapter for the Message class
            $messageAdapter = $this->framework->getAdapter(Message::class);

            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['parentQuantityNotAvailable'],
                $objParentProduct->getName(),
                $objParentProduct->quantity
            ));
        }

        if ($surplusVariant > 0) {
            // Get an adapter for the Message class
            $messageAdapter = $this->framework->getAdapter(Message::class);

            $messageAdapter->addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['variantQuantityNotAvailable'],
                $objProduct->getName(),
                $objProduct->quantity
            ));
        }

        // No sibling in cart: reduce quantity by max surplus quantity
        if (0 === $anzSiblingsInCart) {
            $arrSet['quantity'] -= max($surplusVariant, $surplusParent); // decrease by max surplus quantity

            return $arrSet;
        }
        // Siblings in Cart -> user has to change his Cart
        return false;
    }
}
