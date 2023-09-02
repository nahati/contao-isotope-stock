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
use Contao\PageModel;
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
use Isotope\Module\Checkout;
use Nahati\ContaoIsotopeStockBundle\EventListener\PreCheckoutListener;
use Nahati\ContaoIsotopeStockBundle\Helper\Helper;
use NotificationCenter\Model\Gateway;
use NotificationCenter\Model\Language;
use NotificationCenter\Model\Message;
use NotificationCenter\Model\Notification;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Component\HttpFoundation\Response;

/**
 * Integration-Test of the PreCheckoutListener class.
 *
 * Before running this test trhe database must be in a state AFTER checkout. Use the corresponding fixture to set the database to this state.
 */
class PreCheckoutListenerTest extends FunctionalTestCase
{
    public static KernelBrowser $client;

    private ContaoFramework $framework;

    /**
     * @var Adapter<Database>
     */
    private $databaseAdapter;

    private mixed $objResult;

    private bool $return;

    private Order $objOrder; // target collection, after copying
    private Checkout|null $objCheckout = null; // Checkout object, not used here

    /**
     * setup() is called before each Testcase.
     */
    protected function setUp(): void
    {
        parent::setUp();

        // This calls KernelTestCase::bootKernel(), and creates a "client" that is acting as the browser
        self::$client = static::createClient();

        $container = self::$client->getContainer();
        System::setContainer($container);

        // Initialize the Contao Framework
        $this->framework = $container->get('contao.framework');
        $this->framework->initialize();

        $this->databaseAdapter = $this->framework->getAdapter(Database::class);

        $this->resetRelevantDatabaseTables();
        // We reset these database tables BEFORE each test to ensure that each test starts with the same relevant initial state and to enable a database lookup from outside after a single test has run to check the database tables.

        // Do needed Isotope and Notification Center initializations
        $this->doSomeIsotopeAndNcInitializations();

        // Instantiate an order object with given id
        $this->objOrder = Order::class::findByPk('268', ['return' => 'Model']);

        // Check if order object exists
        $this->assertNotNull($this->objOrder);

        // Create a new checkout object with the order object
        /** @var ProductCollection $this->objOrder */
        $this->objCheckout = new Checkout($this->objOrder);

        // If not exists, set the Global Page object
        if (!isset($GLOBALS['objPage'])) {
            // Get the checkout page from the database
            $objPage = $this->databaseAdapter->getInstance()
                ->prepare('SELECT * FROM tl_page WHERE id=?')
                ->execute(18)
                ->fetchAssoc()
            ;

            // Create a new instance of the PageModel class using the database result
            $GLOBALS['objPage'] = new PageModel($objPage);
        }
    }

    /**
     * tearDown() is called after each testcase and contains the basic cleanup for the tests.
     */
    protected function tearDown(): void
    {
        parent::tearDown();

        unset($this->databaseAdapter, $this->framework, $this->objOrder, $this->objCheckout, $this->return);
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

        $GLOBALS['TL_LANG']['ERR']['orderNotPossible'] = 'Your order needs to be changed. Please go to cart and refresh it.';

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

        Product::registerModelType('standard', Standard::class);

        $this->objResult = $this->databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_attribute WHERE id=?')->execute(15);

        $GLOBALS['TL_DCA']['tl_iso_product']['attributes']['status'] = new TextField($this->objResult);

        $GLOBALS['TL_CONFIG']['templateFiles'] = 'contao/templates';

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
     * @param bool $expectedReturn
     */
    private function doTest($expectedReturn): void
    {
        // Instantiate a listener
        $listener = new PreCheckoutListener($this->framework);

        $this->return = $listener($this->objOrder, $this->objCheckout);

        // Test if the return is as expected
        $this->assertSame($this->return, $expectedReturn);

        unset($listener);
    }

    // /**
    //  * This test I began with to check if tests can be run.
    //  */
    // public function testTrueIsTrue(): void
    // {
    //     $this->assertTrue(true);
    // }

    /**
     * @group non-variant_products
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsNotAVariantAndProductHasUnlimitedQuantity(): void
    {
        // $itemId = 3317;
        // $quantityBought = 1;

        // $productId = 88; // unlimited quantity, AVAILABLE, Bild 1
        // $parentProductId = 0; // no parent product

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group non-variant_products
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsNotAVariantAndQuantityBoughtIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3318,  quantityBought = 1
        // $productId = 100; // quantity 2 , AVAILABLE, Bild 2
        // $parentProductId = 0; // no parent product

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group non-variant_products
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsNotAVariantAndQuantityBoughtIsEqualToProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3318,  quantityBought = 1
        // $productId = 100; // AVAILABLE, Bild 2

        // $quantityOfProduct = '1';
        // $parentProductId = 0; // no parent product

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group non-variant_products
     */
    public function testPreCheckoutListenerSendsRedirectResponseWhenProductIsNotAVariantAndQuantityOfProductExceedsProductQuantity(): void
    {
        // $itemId = 3318,  quantityBought = 1

        $productId = 100; // AVAILABLE, Bild 2
        $quantityOfProduct = '0';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // $parentProductId = 0; // no parent product

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        // Instantiate a listener
        $listener = new PreCheckoutListener($this->framework);

        $this->return = $listener($this->objOrder, $this->objCheckout);

        // Get the response from the client
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());

        unset($this->listener);
    }

    /**
     * @group variant_products__unlimited
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsAVariantAndProductAndSiblingsAndParentHaveUnlimitedQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3320,  quantityBought = 1

        // $productId = 47; // unlimited quantity, AVAILABLE, Variante Original von Skulptur 1

        // $parentProductId = 31; // unlimited quantity, AVAILABLE, Skulptur 1

        // item 3321, quantityBought 1
        // product 46, unlimited, AVAILABLE, Variante Original von Skulptur 1
        // $sibling1Id = 46;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        // $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        // $parentProductId = 32; //  quantity 4, AVAILABLE, Skulptur 2

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // $sibling1Id = 45;

        // Another child product, not in cart, available
        // $sibling2Id = 101;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        // $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '2';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // $sibling1Id = 45;

        // Another child product, not in cart, available
        // $sibling2Id = 101;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testPreCheckoutListenerSendsRedirectResponseWhenProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        // $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '1';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // $sibling1Id = 45;

        // Another child product with id 101 exist, which is Available
        // $sibling2Id = 101;

        self::$client->request('GET', '/');

        // Instantiate a listener
        $listener = new PreCheckoutListener($this->framework);

        $this->return = $listener($this->objOrder, $this->objCheckout);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());

        unset($this->listener);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3322,  quantityBought = 1
        $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '1';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // $parentProductId = 32; // AVAILABLE, Skulptur 2
        // $quantityOfParentProduct = 4;

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // $sibling1Id = 45;

        // Another child product, not in cart, available
        // $sibling2Id = 101;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndQuantityOfProductIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
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
        // $sibling1Id = 45;

        // Another child product, not in cart, available
        // $sibling2Id = 101;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testPreCheckoutListenerSendsRedirectResponseWhenProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
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
        // $sibling1Id = 45;

        // Another child product, not in cart, available
        // $sibling2Id = 101;

        // // Get the checkout page from the database
        // $objPage = $this->databaseAdapter->getInstance()
        //     ->prepare('SELECT * FROM tl_page WHERE id=?')
        //     ->execute(18)
        //     ->fetchAssoc()
        // ;

        // // Create a new instance of the PageModel class using the database result
        // $GLOBALS['objPage'] = new PageModel($objPage);

        // Instantiate a listener
        $listener = new PreCheckoutListener($this->framework);

        self::$client->request('GET', '/');

        $this->return = $listener($this->objOrder, $this->objCheckout);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());

        unset($listener);
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testPreCheckoutListenerSendsRedirectResponseWhenProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3336,  quantityBought = 1
        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '0';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // $parentProductId = 32; // Quantity 4, AVAILABLE, Skulptur 2

        // Item 3323, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // $sibling1Id = 45;

        // Another child product, not in cart, available
        // $sibling2Id = 101;

        // // Get the checkout page from the database
        // $objPage = $this->databaseAdapter->getInstance()
        //     ->prepare('SELECT * FROM tl_page WHERE id=?')
        //     ->execute(18)
        //     ->fetchAssoc()
        // ;

        // // Create a new instance of the PageModel class using the database result
        // $GLOBALS['objPage'] = new PageModel($objPage);

        // Instantiate a listener
        $listener = new PreCheckoutListener($this->framework);

        self::$client->request('GET', '/');

        $this->return = $listener($this->objOrder, $this->objCheckout);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());

        unset($listener);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsAVariantAndQuantityOfProductIncludingAllSiblingsIsLessThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3330;
        $quantityBought = 30;

        // Item initially has a quantity in cart of 99, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        // $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Parent product initially is RESERVED, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute(Helper::AVAILABLE, $parentProductId);
        // Item 3329
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantityBought 1

        // $sibling1Id = 96;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductIsAVariantAndQuantityOfProductIncludingAllSiblingsIsEqualToParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3330;
        // $quantityBought = 99;

        // $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        // $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3329
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantityBought 1

        // $sibling1Id = 96;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testPreCheckoutListenerSendsRedirectResponseWhenProductIsAVariantAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3330;
        $quantityBought = 100;
        // Item initially has a quantityBought of 99, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        // $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        // $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3329
        // product 96: quantity inherited , AVAILABLE, Variante "Kopie" Eintrittskarte 1
        // quantityBought 1

        // $sibling1Id = 96;

        // // Get the checkout page from the database
        // $objPage = $this->databaseAdapter->getInstance()
        //     ->prepare('SELECT * FROM tl_page WHERE id=?')
        //     ->execute(18)
        //     ->fetchAssoc()
        // ;

        // // Create a new instance of the PageModel class using the database result
        // $GLOBALS['objPage'] = new PageModel($objPage);

        // Instantiate a listener
        $listener = new PreCheckoutListener($this->framework);

        self::$client->request('GET', '/');

        $this->return = $listener($this->objOrder, $this->objCheckout);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());

        unset($listener);
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testPreCheckoutListenerReturnsTrueWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3327;
        // $quantityBought = 1;

        $productId = 38; // Available, Variante Original von Skulptur 4

        // Product iinitially is RESERVED, so we change the status to AVAILABLE to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET inventory_status=? WHERE id=?')->execute(Helper::AVAILABLE, $productId);
        $quantityOfProduct = 2;

        // Product initially has a quantity of 1, so we change the quantity of the product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // $parentProductId = 34; // unlimited quantity, Skulptur 4

        // Item 3326
        // product 39: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 4
        // quantityBought 1

        // $sibling1Id = 39;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testPreCheckoutListenerReturnsTrueWhenProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3325;
        // $quantityBought = 1;

        // $productId = 40; // AVAILABLE, Variante Original von Skulptur 3
        // $quantityOfProduct = 1;

        // $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3324
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantityBought 1

        // $sibling1Id = 42;

        $expectedReturn = true;

        $this->doTest($expectedReturn);
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testPreCheckoutListenerSendsRedirectResponseWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3325;
        $quantityBought = 2;

        // Item 3122 initially has a quantityBought of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        // $productId = 40; // AVAILABLE, Variante Original von Skulptur 3
        // $quantityOfProduct = 1;

        // $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3324
        // product 42: unlimited quantity , AVAILABLE, Variante Kopie Skulptur 3
        // quantityBought 1

        // $sibling1Id = 42;

        // // Get the checkout page from the database
        // $objPage = $this->databaseAdapter->getInstance()
        //     ->prepare('SELECT * FROM tl_page WHERE id=?')
        //     ->execute(18)
        //     ->fetchAssoc()
        // ;

        // // Create a new instance of the PageModel class using the database result
        // $GLOBALS['objPage'] = new PageModel($objPage);

        // Instantiate a listener
        $listener = new PreCheckoutListener($this->framework);

        self::$client->request('GET', '/');

        $this->return = $listener($this->objOrder, $this->objCheckout);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());

        unset($listener);
    }
}
