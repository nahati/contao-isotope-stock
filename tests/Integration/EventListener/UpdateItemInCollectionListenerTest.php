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
use Isotope\Model\Group;
use Isotope\Model\Product;
use Isotope\Model\Product\Standard;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Isotope\Model\ProductPrice;
use Isotope\Model\ProductType;
use Isotope\Model\TaxClass;
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

    // private Standard $objProduct;
    // private Standard $objProduct1;
    // private Standard $objProduct2;
    // private Standard $objProduct3;
    // private Standard $objProduct4;
    // private Standard $objProduct6;
    // private Standard $objParentProduct;

    private string $inventory_status;
    private string $AVAILABLE = '2'; /* product available for sale */
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

        // // Drop all tables
        // foreach ($this->databaseAdapter->getInstance()->listTables() as $table) {
        //     $sql = 'DROP TABLE IF EXISTS ' . $table;
        //     $this->databaseAdapter->getInstance()->execute($sql);
        // }

        // // Create tables and insert data
        // $this->loadFixture('ContaoIsotopeStockBundleTest.sql');

        // These assignments link the tables with the model classes. Now you can use the model classes to access and manipulate the data in the tables.
        $GLOBALS['TL_MODELS']['tl_iso_producttype'] = ProductType::class;
        $GLOBALS['TL_MODELS']['tl_iso_product'] = Standard::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection'] = ProductCollection::class;
        $GLOBALS['TL_MODELS']['tl_iso_product_collection_item'] = ProductCollectionItem::class;

        // Declare additional fields for tl_iso_product
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

        Product::registerModelType("standard", Standard::class);
    }

    private function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

        $this->databaseAdapter->getInstance()->execute($sql);
        // $this->connection->executeStatement($sql);
    }

    /**
     * setup() is called for each Testcase and contains the basic setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        parent::setUp();

        // Instantiate a Cart object with id '263'
        $this->objCart = Cart::findByPk('263');

        // dump($this->objCart);
    }

    // public function testTrueIsTrue(): void
    // {
    //     $this->assertTrue(true);
    // }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityWhenProductIsNotAVariantAndProductHasUnlimitedQuantity(): void
    {
        // Instantiate the Item with id '3105' of this Cart
        $this->objItem = ProductCollectionItem::findByPk('3105');

        // Create an arry $arrSet with quantity 1
        $this->arrSet = ['quantity' => 1];

        $listener = new UpdateItemInCollectionListener($this->framework);
        $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if arrSet is returned unchanged
        $this->assertSame($this->return, ['quantity' => 1]);
    }
}
