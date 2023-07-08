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

    private Standard $objProduct;
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

        $GLOBALS['TL_DCA']['tl_iso_product']['fields'] = [
            'id' => [
                'attributes' => ['systemColumn' => true],
                'sql' => 'int(10) unsigned NOT NULL auto_increment',
            ],
            'pid' => [
                // Fix for DC_Table, otherwise getPalette() will not use the PID value
                'eval' => ['submitOnChange' => true],
                'attributes' => ['systemColumn' => true],
                'sql' => "int(10) unsigned NOT NULL default '0'",
            ],
            'gid' => [
                'foreignKey' => Group::getTable() . '.name',
                'eval' => ['doNotShow' => true],
                'attributes' => ['systemColumn' => true, 'inherit' => true],
                'sql' => "int(10) unsigned NOT NULL default '0'",
                'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
            ],
            'tstamp' => [
                'attributes' => ['systemColumn' => true],
                'sql' => "int(10) unsigned NOT NULL default '0'",
            ],
            'language' => [
                'eval' => ['doNotShow' => true],
                'attributes' => ['systemColumn' => true, 'inherit' => true],
                'sql' => "varchar(5) NOT NULL default ''",
            ],
            'dateAdded' => [
                'eval' => ['rgxp' => 'datim', 'doNotCopy' => true],
                'attributes' => ['fe_sorting' => true, 'systemColumn' => true],
                'sql' => "int(10) unsigned NOT NULL default '0'",
            ],
            'type' => [
                'exclude' => true,
                'filter' => true,
                'inputType' => 'select',
                'options_callback' => ['Isotope\Backend\ProductType\Callback', 'getOptions'],
                'foreignKey' => ProductType::getTable() . '.name',
                'eval' => ['mandatory' => true, 'submitOnChange' => true, 'includeBlankOption' => true, 'tl_class' => 'w50 wizard', 'helpwizard' => true],
                'attributes' => ['legend' => 'general_legend', 'fixed' => true, 'inherit' => true, 'systemColumn' => true],
                'sql' => "int(10) unsigned NOT NULL default '0'",
                'relation' => ['type' => 'hasOne', 'load' => 'lazy'],
                'explanation' => 'tl_iso_product.type',
                'wizard' => [['Isotope\Backend\Product\Wizard', 'onProductTypeWizard']],
            ],
            'pages' => [
                'exclude' => true,
                'inputType' => 'pageTree',
                'foreignKey' => 'tl_page.title',
                'eval' => ['doNotSaveEmpty' => true, 'multiple' => true, 'fieldType' => 'checkbox', 'orderField' => 'orderPages', 'tl_class' => 'clr hide_sort_hint'],
                'relation' => ['type' => 'hasMany', 'load' => 'lazy'],
                'attributes' => ['legend' => 'general_legend', 'fixed' => true, 'inherit' => true, 'systemColumn' => true],
                'load_callback' => [
                    ['Isotope\Backend\Product\Category', 'load'],
                ],
                'save_callback' => [
                    ['Isotope\Backend\Product\Category', 'save'],
                ],
            ],
            'orderPages' => [
                'eval' => ['doNotShow' => true],
                'attributes' => ['systemColumn' => true, 'inherit' => true],
                'sql' => 'text NULL',
            ],
            'inherit' => [
                'exclude' => true,
                'inputType' => 'inheritCheckbox',
                'eval' => ['multiple' => true],
                'attributes' => ['systemColumn' => true],
                'sql' => 'blob NULL',
            ],
            'fallback' => [
                'exclude' => true,
                'inputType' => 'checkbox',
                'eval' => ['doNotCopy' => true, 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'general_legend', 'variant_fixed' => true, 'excluded' => true, 'systemColumn' => true],
                'sql' => "char(1) NOT NULL default ''",
                'save_callback' => [
                    ['Isotope\Backend\Product\Fallback', 'reset'],
                ],
            ],
            'alias' => [
                'exclude' => true,
                'search' => true,
                'sorting' => true,
                'inputType' => 'text',
                'eval' => ['rgxp' => 'alnum', 'doNotCopy' => true, 'spaceToUnderscore' => true, 'maxlength' => 128, 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'general_legend', 'fixed' => true, 'inherit' => true],
                'sql' => "varchar(128) NOT NULL default ''",
                'save_callback' => [
                    ['Isotope\Backend\Product\Alias', 'save'],
                ],
            ],
            'gtin' => [
                'exclude' => true,
                'search' => true,
                'sorting' => true,
                'inputType' => 'text',
                'eval' => ['maxlength' => 14, 'unique' => true, 'doNotCopy' => true, 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'general_legend', 'fe_search' => true, 'singular' => true],
                'sql' => "varchar(14) NOT NULL default ''",
            ],
            'sku' => [
                'exclude' => true,
                'search' => true,
                'sorting' => true,
                'inputType' => 'text',
                'eval' => ['mandatory' => true, 'maxlength' => 128, 'unique' => true, 'doNotCopy' => true, 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'general_legend', 'fe_sorting' => true, 'fe_search' => true, 'singular' => true],
                'sql' => "varchar(128) NOT NULL default ''",
            ],
            'name' => [
                'exclude' => true,
                'search' => true,
                'sorting' => true,
                'inputType' => 'text',
                'eval' => ['mandatory' => true, 'tl_class' => 'clr long'],
                'attributes' => ['legend' => 'general_legend', 'multilingual' => true, 'fixed' => true, 'fe_sorting' => true, 'fe_search' => true],
                'sql' => "varchar(255) NOT NULL default ''",
            ],
            'teaser' => [
                'exclude' => true,
                'search' => true,
                'inputType' => 'textarea',
                'eval' => ['style' => 'height:80px', 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'general_legend', 'multilingual' => true, 'fe_search' => true],
                'sql' => 'text NULL',
            ],
            'description' => [
                'exclude' => true,
                'search' => true,
                'inputType' => 'textarea',
                'eval' => ['mandatory' => true, 'rte' => 'tinyMCE', 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'general_legend', 'multilingual' => true, 'fe_search' => true],
                'sql' => 'text NULL',
            ],
            'meta_title' => [
                'exclude' => true,
                'search' => true,
                'inputType' => 'text',
                'eval' => ['maxlength' => 255, 'tl_class' => 'clr long'],
                'attributes' => ['legend' => 'meta_legend', 'multilingual' => true, 'variant_excluded' => true],
                'sql' => "varchar(255) NOT NULL default ''",
            ],
            'meta_description' => [
                'exclude' => true,
                'search' => true,
                'inputType' => 'textarea',
                'eval' => ['style' => 'height:60px', 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'meta_legend', 'multilingual' => true, 'variant_excluded' => true],
                'sql' => 'text NULL',
            ],
            'meta_keywords' => [
                'exclude' => true,
                'search' => true,
                'inputType' => 'textarea',
                'eval' => ['style' => 'height:40px', 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'meta_legend', 'multilingual' => true, 'variant_excluded' => true],
                'sql' => 'text NULL',
            ],
            'price' => [
                'exclude' => true,
                'inputType' => 'timePeriod',
                'foreignKey' => TaxClass::getTable() . '.name',
                'eval' => ['mandatory' => true, 'maxlength' => 13, 'rgxp' => 'digit', 'includeBlankOption' => true, 'blankOptionLabel' => &$GLOBALS['TL_LANG']['MSC']['taxFree'], 'doNotSaveEmpty' => true, 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'pricing_legend', 'fe_sorting' => true, 'dynamic' => true, 'singular' => true, 'systemColumn' => true, 'type' => '\Isotope\Model\Attribute\Price'],
                'load_callback' => [
                    ['\Isotope\Backend\Product\Price', 'load'],
                ],
                'save_callback' => [
                    ['\Isotope\Backend\Product\Price', 'save'],
                ],
            ],
            'prices' => [
                'inputType' => 'dcaWizard',
                'foreignTable' => ProductPrice::getTable(),
                'attributes' => ['systemColumn' => true],
                'eval' => [
                    'listCallback' => ['Isotope\Backend\ProductPrice\Callback', 'generateWizardList'],
                    'applyButtonLabel' => &$GLOBALS['TL_LANG']['tl_iso_product']['prices']['apply_and_close'],
                    'tl_class' => 'clr',
                ],
            ],
            'price_tiers' => [
                // This is only for automated table generation in the frontend
                'attributes' => ['type' => '\Isotope\Model\Attribute\PriceTiers'],
                'tableformat' => [
                    'min' => [
                        'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['price_tiers']['min'],
                        'format' => &$GLOBALS['TL_LANG']['tl_iso_product']['price_tiers']['min_format'],
                    ],
                    'price' => [
                        'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['price_tiers']['price'],
                        'rgxp' => 'digit',
                    ],
                    'tax_class' => [
                        'doNotShow' => true,
                    ],
                ],
            ],
            'baseprice' => [
                'exclude' => true,
                'inputType' => 'timePeriod',
                'foreignKey' => 'tl_iso_baseprice.name',
                'eval' => ['includeBlankOption' => true, 'rgxp' => 'digit', 'tl_class' => 'w50'],
                'attributes' => ['type' => '\Isotope\Model\Attribute\BasePrice', 'legend' => 'pricing_legend'],
                'sql' => "varchar(255) NOT NULL default ''",
            ],
            'shipping_weight' => [
                'exclude' => true,
                'inputType' => 'timePeriod',
                'default' => ['unit' => 'kg'],
                'options' => ['mg', 'g', 'kg', 't', 'ct', 'oz', 'lb', 'st', 'grain'],
                'reference' => &$GLOBALS['TL_LANG']['WGT'],
                'eval' => ['rgxp' => 'digit', 'tl_class' => 'w50', 'helpwizard' => true],
                'attributes' => ['legend' => 'shipping_legend', 'type' => '\Isotope\Model\Attribute\Weight'],
                'sql' => "varchar(255) NOT NULL default ''",
            ],
            'shipping_exempt' => [
                'exclude' => true,
                'inputType' => 'checkbox',
                'eval' => ['tl_class' => 'w50'],
                'attributes' => ['legend' => 'shipping_legend', 'systemColumn' => true],
                'sql' => "char(1) NOT NULL default ''",
            ],
            'shipping_pickup' => [
                'exclude' => true,
                'inputType' => 'checkbox',
                'eval' => ['tl_class' => 'w50'],
                'attributes' => ['legend' => 'shipping_legend', 'systemColumn' => true],
                'sql' => "char(1) NOT NULL default ''",
            ],
            'shipping_price' => [
                'exclude' => true,
                'inputType' => 'text',
                'eval' => ['rgxp' => 'digit', 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'shipping_legend', 'systemColumn' => true, 'type' => '\Isotope\Model\Attribute\ShippingPrice'],
                'sql' => "decimal(9,2) unsigned NOT NULL default '0.00'",
            ],
            'images' => [
                'exclude' => true,
                'inputType' => 'mediaManager',
                'explanation' => 'mediaManager',
                'eval' => ['extensions' => $GLOBALS['TL_CONFIG']['validImageTypes'], 'helpwizard' => true, 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'media_legend', 'fixed' => true, 'multilingual' => true, 'dynamic' => true, 'systemColumn' => true, 'fetch_fallback' => true],
                'sql' => 'blob NULL',
            ],
            'protected' => [
                'exclude' => true,
                'filter' => true,
                'inputType' => 'checkbox',
                'eval' => ['submitOnChange' => true, 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'expert_legend', 'systemColumn' => true],
                'sql' => "char(1) NOT NULL default ''",
            ],
            'groups' => [
                'exclude' => true,
                'filter' => true,
                'inputType' => 'checkbox',
                'foreignKey' => 'tl_member_group.name',
                'eval' => ['mandatory' => true, 'multiple' => true, 'systemColumn' => true],
                'sql' => 'blob NULL',
                'relation' => ['type' => 'hasMany', 'load' => 'lazy'],
            ],
            'guests' => [
                'exclude' => true,
                'inputType' => 'checkbox',
                'eval' => ['tl_class' => 'w50'],
                'attributes' => ['legend' => 'expert_legend', 'systemColumn' => true],
                'sql' => "char(1) NOT NULL default ''",
            ],
            'cssID' => [
                'exclude' => true,
                'inputType' => 'text',
                'eval' => ['multiple' => true, 'size' => 2, 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'expert_legend'],
                'sql' => "varchar(255) NOT NULL default ''",
            ],
            'published' => [
                'exclude' => true,
                'filter' => true,
                'inputType' => 'checkbox',
                'eval' => ['doNotCopy' => true, 'tl_class' => 'clr'],
                'attributes' => ['legend' => 'publish_legend', 'fixed' => true, 'variant_fixed' => true, 'systemColumn' => true],
                'sql' => "char(1) NOT NULL default ''",
                'save_callback' => [
                    ['Isotope\Backend', 'truncateProductCache'],
                ],
            ],
            'start' => [
                'exclude' => true,
                'inputType' => 'text',
                'eval' => ['rgxp' => 'datim', 'datepicker' => true, 'tl_class' => 'w50 wizard'],
                'attributes' => ['legend' => 'publish_legend', 'fixed' => true, 'variant_fixed' => true, 'systemColumn' => true],
                'sql' => "varchar(10) NOT NULL default ''",
            ],
            'stop' => [
                'exclude' => true,
                'inputType' => 'text',
                'eval' => ['rgxp' => 'datim', 'datepicker' => true, 'tl_class' => 'w50 wizard'],
                'attributes' => ['legend' => 'publish_legend', 'fixed' => true, 'variant_fixed' => true, 'systemColumn' => true],
                'sql' => "varchar(10) NOT NULL default ''",
            ],
            'variantFields' => [
                'label' => &$GLOBALS['TL_LANG'][ProductType::getTable()]['variant_attributes'],
            ],
            'source' => [
                'eval' => ['mandatory' => true, 'required' => true, 'fieldType' => 'radio'],
            ],
            'inventory_status' => [
                'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['inventory_status'],
                'reference' => &$GLOBALS['TL_LANG']['MSC'],
                'filter' => true,
                'search' => true,
                'inputType' => 'radio',
                'options' => ['1', '2', '3', '4'],
                'eval' => ['feEditable' => true, 'feViewable' => true, 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'general_legend', 'fe_filter' => true, 'fe_search' => true, 'fe_sorting' => true],
                'sql' => "char(1) NOT NULL default '2'",
            ],
            'quantity' => [
                'label' => &$GLOBALS['TL_LANG']['tl_iso_product']['quantity'],
                'filter' => true,
                'sorting' => true,
                'inputType' => 'text',
                'eval' => ['mandatory' => false, 'doNotShow' => false, 'tl_class' => 'w50'],
                'attributes' => ['legend' => 'general_legend', 'multilingual' => false, 'fe_sorting' => true],
                'sql' => "varchar(255) NOT NULL default ''",
            ],
        ];

        $GLOBALS['TL_DCA']['tl_iso_product']['attributes'] = [];

        Product::registerModelType("standard", Standard::class);

        // Alternatively, but not recommended, you can load objects from the database like this:
        //
        // /** @var string $query */
        // $query = 'SELECT * FROM tl_iso_product_collection WHERE id = ?';

        // $id = '263';
        // /** @var Result $result */
        // $result = $this->databaseAdapter->getInstance()->prepare($query)->execute($id);

        // $objCart = new Cart($result);
        //
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
