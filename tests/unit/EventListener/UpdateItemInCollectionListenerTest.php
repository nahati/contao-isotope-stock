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
use nahati\ContaoIsotopeStockBundle\EventListener\UpdateItemInCollectionListener;

class UpdateItemInCollectionListenerTest extends ContaoTestCase
{
    private ProductCollectionItem $objItem;
    private Cart $objCart;
    private mixed $arrSet;
    private Standard $objProduct;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product in cart though soldout */

    /**
     * setup() is called for each Testcase and contains the basic setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        parent::setUp();

        // Mock a product, inventory_status is not set, quantity is set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => '2']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objCart
            ->method('getItems')
            ->willReturn([$this->objItem])
        ;

        $this->arrSet = [
            'quantity' => 1,
        ];
        $this->assertSame(1, $this->arrSet['quantity']);

        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';
    }

    // Dummy Test
    public function testTrueIsTrue(): void
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    public function testUpdateItemInCollectionListenerReturnsFalseWhenItemWithoutProduct(): void
    {
        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn(null)
        ;

        $listener = new UpdateItemInCollectionListener();
        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        $this->assertFalse($result);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedArrsetWhenStockmanagementIsNotConfigured(): void
    {
        // Mock a product, inventory_status is not set, quantity is set
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $listener = new UpdateItemInCollectionListener();
        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test that result is unchanged
        $this->assertSame($result, $this->arrSet);

        // Test that product is unchanged
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
    }

    public function testUpdateItemInCollectionListenerThrowsInvalidArgumentExceptionWhenStockmanagementIsBadlyConfigured(): void
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

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        // Test if an InvalidArgumentException is thrown
        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';
        $this->expectException(\InvalidArgumentException::class); // expect Exception
        $this->expectExceptionMessage('inventory_status not activated for product foo'); // expect Exception Message

        $listener = new UpdateItemInCollectionListener();
        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test that result is unchanged
        $this->assertSame($result, $this->arrSet);

        // Test that product is unchanged
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
    }

    public function testUpdateItemInCollectionListenerReturnsFalseWhenParameterArrsetNotContainsKeyQuantity(): void
    {
        $this->arrSet = [];

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns false
        $this->assertFalse($result);

        // Test that product is unchanged
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
    }

    public function testUpdateItemInCollectionListenerReturnsFalseWhenParameterArrsetKeyQuantityIsEmpty(): void
    {
        $this->arrSet = [
            'quantity' => '',
        ];

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns false
        $this->assertFalse($result);

        // Test that product is unchanged
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
    }

    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductHasQuantityZeroAndHenceIsSoldout(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => '2']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '0');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns Quantity Zero
        $this->assertSame(0, $result['quantity']);

        // Test that product is changed
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '0');
        $this->assertSame($this->objProduct->inventory_status, $this->SOLDOUT);
    }

    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductHasInventoryStatusSoldoutAndHenceIsSoldout(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->SOLDOUT]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->SOLDOUT);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns Quantity Zero
        $this->assertSame(0, $result['quantity']);

        // Test that product is changed
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '0');
        $this->assertSame($this->objProduct->inventory_status, $this->SOLDOUT);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($result, $this->arrSet);

        // Test that product is unchanged
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndQuantityInCartIsLessThanProductQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '50', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '50');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($result, $this->arrSet);

        // Test that product is unchanged
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '50');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($result, $this->arrSet);

        // Test that product is changed
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->RESERVED);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndQuantityInCartIsGreaterThanProductQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        $this->arrSet = [
            'quantity' => 2,
        ];
        $this->assertSame(2, $this->arrSet['quantity']);

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns reduced Quantity
        $this->assertSame(1, $result['quantity']);

        // Test that product is changed
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->RESERVED);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsAVariantAndParentProductHasUnlimitedQuantity(): void
    {
        // Mock the actual variant in Cart
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 100, 'pid' => 1, 'name' => 'foo', 'quantity' => '2', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 100);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '2');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        // Mock the Parent of the actual variant in Cart
        $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'Parent', 'quantity' => '', 'inventory_status' => $this->AVAILABLE]);
        $objParentProduct
            ->method('getName')
            ->willReturn('Parent')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $objParentProduct);
        $this->assertSame($objParentProduct->id, 1);
        $this->assertSame($objParentProduct->name, 'Parent');
        $this->assertSame($objParentProduct->quantity, '');
        $this->assertSame($objParentProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($objParentProduct->getName(), 'Parent');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        // Create more mock Item objects
        $objItem1 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem1
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 101, 'pid' => 1, 'name' => 'product1']))
        ;
        // Access to property quantity of item does not work via a direct set but needs magic method __set
        $objItem1
            ->method('__get')
            ->with('quantity')
            ->willReturn(1)
        ;

        $objItem2 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem2
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 102, 'pid' => 1, 'name' => 'product2']))
        ;
        $objItem2
            ->method('__get')
            ->with('quantity')
            ->willReturn(2)
        ;

        $objItem3 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem3
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'product3']))
        ;
        $objItem3
            ->method('__get')
            ->with('quantity')
            ->willReturn(3)
        ;

        // An item with another pid
        $objItem4 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem4
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 2, 'name' => 'product4']))
        ;
        $objItem4
            ->method('__get')
            ->with('quantity')
            ->willReturn(1)
        ;

        // An item without product
        $objItem5 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem5
            ->method('getProduct')
            ->willReturn(null)
        ;
        $objItem5
            ->method('__get')
            ->with('quantity')
            ->willReturn(78)
        ;

        // Set the items in the mock Cart object
        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objCart
            ->method('getItems')
            ->willReturn([$this->objItem, $objItem1, $objItem2, $objItem3, $objItem4, $objItem5])
        ;

        $listener = new UpdateItemInCollectionListener();

        $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($result, $this->arrSet);

        // Test that product is unchanged
        $this->assertSame($this->objProduct->id, 100);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '2');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
    }

    /**
     * Starting from here simple PHPUnit Tests are not working as Contao framework is needed (Product::findByPk() cannot be mocked as static method).
     */
    public function testUpdateItemInCollectionListenerReturnsFalseWhenProductIsAVariantAndSumOfSiblingsInCartQuantityExceedsParentProductQuantity(): void
    {
        // Mock the actual variant in Cart
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 100, 'pid' => 1, 'name' => 'foo', 'quantity' => '2', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->objProduct
            ->method('isVariant')
            ->willReturn('true')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 100);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '2');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        // Mock the Parent of the actual variant in Cart
        $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'Parent', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $objParentProduct
            ->method('getName')
            ->willReturn('Parent')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $objParentProduct);
        $this->assertSame($objParentProduct->id, 1);
        $this->assertSame($objParentProduct->name, 'Parent');
        $this->assertSame($objParentProduct->quantity, '5');
        $this->assertSame($objParentProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($objParentProduct->getName(), 'Parent');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct)
        ;

        // Create more mock Item objects
        $objItem1 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem1
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 101, 'pid' => 1, 'name' => 'product1']))
        ;
        // Access to property quantity of item does not work via a direct set but needs magic method __get
        $objItem1
            ->method('__get')
            ->with('quantity')
            ->willReturn(1)
        ;

        $objItem2 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem2
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 102, 'pid' => 1, 'name' => 'product2']))
        ;
        $objItem2
            ->method('__get')
            ->with('quantity')
            ->willReturn(2)
        ;

        $objItem3 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem3
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'product3']))
        ;
        $objItem3
            ->method('__get')
            ->with('quantity')
            ->willReturn(3)
        ;

        // An item with another pid
        $objItem4 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem4
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 2, 'name' => 'product4']))
        ;
        $objItem4
            ->method('__get')
            ->with('quantity')
            ->willReturn(1)
        ;

        // An item without product
        $objItem5 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem5
            ->method('getProduct')
            ->willReturn(null)
        ;
        $objItem5
            ->method('__get')
            ->with('quantity')
            ->willReturn(78)
        ;

        // Set the items in the mock Cart object
        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $this->objCart
            ->method('getItems')
            ->willReturn([$this->objItem, $objItem1, $objItem2, $objItem3, $objItem4, $objItem5])
        ;

        // $listener = new UpdateItemInCollectionListener();

        // $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // // Test that Listener returns FALSE
        // $this->assertFalse($result);

        // // Test that product is changed
        // $this->assertSame($this->objProduct->id, 100);
        // $this->assertSame($this->objProduct->name, 'foo');
        // $this->assertSame($this->objProduct->quantity, '2');
        // $this->assertSame($this->objProduct->inventory_status, $this->RESERVED);
    }
}
