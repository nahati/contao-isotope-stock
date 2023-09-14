# Contao Isotope Stock

This bundle adds a stock-management, order limits and a gallery feature to Isotope.

## Live Demo

[Demo](https://www.nachhaltig-im-web.de/demo/demo-lagerverwaltung.html)

## Last changes

- Limited orders are handled now as well
- Limits are shown in product list and details view

## Possibel future features

- Display the available quantity per product in the backend product list.
- Notification when user defined quotas are reached (stock less than e.g. 100).

Happy to receive your wishes and ideas as well!

## Features

### A) Handle limited editions

Handle limited editions: Take `quantity` and `inventory_status` of a product into account.
You may set the stock with the basic product (parent) and / or the variants (children).

#### Usecases:

- Add product to cart
- Update item in cart
- Delete item from cart
- Merge carts (guest cart and member cart)
- Checkout

Does not (yet) handle these usecases ([see here](https://github.com/isotope/core/issues/2432))

- Delete old carts
- Delete old orders

#### Cart

- Updates quantity in cart according to the available quantity.
- Sets inventory status to `reserved` if no available quantity left.
- Adds a system message for each reserved product (issued at the backend dashboard).

#### Checkout

- Updates available quantity after checkout.
- Sets inventory status to `soldout` if no quantity left at all.

#### Product list

- Display inventory status and available quantity

#### Product View

- Display inventory status and available quantity
- Display add to cart button according to the inventory status

#### Some features in detail:

- On page Cart: Display message if cart was changed / user is asked to confirm.
- On page checkout: Display message if cart was changed / user is asked to confirm.
- On page Checkout: Display message if product quantity has changed during the checkout process (by concurring updates) / user is asked to go back to cart.
- On page Order completed: Display message if product quantity has changed in the last step of the checkout process (by simultaneously concurring updates) / order status is set to `Overbought`, a notification is send.

### B) Handle order limits

- Take `minQuantityPerOrder` and `maxQuantityPerOrder` of a product into account.
- You may set the limits with the basic product (parent) and / or the variants (children).

#### Handles these usecases:

- Add product to cart
- Update item in cart
- Delete item from cart
- Merge carts (guest cart and member cart)

#### Cart

- Updates quantity in cart according to `minQuantityPerOrder` and `maxQuantityPerOrder`.

#### Product list and product view

- Display `minQuantityPerOrder` and `maxQuantityPerOrder`.

#### Some features in detail:

- On page Cart: Display message if cart was changed.
- On page Checkout: Display message if cart was changed / user is asked to confirm.

### C) Gallery feature

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
    <td>default</td>
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
    <td>minimum number of product items allowed for an order</td>
    <td>set by backend user</td>
  </tr>
  <tr>
    <td>maxQuantityPerOrder</td>
    <td>maximum number of product items allowed for an order</td>
    <td>set by backend user</td>
  </tr>
</table>

All attributes can be changed by a backend user.

**Configuring just the gallery feature (without HandleLimitedEditions)**

You may activate only `inventory_status`. Then only the options `not for sale` and `available` are used and there will not be any further stock-management for this product-type.
Use this, if you just want to want to combine shop and gallery.

**Configuring limited editions**

If you have limited editions, activate `quantity` to enable stock-management for this product-type. Then you MUST activate `inventory_status`, too. (Othwerwise an exception will be thrown).

For products with no limit keep the `quantity` field empty. Then there will be no stock-management for this product.

**Recommended additional configuration for limited editions**

You may want to receive a notification when a product is overbought (this can happen if there are concurring updates simultaneously, e.g. another order by another user).
Then you need to do this as well:

Add a notification of type `change order status`. Under _shop configuration_ add an order status `Overbought` (mind the exact spelling!) and link this notification to it.

**Configuring limited orders**

If you want to limit the quantity per order, activate `minQuantityPerOrder` and/or `maxQuantityPerOrder` for this product-type.
Make sure to set the maximum equal to or greater than the minimum! (Othwerwise an exception will be thrown).

For products with no such limit keep the respective field(s) empty.

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
