<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\Tests;

use Contao\TestCase\ContaoTestCase;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Nahati\ContaoIsotopeStockBundle\EventListener\AddProductToCollectionListener;

/**
 * Test the AddProductToCollectionListener class.
 *
 * We use adapters for the Contao classes to be able to mock them in the tests.
 */
class AddProductToCollectionListenerTest extends ContaoTestCase
{
    private Standard $objProduct;
    private int $quantityRequestedForCart;
    private Cart $objCart;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */

    // In setUpBeforeClass() we initialize the neccessary environment once for all tests
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();

        // Do needed Isotope initializations
        self::DoSomeIsotopeInitializations();
    }

    /**
     * setup() is called for each Testcase and contains the basic setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        parent::setUp();
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     */
    protected function tearDown(): void
    {
        parent::tearDown();
    }

    /**
     * Do needed Isotope initializations.
     */
    private static function DoSomeIsotopeInitializations(): void
    {
        // Declare additional messages that are declared in the extension
        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';
    }

    // Dummy Test
    public function testTrueIsTrue(): void
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    public function testAddProductToCollectionListenerReturnsZeroWhenNoProductGiven(): void
    {
        // Mock the adapters for the framework, we don't need them here
        $adapters = [];

        $listener = new AddProductToCollectionListener($this->mockContaoFramework($adapters));

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->quantityRequestedForCart = 1;

        $return = $listener(null, $this->quantityRequestedForCart, $this->objCart);

        $this->assertSame($return, 0);
    }

    public function testAddProductToCollectionListenerReturnsUnchangedQuantityRequestedForCartWhenStockmanagementIsNotConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is not set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->quantityRequestedForCart = 1;

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new AddProductToCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objProduct, $this->quantityRequestedForCart, $this->objCart);

        $this->assertSame($return,  $this->quantityRequestedForCart);
    }

    public function testAddProductToCollectionListenerThrowsInvalidArgumentExceptionWhenStockmanagementIsBadlyConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->quantityRequestedForCart = 1;

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('inventory_status not activated for product foo');

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new AddProductToCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objProduct, $this->quantityRequestedForCart, $this->objCart);

        // Test that result is unchanged
        $this->assertSame($return,  $this->quantityRequestedForCart);
    }

    // Further tests can be found in the integration testcases
}
