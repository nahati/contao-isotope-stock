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

use Contao\CoreBundle\Framework\ContaoFramework;
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

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */

    // Inspired by contao/calendar-bundle (constructor injection of ContaoFramework to enable testing)
    public function __construct(private readonly ContaoFramework $framework)
    {
    }

    /**
     * Set all variants RESERVED.
     */
    private function setAvailableVariantsReserved(Product $objParentProduct): void
    {
        // Get an adapter for the Product class
        $adapter = $this->framework->getAdapter(Product::class);

        // Get all children of the parent product (variants)
        $objVariants = $adapter->findBy('pid', $objParentProduct->getId());

        // Set all AVAILABLE variants RESERVED
        foreach ($objVariants as $variant) {
            if ($variant->inventory_status === $this->AVAILABLE) {
                $this->helper->updateInventoryStatus($variant, $this->RESERVED);
            }
        }
    }

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
        // Initialize the Contao framework
        $this->framework->initialize();

        // Instantiate a Helper object
        $this->helper = new Helper();

        /** @var Product|null $objProduct */
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
            $arrSet['quantity'] -= $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']); // decrease by surplus quantity

            return $arrSet;
        }

        // (else) Variant product

        // Manage stock for variant product with quantity of this variant
        $surplusVariant = $this->helper->manageStockAndReturnSurplus($objProduct, $arrSet['quantity']);

        // Manage stock for parent product with sum of all siblings quantities

        // Get an adapter for the Product class
        $adapter = $this->framework->getAdapter(Product::class);
        $objParentProduct = $adapter->findByPk($objProduct->pid);

        $reserved = false;
        $anzSiblingsInCart = 0;
        $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $this->helper->sumSiblings($objCart, $objProduct->pid, $anzSiblingsInCart), $reserved);

        if ($reserved) {
            $this->setAvailableVariantsReserved($objParentProduct);
        }

        // Only 1 sibling in cart: reduce quantity by max surplus quantity
        if (1 === $anzSiblingsInCart) {
            $arrSet['quantity'] -= max($surplusVariant, $surplusParent); // decrease by max surplus quantity

            return $arrSet;
        }

        // More than 1 sibling in cart: unclear which siblings are meant to be changed
        else {
            Message::addError(sprintf(
                $GLOBALS['TL_LANG']['ERR']['adaptCart'],
                $objProduct->getName()
            ));

            return false;
        }
    }
}
