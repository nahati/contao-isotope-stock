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
use Isotope\Model\Config;
use Isotope\Model\Product;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\Model\ProductType;
use Nahati\ContaoIsotopeStockBundle\EventListener\UpdateItemInCollectionListener;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Integration-Test of the UpdateItemInCollectionListener class.
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
    private mixed $return;

    /**
     * setup() is called for each Testcase.
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

        // Do needed Isotope initializations
        $this->doSomeIsotopeInitializations();

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

        unset($this->databaseAdapter, $this->framework, $this->objCart, $this->objItem, $this->arrSet, $this->return);
    }

    /**
     * Reset relevant tables of the database to the initial state.
     */
    private function resetRelevantDatabaseTables(): void
    {
        // Reset ProductCollectionItem-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection_item';
        $this->databaseAdapter->getInstance()->execute($sql);
        self::loadFixture('tl_iso_product_collection_item-initial.sql');

        // Reset Product-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product';
        $this->databaseAdapter->getInstance()->execute($sql);
        self::loadFixture('tl_iso_product-initial.sql');

        // Reset ProductCollection-table to initial state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection';
        $this->databaseAdapter->getInstance()->execute($sql);
        self::loadFixture('tl_iso_product_collection-initial.sql');
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
     * Do needed Isotope initializations.
     */
    private static function doSomeIsotopeInitializations(): void
    {
        // These assignments link the tables with the model classes. Now you can use the model classes to access and manipulate the data in the tables.
        $GLOBALS['TL_MODELS']['tl_iso_producttype'] = ProductType::class;
        $GLOBALS['TL_MODELS']['tl_iso_product'] = Standard::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection'] = ProductCollection::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection_item'] = ProductCollectionItem::class;
        $GLOBALS['TL_MODELS']['tl_iso_config'] = Config::class;

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
     * @param int    $quantityInCart
     * @param mixed  $expectedReturn
     * @param int    $productId
     * @param int    $parentProductId                         // optional
     * @param string $expectedInventory_statusOfProduct
     * @param string $expectedInventory_statusOfParentProduct // optional
     * @param int    $sibling1Id                              // optional
     * @param string $expectedInventory_statusOfSibling1      // optional
     * @param int    $sibling2Id                              // optional
     * @param string $expectedInventory_statusOfSibling2      // optional
     */
    private function doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct = '', $sibling1Id = 0, $expectedInventory_statusOfSibling1 = '', $sibling2Id = 0, $expectedInventory_statusOfSibling2 = ''): void
    {
        // Instantiate the Item with given id of this Cart
        $this->objItem = ProductCollectionItem::findByPk($itemId, ['return' => 'Model']);

        // Create an arry $arrSet with quantity given in $quantityInCart
        $this->arrSet = ['quantity' => $quantityInCart];

        // Instantiate a Listener and call it
        $listener = new UpdateItemInCollectionListener($this->framework);

        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if expected return is returned
        $this->assertSame($this->return, $expectedReturn);

        // Test if product has expected inventory_status
        $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($productId);

        $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfProduct);

        // Asserts only for variant products
        if ($parentProductId > 0) {
            if ($sibling1Id) {
                // Test if the inventory_status of sibling1 is as expected
                $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($sibling1Id);
                $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfSibling1);
            }

            if ($sibling2Id) {
                // Test if the inventory_status of sibling2 is as expected
                $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($sibling2Id);

                $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfSibling2);
            }

            // Test if inventory_status of the parent is as expected
            $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($parentProductId);

            $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfParentProduct);
        }
    }

    /**
     * Check if quantity of product is zero.
     */
    private function isQuantityOfProductZero(int $productId): bool
    {
        $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($productId);

        return '0' === $objResult->quantity;
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
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3112;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 88; // unlimited quantity, AVAILABLE, Bild 1
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testUpdateItemInCollectionListenerReturnsChangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantityAndMinQuantityPerOrderIsUnreached(): void
    {
        $itemId = 3151;
        $quantityInCart = 1;
        // $minQuantityPerOrder = '3';
        // $maxQuantityPerOrder = '4';
        $expectedReturn = ['quantity' => 3];
        $productId = 102; // unlimited quantity, AVAILABLE, Bild 1a
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, '', 0, '', 0, '');
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
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, '', 0, '', 0, '');
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
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, '', 0, '', 0, '');
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
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductReservedAndIssuesAConfirmCheckoutMessageWhenProductIsNotAVariantAndQuantityInCartExceedsProductQuantity(): void
    {
        $itemId = 3115;
        $quantityInCart = 3;
        $expectedReturn = ['quantity' => 2];
        $productId = 100; // quantity 2 Bild 2
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, '', 0, '', 0, '');

        // Test if Error with message 'confirmCheckout' is added to the cart
        $this->assertSame($this->objCart->hasErrors(), true);
        $this->assertSame($this->objCart->getErrors(), ['confirmCheckout']);
    }

    /**
     * @group non-variant_products
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedAndIssuesAMakeModificationsMessageWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantityAndMinQuantityPerOrderIsUnreachable(): void
    {
        $itemId = 3152;
        $quantityInCart = 2;
        $expectedReturn = ['quantity' => 2];
        $productId = 103; // quantity 2 Bild 2a, minQuantityPerOrder 3
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, '', 0, '', 0, '');

        // Test if Error with message 'makeModifications' is added to the cart
        $this->assertSame($this->objCart->hasErrors(), true);
        $this->assertSame($this->objCart->getErrors(), ['makeModifications']);
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
        $expectedInventory_statusOfProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // item 3118
        // product 46, unlimited, AVAILABLE, Variante Original von Skulptur 1
        $sibling1Id = 46;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE; // unchanged

        // parentProduct 31, unlimited, AVAILABLE, Skulptur 1

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
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
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Parent product 32, quantity 4, AVAILABLE, Skulptur 2

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        // As the given cart is updated item by item, checks will be done item by item also (i.e. the lower part of the cart appears as it was before user changes) Therefore the inventory_status of this sibling products is still AVAILABLE here.
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
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
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Parent product 32, quantity 4, AVAILABLE, Skulptur 2
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedReturn = ['quantity' => 1];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndCalculatedQuantityInCartOfProductIsZero(): void
    {
        $itemId = 3119;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 0];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 1;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
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
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        // As the given cart is updated item by item, checks will be done item by item also (i.e. the lower part of the cart appears as it was before user changes) Therefore the inventory_status of this sibling products is still AVAILABLE here.
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
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
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products
     */
    /**
     * @group quantity_in_cart_is_equal_to_product_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedReturn = ['quantity' => 1];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
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
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        // As the given cart is updated item by item, checks will be done item by item also (i.e. the lower part of the cart appears as it was before user changes) Therefore the inventory_status of this sibling products is still AVAILABLE here.
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
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
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
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
        $expectedReturn = ['quantity' => 2];
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; // quantity 5, AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAvailableWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantity(): void
    {
        $itemId = 3130;
        $quantityInCart = 30;
        $expectedReturn = ['quantity' => 30];
        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1
        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item initially has a quantity in cart of 99, so we change this to match our testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1
        $sibling1Id = 96;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantity(): void
    {
        $itemId = 3130;
        $quantityInCart = 99;
        $expectedReturn = ['quantity' => 99];
        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1
        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED; // unchanged

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1
        $sibling1Id = 96;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testUpdateItemInCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        $itemId = 3130;
        $quantityInCart = 100;
        $expectedReturn = ['quantity' => 99];
        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1
        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED; // unchanged

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1
        $sibling1Id = 96;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductAvailableWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndProductIsReservedAndQuantityInCartIsLessThanProductQuantity(): void
    {
        $itemId = 3122;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 40; // quantity 2 , Reserved, Variante Original von Skulptur 3
        $quantityOfProduct = 2;
        $parentProductId = 33; // unlimited quantity, Skulptur 3
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Product initially has a quantity of 1, so we change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1
        $sibling1Id = 42;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityInCartIsEqualToProductQuantity(): void
    {
        $itemId = 3122;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 1];
        $productId = 40; // quantity 1 , AVAILABLE, Variante Original von Skulptur 3
        $parentProductId = 33; // unlimited quantity, Skulptur 3
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1
        $sibling1Id = 42;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testUpdateItemInCollectionListenerReturnsRecducedQuantityAndSetsProductReservedWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantity(): void
    {
        $itemId = 3122;
        $quantityInCart = 2;
        $expectedReturn = ['quantity' => 1];
        $productId = 40; // quantity 1 , AVAILABLE, Variante Original von Skulptur 3
        $parentProductId = 33; // unlimited quantity, Skulptur 3
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1
        $sibling1Id = 42;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__product_is_soldout
     */
    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductIsAVariantAndProductIsSoldout(): void
    {
        $itemId = 3126;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 0];
        $productId = 49; // quantity 1 , SOLDOUT, Variante Original von Skulptur 5
        $parentProductId = 37; // quantity unlimited, AVAILABLE, Skulptur 5
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3125
        // product 48: quantity 1 , AVAILABLE, Variante Kopie Skulptur 5
        // quantity in Cart 1
        $sibling1Id = 48;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');

        // We check if the product's quantity is really set to zero in the database
        $this->assertTrue($this->isQuantityOfProductZero($productId));
    }

    /**
     * @group variant_products__parentProduct_is_soldout
     */
    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductIsAVariantAndParentProductIsSoldout(): void
    {
        $itemId = 3128;
        $quantityInCart = 1;
        $expectedReturn = ['quantity' => 0];
        $productId = 52; // quantity 1 , AVAILABLE, Variante Original von Skulptur 6
        $parentProductId = 50; // quantity 2, SOLDOUT, Skulptur 6
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT; // unchanged

        // Item 3127
        // product 51: quantity 1 , SOLDOUT, Variante Kopie Skulptur 6
        // quantity in Cart 1
        $sibling1Id = 51;
        $expectedInventory_statusOfSibling1 = Helper::SOLDOUT;

        $this->doTest($itemId, $quantityInCart, $expectedReturn, $productId, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
        // We check if the product's quantity is really set to zero in the database
        $this->assertTrue($this->isQuantityOfProductZero($productId));
    }
}
