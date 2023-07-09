-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 09, 2023 at 03:19 PM
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
-- Table structure for table `tl_iso_product_collection`
--

CREATE TABLE `tl_iso_product_collection` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `member` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locked` int(10) DEFAULT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `settings` blob DEFAULT NULL,
  `checkout_info` blob DEFAULT NULL,
  `payment_data` blob DEFAULT NULL,
  `shipping_data` blob DEFAULT NULL,
  `source_collection_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `document_number` varchar(64) NOT NULL DEFAULT '',
  `uniqid` varchar(64) DEFAULT NULL,
  `order_status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_paid` int(10) DEFAULT NULL,
  `date_shipped` int(10) DEFAULT NULL,
  `sendNotification` char(1) NOT NULL DEFAULT '',
  `config_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `payment_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `shipping_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `billing_address_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `shipping_address_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `subtotal` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax_free_subtotal` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax_free_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(4) NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  `coupons` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_product_collection`
--

INSERT INTO `tl_iso_product_collection` (`id`, `tstamp`, `type`, `member`, `locked`, `store_id`, `settings`, `checkout_info`, `payment_data`, `shipping_data`, `source_collection_id`, `document_number`, `uniqid`, `order_status`, `date_paid`, `date_shipped`, `sendNotification`, `config_id`, `payment_id`, `shipping_id`, `billing_address_id`, `shipping_address_id`, `subtotal`, `tax_free_subtotal`, `total`, `tax_free_total`, `currency`, `language`, `notes`, `coupons`) VALUES
(265, 1688915859, 'cart', 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '', '3161333539776f90b06464b29a4a5e355ff30ceede343c8da0b12595699ec19c', 0, NULL, NULL, '', 1, 0, 0, 0, 0, '100.00', '100.00', '100.00', '100.00', 'EUR', '', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tl_iso_product_collection`
--
ALTER TABLE `tl_iso_product_collection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqid` (`uniqid`),
  ADD KEY `member_store_id_type` (`member`,`store_id`,`type`),
  ADD KEY `uniqid_store_id_type` (`uniqid`,`store_id`,`type`),
  ADD KEY `source_collection_id_type` (`source_collection_id`,`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tl_iso_product_collection`
--
ALTER TABLE `tl_iso_product_collection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
