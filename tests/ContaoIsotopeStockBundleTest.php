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

use nahati\ContaoIsotopeStockBundle\ContaoIsotopeStockBundle;
use PHPUnit\Framework\TestCase;

class ContaoIsotopeStockBundleTest extends TestCase
{
    public function testCanBeInstantiated(): void
    {
        $bundle = new ContaoIsotopeStockBundle();

        $this->assertInstanceOf('nahati\ContaoIsotopeStockBundle\ContaoIsotopeStockBundle', $bundle);
    }
}
