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
        $this->doNeededInitializations();

        // Instantiate an order object with given id
        $this->objOrder = Order::class::findByPk('270', ['return' => 'Model']);

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
     * Reset relevant tables of the database to the Checkout state.
     */
    private function resetRelevantDatabaseTables(): void
    {
        // Reset ProductCollectionItem-table to Checkout state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection_item';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection_item-Checkout.sql');

        // Reset Product-table to Checkout state
        $sql = 'DROP TABLE ' . 'tl_iso_product';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product-Checkout.sql');

        // Reset ProductCollection-table to Checkout state
        $sql = 'DROP TABLE ' . 'tl_iso_product_collection';
        $this->databaseAdapter->getInstance()->execute($sql);
        $this->loadFixture('tl_iso_product_collection-Checkout.sql');
    }

    /**
     * Builds an sql query to load the database tables into the database
     * Files are located in the Fixtures folder and have been exported from the Checkout database.
     */
    private function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

        $this->databaseAdapter->getInstance()->execute($sql);
    }

    /**
     * Do needed Isotope and Notification Center initializations.
     */
    private function doNeededInitializations(): void
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

        $GLOBALS['TL_LANG']['ERR']['minQuantityPerOrderUnreached'] = 'The minimum quantity per order for "%s" is %d items';

        $GLOBALS['TL_LANG']['ERR']['productNotSellableAsMinQuantityPerOrderUnreached'] = 'product "%s" can not be bought in this quantity as the minimum quantity per
        order is not
        reached';

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
    public function testPreCheckoutListenerReturnsTrueWhenEverythingIsRight(): void
    {
        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(true);
    }

    /**
     * @group non-variant_products
     */
    public function testPreCheckoutListenerReturnsFalseAndSendsRedirectResponseWhenMinQuantityPerOrderIsUnreached(): void
    {
        // $productId = 103; // Bild 2a, minQuantityPerOrder 2, quantity 2

        // Item 3329 of the order initially has a quantity of 2, so we change this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute(1, 3329);
        // quantity in order = 1 -> minQuantityPerOrder is unreached

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the client
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }

    /**
     * @group non-variant_products
     */
    public function testPreCheckoutListenerReturnsFalseWhenMinQuantityPerOrderIsUnreachable(): void
    {
        $productId = 103; // Bild 2a, minQuantityPerOrder 3 but quantity 2 -> unreachable!
        $minQuantityPerOrderAndProduct = 3;
        // Product initially has a minQuantityPerOrder of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET minQuantityPerOrder=? WHERE id=?')->execute($minQuantityPerOrderAndProduct, $productId);

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the client
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }

    /**
     * @group non-variant_products
     */
    public function testPreCheckoutListenerReturnsFalseAndSendsRedirectResponseWhenProductIsNotAVariantAndQuantityOfProductExceedsProductQuantity(): void
    {
        // $itemId = 3315,  quantityBought = 1

        $productId = 100; // AVAILABLE, Bild 2
        $quantityOfProduct = '0';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // $parentProductId = 0; // no parent product

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the client
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }

    /**
     * @group variant_products__quantity_in_cart_is_less_than_product_quantity
     */
    public function testPreCheckoutListenerReturnsFalseAndSendsRedirectResponseWhenProductIsAVariantAndQuantityBoughtIsLessThanProductQuantityAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3319,  quantityBought = 1
        // $productId = 44; // quantity 2 , AVAILABLE, Variante Kopie Skulptur 2

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '1';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3320, quantityBought 1
        // product 45: quantity 1 , AVAILABLE, Variante Original Skulptur 2
        // $sibling1Id = 45;

        // Another child product with id 101 exist, which is Available
        // $sibling2Id = 101;

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }

    /**
     * @group variant_products__quantity_in_cart_is_equal_to_product_quantity
     */
    public function testPreCheckoutListenerReturnsFalseAndSendsRedirectResponseWhenProductIsAVariantAndQuantityBoughtIsEqualToProductQuantityAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3319,  quantityBought = 1
        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '1';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        $parentProductId = 32; // AVAILABLE, Skulptur 2
        $quantityOfParentProduct = '1';
        // Parent product initially has a quantity of 4, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfParentProduct, $parentProductId);

        // Item 3320, quantityBought 1
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

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }

    /**
     * @group variant_products__quantity_in_cart_is_greater_than_product_quantity
     */
    public function testPreCheckoutListenerReturnsFalseAndSendsRedirectResponseWhenProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        // $itemId = 3319,  quantityBought = 1
        $productId = 44; //  AVAILABLE, Variante Kopie Skulptur 2

        $quantityOfProduct = '0';
        // Product initially has a quantity of 2, so we change the quantity of parent product to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product SET quantity=? WHERE id=?')->execute($quantityOfProduct, $productId);

        // $parentProductId = 32; // Quantity 4, AVAILABLE, Skulptur 2

        // Item 3320, quantityBought 1
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

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }

    /**
     * @group variant_products__inherited_quantity
     */
    public function testPreCheckoutListenerReturnsFalseAndSendsRedirectResponseWhenProductIsAVariantAndQuantityOfProductIncludingAllSiblingsIsGreaterThanParentQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3327;
        $quantityBought = 100;
        // Item initially has a quantityBought of 99, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        // $productId = 97; // quantity inherited , AVAILABLE, Variante "Original" Eintrittskarte 1

        // $parentProductId = 35; //  quantity 100, AVAILABLE, Eintrittskarte 1

        // Item 3326
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

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }

    /**
     * @group variant_products__parent_quantity_is_unlimited
     */
    public function testPreCheckoutListenerReturnsFalseAndSendsRedirectResponseWhenParentProductHasUnlimitedQuantityAndProductIsAVariantAndQuantityBoughtIsGreaterThanProductQuantityAndProductHasUnlimitedQuantityPerOrder(): void
    {
        $itemId = 3322;
        $quantityBought = 2;

        // Item initially has a quantityBought of 1, so we change the this to match the testcase
        $this->databaseAdapter->getInstance()->prepare('UPDATE tl_iso_product_collection_item SET quantity=? WHERE id=?')->execute($quantityBought, $itemId);

        // $productId = 40; // AVAILABLE, Variante Original von Skulptur 3
        // $quantityOfProduct = 1;

        // $parentProductId = 33; // unlimited quantity, Skulptur 3

        // Item 3321
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

        self::$client->request('GET', '/shop/warenkorb/kasse/review.html');

        // Before each request, the client reboots the kernel, recreating the container from scratch. Therefore we need to reinitialize the Contao Framework.
        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();

        $this->doTest(false);

        // Get the response from the lient
        $response = self::$client->getResponse();

        // Assert that a redirect response (HTTP_FOUND) has been sent
        $this->assertInstanceOf(Response::class, $response);
        $this->assertSame(Response::HTTP_MOVED_PERMANENTLY, $response->getStatusCode());
    }
}
