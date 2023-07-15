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
    private Cart $objCart;
    private mixed $arrSet;
    private mixed $return;

    // private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
    private string $RESERVED = '3'; /* product reserved, not available for more sales */
    private string $SOLDOUT = '4'; /* product in cart though soldout */

    /**
     * @param int    $itemId
     * @param int    $quantityInCart
     * @param mixed  $expectedReturn
     * @param int    $productId
     * @param int    $parentProductId                           // optional
     * @param string $expectedInventory_statusOfProduct
     * @param string $expectedInventory_statusOfParentProduct   // optional
     * @param string $expectedInventory_statusOfSiblingProducts // optional
     */
    private function doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct = '', $expectedInventory_statusOfSiblingProducts = ''): void
    {
        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk($itemId, ['return' => 'Model']);

        // Create an arry $arrSet with quantity 1
        $this->arrSet = ['quantity' => $quantityInCart];

        // Instantiate a Listener and call it
        $listener = new UpdateItemInCollectionListener(self::$framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if expected return is returned
        $this->assertSame($this->return, $expectedReturn);

        // Test if product has expected inventory_status
        $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($productId);

        $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfProduct);

        // Asserts only for variant products
        if ($parentProductId > 0) {
            // Test if inventory_status of all siblings (excluding the given product) is as expected
            $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=? AND id!=?')->execute($parentProductId, $productId);

            while ($objResult->next()) {
                $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfSiblingProducts);
            }

            // Test if inventory_status of the parent is as expected
            $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($parentProductId);

            $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfParentProduct);
        }
    }

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

        // Do needed Isotope initializations
        self::DoSomeIsotopeInitializations();
    }

    /**
     * Set the database to an initial state.
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
     * Do needed Isotope initializations.
     */
    private static function DoSomeIsotopeInitializations(): void
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
        // We reset these table BEFORE each test to ensure that each test starts with the same relevant initial state and to enable a database lookup from outside after a single test has run to check the database tables.

        // Instantiate a Cart object with given id
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
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantity(): void
    {
        $itemId = 3112;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 88; // unlimited quantity, AVAILABLE, Bild 1
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = $this->AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAvailableWhenProductIsNotAVariantAndQuantityInCartIsLessThanProductQuantity(): void
    {
        $itemId = 3115;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 100; // quantity 2 , AVAILABLE, Bild 2
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = $this->AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAvailableWhenProductIsNotAVariantAndProductIsReservedAndQuantityInCartIsLessThanProductQuantity(): void
    {
        $itemId = 3116;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 89; // quantity 2, RESERVED, Bild 3
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = $this->AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantity(): void
    {
        $itemId = 3115;
        $quantityInCart = 2;
        $expectedReturn = ['quantity' => 2];
        $productId = 100; // quantity 2 Bild 2
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = $this->RESERVED;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartExceedsProductQuantity(): void
    {
        $itemId = 3115;
        $quantityInCart = 3;
        $expectedReturn = ['quantity' => 2];
        $productId = 100; // quantity 2 Bild 2
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = $this->RESERVED;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group variant_products__unlimited
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsAVariantAndProductAndSiblingsAndParentHaveUnlimitedQuantity(): void
    {
        $itemId = 3117;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 47; // unlimited quantity, AVAILABLE, Variante Original von Skulptur 1
        $parentProductId = 31; //  unlimited quantity, AVAILABLE, Skulptur 1
        $expectedInventory_statusOfProduct = $this->AVAILABLE; // unchanged
        $expectedInventory_statusOfParentProduct = $this->AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = $this->AVAILABLE; // unchanged 

        // item 3118
        // product 46, unlimited, AVAILABLE, Variante Original von Skulptur 1

        // parentProduct 31, unlimited, AVAILABLE, Skulptur 1

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAvailableWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $expectedInventory_statusOfProduct = $this->AVAILABLE;
        $expectedInventory_statusOfParentProduct = $this->AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = $this->AVAILABLE; // unchanged        

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product 32, quantity 4, AVAILABLE, Skulptur 2

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->RESERVED;
        $expectedInventory_statusOfSiblingProducts = $this->RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsFalseAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 1;
        $expectedReturn = false;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 1;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->RESERVED;
        $expectedInventory_statusOfSiblingProducts = $this->RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products
     */
    /**
     * @group quantity_in_cart_is_equal_to_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedReturn = ['quantity' => 2];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 4;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->AVAILABLE;
        $expectedInventory_statusOfSiblingProducts = $this->AVAILABLE;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products
     */
    /**
     * @group quantity_in_cart_is_equal_to_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedReturn = ['quantity' => 2];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->RESERVED;
        $expectedInventory_statusOfSiblingProducts = $this->RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products
     */
    /**
     * @group quantity_in_cart_is_equal_to_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsFalseAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedReturn = false;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->RESERVED;
        $expectedInventory_statusOfSiblingProducts = $this->RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products
     */
    /**
     * @group quantity_in_cart_is_greater_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 3;
        $expectedReturn = ['quantity' => 2];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; // quantity 5, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 5;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = $this->AVAILABLE; // unchanged        

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products
     */
    /**
     * @group quantity_in_cart_is_greater_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 3;
        $expectedReturn = ['quantity' => 2];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; // quantity 5, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 4;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->RESERVED;
        $expectedInventory_statusOfSiblingProducts = $this->RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products
     */
    /**
     * @group quantity_in_cart_is_greater_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 3;
        $expectedReturn = false;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; // quantity 5, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        $expectedInventory_statusOfProduct = $this->RESERVED;
        $expectedInventory_statusOfParentProduct = $this->RESERVED;
        $expectedInventory_statusOfSiblingProducts = $this->RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        self::$databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }
}
