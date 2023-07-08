<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

use Composer\InstalledVersions;
use Isotope\Frontend\ProductAction\CartAction;
use Isotope\Frontend\ProductAction\FavoriteAction;
use Isotope\Frontend\ProductAction\Registry;
use Isotope\Frontend\ProductAction\UpdateAction;
use Isotope\Frontend\ProductAction\WishlistAction;
use Isotope\Model\Address;
use Isotope\Model\Attribute;
use Isotope\Model\AttributeOption;
use Isotope\Model\BasePrice;
use Isotope\Model\Config;
use Isotope\Model\Document;
use Isotope\Model\Download;
use Isotope\Model\Gallery;
use Isotope\Model\Group;
use Isotope\Model\Label;
use Isotope\Model\OrderStatus;
use Isotope\Model\Payment;
use Isotope\Model\Product;
use Isotope\Model\ProductCache;
use Isotope\Model\ProductCategory;
use Isotope\Model\ProductCollection;
use Isotope\Model\ProductCollectionDownload;
use Isotope\Model\ProductCollectionItem;
use Isotope\Model\ProductCollectionLog;
use Isotope\Model\ProductCollectionSurcharge;
use Isotope\Model\ProductPrice;
use Isotope\Model\ProductType;
use Isotope\Model\RelatedCategory;
use Isotope\Model\RelatedProduct;
use Isotope\Model\RequestCache;
use Isotope\Model\Shipping;
use Isotope\Model\TaxClass;
use Isotope\Model\TaxRate;

/*
 * Backend modules
 */
if (!is_array($GLOBALS['BE_MOD']['isotope'] ?? null)) {
    if (!is_array($GLOBALS['BE_MOD'] ?? null)) {
        $GLOBALS['BE_MOD'] = [];
    }
    $GLOBALS['BE_MOD']['isotope'] = [];
}

array_splice($GLOBALS['BE_MOD']['isotope'], 0, 0, [
    'iso_products' => [
        'tables' => [Product::getTable(), Group::getTable(), ProductCategory::getTable(), Download::getTable(), RelatedProduct::getTable(), ProductPrice::getTable(), 'tl_iso_product_pricetier', AttributeOption::getTable()],
        'javascript' => 'system/modules/isotope/assets/js/backend.js',
        'generate' => ['Isotope\Backend\Product\VariantGenerator', 'generate'],
        'import' => ['Isotope\Backend\Product\AssetImport', 'generate'],
        'fallback' => ['Isotope\Backend\Product\Fallback', 'setFromUrl'],
    ],
    'iso_orders' => [
        'tables' => [ProductCollection::getTable(), ProductCollectionItem::getTable(), ProductCollectionSurcharge::getTable(), ProductCollectionDownload::getTable(), Address::getTable()],
        'javascript' => 'system/modules/isotope/assets/js/backend.js',
        'print_document' => ['Isotope\Backend\ProductCollection\Callback', 'printDocument'],
        'payment' => ['Isotope\Backend\ProductCollection\Callback', 'paymentInterface'],
        'shipping' => ['Isotope\Backend\ProductCollection\Callback', 'shippingInterface'],
    ],
    'iso_setup' => [
        'callback' => 'Isotope\BackendModule\Setup',
        'tables' => [],
        'javascript' => 'system/modules/isotope/assets/js/backend.js',
    ],
]);

$GLOBALS['BE_MOD']['accounts']['member']['tables'][] = Address::getTable();

if ('BE' === TL_MODE) {
    $GLOBALS['TL_CSS'][] = 'system/modules/isotope/assets/css/backend.css|static';
}

/*
 * Isotope Modules
 */
$GLOBALS['ISO_MOD'] = [
    'product' => [
        'producttypes' => [
            'tables' => [ProductType::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-producttypes.png',
        ],
        'attributes' => [
            'tables' => [Attribute::getTable(), AttributeOption::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-attributes.png',
        ],
        'related_categories' => [
            'tables' => [RelatedCategory::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-related_categories.png',
        ],
        'baseprice' => [
            'tables' => [BasePrice::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-baseprice.png',
        ],
    ],
    'checkout' => [
        'payment' => [
            'tables' => [Payment::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-payment.png',
        ],
        'shipping' => [
            'tables' => [Shipping::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-shipping.png',
        ],
        'tax_class' => [
            'tables' => [TaxClass::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-tax_class.png',
        ],
        'tax_rate' => [
            'tables' => [TaxRate::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-tax_rate.png',
        ],
    ],
    'config' => [
        'configs' => [
            'tables' => [Config::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-config.png',
        ],
        'orderstatus' => [
            'tables' => [OrderStatus::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-orderstatus.png',
        ],
        'notifications' => [
            'icon' => 'system/modules/isotope/assets/images/setup-notifications.png',
            'redirect' => 'contao/main.php?do=nc_notifications',
        ],
        'documents' => [
            'tables' => [Document::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-documents.png',
        ],
        'gallery' => [
            'tables' => [Gallery::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-gallery.png',
        ],
    ],
    'miscellaneous:hide' => [
        'labels' => [
            'tables' => [Label::getTable()],
            'icon' => 'system/modules/isotope/assets/images/setup-labels.png',
        ],
        'integrity' => [
            'callback' => 'Isotope\BackendModule\Integrity',
            'icon' => 'system/modules/isotope/assets/images/setup-integrity.png',
        ],
    ],
];

/*
 * Frontend modules
 */
$GLOBALS['FE_MOD']['isotope'] = [
    'iso_productlist' => 'Isotope\Module\ProductList',
    'iso_productvariantlist' => 'Isotope\Module\ProductVariantList',
    'iso_productreader' => 'Isotope\Module\ProductReader',
    'iso_favorites' => 'Isotope\Module\Favorites',
    'iso_cart' => 'Isotope\Module\Cart',
    'iso_checkout' => 'Isotope\Module\Checkout',
    'iso_productfilter' => 'Isotope\Module\ProductFilter',
    'iso_cumulativefilter' => 'Isotope\Module\CumulativeFilter',
    'iso_categoryfilter' => 'Isotope\Module\CategoryFilter',
    'iso_rangefilter' => 'Isotope\Module\RangeFilter',
    'iso_orderhistory' => 'Isotope\Module\OrderHistory',
    'iso_orderdetails' => 'Isotope\Module\OrderDetails',
    'iso_wishlistmanager' => 'Isotope\Module\WishlistManager',
    'iso_wishlistviewer' => 'Isotope\Module\WishlistViewer',
    'iso_wishlistdetails' => 'Isotope\Module\WishlistDetails',
    'iso_configswitcher' => 'Isotope\Module\ConfigSwitcher',
    'iso_addressbook' => 'Isotope\Module\AddressBook',
    'iso_relatedproducts' => 'Isotope\Module\RelatedProducts',
    'iso_messages' => 'Isotope\Module\Messages',
    'iso_shipping_calculator' => 'Isotope\Module\ShippingCalculator',
    'iso_cart_address' => 'Isotope\Module\CartAddress',
    'iso_trustedshops' => 'Isotope\Module\Trustedshops',
];

/*
 * Backend form fields
 */
$GLOBALS['BE_FFL']['mediaManager'] = 'Isotope\Widget\MediaManager';
$GLOBALS['BE_FFL']['inheritCheckbox'] = 'Isotope\Widget\InheritCheckBox';

/*
 * Payment methods
 */
Payment::registerModelType('cash', 'Isotope\Model\Payment\Cash');
Payment::registerModelType('concardis', 'Isotope\Model\Payment\Concardis');
Payment::registerModelType('datatrans', 'Isotope\Model\Payment\Datatrans');
Payment::registerModelType('epay', 'Isotope\Model\Payment\EPay');
Payment::registerModelType('expercash', 'Isotope\Model\Payment\Expercash');
Payment::registerModelType('innopay', 'Isotope\Model\Payment\Innopay');
Payment::registerModelType('paybyway', 'Isotope\Model\Payment\Paybyway');
Payment::registerModelType('payone', 'Isotope\Model\Payment\Payone');
Payment::registerModelType('paypal', 'Isotope\Model\Payment\Paypal');
Payment::registerModelType('paypal_plus', 'Isotope\Model\Payment\PaypalPlus');
Payment::registerModelType('postfinance', 'Isotope\Model\Payment\Postfinance');
Payment::registerModelType('quickpay', 'Isotope\Model\Payment\QuickPay');
Payment::registerModelType('saferpay', 'Isotope\Model\Payment\Saferpay');
Payment::registerModelType('billpay_saferpay', 'Isotope\Model\Payment\BillpayWithSaferpay');
Payment::registerModelType('sparkasse', 'Isotope\Model\Payment\Sparkasse');
Payment::registerModelType('sofortueberweisung', 'Isotope\Model\Payment\Sofortueberweisung');
Payment::registerModelType('viveum', 'Isotope\Model\Payment\Viveum');
Payment::registerModelType('worldpay', 'Isotope\Model\Payment\Worldpay');
Payment::registerModelType('opp', 'Isotope\Model\Payment\OpenPaymentPlatform');

if (class_exists('Mpay24\Mpay24')) {
    Payment::registerModelType('mpay24', 'Isotope\Model\Payment\Mpay24');
}

if (class_exists('Terminal42\SwissbillingApi\Client')) {
    Payment::registerModelType('swissbilling', 'Isotope\Model\Payment\Swissbilling');
}

/*
 * Shipping methods
 */
Shipping::registerModelType('flat', 'Isotope\Model\Shipping\Flat');
Shipping::registerModelType('group', 'Isotope\Model\Shipping\Group');
Shipping::registerModelType('product_price', 'Isotope\Model\Shipping\ProductPrice');

if (class_exists('Petschko\DHL\BusinessShipment')) {
    Shipping::registerModelType('dhl_business', 'Isotope\Model\Shipping\DHLBusiness');
}

/*
 * Documents
 */
Document::registerModelType('standard', 'Isotope\Model\Document\Standard');

/*
 * Galleries
 */
Gallery::registerModelType('standard', 'Isotope\Model\Gallery\Standard');
Gallery::registerModelType('inline', 'Isotope\Model\Gallery\Inline');
Gallery::registerModelType('elevatezoom', 'Isotope\Model\Gallery\ElevateZoom');

/*
 * Products
 */
Product::registerModelType('standard', 'Isotope\Model\Product\Standard');

/*
 * Product collections
 */
ProductCollection::registerModelType('cart', 'Isotope\Model\ProductCollection\Cart');
ProductCollection::registerModelType('order', 'Isotope\Model\ProductCollection\Order');
ProductCollection::registerModelType('favorites', 'Isotope\Model\ProductCollection\Favorites');
ProductCollection::registerModelType('wishlist', 'Isotope\Model\ProductCollection\Wishlist');

/*
 * Product collection surcharge
 */
ProductCollectionSurcharge::registerModelType('payment', 'Isotope\Model\ProductCollectionSurcharge\Payment');
ProductCollectionSurcharge::registerModelType('shipping', 'Isotope\Model\ProductCollectionSurcharge\Shipping');
ProductCollectionSurcharge::registerModelType('tax', 'Isotope\Model\ProductCollectionSurcharge\Tax');

/*
 * Attributes
 */
Attribute::registerModelType('text', 'Isotope\Model\Attribute\TextField');
Attribute::registerModelType('textarea', 'Isotope\Model\Attribute\TextArea');
Attribute::registerModelType('select', 'Isotope\Model\Attribute\SelectMenu');
Attribute::registerModelType('radio', 'Isotope\Model\Attribute\RadioButton');
Attribute::registerModelType('checkbox', 'Isotope\Model\Attribute\CheckboxMenu');
Attribute::registerModelType('mediaManager', 'Isotope\Model\Attribute\MediaManager');
Attribute::registerModelType('fileTree', 'Isotope\Model\Attribute\FileTree');
Attribute::registerModelType('pageTree', 'Isotope\Model\Attribute\PageTree');
Attribute::registerModelType('downloads', 'Isotope\Model\Attribute\Downloads');
Attribute::registerModelType('upload', 'Isotope\Model\Attribute\Upload');
Attribute::registerModelType('media', 'Isotope\Model\Attribute\Media');
Attribute::registerModelType('quantitySurcharge', 'Isotope\Model\Attribute\QuantitySurcharge');

if (InstalledVersions::isInstalled('terminal42/contao-fineuploader')) {
    Attribute::registerModelType('fineUploader', 'Isotope\Model\Attribute\FineUploader');
}

/*
 * Product actions
 */
Registry::add(new UpdateAction());
Registry::add(new CartAction());
Registry::add(new FavoriteAction());
Registry::add(new WishlistAction());

/*
 * Notification Center notification types
 */
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['recipients'] = ['recipient_email', 'form_*', 'billing_address_email', 'shipping_address_email'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['attachment_tokens'] = ['form_*', 'document'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_text'] = [
    'uniqid',
    'order_status',
    'order_status_old',
    'order_status_id',
    'order_status_id_old',
    'order_status_tracking_numbers',
    'order_status_notes',
    'recipient_email',
    'order_id',
    'order_items',
    'order_products',
    'order_subtotal',
    'order_total',
    'document_number',
    'cart_html',
    'cart_text',
    'document',
    'bank_name',
    'bank_account',
    'bank_code',
    'tax_number',
    'collection_*', // All the collection fields
    'billing_address', // Formatted billing address
    'billing_address_*', // All the billing address model fields
    'shipping_address', // Formatted shipping address
    'shipping_address_*', // All the shipping address model fields
    'form_*', // All the order condition form fields
    'payment_id', // Payment method ID
    'payment_label', // Payment method label
    'payment_note', // Payment method note
    'payment_*',
    'shipping_id', // Shipping method ID
    'shipping_label', // Shipping method label
    'shipping_note', // Shipping method note
    'shipping_*',
    'config_*', // Store configuration model fields
    'member_*', // Member model fields
];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_subject'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_text'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_html'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_text'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_replyTo'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['recipients'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_recipient_cc'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['recipients'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_recipient_bcc'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['recipients'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['file_name'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_text'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['file_content'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_order_status_change']['email_text'];

$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['recipients'] = ['admin_email', 'address_email', 'member_email'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_subject'] = ['admin_email', 'address_*', 'address_old_*', 'member_*', 'config_*'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_text'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_subject'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_sender_name'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_subject'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_sender_address'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_subject'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_replyTo'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_subject'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['file_name'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_subject'];
$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['file_content'] = &$GLOBALS['NOTIFICATION_CENTER']['NOTIFICATION_TYPE']['isotope']['iso_memberaddress_change']['email_subject'];

/*
 * Models
 */
$GLOBALS['TL_MODELS'][Address::getTable()] = 'Isotope\Model\Address';
$GLOBALS['TL_MODELS'][Attribute::getTable()] = 'Isotope\Model\Attribute';
$GLOBALS['TL_MODELS'][AttributeOption::getTable()] = 'Isotope\Model\AttributeOption';
$GLOBALS['TL_MODELS'][BasePrice::getTable()] = 'Isotope\Model\BasePrice';
$GLOBALS['TL_MODELS'][Config::getTable()] = 'Isotope\Model\Config';
$GLOBALS['TL_MODELS'][Document::getTable()] = 'Isotope\Model\Document';
$GLOBALS['TL_MODELS'][Download::getTable()] = 'Isotope\Model\Download';
$GLOBALS['TL_MODELS'][Gallery::getTable()] = 'Isotope\Model\Gallery';
$GLOBALS['TL_MODELS'][Group::getTable()] = 'Isotope\Model\Group';
$GLOBALS['TL_MODELS'][Label::getTable()] = 'Isotope\Model\Label';
$GLOBALS['TL_MODELS'][OrderStatus::getTable()] = 'Isotope\Model\OrderStatus';
$GLOBALS['TL_MODELS'][Payment::getTable()] = 'Isotope\Model\Payment';
$GLOBALS['TL_MODELS'][Product::getTable()] = 'Isotope\Model\Product';
$GLOBALS['TL_MODELS'][ProductCategory::getTable()] = 'Isotope\Model\ProductCategory';
$GLOBALS['TL_MODELS'][ProductCollection::getTable()] = 'Isotope\Model\ProductCollection';
$GLOBALS['TL_MODELS'][ProductCollectionDownload::getTable()] = 'Isotope\Model\ProductCollectionDownload';
$GLOBALS['TL_MODELS'][ProductCollectionItem::getTable()] = 'Isotope\Model\ProductCollectionItem';
$GLOBALS['TL_MODELS'][ProductCollectionLog::getTable()] = 'Isotope\Model\ProductCollectionLog';
$GLOBALS['TL_MODELS'][ProductCollectionSurcharge::getTable()] = 'Isotope\Model\ProductCollectionSurcharge';
$GLOBALS['TL_MODELS'][ProductPrice::getTable()] = 'Isotope\Model\ProductPrice';
$GLOBALS['TL_MODELS'][ProductCache::getTable()] = 'Isotope\Model\ProductCache';
$GLOBALS['TL_MODELS'][ProductType::getTable()] = 'Isotope\Model\ProductType';
$GLOBALS['TL_MODELS'][RelatedCategory::getTable()] = 'Isotope\Model\RelatedCategory';
$GLOBALS['TL_MODELS'][RelatedProduct::getTable()] = 'Isotope\Model\RelatedProduct';
$GLOBALS['TL_MODELS'][RequestCache::getTable()] = 'Isotope\Model\RequestCache';
$GLOBALS['TL_MODELS'][Shipping::getTable()] = 'Isotope\Model\Shipping';
$GLOBALS['TL_MODELS'][TaxClass::getTable()] = 'Isotope\Model\TaxClass';
$GLOBALS['TL_MODELS'][TaxRate::getTable()] = 'Isotope\Model\TaxRate';

/*
 * Checkout steps
 */
$GLOBALS['ISO_CHECKOUTSTEP'] = [
    'address' => ['Isotope\CheckoutStep\BillingAddress', 'Isotope\CheckoutStep\ShippingAddress'],
    'shipping' => ['Isotope\CheckoutStep\ShippingMethod'],
    'payment' => ['Isotope\CheckoutStep\PaymentMethod'],
    'review' => ['Isotope\CheckoutStep\OrderInfo', 'Isotope\CheckoutStep\OrderProducts'],
];

/*
 * Integrity checks
 */
$GLOBALS['ISO_INTEGRITY'] = [
    '\Isotope\IntegrityCheck\PriceTable',
    '\Isotope\IntegrityCheck\VariantPrices',
    '\Isotope\IntegrityCheck\VariantOrphans',
    '\Isotope\IntegrityCheck\AttributeOptionOrphans',
    '\Isotope\IntegrityCheck\MultilingualAttributes',
    '\Isotope\IntegrityCheck\UnusedRules',
];

/*
 * Vat No Validation
 */
$GLOBALS['ISO_VAT']['eu_vies'] = '\Isotope\VatNoValidator\EuViesValidator';

/*
 * Permissions are access settings for user and groups (fields in tl_user and tl_user_group)
 */
$GLOBALS['TL_PERMISSIONS'][] = 'iso_modules';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_product_types';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_product_typep';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_payment_modules';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_payment_modulep';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_shipping_modules';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_shipping_modulep';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_tax_rates';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_tax_ratep';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_tax_classes';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_tax_classp';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_configs';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_configp';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_groups';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_groupp';
$GLOBALS['TL_PERMISSIONS'][] = 'iso_member_groups';

/*
 * Allow to delete the cache in maintenance module
 */
$GLOBALS['TL_PURGE']['tables']['iso_productcache'] = [
    'callback' => ['\Isotope\Backend', 'truncateProductCache'],
    'affected' => ['tl_iso_productcache'],
];

$GLOBALS['TL_PURGE']['tables']['iso_requestcache'] = [
    'callback' => ['\Isotope\Backend', 'truncateRequestCache'],
    'affected' => ['tl_iso_requestcache'],
];

/*
 * Number formatting
 */
$GLOBALS['ISO_NUM']['10000.00'] = [2, '.', ''];
$GLOBALS['ISO_NUM']['10,000.00'] = [2, '.', ','];
$GLOBALS['ISO_NUM']['10.000,00'] = [2, ',', '.'];
$GLOBALS['ISO_NUM']["10'000.00"] = [2, '.', "'"];

// /**
//  * Hooks
//  */
// if (\Contao\Config::getInstance()->isComplete()) {
//     $GLOBALS['TL_HOOKS']['loadDataContainer'][]             = array('Isotope\Backend\Product\DcaManager', 'initialize');
//     $GLOBALS['TL_HOOKS']['getAttributesFromDca'][]          = array('Isotope\Backend\Product\DcaManager', 'addOptionsFromAttribute');
//     $GLOBALS['TL_HOOKS']['addCustomRegexp'][]               = array('Isotope\Isotope', 'validateRegexp');
//     $GLOBALS['TL_HOOKS']['getPageIdFromUrl'][]              = array('Isotope\Frontend', 'loadReaderPageFromUrl');
//     $GLOBALS['TL_HOOKS']['getPageLayout'][]                 = array('Isotope\Frontend', 'overrideReaderPage');
//     $GLOBALS['TL_HOOKS']['getArticles'][]                   = array('Isotope\Frontend', 'overrideArticles');
//     $GLOBALS['TL_HOOKS']['getSearchablePages'][]            = array('Isotope\Frontend', 'addProductsToSearchIndex');
//     $GLOBALS['TL_HOOKS']['replaceInsertTags'][]             = array('Isotope\Frontend', 'replaceIsotopeTags');
//     $GLOBALS['TL_HOOKS']['modifyFrontendPage'][]            = array('Isotope\Frontend', 'injectScripts');
//     $GLOBALS['TL_HOOKS']['executePreActions'][]             = array('Isotope\Backend', 'executePreActions');
//     $GLOBALS['TL_HOOKS']['executePostActions'][]            = array('Isotope\Backend', 'executePostActions');
//     $GLOBALS['TL_HOOKS']['getSystemMessages'][]             = array('Isotope\Backend', 'getOrderMessages');
//     $GLOBALS['TL_HOOKS']['getArticle'][]                    = array('Isotope\Frontend', 'storeCurrentArticle');
//     $GLOBALS['TL_HOOKS']['generateBreadcrumb'][]            = array('Isotope\Frontend', 'addProductToBreadcrumb');

//     $GLOBALS['ISO_HOOKS']['buttons'][]                      = array('Isotope\Isotope', 'defaultButtons');
//     $GLOBALS['ISO_HOOKS']['findSurchargesForCollection'][]  = array('Isotope\Frontend', 'findShippingAndPaymentSurcharges');
//     $GLOBALS['ISO_HOOKS']['postCheckout'][]                 = array('Isotope\Analytics', 'trackOrder');
//     $GLOBALS['ISO_HOOKS']['postCheckout'][]                 = array('Isotope\EventListener\PostCheckoutUploads', 'onPostCheckout');
//     $GLOBALS['ISO_HOOKS']['calculatePrice'][]               = array('Isotope\Frontend', 'addOptionsPrice');
//     $GLOBALS['ISO_HOOKS']['calculatePrice'][]               = array('Isotope\EventListener\CalculatePrice\QuantitySurchagePriceListener', '__invoke');
//     $GLOBALS['ISO_HOOKS']['orderConditions'][]              = array('Isotope\Model\Payment\BillpayWithSaferpay', 'addOrderCondition');
//     $GLOBALS['ISO_HOOKS']['generateDocumentTemplate'][]     = array('Isotope\Model\Payment\BillpayWithSaferpay', 'addToDocumentTemplate');
//     $GLOBALS['ISO_HOOKS']['initializePostsale'][]           = array('Isotope\Frontend', 'setPostsaleModuleSettings');

//     // changelanguage
//     $GLOBALS['TL_HOOKS']['changelanguageNavigation'][]      = array('Isotope\EventListener\ChangeLanguageListener', '__invoke');

//     // Set module and module id for payment and/or shipping modules
//     if ('FE' === TL_MODE) {
//         // Only limit countries in FE
//         $GLOBALS['TL_HOOKS']['loadDataContainer'][]         = array('Isotope\Backend\Member\Callback', 'limitCountries');
//     }

//     if ('BE' === TL_MODE) {
//         // Type agent help is only needed in back end
//         $GLOBALS['TL_HOOKS']['loadDataContainer'][]         = array('Isotope\Backend', 'loadTypeAgentHelp');
//         $GLOBALS['TL_HOOKS']['loadLanguageFile'][]          = array('Isotope\Backend\ProductType\Help', 'initializeWizard');

//         // Adjust the product groups manager
//         $GLOBALS['TL_HOOKS']['parseTemplate'][]             = array('Isotope\Backend', 'adjustGroupsManager');
//         $GLOBALS['TL_HOOKS']['parseTemplate'][]             = array('Isotope\Backend\SubtableVersion', 'removeFromWelcomeScreen');

//         // Enable the module tables in setup
//         $GLOBALS['TL_HOOKS']['initializeSystem'][]          = array('Isotope\BackendModule\InitializeListener', 'enableModuleTablesInSetup');
//     }

//     if (class_exists('Petschko\DHL\BusinessShipment')) {
//         $GLOBALS['ISO_HOOKS']['postCheckout'][] = array('Isotope\EventListener\DHLBusinessCheckoutListener', 'onPostCheckout');
//     }
// }

/*
 * Cron Jobs
 */
$GLOBALS['TL_CRON']['daily'][] = ['Isotope\Automator', 'deleteOldCarts'];
$GLOBALS['TL_CRON']['daily'][] = ['Isotope\Automator', 'deleteOldOrders'];
$GLOBALS['TL_CRON']['daily'][] = ['Isotope\Automator', 'convertCurrencies'];

/*
 * Auto_item keywords
 */
$GLOBALS['TL_AUTO_ITEM'][] = 'product';
$GLOBALS['TL_AUTO_ITEM'][] = 'step';

/*
 * Default configuration
 */
$GLOBALS['TL_CONFIG']['iso_cartTimeout'] = 2592000;
$GLOBALS['TL_CONFIG']['iso_orderTimeout'] = 604800;
