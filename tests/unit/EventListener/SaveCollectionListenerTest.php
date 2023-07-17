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
use Nahati\ContaoIsotopeStockBundle\EventListener\SaveCollectionListener;

/**
 * Test the SaveCollectionListener class.
 *
 * We use adapters for the Contao classes to be able to mock them in the tests.
 */
class SaveCollectionListenerTest extends ContaoTestCase
{
    private ProductCollectionItem $objItem;
    private Cart $objCart;
    private Standard $objProduct;

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
        $GLOBALS['TL_LANG']['ERR']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';
    }

    // Dummy Test
    public function testTrueIsTrue(): void
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    public function testSaveCollectionListenerDoesNothingWhenItemWithoutProduct(): void
    {
        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn(null);

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objCart
            ->method('getItems')
            ->willReturn([$this->objItem]);

        // Mock the adapters for the framework, we don't need them here
        $adapters = [];

        $listener = new saveCollectionListener($this->mockContaoFramework($adapters));

        $listener($this->objCart);

        // Nothing left to test here
    }

    public function testSaveCollectionListenerDoesNothingWhenStockmanagementIsNotConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is not set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objCart
            ->method('getItems')
            ->willReturn([$this->objItem]);

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new SaveCollectionListener($this->mockContaoFramework($adapters));

        $listener($this->objCart);

        // Nothing left to test here
    }

    public function testSaveCollectionListenerThrowsInvalidArgumentExceptionWhenStockmanagementIsBadlyConfigured(): void
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

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objCart
            ->method('getItems')
            ->willReturn([$this->objItem]);

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('inventory_status not activated for product foo');

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new SaveCollectionListener($this->mockContaoFramework($adapters));

        $listener($this->objCart);
    }

    // Further tests can be found in the integration testcases

}
