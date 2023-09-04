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

    // In setUpBeforeClass() we initialize the neccessary environment once for all tests
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();

        self::DoNeededInitializations();
    }

    /**
     * tearDownAfterClass() is called once after the complete test contains some cleanup.
     */
    public static function tearDownAfterClass(): void
    {
        parent::tearDownAfterClass();
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

    // // Dummy Test
    // public function testTrueIsTrue(): void
    // {
    //     $foo = true;
    //     $this->assertTrue($foo);
    // }

    public function testAddProductToCollectionListenerReturnsUnchangedQuantityRequestedForCartWhenLimitedEditionsAreNotConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is not set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objCart
            ->method('getItems')
            ->willReturn([])
        ;

        $this->quantityRequestedForCart = 1;

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new AddProductToCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objProduct, $this->quantityRequestedForCart, $this->objCart);

        $this->assertSame($return, $this->quantityRequestedForCart);
    }

    public function testAddProductToCollectionListenerThrowsInvalidArgumentExceptionWhenLimitedEditionsAreBadlyConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objCart
            ->method('getItems')
            ->willReturn([])
        ;

        $this->quantityRequestedForCart = 1;

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('inventory_status not activated for product foo');

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new AddProductToCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objProduct, $this->quantityRequestedForCart, $this->objCart);

        // Test that result is unchanged
        $this->assertSame($return, $this->quantityRequestedForCart);
    }
}
