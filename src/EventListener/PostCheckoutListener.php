<?php

// src/EventListener/PostCheckoutListener.php

declare(strict_types=1);

/*
 * This file is part of Nahati/contao-isotope-stock
 *
 * (c) Ernst Jendritzki / Nachhaltig im web
 *
 * @license LGPL-3.0-or-later
 */

namespace nahati\ContaoIsotopeStockBundle\EventListener;

use Contao\Database;
use Isotope\Interfaces\IsotopeProductCollection;
// use Isotope\Model\ProductCollection;
use Isotope\Model\Product;
use Isotope\Model\ProductCollection;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("postCheckout")
 */
class PostCheckoutListener
{
    /* inventory status: */
    /**
     * @var string
     */
    private $inventory_status;
    private string $AVAILABLE = '1'; /* product available for selling */
    private string $SOLDOUT = '3'; /* product bought, no remaining quantity, count > 1 */
    private string $PURCHASED = '4'; /* product bought, no remaining quantity, count = 1 */

    /**
     *  Updates the counts. Marks as 'purchased' retr. 'sold out' in all bought products with no remaining quantity.
     *
     * @param ProductCollection $objOrder
     */
    public function __invoke(IsotopeProductCollection $objOrder): void
    {
        foreach ($objOrder->getItems() as $objItem) {
            $objProduct = null;
            $objProduct = $objItem->getProduct(true);

            if (!empty($objProduct->quantity) && $objProduct->quantity > 0) {
                // decrease available quantity by bought quantity
                $objProduct->quantity -= $objItem->quantity;

                // set product purchased / sold out and quantity zero if there is no quantity left
                if ($objProduct->quantity <= 0) {
                    $objProduct->quantity = 0;

                    if ('1' === $objProduct->count) { // @phpstan-ignore-line as still working by some magic
                        $this->inventory_status = $this->PURCHASED;
                    } else { // $objProduct->count > 1
                        $this->inventory_status = $this->SOLDOUT;
                    }

                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET quantity = ?,  inventory_status = ?  WHERE id = ?')->execute($objProduct->quantity, $this->inventory_status, $objProduct->getId());
                }

                // just set new quantity in any other case
                else {
                    $this->inventory_status = $this->AVAILABLE;
                    Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET quantity = ?, inventory_status = ? WHERE id = ?')->execute($objProduct->quantity, $this->inventory_status, $objProduct->getId());
                }
            }
        }
    }
}
