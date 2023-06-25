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
use Isotope\Message;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Test the Helper class.
 *
 * We use adapters for the Contao classes to be able to mock them in the tests.
 *
 * In a code version where database queries are prevented by issuing the save() method on the product object, the tests will be different and more meaningful. Updates could then be checked by comparing the product object before and after the update. The save() method needs not to be mocked then. We gave up this approach as of advice from the Contao community. See https://community.contao.org/de/showthread.php?85293-Update-eines-Produkts&p=573595&viewfull=1#post573595
 *
 * @covers \Nahati\ContaoIsotopeStockBundle\Helper\Helper
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

    public function testUpdateInventoryStatusDoesExcuteDBQueriesWhenProductWasNotChangedMeanwhile(): void
    {
        // We test if the Database queries have been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called each 2 times.

        // Mock a product with inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute')
            ->willReturn(true)
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateInventoryStatus($product, $this->RESERVED);

        // Here we would like to check if the product object has been updated correctly. Mocking the database adapter does not allow us to do so as far as we could see.
    }

    public function testUpdateInventoryStatusDoesNotExecuteDBQueriesWhenInventoryStatusWasChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE and method getName()
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        // $product
        //     ->method('getName')
        //     ->willReturn('foo')
        // ;

        // Mock a double product with inventory_status SOLDOUT
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->SOLDOUT]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s has changed in the meanwhile, please start again!';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $productDouble]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateInventoryStatus($product, $this->RESERVED);

        // Here we would like to check if the product object has NOT been updated. Mocking the database adapter does not allow us to do so as far as we could see.

        // Also testing if a message has been issued seems difficult, as the addError() method is static and cannot be mocked.
    }

    public function testUpdateInventoryStatusDoesNotExecuteDBQueriesWhenQuantityWasChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE and method getName()
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        // $product
        //     ->method('getName')
        //     ->willReturn('foo')
        // ;

        // Mock a double product with inventory_status SOLDOUT and Quantity 0
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s has changed in the meanwhile, please start again!';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $productDouble]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateInventoryStatus($product, $this->RESERVED);
    }

    public function testUpdateInventoryStatusDoesNotExecuteDBQueriesWhenInventoryStatusAndQuantityWereChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE and method getName()
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock a double product with inventory_status SOLDOUT and Quantity 0
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->SOLDOUT]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s has changed in the meanwhile, please start again!';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $productDouble]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateInventoryStatus($product, $this->RESERVED);
    }

    public function testUpdateQuantityDoesExcuteDBQueriesWhenProductWasNotChangedMeanwhile(): void
    {
        // We test if the Database queries have been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called each 2 times.

        // Mock a product with inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute')
            ->willReturn(true)
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateQuantity($product, '0');
    }

    public function testUpdateQuantityDoesNotExecuteDBQueriesWhenInventoryStatusWasChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE and method getName()
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock a double product with inventory_status SOLDOUT
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->SOLDOUT]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s has changed in the meanwhile, please start again!';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $productDouble]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateQuantity($product, '0');
    }

    public function testUpdateQuantityDoesNotExecuteDBQueriesWhenQuantityWasChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE and method getName()
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock a double product with inventory_status SOLDOUT and Quantity 0
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s has changed in the meanwhile, please start again!';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $productDouble]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateQuantity($product, '0');
    }

    public function testUpdateQuantityDoesNotExecuteDBQueriesWhenInventoryStatusAndQuantityWereChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE and method getName()
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock a double product with inventory_status SOLDOUT and Quantity 0
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->SOLDOUT]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s has changed in the meanwhile, please start again!';

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(0))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        // Mock the adapters for the framework
        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $productDouble]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->updateQuantity($product, '0');
    }

    public function testSetAvailableVariantsReserved(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 6 times each, once for each variant

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

        //Test should also include $product5 to be sufficient, but we simplify for now
        // TODO: test with $product5 included and check if it is not updated
        // // Create a mock product, not a child of the parent product
        // $objProduct5 = $this->mockClassWithProperties(Standard::class, ['id' => 105, 'pid' => 2, 'name' => 'product5', 'inventory_status' => $this->AVAILABLE, 'quantity' => '1']);

        //We have 3 variants with inventory-status AVAILABLE; also 1 variant with inventory-status RESERVED and 1 variant with inventory-status SOLDOUT; lastnotleast 1 product with inventory-status AVAILABLE but not child of the parent product

        // Mock the adapters for the framework

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(6))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(6))
            ->method('execute')
        ;

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
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->setAvailableVariantsReserved($objParentProduct);
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

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method isSoldout returns true
        $this->assertTrue($this->helper->isSoldout($product));
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

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method isSoldout returns true
        $this->assertTrue($this->helper->isSoldout($product));
    }

    public function testIsSoldoutReturnsFalseWhenQuantityIsNotZeroAndInventoryStatusIsNotSoldout(): void
    {
        // Mock a product, quantity 1, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method isSoldout returns false
        $this->assertFalse($this->helper->isSoldout($product));
    }

    public function testSumSiblingsWhenThereAreVariantsInCartAndAlsoNonVariantsAndAlsoItemsWithoutProduct(): void
    {
        // Create a mock Cart object
        $objCart = $this->getMockBuilder(Cart::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $objProduct1 = $this->mockClassWithProperties(Standard::class, ['id' => 101, 'pid' => 1, 'name' => 'product1']);

        // Create mock Item objects
        $objItem1 = $this->getMockBuilder(ProductCollectionItem::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $objItem1
            ->expects($this->once())
            ->method('getProduct')
            ->willReturn($objProduct1)
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
        $sum = $this->helper->sumSiblings($objProduct1, $objCart, 1, $anzSiblingsInCart);

        // Assert the result
        $this->assertSame(5, $sum);
        $this->assertSame(2, $anzSiblingsInCart);
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

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->isToBeReserved = false; // init: nothing is to be reserved

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 2 (that is < 5 )
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 2, $this->isToBeReserved));

        // Assert that product is not to be reserved
        $this->assertFalse($this->isToBeReserved);
    }

    public function testManageStockAndReturnSurplusReturnsZeroAndSetsInventoryStatusReservedAndSetsIsToBeReservedTrueWhenQuantityInCartIsEqualToProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->isToBeReserved = false;

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 5
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 5, $this->isToBeReserved));

        // Test if the method manageStockAndReturnSurplus returns IsToBeReserved True when quantityInCart = 5
        $this->assertTrue($this->isToBeReserved);
    }

    public function testManageStockAndReturnANonZeroSurplusAndSetInventoryStatusReservedAndSetReservedTrueWhenQuantityInCartIsGreaterThanProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $this->isToBeReserved = false;

        $databaseAdapterMock = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;
        $databaseAdapterMock
            ->method('getInstance')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(2))
            ->method('execute')
        ;

        $messageAdapterMock = $this->getMockBuilder(Message::class)
            ->disableOriginalConstructor()
            ->getMock()
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter(['findPublishedByPk' => $product]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
            Message::class => $this->mockConfiguredAdapter(['addError' => $messageAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        // Test if the method manageStockAndReturnSurplus returns 2 when quantityInCart = 7
        $this->assertSame(2, $this->helper->manageStockAndReturnSurplus($product, 7, $this->isToBeReserved));

        // Test if the method manageStockAndReturnSurplus returns IsToBeReserved True
        $this->assertTrue($this->isToBeReserved);
    }
}
