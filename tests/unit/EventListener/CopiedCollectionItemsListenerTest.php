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
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Nahati\ContaoIsotopeStockBundle\EventListener\CopiedCollectionItemsListener;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Test the CopiedCollectionItemsListener class.
 *
 * We use adapters for the Contao classes to be able to mock them in the tests.
 */
class CopiedCollectionItemsListenerTest extends ContaoTestCase
{
    private ProductCollection $objSource; // source collection, not used here
    private ProductCollection $objTarget; // target collection, after copying
    /**
     * @var array<int, int>
     */
    private array $arrIds; // oldItem->id => newItem->id, not used here

    private ProductCollectionItem $objItem;
    private Standard $objProduct;

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

        // Mock a product, inventory_status AVAILABLE, quantity '1'
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => Helper::AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, Helper::AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $this->arrIds = [];
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

    // // Dummy Test
    // public function testTrueIsTrue(): void
    // {
    //     $foo = true;
    //     $this->assertTrue($foo);
    // }

    public function testCopiedCollectionItemsListenerDoesNothingWhenSourceIsNotACart(): void
    {
        $this->objSource = $this->getMockBuilder(ProductCollection::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objTarget = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objTarget
            ->expects($this->exactly(0))
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        // Mock the adapters for the framework, we don't need them here
        $adapters = [];

        $listener = new CopiedCollectionItemsListener($this->mockContaoFramework($adapters));

        $listener($this->objSource, $this->objTarget, $this->arrIds);
    }

    public function testCopiedCollectionItemsListenerDoesNothingWhenTargetIsNotACart(): void
    {
        $this->objSource = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objTarget = $this->getMockBuilder(ProductCollection::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objTarget
            ->expects($this->exactly(0))
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        // Mock the adapters for the framework, we don't need them here
        $adapters = [];

        $listener = new CopiedCollectionItemsListener($this->mockContaoFramework($adapters));

        $listener($this->objSource, $this->objTarget, $this->arrIds);
    }

    public function testCopiedCollectionItemsListenerDoesNothingWhenTargetIsEmpty(): void
    {
        $this->objSource = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objTarget = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objTarget
            ->expects($this->exactly(1))
            ->method('getItems')
            ->willReturn(null)
        ;

        // Mock the adapters for the framework, we don't need them here
        $adapters = [];

        $listener = new CopiedCollectionItemsListener($this->mockContaoFramework($adapters));

        $listener($this->objSource, $this->objTarget, $this->arrIds);
    }

    public function testCopiedCollectionItemsListenerDoesNothingWhenItemWithoutProduct(): void
    {
        $this->objSource = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn(null)
        ;

        $this->objTarget = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objTarget
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        // Mock the adapters for the framework, we don't need them here
        $adapters = [];

        $listener = new CopiedCollectionItemsListener($this->mockContaoFramework($adapters));

        $listener($this->objSource, $this->objTarget, $this->arrIds);
    }

    public function testCopiedCollectionItemsListenerDoesNothingWhenStockmanagementIsNotConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is not set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);
        $this->objProduct
            ->expects($this->exactly(0))
            ->method('isVariant')
        ;

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $this->objSource = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objTarget = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objTarget
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new CopiedCollectionItemsListener($this->mockContaoFramework($adapters));

        $listener($this->objSource, $this->objTarget, $this->arrIds);
    }

    public function testCopiedCollectionItemsListenerThrowsInvalidArgumentExceptionWhenStockmanagementIsBadlyConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->objProduct
            ->expects($this->exactly(0))
            ->method('isVariant')
        ;

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $this->objSource = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objTarget = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objTarget
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('inventory_status not activated for product foo');

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new CopiedCollectionItemsListener($this->mockContaoFramework($adapters));

        $listener($this->objSource, $this->objTarget, $this->arrIds);
    }

    // Further tests can be found in the integration testcases
}
