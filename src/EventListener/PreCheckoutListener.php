<?php

// src/EventListener/PreCheckoutListener.php

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
use Isotope\Model\ProductCollection\Order;
use Isotope\Model\ProductCollectionItem;
use Isotope\Module\Checkout;
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("preCheckout")
 */
class PreCheckoutListener
{
    private ContaoFramework $framework;

    /**
     * @var Helper // make use of methods from the Helper class
     */
    private $helper;

    // private ProductCollectionItem $objItem;

    private bool $orderNeedsChanges = false;

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /** Stock Management Type A.
     *
     * Handles changes of products in order, e.g. concurring changes.
     *
     * @param Standard              $objProduct // Product
     * @param ProductCollectionItem $objItem    // Item in Order
     * @param Order                 $objOrder   // Order
     */
    private function stockManagementA($objProduct, $objItem, $objOrder): void
    {
        // Get the return of the stock management for the product
        /** @var int $surplusProduct */
        $surplusProduct = $this->helper->manageStockAndReturnSurplus($objProduct, $objItem->quantity);

        // More in cart than the product can afford
        if ($surplusProduct > 0 && Helper::SOLDOUT !== $objProduct->inventory_status) {
            $this->helper->issueErrorMessage('quantityNotAvailable', $objProduct->getName(), $objProduct->quantity);

            $this->orderNeedsChanges = true;
        }

        // Variant product
        if ($objProduct->isVariant()) {
            //
            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $setInventoryStatusTo = null;
            $anzSiblingsInCollection = 0;

            // Get the sum of the quantity of all siblings in collection (i.e. not including the current product) and add the quantity in collection of the current product.
            /** @var int qtyFamily // overall quantity in collection for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objOrder, $objProduct->pid, $anzSiblingsInCollection) + $objItem->quantity;

            // Manage stock for parent product with overall quantity in collection for all it's childs
            $surplusParent = $this->helper->manageStockAndReturnSurplus($objParentProduct, $qtyFamily, $setInventoryStatusTo);

            // More in cart than the parent can afford
            if ($surplusParent > 0) {
                $this->helper->issueErrorMessage('quantityNotAvailable', $objParentProduct->getName(), $objParentProduct->quantity);

                $this->orderNeedsChanges = true;
            }
        }
    }

    /** Stock Management Type B.
     *
     *  Handling of stock management per order.
     *
     * @param Standard              $objProduct // Product
     * @param ProductCollectionItem $objItem    // Item in Order
     * @param Order                 $objOrder   // Order
     */
    private function stockManagementB($objProduct, $objItem, $objOrder): void
    {
        // Get the return of the stock management for the product
        $returnProduct = $this->helper->manageStockTypeBAndReturnDifferences($objProduct, $objItem->quantity);

        if ($returnProduct['surMinus'] > 0) {
            $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objProduct->getName(), $objProduct->minQuantityPerOrder);

            $this->orderNeedsChanges = true;
        }

        if ($returnProduct['surPlus'] > 0) {
            $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objProduct->getName(), $objProduct->maxQuantityPerOrder);

            $this->orderNeedsChanges = true;
        }

        // Variant product
        if ($objProduct->isVariant()) {
            // Get an adapter for the Standard class
            /** @var Adapter<Standard> $adapter */
            $adapter = $this->framework->getAdapter(Standard::class);

            // Get the parent product
            $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

            $anzSiblingsInCart = 0;

            // Get the sum of the quantity in cart of all siblings in cart (i.e. not including the current product) and add the quantity in cart of the current product.
            /** @var int qtyFamily // overall quantity in cart for all the parent's childs */
            $qtyFamily = $this->helper->sumSiblings($objProduct, $objOrder, $objProduct->pid, $anzSiblingsInCart) + $objItem->quantity;

            // Get the return of the stock management for the parent product with overall quantity in cart for all it's childs
            $returnParent = $this->helper->manageStockTypeBAndReturnDifferences($objParentProduct, $qtyFamily);

            if ($returnParent['surMinus'] > 0) {
                $this->helper->issueErrorMessage('minQuantityPerOrderUnreached', $objParentProduct->getName(), $objParentProduct->minQuantityPerOrder);

                $this->orderNeedsChanges = true;
            }

            if ($returnParent['surPlus'] > 0) {
                $this->helper->issueErrorMessage('maxQuantityPerOrderExceeded', $objParentProduct->getName(), $objParentProduct->maxQuantityPerOrder);

                $this->orderNeedsChanges = true;
            }
        }
    }

    /**
     * Invoked during checkout but before completion.
     *
     * Handles changes of products in order, e.g. concurring changes.
     *
     * If order has to be modified, the checkout will be stopped and the user will be asked to return to the cart.
     *
     * Includes Stock Management Type A (regarding to quantity per product) and Type B (regarding to min and max quantity per order).
     *
     * @param Order    $objOrder    // ProductCollection in order, not empty
     * @param Checkout $objCheckout // Checkout object
     *
     * @return Response|null // Send a RedirectResponse if changes are needed
     * @return bool          // false if order is empty
     */
    public function __invoke($objOrder, $objCheckout)
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        // Check that order is a non empty collection
        if (!$objOrder->getItems()) {
            return false;
        }

        // Loop over all Items in the order
        foreach ($objOrder->getItems() as $objItem) {
            /** @var Standard|null $objProduct */
            $objProduct = $objItem->getProduct() ?? null;

            // No product
            if (!$objProduct) {
                continue;
            }

            // Stock Management Type B
            $this->stockManagementB($objProduct, $objItem, $objOrder);

            // Stock Management Type A
            $this->stockManagementA($objProduct, $objItem, $objOrder);
        }

        if ($this->orderNeedsChanges) {
            // We could also just return false; but then the user would be redirected to the "failed" page with an incorrect message. So we go this way.

            try {
                // Throw an exception to stop the checkout process
                throw new \RuntimeException('The order could not be completed', 400);
            } catch (\RuntimeException $e) {
                // message to be displayed on the "failed" page asking user to go back to cart
                $message = $GLOBALS['TL_LANG']['ERR']['orderNotPossible'];

                // Get an adapter for the Checkout class
                /** @var Adapter<Checkout> $checkoutAdapter */
                $checkoutAdapter = $this->framework->getAdapter(Checkout::class);

                // // Redirect the user to the "failed" page
                $failedUrl = $checkoutAdapter->generateUrlForStep(Checkout::STEP_FAILED, null, null, true);

                // and issue the message
                $failedUrl .= '?reason=' . urlencode($message);

                $response = new RedirectResponse($failedUrl);
                $response->setStatusCode(Response::HTTP_FOUND);
                $response->send();

                return false;
            }
        } else {
            return true; // continue checkout
        }
    }
}
