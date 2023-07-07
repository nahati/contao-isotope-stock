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

use Contao\TestCase\FunctionalTestCase;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\Result;
use Isotope\Model\ProductCollection\Cart;

/*
* This class is used as a base class for all integration tests.
* It contains the basic setup for the tests.
*/

class IntegrationTestCase extends FunctionalTestCase
{
    /**
     * setup() is called for each Testcase and contains the refresh of the test database.
     */
    protected Connection $db;
    protected Result $result;

    protected function setUp(): void
    {
        // parent::setUp();

        // static::bootKernel();

        // $framework = static::getContainer()->get('contao.framework');

        // $this->db = System::getContainer()->get('database_connection');

        // // Drop all tables
        // foreach ($this->db->createSchemaManager()->listTableNames() as $table) {
        //     $sql = 'DROP TABLE IF EXISTS ' . $table;
        //     $this->db->executeStatement($sql);
        // }
        // // Check that this->db is empty
        // $this->assertSame([], $this->db->createSchemaManager()->listTableNames());

        // Create tables and insert data
        // $this->loadFixture('isotope.sql');
        // TODO: load the isotope.sql file

        // $queryBuilder = $this->db->createQueryBuilder();
        // $queryBuilder->select('*')->from('tl_iso_product');
        // $stm = $queryBuilder->executeQuery();
        // $data = $stm->fetchAllAssociative();

        // // Check that this->db is not empty
        // $this->assertNotEmpty($data);
    }

    public function loadFixture(string $fileName): void
    {
        $sql = file_get_contents(__DIR__ . '/Fixtures/' . $fileName);

        $this->db->executeStatement($sql);
    }

    public function fetchCart(): Cart
    {
        // return the Cart object with id 1
        $queryBuilder = $this->db->createQueryBuilder();
        $queryBuilder->select('*')->from('tl_iso_product_collection')->where('id = 1');
        // $stm = $queryBuilder->executeQuery();
        // $data = $stm->fetchAllAssociative();

        // TODO: get the parameter for the Cart constructor of type Database\Result!
        // return new Cart($data[0]);
        return new Cart();
    }
}
