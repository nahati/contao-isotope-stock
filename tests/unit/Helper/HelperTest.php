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
 * @covers \Nahati\ContaoIsotopeStockBundle\Helper\Helper
 */
class HelperTest extends ContaoTestCase
{
    private Helper $helper;
    private mixed $setInventoryStatusTo = null;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    // In setUpBeforeClass() we initialize the neccessary environment once for all tests
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();

        // Do needed Isotope initializations
        self::DoSomeIsotopeInitializations();
    }

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
        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s has changed in the meanwhile, please start again!';
    }

    // // Dummy Test
    // public function testTrueIsTrue(): void
    // {
    //     $foo = true;
    //     $this->assertTrue($foo);
    // }

    // issueErrorMessage(): Did not find a way to test this method
    public function testIssueErrorMessage(): void
    {
        $this->assertTrue(true);
        // TODO: Implement testIssueErrorMessage() method.
    }

    public function testUpdateInventoryDoesExcuteDBQueriesWhenProductWasNotChangedMeanwhile(): void
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

        $this->helper->updateInventory($product, $this->RESERVED);
    }

    public function testUpdateInventoryDoesNotExecuteDBQueriesWhenInventoryStatusWasChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() and the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock a double product with inventory_status SOLDOUT
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->SOLDOUT]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

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

        $this->helper->updateInventory($product, $this->RESERVED);
    }

    public function testUpdateInventoryDoesNotExecuteDBQueriesWhenQuantityWasChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock a double product with inventory_status SOLDOUT and Quantity 0
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

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

        $this->helper->updateInventory($product, $this->RESERVED);
    }

    public function testUpdateInventoryStatusDoesNotExecuteDBQueriesWhenInventoryStatusAndQuantityWereChangedMeanwhile(): void
    {
        // We test if the Database queries have not been executed by mocking the Database adapter and expecting the execute() amd the prepare() method to be called 0 times each

        // Mock a product with inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        // Mock a double product with inventory_status SOLDOUT and Quantity 0
        $productDouble = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => $this->SOLDOUT]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $productDouble);

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

        $this->helper->updateInventory($product, $this->RESERVED);
    }

    public function testUpdateInventoryByQuantityDoesExcuteDBQueriesWhenProductWasNotChangedMeanwhile(): void
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

        $this->helper->updateInventory($product, '', '0');
    }

    public function testUpdateInventoryByQuantityDoesNotExecuteDBQueriesWhenInventoryStatusWasChangedMeanwhile(): void
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

        $this->helper->updateInventory($product, '', '0');
    }

    public function testUpdateInventoryByQuantityDoesNotExecuteDBQueriesWhenQuantityWasChangedMeanwhile(): void
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

        $this->helper->updateInventory($product, '', '0');
    }

    public function testUpdateInventoryByQuantityQuantityDoesNotExecuteDBQueriesWhenInventoryStatusAndQuantityWereChangedMeanwhile(): void
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

        $this->helper->updateInventory($product, '', '0');
    }

    public function testSetParentAndChildProductsReserved(): void
    {
        //We have 1 parent product and 3 variants with inventory-status AVAILABLE; also 1 variant with inventory-status RESERVED and 1 variant with inventory-status SOLDOUT; lastnotleast 1 product with inventory-status AVAILABLE but not child of the parent product

        // We test if the Database queries have been executed by mocking the Database adapter and expecting the execute() and the prepare() method to be called 8 times, once for the parent product and once for each AVAILABLE variant.

        // Create a mock parent product
        $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'pid' => 0, 'inventory_status' => $this->AVAILABLE, 'quantity' => '1', 'name' => 'parentProduct']);

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
            ->expects($this->exactly(8))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(8))
            ->method('execute')
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter([
                'findPublishedBy' => [$objVariant2a, $objVariant2b, $objVariant2c, $objVariant3, $objVariant4],
                'findPublishedByPk' => $this->returnValueMap([
                    [1, $objParentProduct],
                    [1021, $objVariant2a],
                    [1022, $objVariant2b],
                    [1023, $objVariant2c],
                    [103, $objVariant3],
                    [104, $objVariant4],
                    [105, $objProduct5],
                ]),
            ]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->setParentAndChildProductsReserved($objParentProduct);
    }

    public function testSetParentAndSiblingsProductsAvailable(): void
    {
        //We have 1 parent product and 3 variants with inventory-status RESERVED; also 1 variant with inventory-status AVAILABLE and 1 variant with inventory-status SOLDOUT; lastnotleast 1 product with inventory-status RESERVED but not child of the parent product

        // We test if the Database queries have been executed by mocking the Database adapter and expecting the execute() and the prepare() method to be each called 6 times, once for the parent product and once for each RESERVED variant - not including variant1 which is the product in charge.

        // Create a mock parent product
        $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'pid' => 0, 'inventory_status' => $this->RESERVED, 'quantity' => '1', 'name' => 'parentProduct']);

        // Create a mock variant product, child of the parent product
        $objVariant2a = $this->mockClassWithProperties(Standard::class, ['id' => 1021, 'pid' => 1, 'name' => 'variant2a', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant2b = $this->mockClassWithProperties(Standard::class, ['id' => 1022, 'pid' => 1, 'name' => 'variant2b', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant2c = $this->mockClassWithProperties(Standard::class, ['id' => 1023, 'pid' => 1, 'name' => 'variant2c', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant3 = $this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'variant3', 'inventory_status' => $this->AVAILABLE, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant4 = $this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 1, 'name' => 'variant4', 'inventory_status' => $this->SOLDOUT, 'quantity' => '0']);

        // Create a mock product, not a child of the parent product
        $objProduct5 = $this->mockClassWithProperties(Standard::class, ['id' => 105, 'pid' => 2, 'name' => 'product5', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

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
                'findPublishedBy' => [$objVariant2b, $objVariant2c, $objVariant3, $objVariant4],
                'findPublishedByPk' => $this->returnValueMap([
                    [1, $objParentProduct],
                    [1021, $objVariant2a],
                    [1022, $objVariant2b],
                    [1023, $objVariant2c],
                    [103, $objVariant3],
                    [104, $objVariant4],
                    [105, $objProduct5],
                ]),
            ]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->setParentAndSiblingsProductsAvailable($objParentProduct, $objVariant2a->id);
    }

    public function testSetParentAndChildProductsSoldout(): void
    {
        //We have 1 parent product and 3 variants with inventory-status RESERVED; also 1 variant with inventory-status AVAILABLE and 1 variant with inventory-status SOLDOUT; lastnotleast 1 product with inventory-status AVAILABLE but not child of the parent product

        // We test if the Database queries have been executed by mocking the Database adapter and expecting the execute() and the prepare() method each to be called 12 times, once for the parent product and once for each variant.

        // Create a mock parent product
        $objParentProduct = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'pid' => 0, 'inventory_status' => $this->RESERVED, 'quantity' => '1', 'name' => 'parentProduct']);

        // Create a mock variant product, child of the parent product
        $objVariant2a = $this->mockClassWithProperties(Standard::class, ['id' => 1021, 'pid' => 1, 'name' => 'variant2a', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant2b = $this->mockClassWithProperties(Standard::class, ['id' => 1022, 'pid' => 1, 'name' => 'variant2b', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant2c = $this->mockClassWithProperties(Standard::class, ['id' => 1023, 'pid' => 1, 'name' => 'variant2c', 'inventory_status' => $this->RESERVED, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant3 = $this->mockClassWithProperties(Standard::class, ['id' => 103, 'pid' => 1, 'name' => 'variant3', 'inventory_status' => $this->AVAILABLE, 'quantity' => '1']);

        // Create a mock variant product, child of the parent product
        $objVariant4 = $this->mockClassWithProperties(Standard::class, ['id' => 104, 'pid' => 1, 'name' => 'variant4', 'inventory_status' => $this->SOLDOUT, 'quantity' => '0']);

        // Create a mock product that is not a child of the parent product
        $objProduct5 = $this->mockClassWithProperties(Standard::class, ['id' => 2, 'pid' => 0, 'inventory_status' => $this->AVAILABLE, 'quantity' => '1', 'name' => 'product5']);

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
            ->expects($this->exactly(12))
            ->method('prepare')
            ->willReturnSelf()
        ;
        $databaseAdapterMock
            ->expects($this->exactly(12))
            ->method('execute')
        ;

        $adapters = [
            Standard::class => $this->mockConfiguredAdapter([
                'findPublishedBy' => [$objVariant2a, $objVariant2b, $objVariant2c, $objVariant3, $objVariant4],
                'findPublishedByPk' => $this->returnValueMap([
                    [1, $objParentProduct],
                    [1021, $objVariant2a],
                    [1022, $objVariant2b],
                    [1023, $objVariant2c],
                    [103, $objVariant3],
                    [104, $objVariant4],
                    [105, $objProduct5],
                ]),
            ]),
            Database::class => $this->mockConfiguredAdapter(['getInstance' => $databaseAdapterMock]),
        ];

        $this->helper = new Helper($this->mockContaoFramework($adapters));

        $this->helper->setParentAndChildProductsSoldout($objParentProduct);
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
        $product
            ->method('getName')
            ->willReturn('foo')
        ;
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertSame($product->getName(), 'foo');

        $this->helper = new Helper($this->mockContaoFramework());

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

    public function testManageStockAndReturnSurplusReturnsZeroAndSetsInventoryStatusAvailableAndSetsSetInventoryStatusToAvailableWhenQuantityInCartIsLessThanProductQuantity(): void
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

        $this->setInventoryStatusTo = null; // init

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 2 (that is < 5 )
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 2, $this->setInventoryStatusTo));

        // Assert that product is not to be reserved
        $this->assertSame($this->AVAILABLE, $this->setInventoryStatusTo);
    }

    public function testManageStockAndReturnSurplusReturnsZeroAndSetsInventoryStatusReservedAndSetssetInventoryStatusToReservedWhenQuantityInCartIsEqualToProductQuantity(): void
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

        $this->setInventoryStatusTo = false;

        // Test if the method manageStockAndReturnSurplus returns 0 when quantityInCart = 5
        $this->assertSame(0, $this->helper->manageStockAndReturnSurplus($product, 5, $this->setInventoryStatusTo));

        // Test if the method manageStockAndReturnSurplus returns setInventoryStatusTo True when quantityInCart = 5
        $this->assertSame($this->RESERVED, $this->setInventoryStatusTo);
    }

    public function testManageStockAndReturnANonZeroSurplusAndSetInventoryStatusReservedAndSetsSetInventoryStatusToReservedWhenQuantityInCartIsGreaterThanProductQuantity(): void
    {
        // Mock a product, quantity 5, inventory_status AVAILABLE
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '5', 'inventory_status' => $this->AVAILABLE]);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);

        $this->setInventoryStatusTo = false;

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
        $this->assertSame(2, $this->helper->manageStockAndReturnSurplus($product, 7, $this->setInventoryStatusTo));

        // Test if the method manageStockAndReturnSurplus returns setInventoryStatusTo True
        $this->assertSame($this->RESERVED, $this->setInventoryStatusTo);
    }
}
