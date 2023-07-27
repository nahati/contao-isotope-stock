# Contao Isotope Stock

This bundle adds a stock-management to Isotope.

## Important note

THIS VERSION IS IN PROGRESS!

## Last changes

Variants are taken in value now as well

Unit Test integrated

Integration Test integrated

## Future features

Showing the available quantity per product in the Backend product list

## Features

Handle limited editions - keep record of the available quantity of a product:

- Reduce quantity in cart to the available quantity in case is.
- Mark product as reserved if product in cart and no more quantity left.
- Mark product as available again when the requested quantity has been reduced.
- Mark product as soldout if no quantity left at all.
- Handle the consequences of the above for user prompting.
- Message via Backend Dashboard if product is reserved but not yet sold.

Gives you the opportunity to user friendly handle different types of products in one gallery:

- products that you marked as not for sale
- products that are for **sale**
- products that have been for sale and are not available any more

## Usage

Your settings can be individual per product-type and per product. In Backends shop-configuration you can activate the attributes you want to use for a given product-type:

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

You may activate only `inventory_status`. Then only the options `not for sale` and `available` are used and there will not be any further stock-management for this product-type.
Use this, if you just want to want to combine shop and gallery.

If you have limited editions, activate `quantity` to enable stock-management for this product-type. Then you also MUST activate `inventory_status`.
For products with no limit keep the quantity field empty. Then there will be no stock-management for this product.

## Testmethoden (technische und fachliche Sicht)

- [Unit-Test - Testfälle](https://github.com/nahati/contao-isotope-stock/blob/2.0.1-dev/tests/unit/reports/testdox.html)
- [Integrationstest - Testfälle](https://github.com/nahati/contao-isotope-stock/blob/2.0.1-dev/tests/Integration/reports/testdox.html)

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
