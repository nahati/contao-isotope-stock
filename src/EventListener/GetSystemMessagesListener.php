<?php

// src/EventListener/GetSystemMessagesListener.php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace Nahati\ContaoIsotopeStockBundle\EventListener;

use Contao\CoreBundle\ServiceAnnotation\Hook;
use Isotope\Model\Product;

class GetSystemMessagesListener
{
    /* inventory status: */
    /**
     * @var string
     */
    private $RESERVED = '3'; /* product in cart, no reamining quantity */

    /**
     * Invoked when System messages are being retrieved.
     * 
     * Add message for "RESERVED" products.
     *
     * @return string   // Array of new messages
     *
     * @Hook("getSystemMessages")
     */
    public function __invoke()
    {
        $arrMessages = [];

        // Show messages for "RESERVED" products
        $objProducts = Product::findBy(['tl_iso_product.inventory_status=?'], [$this->RESERVED]);

        if ($objProducts) {
            while ($objProducts->next()) {
                $arrMessages[] = '<p class="tl_error">' . sprintf(
                    $GLOBALS['TL_LANG']['MSC']['checkProduct'],
                    $objProducts->sku
                ) . '</p>';
            }
        }

        return implode('', $arrMessages);
    }
}
