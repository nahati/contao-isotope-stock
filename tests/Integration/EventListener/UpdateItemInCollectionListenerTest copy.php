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
use Isotope\Isotope;

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
    private Standard $objProduct;
    private Cart $objCart;
    private mixed $arrSet;
    private mixed $return;

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

    self::setIsotopeSpecificThings();
    }

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

    private static function loadFixture(string $fileName): void
    {
    $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

    self::$databaseAdapter->getInstance()->execute($sql);
    }

    private static function setIsotopeSpecificThings(): void
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

    protected function setUp(): void
    {
    parent::setUp();

    // Initialize the Contao framework
    self::$framework = static::getContainer()->get('contao.framework');
    self::$framework->initialize();

    // Get a database adpater and reset relevant tables
    self::$databaseAdapter = self::$framework->getAdapter(Database::class);
    $this->resetRelevantDatabaseTables();
    // We reset these table BEFORE each test to ensure that each test starts with the same relevant initial state and to enable a database lookup from outside after a test has run to check the database tables.

    // Instantiate a Cart object with given id
    $this->objCart = Cart::findByPk('265', ['return' => 'Model']);

    // Check if Cart object exists
    $this->assertNotNull($this->objCart);
    }

    protected function tearDown(): void
    {
    parent::tearDown();
    }

    public function testUpdateItemInCollectionListenerReturnsUnchangedQuantityAndSetsProductReservedWhenProductIsNotAVariantAndQuantityInCartIsEqualToProductQuantity(): void
    {
    // Cart 265
    // Item 3115
    // product 100: quantity 2 Bild 2
    // quantity in Cart 2

    // Instantiate the Item with given id of this Cart
    $this->objItem = ProductCollectionItem::findByPk('3115', ['return' => 'Model']);

    // Create an arry $arrSet with quantity 2 (quantity in Cart is 2)
    $this->arrSet = ['quantity' => 2];

    $listener = new UpdateItemInCollectionListener(self::$framework);
    $this->return = $listener($this->objItem, $this->arrSet, $this->objCart);

    // Test if arrSet is returned unchanged
    $this->assertSame($this->return, ['quantity' => 2]);

    // This by unknown reasons does not work (we will get an old state of the object)
    // $this->objProduct = Standard::findByPk('100', array('return' => 'Model'));
    // Test if inventory_status of the product has been set to RESERVED
    // Laden Sie das Objekt neu, um sicherzustellen, dass es nicht aus dem Cache geladen wird
    $this->objProduct = Product::findByPk('100');

    // Rufen Sie die findByPk()-Methode auf, um das aktualisierte Objekt aus der Datenbank zu laden
    $this->objProduct = Standard::findByPk('100', array('return' => 'Model'));
    $this->assertSame($this->objProduct->inventory_status, $this->RESERVED);

    $objResult = self::$databaseAdapter->getInstance()->prepare('SELECT * FROM tl_iso_product WHERE id=?')->execute(100);

    $this->assertSame($objResult->inventory_status, $this->RESERVED);
    }
    }