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
use Isotope\Message;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Order;
use Isotope\Model\ProductCollectionItem;
use Nahati\ContaoIsotopeStockBundle\EventListener\PostCheckoutListener;

/**
 * Test the PostCheckoutListener class.
 *
 * We use adapters for the Contao classes to be able to mock them in the tests.
 */
class PostCheckoutListenerTest extends ContaoTestCase
{
    private Order $objOrder;
    private ProductCollectionItem $objItem;
    private Standard $objProduct;

    // In setUpBeforeClass() we initialize the neccessary environment once for all tests
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();

        // Do Needed Initializations
        self::DoNeededInitializations();
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
     * Do Needed Initializations.
     */
    private static function DoNeededInitializations(): void
    {
        // Declare additional messages that are declared in the extension
        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';
    }

    // Dummy Test
    // public function testTrueIsTrue(): void
    // {
    //     $foo = true;
    //     $this->assertTrue($foo);
    // }

    public function testPostCheckoutListenerDoesNothingWhenNoItemsInOrder(): void
    {
        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objOrder
            ->expects($this->once())
            ->method('getItems')
            ->willReturn([]);

        // Mock an Item with method getProduct()
        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->expects($this->never())
            ->method('getProduct');

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        // Mock the adapters for the framework
        $adapters = [
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new PostCheckoutListener($this->mockContaoFramework($adapters));

        $listener($this->objOrder);
    }

    public function testPostCheckoutListenerDoesNothingWhenItemWithoutProduct(): void
    {
        // Mock an Item with method getProduct() returning null
        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->expects($this->never())
            ->method('getProduct')
            ->willReturn(null);

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objOrder
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn($this->objItem);

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        // Mock the adapters for the framework
        $adapters = [
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new PostCheckoutListener($this->mockContaoFramework($adapters));

        $listener($this->objOrder);
    }

    public function testPostCheckoutListenerDoesNothingWhenLimitedEditionsAreNotConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is not set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);
        $this->objProduct
            ->expects($this->never())
            ->method('isVariant');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objOrder
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn([$this->objItem]);

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        // Mock the adapters for the framework
        $adapters = [
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];
        $listener = new PostCheckoutListener($this->mockContaoFramework($adapters));

        $listener($this->objOrder);
    }

    public function testPostCheckoutListenerThrowsInvalidArgumentExceptionWhenLimitedEditionsAreBadlyConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->objProduct
            ->expects($this->exactly(0))
            ->method('isVariant');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objOrder
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn([$this->objItem]);

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('inventory_status not activated for product foo');

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new PostCheckoutListener($this->mockContaoFramework($adapters));

        $listener($this->objOrder);
    }
}