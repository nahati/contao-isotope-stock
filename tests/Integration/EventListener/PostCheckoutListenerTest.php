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
use Isotope\Model\Address;
use Isotope\Model\Attribute\TextField;
use Isotope\Model\Config;
use Isotope\Model\OrderStatus;
use Isotope\Model\Product;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Order;
use Isotope\Model\ProductCollectionItem;
use Isotope\Model\ProductCollectionSurcharge;
use Isotope\Model\ProductType;
use Nahati\ContaoIsotopeStockBundle\EventListener\PostCheckoutListener;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;
use NotificationCenter\Model\Gateway;
use NotificationCenter\Model\Language;
use NotificationCenter\Model\Message;
use NotificationCenter\Model\Notification;

/**
 * Integration-Test of the PostCheckoutListener class.
 *
 * @covers \Nahati\ContaoIsotopeStockBundle\EventListener\PostCheckoutListener
 */
class PostCheckoutListenerTest extends FunctionalTestCase
{
    private ContaoFramework $framework;

    /**
     * @var Adapter<Database>
     */
    private $databaseAdapter;

    private mixed $objResult;

    // private PostCheckoutListener $listener;
    private Order $objOrder; // target collection, after copying
    private int $oldOrderStatus; // old order status

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

        $this->databaseAdapter = $this->framework->getAdapter(Database::class);

        $this->resetRelevantDatabaseTables();
        // We reset these table BEFORE each test to ensure that each test starts with the same relevant initial state and to enable a database lookup from outside after a single test has run to check the database tables.

        // Do needed Isotope and Notification Center initializations
        $this->doSomeIsotopeAndNcInitializations();

        // Instantiate an order object with given id
        $this->objOrder = Order::class::findByPk('268', ['return' => 'Model']);

        // Check if order object exists
        $this->assertNotNull($this->objOrder);

        $this->oldOrderStatus = $this->objOrder->order_status;

        // $GLOBALS['TL_CONFIG']['templateFiles'] = 'contao/templates';
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     * Here expecially the kernel will be set to null.
     */
    protected function tearDown(): void
    {
        parent::tearDown();

        unset($this->databaseAdapter, $this->framework, $this->objOrder, $this->oldOrderStatus, $this->objResult);
    }

    /**
     * Reset relevant tables of the database to the AfterCheckout state.
     */
    private function resetRelevantDatabaseTables(): void
    {
        // Reset ProductCollectionItem-table to AfterCheckout state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection_item';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection_item-AfterCheckout.sql');

        // Reset Product-table to AfterCheckout state
        $sql = 'DROP TABLE ' . 'tl_iso_product';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product-AfterCheckout.sql');

        // Reset ProductCollection-table to AfterCheckout state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection-AfterCheckout.sql');
    }

    /**
     * Builds an sql query to load the database tables into the database
     * Files are located in the Fixtures folder and have been exported from the AfterCheckout database.
     */
    private function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

        $this->databaseAdapter->getInstance()->execute($sql);
    }

    /**
     * Do needed Isotope and Notification Center initializations.
     */
    private function doSomeIsotopeAndNcInitializations(): void
    {
        // Declare additional messages that are declared in the extension
        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['parentQuantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['adaptCart'] = 'Adapt the "%s" and related variants in cart by their quantity!';

        $GLOBALS['TL_LANG']['ERR']['productHasChanged'] = '"%s" has changed in the meanwhile, please start again!';

        $GLOBALS['TL_LANG']['ERR']['parentQuantityNotAvailable'] = 'The maximum available quantity for "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['variantQuantityNotAvailable'] = 'The maximum available quantity for a variant of "%s" is %s items';

        $GLOBALS['TL_LANG']['ERR']['productOutOfStock'] = 'The product "%s" is currently out of stock';

        $GLOBALS['TL_LANG']['ERR']['overbought'] = 'The product "%s" has been overbought by "%d"! We will come back to you soon.';

        /*
        * Number formatting
        */
        $GLOBALS['ISO_NUM']['10000.00'] = [2, '.', ''];
        $GLOBALS['ISO_NUM']['10,000.00'] = [2, '.', ','];
        $GLOBALS['ISO_NUM']['10.000,00'] = [2, ',', '.'];
        $GLOBALS['ISO_NUM']["10'000.00"] = [2, '.', "'"];

        $GLOBALS['TL_LANG']['CUR_SYMBOL']['EUR'] = '€';

        $GLOBALS['ISO_ADR']['generic'] =
            '<div ::class="vcard">{if hcard_org!=""}##hcard_org##{endif}{if hcard_n=="1"}<div ::class="n">{if hcard_honorific_prefix!=""}##hcard_honorific_prefix## {endif}##hcard_given_name## ##hcard_family_name##</div>{endif}{if hcard_adr=="1"}<div ::class="adr">##hcard_street_address## ##hcard_postal_code## ##hcard_locality## ##hcard_country_name##</div>{endif} {if hcard_tel!=""} ##hcard_tel## {endif} {if hcard_email!=""} ##hcard_email## {endif}</div>';

        $GLOBALS['TL_LANG']['MSC']['useBillingAddress'] = '1';

        $GLOBALS['TL_LANG']['MSC']['subTotalLabel'] = 'Subtotal';
        $GLOBALS['TL_LANG']['MSC']['grandTotalLabel'] = 'Grand total';

        $GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['recipients'] = ['recipient_email', 'form_*', 'billing_address_email', 'shipping_address_email'];

        /*
        * Notification Center Gateways
        */
        $GLOBALS['NOTIFICATION_CENTER']['GATEWAY'] = array_merge(
            (array) ($GLOBALS['NOTIFICATION_CENTER']['GATEWAY'] ?? []),
            [
                'queue' => 'NotificationCenter\Gateway\Queue',
                'email' => 'NotificationCenter\Gateway\Email',
                'file' => 'NotificationCenter\Gateway\File',
                'postmark' => 'NotificationCenter\Gateway\Postmark',
            ]
        );

        // Declare additional fields for tl_iso_product that are declared in the extension
        $GLOBALS['TL_DCA']['tl_iso_product']['fields']['inventory_status'] = [
            'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['inventory_status'],
            'reference' => &$GLOBALS['TL_LANG']['MSC'],
            'filter' => true,
            'search' => true,
            'inputType' => 'radio',
            'options' => ['1', '2', '3', '4'],
            'eval' => ['feEditable' => true, 'feViewable' => true, 'tl_::class' => 'w50'],
            'attributes' => ['legend' => 'general_legend', 'fe_filter' => true, 'fe_search' => true, 'fe_sorting' => true],
            'sql' => "char(1) NOT NULL default '2'",
        ];
        $GLOBALS['TL_DCA']['tl_iso_product']['fields']['quantity'] = [
            'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['quantity'],
            'filter' => true,
            'sorting' => true,
            'inputType' => 'text',
            'eval' => ['mandatory' => false, 'doNotShow' => false, 'tl_::class' => 'w50'],
            'attributes' => ['legend' => 'general_legend', 'multilingual' => false, 'fe_sorting' => true],
            'sql' => "varchar(255) NOT NULL default ''",
        ];

        // This is a copy from tl_iso_product_collection.php
        $GLOBALS['TL_DCA']['tl_iso_product_collection']['fields']['config_id'] = [
            'foreignKey' => Config::getTable() . '.name',
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
        ];

        // This is a copy from tl_iso_product_collection.php
        $GLOBALS['TL_DCA']['tl_iso_product_collection']['fields']['billing_address_id'] = [
            'search' => true,
            'foreignKey' => Address::getTable() . ".CONCAT_WS(' ', label, company, firstname, lastname, street_1, street_2, street_3, postal, city)",
            'eval' => ['doNotShow' => true],
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
        ];

        // This is a copy from tl_iso_product_collection.php
        $GLOBALS['TL_DCA']['tl_iso_product_collection']['fields']['shipping_address_id'] = [
            'search' => true,
            'foreignKey' => Address::getTable() . ".CONCAT_WS(' ', label, company, firstname, lastname, street_1, street_2, street_3, postal, city)",
            'eval' => ['doNotShow' => true],
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
        ];

        // This is a copy from tl_iso_product_collection.php
        $GLOBALS['TL_DCA']['tl_iso_product_collection']['fields']['member'] = [
            'search' => true,
            'foreignKey' => "tl_member.CONCAT_WS(' ', company, firstname, lastname, street, postal, city)",
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
        ];

        // This is a copy from tl_iso_product_collection_item.php
        $GLOBALS['TL_DCA']['tl_iso_product_collection_item']['fields']['pid'] = [
            'foreignKey' => 'tl_iso_product_collection.document_number',
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'belongsTo', 'load' => 'lazy'],
        ];

        // This is a copy from tl_iso_product_collection_item.php
        $GLOBALS['TL_DCA']['tl_iso_product_collection_item']['fields']['jumpTo'] = [
            'foreignKey' => 'tl_page.title',
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
        ];

        // This is a copy from tl_nc_message.php
        $GLOBALS['TL_DCA']['tl_nc_message']['fields']['gateway'] = [
            'label' => &$GLOBALS['TL_LANG']['tl_nc_message']['gateway'],
            'exclude' => true,
            'filter' => true,
            'inputType' => 'select',
            'foreignKey' => 'tl_nc_gateway.title',
            'eval' => ['mandatory' => true, 'submitOnChange' => true, 'includeBlankOption' => true, 'tl_::class' => 'w50'],
            'sql' => "int(10) unsigned NOT NULL default '0'",
            'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
            'save_callback' => [
                // Save gateway_type
                static function ($varValue, $dc) {
                    Database::getInstance()->prepare('UPDATE tl_nc_message SET gateway_type=(SELECT type FROM tl_nc_gateway WHERE id=?) WHERE id=?')->execute($varValue, $dc->id);
                    Database::getInstance()->prepare('UPDATE tl_nc_language SET gateway_type=(SELECT type FROM tl_nc_gateway WHERE id=?) WHERE pid=?')->execute($varValue, $dc->id);

                    return $varValue;
                },
            ],
        ];

        $this->objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_attribute WHERE id=?')->execute(15);

        $GLOBALS['TL_DCA']['tl_iso_product']['attributes']['status'] = new TextField($this->objResult);

        Product::registerModelType('standard', Standard::class);

        // These assignments link the tables with the model ::classes. Now you can use the model ::classes to access and manipulate the data in the tables.
        $GLOBALS['TL_MODELS']['tl_iso_config'] = Config::class;
        $GLOBALS['TL_MODELS']['tl_iso_address'] = Address::class;
        $GLOBALS['TL_MODELS']['tl_iso_producttype'] = ProductType::class;
        $GLOBALS['TL_MODELS']['tl_iso_product'] = Standard::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection'] = ProductCollection::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection_surcharge'] = ProductCollectionSurcharge::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection_item'] = ProductCollectionItem::class;
        $GLOBALS['TL_MODELS']['tl_iso_orderstatus'] = OrderStatus::class;
        $GLOBALS['TL_MODELS']['tl_nc_notification'] = Notification::class;
        $GLOBALS['TL_MODELS']['tl_nc_message'] = Message::class;
        $GLOBALS['TL_MODELS']['tl_nc_gateway'] = Gateway::class;
        $GLOBALS['TL_MODELS']['tl_nc_language'] = Language::class;
    }

    /**
     * @param int    $productId
     * @param string $expectedQuantityOfProduct
     * @param string $expectedInventory_statusOfProduct
     * @param int    $parentProductId                         // optional
     * @param string $expectedInventory_statusOfParentProduct // optional
     * @param int    $sibling1Id                              // optional
     * @param string $expectedInventory_statusOfSibling1      // optional
     * @param int    $sibling2Id                              // optional
     * @param string $expectedInventory_statusOfSibling2      // optional
     */
    private function doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct = '', $sibling1Id = 0, $expectedInventory_statusOfSibling1 = '', $sibling2Id = 0, $expectedInventory_statusOfSibling2 = ''): void
    {
        // Instantiate a Listener and call it
        $listener = new PostCheckoutListener($this->framework);

        $listener($this->objOrder);

        // Test if the product has the expected quantity
        $this->objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($productId);

        $this->assertSame($this->objResult->quantity, $expectedQuantityOfProduct);

        $this->assertSame($this->objResult->inventory_status, $expectedInventory_statusOfProduct);

        // Asserts only for variant products
        if ($parentProductId > 0) {
            if ($sibling1Id) {
                // Test if the inventory_status of sibling1 is as expected
                $this->objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($sibling1Id);
                $this->assertSame($this->objResult->inventory_status, $expectedInventory_statusOfSibling1);
            }

            if ($sibling2Id) {
                // Test if the inventory_status of sibling2 is as expected
                $this->objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($sibling2Id);

                $this->assertSame($this->objResult->inventory_status, $expectedInventory_statusOfSibling2);
            }

            // Test if inventory_status of the parent is as expected
            $this->objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute($parentProductId);

            $this->assertSame($this->objResult->inventory_status, $expectedInventory_statusOfParentProduct);
        }
        unset($listener);
    }

    /**
     * This test I began with to check if tests can be run.
     */
    public function testTrueIsTrue(): void
    {
        $this->assertTrue(true);
    }

    /**
     * @group non-variant_products
     */
    public function testPostCheckoutListenerKeepsProductQuantityAndInventoryStatusWhenProductIsNotAVariantAndProductHasUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // ItemId = 3317, quantityBought = 1
        $productId = 88; // unlimited quantity, AVAILABLE, Bild 1
        $expectedQuantityOfProduct = '';
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testPostCheckoutListenerReducesProductQuantityWhenProductIsNotAVariantAndQuantityBoughtIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3318,  quantityBought = 1
        $productId = 100; // quantity 2 , AVAILABLE, Bild 2
        $expectedQuantityOfProduct = '1';
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductSoldoutWhenProductIsNotAVariantAndQuantityBoughtIsEqualToProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3318,  quantityBought = 1
        $productId = 100; // AVAILABLE, Bild 2

        $quantityOfProduct = '1';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group non-variant_products
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductSoldoutWhenProductIsNotAVariantAndQuantityOfProductExceedsProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3318,  quantityBought = 1
        $productId = 100; // AVAILABLE, Bild 2
        $quantityOfProduct = '0';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $parentProductId = 0; // no parent product
        // expectedInventory_statusOfParentProduct not used here
        // expectedInventory_statusOfSiblingProducts not used here

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, '', 0, '', 0, '');
    }

    /**
     * @group variant_products__unlimited
     */
    public function testPostCheckoutListenerKeepsQuantityOfProductAndInventoryStatusWhenProductIsAVariantAndProductAndSiblingsAndParentHaveUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3320,  quantityBought = 1

        $productId = 47; // unlimited quantity, AVAILABLE, Variante Original von Skulptur 1

        $parentProductId = 31; // unlimited quantity, AVAILABLE, Skulptur 1

        // item 3321, quantityBought 1
        // product 46, unlimited, AVAILABLE, Variante Original von Skulptur 1
        $sibling1Id = 46;

        $expectedQuantityOfProduct = '';
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, 0, '');
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductWhenProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '1';
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '2';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '1';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product with id 101 exist, which is Available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductSoldoutWhenProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '1';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        // $quantityOfParentProduct = 4;

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndQuantityOfProductIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '1';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '2';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3336,  quantityBought = 1
        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '1';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '1';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantityAndAllChildProductsAreSoldoutAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3336,  quantityBought = 1
        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '0';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // Quantity 4, AVAILABLE, Skulptur 2

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingInCartSoldoutAndKeepsParentAvailableWhenProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantityAndThereIsANonSoldoutSiblingAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3336,  quantityBought = 1
        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '0';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // Quantity 4, AVAILABLE, Skulptur 2

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3322;
        $quantityBought = 3;

        // Item initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = '1';

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        // $quantityOfParentProduct = '4';

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3322;
        $quantityBought = 4;

        // Item initially has a quantity in cart of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2
        // $quantityOfProduct = '1';

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        // $quantityOfParentProduct = '4';

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        $sibling1Id = 45;

        // Another child product, not in cart, available
        $sibling2Id = 101;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct2 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, $sibling2Id, $expectedInventory_statusOfSiblingProduct2);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductWhenProductIsAVariantAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantity(): void
    {
        $itemId = 3330;
        $quantityBought = 30;

        // Item initially has a quantity in cart of 99, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Parent product initially is RESERVED, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute(Helper::AVAILABLE, $parentProductId);
        // Item 3329
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantityBought 1

        $sibling1Id = 96;

        $expectedQuantityOfProduct = '';
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, 0, '');
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityOfProductIncludingAllSiblingsIsEqualToParentQuantity(): void
    {
        // $itemId = 3330;
        // $quantityBought = 99;

        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3329
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantityBought 1

        $sibling1Id = 96;

        $expectedQuantityOfProduct = '';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, 0, '');
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductAndSiblingsAndParentSoldoutWhenProductIsAVariantAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantity(): void
    {
        $itemId = 3330;
        $quantityBought = 100;
        // Item initially has a quantityBought of 99, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3329
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantityBought 1

        $sibling1Id = 96;

        $expectedQuantityOfProduct = '';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfSiblingProduct1 = Helper::SOLDOUT;

        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testPostCheckoutListenerReducesQuantityOfProductWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityBoughtIsLessThanProductQuantity(): void
    {
        // $itemId = 3327;
        // $quantityBought = 1;

        $productId = 38; // Available, Variante Original von Skulptur 4

        // Product iinitially is RESERVED, so we change the status to AVAILABLE to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute(Helper::AVAILABLE, $productId);
        $quantityOfProduct = 2;

        // Product initially has a quantity of 1, so we change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 34; // unlimited quantity, Skulptur 4

        // Item 3326
        // product 39: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 4
        // quantityBought 1

        $sibling1Id = 39;

        $expectedQuantityOfProduct = '1';
        $expectedInventory_statusOfProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testPostCheckoutListenerReducesQuantityOfProductAndSetsProductSoldoutWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityBoughtIsEqualToProductQuantity(): void
    {
        // $itemId = 3325;
        // $quantityBought = 1;

        $productId = 40; // AVAILABLE, Variante Original von Skulptur 3
        // $quantityOfProduct = 1;

        $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3324
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantityBought 1

        $sibling1Id = 42;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, 0, '');
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testPostCheckoutListenerRecducesQuantityAndSetsProductSoldoutWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantity(): void
    {
        $itemId = 3325;
        $quantityBought = 2;

        // Item 3122 initially has a quantityBought of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        $productId = 40; // AVAILABLE, Variante Original von Skulptur 3
        // $quantityOfProduct = 1;

        $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3324
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantityBought 1

        $sibling1Id = 42;

        $expectedQuantityOfProduct = '0';
        $expectedInventory_statusOfProduct = Helper::SOLDOUT;
        $expectedInventory_statusOfParentProduct = Helper::AVAILABLE;
        $expectedInventory_statusOfSiblingProduct1 = Helper::AVAILABLE;
        $this->doTest($productId, $expectedQuantityOfProduct, $expectedInventory_statusOfProduct, $parentProductId, $expectedInventory_statusOfParentProduct, $sibling1Id, $expectedInventory_statusOfSiblingProduct1, 0, '');
    }

    /**
     * @group check-orderstatus
     */
    public function testPostCheckoutListenerKeepsOrderStatusWhenOrderNotContainsAnyOverboughtProducts(): void
    {
        // Instantiate a Listener and call it
        $listener = new PostCheckoutListener($this->framework);

        $listener($this->objOrder);

        $this->objOrder->refresh();

        // Test if the order status is unchanged
        $this->assertSame($this->objOrder->order_status, $this->oldOrderStatus);
    }

    /**
     * @group check-orderstatus
     */
    public function testPostCheckoutListenerSetsOrderStatusOverboughtWhenOrderContainsOverboughtProducts(): void
    {
        $itemId = 3325;
        $quantityBought = 2;

        // Item initially has a quantityBought of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        // $productId = 40; // AVAILABLE, Variante Original von Skulptur 3
        // $quantityOfProduct = 1;

        // Instantiate a Listener and call it
        $listener = new PostCheckoutListener($this->framework);

        $listener($this->objOrder);

        $this->objOrder->refresh();

        // Test if the order status is Overbought
        $this->assertSame($this->objOrder->order_status, 15);
    }
}
