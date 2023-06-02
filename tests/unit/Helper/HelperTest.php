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

use nahati\ContaoIsotopeStockBundle\Helper\Helper;
use Isotope\Model\Product\Standard;
use Contao\Config;
use Contao\Database;

/**
 * Test the Helper class.
 *
 * @covers \nahati\ContaoIsotopeStockBundle\Helper\Helper
 */
class HelperTest extends ContaoTestCase
{
    private $helper;
    private $database;
    private $framework;
    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product in cart, no quantity left */
    private string $SOLDOUT = '4'; /* product sold, no quantity left */

    protected function setUp(): void
    {
        parent::setUp();

        // Mocks a Symfony container with the default configuration of the Contao core extension
        $container = $this->getContainerWithContaoConfiguration('/tmp');

        // Check if the container has been created
        $this->assertInstanceOf('\Symfony\Component\DependencyInjection\ContainerBuilder', $container);

        // Check if the container is working
        $this->assertEquals($container->getParameter('contao.upload_path'), "files");
        $this->assertEquals($container->getParameter('kernel.project_dir'), "/tmp");

        // Mock a class with properties
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);

        // Mock an adapter 
        $adapter = $this->mockAdapter(['findById']);
        $adapter
            ->method('findById')
            ->willReturn($product);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertEquals($product->id, 1);
        $this->assertEquals($product->name, 'foo');

        // Mock a framework
        $this->framework = $this->mockContaoFramework([Standard::class => $adapter]);
        $this->assertInstanceOf('Contao\CoreBundle\Framework\ContaoFramework', $this->framework);

        // Initialize the framework
        $this->framework
            ->expects($this->atLeastOnce())
            ->method('initialize');
        $this->framework->initialize();

        // get the config adapter
        $config = $this->framework->getAdapter(Config::class);
        $this->assertEquals('Y-m-d H:i', $config->get('datimFormat'));

        // Mock method getTable()
        $product
            ->method('getTable')
            ->willReturn('tl_iso_product');

        // Create a mock for the Database class
        $this->database = $this->getMockBuilder(Database::class)
            ->disableOriginalConstructor()
            ->getMock();
        /** @var Database $database 
         */
        $database = $this->database;
        $this->helper = new Helper($database);
        // Test if the helper class is instantiated
        $this->assertInstanceOf('nahati\ContaoIsotopeStockBundle\Helper\Helper', $this->helper);
    }

    // Dummy Test
    public function testTrueIsTrue()
    {
        $foo = true;
        $this->assertTrue($foo);
    }

    // Test the method checkStockmanagement
    public function testCheckStockmanagementReturnsFalseWhenInventoryStatusIsNotSetAndQuantityIsNotSet()
    {
        // Mock a product, inventory_status is not set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertEquals($product->id, 1);
        $this->assertEquals($product->name, 'foo');
        // Test if the method checkStockmanagement returns false
        $this->assertFalse($this->helper->checkStockmanagement($product));
    }

    // Test the method checkStockmanagement
    public function testCheckStockmanagementThrowsInvalidArgumentExceptionWhenInventoryStatusIsNotSetButQuantityIsSet()
    {

        // Mock a product, inventory_status is not set, quantity is set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '1']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertEquals($product->id, 1);
        $this->assertEquals($product->name, 'foo');
        $this->assertEquals($product->quantity, '1');
        // Test if an InvalidArgumentException is thrown
        $product->method('getName')->willReturn('foo');
        $GLOBALS['TL_LANG']['ERR']['inventoryStatusInactive'] = 'inventory_status not activated for product %s';
        $this->expectException(\InvalidArgumentException::class); // expect Exception
        $this->expectExceptionMessage('inventory_status not activated for product foo'); // expect Exception Message
        $this->helper->checkStockmanagement($product);
    }

    // Test the method checkStockmanagement
    public function testCheckStockmanagementReturnsTrueWhenInventoryStatusIsSet()
    {
        // Mock a product, inventory_status is set
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'inventory_status' => '1']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertEquals($product->id, 1);
        $this->assertEquals($product->name, 'foo');
        $this->assertEquals($product->inventory_status, '1');
        // Test if the method checkStockmanagement returns true
        $this->assertTrue($this->helper->checkStockmanagement($product));
    }


    // Test the method isSoldout
    public function testIsSoldoutReturnsTrueWhenQuantityIsZero()
    {
        // Mock a product, quantity zero
        $product = $this->mockClassWithProperties(Standard::class, ['id' => 1, 'name' => 'foo', 'quantity' => '0', 'inventory_status' => '2']);
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $product);
        $this->assertEquals($product->id, 1);
        $this->assertEquals($product->name, 'foo');
        $this->assertEquals($product->quantity, '0');
        $this->assertEquals($product->inventory_status, '2');
        $product->method('getName')->willReturn('foo');

        $statementMock = $this->getMockBuilder(Database\Statement::class)
            ->disableOriginalConstructor()
            ->getMock();
        $statementMock->expects($this->once())
            ->method('execute')
            ->with($this->equalTo($this->SOLDOUT, $product->id));

        $this->database
            ->expects($this->once())
            ->method('prepare')
            ->with($this->equalTo('UPDATE tl_iso_product SET inventory_status = ? WHERE id = ?'))
            ->willReturn($statementMock);
        $GLOBALS['TL_LANG']['MSC']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        // Test if the method isSoldout returns true
        $this->assertTrue($this->helper->isSoldout($product));
    }
}
