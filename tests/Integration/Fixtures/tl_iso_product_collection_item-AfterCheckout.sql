-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 30, 2023 at 08:58 PM
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
-- Table structure for table `tl_iso_product_collection_item`
--

CREATE TABLE `tl_iso_product_collection_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `sku` varchar(128) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `configuration` blob DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax_free_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_product_collection_item`
--

INSERT INTO `tl_iso_product_collection_item` (`id`, `pid`, `tstamp`, `product_id`, `type`, `sku`, `name`, `configuration`, `quantity`, `price`, `tax_free_price`, `tax_id`, `jumpTo`) VALUES
(3331, 268, 1690750652, 88, 'standard', 'B0001', 'Bild 1 &#40;no variants, unlimited&#41;', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32),
(3332, 268, 1690750652, 100, 'standard', 'B0002', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 0x613a303a7b7d, 1, '0.00', '0.00', '', 32),
(3333, 268, 1690750652, 89, 'standard', 'B0003', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 0x613a303a7b7d, 1, '0.00', '0.00', '', 32),
(3334, 268, 1690750652, 47, 'standard', 'S0001', 'Variante &#34;Original&#34; von Skulptur 1 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3335, 268, 1690750652, 46, 'standard', 'S0001', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '0.00', '0.00', '', 33),
(3336, 268, 1690750652, 44, 'standard', 'S0002', 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '0.00', '0.00', '', 33),
(3337, 268, 1690750652, 45, 'standard', 'S0002', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3338, 268, 1690750652, 42, 'standard', 'S0003', 'Variante Kopie von Skulptur 3 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '110260.00', '110260.00', '', 33),
(3339, 268, 1690750652, 40, 'standard', 'S0003', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '260.00', '260.00', '', 33),
(3340, 268, 1690750652, 39, 'standard', 'S0004', 'Variante Kopie von Skulptur 4 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '100.00', '100.00', '', 33),
(3341, 268, 1690750652, 38, 'standard', 'S0004', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '250.00', '250.00', '', 33),
(3342, 268, 1690750652, 48, 'standard', 'S0005', 'Variante Kopie von Skulptur 5 &#40;quantity 2&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '0.00', '0.00', '', 33),
(3343, 268, 1690750652, 96, 'standard', 'K0001', 'Eintrittskarte online', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '100.00', '100.00', '', 58),
(3344, 268, 1690750652, 97, 'standard', 'K0001', 'Eintrittskarte Schalter', 0x613a313a7b733a363a22737461747573223b693a313b7d, 99, '100.00', '100.00', '', 58);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tl_iso_product_collection_item`
--
ALTER TABLE `tl_iso_product_collection_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_item`
--
ALTER TABLE `tl_iso_product_collection_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3345;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
