<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\Tests;

use Contao\System;
use Contao\TestCase\ContaoTestCase;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\Result;
use Isotope\Model\ProductCollection\Cart;

/*
* This class is used as a base class for all integration tests.
* It contains the basic setup for the tests.
*/

class IntegrationTestCase extends ContaoTestCase
{
    /**
     * setup() is called for each Testcase and contains the refresh of the test database.
     */
    protected Connection $db;
    protected Result $result;

    protected function setUp(): void
    {
        parent::setUp();

        $this->db = System::getContainer()->get('database_connection');

        // Drop all tables
        foreach ($this->db->createSchemaManager()->listTableNames() as $table) {
            $sql = 'DROP TABLE IF EXISTS ' . $table;
            $this->db->executeStatement($sql);
        }
        // Check that this->db is empty
        $this->assertSame([], $this->db->createSchemaManager()->listTableNames());

        // Create tables and insert data
        $this->loadFixture('isotope.sql');

        $queryBuilder = $this->db->createQueryBuilder();
        $queryBuilder->select('*')->from('tl_iso_product');
        $stm = $queryBuilder->executeQuery();
        $data = $stm->fetchAllAssociative();

        // Check that this->db is not empty
        $this->assertNotEmpty($data);
    }

    public function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/Fixtures/' . $fileName);

        $this->db->executeStatement($sql);
    }

    public function fetchCart(): Cart
    {
        // $this->result = $this->db->prepare('SELECT * FROM tl_iso_product_collection WHERE uniqid=?')->executeQuery(['232cce7be9a38f5bf33b02a517543ac4d7a124094a5969ebeda2b5da50da59d5']);

        // $this->result = $queryBuilder->executeQuery();

        // $strTable = 'tl_iso_product_collection';
        // $objCart = Collection::createFromDbResult($this->result, $strTable);

        // dump($this->result);

        // $cookieHash = '232cce7be9a38f5bf33b02a517543ac4d7a124094a5969ebeda2b5da50da59d5';
        // $storeId = '0';

        // $objCart = ProductCollection::findOneBy(array('uniqid=?', 'store_id=?'), array($cookieHash, $storeId));

        // return $objCart;

        // $cookieHash = 'b4cc176ddaa930a598cbce1604ba8ceea747e8948e36003fb90bd49ea127a5af';
        // $storeId = '0';

        // // Erstelle einen QueryBuilder, um die Abfrage zu erstellen
        // $queryBuilder = $this->db->createQueryBuilder();
        // $queryBuilder->select('*')
        //     ->from('tl_iso_product_collection')
        //     ->where('uniqid = :uniqid')
        //     ->andWhere('store_id = :store_id')
        //     ->setParameter('uniqid', $cookieHash)
        //     ->setParameter('store_id', $storeId);

        // // Führe die Abfrage aus
        // $stmt = $queryBuilder->execute();
        // $data = $stmt->fetchAllAssociative();

        // // Überprüfe, ob ein Ergebnis vorhanden ist
        // if (empty($data)) {
        //     throw new \Exception('No cart found.');
        // }

        // Erstelle ein neues Cart-Objekt und setze die Daten
        return new Cart();
    }
}
