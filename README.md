# Contao Isotope Stock

This bundle adds a stock-management to Isotope.
 
## Features

Handle limited editions - keep record of the available quantity of a product: 
- Reduce quantity in cart to the available quantity in case is.
- Mark product as reserved if product in cart and no quantity left.
- Mark product as available again when the requested quantity has been reduced.
- Mark product as soldout in case is.
- Handle the consequences of the above for user prompting.
- Message via Backend if product is reserved but not yet sold.

Gives you the opportunity to user friendly handle different types of products in one gallery:
- products that you marked as not for sale
- products that are for sale 
- products that have been for sale and are not available any more


## Usage

Your settings can be individual per product-type and per product.

In Backends shop-configuration you can activate the attributes you want to use for a given product-type:

  `inventory_status` - not for sale (set by backend user if applicable)
                     - available    (system set; default)
                     - reserved     (system set)
                     - soldout      (system set)
  
  `quantity`         - indicates how many items are available for sale (set by backend user if applicable; will be changed by system)

These attributes can also be changed by a backend user.

You may activate only `inventory_status`. Then only the options "not for sale" and "available" are used and there will not be any further stock-management for this product-type.
Use this, if you just want to want to combine shop and gallery.  

If you have limited editions, activate `quantity` to enable stock-management for this product-type. Then you also MUST activate `inventory_status`. 
For products with no limit keep the quantity field empty. Then there will be no stock-management for this product.


### Install  

1. Install with composer or contao manager

        composer require nahati/contao-isotope-stock

2. Update database
