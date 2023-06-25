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
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart as IsotopeCart;
use Isotope\Model\ProductCollectionItem;
use Nahati\ContaoIsotopeStockBundle\Tests\IntegrationTestCase;

/**
 * Test the UpdateItemInCollectionListener class.
 */
class UpdateItemInCollectionListenerTest extends IntegrationTestCase
{
    private ProductCollectionItem $objItem;
    private IsotopeCart $objCart;
    private mixed $arrSet;
    private Standard $objProduct;
    private Standard $objProduct1;
    private Standard $objProduct2;
    private Standard $objProduct3;
    private Standard $objProduct4;
    private Standard $objProduct6;
    private Standard $objParentProduct;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $SOLDOUT = '4'; /* product in cart though soldout */

    private ContaoFramework $framework;

    /**
     * setup() is called for each Testcase and contains the basic setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        // parent::setUp();

        // // Instantiate a ContaoFramework object
        // $this->framework = $this->mockContaoFramework();
    }

    // Dummy Test
    public function testTrueIsTrue(): void
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductHasQuantityZeroAndHenceIsSoldout(): void
    {
        // $listener = new UpdateItemInCollectionListener($this->framework);

        // // Fetch the Cart from the test database
        // $this->objCart = $this->fetchCart();
        $this->objCart = new IsotopeCart();

        // $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // // Test if Listener returns Quantity Zero
        // $this->assertSame(0, $result['quantity']);
    }
}
