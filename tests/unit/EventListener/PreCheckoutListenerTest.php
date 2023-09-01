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
use Isotope\Module\Checkout;
use Nahati\ContaoIsotopeStockBundle\EventListener\PreCheckoutListener;

/**
 * Test the PreCheckoutListener class.
 *
 * We use adapters for the Contao classes to be able to mock them in the tests.
 */
class PreCheckoutListenerTest extends ContaoTestCase
{
    private Order $objOrder;
    private Checkout $objCheckout;
    private ProductCollectionItem $objItem;
    private Standard $objProduct;

    /**
     * setup() is called for each Testcase.
     */
    protected function setUp(): void
    {
        parent::setUp();

        // Do needed Isotope initializations
        $this->doSomeIsotopeInitializations();
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     */
    protected function tearDown(): void
    {
        parent::tearDown();

        unset($this->objOrder, $this->objItem, $this->objProduct);
    }

    /**
     * Do needed Isotope initializations.
     */
    private function doSomeIsotopeInitializations(): void
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

    public function testPreCheckoutListenerDoesNothingWhenStockmanagementIsNotConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is not set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);
        $this->objProduct
            ->method('isVariant')
        ;

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->expects($this->exactly(1))
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objOrder
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        $this->objCheckout = $this->getMockBuilder(Checkout::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Mock the adapters for the framework
        $adapters = [
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];
        $listener = new PreCheckoutListener($this->mockContaoFramework($adapters));

        $listener($this->objOrder, $this->objCheckout);
    }

    public function testPreCheckoutListenerThrowsInvalidArgumentExceptionWhenStockmanagementIsBadlyConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->objProduct
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

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objOrder = $this->getMockBuilder(Order::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objOrder
            ->expects($this->exactly(2))
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        $this->objCheckout = $this->getMockBuilder(Checkout::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('inventory_status not activated for product foo');

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new PreCheckoutListener($this->mockContaoFramework($adapters));

        $listener($this->objOrder, $this->objCheckout);
    }

    // Further tests can be found in the integration testcases
}
