-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 06, 2023 at 09:35 PM
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
-- Table structure for table `tl_iso_product`
--

CREATE TABLE `tl_iso_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(5) NOT NULL DEFAULT '',
  `dateAdded` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `orderPages` text DEFAULT NULL,
  `inherit` blob DEFAULT NULL,
  `fallback` char(1) NOT NULL DEFAULT '',
  `alias` varchar(128) NOT NULL DEFAULT '',
  `gtin` varchar(14) NOT NULL DEFAULT '',
  `sku` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `teaser` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) NOT NULL DEFAULT '',
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `baseprice` varchar(255) NOT NULL DEFAULT '',
  `shipping_weight` varchar(255) NOT NULL DEFAULT '',
  `shipping_exempt` char(1) NOT NULL DEFAULT '',
  `shipping_pickup` char(1) NOT NULL DEFAULT '',
  `shipping_price` decimal(9,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `images` blob DEFAULT NULL,
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `guests` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `cssID` varchar(255) NOT NULL DEFAULT '',
  `length` varchar(255) NOT NULL DEFAULT '',
  `width` varchar(255) NOT NULL DEFAULT '',
  `height` varchar(255) NOT NULL DEFAULT '',
  `inventory_status` char(1) DEFAULT '2',
  `quantity` varchar(255) DEFAULT '',
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_product`
--

INSERT INTO `tl_iso_product` (`id`, `pid`, `gid`, `tstamp`, `language`, `dateAdded`, `type`, `orderPages`, `inherit`, `fallback`, `alias`, `gtin`, `sku`, `name`, `teaser`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `baseprice`, `shipping_weight`, `shipping_exempt`, `shipping_pickup`, `shipping_price`, `images`, `protected`, `groups`, `guests`, `published`, `start`, `stop`, `cssID`, `length`, `width`, `height`, `inventory_status`, `quantity`, `status`) VALUES
(31, 0, 0, 1688931356, '', 1679071375, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-1', '', 'S0001', 'Skulptur 1 &#40;unlimited&#41;', NULL, '<p>Skulptur 1</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '37', '28', '24', '2', '', 0),
(32, 0, 0, 1689007625, '', 1679072602, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-2-quantity-2', '', 'S0002', 'Skulptur 2 &#40;quantity 2&#41;', NULL, '<p>Skulptur 2</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '18', '12', '2', '4', 0),
(33, 0, 0, 1688848904, '', 1679072864, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'elbperlen', '', 'S0003', 'Skulptur 3 &#40;quantity 3&#41;', NULL, '<p>Skulptur 3</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '25', '25', '6', '2', '', 0),
(34, 0, 0, 1688849872, '', 1679073170, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-4-unlimited', '', 'S0004', 'Skulptur 4 &#40;unlimited&#41;', NULL, '<p>Skulptur 4</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '50', '12', '2', '', 0),
(35, 0, 0, 1688850847, '', 1679073393, 9, 'a:1:{i:0;s:2:\"58\";}', NULL, '', 'eintrittskarte-1-quantity-100', '', 'K0001', 'Eintrittskarte 1 &#40;quantity 100&#41;', NULL, '<p>Karte</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '100', 0),
(37, 0, 0, 1688849955, '', 1682433897, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-5-quantity-2', '', 'S0005', 'Skulptur 5 &#40;quantity 2&#41;', NULL, '<p>Figur 5</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 0),
(38, 34, 0, 1689969869, '', 1682439434, 0, NULL, NULL, '', '', '', '', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', NULL, '<p>Dies ist das original</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '3', '1', 1),
(39, 34, 0, 1688849843, '', 1682439491, 0, NULL, NULL, '', '', '', '', 'Variante Kopie von Skulptur 4 &#40;unlimited&#41;', NULL, '<p>Dies ist eine Kopie</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(40, 33, 0, 1689969917, '', 1682441231, 0, NULL, NULL, '', '', '', '', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(42, 33, 0, 1688849566, '', 1682441268, 0, NULL, NULL, '', '', '', '', 'Variante Kopie von Skulptur 3 &#40;unlimited&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(44, 32, 0, 1689007634, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 2),
(45, 32, 0, 1689007641, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(46, 31, 0, 1688931800, '', 0, 0, NULL, NULL, '', '', '', '', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(47, 31, 0, 1688931805, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante &#34;Original&#34; von Skulptur 1 &#40;unlimited&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 1),
(48, 37, 0, 1688849998, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Kopie von Skulptur 5 &#40;quantity 2&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 2),
(49, 37, 0, 1689970020, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '1', 1),
(50, 0, 0, 1688932470, '', 1682537805, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-6', '', 'S0006', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', NULL, '<p>Figur 6</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '2', 0),
(51, 50, 0, 1689970102, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '2', 2),
(52, 50, 0, 1689970061, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(88, 0, 0, 1688920168, '', 1688593283, 6, 'a:1:{i:0;s:2:\"32\";}', NULL, '', 'bild-unlimited', '', 'B0001', 'Bild 1 &#40;no variants, unlimited&#41;', NULL, '<p>Bild 1</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '', 0),
(89, 0, 0, 1688919651, '', 1688846985, 6, 'a:1:{i:0;s:2:\"32\";}', NULL, '', 'bild-3-no-variants-quantity-2-reserved', '', 'B0003', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', NULL, '<p>Bild 2</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '2', 0),
(96, 35, 0, 1688850958, '', 0, 0, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, '', '', '', '', 'Eintrittskarte online', NULL, NULL, '', NULL, NULL, '', '', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(97, 35, 0, 1688850975, '', 0, 0, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, '', '', '', '', 'Eintrittskarte Schalter', NULL, NULL, '', NULL, NULL, '', '', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 1),
(100, 0, 0, 1688922752, '', 1688920236, 6, 'a:1:{i:0;s:2:\"32\";}', NULL, '', 'bild-2-no-variants-quantity-2', '', 'B0002', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', NULL, '<p>Bild 2</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 0),
(101, 32, 0, 1691357685, '', 1691357638, 0, NULL, NULL, '', '', '', '', 'Weitere Variante Kopie von Skulptur 2', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tl_iso_product`
--
ALTER TABLE `tl_iso_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`),
  ADD KEY `pid_language` (`pid`,`language`),
  ADD KEY `language_fallback` (`language`,`fallback`),
  ADD KEY `language_published_start_stop_pid` (`language`,`published`,`start`,`stop`,`pid`),
  ADD KEY `start` (`start`),
  ADD KEY `sku` (`sku`),
  ADD KEY `gtin` (`gtin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tl_iso_product`
--
ALTER TABLE `tl_iso_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
