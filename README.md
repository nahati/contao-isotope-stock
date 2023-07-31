# Contao Isotope Stock

This bundle adds a stock-management and a gallery feature to Isotope.

## Important note

THIS VERSION IS **ALMOST** READY FOR PRODUCTION

## Last changes

- Complete redesign

- Variants are taken in value now as well

- More use cases handled

- Unit Test integrated

- Integration Test integrated

## Future features

- Show the available quantity per product in the backend product list.
- Show the available quantity per product in the frontend (product list, product view, cart).

## Features

### A) Stockmanagement

Handle limited editions (for single products as well as for variants):

#### Checkout

- Updates available quantity after checkout.
- Sets inventory status to `soldout` if no quantity left at all.

#### Cart

- Updates quantity in cart according to the available quantity.
- Sets inventory status to `available` or to `reserved` according to the available quantity left.
- Adds a system message for each reserved product (issued at the backend dashboard).

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

### B) Gallery feature

Additionally you get the opportunity to handle all products in just one product list:

- products with inventory status `available` (gallery, shop available)
- products with inventory status `reserved` or `soldout` (gallery, shop not available)
- products with inventory status `not for sale` (gallery, shop not available)

## Usage

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
</table>

These attributes can also be changed by a backend user.

**Gallery feature without stockmanagement**

You may activate only `inventory_status`. Then only the options `not for sale` and `available` are used and there will not be any further stock-management for this product-type.
Use this, if you just want to want to combine shop and gallery.

**Stock management**

If you have limited editions, activate `quantity` to enable stock-management for this product-type. <a id="stockmanagement"> Then you MUST activate `inventory_status`, too.</a>

For products with no limit keep the `quantity` field empty. Then there will be no stock-management for this product.

## Testmethods

- [Unit-Test - Testcases](https://github.com/nahati/contao-isotope-stock/blob/2.0.1-dev/tests/unit/reports/testdox.txt)
- [Integration-Test - Testcases](https://github.com/nahati/contao-isotope-stock/blob/2.0.1-dev/tests/Integration/reports/testdox.txt)

## Minimum requirements

- PHP 8.1
- Contao 4.13.16
- Isotope 2.8.10

## Installation with Contao Manager

Search for `nahati/contao-isotope-stock` in Contao Manager and add it to your installation.
Apply changes to update the packages. Update Database.

## Installation on Command-line

      composer require nahati/contao-isotope-**stock**
      vendor/bin/contao-console contao:migrate

## Special thanks

- to @andreas.schempp for kind advices how to securely handle a product update
- to @zoglo for kind help to get integration test running
- to the Contao community for helpful hints
- to Benny Born and Michael Bösherz, numero2, for their [simple-stock-management extension](https://packagist.org/packages/numero2/contao-isotope-simple-erp), which gave me first ideas how to build my extension.
