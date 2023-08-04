-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 04, 2023 at 08:02 PM
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
-- Table structure for table `tl_nc_gateway`
--

CREATE TABLE `tl_nc_gateway` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `queue_targetGateway` int(11) NOT NULL DEFAULT 0,
  `queue_delay` varchar(64) NOT NULL DEFAULT '',
  `queue_cronEnable` char(1) NOT NULL DEFAULT '',
  `queue_cronInterval` varchar(12) NOT NULL DEFAULT '',
  `queue_cronMessages` int(11) NOT NULL DEFAULT 0,
  `email_overrideSmtp` char(1) NOT NULL DEFAULT '',
  `email_smtpHost` varchar(255) NOT NULL DEFAULT '',
  `email_smtpUser` varchar(255) NOT NULL DEFAULT '',
  `email_smtpPass` varchar(255) NOT NULL DEFAULT '',
  `email_smtpEnc` varchar(3) NOT NULL DEFAULT '',
  `email_smtpPort` varchar(16) NOT NULL DEFAULT '',
  `mailerTransport` varchar(255) NOT NULL DEFAULT '',
  `file_type` varchar(4) NOT NULL DEFAULT '',
  `file_connection` varchar(8) NOT NULL DEFAULT '',
  `file_host` varchar(255) NOT NULL DEFAULT '',
  `file_port` varchar(5) NOT NULL DEFAULT '',
  `file_username` varchar(255) NOT NULL DEFAULT '',
  `file_password` varchar(255) NOT NULL DEFAULT '',
  `file_path` varchar(255) NOT NULL DEFAULT '',
  `postmark_key` varchar(64) NOT NULL DEFAULT '',
  `postmark_test` char(1) NOT NULL DEFAULT '',
  `postmark_ssl` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_nc_gateway`
--

INSERT INTO `tl_nc_gateway` (`id`, `tstamp`, `title`, `type`, `queue_targetGateway`, `queue_delay`, `queue_cronEnable`, `queue_cronInterval`, `queue_cronMessages`, `email_overrideSmtp`, `email_smtpHost`, `email_smtpUser`, `email_smtpPass`, `email_smtpEnc`, `email_smtpPort`, `mailerTransport`, `file_type`, `file_connection`, `file_host`, `file_port`, `file_username`, `file_password`, `file_path`, `postmark_key`, `postmark_test`, `postmark_ssl`) VALUES
(1, 1668547723, 'e-mail', 'email', 0, '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tl_nc_gateway`
--
ALTER TABLE `tl_nc_gateway`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_croninterval` (`queue_cronInterval`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tl_nc_gateway`
--
ALTER TABLE `tl_nc_gateway`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
