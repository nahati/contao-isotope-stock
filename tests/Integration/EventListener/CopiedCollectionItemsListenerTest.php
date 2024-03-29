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
use Nahati\ContaoIsotopeStockBundle\EventListener\CopiedCollectionItemsListener;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Integration-Test of the CopiedCollectionItemsListener class.
 */
class CopiedCollectionItemsListenerTest extends FunctionalTestCase
{
    private ContaoFramework $framework;

    /**
     * @var Adapter<Database>
     */
    private $databaseAdapter;

    private ProductCollectionItem $objItem;
    private ProductCollection $objSource; // source collection, not used here
    private ProductCollection $objTarget; // target collection, after copying
    /**
     * @var array<int, int>
     */
    private array $arrIds = []; // oldItem->id => newItem->id, not used here

    /**
     * setup() is called before each Testcase.
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
        $this->DoNeededInitializations();

        // Instantiate a Cart object with given id
        // This cart is of a guest
        $this->objSource = Cart::findByPk('269', ['return' => 'Model']);

        // Check if Cart object exists
        $this->assertNotNull($this->objSource);

        // Instantiate a Cart object with given id
        // This cart is of the logged-in user test@test.de
        $this->objTarget = Cart::findByPk('265', ['return' => 'Model']);

        // Check if Cart object exists
        $this->assertNotNull($this->objTarget);
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     */
    protected function tearDown(): void
    {
        parent::tearDown();

        unset($this->databaseAdapter, $this->framework, $this->objTarget, $this->objSource, $this->arrIds);
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
    private function DoNeededInitializations(): void
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
     * @param int    $expectedQuantityInCart
     * @param int    $productId
     * @param string $expectedInventory_statusOfProduct
     * @param int    $parentProductId                         // optional
     * @param string $expectedInventory_statusOfParentProduct // optional
     * @param int    $sibling1Id                              // optional
     * @param string $expectedInventory_statusOfSibling1      // optional
     * @param int    $sibling2Id                              // optional
     * @param string $expectedInventory_statusOfSibling2      // optional
     */
    private function doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct = '', $sibling1Id = 0, $expectedInventory_statusOfSibling1 = '', $sibling2Id = 0, $expectedInventory_statusOfSibling2 = ''): void
    {
        // Instantiate a Listener and call it
        $listener = new CopiedCollectionItemsListener($this->framework);

        $listener($this->objSource, $this->objTarget, $this->arrIds);

        // Instantiate the cart item with given id
        $this->objItem = ProductCollectionItem::findByPk($itemId, ['return' => 'Model']);

        // Test if item has expected quantity in cart
        $this->assertSame($this->objItem->quantity, $expectedQuantityInCart);

        // Test if product has expected inventory_status
        $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($productId);

        $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfProduct);

        // More asserts for variant products
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
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedWhenProductIsNotAVariantAndProductHasUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3112; // $quantityInCart = 1;
        $expectedQuantityInCart = 1;
        $productId = 88; // unlimited quantity, AVAILABLE, Bild 1
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndKeepsInventoryStatusOfProductWhenProductIsNotAVariantAndQuantityInCartIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3115; // $quantityInCart = 1;
        $expectedQuantityInCart = 1;
        $productId = 100; // quantity 2 , AVAILABLE, Bild 2
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndKeepsInventoryStatusOfProductWhenProductIsNotAVariantAndProductIsReservedAndQuantityInCartIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3115; // $quantityInCart = 1;
        $expectedQuantityInCart = 1;
        $productId = 89; // quantity 2, RESERVED, Bild 3
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3115; // $quantityInCart = 2;
        $quantityInCart = 2;
        $expectedQuantityInCart = 2;
        $productId = 100; // quantity 2 Bild 2
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here

        // Item initially has a quantity in cart of 1, so we change the quantity in cart of the item to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartExceedsProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3115; // $quantityInCart = 3;
        $quantityInCart = 3;
        $expectedQuantityInCart = 2;
        $productId = 100; // quantity 2 Bild 2
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here

        // Item initially has a quantity in cart of 1, so we change the quantity in cart of the item to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testCopiedCollectionItemsListenerReturnsChangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantityAndMinQuantityPerOrderIsUnreached(): void
    {
        $itemId = 3151;
        // $quantityInCart = 1;
        $expectedQuantityInCart = 3;

        // $minQuantityPerOrder = '3';
        // $maxQuantityPerOrder = '4';
        $productId = 102; // unlimited quantity, AVAILABLE, Bild 1a
        $parentProductId = 0; // no parent product
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testCopiedCollectionItemsListenerReturnsUnchangedQuantityAndSetsProductReservedAndIssuesAMakeModificationsMessageWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantityAndMinQuantityPerOrderIsUnreachable(): void
    {
        $itemId = 3152;
        // $quantityInCart = 2;
        $productId = 103; // quantity 2 Bild 2a, minQuantityPerOrder 3
        $expectedInventory_statusOfProduct = Helper::RESERVED;

        $expectedQuantityInCart = 2;

        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');

        // Test if Error with message 'makeModifications' is added to the cart
        $this->assertSame($this->objTarget->hasErrors(), true);
        $this->assertSame($this->objTarget->getErrors(), ['makeModifications']);
    }

    /**
     * @group variant_products__unlimited
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedWhenProductIsAVariantAndProductAndSiblingsAndParentHaveUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3117; // $quantityInCart = 1;
        $expectedQuantityInCart = 1;
        $productId = 47; // unlimited quantity, AVAILABLE, Variante Original von Skulptur 1
        $parentProductId = 31; //  unlimited quantity, AVAILABLE, Skulptur 1
        $expectedInventory_statusOfProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // item 3118
        // product 46, unlimited, AVAILABLE, Variante Original von Skulptur 1
        $sibling1Id = 46;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testCopiedCollectionItemsListenerIncreasesQuantityInCartAndKeepsInventoryStatusOfProductWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndMaxQuantityPerOrderIsUnreached(): void
    {
        $itemId = 3119; // $quantityInCart = 1;
        $expectedQuantityInCart = 2;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $minQuantityPerOrderOfParentproduct = 3;
        // Parent product initially has a minQuantityPerOrder of 2, so we change this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET minQuantityPerOrder=? WHERE id=?')->execute($minQuantityPerOrderOfParentproduct, $parentProductId);

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2, maxQuantityPerOrder 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119; // $quantityInCart = 1;
        $expectedQuantityInCart = 1;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119; // $quantityInCart = 2;
        $expectedQuantityInCart = 1;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartButDoesNotReduceToZeroAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndQuantityInCartOfProductIsCalculatedToZeroAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        // $quantityInCart = 1;

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = 2;

        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 1;
        // Parent product initially has a minQuantityPerOrder of 3, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET minQuantityPerOrder=? WHERE id=?')->execute('', $parentProductId);

        $expectedQuantityInCart = 1; // calculated to 0; but not reduced to 0. See: See: https://github.com/nahati/contao-isotope-stock/blob/2.0.1-dev/src/EventListener/CopiedCollectionItemsListener.php#L157

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndSetsProductReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedQuantityInCart = 2;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3110 initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedQuantityInCart = 2;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3110 initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $quantityInCart = 2;
        $expectedQuantityInCart = 1;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3110 initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartAndSetsProductReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $quantityInCart = 3;
        $expectedQuantityInCart = 2;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 5;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3119 initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::AVAILABLE;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $quantityInCart = 3;
        $expectedQuantityInCart = 2;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3119 initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3119;
        $quantityInCart = 3;
        $expectedQuantityInCart = 2;
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2
        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3119 initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1
        $sibling1Id = 45;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        // product 101: quantity 1 , AVAILABLE, weitere Variante Kopie Skulptur 2
        // not in cart
        $sibling2Id = 101;
        $expectedInventory_statusOfSibling2 = Helper::RESERVED;

        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, $sibling2Id, $expectedInventory_statusOfSibling2);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndKeepsInventoryStatusOfProductWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3130;
        $quantityInCart = 30;
        $expectedQuantityInCart = 30;
        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1
        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3130 initially has a quantity in cart of 100, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1
        $sibling1Id = 96;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3130;
        $quantityInCart = 99;
        $expectedQuantityInCart = 99;
        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1
        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;

        // Item 3130 initially has a quantity in cart of 100, so we change this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1
        $sibling1Id = 96;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testCopiedCollectionItemsListenerReducesQuantityInCartAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3130; // $quantityInCart = 100;
        $expectedQuantityInCart = 99;
        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1
        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED; // unchanged

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1
        $sibling1Id = 96;
        $expectedInventory_statusOfSibling1 = Helper::RESERVED;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndKeepsInventoryStatusOfProductWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndProductIsReservedAndQuantityInCartIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3124; // $quantityInCart = 1;
        $expectedQuantityInCart = 1;
        $productId = 38; // Reserved, Variante Original von Skulptur 4
        $quantityOfProduct = 2;
        $parentProductId = 34; // unlimited quantity, Skulptur 4
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Product initially has a quantity of 1, so we change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // Item 3123
        // product 39: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 4
        // quantity in Cart 1
        $sibling1Id = 39;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testCopiedCollectionItemsListenerKeepsQuantityInCartUnchangedAndSetsProductReservedWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3122;
        $expectedQuantityInCart = 1;
        $productId = 40; // quantity 1 , AVAILABLE, Variante Original von Skulptur 3
        $parentProductId = 33; // unlimited quantity, Skulptur 3
        $expectedInventory_statusOfProduct = Helper::RESERVED; // unchanged
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1
        $sibling1Id = 42;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testCopiedCollectionItemsListenerReturnsRecducedQuantityAndSetsProductReservedWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3122;
        $quantityInCart = 2;
        $expectedQuantityInCart = 1;
        $productId = 40; // quantity 1 , AVAILABLE, Variante Original von Skulptur 3
        $parentProductId = 33; // unlimited quantity, Skulptur 3
        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3122 initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityInCart, $itemId);

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1
        $sibling1Id = 42;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');
    }

    /**
     * @group variant_products__product_is_soldout
     */
    public function testCopiedCollectionItemsListenerReturnsQuantityZeroWhenProductIsAVariantAndProductIsSoldoutAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3126; // $quantityInCart = 1;
        $expectedQuantityInCart = 0;
        $productId = 49; // quantity 1 , SOLDOUT, Variante Original von Skulptur 5
        $parentProductId = 37; // quantity unlimited, AVAILABLE, Skulptur 5
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged

        // Item 3125
        // product 48: quantity 1 , AVAILABLE, Variante Kopie Skulptur 5
        // quantity in Cart 1
        $sibling1Id = 48;
        $expectedInventory_statusOfSibling1 = Helper::AVAILABLE;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');

        // We check if the product's quantity is really set to zero in the database
        $this->assertTrue($this->isQuantityOfProductZero($productId));
    }

    /**
     * @group variant_products__parentProduct_is_soldout
     */
    public function testCopiedCollectionItemsListenerReturnsQuantityZeroWhenProductIsAVariantAndParentProductIsSoldoutAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3128; // $quantityInCart = 1;
        $expectedQuantityInCart = 0;
        $productId = 52; // quantity 1 , AVAILABLE, Variante Original von Skulptur 6
        $parentProductId = 50; // quantity 2, SOLDOUT, Skulptur 6
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT; // unchanged

        // Item 3127
        // product 51: quantity 1 , SOLDOUT, Variante Kopie Skulptur 6
        // quantity in Cart 1
        $sibling1Id = 51;
        $expectedInventory_statusOfSibling1 = Helper::SOLDOUT;

        $this->doTest($itemId, $expectedQuantityInCart, $productId, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSibling1, 0, '');

        // We check if the product's quantity is really set to zero in the database
        $this->assertTrue($this->isQuantityOfProductZero($productId));
    }
}
