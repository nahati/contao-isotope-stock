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
 * Test the UpdateItemInCollectionListener class.
 */
class UpdateItemInCollectionListenerTest extends FunctionalTestCase
{
    private ContaoFramework $framework;

    /**
     * @var Adapter<Database>
     */
    private $databaseAdapter;

    private ProductCollectionItem $objItem;
    private Cart $objCart;
    private mixed $arrSet;

    private Standard $objProduct;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product reserved, not available for more sales */
    private string $SOLDOUT = '4'; /* product in cart though soldout */

    private mixed $return;

    // In constructor we initialize the neccessary environment once for all tests
    public function __construct()
    {
        parent::__construct();

        static::bootKernel();

        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->databaseAdapter = $this->framework->getAdapter(Database::class);

        // $this->resetDatabase();

        // These assignments link the tables with the model classes. Now you can use the model classes to access and manipulate the data in the tables.
        $GLOBALS['TL_MODELS']['tl_iso_producttype'] = ProductType::class;
        $GLOBALS['TL_MODELS']['tl_iso_product'] = Standard::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection'] = ProductCollection::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection_item'] = ProductCollectionItem::class;

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

        // we need this to run the tests (don't ask why;-))
        $GLOBALS['TL_DCA']['tl_iso_product']['attributes'] = [];

        // Declare additional messages that are declared in the extension
        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';
        $GLOBALS['TL_LANG']['ERR']['parentQuantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['adaptCart'] = 'Adapt the "%s" and related variants in cart by their quantity!';

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '%s" has changed in the meanwhile, please start again!';

        // Deklariere die Relations von tl_product_collectiom_item.pid als kopie aus tl_iso_collection_item.php,
        // weil sonst der Fehler "Exception: Field tl_iso_product_collection_item.pid does not seem to be related" geworfen wird

        // Declare this field-relation to run the testsss (don't ask why;-)
        $GLOBALS['TL_DCA']['tl_iso_product_collection_item']['fields']['pid'] = [
            'foreignKey' => 'tl_iso_product_collection.document_number',
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'belongsTo', 'load' => 'lazy'],
        ];

        // This is neccessary to run the tests (don't ask why;-)
        Product::registerModelType('standard', Standard::class);
    }

    /**
     * Buils an sql query to load the database tables into the database
     * Files are located in the Fixtures folder and have been exported from the initial database.
     */
    private function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

        $this->databaseAdapter->getInstance()->execute($sql);
    }

    /**
     * Set the database to an initial status.
     *
     * */
    private function resetDatabase(): void
    {
        // Drop all tables
        foreach ($this->databaseAdapter->getInstance()->listTables() as $table) {
            $sql = 'DROP TABLE IF EXISTS ' . $table;
            $this->databaseAdapter->getInstance()->execute($sql);
        }

        // Create tables and insert data
        $this->loadFixture('ContaoIsotopeStockBundleTest-initial.sql');
    }

    /**
     * setup() is called for each Testcase and contains the basic setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        // We do these table resets BEFORE each test to ensure that each test starts with the same relevant initial state and for reasons described in the comments of teardown()

        // Reset Product-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product-initial.sql');

        // Reset ProductCollection-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection-initial-265.sql');

        // Reset ProductCollectionItem-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection_item';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection_item-initial.sql');

        parent::setUp();

        // Instantiate a Cart object with given id
        $this->objCart = Cart::findByPk('265');

        // Check if Cart object exists
        $this->assertNotNull($this->objCart);
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     *
     * We do NOT reset the database tables here, so it is possible to check the database tables after each single-run test outside of the PHPUnit Test.
     */
    protected function tearDownNow(): void
    {
        parent::tearDown();
    }

    // public function testTrueIsTrue(): void
    // {
    //     $this->assertTrue(true);
    // }

    /**
     * This remark defines the start of a section of tests with non-variant products.
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

        $listener = new UpdateItemInCollectionListener($this->framework);
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

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);

        // The following does not work, because the method findByPk() does not return the current state of the database, probably because it does not reflect any changes that have been made to the product outside of the current transaction or connection.
        // $this->objProduct = Standard::findByPk('100');
        // $this->assertSame($this->objProduct->inventory_status, $this->RESERVED);

        // Therefore we use the DatabaseAdapter to get the current state of the database.
        $databaseAdapter = $this->framework->getAdapter(Database::class);
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(100);

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

        $listener = new UpdateItemInCollectionListener($this->framework);
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

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 2]);

        // Therefore we use the DatabaseAdapter to get the current state of the database.
        $databaseAdapter = $this->framework->getAdapter(Database::class);
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(100);

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

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned with reduced quantity
        $this->assertSame($this->return, ['quantity' => 2]);

        $databaseAdapter = $this->framework->getAdapter(Database::class);
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(100);

        // Test if inventory_status of the product has been set to RESERVED
        $this->assertSame($objResult->inventory_status, $this->RESERVED);
    }

    /**
     * This remark defines the start of a section of tests with variant products where everything is unlimited.
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

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);
    }

    /**
     * This remark defines the start of a section of tests with variant products where QuantityInCartIsLessThanProductQuantity.
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

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);

        $databaseAdapter = $this->framework->getAdapter(Database::class);
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);

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
        $databaseAdapter = $this->framework->getAdapter(Database::class);
        $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute(2, 32);
        // -> Parent product 32, quantity 2, AVAILABLE, Skulptur 2

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3119');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 1)
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);

        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // Test if inventory_status of the product is RESERVED
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);

        // Test if inventory_status of all siblings is RESERVED
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=?')->execute(32);

        while ($objResult->next()) {
            $this->assertSame($objResult->inventory_status, $this->RESERVED);
        }

        // Test if inventory_status of the parent is RESERVED
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(32);
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
        $databaseAdapter = $this->framework->getAdapter(Database::class);
        $databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute(1, 32);
        // -> Parent product 32, quantity 1, AVAILABLE, Skulptur 2

        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3119');

        // Create an arry $arrSet with quantity 1 (quantity in Cart is 1)
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet returns false
        $this->assertFalse($this->return);

        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // Test if inventory_status of the product is RESERVED
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);

        // Test if inventory_status of all siblings is RESERVED
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=?')->execute(32);

        while ($objResult->next()) {
            $this->assertSame($objResult->inventory_status, $this->RESERVED);
        }

        // Test if inventory_status of the parent is RESERVED
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(32);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);
    }

    /**
     * This remark defines the start of a section of tests with variant products where QuantityInCartIsEqual ToProductQuantity.
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

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 2]);

        $databaseAdapter = $this->framework->getAdapter(Database::class);

        // Test if inventory_status of the product is RESERVED
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(44);
        $this->assertSame($objResult->inventory_status, $this->RESERVED);

        // Test if inventory_status of all siblings (excluding the product in charge) is unchanged
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=? AND id!=?')->execute(32, 44);

        while ($objResult->next()) {
            $this->assertSame($objResult->inventory_status, $this->AVAILABLE);
        }

        // Test if inventory_status of the parent is AVAILABLE
        $objResult = $databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(32);
        $this->assertSame($objResult->inventory_status, $this->AVAILABLE);
    }
}
