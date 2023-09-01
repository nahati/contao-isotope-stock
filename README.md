# THIS IS A DRAFT VERSION - NOT YET READY FOR PRODUCTION

# Contao Isotope Stock

This bundle adds a stock-management and a gallery feature to Isotope.

## Last changes

- Limited orders are handled now as well

## Possibel future features

- Show the available quantity per product in the backend product list.
- Show the available quantity per product in the frontend (product list, product view, cart).

## Features

### Stockmanagement type A: Handle limited editions

Handle limited editions (for single products as well as for variants): Take `quantity` and `inventory_status` of a product into account.

#### Cart

- Updates quantity in cart according to the available quantity.
- Sets inventory status to `reserved` if no available quantity left.
- Adds a system message for each reserved product (issued at the backend dashboard).

#### Checkout

- Updates available quantity after checkout.
- Sets inventory status to `soldout` if no quantity left at all.

#### Product list

- Show inventory status

#### Product View

- Show add to cart button according to the inventory status

#### Handles these usecases:

- Add product to cart
- Update item in cart
- Delete item from cart
- Merge carts (guest cart and member cart)
- Checkout

Does not (yet) handle these usecases ([see here](https://github.com/isotope/core/issues/2432))

- Delete old carts
- Delete old orders

An Exception is thrown if

- Stock management is not properly configured ([see here](#stockmanagement))

#### Some features in detail:

- On page Cart: Show message if cart was changed.
- On page checkout: Show message if cart was changed / user is asked to confirm.
- On page Checkout: Show message if product quantity has changed during the checkout process (by concurring updates) / user is asked to go back to cart.
- On page Order completed: Show message if product quantity has changed in the last step of the checkout process (by simultaneously concurring updates) / order status is set to `Overbought`, a notification is send.

### Stockmanagement type B: Handle limited orders

- Handle order limits: take `minQuantityPerOrder` and `maxQuantityPerOrder` of a product into account.

#### Cart

- Updates quantity in cart according to `minQuantityPerOrder` and `maxQuantityPerOrder`.

#### Product list

- Show `minQuantityPerOrder` and `maxQuantityPerOrder`.

#### Product View

- Show `minQuantityPerOrder` and `maxQuantityPerOrder`.

#### Handles these usecases:

- Add product to cart
- Update item in cart
- Delete item from cart
- Merge carts (guest cart and member cart)

#### Some features in detail:

- On page Cart: Show message if cart was changed.
- On page checkout: Show message if cart was changed / user is asked to confirm.

### Gallery feature

Additionally you get the opportunity to handle all products in just one product list:

- products with inventory status `available` (gallery, shop available)
- products with inventory status `reserved` or `soldout` (gallery, shop not available)
- products with inventory status `not for sale` (gallery, shop not available)

## Configuration

Your settings can be individual per product-type and per product. In backend's shop-configuration you can activate the attributes you want to use for a given product-type:

<table>
  <tr>
    <td>inventory_status</td>
    <td>not for sale</td>
    <td>set by backend user if applicable</td>
  </tr>
  <tr>
    <td></td>
    <td>available</td>
    <td>system set; default</td>
  </tr>
  <tr>
    <td></td>
    <td>reserved</td>
    <td>system set</td>
  </tr>
  <tr>
    <td></td>
    <td>soldout</td>
    <td>system set</td>
  </tr>
  <tr>
    <td>quantity</td>
    <td>number of items available for sale</td>
    <td>set by backend user, modified by system</td>
  </tr>
  <tr>
    <td>minQuantityPerOrder</td>
    <td>minimum number of items allowed for an order</td>
    <td>set by backend user</td>
  </tr>
  <tr>
    <td>maxQuantityPerOrder</td>
    <td>maximum number of items allowed for an order</td>
    <td>set by backend user</td>
  </tr>
</table>

These attributes can also be changed by a backend user.

**Gallery feature without stockmanagement**

You may activate only `inventory_status`. Then only the options `not for sale` and `available` are used and there will not be any further stock-management for this product-type.
Use this, if you just want to want to combine shop and gallery.

**Stock management type A**

If you have limited editions, activate `quantity` to enable stock-management for this product-type. <a id="stockmanagement"> Then you MUST activate `inventory_status`, too.</a>

For products with no limit keep the `quantity` field empty. Then there will be no stock-management for this product.

**Recommended additional configuration for stock management type A**

You may want to receive a notification when a product is overbought (this can happen if there are concurring updates simultaneously, e.g. another order by another user).
Then you need to do this as well:

Add a notification of type `change order status`. Under shop configuration add an order status `Overbought` (mind the exact spelling!) and link this notification to it.

**Stock management type B**

If you want to limit the quantity per order, activate `minQuantityPerOrder` and/or `maxQuantityPerOrder` for this product-type.
Make sure to set the maximum equal to or greater than the minimum!

For products with no such limit keep the respective field(s) empty.

**Possible conflicts between both types of stock management**

`minQuantityPerOrder` may not be reachable if `quantity` is not sufficient. Then this product can not be bought.

## Minimum requirements

- PHP 8.1
- Contao 4.13.16
- Isotope 2.8.10

## Installation with Contao Manager

Search for `nahati/contao-isotope-stock` in Contao Manager and add it to your installation.
Apply changes to update the packages. Update Database.

## Installation on Command-line

      composer require nahati/contao-isotope-stock
      vendor/bin/contao-console contao:migrate

## Testmethods

See the used test methods in folder `coverage`.

## Special thanks

- to @andreas.schempp for kind advices how to securely handle a product update
- to @zoglo for kind help to get integration test running
- to the Contao community for helpful hints
- to Benny Born and Michael Bösherz, numero2, for their [simple-stock-management extension](https://packagist.org/packages/numero2/contao-isotope-simple-erp), which gave me first ideas.
