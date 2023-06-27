<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\Tests\Integration\EventListener;

use Contao\CoreBundle\Framework\ContaoFramework;
use Nahati\ContaoIsotopeStockBundle\Tests\IntegrationTestCase;

/**
 * Test the UpdateItemInCollectionListener class.
 */
class UpdateItemInCollectionListenerTest extends IntegrationTestCase
{
    // private ProductCollectionItem $objItem;
    // private Cart $objCart;
    // private mixed $arrSet;
    // private Standard $objProduct;
    // private Standard $objProduct1;
    // private Standard $objProduct2;
    // private Standard $objProduct3;
    // private Standard $objProduct4;
    // private Standard $objProduct6;
    // private Standard $objParentProduct;

    // private string $inventory_status;
    // private string $AVAILABLE = '2'; /* product available for sale */
    // private string $SOLDOUT = '4'; /* product in cart though soldout */

    protected ContaoFramework $framework;

    /**
     * setup() is called for each Testcase and contains the basic setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        parent::setUp();
    }

    // Dummy Test
    public function testTrueIsTrue(): void
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    // TODO: Fix whats missing and add all testcases

    // Due to missing support and documentation the integration test cannot be coded yet.
    // I tried several approaches unsuccesfully. If anyone wants to help, you are welcome!
    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductIsSoldout(): void
    {
        // $listener = new UpdateItemInCollectionListener($this->framework);

        // Fetch the Cart from the test database
        // $this->objCart = $this->fetchCart();

        // Fetch an Item of this Cart and get the product
        // ... and set its inventory_status to SOLDOUT ...

        // $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns Quantity Zero
        // $this->assertSame(0, $result['quantity']);

        $foo = true;
        $this->assertTrue($foo);
    }

    // More testcases should be added here later
}
