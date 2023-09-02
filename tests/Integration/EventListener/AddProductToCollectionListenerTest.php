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
use Nahati\ContaoIsotopeStockBundle\EventListener\AddProductToCollectionListener;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;

/**
 * Integration-Test of the AddProductToCollectionListener class.
 */
class AddProductToCollectionListenerTest extends FunctionalTestCase
{
    private ContaoFramework $framework;

    /**
     * @var Adapter<Database>
     */
    private $databaseAdapter;

    private Cart $objCart;
    private mixed $return;

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

        unset($this->databaseAdapter, $this->framework, $this->objCart);
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
     * Do needed Isotope initializations.
     */
    private function doSomeIsotopeInitializations(): void
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
     * @param int    $productId
     * @param int    $quantityRequestedForCart
     * @param Cart   $objCart
     * @param int    $expectedReturn
     * @param int    $parentProductId
     * @param string $expectedInventory_statusOfProduct
     * @param string $expectedInventory_statusOfParentProduct   // optional
     * @param string $expectedInventory_statusOfSiblingProducts // optional
     */
    private function doTest($productId, $quantityRequestedForCart, $objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct = '', $expectedInventory_statusOfSiblingProducts = ''): void
    {
        // Fetch the product with given $productId
        /** @var Standard $objProduct */
        $objProduct = Standard::findByPk($productId);

        // Fetch the product with given $productId
        $objProduct = Standard::findByPk($productId);

        // Test that $objProduct is of type Standard
        $this->assertInstanceOf('Isotope\Model\Product\Standard', $objProduct);

        // Instantiate a Listener and call it
        $listener = new AddProductToCollectionListener($this->framework);

        $this->return = $listener($objProduct, $quantityRequestedForCart, $objCart);

        // Test if expected return is returned
        $this->assertSame($this->return, $expectedReturn);

        // Test if product has expected inventory_status
        $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($objProduct->id);

        $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfProduct);

        // Asserts only for variant products
        if ($parentProductId > 0) {
            // Test if inventory_status of all siblings (excluding the given product) is as expected
            $objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE pid=? AND id!=?')->execute($parentProductId, $objProduct->id);

            while ($objResult->next()) {
                $this->assertSame($objResult->inventory_status, $expectedInventory_statusOfSiblingProducts);
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
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $productId = 88; // unlimited quantity, AVAILABLE, Bild 1
        $parentProductId = 0; // no parent product
        $quantityRequestedForCart = 1;
        $expectedReturn = 1;
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndKeepsInventoryStatusOfProductWhenProductIsNotAVariantAndQuantityInCartIsLessThanProductQuantity(): void
    {
        // Product is already in cart with quantity 1

        $productId = 100; // AVAILABLE, Bild 2
        $quantityOfProduct = 3;

        // Product initially has a quantity of 2. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 0; // no parent product

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndKeepsInventoryStatusOfProductWhenProductIsNotAVariantAndProductIsReservedAndQuantityInCartIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 89; // quantity 2, RESERVED, Bild 3
        $quantityOfProduct = 3;

        // Product initially has a quantity of 2. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 0; // no parent product

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 100; // AVAILABLE, Bild 2
        // $quantityOfProduct = 2;

        $parentProductId = 0; // no parent product

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartExceedsProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 100; // AVAILABLE, Bild 2
        // $quantityOfProduct = 2;

        $parentProductId = 0; // no parent product

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testAddProductToCollectionListenerReturnsChangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantityAndProductHasLimitedQuantityPerOrderAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $productId = 102; // unlimited quantity, AVAILABLE, Bild 1a
        // Product is already in cart with quantity 1

        $parentProductId = 0; // no parent product

        $quantityRequestedForCart = 1;
        $expectedReturn = 2;

        // $minQuantityPerOrder = '3';
        // $maxQuantityPerOrder = '4';
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group non-variant_products
     */
    public function testAddProductToCollectionListenerReturnsChangedQuantityAndSetsProductReservedAndIssuesAMakeModificationsMessageWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantityAndMinQuantityPerOrderIsUnreachable(): void
    {
        // $itemId = 3152;
        // $quantityInCart = 2;
        $productId = 103; // quantity 2 Bild 2a, minQuantityPerOrder 3
        $expectedInventory_statusOfProduct = Helper::RESERVED;

        $quantityRequestedForCart = 1;
        $expectedReturn = 0;

        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct);
    }

    /**
     * @group variant_products__unlimited
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityWhenProductIsAVariantAndProductAndSiblingsAndParentHaveUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 47; // unlimited quantity, AVAILABLE, Variante Original von Skulptur 1

        $parentProductId = 31; // unlimited, AVAILABLE, Skulptur 1

        // item 3118
        // product 46, unlimited, AVAILABLE, Variante Original von Skulptur 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndKeepsInventoryStatusOfProductWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        $quantityOfProduct = 3;
        // Product initially has a quantity of 2. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        $quantityOfProduct = 3;
        // Product initially has a quantity of 2. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        $quantityOfProduct = 3;
        // Product initially has a quantity of 2. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityToZeroAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsLessThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        $quantityOfProduct = 3;
        // Product initially has a quantity of 2. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 2;
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 0;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group  variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = 2;

        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group  variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = 2;

        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group  variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = 2;

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group  variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityAndSetsProductReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = 2;

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 5;
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group  variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = 2;

        $parentProductId = 32; //  AVAILABLE, Skulptur 2
        //  $quantityOfParentProduct = 4;

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group  variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 44; // AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = 2;

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = 3;
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3120
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndKeepsInventoryStatusOfProductWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product (Item 3130) is already in cart with quantity 100, we reduce that to 30:
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute(30, 3130);

        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1

        $quantityRequestedForCart = 10;
        $expectedReturn = 10;

        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product (Item 3130) is already in cart with quantity 100, we reduce that to 98:
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute(98, 3130);

        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testAddProductToCollectionListenerReturnsReducedQuantityAndSetsProductAndSiblingsAndParentReservedWhenProductIsAVariantAndQuantityInCartIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product (Item 3130) is already in cart with quantity 100, we reduce that to 98:
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute(98, 3130);

        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3129
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::RESERVED;
        $expectedInventory_statusOfSiblingProducts = Helper::RESERVED;

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndKeepsInventoryStatusOfProductWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndProductIsReservedAndQuantityInCartIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 40; //  Reserved, Variante Original von Skulptur 3
        $quantityOfProduct = 4;
        // Product initially has a quantity of 1. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testAddProductToCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityInCartIsEqualToProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 40; //  Reserved, Variante Original von Skulptur 3
        $quantityOfProduct = 2;
        // Product initially has a quantity of 1. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1

        $quantityRequestedForCart = 1;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testAddProductToCollectionListenerReturnsRecducedQuantityAndSetsProductReservedWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityInCartIsGreaterThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 40; //  Reserved, Variante Original von Skulptur 3
        $quantityOfProduct = 2;
        // Product initially has a quantity of 1. We change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3121
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 1;

        $expectedInventory_statusOfProduct = Helper::RESERVED;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);
    }

    /**
     * @group variant_products__product_is_soldout
     */
    public function testAddProductToCollectionListenerReturnsQuantityZeroWhenProductIsAVariantAndProductIsSoldoutAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 49; // SOLDOUT, Variante Original von Skulptur 5
        // $quantityOfProduct = 1;

        $parentProductId = 37; // quantity unlimited, AVAILABLE, Skulptur 5

        // Item 3125
        // product 48: quantity 1 , AVAILABLE, Variante Kopie Skulptur 5
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 0;

        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::AVAILABLE; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);

        // We check if the product's quantity is zero
        $this->assertTrue($this->isQuantityOfProductZero($productId));
    }

    /**
     * @group variant_products__parentProduct_is_soldout
     */
    public function testAddProductToCollectionListenerReturnsQuantityZeroAndSetsProductAndSiblingsSoldoutWhenProductIsAVariantAndParentProductIsSoldoutAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // Product is already in cart with quantity 1

        $productId = 52; // AVAILABLE, Variante Original von Skulptur 6
        // $quantityOfProduct = 1;

        $parentProductId = 50; // quantity 2, SOLDOUT, Skulptur 6

        // Item 3125
        // product 48: quantity 1 , AVAILABLE, Variante Kopie Skulptur 5
        // quantity in Cart 1

        $quantityRequestedForCart = 2;
        $expectedReturn = 0;

        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT; // unchanged
        $expectedInventory_statusOfSiblingProducts = Helper::SOLDOUT; // unchanged

        $this->doTest($productId, $quantityRequestedForCart, $this->objCart, $expectedReturn, $parentProductId, $expectedInventory_statusOfProduct, $expectedInventory_statusOfParentProduct, $expectedInventory_statusOfSiblingProducts);

        // We check if the product's quantity is really set to zero
        $this->assertTrue($this->isQuantityOfProductZero($productId));
    }
}
