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
use Contao\TestCase\FunctionalTestCase;
use Isotope\Model\Product;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\Model\ProductType;
use Nahati\ContaoIsotopeStockBundle\EventListener\UpdateItemInCollectionListener;

/**
 * Integration-Test of the UpdateItemInCollectionListener class.
 */
class UpdateItemInCollectionListenerTest extends FunctionalTestCase
{
    /**
     * @var ContaoFramework
     */
    private static $framework;

    /**
     * @var Adapter<Database>
     */
    private static $databaseAdapter;

    private ProductCollectionItem $objItem;
    private Standard $objProduct;
    private Cart $objCart;
    private mixed $arrSet;
    private mixed $return;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product reserved, not available for more sales */
    private string $SOLDOUT = '4'; /* product in cart though soldout */

    // In setUpBeforeClass() we initialize the neccessary environment once for all tests
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();

        static::bootKernel();

        // Initialize the Contao framework
        self::$framework = static::getContainer()->get('contao.framework');
        self::$framework->initialize();

        // Reset the database to initial state
        self::$databaseAdapter = self::$framework->getAdapter(Database::class);
        self::resetDatabase();

        self::setIsotopeSpecificThings();
    }

    /**
     * Set the database to an initial status.
     */
    private static function resetDatabase(): void
    {
        // Drop all tables
        foreach (self::$databaseAdapter->getInstance()->listTables() as $table) {
            $sql = 'DROP TABLE IF EXISTS ' . $table;
            self::$databaseAdapter->getInstance()->execute($sql);
        }

        // Create tables and insert data
        self::loadFixture('ContaoIsotopeStockBundleTest-initial.sql');
    }

    /**
     * Reset relevant tables of the database to the initial state.
     */
    private function resetRelevantDatabaseTables(): void
    {
        // Reset ProductCollectionItem-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection_item';
        self::$databaseAdapter->getInstance()->execute($sql);
        self::loadFixture('tl_iso_product_collection_item-initial.sql');

        // Reset Product-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product';
        self::$databaseAdapter->getInstance()->execute($sql);
        self::loadFixture('tl_iso_product-initial.sql');

        // Reset ProductCollection-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection';
        self::$databaseAdapter->getInstance()->execute($sql);
        self::loadFixture('tl_iso_product_collection-initial-265.sql');
    }

    /**
     * Builds an sql query to load the database tables into the database
     * Files are located in the Fixtures folder and have been exported from the initial database.
     */
    private static function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

        self::$databaseAdapter->getInstance()->execute($sql);
    }

    /**
     * Sets the necessary Isotope specific variables for the tests
     * This seems a bit strange to me, as it's all already declared in Isotope or this extension.
     */
    private static function setIsotopeSpecificThings(): void
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

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s" has changed in the meanwhile, please start again!';
    }

    /**
     * setup() is called for each Testcase and contains an additional setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        parent::setUp();

        // Initialize the Contao framework
        self::$framework = static::getContainer()->get('contao.framework');
        self::$framework->initialize();

        // Get a database adpater and reset relevant tables
        self::$databaseAdapter = self::$framework->getAdapter(Database::class);
        $this->resetRelevantDatabaseTables();
        // We reset these table BEFORE each test to ensure that each test starts with the same relevant initial state and to enable a database lookup from outside after a test has run to check the database tables.

        // Instantiate a Cart object with given id
        $this->objCart = Cart::findByPk('265');

        // Check if Cart object exists
        $this->assertNotNull($this->objCart);
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     */
    protected function tearDown(): void
    {
        parent::tearDown();
    }

    // public function testTrueIsTrue(): void
    // {
    //     $this->assertTrue(true);
    // }

    /**
     * THIS-REMARK-DEFINES-THE-START-OF-A-SECTION-OF-TESTS-WITH-NON-VARIANT-PRODUCTS.
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantity(): void
    {
        // Cart 265
        // Item 3112
        // product 88: unlimited quantity Bild 1
        // quantity in Cart 1

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3112');

        // Create an arry $arrSet with quantity 1
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAvailableWhenProductIsNotAVariantAndQuantityInCartIsLessThanProductQuantity(): void
    {
        // Cart 265
        // Item 3115
        // product 100: quantity 2 , AVAILABLE, Bild 2
        // quantity in Cart 1

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3115');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 1)
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);

        // The following does not work, because the method findByPk() does not return the current state of the database, probably because it does not reflect any changes that have been made to the product outside of the current transaction or connection.
        // $this->objProduct = Standard::findByPk('100');
        // $this->assertSame($this->objProduct->inventory_status, $this->RESERVED);

        // Therefore we use the DatabaseAdapter to get the current state of the database.
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(100);

        // Test if inventory_status of the product is AVAILABLE
        $this->assertSame($objResult->inventory_status, $this->AVAILABLE);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsAvailableWhenProductIsNotAVariantAndProductIsReservedAndQuantityInCartIsLessThanProductQuantity(): void
    {
        // Cart 265
        // Item 3116
        // Product 89: quantity 2, RESERVED, Bild 3
        // Quantity in Cart 1

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3116');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 1)
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);

        // Test if inventory_status of the product is still AVAILABLE
        $this->objProduct = Standard::findByPk('89');
        $this->assertSame($this->objProduct->inventory_status, $this->AVAILABLE);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantity(): void
    {
        // Cart 265
        // Item 3115
        // product 100: quantity 2 Bild 2
        // quantity in Cart 2

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3115');

        // Create an arry $arrSet with quantity 2 (quantity in Cart is 2)
        $this->arrSet = ['quantity' => 2];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 2]);

        // Therefore we use the DatabaseAdapter to get the current state of the database.
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(100);

        // Test if inventory_status of the product has been set to RESERVED
        $this->assertSame($objResult->inventory_status, $this->RESERVED);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartExceedsProductQuantity(): void
    {
        // Cart 265
        // Item 3115
        // product 100: quantity 2 Bild 2
        // quantity in Cart 3

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3115');

        // This Item belongs to product 100 with quantity 2, inventory_status AVAILABLE

        // Create an arry $arrSet with quantity 3 (quantity in Cart is 3)
        $this->arrSet = ['quantity' => 3];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned with reduced quantity
        $this->assertSame($this->return, ['quantity' => 2]);

        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(100);

        // Test if inventory_status of the product has been set to RESERVED
        $this->assertSame($objResult->inventory_status, $this->RESERVED);
    }

    /**
     * THIS_REMARK_DEFINES_THE_START_OF_A_SECTION_OF_TESTS_WITH_VARIANT_PRODUCTS_WHERE_EVERYTHING_IS_UNLIMITED.
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsAVariantAndProductAndSiblingsAndParentHaveUnlimitedQuantity(): void
    {
        // Cart 265
        // Item 3117
        // product 47: unlimited quantity Variante Original von Skulptur 1
        // quantity in Cart 1

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3117');

        // Create an arry $arrSet with quantity 1
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);
    }

    /**
     * THIS_REMARK_DEFINES_THE_START_OF_A_SECTION_OF_TESTS_WITH_VARIANT_PRODUCTS_WHERE_QUANTITY_IN_CART_IS_LESS_THAN_PRODUCT_QUANTITY.
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAvailableWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantity(): void
    {
        // Cart 265

        // Given Item:
        // Item 3119
        // product 44: quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        // quantity in Cart 1

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product 32, quantity 4, AVAILABLE, Skulptur 2

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3119');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 1)
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);

        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);

        // Test if inventory_status of the product is AVAILABLE
        $this->assertSame($objResult->inventory_status, $this->AVAILABLE);
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantity(): void
    {
        // Cart 265

        // Given Item:
        // Item 3119
        // product 44: quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        // quantity in Cart 1

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product 32, quantity 4, AVAILABLE, Skulptur 2
        // Modify the product data to match this testcase, i.e. set quantity of parent product to 2
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute('2', 32);
        // -> Parent product 32, quantity 2, AVAILABLE, Skulptur 2

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3119');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 1)
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);

        // Test if inventory_status of the product is RESERVED
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);

        // Test if inventory_status of all siblings is RESERVED
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=?')->execute(32);

        while ($objResult->next()) {
            $this->assertSame($objResult->inventory_status, $this->RESERVED);
        }

        // Test if inventory_status of the parent is RESERVED
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(32);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);
    }

    /**
     * Remark: This testcase retuns false, giving the user the responsibility to decide how to change the cart.
     * (The user could - in this constellation - decide to delete the given item from the Cart or delete the sibling item from the Cart.).
     */
    public function testUpdateItemInCollectionListenerReturnsFalseAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        // Cart 265

        // Given Item:
        // Item 3119
        // product 44: quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        // quantity in Cart 1

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product 32, quantity 4, AVAILABLE, Skulptur 2
        // Modify the product data to match this testcase, i.e. set quantity of parent product to 1
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute('1', 32);
        // -> Parent product 32, quantity 1, AVAILABLE, Skulptur 2

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3119');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 1)
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet returns false
        $this->assertFalse($this->return);

        // Test if inventory_status of the product is RESERVED
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);

        // Test if inventory_status of all siblings is RESERVED
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=?')->execute(32);

        while ($objResult->next()) {
            $this->assertSame($objResult->inventory_status, $this->RESERVED);
        }

        // Test if inventory_status of the parent is RESERVED
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(32);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);
    }

    /**
     * THIS_REMARK_DEFINES_THE_START_OF_A_SECTION_OF_TESTS_WITH_VARIANT_PRODUCTS_WHERE_QUANTITY_IN_CART_IS_EQUAL_TO_PRODUCT_QUANTITY.
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantity(): void
    {
        // Cart 265

        // Given Item:
        // Item 3119
        // product 44: quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        // quantity in Cart 2

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product 32, quantity 4, AVAILABLE, Skulptur 2

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3119');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 2)
        $this->arrSet = ['quantity' => 2];

        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 2]);

        // Test if inventory_status of the product is RESERVED
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);

        // Test if inventory_status of all siblings (excluding the product in charge) is unchanged
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=? AND id!=?')->execute(32, 44);

        while ($objResult->next()) {
            $this->assertSame($objResult->inventory_status, $this->AVAILABLE);
        }

        // Test if inventory_status of the parent is AVAILABLE
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(32);
        $this->assertSame($objResult->inventory_status, $this->AVAILABLE);
    }
}
