-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 04, 2023 at 08:51 PM
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
-- Table structure for table `tl_nc_language`
--

CREATE TABLE `tl_nc_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `recipients` varchar(255) NOT NULL DEFAULT '',
  `attachment_tokens` varchar(255) NOT NULL DEFAULT '',
  `attachments` blob DEFAULT NULL,
  `attachment_templates` blob DEFAULT NULL,
  `email_sender_name` varchar(255) NOT NULL DEFAULT '',
  `email_sender_address` varchar(255) NOT NULL DEFAULT '',
  `email_recipient_cc` text DEFAULT NULL,
  `email_recipient_bcc` text DEFAULT NULL,
  `email_replyTo` varchar(255) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_mode` varchar(16) NOT NULL DEFAULT '',
  `email_text` text DEFAULT NULL,
  `email_html` text DEFAULT NULL,
  `email_external_images` char(1) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_storage_mode` varchar(8) NOT NULL DEFAULT '',
  `file_content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_nc_language`
--

INSERT INTO `tl_nc_language` (`id`, `pid`, `tstamp`, `gateway_type`, `language`, `fallback`, `recipients`, `attachment_tokens`, `attachments`, `attachment_templates`, `email_sender_name`, `email_sender_address`, `email_recipient_cc`, `email_recipient_bcc`, `email_replyTo`, `email_subject`, `email_mode`, `email_text`, `email_html`, `email_external_images`, `file_name`, `file_storage_mode`, `file_content`) VALUES
(27, 15, 1691182090, 'email', 'de', '', 'test@test.de', '', NULL, NULL, 'test@test.de', 'test@test.de', NULL, NULL, '', 'Bestellung überverkauft', 'textOnly', 'Die Bestellung ##uniqid## ist überverkauft.', NULL, '', '', '', NULL),
(28, 15, 1691182126, 'email', 'en', '1', 'test@test.de', '', NULL, NULL, 'test@test.de', 'test@test.de', NULL, NULL, '', 'Order overbought', 'textOnly', 'The order ##uniqid## is overbought.', NULL, '', '', '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tl_nc_language`
--
ALTER TABLE `tl_nc_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `language` (`language`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tl_nc_language`
--
ALTER TABLE `tl_nc_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
