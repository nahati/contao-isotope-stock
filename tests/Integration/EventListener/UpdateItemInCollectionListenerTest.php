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

use Contao\CoreBundle\Framework\ContaoFramework;
use Contao\System;
use Contao\TestCase\FunctionalTestCase;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\Result as DoctrineResult;
use Isotope\Model\ProductCollection\Cart;
use Isotope\Model\ProductCollectionItem;
use Nahati\ContaoIsotopeStockBundle\EventListener\UpdateItemInCollectionListener;
use Contao\Database\Result;

/**
 * Test the UpdateItemInCollectionListener class.
 */
class UpdateItemInCollectionListenerTest extends FunctionalTestCase
{
    private ProductCollectionItem $objItem;
    private Cart $objCart;
    // private mixed $arrSet;
    // private Standard $objProduct;
    // private Standard $objProduct1;
    // private Standard $objProduct2;
    // private Standard $objProduct3;
    // private Standard $objProduct4;
    // private Standard $objProduct6;
    // private Standard $objParentProduct;

    // private string $inventory_status;
    // private string $AVAILABLE = '2'; /* product available for sale */
    // private string $SOLDOUT = '4'; /* product in cart though soldout */

    protected ContaoFramework $framework;
    protected Connection $db;
    protected Result $result;

    public function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/..' . '/Fixtures/' . $fileName);

        $this->db->executeStatement($sql);
    }

    /**
     * setup() is called for each Testcase and contains the basic setup for the tests.
     * Override this method if you need to change the basic setup.
     */
    protected function setUp(): void
    {
        parent::setUp();

        static::bootKernel();

        $this->db = static::getContainer()->get('database_connection');
        // $this->db = System::getContainer()->get('database_connection');

        // // Drop all tables
        foreach ($this->db->createSchemaManager()->listTableNames() as $table) {
            $sql = 'DROP TABLE IF EXISTS ' . $table;
            $this->db->executeStatement($sql);
        }
        // // Check that this->db is empty
        $this->assertSame([], $this->db->createSchemaManager()->listTableNames());

        // Create tables and insert data
        $this->loadFixture('ContaoIsotopeStockBundleTest.sql');

        $this->framework = static::getContainer()->get('contao.framework');
        $this->framework->initialize();
    }

    public function fetchCart(): Cart
    {
        // return the Cart object with id 244
        $queryBuilder = $this->db->createQueryBuilder();
        $queryString = 'SELECT * FROM tl_iso_product_collection WHERE id = 244';
        $queryBuilder->select('*')->from('tl_iso_product_collection')->where('id = 244');
        /** @var DoctrineResult $stm */
        $stm = $queryBuilder->executeQuery();
        $result = new Result($stm, $queryString);

        return new Cart($result);
    }


    public function testTrueIsTrue(): void
    {
        $this->assertTrue(true);
    }

    // TODO: Fix whats missing and add all testcases

    // Due to missing support and documentation the integration test cannot be coded yet.
    // I tried several approaches unsuccesfully. If anyone wants to help, you are welcome!
    public function testUpdateItemInCollectionListenerReturnsQuantityZeroWhenProductIsSoldout(): void
    {
        $listener = new UpdateItemInCollectionListener($this->framework);

        // Fetch the Cart from the test database
        $this->objCart = $this->fetchCart();

        dump($this->objCart);

        // Fetch an Item of this Cart and get the product
        // ... and set its inventory_status to SOLDOUT ...

        // $result = $listener($this->objItem, $this->arrSet, $this->objCart);

        // Test if Listener returns Quantity Zero
        // $this->assertSame(0, $result['quantity']);

        $foo = true;
        $this->assertTrue($foo);
    }

    //     // More testcases should be added here later
}
