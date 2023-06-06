<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\Tests\Unit\Helper;

use Contao\TestCase\ContaoTestCase;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Test the Helper class.
 *
 * @covers \nahati\ContaoIsotopeStockBundle\Helper\Helper
 */
class HelperTest extends ContaoTestCase
{
    private Helper $helper;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    protected function setUp(): void
    {
        parent::setUp();

        $this->helper = new Helper();
        // Test if the helper class is instantiated
        $this->assertInstanceOf('nahati\ContaoIsotopeStockBundle\Helper\Helper', $this->helper);
    }

    // Dummy Test
    public function testTrueIsTrue(): void
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    public function testCheckStockmanagementReturnsFalseWhenInventoryStatusIsNotSetAndQuantityIsNotSet(): void
    {
        // Mock a product, inventory_status is not set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');

        // Test if the method checkStockmanagement returns false
        $this->assertFalse($this->helper->checkStockmanagement($product));
    }

    public function testCheckStockmanagementThrowsInvalidArgumentExceptionWhenInventoryStatusIsNotSetButQuantityIsSet(): void
    {
        // Mock a product, inventory_status is not set, quantity is set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        // Mock method getName()
        $product
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->quantity, '1');
        $this->assertSame($product->getName(), 'foo');
        // Test if an InvalidArgumentException is thrown
        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';
        $this->expectException(\InvalidArgumentException::class); // expect Exception
        $this->expectExceptionMessage('inventory_status not activated for product foo'); // expect Exception Message
        $this->helper->checkStockmanagement($product);
    }

    public function testCheckStockmanagementReturnsTrueWhenInventoryStatusIsSet(): void
    {
        // Mock a product, inventory_status is set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'inventory_status' => '1']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->inventory_status, '1');
        // Test if the method checkStockmanagement returns true
        $this->assertTrue($this->helper->checkStockmanagement($product));
    }

    public function testIsSoldoutReturnsTrueAndSetsInventoryStatusSoldoutWhenQuantityIsZero(): void
    {
        // Mock a product, quantity zero, any numeric inventory_status
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->AVAILABLE]);
        // Mock method getName()
        $product
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->quantity, '0');
        $this->assertSame($product->inventory_status, $this->AVAILABLE);
        $this->assertSame($product->getName(), 'foo');
        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';
        // Test if the method isSoldout returns true
        $this->assertTrue($this->helper->isSoldout($product));
        // Test if the inventory_status is updated
        $this->assertSame($product->inventory_status, $this->SOLDOUT);
        // Test if quantity has been kept zero
        $this->assertSame($product->quantity, '0');
    }

    public function testIsSoldoutReturnsTrueAndSetsQuantityZeroWhenInventoryStatusIsSoldout(): void
    {
        // Mock a product, any quantity, inventory_status SOLDOUT
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->SOLDOUT]);
        // Mock method getName()
        $product
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->quantity, '1');
        $this->assertSame($product->inventory_status, $this->SOLDOUT);
        $this->assertSame($product->getName(), 'foo');
        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';
        // Test if the method isSoldout returns true
        $this->assertTrue($this->helper->isSoldout($product));
        // Test if quantity is updated
        $this->assertSame($product->quantity, '0');
        // Test if inventory_status has been kept SOLDOUT
        $this->assertSame($product->inventory_status, $this->SOLDOUT);
    }

    public function testIsSoldoutReturnsFalseWhenQuantityIsNotZeroAndInventoryStatusIsNotSoldout(): void
    {
        // Mock a product, quantity 1, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->quantity, '1');
        $this->assertSame($product->inventory_status, $this->AVAILABLE);

        // Test if the method isSoldout returns false
        $this->assertFalse($this->helper->isSoldout($product));

        // Test if product is unchanged
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->quantity, '1');
        $this->assertSame($product->inventory_status, $this->AVAILABLE);
    }

    public function testSumSiblingsWhenThereAreVariantsInCartAndAlsoNonVariantsAndAlsoItemsWithoutProduct(): void
    {
        // Create a mock Cart object
        $objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Create mock Item objects
        $objItem1 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem1
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 1, 'pid' => 1, 'name' => 'product1']))
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
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 2, 'pid' => 1, 'name' => 'product2']))
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
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 3, 'pid' => 1, 'name' => 'product3']))
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
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($this->mockClassWithProperties(Standard::class, ['id' => 4, 'pid' => 2, 'name' => 'product4']))
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
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn(null)
        ;
        $objItem5
            ->method('__get')
            ->with('quantity')
            ->willReturn(78)
        ;

        // Set the items in the mock Cart object
        $objCart
            ->expects($this->once())
            ->method('getItems')
            ->willReturn([$objItem1, $objItem2, $objItem3, $objItem4, $objItem5])
        ;

        // Call the sumSiblings method
        $anzSiblingsInCart = 0;
        $sum = $this->helper->sumSiblings($objCart, 1, $anzSiblingsInCart);

        // Assert the result
        $this->assertSame(6, $sum);
        $this->assertSame(3, $anzSiblingsInCart);
    }

    public function testManageStockAndReturnSurplusZeroWhenQuantityIsNull(): void
    {
        // Mock a product, quantity Null, any numeric inventory_status
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => null, 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->quantity, null);
        $this->assertSame($product->inventory_status, '2');
        // Test if the method manageStockAndReturnSurplus returns 0
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 1));
    }

    public function testManageStockAndReturnSurplusZeroWhenQuantityIsEmpty(): void
    {
        // Mock a product, quantity empty, any numeric inventory_status
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->id, 1);
        $this->assertSame($product->name, 'foo');
        $this->assertSame($product->quantity, '');
        $this->assertSame($product->inventory_status, '2');
        // Test if the method manageStockAndReturnSurplus returns 0
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 1));
    }

    public function testManageStockAndReturnSurplusZeroAndSetInventoryStatusAvailableAndSetReservedFalseWhenQuantityInCartIsLessThanProductQuantity(): void
    {
        // Mock a product, quantity 50, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 2 (that is < 5 )
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 2, $reserved));
        $this->assertFalse($reserved);
        $this->assertSame($product->inventory_status, $this->AVAILABLE);
    }

    public function testManageStockAndReturnSurplusZeroAndSetInventoryStatusReservedAndSetReservedTrueWhenQuantityInCartIsEqualToProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 5
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 5, $reserved));
        $this->assertTrue($reserved);
        $this->assertSame($product->inventory_status, $this->RESERVED);
    }

    public function testManageStockAndReturnANonZeroSurplusAndSetInventoryStatusReservedAndSetReservedTrueWhenQuantityInCartIsGreaterThanProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        // Test if the method manageStockAndReturnSurplus returns 2 when quantityInCart = 7
        $this->assertSame(2, $this->helper->manageStockAndReturnSurplus($product, 7, $reserved));
        $this->assertTrue($reserved);
        $this->assertSame($product->inventory_status, $this->RESERVED);

        // Todo assert Message
    }

    public function testSetAvailableVariantsReserved(): void
    {
        // // Mock a parent product
        // $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1]);
        // $this->assertInstanceOf('Isotope\Model\Product\Standard', $objParentProduct);
        // $this->assertSame($objParentProduct->id, 1);

        // // Mock child products
        // $objProduct1 = $this->mockClassWithProperties(Standard::class, ['id' => 101, 'pid' => 1, 'name' => 'product1', 'inventory_status' => $this->UNSELLABLE]);
        // $this->assertSame($objProduct1->inventory_status, $this->UNSELLABLE);

        // $objProduct2 = $this->mockClassWithProperties(Standard::class, ['id' => 102, 'pid' => 1, 'name' => 'product1', 'inventory_status' => $this->AVAILABLE]);
        // $this->assertSame($objProduct2->inventory_status, $this->AVAILABLE);

        // $objProduct3 = $this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'product1', 'inventory_status' => $this->RESERVED]);
        // $this->assertSame($objProduct3->inventory_status, $this->RESERVED);

        // $objProduct4 = $this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 1, 'name' => 'product1', 'inventory_status' => $this->SOLDOUT]);
        // $this->assertSame($objProduct4->inventory_status, $this->SOLDOUT);

        // // Mock non-child products, too
        // $objProduct5 = $this->mockClassWithProperties(Standard::class, ['id' => 105, 'pid' => 2, 'name' => 'product1', 'inventory_status' => $this->AVAILABLE]);
        // $this->assertSame($objProduct5->inventory_status, $this->AVAILABLE);

        // static function findBy cannot be mocked -> no Test!
    }
}
