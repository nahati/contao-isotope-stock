<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\Tests\Integration\EventListener;

use Contao\CoreBundle\Framework\Adapter;
use Contao\CoreBundle\Framework\ContaoFramework;
use Contao\Database;
use Contao\System;
use Contao\TestCase\FunctionalTestCase;
use Isotope\Model\Product;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\Model\ProductType;
use Nahati\ContaoIsotopeStockBundle\EventListener\PostDeleteItemFromCollectionListener;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Integration-Test of the PostDeleteItemFromCollectionListener class.
 */
class PostDeleteItemFromCollectionListenerTest extends FunctionalTestCase
{
    private ContaoFramework $framework;

    /**
     * @var Adapter<Database>
     */
    private $databaseAdapter;

    private ProductCollectionItem $objItem;
    private Cart $objCart;

    /**
     * setup() is called for each Testcase and contains an additional setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        parent::setUp();

        $ifcKernel = static::bootKernel();

        $container = $ifcKernel->getContainer();
        System::setContainer($container);

        // Initialize the Contao Framework
        $this->framework = $container->get('contao.framework');
        $this->framework->initialize();

        // Get a database adpater and reset relevant tables
        $this->databaseAdapter = $this->framework->getAdapter(Database::class);

        $this->resetRelevantDatabaseTables();
        // We reset these table BEFORE each test to ensure that each test starts with the same relevant initial state and to enable a database lookup from outside after a single test has run to check the database tables.

        // Do Needed Initializations
        $this->doNeededInitializations();

        // Instantiate a Cart object with given id
        // This cart is of logged-in member test@test.de
        $this->objCart = Cart::findByPk('265', ['return' => 'Model']);

        // Check if Cart object exists
        $this->assertNotNull($this->objCart);
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     */
    protected function tearDown(): void
    {
        parent::tearDown();

        unset($this->databaseAdapter, $this->framework, $this->objItem, $this->objCart);
    }

    /**
     * Reset relevant tables of the database to the initial state.
     */
    private function resetRelevantDatabaseTables(): void
    {
        // Reset ProductCollectionItem-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection_item';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection_item-initial.sql');

        // Reset Product-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product-initial.sql');

        // Reset ProductCollection-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection-initial.sql');
    }

    /**
     * Builds an sql query to load the database tables into the database
     * Files are located in the Fixtures folder and have been exported from the initial database.
     */
    private function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

        $this->databaseAdapter->getInstance()->execute($sql);
    }

    /**
     * Do Needed Initializations.
     */
    private function doNeededInitializations(): void
    {
        // These assignments link the tables with the model classes. Now you can use the model classes to access and manipulate the data in the tables.
        $GLOBALS['TL_MODELS']['tl_iso_producttype'] = ProductType::class;
        $GLOBALS['TL_MODELS']['tl_iso_product'] = Standard::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection'] = ProductCollection::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection_item'] = ProductCollectionItem::class;

        Product::registerModelType('standard', Standard::class);

        // Declare additional fields for tl_iso_product that are declared in the extension
        $GLOBALS['TL_DCA']['tl_iso_product']['fields']['inventory_status'] = [
            'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['inventory_status'],
            'reference' => &$GLOBALS['TL_LANG']['MSC'],
            'filter' => true,
            'search' => true,
            'inputType' => 'radio',
            'options' => ['1', '2', '3', '4'],
            'eval' => ['feEditable' => true, 'feViewable' => true, 'tl_class' => 'w50'],
            'attributes' => ['legend' => 'general_legend', 'fe_filter' => true, 'fe_search' => true, 'fe_sorting' => true],
            'sql' => "char(1) NOT NULL default '2'",
        ];
        $GLOBALS['TL_DCA']['tl_iso_product']['fields']['quantity'] = [
            'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['quantity'],
            'filter' => true,
            'sorting' => true,
            'inputType' => 'text',
            'eval' => ['mandatory' => false, 'doNotShow' => false, 'tl_class' => 'w50'],
            'attributes' => ['legend' => 'general_legend', 'multilingual' => false, 'fe_sorting' => true],
            'sql' => "varchar(255) NOT NULL default ''",
        ];

        $GLOBALS['TL_DCA']['tl_iso_product']['attributes'] = [];

        // This is a copy from tl_iso_collection_item.php
        $GLOBALS['TL_DCA']['tl_iso_product_collection_item']['fields']['pid'] = [
            'foreignKey' => 'tl_iso_product_collection.document_number',
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'belongsTo', 'load' => 'lazy'],
        ];

        // Declare additional messages that are declared in the extension
        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['parentQuantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['adaptCart'] = 'Adapt the "%s" and related variants in cart by their quantity!';

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '"%s" has changed in the meanwhile, please start again!';

        $GLOBALS['TL_LANG']['ERR']['parentQuantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['variantQuantityNotAvailable'] = 'The maximum available quantity for a variant of "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['productOutOfStock'] = 'The product "%s" is currently out of stock';
    }

    /**
     * @param int    $itemId
     * @param int    $productId
     * @param string $expectedInventory_statusOfProduct
     */
    private function doTest($itemId, $productId, $expectedInventory_statusOfProduct): void
    {
        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk($itemId, ['return' => 'Model']);

        // Instantiate a Listener and call it
        $listener = new PostDeleteItemFromCollectionListener($this->framework);

        $listener($this->objItem, $this->objCart);

        // Test if product has expected inventory_status
        $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($productId);

        $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfProduct);
    }

    /**
     * This test I began with to check if tests can be run.
     */
    // public function testTrueIsTrue(): void
    // {
    //     $this->assertTrue(true);
    // }

    /**
     * @group non-variant_products
     */
    public function testPostDeleteItemFromCollectionListenerDoesNotChangeInventoryStatusWhenProductIsNotAVariantProductQuantityIsGreaterThanZeroAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3116;
        $productId = 89; // quantity 2, RESERVED, Bild 3
        $expectedInventory_statusOfProduct = Helper::RESERVED;

        $this->doTest($itemId, $productId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testPostDeleteItemFromCollectionListenerSetsProductSoldoutWhenProductIsNotAVariantAndProductQuantityIsZeroAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3116;
        $productId = 89; // quantity 0, AVAILABLE, Bild 3
        $quantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;

        // Product initially has a quantity of 2, so we change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $this->doTest($itemId, $productId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testPostDeleteItemFromCollectionListenerDoesNotChangeInventoryStatusWhenProductIsNotAVariantAndProductQuantityIsEmpty(): void
    {
        $itemId = 3116;
        $productId = 89; // quantity 0, RESERVED, Bild 3
        $quantityOfProduct = '';
        $expectedInventory_statusOfProduct = Helper::RESERVED;

        // Product initially has a quantity of 2, so we change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $this->doTest($itemId, $productId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group variant_products
     */
    public function testPostDeleteItemFromCollectionListenerDoesNotChangeInventoryStatusWhenProductIsAVariantAndProductQuantityIsGreaterThanZeroAndParentIsNotSoldoutAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $productId = 44; // quantity 2 , RESERVED, Variante Kopie Skulptur 2
        $inventoryStatusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;

        // Product initially has an inventory_status of AVAILABLE, so we change the inventory_status of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute($inventoryStatusOfProduct, $productId);

        $this->doTest($itemId, $productId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group variant_products
     */
    public function testPostDeleteItemFromCollectionListenerSetsProductSoldoutWhenProductIsAVariantAndProductQuantityIsGreaterThanZeroAndParentIsSoldoutAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, SOLDOUT, Skulptur 2
        $inventoryStatusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;

        // Parent product initially has an inventory_status of AVAILABLE, so we change the inventory_status of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute($inventoryStatusOfParentProduct, $parentProductId);

        $this->doTest($itemId, $productId, $expectedInventory_statusOfProduct);
    }
}
