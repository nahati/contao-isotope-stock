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

    /**
     * Invoked during checkout but before completion.
     *
     * Includes handling of limited editions (regarding to quantity per product) and handling of order limits (regarding to min and max quantity per order).
     *
     * If order needs modification, the checkout will be stopped and the user will be asked to return to the cart.
     *
     * @param Order    $objOrder    // ProductCollection in order, not empty
     * @param Checkout $objCheckout // Checkout object
     *
     * @return Response|null // Send a RedirectResponse if changes are needed
     * @return bool          // false if checkout shall not be continued
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

            /** @var int $quantity */
            $quantity = $objItem->quantity;

            // Correct any deviations from the allowed range. This might change the quantity in cart (quantity has changed - call by reference).
            $this->helper->handleOrderLimits($objProduct, $quantity, $objOrder);

            // Handling of limited editions. This might decrease the quantity in order (quantity has changed - call by reference).
            $this->helper->handleLimitedEditions($objProduct, $quantity, $objOrder);

            // Quantity has been changed (or orderNeedsChanges became true earlier yet)
            $this->orderNeedsChanges = $this->orderNeedsChanges || ($quantity !== $objItem->quantity);

            // Quantity in cart is not within the allowed range (or orderNeedsChanges became true earlier yet)
            $this->orderNeedsChanges = $this->orderNeedsChanges || $this->helper->quantityIsNotInTheAllowedRange($objProduct, $objItem->quantity, $objOrder);
        }

        // Order needs changes
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
