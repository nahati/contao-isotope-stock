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

use Contao\Database;
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
    private bool $isToBeReserved = false;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    protected function setUp(): void
    {
        parent::setUp();
    }

    // Dummy Test
    public function testTrueIsTrue(): void
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    public function testUpdateInventoryStatus(): void
    {
        // Mock a product with invenory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->expects($this->once())
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->once())
            ->method('prepare')
            ->with('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->once())
            ->method('execute')
            ->with($this->RESERVED, 1)
            ->willReturn(true)
        ;

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateInventoryStatus($product, $this->RESERVED);

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];

        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test if the method updateInventoryStatus did the update
        $this->assertSame($product1->inventory_status, $this->RESERVED);
    }

    public function testUpdateQuantity(): void
    {
        // Mock a product with invenory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateQuantity($product, '2');

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];

        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test if the method updateQuantity did the update
        $this->assertSame($product1->quantity, '2');
    }

    public function testSetAvailableVariantsReserved(): void
    {
        // Create a mock parent product
        $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'pid' => 0, 'name' => 'parentProduct']);

        // Create a mock variant product, child of the parent product
        $objVariant2a = $this->mockClassWithProperties(Standard::class, ['id' => 1021, 'pid' => 1, 'name' => 'variant2a', 'inventory_status' => $this->AVAILABLE, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant2b = $this->mockClassWithProperties(Standard::class, ['id' => 1022, 'pid' => 1, 'name' => 'variant2b', 'inventory_status' => $this->AVAILABLE, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant2c = $this->mockClassWithProperties(Standard::class, ['id' => 1023, 'pid' => 1, 'name' => 'variant2c', 'inventory_status' => $this->AVAILABLE, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant3 = $this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'variant3', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant4 = $this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 1, 'name' => 'variant4', 'inventory_status' => $this->SOLDOUT, 'quantity' => '0']);

        // Create a mock product, not a child of the parent product
        $objProduct5 = $this->mockClassWithProperties(Standard::class, ['id' => 105, 'pid' => 2, 'name' => 'product5', 'inventory_status' => $this->AVAILABLE, 'quantity' => '1']);

        //We have 3 variants with inventory-status AVAILABLE; also 1 variant with inventory-status RESERVED and 1 variant with inventory-status SOLDOUT; lastnotleast 1 product with inventory-status AVAILABLE but not child of the parent product

        //Test should also include $product5 to be sufficient, but we simplify for now
        // TODO: test with $product5 included and check if it is not updated

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter([
                'findPublishedBy' => [$objVariant2a, $objVariant2b, $objVariant2c, $objVariant3, $objVariant4],
                'findPublishedByPk' => $this->returnValueMap([
                    [1021, $objVariant2a],
                    [1022, $objVariant2b],
                    [1023, $objVariant2c],
                    [103, $objVariant3],
                    [104, $objVariant4],
                ]),
            ]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->setAvailableVariantsReserved($objParentProduct);

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];

        // Get a new instance of the collection
        $objCollection1 = $adapter->findPublishedBy('pid', $objParentProduct->id);

        // assert that there are 5 products in this collection
        $this->assertCount(5, $objCollection1);

        // Test if the method did update the inventory_status of the variants
        foreach ($objCollection1 as $variant) {
            // assert each variant individually
            switch ($variant->id) {
                case 1021:
                case 1022:
                case 1023:
                    $this->assertSame($variant->inventory_status, $this->RESERVED);
                    break;
                case 103:
                    $this->assertSame($variant->inventory_status, $this->RESERVED);
                    break;
                case 104:
                    $this->assertSame($variant->inventory_status, $this->SOLDOUT);
                    break;

                default:
                    $this->fail('Unexpected variant id: ' . $variant->id); // fail if we have an unexpected variant
            }
        }
    }

    public function testCheckStockmanagementReturnsFalseWhenInventoryStatusIsNotSetAndQuantityIsNotSet(): void
    {
        // Mock a product, inventory_status is not set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $this->helper = new Helper($this->mockContaoFramework());

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
        $this->assertSame($product->getName(), 'foo');

        $this->helper = new Helper($this->mockContaoFramework());

        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';

        // Test if an InvalidArgumentException is thrown
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('inventory_status not activated for product foo');
        $this->helper->checkStockmanagement($product);
    }

    public function testCheckStockmanagementReturnsTrueWhenInventoryStatusIsSet(): void
    {
        // Mock a product, inventory_status is set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'inventory_status' => '1']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $this->helper = new Helper($this->mockContaoFramework());

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

        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method isSoldout returns true
        $this->assertTrue($this->helper->isSoldout($product));

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];
        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test if the method updateInventoryStatus did the update
        $this->assertSame($product1->inventory_status, $this->SOLDOUT);

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
        $this->assertSame($product->getName(), 'foo');

        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method isSoldout returns true
        $this->assertTrue($this->helper->isSoldout($product));

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];
        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test if quantity is updated
        $this->assertSame($product1->quantity, '0');

        // Test if inventory_status has been kept SOLDOUT
        $this->assertSame($product->inventory_status, $this->SOLDOUT);
    }

    public function testIsSoldoutReturnsFalseWhenQuantityIsNotZeroAndInventoryStatusIsNotSoldout(): void
    {
        // Mock a product, quantity 1, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method isSoldout returns false
        $this->assertFalse($this->helper->isSoldout($product));

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];
        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test if product is unchanged
        $this->assertSame($product1->id, 1);
        $this->assertSame($product1->name, 'foo');
        $this->assertSame($product1->quantity, '1');
        $this->assertSame($product1->inventory_status, $this->AVAILABLE);
    }

    public function testIsSoldoutReturnsFalseWhenQuantityIsZeroAndInventoryStatusIsNotSoldout(): void
    {
        // Mock a product, quantity 1, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method isSoldout returns false
        $this->assertTrue($this->helper->isSoldout($product));

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];
        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test if product is changed
        $this->assertSame($product1->id, 1);
        $this->assertSame($product1->name, 'foo');
        $this->assertSame($product1->quantity, '0');
        $this->assertSame($product1->inventory_status, $this->SOLDOUT);
    }

    public function testSumSiblingsWhenThereAreVariantsInCartAndAlsoNonVariantsAndAlsoItemsWithoutProduct(): void
    {
        // Create a mock product, the parent product
        $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'pid' => 0, 'name' => 'parentProduct']);

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
            ->expects($this->once())
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
            ->expects($this->once())
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
            ->expects($this->once())
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
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn(null)
        ;
        $objItem5
            ->method('__get')
            ->with('quantity')
            ->willReturn(5)
        ;

        // Set the items in the mock Cart object
        $objCart
            ->expects($this->once())
            ->method('getItems')
            ->willReturn([$objItem1, $objItem2, $objItem3, $objItem4, $objItem5])
        ;

        // Call the sumSiblings method
        $this->helper = new Helper($this->mockContaoFramework());

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

        // Test if the method manageStockAndReturnSurplus returns 0
        $this->helper = new Helper($this->mockContaoFramework());

        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 1));
    }

    public function testManageStockAndReturnSurplusZeroWhenQuantityIsEmpty(): void
    {
        // Mock a product, quantity empty, any numeric inventory_status
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Test if the method manageStockAndReturnSurplus returns 0
        $this->helper = new Helper($this->mockContaoFramework());

        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 1));
    }

    public function testManageStockAndReturnSurplusReturnsZeroAndSetsInventoryStatusAvailableAndSetsIsToBeReservedFalseWhenQuantityInCartIsLessThanProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];
        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->isToBeReserved = false; // init: nothing is to be reserved

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 2 (that is < 5 )
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 2, $this->isToBeReserved));

        // Assert that product is not to be reserved
        $this->assertFalse($this->isToBeReserved);

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];

        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Assert that the product quantity is still 5
        $this->assertSame('5', $product1->quantity);

        // Assert that the product inventory_status is still AVAILABLE
        $this->assertSame($product1->inventory_status, $this->AVAILABLE);
    }

    public function testManageStockAndReturnSurplusReturnsZeroAndSetsInventoryStatusReservedAndSetsIsToBeReservedTrueWhenQuantityInCartIsEqualToProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->isToBeReserved = false;

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 5
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 5, $this->isToBeReserved));

        // Test if the method manageStockAndReturnSurplus returns IsToBeReserved True when quantityInCart = 5
        $this->assertTrue($this->isToBeReserved);

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];

        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test that the product has changed to RESERVED
        $this->assertSame($product1->inventory_status, $this->RESERVED);
    }

    public function testManageStockAndReturnANonZeroSurplusAndSetInventoryStatusReservedAndSetReservedTrueWhenQuantityInCartIsGreaterThanProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $this->isToBeReserved = false;
        // Mock the adpaters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $this->mockAdapter(['prepare' => $this->mockAdapter(['execute' => $this->mockAdapter(['fetchEach' => 1])])])]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method manageStockAndReturnSurplus returns 2 when quantityInCart = 7
        $this->assertSame(2, $this->helper->manageStockAndReturnSurplus($product, 7, $this->isToBeReserved));

        // Test if the method manageStockAndReturnSurplus returns IsToBeReserved True
        $this->assertTrue($this->isToBeReserved);

        // Get the adapter for the Standard class
        $adapter = $adapters[Standard::class];

        // Get a new instance of the product
        $product1 = $adapter->findPublishedByPk($product->id);

        // Test that the product has changed to RESERVED
        $this->assertSame($product1->inventory_status, $this->RESERVED);
    }
}
