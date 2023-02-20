<?php

// src/EventListener/AddProductToCollectionListener.php

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
use Isotope\Message;
use Isotope\Model\Product;
use Isotope\ServiceAnnotation\IsotopeHook;

/**
 * @IsotopeHook("addProductToCollection")
 */
class AddProductToCollectionListener
{
    /* inventory status: */
    /**
     * @var string
     */
    private $inventory_status;
    private string $RESERVED = '2'; /* product in cart, no reamining quantity */
    private string $SOLDOUT = '3'; /* product bought, no remaining quantity, count > 1 */
    private string $PURCHASED = '4'; /* product bought, no remaining quantity, count = 1 */

    /**
     * Checks if the requested quantity ($intQuantity) exceeds stock when adding product to cart.
     * Reduces requested quantity if neccessary; set reserved if no remaining quantity.
     *
     * @param mixed $intQuantity
     *
     * @throws \Exception
     * @throws \LogicException
     *
     * @return mixed
     */
    public function __invoke(Product $objProduct, $intQuantity, IsotopeProductCollection $objCollection)
    {
        if ('' === $objProduct->quantity || null === $objProduct->quantity) {
            return $intQuantity; // return requested quantity if no quantity has been set for the product
        }

        if ($objProduct->quantity > 0) {
            // find product in cart
            $oInCart = null;
            $oInCart = $objCollection->getItemForProduct($objProduct);

            // calculate quantity that can be added to cart ($qtyAddToCart)
            $qtyInCart = $oInCart->quantity ?? 0; // quantity already in cart
            $qtyAddToCart = $objProduct->quantity - $qtyInCart;
            $qtyAddToCart = $qtyAddToCart < 0 ? 0 : $qtyAddToCart; // min. zero

            // quantity to add to cart <= requested quantity: set 'reserved'
            if ($qtyAddToCart <= $intQuantity) {
                $this->inventory_status = $this->RESERVED;
                Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id);

                // quantity to add to cart < requested quantity: message warns about the decrease in order
                if ($qtyAddToCart < $intQuantity) {
                    Message::addError(sprintf(
                        $GLOBALS['TL_LANG']['ERR']['quantityNotAvailable'],
                        $objProduct->getName(),
                        $objProduct->quantity
                    ));
                }

                return $qtyAddToCart; // full or reduced request into cart
            }

            // more quantity remaining than requested

            return $intQuantity; // full request into cart
        }

        // Product out of stock ($objProduct->quantity = 0):
        if ('1' === $objProduct->count) {
            $this->inventory_status = $this->PURCHASED;
        } else { // $objProduct->count > 1
            $this->inventory_status = $this->SOLDOUT;
        }
        Database::getInstance()->prepare('UPDATE '.Product::getTable().' SET inventory_status = ?  WHERE id = ?')->execute($this->inventory_status, $objProduct->id);

        Message::addError(sprintf(
            $GLOBALS['TL_LANG']['MSC']['productOutOfStock'],
            $objProduct->getName()
        ));

        return false;
    }
}
