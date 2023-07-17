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

use Contao\Database;
use Contao\TestCase\ContaoTestCase;
use Isotope\Message;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Nahati\ContaoIsotopeStockBundle\EventListener\UpdateItemInCollectionListener;

/**
 * Test the UpdateItemInCollectionListener class.
 *
 * We use adapters for the Contao classes to be able to mock them in the tests.
 *
 */
class UpdateItemInCollectionListenerTest extends ContaoTestCase
{
    private ProductCollectionItem $objItem;
    private Cart $objCart;
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
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
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

        $this->arrSet = [
            'quantity' => 1,
        ];
        $this->assertSame(1, $this->arrSet['quantity']);

        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';
        $GLOBALS['TL_LANG']['ERR']['parentQuantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['adaptCart'] = 'Adapt the "%s" and related variants in cart by their quantity!';

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s" has changed in the meanwhile, please start again!';

        $GLOBALS['TL_LANG']['ERR']['productOutOfStock'] = 'The product "%s" is currently out of stock';
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
            ->getMock();

        $this->objItem
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn(null);

        // Mock the adapters for the framework, we don't need them here
        $adapters = [];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        $this->assertFalse($return);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedArrsetWhenStockmanagementIsNotConfigured(): void
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

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test that result is unchanged
        $this->assertSame($return, $this->arrSet);
    }

    public function testUpdateItemInCollectionListenerThrowsInvalidArgumentExceptionWhenStockmanagementIsBadlyConfigured(): void
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

        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class); // expect Exception
        $this->expectExceptionMessage('inventory_status not activated for product foo'); // expect Exception Message

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test that result is unchanged
        $this->assertSame($return, $this->arrSet);
    }

    public function testUpdateItemInCollectionListenerReturnsFalseWhenParameterArrsetNotContainsKeyQuantity(): void
    {
        $this->arrSet = [];

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns false
        $this->assertFalse($return);
    }

    public function testUpdateItemInCollectionListenerReturnsFalseWhenParameterArrsetKeyQuantityIsEmpty(): void
    {
        $this->arrSet = [
            'quantity' => '',
        ];

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns false
        $this->assertFalse($return);
    }

    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductHasQuantityZeroAndHenceIsSoldout(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => '2']);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '0');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute');

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $this->objProduct]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns Quantity Zero
        $this->assertSame(0, $return['quantity']);
    }

    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductHasInventoryStatusSoldoutAndHenceIsSoldout(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->SOLDOUT]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->SOLDOUT);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute');

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $this->objProduct]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns Quantity Zero
        $this->assertSame(0, $return['quantity']);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        // Mock the adpaters for the framework, we don't need them here
        $adapters = [];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($return, $this->arrSet);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndQuantityInCartIsLessThanProductQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '50', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '50');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute');

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $this->objProduct]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($return, $this->arrSet);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute');

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $this->objProduct]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($return, $this->arrSet);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndQuantityInCartIsGreaterThanProductQuantity(): void
    {
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 1);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '1');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        $this->arrSet = [
            'quantity' => 2,
        ];
        $this->assertSame(2, $this->arrSet['quantity']);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute');

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $this->objProduct]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns reduced Quantity
        $this->assertSame(1, $return['quantity']);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsAVariantAndParentProductHasUnlimitedQuantity(): void
    {
        // Mock the actual variant in Cart
        $this->objProduct = $this->mockClassWithProperties(Standard::class, ['id' => 100, 'pid' => 1, 'name' => 'foo', 'quantity' => '2', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct
            ->method('getName')
            ->willReturn('foo');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objProduct);
        $this->assertSame($this->objProduct->id, 100);
        $this->assertSame($this->objProduct->name, 'foo');
        $this->assertSame($this->objProduct->quantity, '2');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objProduct->getName(), 'foo');

        // Mock the Parent of the actual variant in Cart
        $this->objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'Parent', 'quantity' => '', 'inventory_status' => $this->AVAILABLE]);
        $this->objParentProduct
            ->method('getName')
            ->willReturn('Parent');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objParentProduct);
        $this->assertSame($this->objParentProduct->id, 1);
        $this->assertSame($this->objParentProduct->name, 'Parent');
        $this->assertSame($this->objParentProduct->quantity, '');
        $this->assertSame($this->objParentProduct->inventory_status, $this->AVAILABLE);
        $this->assertSame($this->objParentProduct->getName(), 'Parent');

        $this->objItem = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objItem
            ->method('getProduct')
            ->willReturn($this->objProduct);

        // Create more mock Item objects
        $objItem1 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem1
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 101, 'pid' => 1, 'name' => 'product1']));
        // Access to property quantity of item does not work via a direct set but needs magic method __set
        $objItem1
            ->method('__get')
            ->with('quantity')
            ->willReturn(1);

        $objItem2 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem2
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 102, 'pid' => 1, 'name' => 'product2']));
        $objItem2
            ->method('__get')
            ->with('quantity')
            ->willReturn(2);

        $objItem3 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem3
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'product3']));
        $objItem3
            ->method('__get')
            ->with('quantity')
            ->willReturn(3);

        // An item with another pid
        $objItem4 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem4
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 2, 'name' => 'product4']));
        $objItem4
            ->method('__get')
            ->with('quantity')
            ->willReturn(1);

        // An item without product
        $objItem5 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem5
            ->method('getProduct')
            ->willReturn(null);
        $objItem5
            ->method('__get')
            ->with('quantity')
            ->willReturn(78);

        // Set the items in the mock Cart object
        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objCart
            ->method('getItems')
            ->willReturn([$this->objItem, $objItem1, $objItem2, $objItem3, $objItem4, $objItem5]);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute');

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $this->objProduct]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns unchanged Quantity
        $this->assertSame($return, $this->arrSet);
    }

    public function testUpdateItemInCollectionListenerReturnsReducedQuantityInArrsetByTheSurplusWhenProductIsAVariantAndSumOfSiblingsInCartQuantityExceedsParentProductQuantity(): void
    {
        // a sibling, in Cart

        $this->objProduct1 = $this->mockClassWithProperties(Standard::class, ['id' => 101, 'pid' => 1, 'name' => 'product1', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct1
            ->method('isVariant')
            ->willReturn('true');
        $this->objProduct1
            ->method('getName')
            ->willReturn('product1');

        $objItem1 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        // Access to property quantity of item does not work via a direct set but needs magic method __get
        $objItem1
            ->method('__get')
            ->with('quantity')
            ->willReturn(1);
        $objItem1
            ->method('getProduct')
            ->willReturn($this->objProduct1);

        // a sibling, in Cart
        $this->objProduct2 = $this->mockClassWithProperties(Standard::class, ['id' => 102, 'pid' => 1, 'name' => 'product2', 'quantity' => '2', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct2
            ->method('isVariant')
            ->willReturn('true');

        $objItem2 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem2
            ->method('__get')
            ->with('quantity')
            ->willReturn(2);
        $objItem2
            ->method('getProduct')
            ->willReturn($this->objProduct2);

        // a sibling, in Cart
        $this->objProduct3 = $this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'product3', 'quantity' => '3', 'inventory_status' => $this->AVAILABLE]);
        $this->objProduct3
            ->method('isVariant')
            ->willReturn('true');

        $objItem3 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem3
            ->method('__get')
            ->with('quantity')
            ->willReturn(3);
        $objItem3
            ->method('getProduct')
            ->willReturn($this->objProduct3);

        // Not a sibling, in Cart
        $this->objProduct4 = $this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 2, 'name' => 'product4', 'quantity' => '4', 'inventory_status' => $this->AVAILABLE]);

        $objItem4 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem4
            ->method('__get')
            ->with('quantity')
            ->willReturn(4);
        $objItem4
            ->method('getProduct')
            ->willReturn($this->objProduct4);

        // An item without product, in Cart
        $objItem5 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock();
        $objItem5
            ->method('__get')
            ->with('quantity')
            ->willReturn(5);
        $objItem5
            ->method('getProduct')
            ->willReturn(null);

        // An extra sibling (not in Cart)
        $this->objProduct6 = $this->mockClassWithProperties(Standard::class, ['id' => 106, 'pid' => 1, 'name' => 'product6', 'quantity' => '6', 'inventory_status' => $this->AVAILABLE]);

        // Set the items in the mock Cart object
        $this->objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock();
        $this->objCart
            ->method('getItems')
            ->willReturn([$objItem1, $objItem2, $objItem3, $objItem4, $objItem5]);

        // Set the actual item in Cart, in this testcase it shall be $objItem1
        $this->objItem = $objItem1;

        // Mock the Parent of the actual item in Cart
        $this->objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'Parent', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->objParentProduct
            ->method('getName')
            ->willReturn('Parent');
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $this->objParentProduct);
        $this->assertSame($this->objParentProduct->id, 1);
        $this->assertSame($this->objParentProduct->name, 'Parent');
        $this->assertSame($this->objParentProduct->quantity, '5');
        $this->assertSame($this->objParentProduct->inventory_status, $this->AVAILABLE);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf();

        // 12 times prepare and execute for the 2 calls in updateInventoryStatus() per product, and we have 4 products, and 2 of them (the actual product in Cart, and the parent of the actual product in Cart) are updated twice in Test-Modus.
        $databaseAdapterMock
            ->expects($this->exactly(12))
            ->method('prepare')
            ->willReturnSelf();
        $databaseAdapterMock
            ->expects($this->exactly(12))
            ->method('execute');

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock();

        // Mock findPublishedBy to return a collection of all siblings (in Cart or not in Cart) of the actual product in Cart
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter([
                'findPublishedBy' => [$this->objProduct1, $this->objProduct2, $this->objProduct3, $this->objProduct6],

                'findPublishedByPk' => $this->returnValueMap([
                    [1, $this->objParentProduct],
                    [101, $this->objProduct1],
                    [102, $this->objProduct2],
                    [103, $this->objProduct3],
                    [106, $this->objProduct6],
                ]),
            ]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $listener = new UpdateItemInCollectionListener($this->mockContaoFramework($adapters));

        $return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // // Test that Listener returns unchanged quantity
        $this->assertSame($return, false);
    }
}
