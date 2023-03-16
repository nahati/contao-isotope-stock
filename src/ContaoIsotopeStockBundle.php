<?php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace nahati\ContaoIsotopeStockBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class ContaoIsotopeStockBundle extends Bundle
{
    public function getPath(): string
    {
        return \dirname(__DIR__);
    }
}
