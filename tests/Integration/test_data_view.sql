-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Sep 13, 2023 at 11:27 AM
-- Server version: 10.10.3-MariaDB-1:10.10.3+maria~ubu2204-log
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ContaoIsotopeStockBundleTest`
--

-- --------------------------------------------------------

--
-- Structure for view `test_data`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `test_data`  AS   with ProductData as (select distinct NULL AS `order_id`,NULL AS `order_type`,NULL AS `order_status`,NULL AS `item_id`,NULL AS `item_quantity`,`t4`.`minQuantityPerOrder` AS `minQuantityPerOrder`,`t4`.`maxQuantityPerOrder` AS `maxQuantityPerOrder`,`t4`.`id` AS `product_id`,`t4`.`pid` AS `parent_id`,`t4`.`inventory_status` AS `inventory_status`,`t4`.`quantity` AS `quantity`,`t4`.`id` AS `rn` from (((`tl_iso_product_collection` `t1` left join `tl_iso_product_collection_item` `t2` on(`t1`.`id` = `t2`.`pid`)) left join `tl_iso_product` `t3` on(`t2`.`product_id` = `t3`.`id`)) left join `tl_iso_product` `t4` on(`t3`.`pid` = `t4`.`id` and `t4`.`pid` = 0)) union all select `t1`.`id` AS `order_id`,`t1`.`type` AS `order_type`,`t1`.`order_status` AS `order_status`,`t2`.`id` AS `item_id`,`t2`.`quantity` AS `item_quantity`,`t3`.`minQuantityPerOrder` AS `minQuantityPerOrder`,`t3`.`maxQuantityPerOrder` AS `maxQuantityPerOrder`,`t3`.`id` AS `product_id`,`t3`.`pid` AS `parent_id`,`t3`.`inventory_status` AS `inventory_status`,`t3`.`quantity` AS `quantity`,`t3`.`pid` AS `rn` from ((`tl_iso_product_collection` `t1` left join `tl_iso_product_collection_item` `t2` on(`t1`.`id` = `t2`.`pid`)) left join `tl_iso_product` `t3` on(`t2`.`product_id` = `t3`.`id` and `t3`.`pid` <> 0)))select `ProductData`.`order_id` AS `order_id`,`ProductData`.`order_type` AS `order_type`,`ProductData`.`order_status` AS `order_status`,`ProductData`.`item_id` AS `item_id`,`ProductData`.`product_id` AS `product_id`,`ProductData`.`parent_id` AS `parent_id`,`ProductData`.`item_quantity` AS `item_quantity`,`ProductData`.`minQuantityPerOrder` AS `minQuantityPerOrder`,`ProductData`.`maxQuantityPerOrder` AS `maxQuantityPerOrder`,`ProductData`.`quantity` AS `quantity`,`ProductData`.`inventory_status` AS `inventory_status` from `ProductData` where `ProductData`.`rn` is not null order by `ProductData`.`rn`,`ProductData`.`parent_id`,`ProductData`.`product_id`,`ProductData`.`order_type`  ;

--
-- VIEW `test_data`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
