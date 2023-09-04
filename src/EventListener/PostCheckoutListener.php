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

namespace Nahati\ContaoIsotopeStockBundle\EventListener;

use Contao\CoreBundle\Framework\Adapter;
use Contao\CoreBundle\Framework\ContaoFramework;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Order;
use Isotope\ServiceAnnotation\IsotopeHook;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Inspired by contao/calendar-bundle (injection of ContaoFramework to enable testing).
 *
 * By using adapters we can 1. decouple the dependencies on external classes and 2. we can make use of adapter mocks in the Unit tests.
 *
 * @IsotopeHook("postCheckout")
 */
class PostCheckoutListener
{
    private ContaoFramework $framework;

    /**
     * @var Helper // make use of methods from the Helper class
     */
    private $helper;

    /**
     * @var array<array{productId: int, itemId: int, productName: string, overbought: int}>
     */
    private array $overboughtProducts = [];

    public function __construct(ContaoFramework $framework)
    {
        $this->framework = $framework;
    }

    /**
     * Invoked after the checkout process has been completed.
     *
     * Includes handling of limited editions (regarding to quantity per product).
     *
     * Does not include handling of order limits (regarding to min and max quantity per order), as we tolerate unreached minQuantityPerOrder or exceeded maxQuantityPerOrder caused by concurring changes of product
     *
     * Updates the quantity. Marks as SOLDOUT in all bought products/variants with no remaining quantity.
     *
     * Also handles overbought situation
     *
     * @param Order $objOrder // ProductCollection in order, not empty
     */
    public function __invoke($objOrder): void
    {
        // Instantiate a Helper object
        $this->helper = new Helper($this->framework);

        // Check that order is a non empty collection
        if (!$objOrder->getItems()) {
            return;
        }

        // Array of all soldout parent product's IDs for products in the order
        $soldoutParentProductIds = [];

        // Loop over all Items in the order
        foreach ($objOrder->getItems() as $objItem) {
            /** @var Standard|null $objProduct */
            $objProduct = $objItem->getProduct() ?? null;

            // No product
            if (!$objProduct) {
                continue;
            }

            // If not correctly configured, throw exception.
            if (!$this->helper->checkConfigurationForLimitedEditions($objProduct)) {
                continue; // no stock-management
            }

            $overbought = 0;

            $soldoutProduct = $this->helper->manageStockAfterCheckout($objProduct, $objItem->quantity, $overbought);

            if ($overbought) {
                $this->overboughtProducts[] = [
                    'productId' => $objProduct->id,
                    'itemId' => $objItem->id,
                    'productName' => $objProduct->name,
                    'overbought' => $overbought,
                ];
            }

            // Product is a variant
            if ($objProduct->isVariant()) {
                // Get an adapter for the Standard class
                /** @var Adapter<Standard> $adapter */
                $adapter = $this->framework->getAdapter(Standard::class);

                // Get the parent product
                $objParentProduct = $adapter->findPublishedByPk($objProduct->pid);

                $objParentProduct->refresh(); // refresh the parent product, otherwise we would not get the changes made in an previous loop

                // Manage stock for parent product with quantity of this variant
                $overbought = 0;

                $soldoutParent = $this->helper->manageStockAfterCheckout($objParentProduct, $objItem->quantity, $overbought);

                if ($overbought) {
                    $this->overboughtProducts[] = [
                        'productId' => $objProduct->id,
                        'itemId' => $objItem->id,
                        'productName' => $objProduct->name,
                        'overbought' => $overbought,
                    ];
                }

                if ($soldoutParent) {
                    // If parent product is soldout, add it's ID to the array of soldout parent products, avoid duplicates
                    if (!\in_array($objParentProduct->id, $soldoutParentProductIds, true)) {
                        $soldoutParentProductIds[] = $objParentProduct->id;
                    }
                } else {
                    // Parent product is not soldout, but variant product is
                    if ($soldoutProduct) {
                        if (!$this->helper->existsAnyAvailableChild($objParentProduct->id)) {
                            // No child product is available, so we set parent product to SOLDOUT
                            $this->helper->updateInventory($objParentProduct, Helper::SOLDOUT, '0', true);
                        }
                    }
                }
            }
        } // foreach

        // Walk through the list of soldout parent product ids and set all child products soldout as well.
        if ($soldoutParentProductIds) {
            $this->helper->setChildProductsSoldout($soldoutParentProductIds);
        }

        // Handle overbought situation
        if ($this->overboughtProducts) {
            $this->helper->handleOverbought($objOrder->id, $this->overboughtProducts);
        }
    }
}
