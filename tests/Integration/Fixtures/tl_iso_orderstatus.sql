-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 04, 2023 at 09:21 PM
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
-- Table structure for table `tl_iso_orderstatus`
--

CREATE TABLE `tl_iso_orderstatus` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(6) NOT NULL DEFAULT '',
  `paid` char(1) NOT NULL DEFAULT '',
  `welcomescreen` char(1) NOT NULL DEFAULT '',
  `notification` varchar(255) NOT NULL DEFAULT '',
  `saferpay_status` varchar(8) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_orderstatus`
--

INSERT INTO `tl_iso_orderstatus` (`id`, `pid`, `tstamp`, `sorting`, `name`, `color`, `paid`, `welcomescreen`, `notification`, `saferpay_status`) VALUES
(10, 0, 1691184047, 256, 'Pending', '', '', '1', '', ''),
(11, 0, 1691184053, 384, 'Processing', '', '', '', '', ''),
(12, 0, 1691184058, 512, 'Complete', '', '1', '', '', ''),
(13, 0, 1691184062, 640, 'On Hold', '', '', '', '', ''),
(14, 0, 1691184066, 768, 'Cancelled', '', '', '', '', ''),
(15, 0, 1691183016, 128, 'Overbought', 'ff1500', '', '1', '17', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tl_iso_orderstatus`
--
ALTER TABLE `tl_iso_orderstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `paid` (`paid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tl_iso_orderstatus`
--
ALTER TABLE `tl_iso_orderstatus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
