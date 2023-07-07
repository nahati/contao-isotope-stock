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

use Contao\TestCase\ContaoTestCase;
use Nahati\ContaoIsotopeStockBundle\ContaoIsotopeStockBundle;

class ContaoIsotopeStockBundleTest extends ContaoTestCase
{
    protected function setUp(): void
    {
        parent::setUp();
    }

    public function testBundleCanBeInstantiated(): void
    {
        $bundle = new ContaoIsotopeStockBundle();

        $this->assertInstanceOf('Nahati\ContaoIsotopeStockBundle\ContaoIsotopeStockBundle', $bundle);
    }
}
