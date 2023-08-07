-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Aug 06, 2023 at 09:36 PM
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
-- Table structure for table `tl_article`
--

CREATE TABLE `tl_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `author` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inColumn` varchar(32) NOT NULL DEFAULT 'main',
  `keywords` text DEFAULT NULL,
  `showTeaser` char(1) NOT NULL DEFAULT '',
  `teaserCssID` varchar(255) NOT NULL DEFAULT '',
  `teaser` text DEFAULT NULL,
  `printable` varchar(255) NOT NULL DEFAULT '',
  `customTpl` varchar(64) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `guests` char(1) NOT NULL DEFAULT '',
  `cssID` varchar(255) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `languageMain` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sharebuttons_template` varchar(64) NOT NULL DEFAULT '',
  `sharebuttons_theme` varchar(32) NOT NULL DEFAULT '',
  `sharebuttons_networks` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_article`
--

INSERT INTO `tl_article` (`id`, `pid`, `sorting`, `tstamp`, `title`, `alias`, `author`, `inColumn`, `keywords`, `showTeaser`, `teaserCssID`, `teaser`, `printable`, `customTpl`, `protected`, `groups`, `guests`, `cssID`, `published`, `start`, `stop`, `languageMain`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`) VALUES
(1, 2, 128, 1682433092, 'Willkommen', 'willkommen', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:13:\"welcome-image\";}', '1', '', '', 0, '', '', NULL),
(3, 4, 128, 1682433093, 'Kunstwerke', 'kunstwerke-2', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 0, '', '', NULL),
(7, 8, 128, 1682433093, 'Warenkorb', 'warenkorb', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '1', '', '', 0, '', '', NULL),
(17, 18, 128, 1682433093, 'Kasse', 'kasse', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '1', '', '', 0, '', '', NULL),
(18, 19, 128, 1682433093, 'Bestellung abgeschlossen', 'bestellung-abgeschlossen', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '1', '', '', 0, '', '', NULL),
(25, 26, 128, 1682433094, '404 Seite nicht gefunden', '', 1, 'main', NULL, '', '', NULL, '', '', '', NULL, '', '', '1', '', '', 0, '', '', NULL),
(32, 32, 64, 1682433093, 'Bilder', 'bilder-2', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 0, '', '', NULL),
(33, 33, 64, 1682433093, 'Skulpturen', 'skulpturen', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 0, '', '', NULL),
(44, 41, 64, 1682433093, 'Anmelden bzw. registrieren', '', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:10:\"user entry\";}', '1', '', '', 0, '', '', NULL),
(48, 3, 64, 1682433093, 'Kunstwerke', 'kunstwerke-3', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:3:\"art\";}', '1', '', '', 0, '', '', NULL),
(60, 58, 64, 1682433093, 'Kollagen', 'kollagen', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 0, 'sharebuttons_default', '', NULL),
(61, 61, 128, 1689969381, 'Anmelden', 'anmelden', 4, 'main', NULL, '', '', NULL, '', '', '', NULL, '', '', '1', '', '', 0, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_calendar`
--

CREATE TABLE `tl_calendar` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `allowComments` char(1) NOT NULL DEFAULT '',
  `notify` varchar(32) NOT NULL DEFAULT 'notify_admin',
  `sortOrder` varchar(32) NOT NULL DEFAULT 'ascending',
  `perPage` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `moderate` char(1) NOT NULL DEFAULT '',
  `bbcode` char(1) NOT NULL DEFAULT '',
  `requireLogin` char(1) NOT NULL DEFAULT '',
  `disableCaptcha` char(1) NOT NULL DEFAULT '',
  `master` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sharebuttons_template` varchar(64) NOT NULL DEFAULT '',
  `sharebuttons_theme` varchar(32) NOT NULL DEFAULT '',
  `sharebuttons_networks` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_calendar_events`
--

CREATE TABLE `tl_calendar_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `featured` char(1) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `author` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `addTime` char(1) NOT NULL DEFAULT '',
  `startTime` int(11) DEFAULT NULL,
  `endTime` int(11) DEFAULT NULL,
  `startDate` int(10) UNSIGNED DEFAULT NULL,
  `endDate` int(10) UNSIGNED DEFAULT NULL,
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `robots` varchar(32) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `teaser` text DEFAULT NULL,
  `addImage` char(1) NOT NULL DEFAULT '',
  `overwriteMeta` char(1) NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `alt` varchar(255) NOT NULL DEFAULT '',
  `imageTitle` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(64) NOT NULL DEFAULT '',
  `imagemargin` varchar(128) NOT NULL DEFAULT '',
  `imageUrl` varchar(2048) NOT NULL DEFAULT '',
  `fullsize` char(1) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `floating` varchar(32) NOT NULL DEFAULT 'above',
  `recurring` char(1) NOT NULL DEFAULT '',
  `repeatEach` varchar(64) NOT NULL DEFAULT '',
  `repeatEnd` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recurrences` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `addEnclosure` char(1) NOT NULL DEFAULT '',
  `enclosure` blob DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT 'default',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `articleId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `url` varchar(2048) NOT NULL DEFAULT '',
  `target` char(1) NOT NULL DEFAULT '',
  `cssClass` varchar(255) NOT NULL DEFAULT '',
  `noComments` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `languageMain` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_calendar_feed`
--

CREATE TABLE `tl_calendar_feed` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(32) NOT NULL DEFAULT '',
  `calendars` blob DEFAULT NULL,
  `format` varchar(32) NOT NULL DEFAULT 'rss',
  `source` varchar(32) NOT NULL DEFAULT 'source_teaser',
  `maxItems` smallint(5) UNSIGNED NOT NULL DEFAULT 25,
  `feedBase` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `imgSize` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_comments`
--

CREATE TABLE `tl_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `source` varchar(32) NOT NULL DEFAULT '',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(128) NOT NULL DEFAULT '',
  `member` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `addReply` char(1) NOT NULL DEFAULT '',
  `author` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reply` text DEFAULT NULL,
  `published` char(1) NOT NULL DEFAULT '',
  `ip` varchar(64) NOT NULL DEFAULT '',
  `notified` char(1) NOT NULL DEFAULT '',
  `notifiedReply` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_comments_notify`
--

CREATE TABLE `tl_comments_notify` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `source` varchar(32) NOT NULL DEFAULT '',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(2048) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `addedOn` varchar(10) NOT NULL DEFAULT '',
  `active` char(1) NOT NULL DEFAULT '',
  `tokenRemove` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_content`
--

CREATE TABLE `tl_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'text',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ptable` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `headline` varchar(255) NOT NULL DEFAULT 'a:2:{s:5:"value";s:0:"";s:4:"unit";s:2:"h2";}',
  `text` mediumtext DEFAULT NULL,
  `addImage` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `showPreview` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `inline` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `overwriteMeta` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `alt` varchar(255) NOT NULL DEFAULT '',
  `imageTitle` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `imagemargin` varchar(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `imageUrl` text DEFAULT NULL,
  `fullsize` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `floating` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'above',
  `html` mediumtext DEFAULT NULL,
  `listtype` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `listitems` blob DEFAULT NULL,
  `tableitems` mediumblob DEFAULT NULL,
  `summary` varchar(255) NOT NULL DEFAULT '',
  `thead` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `tfoot` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `tleft` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `sortable` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `sortIndex` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sortOrder` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'ascending',
  `mooHeadline` varchar(255) NOT NULL DEFAULT '',
  `mooStyle` varchar(255) NOT NULL DEFAULT '',
  `mooClasses` varchar(255) NOT NULL DEFAULT '',
  `highlight` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `markdownSource` varchar(12) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'sourceText',
  `code` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `target` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `overwriteLink` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `titleText` varchar(255) NOT NULL DEFAULT '',
  `linkTitle` varchar(255) NOT NULL DEFAULT '',
  `embed` varchar(255) NOT NULL DEFAULT '',
  `rel` varchar(64) NOT NULL DEFAULT '',
  `useImage` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `multiSRC` blob DEFAULT NULL,
  `orderSRC` blob DEFAULT NULL,
  `useHomeDir` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `perRow` smallint(5) UNSIGNED NOT NULL DEFAULT 4,
  `perPage` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `numberOfItems` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sortBy` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `metaIgnore` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `galleryTpl` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `customTpl` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `playerSRC` blob DEFAULT NULL,
  `youtube` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `vimeo` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `posterSRC` binary(16) DEFAULT NULL,
  `playerSize` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `playerOptions` text DEFAULT NULL,
  `playerStart` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `playerStop` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `playerCaption` varchar(255) NOT NULL DEFAULT '',
  `playerAspect` varchar(8) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `splashImage` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `playerPreload` varchar(8) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `playerColor` varchar(6) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `youtubeOptions` text DEFAULT NULL,
  `vimeoOptions` text DEFAULT NULL,
  `sliderDelay` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sliderSpeed` int(10) UNSIGNED NOT NULL DEFAULT 300,
  `sliderStartSlide` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sliderContinuous` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `data` text DEFAULT NULL,
  `cteAlias` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `articleAlias` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `article` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `form` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `module` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `protected` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `guests` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cssID` varchar(255) NOT NULL DEFAULT '',
  `invisible` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `start` varchar(10) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `stop` varchar(10) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_order` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'ascending',
  `com_perPage` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `com_moderate` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_bbcode` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_disableCaptcha` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_requireLogin` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_template` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `remark_icon` varchar(16) NOT NULL DEFAULT 'show',
  `er24Html` longblob DEFAULT NULL,
  `er24Type` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `sharebuttons_template` varchar(64) NOT NULL DEFAULT '',
  `sharebuttons_theme` varchar(32) NOT NULL DEFAULT '',
  `sharebuttons_networks` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_content`
--

INSERT INTO `tl_content` (`id`, `type`, `pid`, `ptable`, `sorting`, `tstamp`, `headline`, `text`, `addImage`, `showPreview`, `inline`, `overwriteMeta`, `singleSRC`, `alt`, `imageTitle`, `size`, `imagemargin`, `imageUrl`, `fullsize`, `caption`, `floating`, `html`, `listtype`, `listitems`, `tableitems`, `summary`, `thead`, `tfoot`, `tleft`, `sortable`, `sortIndex`, `sortOrder`, `mooHeadline`, `mooStyle`, `mooClasses`, `highlight`, `markdownSource`, `code`, `url`, `target`, `overwriteLink`, `titleText`, `linkTitle`, `embed`, `rel`, `useImage`, `multiSRC`, `orderSRC`, `useHomeDir`, `perRow`, `perPage`, `numberOfItems`, `sortBy`, `metaIgnore`, `galleryTpl`, `customTpl`, `playerSRC`, `youtube`, `vimeo`, `posterSRC`, `playerSize`, `playerOptions`, `playerStart`, `playerStop`, `playerCaption`, `playerAspect`, `splashImage`, `playerPreload`, `playerColor`, `youtubeOptions`, `vimeoOptions`, `sliderDelay`, `sliderSpeed`, `sliderStartSlide`, `sliderContinuous`, `data`, `cteAlias`, `articleAlias`, `article`, `form`, `module`, `protected`, `groups`, `guests`, `cssID`, `invisible`, `start`, `stop`, `com_order`, `com_perPage`, `com_moderate`, `com_bbcode`, `com_disableCaptcha`, `com_requireLogin`, `com_template`, `remark_icon`, `er24Html`, `er24Type`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`) VALUES
(1, 'headline', 1, 'tl_article', 128, 1681666046, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:20:\"Herzlich willkommen!\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(2, 'image', 1, 'tl_article', 256, 1679074422, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', NULL, '', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:6:\"_w1200\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '1', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:10:\"willkommen\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(14, 'headline', 7, 'tl_article', 128, 1670174093, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:13:\"Ihr Warenkorb\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(15, 'module', 7, 'tl_article', 256, 1671577290, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 12, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(16, 'headline', 17, 'tl_article', 128, 1668463133, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:5:\"Kasse\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(17, 'module', 17, 'tl_article', 256, 1671556476, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 13, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(45, 'headline', 3, 'tl_article', 128, 1669750859, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:21:\"Bilder und Skulpturen\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(46, 'module', 3, 'tl_article', 256, 1669750925, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 10, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(51, 'module', 3, 'tl_article', 384, 1669755976, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 11, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(57, 'headline', 32, 'tl_article', 128, 1669874070, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:6:\"Bilder\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(58, 'module', 32, 'tl_article', 368, 1681243926, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 29, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:2:\"md\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(59, 'module', 32, 'tl_article', 384, 1672176023, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 11, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:3:\"art\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(64, 'headline', 18, 'tl_article', 128, 1669929470, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:15:\"Ihre Bestellung\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(65, 'module', 18, 'tl_article', 256, 1669929499, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 14, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(66, 'text', 18, 'tl_article', 192, 1669929534, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Herzlichen Dank für Ihre Bestellung.</p>', '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(99, 'text', 7, 'tl_article', 384, 1671824701, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:7:\"Hinweis\";}', '<p>Sie zahlen in meinem Webshop keine Mehrwertsteuer, da ich von der Kleinunternehmer Regelung Gebrauch mache.</p>', '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(117, 'module', 7, 'tl_article', 320, 1671653407, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 30, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(144, 'headline', 44, 'tl_article', 128, 1671808170, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:25:\"Wie wollen Sie bestellen?\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(145, 'text', 44, 'tl_article', 256, 1671807609, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<h2>Haben Sie schon ein Kundenkonto?</h2>\n<h2 class=\"last\">Dann melden Sie sich an.</h2>', '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', 0x613a313a7b693a303b733a323a222d31223b7d, '1', 'a:2:{i:0;s:0:\"\";i:1;s:5:\"login\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(146, 'module', 44, 'tl_article', 384, 1671807609, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 27, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(147, 'text', 44, 'tl_article', 640, 1671807609, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<h2>Sie möchten ihre Bestellungen vereinfachen?</h2>\n<h2 class=\"last\">Legen Sie Ihr Kundenkonto an.</h2>', '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:3:\"reg\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(148, 'module', 44, 'tl_article', 768, 1671807609, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 15, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(149, 'text', 44, 'tl_article', 896, 1671807609, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<h2>Sie möchten als Gast bestellen?</h2>', '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:5:\"guest\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(150, 'hyperlink', 44, 'tl_article', 1024, 1671807609, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, '{{link_url::18|urlattr}}', '', '', '', 'Als Gast bestellen', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 15, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:9:\"guestLink\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(165, 'headline', 48, 'tl_article', 128, 1672006894, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:10:\"Kunstwerke\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:3:\"art\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(166, 'module', 48, 'tl_article', 256, 1672062014, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 10, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:3:\"art\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(167, 'module', 48, 'tl_article', 384, 1672061947, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 11, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(168, 'module', 48, 'tl_article', 192, 1672061548, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 32, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:6:\"filter\";}', '1', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(169, 'module', 48, 'tl_article', 224, 1672061973, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 33, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(170, 'module', 32, 'tl_article', 288, 1674760380, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 32, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"sort\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(171, 'module', 32, 'tl_article', 304, 1674760382, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 34, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:6:\"search\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(173, 'module', 32, 'tl_article', 320, 1679338727, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 35, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:8:\"for_sale\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(181, 'module', 32, 'tl_article', 296, 1674760381, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 40, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"sort\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(182, 'html', 32, 'tl_article', 256, 1674416441, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', '<div class=\"filtersection\">', '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(183, 'html', 32, 'tl_article', 352, 1674416443, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', '</div>', '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(192, 'headline', 33, 'tl_article', 128, 1674759649, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:10:\"Skulpturen\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(193, 'module', 33, 'tl_article', 1056, 1682440586, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 29, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:2:\"md\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(194, 'html', 33, 'tl_article', 384, 1674759625, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', '<div class=\"filtersection\">', '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(195, 'module', 33, 'tl_article', 512, 1681243154, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 32, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(196, 'module', 33, 'tl_article', 640, 1674759625, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 40, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"sort\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(197, 'module', 33, 'tl_article', 768, 1674759625, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 34, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:6:\"search\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(198, 'module', 33, 'tl_article', 896, 1674759625, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 35, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:8:\"for_sale\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(199, 'html', 33, 'tl_article', 1024, 1674759625, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', '</div>', '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(200, 'module', 33, 'tl_article', 1088, 1674759625, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 11, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:3:\"art\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(201, 'module', 32, 'tl_article', 272, 1674760379, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 41, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(211, 'text', 1, 'tl_news', 64, 1681820846, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Meine Webseite ist in Arbeit. Eine Kunstgalerie! Meiner Bilder und Skulpturen werden hier präsentiert.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '1', '', '', '', 0xeca3d279ca4011ed8ef80242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(212, 'image', 2, 'tl_news', 64, 1681820807, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Ich bereite eine Ausstellung einiger meiner Kunstobjekte im Pop-Up-Zukunftshaus Rissen vor. Thema: Unsere Wegwerf-Gesellschaft.[nbsp] [nbsp]</p>', '1', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(218, 'sharebuttons', 32, 'tl_article', 512, 1680035991, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', 'sharebuttons_fontawesome', 'fontawesome', 0x613a373a7b693a303b733a383a2266616365626f6f6b223b693a313b733a373a2274776974746572223b693a323b733a383a226c696e6b6564696e223b693a333b733a343a226d61696c223b693a343b733a393a2270696e746572657374223b693a353b733a383a227768617473617070223b693a363b733a353a227072696e74223b7d),
(219, 'sharebuttons', 33, 'tl_article', 1216, 1680036014, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', 'sharebuttons_fontawesome', 'fontawesome', 0x613a373a7b693a303b733a383a2266616365626f6f6b223b693a313b733a373a2274776974746572223b693a323b733a383a226c696e6b6564696e223b693a333b733a343a226d61696c223b693a343b733a393a2270696e746572657374223b693a353b733a383a227768617473617070223b693a363b733a353a227072696e74223b7d),
(223, 'gallery', 32, 'tl_article', 192, 1680266062, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:15:\"Backend-Hinweis\";}', '<p>Ein Backend-Hinweis</p>', '', '', '', '1', NULL, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(225, 'module', 33, 'tl_article', 1072, 1682440407, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 52, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:2:\"sm\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(226, 'module', 32, 'tl_article', 376, 1681243942, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 52, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:2:\"sm\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(228, 'text', 5, 'tl_news', 64, 1681820935, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '1', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(231, 'text', 7, 'tl_news', 64, 1681820924, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '1', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(232, 'text', 6, 'tl_news', 64, 1681820913, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '1', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(233, 'text', 8, 'tl_news', 64, 1681820901, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '1', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(234, 'headline', 60, 'tl_article', 128, 1681666384, 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:8:\"Kollagen\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(235, 'gallery', 60, 'tl_article', 192, 1681666456, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:15:\"Backend-Hinweis\";}', '<p>Ein Backend-Hinweis</p>', '', '', '', '1', NULL, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '1', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(236, 'html', 60, 'tl_article', 256, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', '<div class=\"filtersection\">', '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(237, 'module', 60, 'tl_article', 272, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 41, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(238, 'module', 60, 'tl_article', 288, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 32, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"sort\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(239, 'module', 60, 'tl_article', 296, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 40, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"sort\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(240, 'module', 60, 'tl_article', 304, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 34, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:6:\"search\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(241, 'module', 60, 'tl_article', 320, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 35, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:8:\"for_sale\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(242, 'html', 60, 'tl_article', 352, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', '</div>', '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', '', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(243, 'module', 60, 'tl_article', 368, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 29, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:2:\"md\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(244, 'module', 60, 'tl_article', 376, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 52, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:2:\"sm\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(245, 'module', 60, 'tl_article', 384, 1681666325, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 11, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:3:\"art\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(246, 'sharebuttons', 60, 'tl_article', 512, 1681666325, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', 'sharebuttons_fontawesome', 'fontawesome', 0x613a373a7b693a303b733a383a2266616365626f6f6b223b693a313b733a373a2274776974746572223b693a323b733a383a226c696e6b6564696e223b693a333b733a343a226d61696c223b693a343b733a393a2270696e746572657374223b693a353b733a383a227768617473617070223b693a363b733a353a227072696e74223b7d),
(248, 'text', 9, 'tl_news', 64, 1681820788, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Gerade bin ich sehr beschäftigt, meine Ausstellung im Rahmen der altonale vorzubereiten. Sie finden meine Kunstobjekte im Weltladen während der altonale (16.06. - 02.07.2023).</p>', '1', '', '', '', 0x929249a7ca4011ed8ef80242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(249, 'text', 2, 'tl_news', 192, 1681763616, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Ich bereite eine Ausstellung einiger meiner Kunstobjekte im Pop-Up-Zukunftshaus Rissen vor. Thema: Unsere Wegwerf-Gesellschaft.[nbsp] [nbsp]</p>', '', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:3:\"500\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL),
(254, 'module', 33, 'tl_article', 1080, 1682539432, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 56, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:2:\"md\";}', '1', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL);
INSERT INTO `tl_content` (`id`, `type`, `pid`, `ptable`, `sorting`, `tstamp`, `headline`, `text`, `addImage`, `showPreview`, `inline`, `overwriteMeta`, `singleSRC`, `alt`, `imageTitle`, `size`, `imagemargin`, `imageUrl`, `fullsize`, `caption`, `floating`, `html`, `listtype`, `listitems`, `tableitems`, `summary`, `thead`, `tfoot`, `tleft`, `sortable`, `sortIndex`, `sortOrder`, `mooHeadline`, `mooStyle`, `mooClasses`, `highlight`, `markdownSource`, `code`, `url`, `target`, `overwriteLink`, `titleText`, `linkTitle`, `embed`, `rel`, `useImage`, `multiSRC`, `orderSRC`, `useHomeDir`, `perRow`, `perPage`, `numberOfItems`, `sortBy`, `metaIgnore`, `galleryTpl`, `customTpl`, `playerSRC`, `youtube`, `vimeo`, `posterSRC`, `playerSize`, `playerOptions`, `playerStart`, `playerStop`, `playerCaption`, `playerAspect`, `splashImage`, `playerPreload`, `playerColor`, `youtubeOptions`, `vimeoOptions`, `sliderDelay`, `sliderSpeed`, `sliderStartSlide`, `sliderContinuous`, `data`, `cteAlias`, `articleAlias`, `article`, `form`, `module`, `protected`, `groups`, `guests`, `cssID`, `invisible`, `start`, `stop`, `com_order`, `com_perPage`, `com_moderate`, `com_bbcode`, `com_disableCaptcha`, `com_requireLogin`, `com_template`, `remark_icon`, `er24Html`, `er24Type`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`) VALUES
(255, 'module', 61, 'tl_article', 128, 1689969416, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 27, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_crawl_queue`
--

CREATE TABLE `tl_crawl_queue` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_id` char(128) NOT NULL,
  `uri` longtext NOT NULL,
  `uri_hash` char(40) NOT NULL,
  `found_on` longtext DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `processed` tinyint(1) NOT NULL,
  `tags` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_cron_job`
--

CREATE TABLE `tl_cron_job` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastRun` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_cron_job`
--

INSERT INTO `tl_cron_job` (`id`, `name`, `lastRun`) VALUES
(1, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMinutely', '2023-08-06 23:34:45'),
(2, 'Contao\\CoreBundle\\Cron\\LegacyCron::onHourly', '2023-08-06 23:33:20'),
(3, 'Contao\\CoreBundle\\Cron\\LegacyCron::onDaily', '2023-08-06 16:20:04'),
(4, 'Contao\\CoreBundle\\Cron\\LegacyCron::onWeekly', '2023-08-06 16:20:04'),
(5, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMonthly', '2023-08-04 22:09:35'),
(6, 'Contao\\CoreBundle\\Cron\\PurgeExpiredDataCron::onHourly', '2023-08-06 23:33:20'),
(7, 'Contao\\CoreBundle\\Cron\\PurgePreviewLinksCron', '2023-08-06 16:20:04'),
(56, 'Contao\\CoreBundle\\Cron\\Cron::updateMinutelyCliCron', '2023-02-02 18:42:36'),
(57, 'Contao\\CoreBundle\\Cron\\MessengerCron', '2023-02-02 18:42:36'),
(58, 'Contao\\CoreBundle\\Cron\\PurgeOptInTokensCron', '2023-02-02 18:42:36'),
(59, 'Contao\\CoreBundle\\Cron\\PurgeRegistrationsCron', '2023-02-02 18:42:36'),
(60, 'Contao\\CoreBundle\\Cron\\PurgeTempFolderCron', '2023-02-02 18:42:36'),
(61, 'Contao\\CommentsBundle\\Cron\\PurgeSubscriptionsCron', '2023-02-02 18:42:36'),
(62, 'Contao\\CalendarBundle\\Cron\\GenerateFeedsCron', '2023-02-02 18:42:36'),
(63, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMinutely', '2023-07-08 21:22:18'),
(64, 'Contao\\CoreBundle\\Cron\\LegacyCron::onHourly', '2023-07-08 21:22:18'),
(65, 'Contao\\CoreBundle\\Cron\\LegacyCron::onDaily', '2023-07-08 20:53:53'),
(66, 'Contao\\CoreBundle\\Cron\\LegacyCron::onWeekly', '2023-07-05 17:33:47'),
(67, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMonthly', '2023-07-05 17:33:47'),
(68, 'Contao\\CoreBundle\\Cron\\PurgeExpiredDataCron::onHourly', '2023-07-08 21:22:18'),
(69, 'Contao\\CoreBundle\\Cron\\PurgePreviewLinksCron', '2023-07-08 20:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `tl_faq`
--

CREATE TABLE `tl_faq` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `question` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `author` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `answer` text DEFAULT NULL,
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `robots` varchar(32) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `addImage` char(1) NOT NULL DEFAULT '',
  `overwriteMeta` char(1) NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `alt` varchar(255) NOT NULL DEFAULT '',
  `imageTitle` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(64) NOT NULL DEFAULT '',
  `imagemargin` varchar(128) NOT NULL DEFAULT '',
  `imageUrl` varchar(2048) NOT NULL DEFAULT '',
  `fullsize` char(1) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `floating` varchar(12) NOT NULL DEFAULT 'above',
  `addEnclosure` char(1) NOT NULL DEFAULT '',
  `enclosure` blob DEFAULT NULL,
  `noComments` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `languageMain` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_faq`
--

INSERT INTO `tl_faq` (`id`, `pid`, `sorting`, `tstamp`, `question`, `alias`, `author`, `answer`, `pageTitle`, `robots`, `description`, `addImage`, `overwriteMeta`, `singleSRC`, `alt`, `imageTitle`, `size`, `imagemargin`, `imageUrl`, `fullsize`, `caption`, `floating`, `addEnclosure`, `enclosure`, `noComments`, `published`, `languageMain`) VALUES
(1, 1, 128, 0, '', '', 3, NULL, '', '', NULL, '', '', NULL, '', '', '', '', '', '', '', 'above', '', NULL, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tl_faq_category`
--

CREATE TABLE `tl_faq_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `headline` varchar(255) NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `allowComments` char(1) NOT NULL DEFAULT '',
  `notify` varchar(16) NOT NULL DEFAULT 'notify_admin',
  `sortOrder` varchar(12) NOT NULL DEFAULT 'ascending',
  `perPage` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `moderate` char(1) NOT NULL DEFAULT '',
  `bbcode` char(1) NOT NULL DEFAULT '',
  `requireLogin` char(1) NOT NULL DEFAULT '',
  `disableCaptcha` char(1) NOT NULL DEFAULT '',
  `master` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_faq_category`
--

INSERT INTO `tl_faq_category` (`id`, `tstamp`, `title`, `headline`, `jumpTo`, `allowComments`, `notify`, `sortOrder`, `perPage`, `moderate`, `bbcode`, `requireLogin`, `disableCaptcha`, `master`) VALUES
(1, 1682106098, 'test', 'test', 0, '', 'notify_admin', 'ascending', 0, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tl_files`
--

CREATE TABLE `tl_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` binary(16) DEFAULT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `uuid` binary(16) DEFAULT NULL,
  `type` varchar(16) NOT NULL DEFAULT '',
  `path` varchar(1022) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `extension` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `lastModified` int(10) UNSIGNED DEFAULT NULL,
  `found` char(1) NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `importantPartX` double UNSIGNED NOT NULL DEFAULT 0,
  `importantPartY` double UNSIGNED NOT NULL DEFAULT 0,
  `importantPartWidth` double UNSIGNED NOT NULL DEFAULT 0,
  `importantPartHeight` double UNSIGNED NOT NULL DEFAULT 0,
  `meta` blob DEFAULT NULL,
  `compressed` char(1) NOT NULL DEFAULT '',
  `doNotSanitize` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_files`
--

INSERT INTO `tl_files` (`id`, `pid`, `tstamp`, `uuid`, `type`, `path`, `extension`, `hash`, `lastModified`, `found`, `name`, `importantPartX`, `importantPartY`, `importantPartWidth`, `importantPartHeight`, `meta`, `compressed`, `doNotSanitize`) VALUES
(1, NULL, 1668797812, 0xd63b967463a011edb8900242ac10ee0c, 'folder', 'files/themes', '', '8b757d5456c531183e5b678a2ca45ae6', NULL, '1', 'themes', 0, 0, 0, 0, NULL, '', ''),
(2, 0xd63b967463a011edb8900242ac10ee0c, 1668797812, 0x0e5901ea63a111edb8900242ac10ee0c, 'folder', 'files/themes/css', '', 'e2496885ef2ea348fc235388c7013a4c', NULL, '1', 'css', 0, 0, 0, 0, NULL, '', ''),
(3, 0xd63b967463a011edb8900242ac10ee0c, 1668377926, 0x243169a663a111edb8900242ac10ee0c, 'folder', 'files/themes/fonts', '', '8da160885857a3cf66dcbbd87019d78d', NULL, '1', 'fonts', 0, 0, 0, 0, NULL, '', ''),
(5, 0xd63b967463a011edb8900242ac10ee0c, 1668377965, 0x3b5e52bf63a111edb8900242ac10ee0c, 'folder', 'files/themes/js', '', '74dbd0b0e5b120ae4318912f6991bd50', NULL, '1', 'js', 0, 0, 0, 0, NULL, '', ''),
(6, 0x0e5901ea63a111edb8900242ac10ee0c, 1668797812, 0xa42c9b0663a111edb8900242ac10ee0c, 'file', 'files/themes/css/two.css', 'css', '16a49b9a2118de3e6d7439f7542691ec', 1668787119, '1', 'two.css', 0, 0, 0, 0, NULL, '', ''),
(7, 0x0e5901ea63a111edb8900242ac10ee0c, 1668439412, 0xa43e25e063a111edb8900242ac10ee0c, 'file', 'files/themes/css/solid.css', 'css', 'e8484384e449359beae3836c72e70011', 1668378907, '1', 'solid.css', 0, 0, 0, 0, NULL, '', ''),
(8, 0x0e5901ea63a111edb8900242ac10ee0c, 1668439412, 0xa44a013363a111edb8900242ac10ee0c, 'file', 'files/themes/css/fontawesome.css', 'css', '4aa11b2aea12dbec5a4822d1e9d1925d', 1668378907, '1', 'fontawesome.css', 0, 0, 0, 0, NULL, '', ''),
(9, NULL, 1668439412, 0x979dcfe763a211edb8900242ac10ee0c, 'folder', 'files/images', '', 'b1d3d99fbb3f61b68388bd8d89e0de4a', NULL, '1', 'images', 0, 0, 0, 0, NULL, '', ''),
(11, 0xd63b967463a011edb8900242ac10ee0c, 1668439905, 0x80bc0a19642e11edb6390242ac10ee0c, 'folder', 'files/themes/images', '', '55dc1e65a1b9dc85234279149b7ab1d2', NULL, '1', 'images', 0, 0, 0, 0, NULL, '', ''),
(12, 0x3b5e52bf63a111edb8900242ac10ee0c, 1668439412, 0x95215647642e11edb6390242ac10ee0c, 'file', 'files/themes/js/navToggle.js', 'js', '1c1552e9f67e469c9c16fba319064d72', 1668438675, '1', 'navToggle.js', 0, 0, 0, 0, NULL, '', ''),
(13, 0xc7a524ee677111eda1790242ac10ee0c, 1668439889, 0xa647c58a642e11edb6390242ac10ee0c, 'file', 'files/themes/images/archiv/cleverLogo.svg', 'svg', 'e7ddd2718aebe693b1abaec7cce91c49', 1668438714, '1', 'cleverLogo.svg', 0, 0, 0, 0, 0x613a313a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a333a22616c74223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '', ''),
(14, 0x243169a663a111edb8900242ac10ee0c, 1668439412, 0xc0745d5b642e11edb6390242ac10ee0c, 'file', 'files/themes/fonts/fa-solid-900.woff2', 'woff2', '3e50e269ee627bb2279f91d18c085167', 1668438747, '1', 'fa-solid-900.woff2', 0, 0, 0, 0, NULL, '', ''),
(15, 0x243169a663a111edb8900242ac10ee0c, 1668439412, 0xc08b55e9642e11edb6390242ac10ee0c, 'file', 'files/themes/fonts/fa-regular-400.woff2', 'woff2', '83e2813a8fe0229d916c5b63fa9eab5e', 1668438747, '1', 'fa-regular-400.woff2', 0, 0, 0, 0, NULL, '', ''),
(16, 0x243169a663a111edb8900242ac10ee0c, 1668439412, 0xc09c60b5642e11edb6390242ac10ee0c, 'file', 'files/themes/fonts/OpenSans-VariableFont_wdth,wght.ttf', 'ttf', 'b194af1dd929cbad11b28bdbc111e385', 1668438748, '1', 'OpenSans-VariableFont_wdth,wght.ttf', 0, 0, 0, 0, NULL, '', ''),
(17, 0x243169a663a111edb8900242ac10ee0c, 1668439412, 0xc0aff00e642e11edb6390242ac10ee0c, 'file', 'files/themes/fonts/OpenSans-Regular.ttf', 'ttf', 'ebe0fbcd13a1e4b1cea24fa992f28fbb', 1668438748, '1', 'OpenSans-Regular.ttf', 0, 0, 0, 0, NULL, '', ''),
(18, 0x243169a663a111edb8900242ac10ee0c, 1668439412, 0xc0c3261a642e11edb6390242ac10ee0c, 'file', 'files/themes/fonts/OldStandardTT-Regular.ttf', 'ttf', 'a8e3a076fda5312e878c6ef9ebbab997', 1668438748, '1', 'OldStandardTT-Regular.ttf', 0, 0, 0, 0, NULL, '', ''),
(19, 0x243169a663a111edb8900242ac10ee0c, 1668439412, 0xc0d7140f642e11edb6390242ac10ee0c, 'file', 'files/themes/fonts/OldStandardTT-Italic.ttf', 'ttf', 'cfb6f28612cdb09ea2aa33e0eb30ef92', 1668438748, '1', 'OldStandardTT-Italic.ttf', 0, 0, 0, 0, NULL, '', ''),
(20, 0x243169a663a111edb8900242ac10ee0c, 1668439412, 0xc0ea37a9642e11edb6390242ac10ee0c, 'file', 'files/themes/fonts/OldStandardTT-Bold.ttf', 'ttf', '3aa02cd2710a61eb63855ee4ca8c2abc', 1668438748, '1', 'OldStandardTT-Bold.ttf', 0, 0, 0, 0, NULL, '', ''),
(21, 0x0e5901ea63a111edb8900242ac10ee0c, 1668439412, 0x4c9c2208643011ed8cfb0242ac10ee0a, 'file', 'files/themes/css/regular.css', 'css', 'b027a7958cf08bff4b7025a258cf611d', 1668381089, '1', 'regular.css', 0, 0, 0, 0, NULL, '', ''),
(23, 0xc7a524ee677111eda1790242ac10ee0c, 1668797812, 0x85bd9cf0652a11edb7320242ac10ee0c, 'file', 'files/themes/images/archiv/cleverLogo.png', 'png', '40e7ad2e5622686aea1594eb60864348', 1668546883, '1', 'cleverLogo.png', 0, 0, 0, 0, NULL, '1', ''),
(24, 0x80bc0a19642e11edb6390242ac10ee0c, 1668797389, 0xc7a524ee677111eda1790242ac10ee0c, 'folder', 'files/themes/images/archiv', '', '8891ff18f6e3d7cf5657a58fe913f5c7', NULL, '1', 'archiv', 0, 0, 0, 0, NULL, '', ''),
(25, 0xc7a524ee677111eda1790242ac10ee0c, 1668797812, 0xca1148f4677111eda1790242ac10ee0c, 'file', 'files/themes/images/archiv/cleverLogo.odg', 'odg', 'f1fdd974da9d3c4446e89109696a759e', 1668546643, '1', 'cleverLogo.odg', 0, 0, 0, 0, NULL, '', ''),
(26, 0xc7a524ee677111eda1790242ac10ee0c, 1668797812, 0xd0ccd802677111eda1790242ac10ee0c, 'file', 'files/themes/images/archiv/cleverLogo blaugrau-grün.odg', 'odg', '1243ffc73ee42048a0fed07ddbcfea9c', 1668634419, '1', 'cleverLogo blaugrau-grün.odg', 0, 0, 0, 0, NULL, '', ''),
(27, 0xc7a524ee677111eda1790242ac10ee0c, 1668797812, 0xe96608da677111eda1790242ac10ee0c, 'file', 'files/themes/images/archiv/logo.png', 'png', '42b66f0f7c27dd103b3b052cea0610bd', 1668797446, '1', 'logo.png', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a333a22616c74223b733a33343a224c6f676f20436c6576657220517569726f7a202d2075706379636c696e6720617274223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a333a22616c74223b733a33343a224c6f676f20436c6576657220517569726f7a202d2075706379636c696e6720617274223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '1', ''),
(28, 0xc7a524ee677111eda1790242ac10ee0c, 1668797812, 0xe9d2d529677111eda1790242ac10ee0c, 'file', 'files/themes/images/archiv/logo.webp', 'webp', '3076821809214558275183702c4e3bff', 1668797447, '1', 'logo.webp', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a333a22616c74223b733a33343a224c6f676f20436c6576657220517569726f7a202d2075706379636c696e6720617274223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a333a22616c74223b733a33343a224c6f676f20436c6576657220517569726f7a202d2075706379636c696e6720617274223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '1', ''),
(29, 0xc7a524ee677111eda1790242ac10ee0c, 1668797812, 0xea364bbb677111eda1790242ac10ee0c, 'file', 'files/themes/images/archiv/logo.svg', 'svg', 'c85a64256e23cbb8a507b3da5b76f319', 1668797447, '1', 'logo.svg', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a303a22223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a303a22223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '', ''),
(30, 0xc7a524ee677111eda1790242ac10ee0c, 1668798764, 0xe48e92bc677411eda1790242ac10ee0c, 'file', 'files/themes/images/archiv/logoCQ.svg', 'svg', '1add122f4f61e4e3aad10b692584ad9e', NULL, '1', 'logoCQ.svg', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a333a22616c74223b733a33343a224c6f676f20436c6576657220517569726f7a202d2075706379636c696e6720617274223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a31383a224c6f676f20436c6576657220517569726f7a223b733a333a22616c74223b733a33343a224c6f676f20436c6576657220517569726f7a202d2075706379636c696e6720617274223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '', ''),
(33, 0x80bc0a19642e11edb6390242ac10ee0c, 1668800715, 0x85d10c1f677911eda1790242ac10ee0c, 'file', 'files/themes/images/logoCQ.svg', 'svg', '4c2b472e6dc63ba3c8568de6bf5a4af0', NULL, '1', 'logoCQ.svg', 0, 0, 0, 0, NULL, '', ''),
(34, 0x3b5e52bf63a111edb8900242ac10ee0c, 1668972045, 0x6e889b7d690811edaa380242ac10ee0c, 'file', 'files/themes/js/navLlanguageToggle.js', 'js', '074a186bcc4969a373db059633778688', NULL, '1', 'navLlanguageToggle.js', 0, 0, 0, 0, NULL, '', ''),
(40, 0x80bc0a19642e11edb6390242ac10ee0c, 1669752112, 0xaa7b031a702011ed8c720242ac10ee0c, 'file', 'files/themes/images/DeepinBildschirmfoto_Bereich auswählen_20221118170848.png', 'png', '80aa5e18ca41eb2a67d933c086f001ce', NULL, '1', 'DeepinBildschirmfoto_Bereich auswählen_20221118170848.png', 0, 0, 0, 0, NULL, '1', ''),
(41, 0x3b5e52bf63a111edb8900242ac10ee0c, 1671554238, 0x91654f3e808411ed8f4f0242ac10ee0c, 'file', 'files/themes/js/loginToggle.js', 'js', '002f19232cc64396a3f7dbec28e2ed60', NULL, '1', 'loginToggle.js', 0, 0, 0, 0, NULL, '', ''),
(42, 0x3b5e52bf63a111edb8900242ac10ee0c, 1671568705, 0x40bf454b80a611ed97ae0242ac10ee0c, 'file', 'files/themes/js/regToggle.js', 'js', '23a07ef8fa05a304d09e1e94394cd097', NULL, '1', 'regToggle.js', 0, 0, 0, 0, NULL, '', ''),
(45, 0x3b5e52bf63a111edb8900242ac10ee0c, 1674414814, 0xddf603a19a8811ed86a70242ac10ee0c, 'file', 'files/themes/js/makeDraggable.js', 'js', 'd586c242dc0c41a8ac8bba9e86dcf843', NULL, '1', 'makeDraggable.js', 0, 0, 0, 0, NULL, '', ''),
(46, 0x979dcfe763a211edb8900242ac10ee0c, 1681248167, 0x2e61d057c4e911ed99b40242ac10ee0c, 'file', 'files/images/img_2021-3-2.jpg', 'jpg', '40ee549f7203669b181d21b8452402b4', NULL, '1', 'img_2021-3-2.jpg', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a393a22456c627065726c656e223b733a333a22616c74223b733a34333a22456c627065726c656e202d2065696e6520536b756c7074757220766f6e20436c6576657220517569726f7a223b733a343a226c696e6b223b733a33373a222f6b756e73747765726b652f736b756c70747572656e2f656c627065726c656e2e68746d6c223b733a373a2263617074696f6e223b733a393a22456c627065726c656e223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a32323a22506561726c732066726f6d20526976657220456c6265223b733a333a22616c74223b733a35333a22506561726c732066726f6d20526976657220456c6265202d206120736b756c707475726520627920436c6576657220517569726f7a223b733a343a226c696e6b223b733a33373a222f6b756e73747765726b652f736b756c70747572656e2f656c627065726c656e2e68746d6c223b733a373a2263617074696f6e223b733a32323a22506561726c732066726f6d20526976657220456c6265223b733a373a226c6963656e7365223b733a303a22223b7d7d, '1', ''),
(47, 0x80bc0a19642e11edb6390242ac10ee0c, 1679426366, 0x0f350e8cc81d11eda8a20242ac10ee0c, 'file', 'files/themes/images/nch_logo.svg', 'svg', '7808d37dbbebb1205a7d35872f82f7dd', NULL, '1', 'nch_logo.svg', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a31373a224e61636868616c74696720696d20576562223b733a333a22616c74223b733a34323a224c6f676f2064657220536569746520262333343b4e61636868616c74696720696d20576562262333343b223b733a343a226c696e6b223b733a33323a2268747470733a2f2f7777772e6e61636868616c7469672d696d2d7765622e6465223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a31373a224e61636868616c74696720696d20576562223b733a333a22616c74223b733a34373a224c6f676f206f6620746865207765627369746520262333343b4e61636868616c74696720696d20576562262333343b223b733a343a226c696e6b223b733a33323a2268747470733a2f2f7777772e6e61636868616c7469672d696d2d7765622e6465223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '', ''),
(48, 0x80bc0a19642e11edb6390242ac10ee0c, 1679426565, 0xa3c8791fc81d11eda8a20242ac10ee0c, 'file', 'files/themes/images/support-contao-symbol-color.svg', 'svg', 'dc8fcb93497df6c117294c4cc6bdc664', NULL, '1', 'support-contao-symbol-color.svg', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a32383a2244617320434d5320436f6e74616f20756e7465727374c3bc747a656e223b733a333a22616c74223b733a32383a2244617320434d5320436f6e74616f20756e7465727374c3bc747a656e223b733a343a226c696e6b223b733a35313a2268747470733a2f2f636f6e74616f2e6f72672f64652f66696e616e7a69656c6c2d756e74657273747565747a656e2e68746d6c223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a32353a22537570706f7274696e672074686520434d5320436f6e74616f223b733a333a22616c74223b733a32353a22537570706f7274696e672074686520434d5320436f6e74616f223b733a343a226c696e6b223b733a35313a2268747470733a2f2f636f6e74616f2e6f72672f64652f66696e616e7a69656c6c2d756e74657273747565747a656e2e68746d6c223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '', ''),
(49, 0x979dcfe763a211edb8900242ac10ee0c, 1679601118, 0x2bd662d5c9b411ed971c0242ac10ee0c, 'folder', 'files/images/news', '', 'ec851b6348283edb407dcf41a6436b1c', NULL, '1', 'news', 0, 0, 0, 0, NULL, '', ''),
(50, 0x2bd662d5c9b411ed971c0242ac10ee0c, 1679604069, 0x37df83cbc9b411ed971c0242ac10ee0c, 'file', 'files/images/news/screenshot_03.png', 'png', '4d5bbafba3f808d980774b02eadffdf8', NULL, '1', 'screenshot_03.png', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a303a22223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a32333a22456e7477757266206d65696e6572205765627365697465223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a303a22223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a32333a22456e7477757266206d65696e6572205765627365697465223b733a373a226c6963656e7365223b733a303a22223b7d7d, '1', ''),
(51, 0x2bd662d5c9b411ed971c0242ac10ee0c, 1679661926, 0x929249a7ca4011ed8ef80242ac10ee0c, 'file', 'files/images/news/altonale_001.png', 'png', '01c5844519cbe1f4f84c0dc03703fa76', NULL, '1', 'altonale_001.png', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a383a22416c746f6e616c65223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a32343a2268747470733a2f2f7777772e616c746f6e616c652e64652f223b733a373a2263617074696f6e223b733a383a22416c746f6e616c65223b733a373a226c6963656e7365223b733a32383a2268747470733a2f2f68616d62757267746f75726973742e696e666f2f223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a383a22416c746f6e616c65223b733a333a22616c74223b733a383a22416c746f6e616c65223b733a343a226c696e6b223b733a32343a2268747470733a2f2f7777772e616c746f6e616c652e64652f223b733a373a2263617074696f6e223b733a383a22416c746f6e616c65223b733a373a226c6963656e7365223b733a32383a2268747470733a2f2f68616d62757267746f75726973742e696e666f2f223b7d7d, '1', ''),
(52, 0x2bd662d5c9b411ed971c0242ac10ee0c, 1679661626, 0xeca3d279ca4011ed8ef80242ac10ee0c, 'file', 'files/images/news/clever-quiroz-de.png', 'png', 'f64f85a162072af64fc7597c4841ca30', NULL, '1', 'clever-quiroz-de.png', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a32343a225374617274736569746520436c6576657220517569726f7a223b733a333a22616c74223b733a32343a225374617274736569746520436c6576657220517569726f7a223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a32343a225374617274736569746520436c6576657220517569726f7a223b733a333a22616c74223b733a32343a225374617274736569746520436c6576657220517569726f7a223b733a343a226c696e6b223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a373a226c6963656e7365223b733a303a22223b7d7d, '1', ''),
(53, 0x2bd662d5c9b411ed971c0242ac10ee0c, 1682279162, 0xbf5162fcca4211ed8ef80242ac10ee0c, 'file', 'files/images/news/popup-zukunftshaus.jpg', 'jpg', 'fe7f04bc0265dd0d2cfa06939a80ea7b', NULL, '1', 'popup-zukunftshaus.jpg', 0, 0, 0, 0, 0x613a323a7b733a323a226465223b613a353a7b733a353a227469746c65223b733a32363a22506f702d5570205a756b756e667473686175732052697373656e223b733a333a22616c74223b733a32363a22506f702d5570205a756b756e667473686175732052697373656e223b733a343a226c696e6b223b733a33353a2268747470733a2f2f7777772e7a756b756e667473666f72756d2d72697373656e2e6465223b733a373a2263617074696f6e223b733a32363a22506f702d5570205a756b756e667473686175732052697373656e223b733a373a226c6963656e7365223b733a33353a2268747470733a2f2f7777772e7a756b756e667473666f72756d2d72697373656e2e6465223b7d733a323a22656e223b613a353a7b733a353a227469746c65223b733a32363a22506f702d5570205a756b756e667473686175732052697373656e223b733a333a22616c74223b733a32363a22506f702d5570205a756b756e667473686175732052697373656e223b733a343a226c696e6b223b733a33353a2268747470733a2f2f7777772e7a756b756e667473666f72756d2d72697373656e2e6465223b733a373a2263617074696f6e223b733a32363a22506f702d5570205a756b756e667473686175732052697373656e223b733a373a226c6963656e7365223b733a33353a2268747470733a2f2f7777772e7a756b756e667473666f72756d2d72697373656e2e6465223b7d7d, '1', ''),
(54, 0x0e5901ea63a111edb8900242ac10ee0c, 1680023849, 0x6b6c4e73cd8c11edb7420242ac10ee0c, 'file', 'files/themes/css/brands.css', 'css', '4233f057e8cf9765cfda5a0ec73ff94d', NULL, '1', 'brands.css', 0, 0, 0, 0, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_form`
--

CREATE TABLE `tl_form` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sendViaEmail` char(1) NOT NULL DEFAULT '',
  `mailerTransport` varchar(255) NOT NULL DEFAULT '',
  `recipient` varchar(1022) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `format` varchar(12) NOT NULL DEFAULT 'raw',
  `skipEmpty` char(1) NOT NULL DEFAULT '',
  `storeValues` char(1) NOT NULL DEFAULT '',
  `targetTable` varchar(64) NOT NULL DEFAULT '',
  `customTpl` varchar(64) NOT NULL DEFAULT '',
  `method` varchar(12) NOT NULL DEFAULT 'POST',
  `novalidate` char(1) NOT NULL DEFAULT '',
  `attributes` varchar(255) NOT NULL DEFAULT '',
  `formID` varchar(64) NOT NULL DEFAULT '',
  `allowTags` char(1) NOT NULL DEFAULT '',
  `nc_notification` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_form`
--

INSERT INTO `tl_form` (`id`, `tstamp`, `title`, `alias`, `jumpTo`, `sendViaEmail`, `mailerTransport`, `recipient`, `subject`, `format`, `skipEmpty`, `storeValues`, `targetTable`, `customTpl`, `method`, `novalidate`, `attributes`, `formID`, `allowTags`, `nc_notification`) VALUES
(1, 1681676911, 'Kontakt', 'kontakt', 11, '', '', '', '', 'raw', '', '', '', '', 'POST', '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', 13),
(2, 1669927821, 'Bestellbedingungsformular', 'bestellbedingungsformular', 0, '', '', '', '', 'raw', '', '', '', '', 'POST', '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tl_form_field`
--

CREATE TABLE `tl_form_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(64) NOT NULL DEFAULT 'text',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `label` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `html` text DEFAULT NULL,
  `options` blob DEFAULT NULL,
  `mandatory` char(1) NOT NULL DEFAULT '',
  `rgxp` varchar(32) NOT NULL DEFAULT '',
  `placeholder` varchar(255) NOT NULL DEFAULT '',
  `customRgxp` varchar(255) NOT NULL DEFAULT '',
  `errorMsg` varchar(255) NOT NULL DEFAULT '',
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxImageWidth` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxImageHeight` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `minval` varchar(10) NOT NULL DEFAULT '',
  `maxval` varchar(10) NOT NULL DEFAULT '',
  `step` varchar(10) NOT NULL DEFAULT '',
  `size` varchar(255) NOT NULL DEFAULT 'a:2:{i:0;i:4;i:1;i:40;}',
  `multiple` char(1) NOT NULL DEFAULT '',
  `mSize` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `extensions` varchar(255) NOT NULL DEFAULT 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx',
  `storeFile` char(1) NOT NULL DEFAULT '',
  `uploadFolder` binary(16) DEFAULT NULL,
  `useHomeDir` char(1) NOT NULL DEFAULT '',
  `doNotOverwrite` char(1) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `accesskey` char(1) NOT NULL DEFAULT '',
  `tabindex` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `fSize` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `customTpl` varchar(64) NOT NULL DEFAULT '',
  `slabel` varchar(255) NOT NULL DEFAULT '',
  `imageSubmit` char(1) NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `invisible` char(1) NOT NULL DEFAULT '',
  `conditionField` int(11) NOT NULL DEFAULT 0,
  `doNotSanitize` char(1) NOT NULL DEFAULT '',
  `headline` varchar(255) NOT NULL DEFAULT '',
  `remark_icon` varchar(16) NOT NULL DEFAULT 'show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_form_field`
--

INSERT INTO `tl_form_field` (`id`, `type`, `pid`, `sorting`, `tstamp`, `label`, `name`, `text`, `html`, `options`, `mandatory`, `rgxp`, `placeholder`, `customRgxp`, `errorMsg`, `minlength`, `maxlength`, `maxImageWidth`, `maxImageHeight`, `minval`, `maxval`, `step`, `size`, `multiple`, `mSize`, `extensions`, `storeFile`, `uploadFolder`, `useHomeDir`, `doNotOverwrite`, `class`, `value`, `accesskey`, `tabindex`, `fSize`, `customTpl`, `slabel`, `imageSubmit`, `singleSRC`, `invisible`, `conditionField`, `doNotSanitize`, `headline`, `remark_icon`) VALUES
(1, 'explanation', 1, 128, 1681669917, '', '', '<p><em><span class=\"shaded\">Farbig unterlegte Felder </span> sind erforderlich. Bitte füllen Sie diese aus!</em></p>', NULL, NULL, '', '', '', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;i:4;i:1;i:40;}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', '', '', '', 0, 0, '', '', '', NULL, '1', 0, '', '', 'show'),
(2, 'text', 1, 256, 1668437604, 'Ihre Email-Adresse', 'email', NULL, NULL, NULL, '1', 'email', '', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;i:4;i:1;i:40;}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', 'email', '', '', 0, 0, '', '', '', NULL, '', 0, '', '', 'show'),
(3, 'textarea', 1, 384, 1668437647, 'Ihre Nachricht', 'message', NULL, NULL, NULL, '1', 'extnd', '', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;s:1:\"4\";i:1;s:2:\"40\";}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', 'message', '', '', 0, 0, '', '', '', NULL, '', 0, '', '', 'show'),
(4, 'explanation', 1, 512, 1668437679, '', '', '<p><em>Detaillierte Informationen zum Umgang mit Nutzerdaten finden Sie in unserer <a href=\"{{link_url::10|urlattr}}\"><u>Datenschutzerklärung</u></a>.</em></p>', NULL, NULL, '', '', '', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;i:4;i:1;i:40;}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', 'privacy', '', '', 0, 0, '', '', '', NULL, '', 0, '', '', 'show'),
(5, 'captcha', 1, 640, 1668437720, 'Sicherheitsabfrage', '', NULL, NULL, NULL, '', '', 'Sicherheitsabfrage', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;i:4;i:1;i:40;}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', 'security', '', '', 0, 0, '', '', '', NULL, '', 0, '', '', 'show'),
(6, 'submit', 1, 768, 1668437747, '', '', NULL, NULL, NULL, '', '', '', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;i:4;i:1;i:40;}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', 'send', '', '', 0, 0, '', 'Absenden', '', NULL, '', 0, '', '', 'show'),
(7, 'checkbox', 2, 128, 1669927958, '', 'agb', NULL, NULL, 0x613a313a7b693a303b613a323a7b733a353a2276616c7565223b733a313a2231223b733a353a226c6162656c223b733a32323a2249636820616b7a657074696572652064696520414742223b7d7d, '1', '', '', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;i:4;i:1;i:40;}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', 'shop', '', '', 0, 0, '', '', '', NULL, '', 0, '', '', 'show'),
(8, 'explanation', 2, 64, 1671114103, '', '', '<p><a href=\"{{link_url::34|urlattr}}\" target=\"_blank\" rel=\"noopener\">Allgemeine Geschäftsbedingungen (AGB)</a></p>', NULL, NULL, '', '', '', '', '', 0, 0, 0, 0, '', '', '', 'a:2:{i:0;i:4;i:1;i:40;}', '', 0, 'jpg,jpeg,gif,png,pdf,doc,docx,xls,xlsx,ppt,pptx', '', NULL, '', '', '', '', '', 0, 0, '', '', '', NULL, '', 0, '', '', 'show');

-- --------------------------------------------------------

--
-- Table structure for table `tl_image_size`
--

CREATE TABLE `tl_image_size` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `cssClass` varchar(255) NOT NULL DEFAULT '',
  `densities` varchar(255) NOT NULL DEFAULT '',
  `sizes` varchar(255) NOT NULL DEFAULT '',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `resizeMode` varchar(255) NOT NULL DEFAULT '',
  `zoom` int(11) DEFAULT NULL,
  `formats` varchar(1024) NOT NULL DEFAULT '',
  `skipIfDimensionsMatch` char(1) NOT NULL DEFAULT '',
  `lazyLoading` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_image_size_item`
--

CREATE TABLE `tl_image_size_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `media` varchar(255) NOT NULL DEFAULT '',
  `densities` varchar(255) NOT NULL DEFAULT '',
  `sizes` varchar(255) NOT NULL DEFAULT '',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `resizeMode` varchar(255) NOT NULL DEFAULT '',
  `zoom` int(11) DEFAULT NULL,
  `invisible` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_address`
--

CREATE TABLE `tl_iso_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ptable` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gender` varchar(32) NOT NULL DEFAULT '',
  `salutation` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `dateOfBirth` varchar(11) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `vat_no` varchar(255) NOT NULL DEFAULT '',
  `street_1` varchar(255) NOT NULL DEFAULT '',
  `street_2` varchar(255) NOT NULL DEFAULT '',
  `street_3` varchar(255) NOT NULL DEFAULT '',
  `postal` varchar(32) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `subdivision` varchar(10) NOT NULL DEFAULT '',
  `country` varchar(32) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `isDefaultBilling` char(1) NOT NULL DEFAULT '',
  `isDefaultShipping` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_address`
--

INSERT INTO `tl_iso_address` (`id`, `pid`, `tstamp`, `ptable`, `label`, `store_id`, `gender`, `salutation`, `firstname`, `lastname`, `dateOfBirth`, `company`, `vat_no`, `street_1`, `street_2`, `street_3`, `postal`, `city`, `subdivision`, `country`, `phone`, `email`, `isDefaultBilling`, `isDefaultShipping`) VALUES
(2, 5, 1691331657, 'tl_member', 'Rechnungsadresse', 1, '', '', 'Test', 'Tester', '', '', '', 'Am kleinen Wege 1', '', '', '10000', 'Berlin', '', 'de', '', 'test@test.de', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_attribute`
--

CREATE TABLE `tl_iso_attribute` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `field_name` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `legend` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `optionsSource` varchar(16) NOT NULL DEFAULT '',
  `options` blob DEFAULT NULL,
  `foreignKey` text DEFAULT NULL,
  `includeBlankOption` char(1) NOT NULL DEFAULT '',
  `blankOptionLabel` varchar(255) NOT NULL DEFAULT '',
  `variant_option` char(1) NOT NULL DEFAULT '',
  `be_search` char(1) NOT NULL DEFAULT '',
  `be_filter` char(1) NOT NULL DEFAULT '',
  `customer_defined` char(1) NOT NULL DEFAULT '',
  `mandatory` char(1) NOT NULL DEFAULT '',
  `fe_filter` char(1) NOT NULL DEFAULT '',
  `fe_search` char(1) NOT NULL DEFAULT '',
  `fe_sorting` char(1) NOT NULL DEFAULT '',
  `multiple` char(1) NOT NULL DEFAULT '',
  `size` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `chosen` char(1) NOT NULL DEFAULT '',
  `extensions` varchar(255) NOT NULL DEFAULT '',
  `rte` varchar(255) NOT NULL DEFAULT '',
  `multilingual` char(1) NOT NULL DEFAULT '',
  `rgxp` varchar(255) NOT NULL DEFAULT '',
  `placeholder` varchar(255) NOT NULL DEFAULT '',
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `minval` varchar(10) NOT NULL DEFAULT '',
  `maxval` varchar(10) NOT NULL DEFAULT '',
  `step` varchar(10) NOT NULL DEFAULT '',
  `conditionField` varchar(30) NOT NULL DEFAULT '',
  `fieldType` varchar(8) NOT NULL DEFAULT '',
  `files` char(1) NOT NULL DEFAULT '',
  `filesOnly` char(1) NOT NULL DEFAULT '',
  `isGallery` char(1) NOT NULL DEFAULT '',
  `sortBy` varchar(32) NOT NULL DEFAULT '',
  `path` binary(16) DEFAULT NULL,
  `rootNodes` blob DEFAULT NULL,
  `checkoutRelocate` char(1) NOT NULL DEFAULT '',
  `checkoutTargetFolder` varchar(255) NOT NULL DEFAULT '',
  `checkoutTargetFile` varchar(255) NOT NULL DEFAULT '',
  `datepicker` char(1) NOT NULL DEFAULT '',
  `storeFile` char(1) NOT NULL DEFAULT '',
  `uploadFolder` binary(16) DEFAULT NULL,
  `useHomeDir` char(1) NOT NULL DEFAULT '',
  `doNotOverwrite` char(1) NOT NULL DEFAULT '',
  `customTpl` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_attribute`
--

INSERT INTO `tl_iso_attribute` (`id`, `tstamp`, `name`, `field_name`, `type`, `legend`, `description`, `optionsSource`, `options`, `foreignKey`, `includeBlankOption`, `blankOptionLabel`, `variant_option`, `be_search`, `be_filter`, `customer_defined`, `mandatory`, `fe_filter`, `fe_search`, `fe_sorting`, `multiple`, `size`, `chosen`, `extensions`, `rte`, `multilingual`, `rgxp`, `placeholder`, `minlength`, `maxlength`, `minval`, `maxval`, `step`, `conditionField`, `fieldType`, `files`, `filesOnly`, `isGallery`, `sortBy`, `path`, `rootNodes`, `checkoutRelocate`, `checkoutTargetFolder`, `checkoutTargetFile`, `datepicker`, `storeFile`, `uploadFolder`, `useHomeDir`, `doNotOverwrite`, `customTpl`) VALUES
(12, 1676221993, 'length', 'length', 'text', 'options_legend', 'Length of product', 'attribute', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', 5, '', 'jpg,jpeg,gif,png,tif,tiff,bmp,svg,svgz,webp', '', '1', '', '', 0, 0, '', '', '', '', '', '', '', '', 'name_asc', NULL, NULL, '', 'files/orders/##document_number##/##product_position##__{{flag::##product_name##|standardize}}/##attribute_field##', '##file_target##', '', '', NULL, '', '', ''),
(13, 1676221994, 'width', 'width', 'text', 'options_legend', 'Width of product', 'attribute', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', 5, '', 'jpg,jpeg,gif,png,tif,tiff,bmp,svg,svgz,webp', '', '1', '', '', 0, 0, '', '', '', '', '', '', '', '', 'name_asc', NULL, NULL, '', 'files/orders/##document_number##/##product_position##__{{flag::##product_name##|standardize}}/##attribute_field##', '##file_target##', '', '', NULL, '', '', ''),
(14, 1676221993, 'height', 'height', 'text', 'options_legend', 'Height of product', 'attribute', NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', 5, '', 'jpg,jpeg,gif,png,tif,tiff,bmp,svg,svgz,webp', '', '1', '', '', 0, 0, '', '', '', '', '', '', '', '', 'name_asc', NULL, NULL, '', 'files/orders/##document_number##/##product_position##__{{flag::##product_name##|standardize}}/##attribute_field##', '##file_target##', '', '', NULL, '', '', ''),
(15, 1682440121, 'Status', 'status', 'select', 'options_legend', '', 'table', NULL, NULL, '', '', '1', '', '1', '', '', '', '', '', '', 5, '', 'jpg,jpeg,gif,png,tif,tiff,bmp,svg,svgz,webp', '', '', '', '', 0, 0, '', '', '', '', '', '', '', '', 'name_asc', NULL, NULL, '', 'files/orders/##document_number##/##product_position##__{{flag::##product_name##|standardize}}/##attribute_field##', '##file_target##', '', '', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_attribute_option`
--

CREATE TABLE `tl_iso_attribute_option` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ptable` varchar(64) NOT NULL DEFAULT '',
  `langPid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(5) NOT NULL DEFAULT '',
  `field_name` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(8) NOT NULL DEFAULT '',
  `isDefault` char(1) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `price` varchar(16) NOT NULL DEFAULT '',
  `cssClass` varchar(64) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_attribute_option`
--

INSERT INTO `tl_iso_attribute_option` (`id`, `pid`, `sorting`, `tstamp`, `ptable`, `langPid`, `language`, `field_name`, `type`, `isDefault`, `label`, `price`, `cssClass`, `published`) VALUES
(1, 15, 128, 1682433500, 'tl_iso_attribute', 0, '', '', 'option', '', 'Original', '', '', '1'),
(2, 15, 64, 1682433516, 'tl_iso_attribute', 0, '', '', 'option', '', 'Kopie', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_baseprice`
--

CREATE TABLE `tl_iso_baseprice` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `amount` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_config`
--

CREATE TABLE `tl_iso_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `vat_no` varchar(255) NOT NULL DEFAULT '',
  `street_1` varchar(255) NOT NULL DEFAULT '',
  `street_2` varchar(255) NOT NULL DEFAULT '',
  `street_3` varchar(255) NOT NULL DEFAULT '',
  `postal` varchar(32) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `subdivision` varchar(10) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `bankName` varchar(255) NOT NULL DEFAULT '',
  `bankAccount` varchar(34) NOT NULL DEFAULT '',
  `bankCode` varchar(16) NOT NULL DEFAULT '',
  `taxNumber` varchar(255) NOT NULL DEFAULT '',
  `address_fields` blob DEFAULT NULL,
  `billing_country` varchar(2) NOT NULL DEFAULT '',
  `shipping_country` varchar(2) NOT NULL DEFAULT '',
  `billing_countries` blob DEFAULT NULL,
  `shipping_countries` blob DEFAULT NULL,
  `limitMemberCountries` char(1) NOT NULL DEFAULT '',
  `vatNoValidators` blob DEFAULT NULL,
  `priceDisplay` varchar(8) NOT NULL DEFAULT '',
  `currencyFormat` varchar(20) NOT NULL DEFAULT '',
  `priceRoundPrecision` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `priceRoundIncrement` varchar(4) NOT NULL DEFAULT '',
  `cartMinSubtotal` decimal(12,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(3) NOT NULL DEFAULT '',
  `currencySymbol` char(1) NOT NULL DEFAULT '',
  `currencySpace` char(1) NOT NULL DEFAULT '',
  `currencyPosition` varchar(5) NOT NULL DEFAULT '',
  `priceCalculateFactor` varchar(16) NOT NULL DEFAULT '',
  `priceCalculateMode` varchar(3) NOT NULL DEFAULT '',
  `currencyAutomator` char(1) NOT NULL DEFAULT '',
  `currencyOrigin` varchar(3) NOT NULL DEFAULT '',
  `currencyProvider` varchar(32) NOT NULL DEFAULT '',
  `orderPrefix` varchar(255) NOT NULL DEFAULT '',
  `orderDigits` int(10) UNSIGNED NOT NULL DEFAULT 4,
  `orderstatus_new` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `orderstatus_error` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `orderDetailsModule` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `templateGroup` varchar(255) NOT NULL DEFAULT '',
  `newProductPeriod` varchar(255) NOT NULL DEFAULT '',
  `ga_enable` char(1) NOT NULL DEFAULT '',
  `ga_account` varchar(64) NOT NULL DEFAULT '',
  `ga_member` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_config`
--

INSERT INTO `tl_iso_config` (`id`, `tstamp`, `name`, `label`, `fallback`, `firstname`, `lastname`, `company`, `vat_no`, `street_1`, `street_2`, `street_3`, `postal`, `city`, `subdivision`, `country`, `phone`, `email`, `bankName`, `bankAccount`, `bankCode`, `taxNumber`, `address_fields`, `billing_country`, `shipping_country`, `billing_countries`, `shipping_countries`, `limitMemberCountries`, `vatNoValidators`, `priceDisplay`, `currencyFormat`, `priceRoundPrecision`, `priceRoundIncrement`, `cartMinSubtotal`, `currency`, `currencySymbol`, `currencySpace`, `currencyPosition`, `priceCalculateFactor`, `priceCalculateMode`, `currencyAutomator`, `currencyOrigin`, `currencyProvider`, `orderPrefix`, `orderDigits`, `orderstatus_new`, `orderstatus_error`, `orderDetailsModule`, `templateGroup`, `newProductPeriod`, `ga_enable`, `ga_account`, `ga_member`) VALUES
(1, 1688759974, 'Standard Shop-Konfiguration', 'Standard Shop-Konfiguration', '1', 'Hugo', 'Tester', '', '', 'Am kleinen Wege 17', '', '', '22589', 'Hamburg', '', 'de', '', 'tester@web.de', '', '', '', '', 0x613a31393a7b733a353a226c6162656c223b613a343a7b733a343a226e616d65223b733a353a226c6162656c223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a303b7d733a363a2267656e646572223b613a343a7b733a343a226e616d65223b733a363a2267656e646572223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a313b7d733a31303a2273616c75746174696f6e223b613a343a7b733a343a226e616d65223b733a31303a2273616c75746174696f6e223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a323b7d733a373a22636f6d70616e79223b613a343a7b733a343a226e616d65223b733a373a22636f6d70616e79223b733a373a2262696c6c696e67223b733a373a22656e61626c6564223b733a383a227368697070696e67223b733a373a22656e61626c6564223b733a383a22706f736974696f6e223b693a333b7d733a393a2266697273746e616d65223b613a343a7b733a343a226e616d65223b733a393a2266697273746e616d65223b733a373a2262696c6c696e67223b733a393a226d616e6461746f7279223b733a383a227368697070696e67223b733a393a226d616e6461746f7279223b733a383a22706f736974696f6e223b693a343b7d733a383a226c6173746e616d65223b613a343a7b733a343a226e616d65223b733a383a226c6173746e616d65223b733a373a2262696c6c696e67223b733a393a226d616e6461746f7279223b733a383a227368697070696e67223b733a393a226d616e6461746f7279223b733a383a22706f736974696f6e223b693a353b7d733a31313a22646174654f664269727468223b613a343a7b733a343a226e616d65223b733a31313a22646174654f664269727468223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a363b7d733a363a227661745f6e6f223b613a343a7b733a343a226e616d65223b733a363a227661745f6e6f223b733a373a2262696c6c696e67223b733a373a22656e61626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a373b7d733a383a227374726565745f31223b613a343a7b733a343a226e616d65223b733a383a227374726565745f31223b733a373a2262696c6c696e67223b733a393a226d616e6461746f7279223b733a383a227368697070696e67223b733a393a226d616e6461746f7279223b733a383a22706f736974696f6e223b693a383b7d733a383a227374726565745f32223b613a343a7b733a343a226e616d65223b733a383a227374726565745f32223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a393b7d733a383a227374726565745f33223b613a343a7b733a343a226e616d65223b733a383a227374726565745f33223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a31303b7d733a363a22706f7374616c223b613a343a7b733a343a226e616d65223b733a363a22706f7374616c223b733a373a2262696c6c696e67223b733a393a226d616e6461746f7279223b733a383a227368697070696e67223b733a393a226d616e6461746f7279223b733a383a22706f736974696f6e223b693a31313b7d733a343a2263697479223b613a343a7b733a343a226e616d65223b733a343a2263697479223b733a373a2262696c6c696e67223b733a393a226d616e6461746f7279223b733a383a227368697070696e67223b733a393a226d616e6461746f7279223b733a383a22706f736974696f6e223b693a31323b7d733a31313a227375626469766973696f6e223b613a343a7b733a343a226e616d65223b733a31313a227375626469766973696f6e223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a31333b7d733a373a22636f756e747279223b613a343a7b733a343a226e616d65223b733a373a22636f756e747279223b733a373a2262696c6c696e67223b733a393a226d616e6461746f7279223b733a383a227368697070696e67223b733a393a226d616e6461746f7279223b733a383a22706f736974696f6e223b693a31343b7d733a353a2270686f6e65223b613a343a7b733a343a226e616d65223b733a353a2270686f6e65223b733a373a2262696c6c696e67223b733a373a22656e61626c6564223b733a383a227368697070696e67223b733a373a22656e61626c6564223b733a383a22706f736974696f6e223b693a31353b7d733a353a22656d61696c223b613a343a7b733a343a226e616d65223b733a353a22656d61696c223b733a373a2262696c6c696e67223b733a393a226d616e6461746f7279223b733a383a227368697070696e67223b733a393a226d616e6461746f7279223b733a383a22706f736974696f6e223b693a31363b7d733a31363a22697344656661756c7442696c6c696e67223b613a343a7b733a343a226e616d65223b733a31363a22697344656661756c7442696c6c696e67223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a31373b7d733a31373a22697344656661756c745368697070696e67223b613a343a7b733a343a226e616d65223b733a31373a22697344656661756c745368697070696e67223b733a373a2262696c6c696e67223b733a383a2264697361626c6564223b733a383a227368697070696e67223b733a383a2264697361626c6564223b733a383a22706f736974696f6e223b693a31383b7d7d, 'de', 'de', NULL, NULL, '', NULL, 'gross', '10.000,00', 2, '0.01', '0.00', 'EUR', '1', '1', 'right', '1', 'mul', '', '', '', '', 4, 1, 9, 14, '', 'a:2:{s:4:\"unit\";s:4:\"days\";s:5:\"value\";s:2:\"90\";}', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_document`
--

CREATE TABLE `tl_iso_document` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `documentTitle` varchar(255) NOT NULL DEFAULT '',
  `fileTitle` varchar(255) NOT NULL DEFAULT '',
  `documentTpl` varchar(64) NOT NULL DEFAULT '',
  `collectionTpl` varchar(64) NOT NULL DEFAULT '',
  `orderCollectionBy` varchar(16) NOT NULL DEFAULT '',
  `gallery` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_document`
--

INSERT INTO `tl_iso_document` (`id`, `tstamp`, `name`, `type`, `documentTitle`, `fileTitle`, `documentTpl`, `collectionTpl`, `orderCollectionBy`, `gallery`) VALUES
(1, 1670263904, 'Rechnung', 'standard', 'Rechnung ##collection_document_number##', 'rechnung_##collection_document_number##', 'iso_document_default', 'iso_collection_invoice', 'asc_id', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_download`
--

CREATE TABLE `tl_iso_download` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `singleSRC` binary(16) DEFAULT NULL,
  `downloads_allowed` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires` varchar(64) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_gallery`
--

CREATE TABLE `tl_iso_gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `anchor` varchar(8) NOT NULL DEFAULT '',
  `placeholder` binary(16) DEFAULT NULL,
  `main_size` varchar(64) NOT NULL DEFAULT '',
  `gallery_size` varchar(64) NOT NULL DEFAULT '',
  `lightbox_template` blob DEFAULT NULL,
  `lightbox_size` varchar(64) NOT NULL DEFAULT '',
  `zoom_size` varchar(64) NOT NULL DEFAULT '',
  `zoom_windowSize` varchar(64) NOT NULL DEFAULT '',
  `zoom_position` varchar(64) NOT NULL DEFAULT '',
  `zoom_windowFade` varchar(64) NOT NULL DEFAULT '',
  `zoom_border` varchar(64) NOT NULL DEFAULT '',
  `main_watermark_image` binary(16) DEFAULT NULL,
  `main_watermark_position` varchar(16) NOT NULL DEFAULT '',
  `gallery_watermark_image` binary(16) DEFAULT NULL,
  `gallery_watermark_position` varchar(16) NOT NULL DEFAULT '',
  `lightbox_watermark_image` binary(16) DEFAULT NULL,
  `lightbox_watermark_position` varchar(16) NOT NULL DEFAULT '',
  `zoom_watermark_image` binary(16) DEFAULT NULL,
  `zoom_watermark_position` varchar(16) NOT NULL DEFAULT '',
  `customTpl` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_gallery`
--

INSERT INTO `tl_iso_gallery` (`id`, `tstamp`, `name`, `type`, `anchor`, `placeholder`, `main_size`, `gallery_size`, `lightbox_template`, `lightbox_size`, `zoom_size`, `zoom_windowSize`, `zoom_position`, `zoom_windowFade`, `zoom_border`, `main_watermark_image`, `main_watermark_position`, `gallery_watermark_image`, `gallery_watermark_position`, `lightbox_watermark_image`, `lightbox_watermark_position`, `zoom_watermark_image`, `zoom_watermark_position`, `customTpl`) VALUES
(1, 1674417662, 'Standard Galerie', 'standard', 'reader', 0xaa7b031a702011ed8c720242ac10ee0c, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:11:\"_newsletter\";}', 'a:3:{i:0;s:3:\"200\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 0x613a313a7b693a303b733a31303a226a5f636f6c6f72626f78223b7d, 'a:3:{i:0;s:3:\"800\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', '', '', '', '', '', NULL, 'center_center', NULL, 'center_center', NULL, 'left_top', NULL, '', 'iso_gallery_standard'),
(2, 1681248437, 'Inline Galerie', 'inline', 'lightbox', 0xaa7b031a702011ed8c720242ac10ee0c, 'a:3:{i:0;s:3:\"600\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:3:{i:0;s:3:\"200\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 0x613a313a7b693a303b733a31303a226a5f636f6c6f72626f78223b7d, 'a:3:{i:0;s:4:\"1200\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', '', '', '', '', '', NULL, 'center_center', NULL, 'center_center', NULL, '', NULL, '', 'iso_gallery_inline'),
(4, 1669838769, 'Zoom Galerie', 'elevatezoom', 'reader', 0xaa7b031a702011ed8c720242ac10ee0c, 'a:3:{i:0;s:3:\"800\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:3:{i:0;s:3:\"200\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', NULL, '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 'a:3:{i:2;s:5:\"pos10\";i:0;s:0:\"\";i:1;s:0:\"\";}', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, 'center_center', NULL, 'center_center', NULL, '', NULL, 'center_center', 'iso_gallery_elevatezoom');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_group`
--

CREATE TABLE `tl_iso_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `product_type` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_label`
--

CREATE TABLE `tl_iso_label` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` varchar(5) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_label`
--

INSERT INTO `tl_iso_label` (`id`, `tstamp`, `language`, `label`, `replacement`) VALUES
(1, 1670713427, 'de', 'stock', 'Bestand'),
(4, 1676221182, 'de', 'length', 'Länge'),
(5, 1676221139, 'de', 'width', 'Breite'),
(7, 1676221155, 'de', 'height', 'Höhe');

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

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_payment`
--

CREATE TABLE `tl_iso_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `note` text DEFAULT NULL,
  `new_order_status` int(11) NOT NULL DEFAULT 0,
  `price` varchar(16) DEFAULT NULL,
  `tax_class` int(11) NOT NULL DEFAULT 0,
  `allowed_cc_types` text DEFAULT NULL,
  `trans_type` varchar(8) NOT NULL DEFAULT '',
  `minimum_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `maximum_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `quantity_mode` varchar(32) NOT NULL DEFAULT '',
  `minimum_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maximum_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `countries` blob DEFAULT NULL,
  `shipping_modules` blob DEFAULT NULL,
  `product_types` blob DEFAULT NULL,
  `product_types_condition` varchar(16) NOT NULL DEFAULT '',
  `config_ids` blob DEFAULT NULL,
  `paybyway_merchant_id` int(11) NOT NULL DEFAULT 0,
  `paybyway_private_key` varchar(255) NOT NULL DEFAULT '',
  `paypal_account` varchar(255) NOT NULL DEFAULT '',
  `paypal_client` varchar(128) NOT NULL DEFAULT '',
  `paypal_secret` varchar(128) NOT NULL DEFAULT '',
  `psp_pspid` varchar(255) NOT NULL DEFAULT '',
  `psp_http_method` varchar(4) NOT NULL DEFAULT '',
  `psp_hash_method` varchar(6) NOT NULL DEFAULT '',
  `psp_hash_in` varchar(128) NOT NULL DEFAULT '',
  `psp_hash_out` varchar(128) NOT NULL DEFAULT '',
  `psp_dynamic_template` varchar(128) NOT NULL DEFAULT '',
  `psp_payment_method` varchar(128) NOT NULL DEFAULT '',
  `datatrans_id` varchar(16) NOT NULL DEFAULT '',
  `datatrans_sign` varchar(128) NOT NULL DEFAULT '',
  `datatrans_hash_convert` char(1) NOT NULL DEFAULT '0',
  `datatrans_hash_method` char(6) NOT NULL DEFAULT 'md5',
  `vads_site_id` varchar(8) NOT NULL DEFAULT '',
  `vads_certificate` varchar(16) NOT NULL DEFAULT '',
  `sparkasse_paymentmethod` varchar(32) NOT NULL DEFAULT '',
  `sparkasse_sslmerchant` varchar(16) NOT NULL DEFAULT '',
  `sparkasse_sslpassword` varchar(255) NOT NULL DEFAULT '',
  `sparkasse_merchantref` varchar(255) NOT NULL DEFAULT '',
  `sofortueberweisung_user_id` varchar(16) NOT NULL DEFAULT '',
  `sofortueberweisung_project_id` varchar(16) NOT NULL DEFAULT '',
  `sofortueberweisung_project_password` varchar(255) NOT NULL DEFAULT '',
  `saferpay_accountid` varchar(16) NOT NULL DEFAULT '',
  `saferpay_username` varchar(32) NOT NULL DEFAULT '',
  `saferpay_password` varchar(32) NOT NULL DEFAULT '',
  `saferpay_description` varchar(255) NOT NULL DEFAULT '',
  `saferpay_vtconfig` varchar(255) NOT NULL DEFAULT '',
  `saferpay_paymentmethods` varchar(255) NOT NULL DEFAULT '',
  `expercash_popupId` varchar(10) NOT NULL DEFAULT '',
  `expercash_profile` int(11) NOT NULL DEFAULT 0,
  `expercash_popupKey` varchar(32) NOT NULL DEFAULT '',
  `expercash_paymentMethod` varchar(32) NOT NULL DEFAULT '',
  `expercash_css` binary(16) DEFAULT NULL,
  `epay_windowstate` char(1) NOT NULL DEFAULT '',
  `epay_merchantnumber` varchar(10) NOT NULL DEFAULT '',
  `epay_secretkey` varchar(64) NOT NULL DEFAULT '',
  `payone_clearingtype` varchar(3) NOT NULL DEFAULT '',
  `payone_aid` varchar(6) NOT NULL DEFAULT '',
  `payone_portalid` varchar(7) NOT NULL DEFAULT '',
  `payone_key` varchar(255) NOT NULL DEFAULT '',
  `worldpay_instId` int(11) NOT NULL DEFAULT 0,
  `worldpay_callbackPW` varchar(64) NOT NULL DEFAULT '',
  `worldpay_signatureFields` varchar(255) NOT NULL DEFAULT '',
  `worldpay_md5secret` varchar(64) NOT NULL DEFAULT '',
  `worldpay_description` varchar(255) NOT NULL DEFAULT '',
  `quickpay_merchantId` int(11) DEFAULT NULL,
  `quickpay_agreementId` int(11) DEFAULT NULL,
  `quickpay_apiKey` varchar(64) NOT NULL DEFAULT '',
  `quickpay_privateKey` varchar(64) NOT NULL DEFAULT '',
  `quickpay_paymentMethods` text DEFAULT NULL,
  `opp_entity_id` varchar(32) NOT NULL DEFAULT '',
  `opp_auth` varchar(8) NOT NULL DEFAULT '',
  `opp_token` text DEFAULT NULL,
  `opp_user_id` varchar(32) NOT NULL DEFAULT '',
  `opp_password` varchar(32) NOT NULL DEFAULT '',
  `opp_brands` blob DEFAULT NULL,
  `mpay24_merchant` varchar(5) NOT NULL DEFAULT '',
  `mpay24_password` varchar(32) NOT NULL DEFAULT '',
  `swissbilling_id` varchar(16) NOT NULL DEFAULT '',
  `swissbilling_pwd` varchar(32) NOT NULL DEFAULT '',
  `swissbilling_prescreening` char(1) NOT NULL DEFAULT '0',
  `swissbilling_b2b` char(1) NOT NULL DEFAULT '0',
  `requireCCV` char(1) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `debug` char(1) NOT NULL DEFAULT '',
  `logging` char(1) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_payment`
--

INSERT INTO `tl_iso_payment` (`id`, `tstamp`, `name`, `label`, `type`, `note`, `new_order_status`, `price`, `tax_class`, `allowed_cc_types`, `trans_type`, `minimum_total`, `maximum_total`, `quantity_mode`, `minimum_quantity`, `maximum_quantity`, `countries`, `shipping_modules`, `product_types`, `product_types_condition`, `config_ids`, `paybyway_merchant_id`, `paybyway_private_key`, `paypal_account`, `paypal_client`, `paypal_secret`, `psp_pspid`, `psp_http_method`, `psp_hash_method`, `psp_hash_in`, `psp_hash_out`, `psp_dynamic_template`, `psp_payment_method`, `datatrans_id`, `datatrans_sign`, `datatrans_hash_convert`, `datatrans_hash_method`, `vads_site_id`, `vads_certificate`, `sparkasse_paymentmethod`, `sparkasse_sslmerchant`, `sparkasse_sslpassword`, `sparkasse_merchantref`, `sofortueberweisung_user_id`, `sofortueberweisung_project_id`, `sofortueberweisung_project_password`, `saferpay_accountid`, `saferpay_username`, `saferpay_password`, `saferpay_description`, `saferpay_vtconfig`, `saferpay_paymentmethods`, `expercash_popupId`, `expercash_profile`, `expercash_popupKey`, `expercash_paymentMethod`, `expercash_css`, `epay_windowstate`, `epay_merchantnumber`, `epay_secretkey`, `payone_clearingtype`, `payone_aid`, `payone_portalid`, `payone_key`, `worldpay_instId`, `worldpay_callbackPW`, `worldpay_signatureFields`, `worldpay_md5secret`, `worldpay_description`, `quickpay_merchantId`, `quickpay_agreementId`, `quickpay_apiKey`, `quickpay_privateKey`, `quickpay_paymentMethods`, `opp_entity_id`, `opp_auth`, `opp_token`, `opp_user_id`, `opp_password`, `opp_brands`, `mpay24_merchant`, `mpay24_password`, `swissbilling_id`, `swissbilling_pwd`, `swissbilling_prescreening`, `swissbilling_b2b`, `requireCCV`, `guests`, `protected`, `groups`, `debug`, `logging`, `enabled`) VALUES
(2, 1688760996, 'Bezahlung bar bei Abholung', 'Barzahlung bei Abholung', 'cash', '<p>Bitte bei Abholung bar bezahlen.</p>', 10, NULL, 0, NULL, 'capture', '0.00', '0.00', 'cart_items', 0, 0, NULL, 0x613a313a7b693a303b733a323a223132223b7d, NULL, 'notAvailable', NULL, 0, '', '', '', '', '', 'POST', 'sha1', '', '', '', '', '', '', '0', 'md5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', NULL, '3', '', '', '', '', '', '', 0, '', 'instId:cartId:amount:currency', '', '', NULL, NULL, '', '', NULL, '', '', NULL, '', '', NULL, '', '', '', '', '0', '0', '', '', '', NULL, '', '', '1'),
(3, 1688760974, 'Bezahlung auf Rechnung', 'Bezahlung auf Rechnung', 'cash', NULL, 10, NULL, 3, NULL, 'capture', '0.00', '0.00', 'cart_items', 0, 0, NULL, NULL, NULL, 'notAvailable', NULL, 0, '', '', '', '', '', 'POST', 'sha1', '', '', '', '', '', '', '0', 'md5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', NULL, '3', '', '', '', '', '', '', 0, '', 'instId:cartId:amount:currency', '', '', NULL, NULL, '', '', NULL, '', '', NULL, '', '', NULL, '', '', '', '', '0', '0', '', '', '', NULL, '', '', '1'),
(4, 1688760985, 'Bezahlung auf Vorkasse', 'Bezahlung auf Vorkasse', 'cash', NULL, 10, NULL, 0, NULL, 'capture', '0.00', '0.00', 'cart_items', 0, 0, NULL, NULL, NULL, 'notAvailable', NULL, 0, '', '', '', '', '', 'POST', 'sha1', '', '', '', '', '', '', '0', 'md5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', NULL, '3', '', '', '', '', '', '', 0, '', 'instId:cartId:amount:currency', '', '', NULL, NULL, '', '', NULL, '', '', NULL, '', '', NULL, '', '', '', '', '0', '0', '', '', '', NULL, '', '', '1');

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

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_productcache`
--

CREATE TABLE `tl_iso_productcache` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniqid` varchar(32) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `products` blob DEFAULT NULL,
  `expires` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `requestcache_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `module_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_producttype`
--

CREATE TABLE `tl_iso_producttype` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(64) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `prices` char(1) NOT NULL DEFAULT '',
  `show_price_tiers` char(1) NOT NULL DEFAULT '',
  `list_template` varchar(255) NOT NULL DEFAULT '',
  `reader_template` varchar(255) NOT NULL DEFAULT '',
  `list_gallery` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reader_gallery` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cssClass` varchar(64) NOT NULL DEFAULT '',
  `attributes` blob DEFAULT NULL,
  `variants` char(1) NOT NULL DEFAULT '',
  `variant_attributes` blob DEFAULT NULL,
  `force_variant_options` char(1) NOT NULL DEFAULT '',
  `shipping_exempt` char(1) NOT NULL DEFAULT '',
  `downloads` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_producttype`
--

INSERT INTO `tl_iso_producttype` (`id`, `tstamp`, `name`, `class`, `fallback`, `description`, `prices`, `show_price_tiers`, `list_template`, `reader_template`, `list_gallery`, `reader_gallery`, `cssClass`, `attributes`, `variants`, `variant_attributes`, `force_variant_options`, `shipping_exempt`, `downloads`) VALUES
(6, 1688593353, 'Bilder', 'standard', '', 'Dieser Produkttyp gilt für Bilder', '', '1', 'iso_list_default', 'iso_reader_enhanced', 1, 2, '', 0x613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d, '', NULL, '', '', ''),
(7, 1688931029, 'Skulpturen', 'standard', '', NULL, '', '1', 'iso_list_default', 'iso_reader_enhanced', 1, 2, '', 0x613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d, '1', 0x613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a31313b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d, '1', '', ''),
(9, 1688851928, 'Karten', 'standard', '', NULL, '', '1', 'iso_list_default', 'iso_reader_enhanced', 1, 2, '', 0x613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d, '1', 0x613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a363b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_product_category`
--

CREATE TABLE `tl_iso_product_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_product_category`
--

INSERT INTO `tl_iso_product_category` (`id`, `pid`, `sorting`, `tstamp`, `page_id`) VALUES
(47, 31, 128, 1679072207, 33),
(48, 32, 256, 1679072602, 33),
(49, 33, 384, 1679072864, 33),
(50, 34, 512, 1679073170, 33),
(53, 35, 128, 1681666564, 58),
(54, 37, 640, 1682433944, 33),
(55, 50, 768, 1682537805, 33),
(60, 88, 128, 1688593324, 32),
(61, 89, 256, 1688852265, 32),
(63, 100, 384, 1688921317, 32);

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
(265, 1690659345, 'cart', 5, NULL, 0, NULL, NULL, NULL, NULL, 0, '', NULL, 0, NULL, NULL, '', 1, 0, 0, 0, 0, '121070.00', '121070.00', '121070.00', '121070.00', 'EUR', '', NULL, NULL),
(267, 1690046012, 'cart', 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '', '2987b6b350b1b474560a57f61e336f61557f75403477924f444a37f11a75a486', 0, NULL, NULL, '', 1, 0, 0, 0, 0, '9900.00', '9900.00', '9900.00', '9900.00', 'EUR', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_product_collection_download`
--

CREATE TABLE `tl_iso_product_collection_download` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `download_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `downloads_remaining` varchar(10) NOT NULL DEFAULT '',
  `expires` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

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
(3112, 265, 1688852341, 88, 'standard', 'B0001', 'Bild 1 &#40;no variants, unlimited&#41;', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32),
(3115, 265, 1688922775, 100, 'standard', 'B0002', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 0x613a303a7b7d, 1, '0.00', '0.00', '', 32),
(3116, 265, 1688922805, 89, 'standard', 'B0003', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 0x613a303a7b7d, 1, '0.00', '0.00', '', 32),
(3117, 265, 1688931318, 47, 'standard', 'S0001', 'Variante &#34;Original&#34; von Skulptur 1 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3118, 265, 1688931337, 46, 'standard', 'S0001', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '0.00', '0.00', '', 33),
(3119, 265, 1688931856, 44, 'standard', 'S0002', 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '0.00', '0.00', '', 33),
(3120, 265, 1688931877, 45, 'standard', 'S0002', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3121, 265, 1688932116, 42, 'standard', 'S0003', 'Variante Kopie von Skulptur 3 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '110260.00', '110260.00', '', 33),
(3122, 265, 1688932125, 40, 'standard', 'S0003', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '260.00', '260.00', '', 33),
(3123, 265, 1688932167, 39, 'standard', 'S0004', 'Variante Kopie von Skulptur 4 &#40;unlimited&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '100.00', '100.00', '', 33),
(3124, 265, 1688932257, 38, 'standard', 'S0004', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '250.00', '250.00', '', 33),
(3125, 265, 1688932323, 48, 'standard', 'S0005', 'Variante Kopie von Skulptur 5 &#40;quantity 2&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '0.00', '0.00', '', 33),
(3126, 265, 1688932357, 49, 'standard', 'S0005', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3127, 265, 1688932431, 51, 'standard', 'S0006', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '0.00', '0.00', '', 33),
(3128, 265, 1688932440, 52, 'standard', 'S0006', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3129, 265, 1688932521, 96, 'standard', 'K0001', 'Eintrittskarte online', 0x613a313a7b733a363a22737461747573223b693a323b7d, 1, '100.00', '100.00', '', 58),
(3130, 265, 1688932530, 97, 'standard', 'K0001', 'Eintrittskarte Schalter', 0x613a313a7b733a363a22737461747573223b693a313b7d, 100, '100.00', '100.00', '', 58);

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_product_collection_log`
--

CREATE TABLE `tl_iso_product_collection_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `author` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_product_collection_surcharge`
--

CREATE TABLE `tl_iso_product_collection_surcharge` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `source_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `label` varchar(255) NOT NULL DEFAULT '',
  `price` varchar(32) NOT NULL DEFAULT '',
  `total_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax_free_total_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax_class` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `before_tax` char(1) NOT NULL DEFAULT '',
  `addToTotal` char(1) NOT NULL DEFAULT '',
  `applyRoundingIncrement` char(1) NOT NULL DEFAULT '1',
  `products` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_product_price`
--

CREATE TABLE `tl_iso_product_price` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tax_class` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `config_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_product_price`
--

INSERT INTO `tl_iso_product_price` (`id`, `pid`, `tstamp`, `tax_class`, `config_id`, `member_group`, `start`, `stop`) VALUES
(23, 31, 1679077077, 0, 0, 0, '', ''),
(24, 32, 1679077077, 0, 0, 0, '', ''),
(25, 33, 1679077077, 0, 0, 0, '', ''),
(26, 34, 1679077077, 0, 0, 0, '', ''),
(27, 35, 1679077076, 0, 0, 0, '', ''),
(28, 37, 1682433944, 3, 0, 0, '', ''),
(29, 39, 1682439865, 3, 0, 0, '', ''),
(30, 38, 1682439883, 3, 0, 0, '', ''),
(31, 40, 1682441258, 3, 0, 0, '', ''),
(33, 42, 1682441268, 3, 0, 0, '', ''),
(34, 44, 1682442305, 3, 0, 0, '', ''),
(35, 45, 1682442321, 3, 0, 0, '', ''),
(36, 46, 1682527711, 3, 0, 0, '', ''),
(37, 47, 1682535237, 3, 0, 0, '', ''),
(38, 49, 1682537184, 3, 0, 0, '', ''),
(39, 48, 1682537196, 3, 0, 0, '', ''),
(40, 50, 1682537805, 3, 0, 0, '', ''),
(41, 51, 1682537805, 3, 0, 0, '', ''),
(42, 52, 1682537805, 3, 0, 0, '', ''),
(50, 88, 1688593283, 0, 0, 0, '', ''),
(51, 89, 1688852184, 3, 0, 0, '', ''),
(54, 100, 1688920258, 3, 0, 0, '', ''),
(55, 101, 1691357685, 3, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_product_pricetier`
--

CREATE TABLE `tl_iso_product_pricetier` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `min` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_product_pricetier`
--

INSERT INTO `tl_iso_product_pricetier` (`id`, `pid`, `tstamp`, `min`, `price`) VALUES
(23, 23, 1679169347, 1, '0.00'),
(24, 24, 1679169347, 1, '0.00'),
(25, 25, 1679169347, 1, '0.00'),
(26, 26, 1679169347, 1, '0.00'),
(27, 27, 1682441336, 1, '100.00'),
(28, 28, 1682433952, 1, '0.00'),
(29, 29, 1679169347, 1, '0.00'),
(30, 28, 1682433944, 1, '0.00'),
(31, 29, 1682439865, 1, '100.00'),
(32, 30, 1682441103, 1, '250.00'),
(33, 31, 1682441258, 1, '260.00'),
(35, 33, 1682441282, 1, '110260.00'),
(36, 34, 1682442305, 1, '0.00'),
(37, 35, 1682442321, 1, '0.00'),
(38, 36, 1682527711, 1, '0.00'),
(39, 37, 1682535237, 1, '0.00'),
(40, 38, 1682537184, 1, '0.00'),
(41, 39, 1682537196, 1, '0.00'),
(42, 40, 1682537805, 1, '0.00'),
(43, 40, 1682537805, 1, '0.00'),
(44, 41, 1682537805, 1, '0.00'),
(45, 42, 1682537805, 1, '0.00'),
(46, 43, 1682603952, 1, '0.00'),
(47, 43, 1682603952, 1, '0.00'),
(48, 44, 1682603952, 1, '0.00'),
(49, 45, 1682603952, 1, '0.00'),
(55, 50, 1688593283, 1, '100.00'),
(56, 51, 1688852184, 1, '0.00'),
(59, 54, 1688920258, 1, '0.00'),
(60, 55, 1691357685, 1, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_related_category`
--

CREATE TABLE `tl_iso_related_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_related_product`
--

CREATE TABLE `tl_iso_related_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `products` blob DEFAULT NULL,
  `productsOrder` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_requestcache`
--

CREATE TABLE `tl_iso_requestcache` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `config` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_requestcache`
--

INSERT INTO `tl_iso_requestcache` (`id`, `tstamp`, `store_id`, `config`) VALUES
(2, 1688846360, 0, 0x613a333a7b733a373a2266696c74657273223b4e3b733a383a22736f7274696e6773223b4e3b733a363a226c696d697473223b613a313a7b693a33323b4f3a32363a2249736f746f70655c5265717565737443616368655c4c696d6974223a313a7b733a31313a22002a00696e744c696d6974223b693a31353b7d7d7d),
(3, 1688852147, 0, 0x613a333a7b733a373a2266696c74657273223b4e3b733a383a22736f7274696e6773223b4e3b733a363a226c696d697473223b613a313a7b693a33323b4f3a32363a2249736f746f70655c5265717565737443616368655c4c696d6974223a313a7b733a31313a22002a00696e744c696d6974223b693a353b7d7d7d),
(4, 1688915833, 0, 0x613a333a7b733a373a2266696c74657273223b4e3b733a383a22736f7274696e6773223b4e3b733a363a226c696d697473223b613a313a7b693a33323b4f3a32363a2249736f746f70655c5265717565737443616368655c4c696d6974223a313a7b733a31313a22002a00696e744c696d6974223b693a31303b7d7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_rule`
--

CREATE TABLE `tl_iso_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `discount` varchar(16) NOT NULL DEFAULT '',
  `tax_class` int(11) NOT NULL DEFAULT 0,
  `groupRules` blob DEFAULT NULL,
  `groupCondition` varchar(8) NOT NULL DEFAULT 'first',
  `applyTo` varchar(8) NOT NULL DEFAULT '',
  `rounding` varchar(8) NOT NULL DEFAULT '',
  `enableCode` char(1) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `singleCode` char(1) NOT NULL DEFAULT '',
  `limitPerMember` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `limitPerConfig` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `minSubtotal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxSubtotal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `minWeight` varchar(255) NOT NULL DEFAULT '',
  `maxWeight` varchar(255) NOT NULL DEFAULT '',
  `minItemQuantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxItemQuantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quantityMode` varchar(32) NOT NULL DEFAULT '',
  `startDate` varchar(10) NOT NULL DEFAULT '',
  `endDate` varchar(10) NOT NULL DEFAULT '',
  `startTime` varchar(10) NOT NULL DEFAULT '',
  `endTime` varchar(10) NOT NULL DEFAULT '',
  `configRestrictions` char(1) NOT NULL DEFAULT '',
  `configCondition` tinyint(1) NOT NULL DEFAULT 0,
  `memberRestrictions` varchar(32) NOT NULL DEFAULT '',
  `memberCondition` tinyint(1) NOT NULL DEFAULT 0,
  `productRestrictions` varchar(32) NOT NULL DEFAULT '',
  `productCondition` tinyint(1) NOT NULL DEFAULT 0,
  `attributeName` varchar(32) NOT NULL DEFAULT '',
  `attributeCondition` varchar(8) NOT NULL DEFAULT '',
  `attributeValue` varchar(255) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT '',
  `groupOnly` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_rule_restriction`
--

CREATE TABLE `tl_iso_rule_restriction` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_rule_usage`
--

CREATE TABLE `tl_iso_rule_usage` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `config_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_shipping`
--

CREATE TABLE `tl_iso_shipping` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `inherit` char(1) NOT NULL DEFAULT '',
  `note` text DEFAULT NULL,
  `countries` blob DEFAULT NULL,
  `subdivisions` longblob DEFAULT NULL,
  `postalCodes` text DEFAULT NULL,
  `minimum_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `maximum_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `minimum_weight` varchar(255) NOT NULL DEFAULT '',
  `maximum_weight` varchar(255) NOT NULL DEFAULT '',
  `quantity_mode` varchar(32) NOT NULL DEFAULT '',
  `minimum_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maximum_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_types` blob DEFAULT NULL,
  `product_types_condition` varchar(16) NOT NULL DEFAULT '',
  `config_ids` blob DEFAULT NULL,
  `address_type` varchar(8) NOT NULL DEFAULT '',
  `price` varchar(16) DEFAULT NULL,
  `tax_class` int(11) NOT NULL DEFAULT 0,
  `flatCalculation` varchar(10) NOT NULL DEFAULT '',
  `flatWeight` varchar(255) NOT NULL DEFAULT '',
  `shipping_weight` varchar(255) NOT NULL DEFAULT '',
  `productCalculation` varchar(16) NOT NULL DEFAULT '',
  `group_methods` blob DEFAULT NULL,
  `group_calculation` varchar(10) NOT NULL DEFAULT '',
  `dhl_user` varchar(16) DEFAULT NULL,
  `dhl_signature` varchar(32) DEFAULT NULL,
  `dhl_epk` varchar(32) DEFAULT NULL,
  `dhl_product` varchar(8) DEFAULT NULL,
  `dhl_app` varchar(32) DEFAULT NULL,
  `dhl_token` varchar(32) DEFAULT NULL,
  `dhl_shipping` varchar(64) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `debug` char(1) NOT NULL DEFAULT '',
  `logging` char(1) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_shipping`
--

INSERT INTO `tl_iso_shipping` (`id`, `tstamp`, `name`, `label`, `type`, `inherit`, `note`, `countries`, `subdivisions`, `postalCodes`, `minimum_total`, `maximum_total`, `minimum_weight`, `maximum_weight`, `quantity_mode`, `minimum_quantity`, `maximum_quantity`, `product_types`, `product_types_condition`, `config_ids`, `address_type`, `price`, `tax_class`, `flatCalculation`, `flatWeight`, `shipping_weight`, `productCalculation`, `group_methods`, `group_calculation`, `dhl_user`, `dhl_signature`, `dhl_epk`, `dhl_product`, `dhl_app`, `dhl_token`, `dhl_shipping`, `guests`, `protected`, `groups`, `debug`, `logging`, `enabled`) VALUES
(9, 1671025017, 'DHL 0-50', 'Versand per DHL', 'flat', '', NULL, 0x613a313a7b693a303b733a323a226465223b7d, NULL, NULL, '0.00', '50.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_items', 0, 0, NULL, 'onlyAvailable', NULL, '', '4.9', 0, '', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', '', 0x613a333a7b693a303b733a323a223130223b693a313b733a323a223131223b693a323b733a323a223132223b7d, 'summarize', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', ''),
(10, 1671025020, 'Versand schwerer Güter', 'Versand schwerer Güter', 'flat', '', NULL, 0x613a313a7b693a303b733a323a226465223b7d, NULL, NULL, '0.00', '0.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_items', 0, 0, NULL, 'onlyAvailable', NULL, '', '10', 0, 'perWeight', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:1:\"5\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', 'highestItem', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', ''),
(11, 1671022937, 'Versandgruppierung', 'Versandgruppe', 'group', '', NULL, 0x613a313a7b693a303b733a323a226465223b7d, NULL, NULL, '0.00', '0.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_products', 0, 0, NULL, 'onlyAvailable', NULL, '', '10', 0, 'perWeight', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', '', 0x613a353a7b693a303b733a313a2239223b693a313b733a323a223130223b693a323b733a323a223132223b693a333b733a323a223133223b693a343b733a323a223134223b7d, 'highest', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', ''),
(12, 1688761015, 'Abholung', 'Abholung', 'flat', '', '<p>Diese Artikel werden nicht versendet. Bitte holen Sie die Ware bei mir ab.</p>', NULL, NULL, NULL, '0.00', '0.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_products', 0, 0, NULL, 'onlyAvailable', NULL, '', '0', 0, '', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', '1'),
(13, 1671025019, 'DHL 51-100', 'Versand per DHL', 'flat', '', NULL, 0x613a313a7b693a303b733a323a226465223b7d, NULL, NULL, '50.01', '100.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_items', 0, 0, NULL, 'onlyAvailable', NULL, '', '6.9', 0, '', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', '', 0x613a333a7b693a303b733a323a223130223b693a313b733a323a223131223b693a323b733a323a223132223b7d, 'summarize', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', ''),
(14, 1671025018, 'DHL 101 -', 'Versand per DHL, kostenfrei', 'flat', '', NULL, 0x613a313a7b693a303b733a323a226465223b7d, NULL, NULL, '100.01', '0.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_items', 0, 0, NULL, 'onlyAvailable', NULL, '', NULL, 0, '', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', '', 0x613a333a7b693a303b733a323a223130223b693a313b733a323a223131223b693a323b733a323a223132223b7d, 'summarize', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', ''),
(15, 1671025281, 'DHL Paket 2 kg', 'Versand per DHL Paket', 'flat', '', '<p><span style=\"color: #323232; font-family: Delivery, Verdana, sans-serif; font-size: 16px; background-color: #ffffff;\">bis 60 x 30 x 15 cm</span></p>', 0x613a313a7b693a303b733a323a226465223b7d, NULL, NULL, '0.00', '0.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:1:\"2\";}', 'cart_items', 0, 0, NULL, 'calculation', NULL, '', '5.49', 0, '', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', 'highestItem', 0x613a333a7b693a303b733a323a223130223b693a313b733a323a223131223b693a323b733a323a223132223b7d, 'summarize', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', ''),
(16, 1671051847, 'Individuell beim Produkt festgelegt', 'Zustellung', 'product_price', '', NULL, 0x613a313a7b693a303b733a323a226465223b7d, NULL, NULL, '0.00', '0.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_products', 0, 0, NULL, 'calculation', NULL, '', '5.49', 0, '', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', 'sumProducts', 0x613a333a7b693a303b733a323a223130223b693a313b733a323a223131223b693a323b733a323a223132223b7d, 'summarize', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_tax_class`
--

CREATE TABLE `tl_iso_tax_class` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `includes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `label` varchar(255) NOT NULL DEFAULT '',
  `rates` blob DEFAULT NULL,
  `applyRoundingIncrement` char(1) NOT NULL DEFAULT '',
  `notNegative` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_tax_class`
--

INSERT INTO `tl_iso_tax_class` (`id`, `tstamp`, `name`, `fallback`, `includes`, `label`, `rates`, `applyRoundingIncrement`, `notNegative`) VALUES
(1, 1669574394, 'Steuer für Kunstgegenstände, im Preis enthalten', '', 1, 'im Preis enthaltene MwSt.', NULL, '', ''),
(2, 1669574453, 'Steuer für Kunstgegenstände, NICHT im Preis enthalten', '', 1, 'zuzüglich MwSt.', 0x613a313a7b693a303b733a313a2231223b7d, '', ''),
(3, 1670254586, 'Umsatzsteuerfrei wegen Kleinunternehmerregelung', '1', 0, 'steuerfrei &#40;Kleinunternehmeregelung&#41;', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_iso_tax_rate`
--

CREATE TABLE `tl_iso_tax_rate` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `address` blob DEFAULT NULL,
  `countries` text DEFAULT NULL,
  `subdivisions` text DEFAULT NULL,
  `postalCodes` text DEFAULT NULL,
  `rate` varchar(255) NOT NULL DEFAULT '',
  `amount` varchar(255) NOT NULL DEFAULT '',
  `config` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `exemptOnValidVAT` char(1) NOT NULL DEFAULT '',
  `stop` char(1) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_tax_rate`
--

INSERT INTO `tl_iso_tax_rate` (`id`, `tstamp`, `name`, `label`, `address`, `countries`, `subdivisions`, `postalCodes`, `rate`, `amount`, `config`, `exemptOnValidVAT`, `stop`, `guests`, `protected`, `groups`) VALUES
(1, 1669574180, 'MwSt-7%', 'Mehrwertsteuersatz 7% für Kunstgegenstände', 0x613a313a7b693a303b733a383a227368697070696e67223b7d, NULL, NULL, NULL, 'a:2:{s:4:\"unit\";s:1:\"%\";s:5:\"value\";s:1:\"7\";}', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 1, '1', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_layout`
--

CREATE TABLE `tl_layout` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rows` varchar(8) NOT NULL DEFAULT '2rwh',
  `headerHeight` varchar(255) NOT NULL DEFAULT '',
  `footerHeight` varchar(255) NOT NULL DEFAULT '',
  `cols` varchar(8) NOT NULL DEFAULT '2cll',
  `widthLeft` varchar(255) NOT NULL DEFAULT '',
  `widthRight` varchar(255) NOT NULL DEFAULT '',
  `sections` blob DEFAULT NULL,
  `framework` varchar(255) NOT NULL DEFAULT 'a:2:{i:0;s:10:"layout.css";i:1;s:14:"responsive.css";}',
  `stylesheet` blob DEFAULT NULL,
  `external` blob DEFAULT NULL,
  `loadingOrder` varchar(16) NOT NULL DEFAULT 'external_first',
  `combineScripts` char(1) NOT NULL DEFAULT '1',
  `modules` blob DEFAULT NULL,
  `template` varchar(64) NOT NULL DEFAULT '',
  `minifyMarkup` char(1) NOT NULL DEFAULT '1',
  `lightboxSize` varchar(255) NOT NULL DEFAULT '',
  `defaultImageDensities` varchar(255) NOT NULL DEFAULT '',
  `viewport` varchar(255) NOT NULL DEFAULT '',
  `titleTag` varchar(255) NOT NULL DEFAULT '',
  `cssClass` varchar(255) NOT NULL DEFAULT '',
  `onload` varchar(255) NOT NULL DEFAULT '',
  `head` text DEFAULT NULL,
  `addJQuery` char(1) NOT NULL DEFAULT '',
  `jquery` text DEFAULT NULL,
  `addMooTools` char(1) NOT NULL DEFAULT '',
  `mootools` text DEFAULT NULL,
  `analytics` text DEFAULT NULL,
  `externalJs` blob DEFAULT NULL,
  `scripts` text DEFAULT NULL,
  `script` text DEFAULT NULL,
  `static` char(1) NOT NULL DEFAULT '',
  `width` varchar(255) NOT NULL DEFAULT '',
  `align` varchar(32) NOT NULL DEFAULT 'center',
  `newsfeeds` blob DEFAULT NULL,
  `calendarfeeds` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_layout`
--

INSERT INTO `tl_layout` (`id`, `pid`, `tstamp`, `name`, `rows`, `headerHeight`, `footerHeight`, `cols`, `widthLeft`, `widthRight`, `sections`, `framework`, `stylesheet`, `external`, `loadingOrder`, `combineScripts`, `modules`, `template`, `minifyMarkup`, `lightboxSize`, `defaultImageDensities`, `viewport`, `titleTag`, `cssClass`, `onload`, `head`, `addJQuery`, `jquery`, `addMooTools`, `mootools`, `analytics`, `externalJs`, `scripts`, `script`, `static`, `width`, `align`, `newsfeeds`, `calendarfeeds`) VALUES
(1, 1, 1681736402, 'base', '3rw', 'a:2:{s:4:\"unit\";s:0:\"\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1cl', 'a:2:{s:4:\"unit\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '', 0x613a313a7b693a303b613a343a7b733a353a227469746c65223b733a303a22223b733a323a226964223b733a303a22223b733a383a2274656d706c617465223b733a31333a22626c6f636b5f73656374696f6e223b733a383a22706f736974696f6e223b733a333a22746f70223b7d7d, '', NULL, 0x613a343a7b693a303b733a31363a226b6c4e73cd8c11edb7420242ac10ee0c223b693a313b733a31363a22a43e25e063a111edb8900242ac10ee0c223b693a323b733a31363a22a44a013363a111edb8900242ac10ee0c223b693a333b733a31363a22a42c9b0663a111edb8900242ac10ee0c223b7d, 'external_first', '1', 0x613a31363a7b693a303b613a333a7b733a333a226d6f64223b733a313a2231223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a313b613a333a7b733a333a226d6f64223b733a313a2238223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a323b613a333a7b733a333a226d6f64223b733a313a2232223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a333b613a333a7b733a333a226d6f64223b733a323a223232223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a343b613a333a7b733a333a226d6f64223b733a323a223231223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a353b613a333a7b733a333a226d6f64223b733a313a2239223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a363b613a333a7b733a333a226d6f64223b733a323a223337223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a373b613a333a7b733a333a226d6f64223b733a313a2230223b733a333a22636f6c223b733a343a226d61696e223b733a363a22656e61626c65223b733a313a2231223b7d693a383b613a333a7b733a333a226d6f64223b733a313a2233223b733a333a22636f6c223b733a343a226d61696e223b733a363a22656e61626c65223b733a313a2231223b7d693a393b613a333a7b733a333a226d6f64223b733a323a223432223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31303b613a333a7b733a333a226d6f64223b733a323a223433223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31313b613a333a7b733a333a226d6f64223b733a313a2236223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31323b613a333a7b733a333a226d6f64223b733a313a2231223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31333b613a333a7b733a333a226d6f64223b733a313a2237223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31343b613a333a7b733a333a226d6f64223b733a323a223530223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31353b613a333a7b733a333a226d6f64223b733a323a223533223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d7d, 'fe_page', '1', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', 'width=device-width, initial-scale=1.0', '', '', '', '<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"/apple-touch-icon.png\">\n<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"/favicon-32x32.png\">\n<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"/favicon-16x16.png\">\n<link rel=\"manifest\" href=\"/site.webmanifest\">\n<link rel=\"mask-icon\" href=\"/safari-pinned-tab.svg\" color=\"#176977\">\n<meta name=\"msapplication-TileColor\" content=\"#176977\">\n<meta name=\"theme-color\" content=\"#176977\">', '1', 'a:1:{i:0;s:10:\"j_colorbox\";}', '', NULL, NULL, 0x613a323a7b693a303b733a31363a2295215647642e11edb6390242ac10ee0c223b693a313b733a31363a226e889b7d690811edaa380242ac10ee0c223b7d, 'a:1:{i:0;s:9:\"js_slider\";}', NULL, '', '', 'center', NULL, NULL),
(2, 1, 1681736417, 'base-gallery', '3rw', 'a:2:{s:4:\"unit\";s:0:\"\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '1cl', 'a:2:{s:4:\"unit\";s:0:\"\";s:5:\"value\";s:0:\"\";}', '', 0x613a313a7b693a303b613a343a7b733a353a227469746c65223b733a303a22223b733a323a226964223b733a303a22223b733a383a2274656d706c617465223b733a31333a22626c6f636b5f73656374696f6e223b733a383a22706f736974696f6e223b733a333a22746f70223b7d7d, '', NULL, 0x613a343a7b693a303b733a31363a226b6c4e73cd8c11edb7420242ac10ee0c223b693a313b733a31363a22a43e25e063a111edb8900242ac10ee0c223b693a323b733a31363a22a44a013363a111edb8900242ac10ee0c223b693a333b733a31363a22a42c9b0663a111edb8900242ac10ee0c223b7d, 'external_first', '1', 0x613a31373a7b693a303b613a333a7b733a333a226d6f64223b733a313a2231223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a313b613a333a7b733a333a226d6f64223b733a313a2238223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a323b613a333a7b733a333a226d6f64223b733a313a2232223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a333b613a333a7b733a333a226d6f64223b733a323a223232223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a343b613a333a7b733a333a226d6f64223b733a323a223231223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a353b613a333a7b733a333a226d6f64223b733a313a2239223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a363b613a333a7b733a333a226d6f64223b733a323a223337223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a373b613a333a7b733a333a226d6f64223b733a313a2230223b733a333a22636f6c223b733a343a226d61696e223b733a363a22656e61626c65223b733a313a2231223b7d693a383b613a333a7b733a333a226d6f64223b733a313a2233223b733a333a22636f6c223b733a343a226d61696e223b733a363a22656e61626c65223b733a313a2231223b7d693a393b613a333a7b733a333a226d6f64223b733a323a223432223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31303b613a333a7b733a333a226d6f64223b733a323a223433223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31313b613a333a7b733a333a226d6f64223b733a313a2236223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31323b613a333a7b733a333a226d6f64223b733a313a2231223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31333b613a333a7b733a333a226d6f64223b733a313a2237223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31343b613a333a7b733a333a226d6f64223b733a323a223530223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31353b613a333a7b733a333a226d6f64223b733a313a2234223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31363b613a333a7b733a333a226d6f64223b733a323a223533223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d7d, 'fe_page', '1', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', 'width=device-width, initial-scale=1.0', '', '', '', '<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"/apple-touch-icon.png\">\n<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"/favicon-32x32.png\">\n<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"/favicon-16x16.png\">\n<link rel=\"manifest\" href=\"/site.webmanifest\">\n<link rel=\"mask-icon\" href=\"/safari-pinned-tab.svg\" color=\"#176977\">\n<meta name=\"msapplication-TileColor\" content=\"#176977\">\n<meta name=\"theme-color\" content=\"#176977\">', '1', 'a:1:{i:0;s:10:\"j_colorbox\";}', '', NULL, NULL, 0x613a333a7b693a303b733a31363a2295215647642e11edb6390242ac10ee0c223b693a313b733a31363a226e889b7d690811edaa380242ac10ee0c223b693a323b733a31363a22ddf603a19a8811ed86a70242ac10ee0c223b7d, 'a:1:{i:0;s:9:\"js_slider\";}', NULL, '', '', 'center', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_link_category`
--

CREATE TABLE `tl_link_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `published` char(1) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_publik` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `image` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_link_data`
--

CREATE TABLE `tl_link_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `published` char(1) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `target` char(1) NOT NULL DEFAULT '',
  `url_text` varchar(255) NOT NULL DEFAULT '',
  `url_title` varchar(255) NOT NULL DEFAULT '',
  `url_protocol` varchar(128) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `be_error` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `be_warning` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `be_text` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_log`
--

CREATE TABLE `tl_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `source` varchar(32) NOT NULL DEFAULT '',
  `action` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `func` varchar(255) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_log`
--

INSERT INTO `tl_log` (`id`, `tstamp`, `source`, `action`, `username`, `text`, `func`, `browser`) VALUES
(391, 1691179775, 'FE', 'CRON', 'test', 'Purged the temp folder', 'Contao\\Automator::purgeTempFolder', 'N/A'),
(392, 1691179775, 'FE', 'CRON', 'test', 'Purged the expired double opt-in tokens', 'Contao\\Automator::purgeOptInTokens', 'N/A'),
(393, 1691179781, 'BE', 'GENERAL', 'test', 'A new entry &quot;tl_iso_orderstatus.id=15&quot; has been created', 'Contao\\DC_Table::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(394, 1691179793, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_iso_orderstatus.id=15&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(395, 1691182018, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_nc_notification.id=17&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(396, 1691182029, 'BE', 'GENERAL', 'test', 'A new entry &quot;tl_nc_message.id=15&quot; has been created (parent records: tl_nc_notification.id=17)', 'Contao\\DC_Table::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(397, 1691182032, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_nc_message.id=15&quot; has been created (parent records: tl_nc_notification.id=17)', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(398, 1691182041, 'BE', 'GENERAL', 'test', 'A new entry &quot;tl_nc_language.id=27&quot; has been created (parent records: tl_nc_message.id=15, tl_nc_notification.id=17)', 'Contao\\DC_Table::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(399, 1691182090, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_nc_language.id=27&quot; has been created (parent records: tl_nc_message.id=15, tl_nc_notification.id=17)', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(400, 1691182094, 'BE', 'GENERAL', 'test', 'A new entry &quot;tl_nc_language.id=28&quot; has been created by duplicating record &quot;tl_nc_language.id=27&quot; (parent records: tl_nc_message.id=15, tl_nc_notification.id=17)', 'Contao\\DC_Table::copy', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(401, 1691182126, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_nc_language.id=28&quot; has been created (parent records: tl_nc_message.id=15, tl_nc_notification.id=17)', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(402, 1691182431, 'BE', 'GENERAL', 'test', 'Version 2 of record &quot;tl_nc_message.id=15&quot; has been created (parent records: tl_nc_notification.id=17)', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(403, 1691182431, 'BE', 'GENERAL', 'test', 'A new version of record &quot;tl_nc_message.id=15&quot; has been created', 'NotificationCenter\\tl_nc_message::toggleVisibility', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(404, 1691183016, 'BE', 'GENERAL', 'test', 'Version 2 of record &quot;tl_iso_orderstatus.id=15&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(405, 1691331604, 'BE', 'GENERAL', 'test', 'A new entry &quot;tl_iso_address.id=2&quot; has been created (parent records: tl_member.id=5)', 'Contao\\DC_Table::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(406, 1691331604, 'FE', 'CRON', 'test', 'Purged the temp folder', 'Contao\\Automator::purgeTempFolder', 'N/A'),
(407, 1691331604, 'FE', 'CRON', 'test', 'Purged the expired double opt-in tokens', 'Contao\\Automator::purgeOptInTokens', 'N/A'),
(408, 1691357604, 'BE', 'ACCESS', 'test', 'User &quot;test&quot; has logged in', 'Contao\\CoreBundle\\Security\\Authentication\\AuthenticationSuccessHandler::onAuthenticationSuccess', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(409, 1691357638, 'BE', 'GENERAL', 'test', 'A new entry &quot;tl_iso_product.id=101&quot; has been created', 'Contao\\DC_Table::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'),
(410, 1691357685, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_iso_product.id=101&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `tl_member`
--

CREATE TABLE `tl_member` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `dateOfBirth` varchar(11) NOT NULL DEFAULT '',
  `gender` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `postal` varchar(32) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(64) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `mobile` varchar(64) NOT NULL DEFAULT '',
  `fax` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(64) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `login` char(1) NOT NULL DEFAULT '',
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `assignDir` char(1) NOT NULL DEFAULT '',
  `homeDir` binary(16) DEFAULT NULL,
  `disable` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `dateAdded` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastLogin` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currentLogin` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `loginAttempts` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `locked` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `session` blob DEFAULT NULL,
  `secret` binary(128) DEFAULT NULL,
  `useTwoFactor` char(1) NOT NULL DEFAULT '',
  `backupCodes` text DEFAULT NULL,
  `trustedTokenVersion` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `newsletter` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_member`
--

INSERT INTO `tl_member` (`id`, `tstamp`, `firstname`, `lastname`, `dateOfBirth`, `gender`, `company`, `street`, `postal`, `city`, `state`, `country`, `phone`, `mobile`, `fax`, `email`, `website`, `language`, `groups`, `login`, `username`, `password`, `assignDir`, `homeDir`, `disable`, `start`, `stop`, `dateAdded`, `lastLogin`, `currentLogin`, `loginAttempts`, `locked`, `session`, `secret`, `useTwoFactor`, `backupCodes`, `trustedTokenVersion`, `newsletter`) VALUES
(5, 1689969462, 'Test', 'Tester', '', '', '', 'Am kleinen Wege 1', '10000', 'Berlin', '', 'de', '', '', '', 'test@test.de', '', '', 0x613a313a7b693a303b733a313a2231223b7d, '1', 'test@test.de', '$2y$13$7hYr0.sn3vd/6K9hdMXdbuWluowLpybFoPAfowFvwylTPfr5mYCKK', '', NULL, '', '', '', 1689967889, 0, 1689969473, 0, 0, 0x613a303a7b7d, NULL, '', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_member_group`
--

CREATE TABLE `tl_member_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `redirect` char(1) NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `disable` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `iso_priceDisplay` varchar(8) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_member_group`
--

INSERT INTO `tl_member_group` (`id`, `tstamp`, `name`, `redirect`, `jumpTo`, `disable`, `start`, `stop`, `iso_priceDisplay`) VALUES
(1, 1670100165, 'Kunden', '', 0, '', '', '', 'fixed');

-- --------------------------------------------------------

--
-- Table structure for table `tl_module`
--

CREATE TABLE `tl_module` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `headline` varchar(255) NOT NULL DEFAULT 'a:2:{s:5:"value";s:0:"";s:4:"unit";s:2:"h2";}',
  `type` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'navigation',
  `levelOffset` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `showLevel` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `hardLimit` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `showProtected` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `defineRoot` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `rootPage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `navigationTpl` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `customTpl` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `pages` blob DEFAULT NULL,
  `showHidden` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `customLabel` varchar(64) NOT NULL DEFAULT '',
  `autologin` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `overviewPage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `redirectBack` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `editable` blob DEFAULT NULL,
  `memberTpl` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `form` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `queryType` varchar(8) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'and',
  `fuzzy` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `contextLength` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `minKeywordLength` smallint(5) UNSIGNED NOT NULL DEFAULT 4,
  `perPage` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `searchType` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'simple',
  `searchTpl` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `inColumn` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'main',
  `skipFirst` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `loadFirst` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `imgSize` varchar(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `useCaption` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `fullsize` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `multiSRC` blob DEFAULT NULL,
  `orderSRC` blob DEFAULT NULL,
  `html` text DEFAULT NULL,
  `rss_cache` int(10) UNSIGNED NOT NULL DEFAULT 3600,
  `rss_feed` text DEFAULT NULL,
  `rss_template` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `numberOfItems` smallint(5) UNSIGNED NOT NULL DEFAULT 3,
  `disableCaptcha` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `reg_groups` blob DEFAULT NULL,
  `reg_allowLogin` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `reg_skipName` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `reg_close` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `reg_deleteDir` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `reg_assignDir` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `reg_homeDir` binary(16) DEFAULT NULL,
  `reg_activate` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `reg_jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reg_text` text DEFAULT NULL,
  `reg_password` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `protected` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `guests` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cssID` varchar(255) NOT NULL DEFAULT '',
  `rootPageDependentModules` blob DEFAULT NULL,
  `faq_categories` blob DEFAULT NULL,
  `faq_readerModule` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `com_order` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'ascending',
  `com_moderate` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_bbcode` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_requireLogin` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_disableCaptcha` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `com_template` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `news_archives` blob DEFAULT NULL,
  `news_featured` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'all_items',
  `news_jumpToCurrent` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `news_readerModule` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `news_metaFields` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'a:2:{i:0;s:4:"date";i:1;s:6:"author";}',
  `news_template` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `news_format` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'news_month',
  `news_startDay` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `news_order` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'order_date_desc',
  `news_showQuantity` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `list_table` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `list_fields` tinytext DEFAULT NULL,
  `list_where` tinytext DEFAULT NULL,
  `list_search` tinytext DEFAULT NULL,
  `list_sort` tinytext DEFAULT NULL,
  `list_info` tinytext DEFAULT NULL,
  `list_info_where` tinytext DEFAULT NULL,
  `list_layout` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `list_info_layout` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cal_calendar` blob DEFAULT NULL,
  `cal_noSpan` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cal_hideRunning` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cal_startDay` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `cal_format` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'cal_month',
  `cal_ignoreDynamic` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cal_order` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'ascending',
  `cal_readerModule` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cal_limit` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `cal_template` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cal_ctemplate` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cal_showQuantity` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `cal_featured` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'all_items',
  `newsletters` blob DEFAULT NULL,
  `nl_channels` blob DEFAULT NULL,
  `nl_text` text DEFAULT NULL,
  `nl_hideChannels` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `nl_subscribe` text DEFAULT NULL,
  `nl_unsubscribe` text DEFAULT NULL,
  `nl_template` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `iso_tsproducts` char(1) NOT NULL DEFAULT '',
  `iso_tscheckout` char(1) NOT NULL DEFAULT '',
  `iso_tsyoffset` int(11) NOT NULL DEFAULT 0,
  `iso_tsdirection` varchar(16) NOT NULL DEFAULT '',
  `iso_tsdisplay` varchar(8) NOT NULL DEFAULT '',
  `iso_tsreviews` char(1) NOT NULL DEFAULT '',
  `iso_tsid` varchar(64) NOT NULL DEFAULT '',
  `iso_notifications` varchar(255) NOT NULL DEFAULT '',
  `iso_productcache` blob DEFAULT NULL,
  `iso_addressFields` blob DEFAULT NULL,
  `iso_address` blob DEFAULT NULL,
  `iso_continueShopping` char(1) NOT NULL DEFAULT '',
  `iso_includeMessages` char(1) NOT NULL DEFAULT '',
  `iso_related_categories` blob DEFAULT NULL,
  `iso_buttons` blob DEFAULT NULL,
  `iso_listingSortDirection` varchar(8) NOT NULL DEFAULT '',
  `iso_listingSortField` varchar(255) NOT NULL DEFAULT '',
  `iso_checkout_jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_cart_jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_perPage` varchar(64) NOT NULL DEFAULT '',
  `iso_enableLimit` char(1) NOT NULL DEFAULT '',
  `iso_sortingFields` blob DEFAULT NULL,
  `iso_searchAutocomplete` varchar(255) NOT NULL DEFAULT '',
  `iso_searchExact` blob DEFAULT NULL,
  `iso_searchFields` blob DEFAULT NULL,
  `iso_filterHideSingle` char(1) NOT NULL DEFAULT '',
  `iso_newFilter` varchar(8) NOT NULL DEFAULT '',
  `iso_rangeFields` blob DEFAULT NULL,
  `iso_cumulativeFields` blob DEFAULT NULL,
  `iso_filterFields` blob DEFAULT NULL,
  `iso_filterModules` blob DEFAULT NULL,
  `iso_list_where` varchar(255) NOT NULL DEFAULT '',
  `iso_category_scope` varchar(64) NOT NULL DEFAULT '',
  `iso_noFilter` varchar(255) NOT NULL DEFAULT '',
  `iso_emptyFilter` char(1) NOT NULL DEFAULT '',
  `iso_noProducts` varchar(255) NOT NULL DEFAULT '',
  `iso_emptyMessage` char(1) NOT NULL DEFAULT '',
  `iso_orderCollectionBy` varchar(16) NOT NULL DEFAULT '',
  `iso_addToAddressbook` char(1) NOT NULL DEFAULT '',
  `iso_order_conditions` blob DEFAULT NULL,
  `iso_checkout_skippable` text DEFAULT NULL,
  `iso_forward_review` char(1) NOT NULL DEFAULT '',
  `orderCompleteJumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_shipping_modules` blob DEFAULT NULL,
  `iso_payment_modules` blob DEFAULT NULL,
  `iso_config_ids` blob DEFAULT NULL,
  `iso_config_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_cols` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `iso_wishlistJumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_addProductJumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_loginRequired` char(1) NOT NULL DEFAULT '',
  `iso_login_jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_checkout_method` varchar(10) NOT NULL DEFAULT '',
  `iso_display404Page` char(1) NOT NULL DEFAULT '',
  `iso_use_quantity` char(1) NOT NULL DEFAULT '',
  `iso_disable_options` char(1) NOT NULL DEFAULT '',
  `iso_hide_list` char(1) NOT NULL DEFAULT '',
  `iso_link_primary` char(1) NOT NULL DEFAULT '',
  `iso_jump_first` char(1) NOT NULL DEFAULT '',
  `iso_filterTpl` varchar(64) NOT NULL DEFAULT '',
  `iso_collectionTpl` varchar(64) NOT NULL DEFAULT '',
  `iso_gallery` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_reader_layout` varchar(64) NOT NULL DEFAULT '',
  `iso_list_layout` varchar(64) NOT NULL DEFAULT '',
  `nc_activation_notification` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `nc_notification` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customLanguageText` text DEFAULT NULL,
  `customLanguage` char(1) NOT NULL DEFAULT '',
  `hideNoFallback` char(1) NOT NULL DEFAULT '',
  `hideActiveLanguage` char(1) NOT NULL DEFAULT '',
  `reg_activateLogin` char(1) NOT NULL DEFAULT '',
  `reg_autoActivate` varchar(8) NOT NULL DEFAULT 'disable',
  `sharebuttons_template` varchar(64) NOT NULL DEFAULT '',
  `sharebuttons_theme` varchar(32) NOT NULL DEFAULT '',
  `sharebuttons_networks` blob DEFAULT NULL,
  `delirius_linkliste_imagesize` varchar(64) NOT NULL DEFAULT '',
  `delirius_linkliste_standardfavicon` blob DEFAULT NULL,
  `delirius_linkliste_showimage` char(1) NOT NULL DEFAULT '',
  `delirius_linkliste_template` varchar(64) NOT NULL DEFAULT '',
  `delirius_linkliste_fesort` varchar(32) NOT NULL DEFAULT '',
  `delirius_linkliste_categories` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_module`
--

INSERT INTO `tl_module` (`id`, `pid`, `tstamp`, `name`, `headline`, `type`, `levelOffset`, `showLevel`, `hardLimit`, `showProtected`, `defineRoot`, `rootPage`, `navigationTpl`, `customTpl`, `pages`, `showHidden`, `customLabel`, `autologin`, `jumpTo`, `overviewPage`, `redirectBack`, `editable`, `memberTpl`, `form`, `queryType`, `fuzzy`, `contextLength`, `minKeywordLength`, `perPage`, `searchType`, `searchTpl`, `inColumn`, `skipFirst`, `loadFirst`, `singleSRC`, `url`, `imgSize`, `useCaption`, `fullsize`, `multiSRC`, `orderSRC`, `html`, `rss_cache`, `rss_feed`, `rss_template`, `numberOfItems`, `disableCaptcha`, `reg_groups`, `reg_allowLogin`, `reg_skipName`, `reg_close`, `reg_deleteDir`, `reg_assignDir`, `reg_homeDir`, `reg_activate`, `reg_jumpTo`, `reg_text`, `reg_password`, `data`, `protected`, `groups`, `guests`, `cssID`, `rootPageDependentModules`, `faq_categories`, `faq_readerModule`, `com_order`, `com_moderate`, `com_bbcode`, `com_requireLogin`, `com_disableCaptcha`, `com_template`, `news_archives`, `news_featured`, `news_jumpToCurrent`, `news_readerModule`, `news_metaFields`, `news_template`, `news_format`, `news_startDay`, `news_order`, `news_showQuantity`, `list_table`, `list_fields`, `list_where`, `list_search`, `list_sort`, `list_info`, `list_info_where`, `list_layout`, `list_info_layout`, `cal_calendar`, `cal_noSpan`, `cal_hideRunning`, `cal_startDay`, `cal_format`, `cal_ignoreDynamic`, `cal_order`, `cal_readerModule`, `cal_limit`, `cal_template`, `cal_ctemplate`, `cal_showQuantity`, `cal_featured`, `newsletters`, `nl_channels`, `nl_text`, `nl_hideChannels`, `nl_subscribe`, `nl_unsubscribe`, `nl_template`, `iso_tsproducts`, `iso_tscheckout`, `iso_tsyoffset`, `iso_tsdirection`, `iso_tsdisplay`, `iso_tsreviews`, `iso_tsid`, `iso_notifications`, `iso_productcache`, `iso_addressFields`, `iso_address`, `iso_continueShopping`, `iso_includeMessages`, `iso_related_categories`, `iso_buttons`, `iso_listingSortDirection`, `iso_listingSortField`, `iso_checkout_jumpTo`, `iso_cart_jumpTo`, `iso_perPage`, `iso_enableLimit`, `iso_sortingFields`, `iso_searchAutocomplete`, `iso_searchExact`, `iso_searchFields`, `iso_filterHideSingle`, `iso_newFilter`, `iso_rangeFields`, `iso_cumulativeFields`, `iso_filterFields`, `iso_filterModules`, `iso_list_where`, `iso_category_scope`, `iso_noFilter`, `iso_emptyFilter`, `iso_noProducts`, `iso_emptyMessage`, `iso_orderCollectionBy`, `iso_addToAddressbook`, `iso_order_conditions`, `iso_checkout_skippable`, `iso_forward_review`, `orderCompleteJumpTo`, `iso_shipping_modules`, `iso_payment_modules`, `iso_config_ids`, `iso_config_id`, `iso_cols`, `iso_wishlistJumpTo`, `iso_addProductJumpTo`, `iso_loginRequired`, `iso_login_jumpTo`, `iso_checkout_method`, `iso_display404Page`, `iso_use_quantity`, `iso_disable_options`, `iso_hide_list`, `iso_link_primary`, `iso_jump_first`, `iso_filterTpl`, `iso_collectionTpl`, `iso_gallery`, `iso_reader_layout`, `iso_list_layout`, `nc_activation_notification`, `nc_notification`, `customLanguageText`, `customLanguage`, `hideNoFallback`, `hideActiveLanguage`, `reg_activateLogin`, `reg_autoActivate`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`, `delirius_linkliste_imagesize`, `delirius_linkliste_standardfavicon`, `delirius_linkliste_showimage`, `delirius_linkliste_template`, `delirius_linkliste_fesort`, `delirius_linkliste_categories`) VALUES
(1, 1, 1668971050, 'HTML logo', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"logo\">\n  <a href=\"\" title=\"Clever Quiroz - Künstler\">\n      <img src=\"files/themes/images/logoCQ.svg\" width=\"150px\" alt=\"Clever Quiroz - Künstler - Logo\" itemprop=\"image\">\n  </a>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(2, 1, 1668430616, 'HTML nav -toggler', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"nav-toggler\"> <button class=\"nav-toggler__button\"></button></div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(3, 1, 1668430655, 'HTML TopLink', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<!-- indexer::stop -->\n<div class=\"toplink\">\n    <a href=\"{{env::request|urlattr}}#top\"> </a>\n</div>\n<!-- indexer::continue -->', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(4, 1, 1679428151, 'HTML webdesign', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"webdesign\">\n  <div class=\"company\"><a href=\"http://www.nachhaltig-im-web.de\" title=\"nachhaltig im web\">\n  	 <img src=\"files/themes/images/nch_logo.svg\" width=\"50px\" alt=\"nachhaltig im web\" itemprop=\"image\"><span>\n    Webdesign by nachhaltig im web</span>\n    </a>\n  </div>\n  <div class=\"cms\">\n  	<a href=\"http://www.contao.org\" title=\"Contao Open Source CMS\">\n      <img src=\"files/themes/images/support-contao-symbol-color.svg\" width=\"50px\" alt=\"Contao unterstützen\" itemprop=\"image\">\n      <span>Powered by Contao</span>\n  </a>\n  	  </div>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(6, 1, 1679677061, 'Navigation Individuell', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'customnav', 0, 0, '', '', '', 0, '', '', 0x613a333a7b693a303b693a323b693a313b693a333b693a323b693a35343b7d, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:9:\"mainPages\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(7, 1, 1679677110, 'Navigation individuell Info', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'customnav', 0, 0, '', '', '', 0, '', '', 0x613a333a7b693a303b693a31303b693a313b693a31323b693a323b693a31333b7d, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"info\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(8, 1, 1671566283, 'Navigation NavMenu', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'navigation', 0, 2, '', '', '', 0, 'nav_default', 'mod_navigation_noscript', 0x613a313a7b693a303b693a323b7d, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(9, 1, 1679949402, 'Tools - Suchmaschine', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'search', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 14, 0, '', NULL, '', 0, 'and', '1', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 3, 0, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(11, 1, 1679851830, 'Shop - Produktdetails', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productreader', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 6, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 3, 0, 8, '', 0, 'member', '', '1', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, 'iso_reader_enhanced', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(12, 1, 1672871994, 'Shop - Warenkorb &#40;für angemeldete Kunden - weiter zur Kasse&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_cart', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 18, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', 'Ihr Warenkorb ist &#40;noch&#41; leer.', '1', 'desc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(13, 1, 1671826442, 'Shop - Kasse', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_checkout', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '3', NULL, NULL, NULL, '1', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 18, 8, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', 'nix drin', '1', 'desc_id', '1', 0x613a313a7b693a303b613a353a7b733a343a22666f726d223b733a313a2232223b733a343a2273746570223b733a33303a2249736f746f70655c436865636b6f7574537465705c4f72646572496e666f223b733a383a22706f736974696f6e223b733a353a226166746572223b733a31333a2270726f647563745f7479706573223b613a323a7b693a303b733a313a2236223b693a313b733a313a2237223b7d733a32333a2270726f647563745f74797065735f636f6e646974696f6e223b733a31333a226f6e6c79417661696c61626c65223b7d7d, 'a:3:{i:0;s:15:\"billing_address\";i:1;s:14:\"payment_method\";i:2;s:15:\"shipping_method\";}', '1', 19, 0x613a323a7b693a303b733a323a223132223b693a313b733a323a223136223b7d, 0x613a343a7b693a303b733a313a2232223b693a313b733a313a2234223b693a323b733a313a2233223b693a333b733a313a2235223b7d, NULL, 0, 1, 0, 0, '', 0, 'both', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(14, 1, 1672871397, 'Shop - Bestellungsdetails', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_orderdetails', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 8, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '1', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(15, 1, 1671663567, 'Benutzer - Registrierung', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'registration', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 35, 0, '', 0x613a31313a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a373a22636f6d70616e79223b693a333b733a363a22737472656574223b693a343b733a363a22706f7374616c223b693a353b733a343a2263697479223b693a363b733a373a22636f756e747279223b693a373b733a353a2270686f6e65223b693a383b733a353a22656d61696c223b693a393b733a31303a226e6577736c6574746572223b693a31303b733a383a2270617373776f7264223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', 0x613a313a7b693a303b733a313a2231223b7d, '1', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 4, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(16, 1, 1670103552, 'Benutzer - Personendaten', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'personalData', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 28, 0, '', 0x613a31333a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a31313a22646174654f664269727468223b693a333b733a373a22636f6d70616e79223b693a343b733a363a22737472656574223b693a353b733a363a22706f7374616c223b693a363b733a343a2263697479223b693a373b733a373a22636f756e747279223b693a383b733a353a2270686f6e65223b693a393b733a353a22656d61696c223b693a31303b733a373a2277656273697465223b693a31313b733a383a226c616e6775616765223b693a31323b733a31303a226e6577736c6574746572223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 8, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(17, 1, 1670103680, 'Shop - Berstellhistorie', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_orderhistory', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 23, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(18, 1, 1670103970, 'Benutzer - Konto schließen', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'closeAccount', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 29, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', 'close_deactivate', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(19, 1, 1671822237, 'Benutzer - Passwort vergessen', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'lostPasswordNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 36, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '1', '', '', '', NULL, '', 37, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 6, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(20, 1, 1671665417, 'Benutzer - Logout', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'logout', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 2, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(21, 1, 1671557679, 'Tools - Sprachenwechsler', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'changelanguage', 0, 0, '', '', '', 0, 'nav_dropdown', 'mod_changelanguage_noscript', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:8:\"language\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, 'a:2:{i:0;a:2:{s:3:\"key\";s:2:\"de\";s:5:\"value\";s:7:\"Deutsch\";}i:1;a:2:{s:3:\"key\";s:2:\"en\";s:5:\"value\";s:7:\"English\";}}', '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(22, 1, 1668972034, 'HTML nav-language-toggler', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"language\"> <button class=\"nav-language-toggler__button\"></button></div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(26, 1, 1671914681, 'Shop - Adressbuch', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_addressbook', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 23, 0, '', NULL, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(27, 1, 1672858690, 'Benutzer - Anmelden', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'login', 0, 0, '', '', '', 0, '', '', NULL, '', '', '1', 8, 0, '', 0x613a31313a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a373a22636f6d70616e79223b693a333b733a363a22737472656574223b693a343b733a363a22706f7374616c223b693a353b733a343a2263697479223b693a363b733a373a22636f756e747279223b693a373b733a353a2270686f6e65223b693a383b733a353a22656d61696c223b693a393b733a31303a226e6577736c6574746572223b693a31303b733a383a2270617373776f7264223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '1', '', '', '', '', NULL, '', 27, NULL, NULL, NULL, '', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 4, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(29, 1, 1682440769, 'Shop - Produktliste - aktive Kategorie - alle', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productlist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:11:\"productlist\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, NULL, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, 0x613a333a7b693a303b733a323a223332223b693a313b733a323a223334223b693a323b733a323a223430223b7d, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 0, 0, 8, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', 'iso_list_default', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(30, 1, 1672872000, 'Shop - Warenkorb &#40;für Gäste - weiter über Mein Konto zur Kasse&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_cart', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 41, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', 'Ihr Warenkorb ist &#40;noch&#41; leer.', '1', 'desc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(31, 1, 1671914369, 'Benutzer - Rechnungsadresse', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'personalData', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 46, 0, '', 0x613a393a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a373a22636f6d70616e79223b693a333b733a363a22737472656574223b693a343b733a363a22706f7374616c223b693a353b733a343a2263697479223b693a363b733a373a22636f756e747279223b693a373b733a353a2270686f6e65223b693a383b733a353a22656d61696c223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(32, 1, 1688932100, 'Shop - Produktfilter - Limit', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:5:\"limit\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'ASC', 'sku', 0, 0, '10,15', '1', NULL, 'name', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(34, 1, 1682434994, 'Shop - Produktfilter - Search', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '1,3,10,20,30', '', NULL, 'name', 0x613a313a7b693a303b733a333a22736b75223b7d, 0x613a343a7b693a303b733a333a22736b75223b693a313b733a343a226e616d65223b693a323b733a363a22746561736572223b693a333b733a31313a226465736372697074696f6e223b7d, '', 'show_all', NULL, NULL, 0x613a313a7b693a303b733a363a22737461747573223b7d, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(35, 1, 1679338717, 'Shop - Produktfilter Verfügbarkeit', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '1,3,10,20,30', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(37, 1, 1673217315, 'HTML Login Message', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"login\">\n  <p>\n    Sie sind angemeldet, {{user::firstname}}\n  </p>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(40, 1, 1679407848, 'Shop - Produktfilter - Sort', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:7:\"sorting\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '1,2,5,10,15,20,25', '', 0x613a343a7b693a303b733a393a22646174654164646564223b693a313b733a333a22736b75223b693a323b733a343a226e616d65223b693a333b733a353a227072696365223b7d, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(41, 1, 1679075041, 'Shop - Produktfilter', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '2,5,10', '1', 0x613a343a7b693a303b733a393a22646174654164646564223b693a313b733a333a22736b75223b693a323b733a343a226e616d65223b693a333b733a353a227072696365223b7d, 'name', NULL, 0x613a343a7b693a303b733a333a22736b75223b693a313b733a343a226e616d65223b693a323b733a363a22746561736572223b693a333b733a31313a226465736372697074696f6e223b7d, '', 'show_all', NULL, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(42, 1, 1681681725, 'Newsletter - Abonnieren', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newsletterSubscribeNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 50, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, '1', 'Sie haben folgende Verteiler auf ##domain## abonniert:\n\n##channels##\n\nBitte klicken Sie hier, um Ihr Abonnement zu aktivieren:\n\n##link##\n\nDer Bestätigungslink ist 24 Stunden gültig. Sie können Ihr Abonnement jederzeit beenden.\n\nFalls Sie die Verteiler nicht selbst abonniert haben, ignorieren Sie diese E-Mail bitte.', NULL, 'nl_default', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 14, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(43, 1, 1681735807, 'Newsletter - Aktivieren', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newsletterActivateNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 51, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, '1', NULL, NULL, 'nl_default', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 15, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL);
INSERT INTO `tl_module` (`id`, `pid`, `tstamp`, `name`, `headline`, `type`, `levelOffset`, `showLevel`, `hardLimit`, `showProtected`, `defineRoot`, `rootPage`, `navigationTpl`, `customTpl`, `pages`, `showHidden`, `customLabel`, `autologin`, `jumpTo`, `overviewPage`, `redirectBack`, `editable`, `memberTpl`, `form`, `queryType`, `fuzzy`, `contextLength`, `minKeywordLength`, `perPage`, `searchType`, `searchTpl`, `inColumn`, `skipFirst`, `loadFirst`, `singleSRC`, `url`, `imgSize`, `useCaption`, `fullsize`, `multiSRC`, `orderSRC`, `html`, `rss_cache`, `rss_feed`, `rss_template`, `numberOfItems`, `disableCaptcha`, `reg_groups`, `reg_allowLogin`, `reg_skipName`, `reg_close`, `reg_deleteDir`, `reg_assignDir`, `reg_homeDir`, `reg_activate`, `reg_jumpTo`, `reg_text`, `reg_password`, `data`, `protected`, `groups`, `guests`, `cssID`, `rootPageDependentModules`, `faq_categories`, `faq_readerModule`, `com_order`, `com_moderate`, `com_bbcode`, `com_requireLogin`, `com_disableCaptcha`, `com_template`, `news_archives`, `news_featured`, `news_jumpToCurrent`, `news_readerModule`, `news_metaFields`, `news_template`, `news_format`, `news_startDay`, `news_order`, `news_showQuantity`, `list_table`, `list_fields`, `list_where`, `list_search`, `list_sort`, `list_info`, `list_info_where`, `list_layout`, `list_info_layout`, `cal_calendar`, `cal_noSpan`, `cal_hideRunning`, `cal_startDay`, `cal_format`, `cal_ignoreDynamic`, `cal_order`, `cal_readerModule`, `cal_limit`, `cal_template`, `cal_ctemplate`, `cal_showQuantity`, `cal_featured`, `newsletters`, `nl_channels`, `nl_text`, `nl_hideChannels`, `nl_subscribe`, `nl_unsubscribe`, `nl_template`, `iso_tsproducts`, `iso_tscheckout`, `iso_tsyoffset`, `iso_tsdirection`, `iso_tsdisplay`, `iso_tsreviews`, `iso_tsid`, `iso_notifications`, `iso_productcache`, `iso_addressFields`, `iso_address`, `iso_continueShopping`, `iso_includeMessages`, `iso_related_categories`, `iso_buttons`, `iso_listingSortDirection`, `iso_listingSortField`, `iso_checkout_jumpTo`, `iso_cart_jumpTo`, `iso_perPage`, `iso_enableLimit`, `iso_sortingFields`, `iso_searchAutocomplete`, `iso_searchExact`, `iso_searchFields`, `iso_filterHideSingle`, `iso_newFilter`, `iso_rangeFields`, `iso_cumulativeFields`, `iso_filterFields`, `iso_filterModules`, `iso_list_where`, `iso_category_scope`, `iso_noFilter`, `iso_emptyFilter`, `iso_noProducts`, `iso_emptyMessage`, `iso_orderCollectionBy`, `iso_addToAddressbook`, `iso_order_conditions`, `iso_checkout_skippable`, `iso_forward_review`, `orderCompleteJumpTo`, `iso_shipping_modules`, `iso_payment_modules`, `iso_config_ids`, `iso_config_id`, `iso_cols`, `iso_wishlistJumpTo`, `iso_addProductJumpTo`, `iso_loginRequired`, `iso_login_jumpTo`, `iso_checkout_method`, `iso_display404Page`, `iso_use_quantity`, `iso_disable_options`, `iso_hide_list`, `iso_link_primary`, `iso_jump_first`, `iso_filterTpl`, `iso_collectionTpl`, `iso_gallery`, `iso_reader_layout`, `iso_list_layout`, `nc_activation_notification`, `nc_notification`, `customLanguageText`, `customLanguage`, `hideNoFallback`, `hideActiveLanguage`, `reg_activateLogin`, `reg_autoActivate`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`, `delirius_linkliste_imagesize`, `delirius_linkliste_standardfavicon`, `delirius_linkliste_showimage`, `delirius_linkliste_template`, `delirius_linkliste_fesort`, `delirius_linkliste_categories`) VALUES
(44, 1, 1679415940, 'Newsletter kündigen', 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:10:\"Newsletter\";}', 'newsletterUnsubscribeNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 53, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, '1', NULL, NULL, 'nl_default', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(46, 1, 1679669719, 'Nachrichten - Leser', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newsreader', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 54, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:8:\"_fitting\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', 'com_default', 0x613a313a7b693a303b733a313a2231223b7d, 'all_items', '', 0, 'a:3:{i:0;s:4:\"date\";i:1;s:6:\"author\";i:2;s:8:\"comments\";}', 'news_full', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(47, 1, 1681389547, 'Nachrichten - Liste &#40;3 latest&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newslist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 3, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:11:\"_newsletter\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', 0x613a313a7b693a303b733a313a2231223b7d, 'all_items', '', 46, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', 'news_latest', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(48, 1, 1679949671, 'Tools - Suchmaschine - Eigene Seite', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'search', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '1', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 3, 0, 'advanced', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(50, 1, 1680088895, 'HTML - Instagram-Link', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"instagram\">\n  <a rel=\"noreferrer\" target=\"_blank\" href=\"https://www.instagram.com/explore/tags/cleverquiroz/\" title=\"Instagram-Link für Clever Quiroz - Künstler\">\n  </a>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(52, 1, 1682434445, 'Shop - Produktliste - aktive Kategorie - alle &#40;sm&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productlist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 1, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:11:\"productlist\";i:1;s:2:\"sm\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, NULL, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, 0x613a323a7b693a303b733a323a223334223b693a313b733a323a223430223b7d, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 0, 0, 8, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', 'iso_list_default', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(53, 1, 1681250314, 'Tools - Besucherzähler', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'visitors', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(54, 1, 1681423034, 'Nachrichten - Liste &#40;rest&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:19:\"Ältere Nachrichten\";}', 'newslist', 0, 0, '', '', '', 0, '', 'mod_newslist_rest', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 3, 'simple', '', 'main', 3, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:11:\"_newsletter\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', 0x613a313a7b693a303b733a313a2231223b7d, 'all_items', '', 46, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', 'news_simple', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(55, 1, 1682280669, 'Linkliste', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'delirius_linkliste', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
(56, 1, 1682440204, 'Shop - Produktvariantenliste - aktive Kategorie - alle &#40;Kopie&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productvariantlist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:11:\"productlist\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, NULL, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, 0x613a333a7b693a303b733a323a223332223b693a313b733a323a223334223b693a323b733a323a223430223b7d, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 0, 0, 8, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', 'iso_list_variants', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `tl_nc_message`
--

CREATE TABLE `tl_nc_message` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `gateway` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gateway_type` varchar(32) NOT NULL DEFAULT '',
  `email_priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email_template` varchar(255) NOT NULL DEFAULT '',
  `postmark_tag` varchar(255) NOT NULL DEFAULT '',
  `postmark_trackOpens` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_nc_message`
--

INSERT INTO `tl_nc_message` (`id`, `pid`, `tstamp`, `title`, `gateway`, `gateway_type`, `email_priority`, `email_template`, `postmark_tag`, `postmark_trackOpens`, `published`) VALUES
(15, 17, 1691182431, '', 1, 'email', 3, 'mail_default', '', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tl_nc_notification`
--

CREATE TABLE `tl_nc_notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(128) NOT NULL DEFAULT '',
  `flatten_delimiter` varchar(255) NOT NULL DEFAULT '',
  `templates` blob DEFAULT NULL,
  `iso_collectionTpl` varchar(64) NOT NULL DEFAULT '',
  `iso_orderCollectionBy` varchar(16) NOT NULL DEFAULT '',
  `iso_gallery` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_document` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_nc_notification`
--

INSERT INTO `tl_nc_notification` (`id`, `tstamp`, `title`, `type`, `flatten_delimiter`, `templates`, `iso_collectionTpl`, `iso_orderCollectionBy`, `iso_gallery`, `iso_document`) VALUES
(17, 1691178439, 'Overbought', 'iso_order_status_change', ',', NULL, 'iso_collection_default', 'asc_id', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tl_nc_queue`
--

CREATE TABLE `tl_nc_queue` (
  `id` int(10) UNSIGNED NOT NULL,
  `sourceQueue` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `targetGateway` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dateAdded` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dateDelay` int(10) UNSIGNED DEFAULT NULL,
  `dateSent` varchar(10) NOT NULL DEFAULT '',
  `error` char(1) NOT NULL DEFAULT '',
  `tokens` blob DEFAULT NULL,
  `language` varchar(5) NOT NULL DEFAULT '',
  `attachments` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_news`
--

CREATE TABLE `tl_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `headline` varchar(255) NOT NULL DEFAULT '',
  `featured` char(1) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `author` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `robots` varchar(32) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `subheadline` varchar(255) NOT NULL DEFAULT '',
  `teaser` text DEFAULT NULL,
  `addImage` char(1) NOT NULL DEFAULT '',
  `overwriteMeta` char(1) NOT NULL DEFAULT '',
  `singleSRC` binary(16) DEFAULT NULL,
  `alt` varchar(255) NOT NULL DEFAULT '',
  `imageTitle` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(64) NOT NULL DEFAULT '',
  `imagemargin` varchar(128) NOT NULL DEFAULT '',
  `imageUrl` varchar(2048) NOT NULL DEFAULT '',
  `fullsize` char(1) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `floating` varchar(12) NOT NULL DEFAULT 'above',
  `addEnclosure` char(1) NOT NULL DEFAULT '',
  `enclosure` blob DEFAULT NULL,
  `source` varchar(12) NOT NULL DEFAULT 'default',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `articleId` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `url` varchar(2048) NOT NULL DEFAULT '',
  `target` char(1) NOT NULL DEFAULT '',
  `cssClass` varchar(255) NOT NULL DEFAULT '',
  `noComments` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `languageMain` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `newsletter` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_newsletter`
--

CREATE TABLE `tl_newsletter` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `content` mediumtext DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `addFile` char(1) NOT NULL DEFAULT '',
  `files` blob DEFAULT NULL,
  `template` varchar(64) NOT NULL DEFAULT '',
  `sendText` char(1) NOT NULL DEFAULT '',
  `externalImages` char(1) NOT NULL DEFAULT '',
  `mailerTransport` varchar(255) NOT NULL DEFAULT '',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `senderName` varchar(128) NOT NULL DEFAULT '',
  `sent` char(1) NOT NULL DEFAULT '',
  `date` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_newsletter_channel`
--

CREATE TABLE `tl_newsletter_channel` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `template` varchar(32) NOT NULL DEFAULT '',
  `mailerTransport` varchar(255) NOT NULL DEFAULT '',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `senderName` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_newsletter_deny_list`
--

CREATE TABLE `tl_newsletter_deny_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_newsletter_recipients`
--

CREATE TABLE `tl_newsletter_recipients` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `active` char(1) NOT NULL DEFAULT '',
  `addedOn` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_news_archive`
--

CREATE TABLE `tl_news_archive` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `allowComments` char(1) NOT NULL DEFAULT '',
  `notify` varchar(16) NOT NULL DEFAULT 'notify_admin',
  `sortOrder` varchar(32) NOT NULL DEFAULT 'ascending',
  `perPage` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `moderate` char(1) NOT NULL DEFAULT '',
  `bbcode` char(1) NOT NULL DEFAULT '',
  `requireLogin` char(1) NOT NULL DEFAULT '',
  `disableCaptcha` char(1) NOT NULL DEFAULT '',
  `master` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sharebuttons_template` varchar(64) NOT NULL DEFAULT '',
  `sharebuttons_theme` varchar(32) NOT NULL DEFAULT '',
  `sharebuttons_networks` blob DEFAULT NULL,
  `nc_notification` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `newsletter_channel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `newsletter` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_news_archive`
--

INSERT INTO `tl_news_archive` (`id`, `tstamp`, `title`, `jumpTo`, `protected`, `groups`, `allowComments`, `notify`, `sortOrder`, `perPage`, `moderate`, `bbcode`, `requireLogin`, `disableCaptcha`, `master`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`, `nc_notification`, `newsletter_channel`, `newsletter`) VALUES
(1, 1680123379, 'Nachrichtenarchiv', 55, '', NULL, '1', 'notify_both', 'ascending', 0, '1', '', '', '', 0, 'sharebuttons_fontawesome', 'fontawesome', 0x613a31303a7b693a303b733a383a2266616365626f6f6b223b693a313b733a373a2274776974746572223b693a323b733a383a226c696e6b6564696e223b693a333b733a343a2278696e67223b693a343b733a343a226d61696c223b693a353b733a363a2274756d626c72223b693a363b733a393a2270696e746572657374223b693a373b733a363a22726564646974223b693a383b733a383a227768617473617070223b693a393b733a353a227072696e74223b7d, 16, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tl_news_feed`
--

CREATE TABLE `tl_news_feed` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(32) NOT NULL DEFAULT '',
  `archives` blob DEFAULT NULL,
  `format` varchar(32) NOT NULL DEFAULT 'rss',
  `source` varchar(32) NOT NULL DEFAULT 'source_teaser',
  `maxItems` smallint(5) UNSIGNED NOT NULL DEFAULT 25,
  `feedBase` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `imgSize` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_opt_in`
--

CREATE TABLE `tl_opt_in` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(24) NOT NULL DEFAULT '',
  `createdOn` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `confirmedOn` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `removeOn` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invalidatedThrough` varchar(24) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `emailSubject` varchar(255) NOT NULL DEFAULT '',
  `emailText` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_opt_in_related`
--

CREATE TABLE `tl_opt_in_related` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `relTable` varchar(64) DEFAULT NULL,
  `relId` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_page`
--

CREATE TABLE `tl_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT 'regular',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `requireItem` char(1) NOT NULL DEFAULT '',
  `routePriority` int(11) NOT NULL DEFAULT 0,
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(64) NOT NULL DEFAULT '',
  `robots` varchar(32) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `redirect` varchar(32) NOT NULL DEFAULT 'permanent',
  `jumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `redirectBack` char(1) NOT NULL DEFAULT '',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `target` char(1) NOT NULL DEFAULT '',
  `dns` varchar(255) NOT NULL DEFAULT '',
  `staticFiles` varchar(255) NOT NULL DEFAULT '',
  `staticPlugins` varchar(255) NOT NULL DEFAULT '',
  `fallback` char(1) NOT NULL DEFAULT '',
  `disableLanguageRedirect` char(1) NOT NULL DEFAULT '',
  `favicon` binary(16) DEFAULT NULL,
  `robotsTxt` text DEFAULT NULL,
  `maintenanceMode` char(1) NOT NULL DEFAULT '',
  `mailerTransport` varchar(255) NOT NULL DEFAULT '',
  `enableCanonical` char(1) NOT NULL DEFAULT '',
  `canonicalLink` varchar(2048) NOT NULL DEFAULT '',
  `canonicalKeepParams` varchar(255) NOT NULL DEFAULT '',
  `adminEmail` varchar(255) NOT NULL DEFAULT '',
  `dateFormat` varchar(32) NOT NULL DEFAULT '',
  `timeFormat` varchar(32) NOT NULL DEFAULT '',
  `datimFormat` varchar(32) NOT NULL DEFAULT '',
  `validAliasCharacters` varchar(255) NOT NULL DEFAULT '',
  `useFolderUrl` char(1) NOT NULL DEFAULT '',
  `urlPrefix` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `urlSuffix` varchar(16) NOT NULL DEFAULT '',
  `useSSL` char(1) NOT NULL DEFAULT '1',
  `autoforward` char(1) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `includeLayout` char(1) NOT NULL DEFAULT '',
  `layout` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `subpageLayout` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `includeCache` char(1) NOT NULL DEFAULT '',
  `cache` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `alwaysLoadFromCache` char(1) NOT NULL DEFAULT '',
  `clientCache` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `includeChmod` char(1) NOT NULL DEFAULT '',
  `cuser` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cgroup` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `chmod` varchar(255) NOT NULL DEFAULT '',
  `noSearch` char(1) NOT NULL DEFAULT '',
  `cssClass` varchar(64) NOT NULL DEFAULT '',
  `sitemap` varchar(32) NOT NULL DEFAULT '',
  `hide` char(1) NOT NULL DEFAULT '',
  `guests` char(1) NOT NULL DEFAULT '',
  `tabindex` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `accesskey` char(1) NOT NULL DEFAULT '',
  `published` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `enforceTwoFactor` char(1) NOT NULL DEFAULT '',
  `twoFactorJumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_readerJumpTo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_readerMode` varchar(8) NOT NULL DEFAULT 'current',
  `iso_store_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_config` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `languageQuery` varchar(255) NOT NULL DEFAULT '',
  `languageRoot` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `languageMain` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `er24ClientId` varchar(64) NOT NULL DEFAULT '',
  `er24Secret` varchar(255) NOT NULL DEFAULT '',
  `er24ApiKey` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_page`
--

INSERT INTO `tl_page` (`id`, `pid`, `sorting`, `tstamp`, `title`, `type`, `alias`, `requireItem`, `routePriority`, `pageTitle`, `language`, `robots`, `description`, `redirect`, `jumpTo`, `redirectBack`, `url`, `target`, `dns`, `staticFiles`, `staticPlugins`, `fallback`, `disableLanguageRedirect`, `favicon`, `robotsTxt`, `maintenanceMode`, `mailerTransport`, `enableCanonical`, `canonicalLink`, `canonicalKeepParams`, `adminEmail`, `dateFormat`, `timeFormat`, `datimFormat`, `validAliasCharacters`, `useFolderUrl`, `urlPrefix`, `urlSuffix`, `useSSL`, `autoforward`, `protected`, `groups`, `includeLayout`, `layout`, `subpageLayout`, `includeCache`, `cache`, `alwaysLoadFromCache`, `clientCache`, `includeChmod`, `cuser`, `cgroup`, `chmod`, `noSearch`, `cssClass`, `sitemap`, `hide`, `guests`, `tabindex`, `accesskey`, `published`, `start`, `stop`, `enforceTwoFactor`, `twoFactorJumpTo`, `iso_readerJumpTo`, `iso_readerMode`, `iso_store_id`, `iso_config`, `languageQuery`, `languageRoot`, `languageMain`, `er24ClientId`, `er24Secret`, `er24ApiKey`) VALUES
(1, 0, 128, 1688846170, 'Clever Quiroz', 'root', 'startpoint', '', 0, 'Clever Quiroz', 'de', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '1', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '1', '', '', '1', '', '', 0x613a313a7b693a303b733a313a2231223b7d, '1', 1, 0, '1', 31536000, '', 900, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', '', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 1, '', 0, 0, '', '', ''),
(2, 1, 128, 1682432105, 'Willkommen', 'regular', 'willkommen', '', 0, 'Meine Kunst', '', 'noindex,nofollow', 'Ich bin freischaffender Künstler mit Herz und Leidenschaft.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'willkommen', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(3, 1, 256, 1682432105, 'Galerie', 'forward', 'galerie', '', 0, 'Meine Kunstwerke', '', 'noindex,nofollow', 'Hier sehen Sie eine Auswahl aus meinem Schaffen.', 'permanent', 32, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '1', 2, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(4, 1, 384, 1682432106, 'Shop', 'forward', 'shop', '', 0, 'Kaufen Sie gerne', '', 'noindex,nofollow', 'Erwerben Sie meine Kunstwerke und bringen Sie Freude in Ihr Zu Hause.', 'permanent', 8, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'shop', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(8, 4, 320, 1682432106, 'Warenkorb', 'regular', 'shop/warenkorb', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'cart', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(18, 4, 336, 1682432106, 'Kasse', 'regular', 'shop/warenkorb/kasse', '', 0, 'Kasse', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'checkout', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(19, 4, 488, 1682432106, 'Bestellung abgeschlossen', 'regular', 'shop/warenkorb/bestellung-abgeschlossen', '', 0, 'Bestellung abgeschlossen', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'order_finished', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(26, 1, 1024, 1682432107, '404 Seite nicht gefunden', 'error_404', '', '', 0, 'Seite nicht gefunden', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '404', '', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(32, 3, 128, 1682432105, 'Bilder', 'regular', 'kunstwerke/bilder', '', 0, 'Meine Bilder', '', 'noindex,nofollow', 'Auf meiner Webseite präsentiere ich faszinierende Kunstwerke, die ich durch Upcycling geschaffen habe.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(33, 3, 256, 1682432105, 'Skulpturen', 'regular', 'kunstwerke/skulpturen', '', 0, 'Meine Skulpturen', '', 'noindex,nofollow', 'Auf meiner Webseite präsentiere ich faszinierende Kunstwerke, die ich durch Upcycling geschaffen habe.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(41, 4, 328, 1682432106, 'Bestellmodus', 'regular', 'shop/warenkorb/bestellmodus', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'order_mode', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(58, 3, 192, 1688851972, 'Karten', 'regular', 'galerie/karten', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(61, 1, 704, 1689969381, 'Anmelden', 'regular', 'anmelden', '', 0, '', '', 'index,follow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 2, 1, 'a:12:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g2\";i:8;s:2:\"g3\";i:9;s:2:\"g4\";i:10;s:2:\"g5\";i:11;s:2:\"g6\";}', '', '', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_preview_link`
--

CREATE TABLE `tl_preview_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `url` varchar(2048) NOT NULL DEFAULT '',
  `showUnpublished` char(1) NOT NULL DEFAULT '',
  `createdAt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expiresAt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `published` char(1) NOT NULL DEFAULT '',
  `createdBy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `restrictToUrl` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_remember_me`
--

CREATE TABLE `tl_remember_me` (
  `id` int(10) UNSIGNED NOT NULL,
  `series` binary(32) NOT NULL COMMENT '(DC2Type:binary_string)',
  `value` binary(64) NOT NULL COMMENT '(DC2Type:binary_string)',
  `lastUsed` datetime NOT NULL,
  `expires` datetime DEFAULT NULL,
  `class` varchar(100) NOT NULL,
  `username` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_remember_me`
--

INSERT INTO `tl_remember_me` (`id`, `series`, `value`, `lastUsed`, `expires`, `class`, `username`) VALUES
(166, 0xf24be20871383f87ec49e9b4c9be02a11dae037073572b016cd1f8365741d7e8, 0x1738d579333d43d5428250ce325abd9d0eb0ccbe1958b8d436e0b8d592f4aeb83e8476e5dd05f27d7e86dcbe41da787f89ca3af79edcabb529ba4bf4b374ad04, '2023-07-21 21:59:33', NULL, 'Contao\\FrontendUser', 'test@test.de');

-- --------------------------------------------------------

--
-- Table structure for table `tl_search`
--

CREATE TABLE `tl_search` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `url` varchar(2048) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `text` mediumtext DEFAULT NULL,
  `filesize` double NOT NULL DEFAULT 0,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `protected` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `language` varchar(5) NOT NULL DEFAULT '',
  `vectorLength` double NOT NULL DEFAULT 0,
  `meta` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_search_index`
--

CREATE TABLE `tl_search_index` (
  `pid` int(10) UNSIGNED NOT NULL,
  `termId` int(10) UNSIGNED NOT NULL,
  `relevance` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_search_term`
--

CREATE TABLE `tl_search_term` (
  `id` int(10) UNSIGNED NOT NULL,
  `term` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `documentFrequency` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_style`
--

CREATE TABLE `tl_style` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sorting` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `selector` varchar(1022) NOT NULL DEFAULT '',
  `category` varchar(32) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `size` char(1) NOT NULL DEFAULT '',
  `width` varchar(64) NOT NULL DEFAULT '',
  `height` varchar(64) NOT NULL DEFAULT '',
  `minwidth` varchar(64) NOT NULL DEFAULT '',
  `minheight` varchar(64) NOT NULL DEFAULT '',
  `maxwidth` varchar(64) NOT NULL DEFAULT '',
  `maxheight` varchar(64) NOT NULL DEFAULT '',
  `positioning` char(1) NOT NULL DEFAULT '',
  `trbl` varchar(128) NOT NULL DEFAULT '',
  `position` varchar(32) NOT NULL DEFAULT '',
  `floating` varchar(32) NOT NULL DEFAULT '',
  `clear` varchar(32) NOT NULL DEFAULT '',
  `overflow` varchar(32) NOT NULL DEFAULT '',
  `display` varchar(32) NOT NULL DEFAULT '',
  `alignment` char(1) NOT NULL DEFAULT '',
  `margin` varchar(128) NOT NULL DEFAULT '',
  `padding` varchar(128) NOT NULL DEFAULT '',
  `align` varchar(32) NOT NULL DEFAULT '',
  `verticalalign` varchar(32) NOT NULL DEFAULT '',
  `textalign` varchar(32) NOT NULL DEFAULT '',
  `whitespace` varchar(8) NOT NULL DEFAULT '',
  `background` char(1) NOT NULL DEFAULT '',
  `bgcolor` varchar(64) NOT NULL DEFAULT '',
  `bgimage` varchar(255) NOT NULL DEFAULT '',
  `bgposition` varchar(32) NOT NULL DEFAULT '',
  `bgrepeat` varchar(32) NOT NULL DEFAULT '',
  `shadowsize` varchar(128) NOT NULL DEFAULT '',
  `shadowcolor` varchar(64) NOT NULL DEFAULT '',
  `gradientAngle` varchar(32) NOT NULL DEFAULT '',
  `gradientColors` varchar(128) NOT NULL DEFAULT '',
  `border` char(1) NOT NULL DEFAULT '',
  `borderwidth` varchar(128) NOT NULL DEFAULT '',
  `borderstyle` varchar(32) NOT NULL DEFAULT '',
  `bordercolor` varchar(64) NOT NULL DEFAULT '',
  `borderradius` varchar(128) NOT NULL DEFAULT '',
  `bordercollapse` varchar(32) NOT NULL DEFAULT '',
  `borderspacing` varchar(64) NOT NULL DEFAULT '',
  `font` char(1) NOT NULL DEFAULT '',
  `fontfamily` varchar(255) NOT NULL DEFAULT '',
  `fontsize` varchar(64) NOT NULL DEFAULT '',
  `fontcolor` varchar(64) NOT NULL DEFAULT '',
  `lineheight` varchar(64) NOT NULL DEFAULT '',
  `fontstyle` varchar(255) NOT NULL DEFAULT '',
  `texttransform` varchar(32) NOT NULL DEFAULT '',
  `textindent` varchar(64) NOT NULL DEFAULT '',
  `letterspacing` varchar(64) NOT NULL DEFAULT '',
  `wordspacing` varchar(64) NOT NULL DEFAULT '',
  `list` char(1) NOT NULL DEFAULT '',
  `liststyletype` varchar(32) NOT NULL DEFAULT '',
  `liststyleimage` varchar(255) NOT NULL DEFAULT '',
  `own` text DEFAULT NULL,
  `invisible` char(1) NOT NULL DEFAULT '',
  `remark_text` text DEFAULT NULL,
  `remark_icon` varchar(16) NOT NULL DEFAULT 'show',
  `beremark` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_style_sheet`
--

CREATE TABLE `tl_style_sheet` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `embedImages` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cc` varchar(32) NOT NULL DEFAULT '',
  `media` varchar(255) NOT NULL DEFAULT 'a:1:{i:0;s:3:"all";}',
  `mediaQuery` text DEFAULT NULL,
  `vars` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_theme`
--

CREATE TABLE `tl_theme` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT '',
  `author` varchar(128) NOT NULL DEFAULT '',
  `folders` blob DEFAULT NULL,
  `screenshot` binary(16) DEFAULT NULL,
  `templates` varchar(255) NOT NULL DEFAULT '',
  `vars` text DEFAULT NULL,
  `easy_themes_internalTitle` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_theme`
--

INSERT INTO `tl_theme` (`id`, `tstamp`, `name`, `author`, `folders`, `screenshot`, `templates`, `vars`, `easy_themes_internalTitle`) VALUES
(1, 1668378263, 'default', 'Ernst Jendritzki', 0x613a313a7b693a303b733a31363a22d63b967463a011edb8900242ac10ee0c223b7d, NULL, '', 'a:0:{}', '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_trusted_device`
--

CREATE TABLE `tl_trusted_device` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `userClass` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `user_agent` longtext DEFAULT NULL,
  `ua_family` varchar(255) DEFAULT NULL,
  `os_family` varchar(255) DEFAULT NULL,
  `device_family` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tl_undo`
--

CREATE TABLE `tl_undo` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fromTable` varchar(255) NOT NULL DEFAULT '',
  `query` text DEFAULT NULL,
  `affectedRows` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `data` mediumblob DEFAULT NULL,
  `preview` mediumblob DEFAULT NULL,
  `haste_data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_undo`
--

INSERT INTO `tl_undo` (`id`, `pid`, `tstamp`, `fromTable`, `query`, `affectedRows`, `data`, `preview`, `haste_data`) VALUES
(1, 4, 1688919788, 'tl_iso_product', 'DELETE FROM tl_iso_product WHERE id=98', 3, 0x613a333a7b733a31343a22746c5f69736f5f70726f64756374223b613a313a7b693a303b613a33383a7b733a323a226964223b693a39383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393730303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d7d733a32303a22746c5f69736f5f70726f647563745f7072696365223b613a313a7b693a303b613a383a7b733a323a226964223b693a35323b733a333a22706964223b693a39383b733a363a22747374616d70223b693a313638383931393633383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b7d7d733a32343a22746c5f69736f5f70726f647563745f707269636574696572223b613a313a7b693a303b613a353a7b733a323a226964223b693a35373b733a333a22706964223b693a35323b733a363a22747374616d70223b693a313638383931393633383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d, 0x613a343a7b693a303b733a363a22266e6273703b223b693a313b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b693a323b733a353a224230303032223b693a333b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d, NULL),
(2, 4, 1688920008, 'tl_iso_product', 'DELETE FROM tl_iso_product WHERE id=90', 3, 0x613a313a7b733a31343a22746c5f69736f5f70726f64756374223b613a333a7b693a303b613a33383a7b733a323a226964223b693a39303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383835303337373b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a34303a22536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31343a223c703e466967757220363c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d693a313b613a33383a7b733a323a226964223b693a39313b733a333a22706964223b693a39303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303337373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e7465204b6f70696520766f6e20536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b7d693a323b613a33383a7b733a323a226964223b693a39323b733a333a22706964223b693a39303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303337373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203620262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b7d7d7d, 0x613a343a7b693a303b733a363a22266e6273703b223b693a313b733a3238353a223c6120687265663d226261636b656e643f646f3d69736f5f70726f647563747326616d703b6163743d64656c65746526616d703b69643d393026616d703b72743d376631653563383434393532392e7a4a6930566e416a573373574376304b65724c705551584c7746684e69656a555f6a49497278444b52746b2e70367a7a506b6852496b786d55365270476453774358534b686741457a61795f7631424c6d334b6f4c6f437131763039475252744f4864346b6726616d703b7265663d324c427a3330596a26616d703b69643d393022207469746c653d225a656967652050726f64756b7476617269616e74656e223e536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b3c2f613e223b693a323b733a303a22223b693a333b733a303a22223b7d, NULL),
(3, 4, 1688920022, 'tl_iso_product', 'DELETE FROM tl_iso_product WHERE id=93', 3, 0x613a313a7b733a31343a22746c5f69736f5f70726f64756374223b613a333a7b693a303b613a33383a7b733a323a226964223b693a39333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303433313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383835303338353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32333a22736b756c707475722d372d7175616e746974792d313030223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303037223b733a343a226e616d65223b733a33333a22536b756c70747572203720262334303b7175616e7469747920313030262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31343a223c703e466967757220363c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a333a22313030223b733a363a22737461747573223b693a303b7d693a313b613a33383a7b733a323a226964223b693a39343b733a333a22706964223b693a39333b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303530343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a35323a22613a323a7b693a303b733a383a227175616e74697479223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a34363a2256617269616e7465203120766f6e20536b756c70747572203720262334303b7175616e74697479202d262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b7d693a323b613a33383a7b733a323a226964223b693a39353b733a333a22706964223b693a39333b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303438313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a35323a22613a323a7b693a303b733a383a227175616e74697479223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a34363a2256617269616e7465203120766f6e20536b756c70747572203720262334303b7175616e74697479202d262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b7d7d7d, 0x613a343a7b693a303b733a363a22266e6273703b223b693a313b733a3236363a223c6120687265663d226261636b656e643f646f3d69736f5f70726f647563747326616d703b6163743d64656c65746526616d703b69643d393326616d703b72743d642e414f6a4c414259534c363548313370596c4a68796d385564754a353652645a69742d5033784476534671552e6139794d6143356756706b336a694d37395f3472773752635f73597a415a494a396f473038466d776676786d706f4a726679555a3753616c465126616d703b7265663d396451436e59474826616d703b69643d393322207469746c653d225a656967652050726f64756b7476617269616e74656e223e536b756c70747572203720262334303b7175616e7469747920313030262334313b3c2f613e223b693a323b733a353a225330303037223b693a333b733a303a22223b7d, NULL),
(4, 4, 1688920225, 'tl_iso_product', 'DELETE FROM tl_iso_product WHERE id=99', 3, 0x613a333a7b733a31343a22746c5f69736f5f70726f64756374223b613a313a7b693a303b613a33383a7b733a323a226964223b693a39393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393831363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383931393739323b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a34353a223c703e42696c64203220286e6f2076617269616e74732c207175616e7469747920262336313b2032293c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d7d733a32303a22746c5f69736f5f70726f647563745f7072696365223b613a313a7b693a303b613a383a7b733a323a226964223b693a35333b733a333a22706964223b693a39393b733a363a22747374616d70223b693a313638383931393831363b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b7d7d733a32343a22746c5f69736f5f70726f647563745f707269636574696572223b613a313a7b693a303b613a353a7b733a323a226964223b693a35383b733a333a22706964223b693a35333b733a363a22747374616d70223b693a313638383931393831363b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d, 0x613a343a7b693a303b733a363a22266e6273703b223b693a313b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b693a323b733a353a224230303032223b693a333b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d, NULL),
(5, 4, 1689967584, 'tl_member', 'DELETE FROM tl_member WHERE id=4', 1, 0x613a313a7b733a393a22746c5f6d656d626572223b613a313a7b693a303b613a33383a7b733a323a226964223b693a343b733a363a22747374616d70223b693a313638393936353834333b733a393a2266697273746e616d65223b733a343a2254657374223b733a383a226c6173746e616d65223b733a363a22546573746572223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a303a22223b733a363a22706f7374616c223b733a303a22223b733a343a2263697479223b733a303a22223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a323a226465223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a31323a227465737440746573742e6465223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b733a31383a22613a313a7b693a303b733a313a2231223b7d223b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b733a31323a227465737440746573742e6465223b733a383a2270617373776f7264223b733a36303a2224327924313324655748475759584a4743494e7a4d4e41394f6536746556476f73372e6a77684b4a796c384646306241674b7448316539614c755269223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936353737313b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b733a303a22223b7d7d7d, 0x613a353a7b693a303b733a3232353a223c64697620636c6173733d226c6973745f69636f6e5f6e657722207374796c653d226261636b67726f756e642d696d6167653a75726c282773797374656d2f7468656d65732f666c657869626c652f69636f6e732f6d656d6265722e73766727292220646174612d69636f6e3d2273797374656d2f7468656d65732f666c657869626c652f69636f6e732f6d656d6265722e7376672220646174612d69636f6e2d64697361626c65643d2273797374656d2f7468656d65732f666c657869626c652f69636f6e732f6d656d6265725f2e737667223e266e6273703b3c2f6469763e223b693a313b733a343a2254657374223b693a323b733a363a22546573746572223b693a333b733a31323a227465737440746573742e6465223b693a343b733a31363a2232313a30373a323032332032303a3536223b7d, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_user`
--

CREATE TABLE `tl_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(64) NOT NULL DEFAULT '',
  `backendTheme` varchar(32) NOT NULL DEFAULT '',
  `fullscreen` char(1) NOT NULL DEFAULT '',
  `uploader` varchar(32) NOT NULL DEFAULT '',
  `showHelp` char(1) NOT NULL DEFAULT '1',
  `thumbnails` char(1) NOT NULL DEFAULT '1',
  `useRTE` char(1) NOT NULL DEFAULT '1',
  `useCE` char(1) NOT NULL DEFAULT '1',
  `password` varchar(255) NOT NULL DEFAULT '',
  `pwChange` char(1) NOT NULL DEFAULT '',
  `admin` char(1) NOT NULL DEFAULT '',
  `groups` blob DEFAULT NULL,
  `inherit` varchar(12) NOT NULL DEFAULT 'group',
  `modules` blob DEFAULT NULL,
  `themes` blob DEFAULT NULL,
  `elements` blob DEFAULT NULL,
  `fields` blob DEFAULT NULL,
  `pagemounts` blob DEFAULT NULL,
  `alpty` blob DEFAULT NULL,
  `filemounts` blob DEFAULT NULL,
  `fop` blob DEFAULT NULL,
  `imageSizes` blob DEFAULT NULL,
  `forms` blob DEFAULT NULL,
  `formp` blob DEFAULT NULL,
  `amg` blob DEFAULT NULL,
  `disable` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `session` blob DEFAULT NULL,
  `dateAdded` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `secret` binary(128) DEFAULT NULL,
  `useTwoFactor` char(1) NOT NULL DEFAULT '',
  `lastLogin` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currentLogin` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `loginAttempts` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `locked` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `backupCodes` text DEFAULT NULL,
  `trustedTokenVersion` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `faqs` blob DEFAULT NULL,
  `faqp` blob DEFAULT NULL,
  `news` blob DEFAULT NULL,
  `newp` blob DEFAULT NULL,
  `newsfeeds` blob DEFAULT NULL,
  `newsfeedp` blob DEFAULT NULL,
  `calendars` blob DEFAULT NULL,
  `calendarp` blob DEFAULT NULL,
  `calendarfeeds` blob DEFAULT NULL,
  `calendarfeedp` blob DEFAULT NULL,
  `newsletters` blob DEFAULT NULL,
  `newsletterp` blob DEFAULT NULL,
  `rocksolidFrontendHelperLightbox` char(1) NOT NULL DEFAULT '1',
  `rocksolidFrontendHelper` char(1) NOT NULL DEFAULT '1',
  `rocksolidFrontendHelperContentElements` blob DEFAULT NULL,
  `rocksolidFrontendHelperOperations` blob DEFAULT NULL,
  `iso_reports` blob DEFAULT NULL,
  `iso_member_groups` blob DEFAULT NULL,
  `iso_groupp` blob DEFAULT NULL,
  `iso_groups` blob DEFAULT NULL,
  `iso_configp` blob DEFAULT NULL,
  `iso_configs` blob DEFAULT NULL,
  `iso_tax_ratep` blob DEFAULT NULL,
  `iso_tax_rates` blob DEFAULT NULL,
  `iso_tax_classp` blob DEFAULT NULL,
  `iso_tax_classes` blob DEFAULT NULL,
  `iso_shipping_modulep` blob DEFAULT NULL,
  `iso_shipping_modules` blob DEFAULT NULL,
  `iso_payment_modulep` blob DEFAULT NULL,
  `iso_payment_modules` blob DEFAULT NULL,
  `iso_product_typep` blob DEFAULT NULL,
  `iso_product_types` blob DEFAULT NULL,
  `iso_modules` blob DEFAULT NULL,
  `pageLanguageLabels` text DEFAULT NULL,
  `et_bemodRef` varchar(32) NOT NULL DEFAULT '',
  `et_mode` varchar(32) NOT NULL DEFAULT 'contextmenu',
  `et_activeModules` blob DEFAULT NULL,
  `et_enable` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_user`
--

INSERT INTO `tl_user` (`id`, `tstamp`, `username`, `name`, `email`, `language`, `backendTheme`, `fullscreen`, `uploader`, `showHelp`, `thumbnails`, `useRTE`, `useCE`, `password`, `pwChange`, `admin`, `groups`, `inherit`, `modules`, `themes`, `elements`, `fields`, `pagemounts`, `alpty`, `filemounts`, `fop`, `imageSizes`, `forms`, `formp`, `amg`, `disable`, `start`, `stop`, `session`, `dateAdded`, `secret`, `useTwoFactor`, `lastLogin`, `currentLogin`, `loginAttempts`, `locked`, `backupCodes`, `trustedTokenVersion`, `faqs`, `faqp`, `news`, `newp`, `newsfeeds`, `newsfeedp`, `calendars`, `calendarp`, `calendarfeeds`, `calendarfeedp`, `newsletters`, `newsletterp`, `rocksolidFrontendHelperLightbox`, `rocksolidFrontendHelper`, `rocksolidFrontendHelperContentElements`, `rocksolidFrontendHelperOperations`, `iso_reports`, `iso_member_groups`, `iso_groupp`, `iso_groups`, `iso_configp`, `iso_configs`, `iso_tax_ratep`, `iso_tax_rates`, `iso_tax_classp`, `iso_tax_classes`, `iso_shipping_modulep`, `iso_shipping_modules`, `iso_payment_modulep`, `iso_payment_modules`, `iso_product_typep`, `iso_product_types`, `iso_modules`, `pageLanguageLabels`, `et_bemodRef`, `et_mode`, `et_activeModules`, `et_enable`) VALUES
(4, 1688845618, 'test', 'test', 'test@domian.de', 'de', 'flexible', '', 'DropZone', '1', '1', '1', '1', '$2y$13$TTjXpFERpBjRjPlmJcirgexhr.yu9.Skh/fBC2y/wPNrzlCwJFjim', '', '1', NULL, 'group', 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, '', '', '', 0x613a393a7b733a31323a22746c5f706167655f74726565223b613a31323a7b693a313b693a313b693a323b693a303b693a333b693a313b693a343b693a303b693a32363b693a303b693a33323b693a303b693a35383b693a303b693a33333b693a303b693a383b693a303b693a34313b693a303b693a31383b693a303b693a31393b693a303b7d733a31353a226669656c647365745f737461746573223b613a323a7b733a31383a22746c5f69736f5f70726f6475637474797065223b613a313a7b733a31353a2276617269616e74735f6c6567656e64223b693a313b7d733a31343a22746c5f69736f5f61646472657373223b613a313a7b733a31343a2264656661756c745f6c6567656e64223b693a313b7d7d733a31393a2269736f5f70726f647563745f75706461746572223b4e3b733a31313a226e65775f7265636f726473223b613a303a7b7d733a363a2266696c746572223b613a313a7b733a31313a22746c5f6d6f64756c655f31223b613a313a7b733a353a226c696d6974223b733a343a22302c3330223b7d7d733a31323a22746c5f706167655f6e6f6465223b733a323a223631223b733a32333a22746c5f61727469636c655f746c5f706167655f74726565223b613a313a7b693a36313b693a303b7d733a32333a22746c5f69736f5f6f726465727374617475735f74726565223b613a363a7b693a31303b693a303b693a31313b693a303b693a31323b693a303b693a31333b693a303b693a31343b693a303b693a31353b693a303b7d733a31363a2264636157697a61726452656665726572223b733a3138363a226261636b656e643f646f3d6e635f6e6f74696669636174696f6e732672743d376337352e49325a45656c367a4e6f416c397a744a5058496553326a49464c6c544e567044354a524c685a3243434b632e616877684c54484147374a317230343865426842487753625334736751574968722d5936377157315938704e464855574e637066736b65416367267265663d484549785a746277267461626c653d746c5f6e635f6d657373616765266163743d656469742669643d3135223b7d, 1688845570, NULL, '', 1689969756, 1691357604, 0, 0, NULL, 0, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, '1', '1', 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, NULL, '', 'contextmenu', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `tl_user_group`
--

CREATE TABLE `tl_user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `modules` blob DEFAULT NULL,
  `themes` blob DEFAULT NULL,
  `elements` blob DEFAULT NULL,
  `fields` blob DEFAULT NULL,
  `pagemounts` blob DEFAULT NULL,
  `alpty` blob DEFAULT NULL,
  `filemounts` blob DEFAULT NULL,
  `fop` blob DEFAULT NULL,
  `imageSizes` blob DEFAULT NULL,
  `forms` blob DEFAULT NULL,
  `formp` blob DEFAULT NULL,
  `amg` blob DEFAULT NULL,
  `alexf` blob DEFAULT NULL,
  `disable` char(1) NOT NULL DEFAULT '',
  `start` varchar(10) NOT NULL DEFAULT '',
  `stop` varchar(10) NOT NULL DEFAULT '',
  `faqs` blob DEFAULT NULL,
  `faqp` blob DEFAULT NULL,
  `news` blob DEFAULT NULL,
  `newp` blob DEFAULT NULL,
  `newsfeeds` blob DEFAULT NULL,
  `newsfeedp` blob DEFAULT NULL,
  `calendars` blob DEFAULT NULL,
  `calendarp` blob DEFAULT NULL,
  `calendarfeeds` blob DEFAULT NULL,
  `calendarfeedp` blob DEFAULT NULL,
  `newsletters` blob DEFAULT NULL,
  `newsletterp` blob DEFAULT NULL,
  `rocksolidFrontendHelperContentElements` blob DEFAULT NULL,
  `rocksolidFrontendHelperOperations` blob DEFAULT NULL,
  `iso_reports` blob DEFAULT NULL,
  `iso_member_groups` blob DEFAULT NULL,
  `iso_groupp` blob DEFAULT NULL,
  `iso_groups` blob DEFAULT NULL,
  `iso_configp` blob DEFAULT NULL,
  `iso_configs` blob DEFAULT NULL,
  `iso_tax_ratep` blob DEFAULT NULL,
  `iso_tax_rates` blob DEFAULT NULL,
  `iso_tax_classp` blob DEFAULT NULL,
  `iso_tax_classes` blob DEFAULT NULL,
  `iso_shipping_modulep` blob DEFAULT NULL,
  `iso_shipping_modules` blob DEFAULT NULL,
  `iso_payment_modulep` blob DEFAULT NULL,
  `iso_payment_modules` blob DEFAULT NULL,
  `iso_product_typep` blob DEFAULT NULL,
  `iso_product_types` blob DEFAULT NULL,
  `iso_modules` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_user_group`
--

INSERT INTO `tl_user_group` (`id`, `tstamp`, `name`, `modules`, `themes`, `elements`, `fields`, `pagemounts`, `alpty`, `filemounts`, `fop`, `imageSizes`, `forms`, `formp`, `amg`, `alexf`, `disable`, `start`, `stop`, `faqs`, `faqp`, `news`, `newp`, `newsfeeds`, `newsfeedp`, `calendars`, `calendarp`, `calendarfeeds`, `calendarfeedp`, `newsletters`, `newsletterp`, `rocksolidFrontendHelperContentElements`, `rocksolidFrontendHelperOperations`, `iso_reports`, `iso_member_groups`, `iso_groupp`, `iso_groups`, `iso_configp`, `iso_configs`, `iso_tax_ratep`, `iso_tax_rates`, `iso_tax_classp`, `iso_tax_classes`, `iso_shipping_modulep`, `iso_shipping_modules`, `iso_payment_modulep`, `iso_payment_modules`, `iso_product_typep`, `iso_product_types`, `iso_modules`) VALUES
(1, 1672004396, 'Redakteur', 0x613a383a7b693a303b733a373a2261727469636c65223b693a313b733a343a22666f726d223b693a323b733a31323a2269736f5f70726f6475637473223b693a333b733a31303a2269736f5f6f7264657273223b693a343b733a373a227265706f727473223b693a353b733a31363a226e635f6e6f74696669636174696f6e73223b693a363b733a343a2270616765223b693a373b733a353a2266696c6573223b7d, NULL, 0x613a373a7b693a303b733a383a22686561646c696e65223b693a313b733a343a2274657874223b693a323b733a393a2268797065726c696e6b223b693a333b733a353a22696d616765223b693a343b733a373a2267616c6c657279223b693a353b733a383a22646f776e6c6f6164223b693a363b733a393a22646f776e6c6f616473223b7d, 0x613a313a7b693a303b733a31313a226578706c616e6174696f6e223b7d, 0x613a34313a7b693a303b693a33303b693a313b693a313b693a323b693a323b693a333b693a333b693a343b693a33323b693a353b693a33333b693a363b693a343b693a373b693a353b693a383b693a363b693a393b693a393b693a31303b693a33343b693a31313b693a31303b693a31323b693a31313b693a31333b693a31323b693a31343b693a31373b693a31353b693a383b693a31363b693a34313b693a31373b693a31383b693a31383b693a32303b693a31393b693a33353b693a32303b693a32373b693a32313b693a32313b693a32323b693a31393b693a32333b693a32323b693a32343b693a32333b693a32353b693a373b693a32363b693a34303b693a32373b693a34323b693a32383b693a34333b693a32393b693a34353b693a33303b693a34363b693a33313b693a34343b693a33323b693a32353b693a33333b693a32383b693a33343b693a32393b693a33353b693a32343b693a33363b693a33363b693a33373b693a33373b693a33383b693a31333b693a33393b693a31343b693a34303b693a32363b7d, 0x613a323a7b693a303b733a373a22726567756c6172223b693a313b733a373a22666f7277617264223b7d, 0x613a313a7b693a303b733a31363a22979dcfe763a211edb8900242ac10ee0c223b7d, 0x613a333a7b693a303b733a323a226631223b693a313b733a323a226632223b693a323b733a323a226633223b7d, 0x613a323a7b693a303b733a31323a2270726f706f7274696f6e616c223b693a313b733a333a22626f78223b7d, 0x613a323a7b693a303b733a313a2232223b693a313b733a313a2231223b7d, NULL, 0x613a313a7b693a303b733a313a2231223b7d, 0x613a38373a7b693a303b733a31373a22746c5f61727469636c653a3a7469746c65223b693a313b733a31383a22746c5f61727469636c653a3a617574686f72223b693a323b733a32303a22746c5f61727469636c653a3a6b6579776f726473223b693a333b733a32303a22746c5f636f6e74656e743a3a686561646c696e65223b693a343b733a31363a22746c5f636f6e74656e743a3a74657874223b693a353b733a32303a22746c5f636f6e74656e743a3a616464496d616765223b693a363b733a32333a22746c5f636f6e74656e743a3a73686f7750726576696577223b693a373b733a31383a22746c5f636f6e74656e743a3a696e6c696e65223b693a383b733a32353a22746c5f636f6e74656e743a3a6f76657277726974654d657461223b693a393b733a32313a22746c5f636f6e74656e743a3a73696e676c65535243223b693a31303b733a31353a22746c5f636f6e74656e743a3a616c74223b693a31313b733a32323a22746c5f636f6e74656e743a3a696d6167655469746c65223b693a31323b733a31363a22746c5f636f6e74656e743a3a73697a65223b693a31333b733a32333a22746c5f636f6e74656e743a3a696d6167656d617267696e223b693a31343b733a32303a22746c5f636f6e74656e743a3a696d61676555726c223b693a31353b733a32303a22746c5f636f6e74656e743a3a66756c6c73697a65223b693a31363b733a31393a22746c5f636f6e74656e743a3a63617074696f6e223b693a31373b733a32303a22746c5f636f6e74656e743a3a666c6f6174696e67223b693a31383b733a31353a22746c5f636f6e74656e743a3a75726c223b693a31393b733a31383a22746c5f636f6e74656e743a3a746172676574223b693a32303b733a32353a22746c5f636f6e74656e743a3a6f76657277726974654c696e6b223b693a32313b733a32313a22746c5f636f6e74656e743a3a7469746c6554657874223b693a32323b733a32313a22746c5f636f6e74656e743a3a6c696e6b5469746c65223b693a32333b733a31373a22746c5f636f6e74656e743a3a656d626564223b693a32343b733a31353a22746c5f636f6e74656e743a3a72656c223b693a32353b733a32303a22746c5f636f6e74656e743a3a757365496d616765223b693a32363b733a31343a22746c5f66696c65733a3a6e616d65223b693a32373b733a31393a22746c5f66696c65733a3a70726f746563746564223b693a32383b733a31343a22746c5f66696c65733a3a6d657461223b693a32393b733a31343a22746c5f666f726d3a3a7469746c65223b693a33303b733a31353a22746c5f666f726d3a3a6a756d70546f223b693a33313b733a32333a22746c5f666f726d5f6669656c643a3a686561646c696e65223b693a33323b733a32343a22746c5f696d6167655f73697a653a3a64656e736974696573223b693a33333b733a32303a22746c5f696d6167655f73697a653a3a73697a6573223b693a33343b733a32303a22746c5f696d6167655f73697a653a3a7769647468223b693a33353b733a32313a22746c5f696d6167655f73697a653a3a686569676874223b693a33363b733a32353a22746c5f696d6167655f73697a653a3a726573697a654d6f6465223b693a33373b733a31393a22746c5f696d6167655f73697a653a3a7a6f6f6d223b693a33383b733a31383a22746c5f69736f5f67726f75703a3a6e616d65223b693a33393b733a32363a22746c5f69736f5f67726f75703a3a70726f647563745f74797065223b693a34303b733a32303a22746c5f69736f5f70726f647563743a3a74797065223b693a34313b733a32313a22746c5f69736f5f70726f647563743a3a7061676573223b693a34323b733a31393a22746c5f69736f5f70726f647563743a3a736b75223b693a34333b733a32303a22746c5f69736f5f70726f647563743a3a6e616d65223b693a34343b733a32323a22746c5f69736f5f70726f647563743a3a746561736572223b693a34353b733a32373a22746c5f69736f5f70726f647563743a3a6465736372697074696f6e223b693a34363b733a32363a22746c5f69736f5f70726f647563743a3a6d6574615f7469746c65223b693a34373b733a33323a22746c5f69736f5f70726f647563743a3a6d6574615f6465736372697074696f6e223b693a34383b733a32393a22746c5f69736f5f70726f647563743a3a6d6574615f6b6579776f726473223b693a34393b733a32313a22746c5f69736f5f70726f647563743a3a7072696365223b693a35303b733a33313a22746c5f69736f5f70726f647563743a3a7368697070696e675f776569676874223b693a35313b733a33313a22746c5f69736f5f70726f647563743a3a7368697070696e675f6578656d7074223b693a35323b733a33313a22746c5f69736f5f70726f647563743a3a7368697070696e675f7069636b7570223b693a35333b733a33303a22746c5f69736f5f70726f647563743a3a7368697070696e675f7072696365223b693a35343b733a32323a22746c5f69736f5f70726f647563743a3a696d61676573223b693a35353b733a32313a22746c5f69736f5f70726f647563743a3a6373734944223b693a35363b733a32353a22746c5f69736f5f70726f647563743a3a7075626c6973686564223b693a35373b733a33323a22746c5f69736f5f70726f647563743a3a73696d706c655f6572705f636f756e74223b693a35383b733a32323a22746c5f69736f5f70726f647563743a3a6c656e677468223b693a35393b733a32313a22746c5f69736f5f70726f647563743a3a7769647468223b693a36303b733a32323a22746c5f69736f5f70726f647563743a3a686569676874223b693a36313b733a33393a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a6f726465725f737461747573223b693a36323b733a33363a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a646174655f70616964223b693a36333b733a33393a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a646174655f73686970706564223b693a36343b733a34333a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a73656e644e6f74696669636174696f6e223b693a36353b733a33393a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a6e6f74696669636174696f6e223b693a36363b733a35373a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a6e6f74696669636174696f6e5f7368697070696e675f747261636b696e67223b693a36373b733a35343a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a6e6f74696669636174696f6e5f637573746f6d65725f6e6f746573223b693a36383b733a33323a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e3a3a6e6f746573223b693a36393b733a33313a22746c5f69736f5f70726f647563745f70726963653a3a7461785f636c617373223b693a37303b733a32343a22746c5f69736f5f70726f64756374747970653a3a6e616d65223b693a37313b733a33313a22746c5f69736f5f70726f64756374747970653a3a6465736372697074696f6e223b693a37323b733a33333a22746c5f6e635f6c616e67756167653a3a656d61696c5f73656e6465725f6e616d65223b693a37333b733a33363a22746c5f6e635f6c616e67756167653a3a656d61696c5f73656e6465725f61646472657373223b693a37343b733a33343a22746c5f6e635f6c616e67756167653a3a656d61696c5f726563697069656e745f6363223b693a37353b733a33353a22746c5f6e635f6c616e67756167653a3a656d61696c5f726563697069656e745f626363223b693a37363b733a32393a22746c5f6e635f6c616e67756167653a3a656d61696c5f7265706c79546f223b693a37373b733a32393a22746c5f6e635f6c616e67756167653a3a656d61696c5f7375626a656374223b693a37383b733a32363a22746c5f6e635f6c616e67756167653a3a656d61696c5f74657874223b693a37393b733a32363a22746c5f6e635f6c616e67756167653a3a656d61696c5f68746d6c223b693a38303b733a32303a22746c5f6e635f6d6573736167653a3a7469746c65223b693a38313b733a32353a22746c5f6e635f6e6f74696669636174696f6e3a3a7469746c65223b693a38323b733a31343a22746c5f706167653a3a7469746c65223b693a38333b733a31383a22746c5f706167653a3a706167655469746c65223b693a38343b733a32303a22746c5f706167653a3a6465736372697074696f6e223b693a38353b733a32303a22746c5f706167653a3a7365727050726576696577223b693a38363b733a32363a22746c5f707265766965775f6c696e6b3a3a7075626c6973686564223b7d, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0x613a383a7b693a303b733a383a22686561646c696e65223b693a313b733a343a2274657874223b693a323b733a31353a226163636f7264696f6e53696e676c65223b693a333b733a393a2268797065726c696e6b223b693a343b733a353a22696d616765223b693a353b733a373a2267616c6c657279223b693a363b733a383a22646f776e6c6f6164223b693a373b733a393a22646f776e6c6f616473223b7d, 0x613a333a7b693a303b733a393a2266654d6f64756c6573223b693a313b733a393a2262654d6f64756c6573223b693a323b733a353a22696e666f73223b7d, 0x613a333a7b693a303b733a31313a2273616c65735f746f74616c223b693a313b733a31333a2273616c65735f70726f64756374223b693a323b733a31343a226d656d626572735f677565737473223b7d, 0x613a323a7b693a303b733a323a222d31223b693a313b733a313a2231223b7d, NULL, NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, NULL, NULL, 0x613a313a7b693a303b733a313a2233223b7d, NULL, 0x613a323a7b693a303b733a323a223132223b693a313b733a323a223136223b7d, NULL, 0x613a343a7b693a303b733a313a2233223b693a313b733a313a2234223b693a323b733a313a2232223b693a333b733a313a2235223b7d, NULL, 0x613a343a7b693a303b733a313a2236223b693a313b733a313a2237223b693a323b733a323a223133223b693a333b733a323a223134223b7d, 0x613a313a7b693a303b733a393a22696e74656772697479223b7d),
(2, 1682280927, 'Redakteur &#40;without shop&#41;', 0x613a31333a7b693a303b733a373a2261727469636c65223b693a313b733a343a22666f726d223b693a323b733a31383a2264656c69726975735f6c696e6b6c69737465223b693a333b733a383a22636f6d6d656e7473223b693a343b733a343a226e657773223b693a353b733a31303a226e6577736c6574746572223b693a363b733a31323a2269736f5f70726f6475637473223b693a373b733a31363a226e635f6e6f74696669636174696f6e73223b693a383b733a31333a22566964656f68616e6462756368223b693a393b733a343a2270616765223b693a31303b733a353a2266696c6573223b693a31313b733a31323a22707265766965775f6c696e6b223b693a31323b733a31313a2276697369746f7273746174223b7d, NULL, 0x613a363a7b693a303b733a383a22686561646c696e65223b693a313b733a343a2274657874223b693a323b733a31303a2262655f72656d61726b73223b693a333b733a393a2268797065726c696e6b223b693a343b733a353a22696d616765223b693a353b733a373a2267616c6c657279223b7d, 0x613a313a7b693a303b733a31313a226578706c616e6174696f6e223b7d, 0x613a31383a7b693a303b693a33303b693a313b693a313b693a323b693a323b693a333b693a333b693a343b693a33323b693a353b693a33333b693a363b693a31303b693a373b693a31313b693a383b693a31343b693a393b693a35343b693a31303b693a35353b693a31313b693a34393b693a31323b693a35303b693a31333b693a35313b693a31343b693a35323b693a31353b693a35333b693a31363b693a35383b693a31373b693a35393b7d, 0x613a323a7b693a303b733a373a22726567756c6172223b693a313b733a373a22666f7277617264223b7d, 0x613a313a7b693a303b733a31363a22979dcfe763a211edb8900242ac10ee0c223b7d, 0x613a333a7b693a303b733a323a226631223b693a313b733a323a226632223b693a323b733a323a226633223b7d, 0x613a353a7b693a303b733a31313a225f6e6577736c6574746572223b693a313b733a363a225f7731323030223b693a323b733a383a225f66697474696e67223b693a333b733a31323a2270726f706f7274696f6e616c223b693a343b733a333a22626f78223b7d, 0x613a313a7b693a303b733a313a2231223b7d, NULL, NULL, 0x613a3133393a7b693a303b733a31373a22746c5f636f6d6d656e74733a3a6e616d65223b693a313b733a31383a22746c5f636f6d6d656e74733a3a656d61696c223b693a323b733a32303a22746c5f636f6d6d656e74733a3a77656273697465223b693a333b733a32303a22746c5f636f6d6d656e74733a3a636f6d6d656e74223b693a343b733a32313a22746c5f636f6d6d656e74733a3a6164645265706c79223b693a353b733a31393a22746c5f636f6d6d656e74733a3a617574686f72223b693a363b733a31383a22746c5f636f6d6d656e74733a3a7265706c79223b693a373b733a32323a22746c5f636f6d6d656e74733a3a7075626c6973686564223b693a383b733a31363a22746c5f636f6e74656e743a3a74797065223b693a393b733a32303a22746c5f636f6e74656e743a3a686561646c696e65223b693a31303b733a31363a22746c5f636f6e74656e743a3a74657874223b693a31313b733a32303a22746c5f636f6e74656e743a3a616464496d616765223b693a31323b733a32333a22746c5f636f6e74656e743a3a73686f7750726576696577223b693a31333b733a31383a22746c5f636f6e74656e743a3a696e6c696e65223b693a31343b733a32353a22746c5f636f6e74656e743a3a6f76657277726974654d657461223b693a31353b733a32313a22746c5f636f6e74656e743a3a73696e676c65535243223b693a31363b733a31353a22746c5f636f6e74656e743a3a616c74223b693a31373b733a32323a22746c5f636f6e74656e743a3a696d6167655469746c65223b693a31383b733a31363a22746c5f636f6e74656e743a3a73697a65223b693a31393b733a32333a22746c5f636f6e74656e743a3a696d6167656d617267696e223b693a32303b733a32303a22746c5f636f6e74656e743a3a696d61676555726c223b693a32313b733a32303a22746c5f636f6e74656e743a3a66756c6c73697a65223b693a32323b733a31393a22746c5f636f6e74656e743a3a63617074696f6e223b693a32333b733a31353a22746c5f636f6e74656e743a3a75726c223b693a32343b733a31383a22746c5f636f6e74656e743a3a746172676574223b693a32353b733a32353a22746c5f636f6e74656e743a3a6f76657277726974654c696e6b223b693a32363b733a32313a22746c5f636f6e74656e743a3a6c696e6b5469746c65223b693a32373b733a31373a22746c5f636f6e74656e743a3a656d626564223b693a32383b733a32303a22746c5f636f6e74656e743a3a757365496d616765223b693a32393b733a31383a22746c5f636f6e74656e743a3a706572526f77223b693a33303b733a31393a22746c5f636f6e74656e743a3a70657250616765223b693a33313b733a32353a22746c5f636f6e74656e743a3a6e756d6265724f664974656d73223b693a33323b733a31383a22746c5f636f6e74656e743a3a736f72744279223b693a33333b733a31343a22746c5f66696c65733a3a6e616d65223b693a33343b733a31393a22746c5f66696c65733a3a70726f746563746564223b693a33353b733a31343a22746c5f66696c65733a3a6d657461223b693a33363b733a31343a22746c5f666f726d3a3a7469746c65223b693a33373b733a32333a22746c5f666f726d5f6669656c643a3a686561646c696e65223b693a33383b733a32343a22746c5f696d6167655f73697a653a3a64656e736974696573223b693a33393b733a32303a22746c5f696d6167655f73697a653a3a73697a6573223b693a34303b733a32303a22746c5f696d6167655f73697a653a3a7769647468223b693a34313b733a32313a22746c5f696d6167655f73697a653a3a686569676874223b693a34323b733a32353a22746c5f696d6167655f73697a653a3a726573697a654d6f6465223b693a34333b733a31393a22746c5f696d6167655f73697a653a3a7a6f6f6d223b693a34343b733a31383a22746c5f69736f5f67726f75703a3a6e616d65223b693a34353b733a32363a22746c5f69736f5f67726f75703a3a70726f647563745f74797065223b693a34363b733a32303a22746c5f69736f5f70726f647563743a3a74797065223b693a34373b733a32313a22746c5f69736f5f70726f647563743a3a7061676573223b693a34383b733a31393a22746c5f69736f5f70726f647563743a3a736b75223b693a34393b733a32303a22746c5f69736f5f70726f647563743a3a6e616d65223b693a35303b733a32323a22746c5f69736f5f70726f647563743a3a746561736572223b693a35313b733a32373a22746c5f69736f5f70726f647563743a3a6465736372697074696f6e223b693a35323b733a32363a22746c5f69736f5f70726f647563743a3a6d6574615f7469746c65223b693a35333b733a33323a22746c5f69736f5f70726f647563743a3a6d6574615f6465736372697074696f6e223b693a35343b733a32393a22746c5f69736f5f70726f647563743a3a6d6574615f6b6579776f726473223b693a35353b733a32323a22746c5f69736f5f70726f647563743a3a696d61676573223b693a35363b733a32353a22746c5f69736f5f70726f647563743a3a7075626c6973686564223b693a35373b733a32313a22746c5f69736f5f70726f647563743a3a7374617274223b693a35383b733a32303a22746c5f69736f5f70726f647563743a3a73746f70223b693a35393b733a32323a22746c5f69736f5f70726f647563743a3a6c656e677468223b693a36303b733a32313a22746c5f69736f5f70726f647563743a3a7769647468223b693a36313b733a32323a22746c5f69736f5f70726f647563743a3a686569676874223b693a36323b733a32373a22746c5f6c696e6b5f63617465676f72793a3a7075626c6973686564223b693a36333b733a32333a22746c5f6c696e6b5f63617465676f72793a3a7469746c65223b693a36343b733a33303a22746c5f6c696e6b5f63617465676f72793a3a7469746c655f7075626c696b223b693a36353b733a32393a22746c5f6c696e6b5f63617465676f72793a3a6465736372697074696f6e223b693a36363b733a32333a22746c5f6c696e6b5f63617465676f72793a3a696d616765223b693a36373b733a32333a22746c5f6c696e6b5f646174613a3a7075626c6973686564223b693a36383b733a31373a22746c5f6c696e6b5f646174613a3a75726c223b693a36393b733a32303a22746c5f6c696e6b5f646174613a3a746172676574223b693a37303b733a32323a22746c5f6c696e6b5f646174613a3a75726c5f74657874223b693a37313b733a32333a22746c5f6c696e6b5f646174613a3a75726c5f7469746c65223b693a37323b733a32353a22746c5f6c696e6b5f646174613a3a6465736372697074696f6e223b693a37333b733a31393a22746c5f6c696e6b5f646174613a3a696d616765223b693a37343b733a32343a22746c5f6e635f6c616e67756167653a3a6c616e6775616765223b693a37353b733a32363a22746c5f6e635f6c616e67756167653a3a726563697069656e7473223b693a37363b733a33333a22746c5f6e635f6c616e67756167653a3a656d61696c5f73656e6465725f6e616d65223b693a37373b733a33363a22746c5f6e635f6c616e67756167653a3a656d61696c5f73656e6465725f61646472657373223b693a37383b733a33343a22746c5f6e635f6c616e67756167653a3a656d61696c5f726563697069656e745f6363223b693a37393b733a33353a22746c5f6e635f6c616e67756167653a3a656d61696c5f726563697069656e745f626363223b693a38303b733a32393a22746c5f6e635f6c616e67756167653a3a656d61696c5f7265706c79546f223b693a38313b733a32393a22746c5f6e635f6c616e67756167653a3a656d61696c5f7375626a656374223b693a38323b733a32363a22746c5f6e635f6c616e67756167653a3a656d61696c5f74657874223b693a38333b733a32363a22746c5f6e635f6c616e67756167653a3a656d61696c5f68746d6c223b693a38343b733a32303a22746c5f6e635f6d6573736167653a3a7469746c65223b693a38353b733a32343a22746c5f6e635f6d6573736167653a3a7075626c6973686564223b693a38363b733a32353a22746c5f6e635f6e6f74696669636174696f6e3a3a7469746c65223b693a38373b733a31373a22746c5f6e6577733a3a686561646c696e65223b693a38383b733a31373a22746c5f6e6577733a3a6665617475726564223b693a38393b733a31353a22746c5f6e6577733a3a617574686f72223b693a39303b733a31333a22746c5f6e6577733a3a64617465223b693a39313b733a31333a22746c5f6e6577733a3a74696d65223b693a39323b733a31383a22746c5f6e6577733a3a706167655469746c65223b693a39333b733a32303a22746c5f6e6577733a3a6465736372697074696f6e223b693a39343b733a32303a22746c5f6e6577733a3a7365727050726576696577223b693a39353b733a32303a22746c5f6e6577733a3a737562686561646c696e65223b693a39363b733a31353a22746c5f6e6577733a3a746561736572223b693a39373b733a31373a22746c5f6e6577733a3a616464496d616765223b693a39383b733a32323a22746c5f6e6577733a3a6f76657277726974654d657461223b693a39393b733a31383a22746c5f6e6577733a3a73696e676c65535243223b693a3130303b733a31323a22746c5f6e6577733a3a616c74223b693a3130313b733a31393a22746c5f6e6577733a3a696d6167655469746c65223b693a3130323b733a31333a22746c5f6e6577733a3a73697a65223b693a3130333b733a32303a22746c5f6e6577733a3a696d6167656d617267696e223b693a3130343b733a31373a22746c5f6e6577733a3a696d61676555726c223b693a3130353b733a31373a22746c5f6e6577733a3a66756c6c73697a65223b693a3130363b733a31363a22746c5f6e6577733a3a63617074696f6e223b693a3130373b733a31373a22746c5f6e6577733a3a666c6f6174696e67223b693a3130383b733a32313a22746c5f6e6577733a3a616464456e636c6f73757265223b693a3130393b733a31383a22746c5f6e6577733a3a656e636c6f73757265223b693a3131303b733a31383a22746c5f6e6577733a3a61727469636c654964223b693a3131313b733a31323a22746c5f6e6577733a3a75726c223b693a3131323b733a31353a22746c5f6e6577733a3a746172676574223b693a3131333b733a31393a22746c5f6e6577733a3a6e6f436f6d6d656e7473223b693a3131343b733a31383a22746c5f6e6577733a3a7075626c6973686564223b693a3131353b733a31343a22746c5f6e6577733a3a7374617274223b693a3131363b733a31333a22746c5f6e6577733a3a73746f70223b693a3131373b733a31393a22746c5f6e6577733a3a6e6577736c6574746572223b693a3131383b733a32313a22746c5f6e6577733a3a6c616e67756167654d61696e223b693a3131393b733a32323a22746c5f6e6577735f617263686976653a3a7469746c65223b693a3132303b733a32333a22746c5f6e6577735f617263686976653a3a6a756d70546f223b693a3132313b733a33303a22746c5f6e6577735f617263686976653a3a616c6c6f77436f6d6d656e7473223b693a3132323b733a32333a22746c5f6e6577735f617263686976653a3a6e6f74696679223b693a3132333b733a32363a22746c5f6e6577735f617263686976653a3a736f72744f72646572223b693a3132343b733a32343a22746c5f6e6577735f617263686976653a3a70657250616765223b693a3132353b733a32353a22746c5f6e6577735f617263686976653a3a6d6f646572617465223b693a3132363b733a32373a22746c5f6e6577735f617263686976653a3a6e6577736c6574746572223b693a3132373b733a33353a22746c5f6e6577735f617263686976653a3a6e6577736c65747465725f6368616e6e656c223b693a3132383b733a32333a22746c5f6e6577735f617263686976653a3a6d6173746572223b693a3132393b733a32323a22746c5f6e6577736c65747465723a3a7375626a656374223b693a3133303b733a32323a22746c5f6e6577736c65747465723a3a636f6e74656e74223b693a3133313b733a31393a22746c5f6e6577736c65747465723a3a74657874223b693a3133323b733a32323a22746c5f6e6577736c65747465723a3a61646446696c65223b693a3133333b733a32383a22746c5f6e6577736c65747465725f6368616e6e656c3a3a7469746c65223b693a3133343b733a31343a22746c5f706167653a3a7469746c65223b693a3133353b733a31383a22746c5f706167653a3a706167655469746c65223b693a3133363b733a32303a22746c5f706167653a3a6465736372697074696f6e223b693a3133373b733a32303a22746c5f706167653a3a7365727050726576696577223b693a3133383b733a32363a22746c5f707265766965775f6c696e6b3a3a7075626c6973686564223b7d, '', '', '', NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a363a2264656c657465223b7d, NULL, NULL, NULL, NULL, NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, 0x613a363a7b693a303b733a383a22686561646c696e65223b693a313b733a343a2274657874223b693a323b733a31353a226163636f7264696f6e53696e676c65223b693a333b733a393a2268797065726c696e6b223b693a343b733a353a22696d616765223b693a353b733a373a2267616c6c657279223b7d, 0x613a333a7b693a303b733a353a227061676573223b693a313b733a383a2261727469636c6573223b693a323b733a383a22636f6e74656e7473223b7d, 0x613a333a7b693a303b733a31313a2273616c65735f746f74616c223b693a313b733a31333a2273616c65735f70726f64756374223b693a323b733a31343a226d656d626572735f677565737473223b7d, NULL, NULL, NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0x613a333a7b693a303b733a313a2236223b693a313b733a313a2239223b693a323b733a313a2237223b7d, 0x613a323a7b693a303b733a31383a2272656c617465645f63617465676f72696573223b693a313b733a393a22696e74656772697479223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `tl_version`
--

CREATE TABLE `tl_version` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tstamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `fromTable` varchar(255) NOT NULL DEFAULT '',
  `userid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `editUrl` text DEFAULT NULL,
  `active` char(1) NOT NULL DEFAULT '',
  `data` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_version`
--

INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(1, 4, 1688845607, 1, 'tl_user', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'test', 'backend?do=user&rt=c86b9eb0050a6c15f0790b3a8b7.WvdIUYyucXxvjGQrGq_BnAj97FcvK4ugI7u1WibAE04.McMPObTcCEsf1T1IecmYxHm8qg9mb8_LYtn2bkSiexc8uQE65ZlHPw7-Cw&ref=Ce4JhsT9&act=edit&id=4', '', 0x613a38313a7b733a323a226964223b693a343b733a363a22747374616d70223b693a313638383834353630373b733a383a22757365726e616d65223b733a343a2274657374223b733a343a226e616d65223b733a343a2274657374223b733a353a22656d61696c223b733a31343a227465737440646f6d69616e2e6465223b733a383a226c616e6775616765223b733a323a226465223b733a31323a226261636b656e645468656d65223b733a383a22666c657869626c65223b733a31303a2266756c6c73637265656e223b733a303a22223b733a383a2275706c6f61646572223b733a383a2244726f705a6f6e65223b733a383a2273686f7748656c70223b733a313a2231223b733a31303a227468756d626e61696c73223b733a313a2231223b733a363a22757365525445223b733a313a2231223b733a353a227573654345223b733a313a2231223b733a383a2270617373776f7264223b733a303a22223b733a383a2270774368616e6765223b733a303a22223b733a353a2261646d696e223b733a313a2231223b733a363a2267726f757073223b4e3b733a373a22696e6865726974223b733a353a2267726f7570223b733a373a226d6f64756c6573223b4e3b733a363a227468656d6573223b4e3b733a383a22656c656d656e7473223b4e3b733a363a226669656c6473223b4e3b733a31303a22706167656d6f756e7473223b4e3b733a353a22616c707479223b733a36313a22613a333a7b693a303b733a373a22726567756c6172223b693a313b733a383a227265646972656374223b693a323b733a373a22666f7277617264223b7d223b733a31303a2266696c656d6f756e7473223b4e3b733a333a22666f70223b733a34353a22613a333a7b693a303b733a323a226631223b693a313b733a323a226632223b693a323b733a323a226633223b7d223b733a31303a22696d61676553697a6573223b4e3b733a353a22666f726d73223b4e3b733a353a22666f726d70223b4e3b733a333a22616d67223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a373a2273657373696f6e223b4e3b733a393a22646174654164646564223b693a313638383834353537303b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a343a2266617173223b4e3b733a343a2266617170223b4e3b733a343a226e657773223b4e3b733a343a226e657770223b4e3b733a393a226e6577736665656473223b4e3b733a393a226e6577736665656470223b4e3b733a393a2263616c656e64617273223b4e3b733a393a2263616c656e64617270223b4e3b733a31333a2263616c656e6461726665656473223b4e3b733a31333a2263616c656e6461726665656470223b4e3b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6577736c657474657270223b4e3b733a33313a22726f636b736f6c696446726f6e74656e6448656c7065724c69676874626f78223b733a313a2231223b733a32333a22726f636b736f6c696446726f6e74656e6448656c706572223b733a313a2231223b733a33383a22726f636b736f6c696446726f6e74656e6448656c706572436f6e74656e74456c656d656e7473223b4e3b733a33333a22726f636b736f6c696446726f6e74656e6448656c7065724f7065726174696f6e73223b4e3b733a31313a2269736f5f7265706f727473223b4e3b733a31373a2269736f5f6d656d6265725f67726f757073223b4e3b733a31303a2269736f5f67726f757070223b4e3b733a31303a2269736f5f67726f757073223b4e3b733a31313a2269736f5f636f6e66696770223b4e3b733a31313a2269736f5f636f6e66696773223b4e3b733a31333a2269736f5f7461785f7261746570223b4e3b733a31333a2269736f5f7461785f7261746573223b4e3b733a31343a2269736f5f7461785f636c61737370223b4e3b733a31353a2269736f5f7461785f636c6173736573223b4e3b733a32303a2269736f5f7368697070696e675f6d6f64756c6570223b4e3b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6570223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31373a2269736f5f70726f647563745f7479706570223b4e3b733a31373a2269736f5f70726f647563745f7479706573223b4e3b733a31313a2269736f5f6d6f64756c6573223b4e3b733a31383a22706167654c616e67756167654c6162656c73223b4e3b733a31313a2265745f62656d6f64526566223b733a303a22223b733a373a2265745f6d6f6465223b733a31313a22636f6e746578746d656e75223b733a31363a2265745f6163746976654d6f64756c6573223b4e3b733a393a2265745f656e61626c65223b733a303a22223b7d),
(2, 4, 1688845618, 2, 'tl_user', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'test', 'backend?do=user&rt=c86b9eb0050a6c15f0790b3a8b7.WvdIUYyucXxvjGQrGq_BnAj97FcvK4ugI7u1WibAE04.McMPObTcCEsf1T1IecmYxHm8qg9mb8_LYtn2bkSiexc8uQE65ZlHPw7-Cw&ref=Ce4JhsT9&act=edit&id=4', '1', 0x613a38313a7b733a323a226964223b693a343b733a363a22747374616d70223b693a313638383834353631383b733a383a22757365726e616d65223b733a343a2274657374223b733a343a226e616d65223b733a343a2274657374223b733a353a22656d61696c223b733a31343a227465737440646f6d69616e2e6465223b733a383a226c616e6775616765223b733a323a226465223b733a31323a226261636b656e645468656d65223b733a383a22666c657869626c65223b733a31303a2266756c6c73637265656e223b733a303a22223b733a383a2275706c6f61646572223b733a383a2244726f705a6f6e65223b733a383a2273686f7748656c70223b733a313a2231223b733a31303a227468756d626e61696c73223b733a313a2231223b733a363a22757365525445223b733a313a2231223b733a353a227573654345223b733a313a2231223b733a383a2270617373776f7264223b733a36303a222432792431332454546a587046455270426a526a506c6d4a63697267657868722e7975392e536b682f66424332792f77504e727a6c43774a466a696d223b733a383a2270774368616e6765223b733a303a22223b733a353a2261646d696e223b733a313a2231223b733a363a2267726f757073223b4e3b733a373a22696e6865726974223b733a353a2267726f7570223b733a373a226d6f64756c6573223b4e3b733a363a227468656d6573223b4e3b733a383a22656c656d656e7473223b4e3b733a363a226669656c6473223b4e3b733a31303a22706167656d6f756e7473223b4e3b733a353a22616c707479223b733a36313a22613a333a7b693a303b733a373a22726567756c6172223b693a313b733a383a227265646972656374223b693a323b733a373a22666f7277617264223b7d223b733a31303a2266696c656d6f756e7473223b4e3b733a333a22666f70223b733a34353a22613a333a7b693a303b733a323a226631223b693a313b733a323a226632223b693a323b733a323a226633223b7d223b733a31303a22696d61676553697a6573223b4e3b733a353a22666f726d73223b4e3b733a353a22666f726d70223b4e3b733a333a22616d67223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a373a2273657373696f6e223b4e3b733a393a22646174654164646564223b693a313638383834353537303b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a343a2266617173223b4e3b733a343a2266617170223b4e3b733a343a226e657773223b4e3b733a343a226e657770223b4e3b733a393a226e6577736665656473223b4e3b733a393a226e6577736665656470223b4e3b733a393a2263616c656e64617273223b4e3b733a393a2263616c656e64617270223b4e3b733a31333a2263616c656e6461726665656473223b4e3b733a31333a2263616c656e6461726665656470223b4e3b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6577736c657474657270223b4e3b733a33313a22726f636b736f6c696446726f6e74656e6448656c7065724c69676874626f78223b733a313a2231223b733a32333a22726f636b736f6c696446726f6e74656e6448656c706572223b733a313a2231223b733a33383a22726f636b736f6c696446726f6e74656e6448656c706572436f6e74656e74456c656d656e7473223b4e3b733a33333a22726f636b736f6c696446726f6e74656e6448656c7065724f7065726174696f6e73223b4e3b733a31313a2269736f5f7265706f727473223b4e3b733a31373a2269736f5f6d656d6265725f67726f757073223b4e3b733a31303a2269736f5f67726f757070223b4e3b733a31303a2269736f5f67726f757073223b4e3b733a31313a2269736f5f636f6e66696770223b4e3b733a31313a2269736f5f636f6e66696773223b4e3b733a31333a2269736f5f7461785f7261746570223b4e3b733a31333a2269736f5f7461785f7261746573223b4e3b733a31343a2269736f5f7461785f636c61737370223b4e3b733a31353a2269736f5f7461785f636c6173736573223b4e3b733a32303a2269736f5f7368697070696e675f6d6f64756c6570223b4e3b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6570223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31373a2269736f5f70726f647563745f7479706570223b4e3b733a31373a2269736f5f70726f647563745f7479706573223b4e3b733a31313a2269736f5f6d6f64756c6573223b4e3b733a31383a22706167654c616e67756167654c6162656c73223b4e3b733a31313a2265745f62656d6f64526566223b733a303a22223b733a373a2265745f6d6f6465223b733a31313a22636f6e746578746d656e75223b733a31363a2265745f6163746976654d6f64756c6573223b4e3b733a393a2265745f656e61626c65223b733a303a22223b7d),
(3, 1, 1688846133, 1, 'tl_layout', 0, NULL, 'base', 'backend?do=themes&id=1&table=tl_layout&act=edit&rt=9f6aa.5KRPNXQMNTITzC14UBUylIjdFST6Jp5Vc7tvxvMi6Ok.j5AIXUx-TAVjlXQbM3NrzPmcU3yzYto-Mtks8pFAgLCC6gZeHTsDcXK-Qg&ref=i-i2URSD', '1', 0x613a33393a7b733a323a226964223b693a313b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638313733363430323b733a343a226e616d65223b733a343a2262617365223b733a343a22726f7773223b733a333a22337277223b733a31323a22686561646572486569676874223b733a34333a22613a323a7b733a343a22756e6974223b733a303a22223b733a353a2276616c7565223b733a303a22223b7d223b733a31323a22666f6f746572486569676874223b733a34333a22613a323a7b733a343a22756e6974223b733a303a22223b733a353a2276616c7565223b733a303a22223b7d223b733a343a22636f6c73223b733a333a2231636c223b733a393a2277696474684c656674223b733a34333a22613a323a7b733a343a22756e6974223b733a303a22223b733a353a2276616c7565223b733a303a22223b7d223b733a31303a2277696474685269676874223b733a303a22223b733a383a2273656374696f6e73223b733a3131323a22613a313a7b693a303b613a343a7b733a353a227469746c65223b733a303a22223b733a323a226964223b733a303a22223b733a383a2274656d706c617465223b733a31333a22626c6f636b5f73656374696f6e223b733a383a22706f736974696f6e223b733a333a22746f70223b7d7d223b733a393a226672616d65776f726b223b733a303a22223b733a31303a227374796c657368656574223b4e3b733a383a2265787465726e616c223b733a3131383a22613a343a7b693a303b733a31363a226b6c4e73cd8c11edb7420242ac10ee0c223b693a313b733a31363a22a43e25e063a111edb8900242ac10ee0c223b693a323b733a31363a22a44a013363a111edb8900242ac10ee0c223b693a333b733a31363a22a42c9b0663a111edb8900242ac10ee0c223b7d223b733a31323a226c6f6164696e674f72646572223b733a31343a2265787465726e616c5f6669727374223b733a31343a22636f6d62696e6553637269707473223b733a313a2231223b733a373a226d6f64756c6573223b733a313136383a22613a31363a7b693a303b613a333a7b733a333a226d6f64223b733a313a2231223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a313b613a333a7b733a333a226d6f64223b733a313a2238223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a323b613a333a7b733a333a226d6f64223b733a313a2232223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a333b613a333a7b733a333a226d6f64223b733a323a223232223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a343b613a333a7b733a333a226d6f64223b733a323a223231223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a353b613a333a7b733a333a226d6f64223b733a313a2239223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a363b613a333a7b733a333a226d6f64223b733a323a223337223b733a333a22636f6c223b733a363a22686561646572223b733a363a22656e61626c65223b733a313a2231223b7d693a373b613a333a7b733a333a226d6f64223b733a313a2230223b733a333a22636f6c223b733a343a226d61696e223b733a363a22656e61626c65223b733a313a2231223b7d693a383b613a333a7b733a333a226d6f64223b733a313a2233223b733a333a22636f6c223b733a343a226d61696e223b733a363a22656e61626c65223b733a313a2231223b7d693a393b613a333a7b733a333a226d6f64223b733a323a223432223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31303b613a333a7b733a333a226d6f64223b733a323a223433223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31313b613a333a7b733a333a226d6f64223b733a313a2236223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31323b613a333a7b733a333a226d6f64223b733a313a2231223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31333b613a333a7b733a333a226d6f64223b733a313a2237223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31343b613a333a7b733a333a226d6f64223b733a323a223530223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d693a31353b613a333a7b733a333a226d6f64223b733a323a223533223b733a333a22636f6c223b733a363a22666f6f746572223b733a363a22656e61626c65223b733a313a2231223b7d7d223b733a383a2274656d706c617465223b733a373a2266655f70616765223b733a31323a226d696e6966794d61726b7570223b733a313a2231223b733a31323a226c69676874626f7853697a65223b733a33393a22613a333a7b693a303b733a303a22223b693a313b733a303a22223b693a323b733a303a22223b7d223b733a32313a2264656661756c74496d61676544656e736974696573223b733a303a22223b733a383a2276696577706f7274223b733a33373a2277696474683d6465766963652d77696474682c20696e697469616c2d7363616c653d312e30223b733a383a227469746c65546167223b733a303a22223b733a383a22637373436c617373223b733a303a22223b733a363a226f6e6c6f6164223b733a303a22223b733a343a2268656164223b733a3434303a223c6c696e6b2072656c3d226170706c652d746f7563682d69636f6e222073697a65733d22313830783138302220687265663d222f6170706c652d746f7563682d69636f6e2e706e67223e0a3c6c696e6b2072656c3d2269636f6e2220747970653d22696d6167652f706e67222073697a65733d2233327833322220687265663d222f66617669636f6e2d33327833322e706e67223e0a3c6c696e6b2072656c3d2269636f6e2220747970653d22696d6167652f706e67222073697a65733d2231367831362220687265663d222f66617669636f6e2d31367831362e706e67223e0a3c6c696e6b2072656c3d226d616e69666573742220687265663d222f736974652e7765626d616e6966657374223e0a3c6c696e6b2072656c3d226d61736b2d69636f6e2220687265663d222f7361666172692d70696e6e65642d7461622e7376672220636f6c6f723d2223313736393737223e0a3c6d657461206e616d653d226d736170706c69636174696f6e2d54696c65436f6c6f722220636f6e74656e743d2223313736393737223e0a3c6d657461206e616d653d227468656d652d636f6c6f722220636f6e74656e743d2223313736393737223e223b733a393a226164644a5175657279223b733a313a2231223b733a363a226a7175657279223b733a32383a22613a313a7b693a303b733a31303a226a5f636f6c6f72626f78223b7d223b733a31313a226164644d6f6f546f6f6c73223b733a303a22223b733a383a226d6f6f746f6f6c73223b4e3b733a393a22616e616c7974696373223b4e3b733a31303a2265787465726e616c4a73223b733a36323a22613a323a7b693a303b733a31363a2295215647642e11edb6390242ac10ee0c223b693a313b733a31363a226e889b7d690811edaa380242ac10ee0c223b7d223b733a373a2273637269707473223b733a32363a22613a313a7b693a303b733a393a226a735f736c69646572223b7d223b733a363a22736372697074223b4e3b733a363a22737461746963223b733a303a22223b733a353a227769647468223b733a303a22223b733a353a22616c69676e223b733a363a2263656e746572223b733a393a226e6577736665656473223b4e3b733a31333a2263616c656e6461726665656473223b4e3b7d),
(4, 1, 1688846158, 1, 'tl_page', 0, NULL, 'Clever Quiroz', 'backend?do=page&act=edit&id=1&rt=7231360cca8675739b9.MnFaLQ5nKa7I7Pc4nPsU5pS2VOW1y95_vlc3HqNBe3o.WUUdRTYVUJm4ta5b_51NvuX3Er38j5oU_zV0KsEjEyNUPxNGZ1Af7amemA&ref=wK8lQEnT', '1', 0x613a37353a7b733a323a226964223b693a313b733a333a22706964223b693a303b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638383736303530373b733a353a227469746c65223b733a31333a22436c6576657220517569726f7a223b733a343a2274797065223b733a343a22726f6f74223b733a353a22616c696173223b733a31303a227374617274706f696e74223b733a31313a22726571756972654974656d223b733a303a22223b733a31333a22726f7574655072696f72697479223b693a303b733a393a22706167655469746c65223b733a31333a22436c6576657220517569726f7a223b733a383a226c616e6775616765223b733a323a226465223b733a363a22726f626f7473223b733a31363a226e6f696e6465782c6e6f666f6c6c6f77223b733a31313a226465736372697074696f6e223b4e3b733a383a227265646972656374223b733a393a227065726d616e656e74223b733a363a226a756d70546f223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a333a2275726c223b733a303a22223b733a363a22746172676574223b733a303a22223b733a333a22646e73223b733a303a22223b733a31313a2273746174696346696c6573223b733a303a22223b733a31333a22737461746963506c7567696e73223b733a303a22223b733a383a2266616c6c6261636b223b733a313a2231223b733a32333a2264697361626c654c616e67756167655265646972656374223b733a303a22223b733a373a2266617669636f6e223b4e3b733a393a22726f626f7473547874223b4e3b733a31353a226d61696e74656e616e63654d6f6465223b733a303a22223b733a31353a226d61696c65725472616e73706f7274223b733a303a22223b733a31353a22656e61626c6543616e6f6e6963616c223b733a313a2231223b733a31333a2263616e6f6e6963616c4c696e6b223b733a303a22223b733a31393a2263616e6f6e6963616c4b656570506172616d73223b733a303a22223b733a31303a2261646d696e456d61696c223b733a303a22223b733a31303a2264617465466f726d6174223b733a303a22223b733a31303a2274696d65466f726d6174223b733a303a22223b733a31313a22646174696d466f726d6174223b733a303a22223b733a32303a2276616c6964416c69617343686172616374657273223b733a303a22223b733a31323a22757365466f6c64657255726c223b733a313a2231223b733a393a2275726c507265666978223b733a303a22223b733a393a2275726c537566666978223b733a303a22223b733a363a2275736553534c223b733a313a2231223b733a31313a226175746f666f7277617264223b733a303a22223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b733a31383a22613a313a7b693a303b733a313a2231223b7d223b733a31333a22696e636c7564654c61796f7574223b733a313a2231223b733a363a226c61796f7574223b693a313b733a31333a22737562706167654c61796f7574223b693a303b733a31323a22696e636c7564654361636865223b733a313a2231223b733a353a226361636865223b693a33313533363030303b733a31393a22616c776179734c6f616446726f6d4361636865223b733a303a22223b733a31313a22636c69656e744361636865223b693a3930303b733a31323a22696e636c75646543686d6f64223b733a313a2231223b733a353a226375736572223b693a333b733a363a226367726f7570223b693a323b733a353a2263686d6f64223b733a3133373a22613a31303a7b693a303b733a323a227531223b693a313b733a323a227532223b693a323b733a323a227533223b693a333b733a323a227534223b693a343b733a323a227535223b693a353b733a323a227536223b693a363b733a323a226731223b693a373b733a323a226734223b693a383b733a323a226735223b693a393b733a323a226736223b7d223b733a383a226e6f536561726368223b733a303a22223b733a383a22637373436c617373223b733a303a22223b733a373a22736974656d6170223b733a303a22223b733a343a2268696465223b733a303a22223b733a363a22677565737473223b733a303a22223b733a383a22746162696e646578223b693a303b733a393a226163636573736b6579223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a31363a22656e666f72636554776f466163746f72223b733a303a22223b733a31353a2274776f466163746f724a756d70546f223b693a303b733a31363a2269736f5f7265616465724a756d70546f223b693a303b733a31343a2269736f5f7265616465724d6f6465223b733a373a2263757272656e74223b733a31323a2269736f5f73746f72655f6964223b693a303b733a31303a2269736f5f636f6e666967223b693a313b733a31333a226c616e67756167655175657279223b733a303a22223b733a31323a226c616e6775616765526f6f74223b693a303b733a31323a226c616e67756167654d61696e223b693a303b733a31323a2265723234436c69656e744964223b733a303a22223b733a31303a2265723234536563726574223b733a303a22223b733a31303a22657232344170694b6579223b733a303a22223b7d),
(5, 9, 1688851899, 1, 'tl_iso_producttype', 0, NULL, 'Kollagen', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=9&rt=d42f08672230ddebd79d85babc50.u-qFFUIDry7vtp0bu85LsJ88ifB3uSeZJhn_zlJDXjM.0N7CfXpx1hmf78R42KgS6O59z6g-_WPyZ3u8-jAhNmrdpMx-KzSZbY7E8g&ref=Ug6KtTl4', '', 0x613a31393a7b733a323a226964223b693a393b733a363a22747374616d70223b693a313638323433323832303b733a343a226e616d65223b733a383a224b6f6c6c6167656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932313a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a303a22223b733a31383a2276617269616e745f61747472696275746573223b4e3b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a303a22223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(6, 9, 1688851913, 2, 'tl_iso_producttype', 4, 'test', 'Kollagen', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=9&rt=d42f08672230ddebd79d85babc50.u-qFFUIDry7vtp0bu85LsJ88ifB3uSeZJhn_zlJDXjM.0N7CfXpx1hmf78R42KgS6O59z6g-_WPyZ3u8-jAhNmrdpMx-KzSZbY7E8g&ref=Ug6KtTl4', '', 0x613a31393a7b733a323a226964223b693a393b733a363a22747374616d70223b693a313638383835313931333b733a343a226e616d65223b733a383a224b6f6c6c6167656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932313a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a313a2231223b733a31383a2276617269616e745f61747472696275746573223b4e3b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a303a22223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(7, 9, 1688851928, 3, 'tl_iso_producttype', 4, 'test', 'Karten', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=9&rt=d42f08672230ddebd79d85babc50.u-qFFUIDry7vtp0bu85LsJ88ifB3uSeZJhn_zlJDXjM.0N7CfXpx1hmf78R42KgS6O59z6g-_WPyZ3u8-jAhNmrdpMx-KzSZbY7E8g&ref=Ug6KtTl4', '1', 0x613a31393a7b733a323a226964223b693a393b733a363a22747374616d70223b693a313638383835313932383b733a343a226e616d65223b733a363a224b617274656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932313a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a313a2231223b733a31383a2276617269616e745f61747472696275746573223b733a343231383a22613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a363b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d223b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a303a22223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(8, 58, 1688851952, 1, 'tl_page', 0, NULL, 'Kollagen', 'backend?do=page&act=edit&id=58&rt=0dc791962.6JUguWV6OiwyVGYeweJ2WnMfHDkka9mWzSKDl5gzdxw.g6Fn0V0IQxtCDT99ooQvAgJeWmFtL539jEDAo_pRH0WO22nSDE0Mb1MmCQ&ref=Ieuhz_3Z', '', 0x613a37353a7b733a323a226964223b693a35383b733a333a22706964223b693a333b733a373a22736f7274696e67223b693a3139323b733a363a22747374616d70223b693a313638323433323130353b733a353a227469746c65223b733a383a224b6f6c6c6167656e223b733a343a2274797065223b733a373a22726567756c6172223b733a353a22616c696173223b733a31363a2267616c657269652f6b6f6c6c6167656e223b733a31313a22726571756972654974656d223b733a303a22223b733a31333a22726f7574655072696f72697479223b693a303b733a393a22706167655469746c65223b733a31323a224d65696e652042696c646572223b733a383a226c616e6775616765223b733a303a22223b733a363a22726f626f7473223b733a31363a226e6f696e6465782c6e6f666f6c6c6f77223b733a31313a226465736372697074696f6e223b733a3130333a22417566206d65696e6572205765627365697465207072c3a473656e746965726520696368206661737a696e696572656e6465204b756e73747765726b652c20646965206963682064757263682055706379636c696e67206765736368616666656e20686162652e223b733a383a227265646972656374223b733a393a227065726d616e656e74223b733a363a226a756d70546f223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a333a2275726c223b733a303a22223b733a363a22746172676574223b733a303a22223b733a333a22646e73223b733a303a22223b733a31313a2273746174696346696c6573223b733a303a22223b733a31333a22737461746963506c7567696e73223b733a303a22223b733a383a2266616c6c6261636b223b733a303a22223b733a32333a2264697361626c654c616e67756167655265646972656374223b733a303a22223b733a373a2266617669636f6e223b4e3b733a393a22726f626f7473547874223b4e3b733a31353a226d61696e74656e616e63654d6f6465223b733a303a22223b733a31353a226d61696c65725472616e73706f7274223b733a303a22223b733a31353a22656e61626c6543616e6f6e6963616c223b733a313a2231223b733a31333a2263616e6f6e6963616c4c696e6b223b733a303a22223b733a31393a2263616e6f6e6963616c4b656570506172616d73223b733a303a22223b733a31303a2261646d696e456d61696c223b733a303a22223b733a31303a2264617465466f726d6174223b733a303a22223b733a31303a2274696d65466f726d6174223b733a303a22223b733a31313a22646174696d466f726d6174223b733a303a22223b733a32303a2276616c6964416c69617343686172616374657273223b733a303a22223b733a31323a22757365466f6c64657255726c223b733a303a22223b733a393a2275726c507265666978223b733a303a22223b733a393a2275726c537566666978223b733a303a22223b733a363a2275736553534c223b733a303a22223b733a31313a226175746f666f7277617264223b733a303a22223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a31333a22696e636c7564654c61796f7574223b733a303a22223b733a363a226c61796f7574223b693a303b733a31333a22737562706167654c61796f7574223b693a303b733a31323a22696e636c7564654361636865223b733a303a22223b733a353a226361636865223b693a303b733a31393a22616c776179734c6f616446726f6d4361636865223b733a303a22223b733a31313a22636c69656e744361636865223b693a303b733a31323a22696e636c75646543686d6f64223b733a303a22223b733a353a226375736572223b693a333b733a363a226367726f7570223b693a303b733a353a2263686d6f64223b733a3133373a22613a31303a7b693a303b733a323a227531223b693a313b733a323a227532223b693a323b733a323a227533223b693a333b733a323a227534223b693a343b733a323a227535223b693a353b733a323a227536223b693a363b733a323a226731223b693a373b733a323a226734223b693a383b733a323a226735223b693a393b733a323a226736223b7d223b733a383a226e6f536561726368223b733a303a22223b733a383a22637373436c617373223b733a373a2267616c6c657279223b733a373a22736974656d6170223b733a31313a226d61705f64656661756c74223b733a343a2268696465223b733a303a22223b733a363a22677565737473223b733a303a22223b733a383a22746162696e646578223b693a303b733a393a226163636573736b6579223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a31363a22656e666f72636554776f466163746f72223b733a303a22223b733a31353a2274776f466163746f724a756d70546f223b693a303b733a31363a2269736f5f7265616465724a756d70546f223b693a31373b733a31343a2269736f5f7265616465724d6f6465223b733a373a2263757272656e74223b733a31323a2269736f5f73746f72655f6964223b693a303b733a31303a2269736f5f636f6e666967223b693a303b733a31333a226c616e67756167655175657279223b733a303a22223b733a31323a226c616e6775616765526f6f74223b693a303b733a31323a226c616e67756167654d61696e223b693a303b733a31323a2265723234436c69656e744964223b733a303a22223b733a31303a2265723234536563726574223b733a303a22223b733a31303a22657232344170694b6579223b733a303a22223b7d),
(9, 58, 1688851972, 2, 'tl_page', 4, 'test', 'Karten', 'backend?do=page&act=edit&id=58&rt=0dc791962.6JUguWV6OiwyVGYeweJ2WnMfHDkka9mWzSKDl5gzdxw.g6Fn0V0IQxtCDT99ooQvAgJeWmFtL539jEDAo_pRH0WO22nSDE0Mb1MmCQ&ref=Ieuhz_3Z', '1', 0x613a37353a7b733a323a226964223b693a35383b733a333a22706964223b693a333b733a373a22736f7274696e67223b693a3139323b733a363a22747374616d70223b693a313638383835313937323b733a353a227469746c65223b733a363a224b617274656e223b733a343a2274797065223b733a373a22726567756c6172223b733a353a22616c696173223b733a31343a2267616c657269652f6b617274656e223b733a31313a22726571756972654974656d223b733a303a22223b733a31333a22726f7574655072696f72697479223b693a303b733a393a22706167655469746c65223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a22726f626f7473223b733a31363a226e6f696e6465782c6e6f666f6c6c6f77223b733a31313a226465736372697074696f6e223b4e3b733a383a227265646972656374223b733a393a227065726d616e656e74223b733a363a226a756d70546f223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a333a2275726c223b733a303a22223b733a363a22746172676574223b733a303a22223b733a333a22646e73223b733a303a22223b733a31313a2273746174696346696c6573223b733a303a22223b733a31333a22737461746963506c7567696e73223b733a303a22223b733a383a2266616c6c6261636b223b733a303a22223b733a32333a2264697361626c654c616e67756167655265646972656374223b733a303a22223b733a373a2266617669636f6e223b4e3b733a393a22726f626f7473547874223b4e3b733a31353a226d61696e74656e616e63654d6f6465223b733a303a22223b733a31353a226d61696c65725472616e73706f7274223b733a303a22223b733a31353a22656e61626c6543616e6f6e6963616c223b733a313a2231223b733a31333a2263616e6f6e6963616c4c696e6b223b733a303a22223b733a31393a2263616e6f6e6963616c4b656570506172616d73223b733a303a22223b733a31303a2261646d696e456d61696c223b733a303a22223b733a31303a2264617465466f726d6174223b733a303a22223b733a31303a2274696d65466f726d6174223b733a303a22223b733a31313a22646174696d466f726d6174223b733a303a22223b733a32303a2276616c6964416c69617343686172616374657273223b733a303a22223b733a31323a22757365466f6c64657255726c223b733a303a22223b733a393a2275726c507265666978223b733a303a22223b733a393a2275726c537566666978223b733a303a22223b733a363a2275736553534c223b733a303a22223b733a31313a226175746f666f7277617264223b733a303a22223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a31333a22696e636c7564654c61796f7574223b733a303a22223b733a363a226c61796f7574223b693a303b733a31333a22737562706167654c61796f7574223b693a303b733a31323a22696e636c7564654361636865223b733a303a22223b733a353a226361636865223b693a303b733a31393a22616c776179734c6f616446726f6d4361636865223b733a303a22223b733a31313a22636c69656e744361636865223b693a303b733a31323a22696e636c75646543686d6f64223b733a303a22223b733a353a226375736572223b693a333b733a363a226367726f7570223b693a303b733a353a2263686d6f64223b733a3133373a22613a31303a7b693a303b733a323a227531223b693a313b733a323a227532223b693a323b733a323a227533223b693a333b733a323a227534223b693a343b733a323a227535223b693a353b733a323a227536223b693a363b733a323a226731223b693a373b733a323a226734223b693a383b733a323a226735223b693a393b733a323a226736223b7d223b733a383a226e6f536561726368223b733a303a22223b733a383a22637373436c617373223b733a373a2267616c6c657279223b733a373a22736974656d6170223b733a31313a226d61705f64656661756c74223b733a343a2268696465223b733a303a22223b733a363a22677565737473223b733a303a22223b733a383a22746162696e646578223b693a303b733a393a226163636573736b6579223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a31363a22656e666f72636554776f466163746f72223b733a303a22223b733a31353a2274776f466163746f724a756d70546f223b693a303b733a31363a2269736f5f7265616465724a756d70546f223b693a31373b733a31343a2269736f5f7265616465724d6f6465223b733a373a2263757272656e74223b733a31323a2269736f5f73746f72655f6964223b693a303b733a31303a2269736f5f636f6e666967223b693a303b733a31333a226c616e67756167655175657279223b733a303a22223b733a31323a226c616e6775616765526f6f74223b693a303b733a31323a226c616e67756167654d61696e223b693a303b733a31323a2265723234436c69656e744964223b733a303a22223b733a31303a2265723234536563726574223b733a303a22223b733a31303a22657232344170694b6579223b733a303a22223b7d),
(10, 89, 1688852176, 1, 'tl_iso_product', 0, NULL, 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=e.oDh9rt6IitGDdBs8a9k62Lu34aXwlpE5mDCLncguLP4.yww6xub68-bzLUJfCL9jgMr2p_250tVS2VLIqapMRKfGdjTFt7-8kuIGdA&ref=w5yQeV0s', '', 0x613a33383a7b733a323a226964223b693a38393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834383930333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383834363938353b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31373a2262696c642d322d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(11, 89, 1688852176, 1, 'tl_iso_product_category', 0, NULL, 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=e.oDh9rt6IitGDdBs8a9k62Lu34aXwlpE5mDCLncguLP4.yww6xub68-bzLUJfCL9jgMr2p_250tVS2VLIqapMRKfGdjTFt7-8kuIGdA&ref=w5yQeV0s', '', 0x613a303a7b7d),
(12, 89, 1688852184, 2, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=e.oDh9rt6IitGDdBs8a9k62Lu34aXwlpE5mDCLncguLP4.yww6xub68-bzLUJfCL9jgMr2p_250tVS2VLIqapMRKfGdjTFt7-8kuIGdA&ref=w5yQeV0s', '', 0x613a34303a7b733a323a226964223b693a38393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835323138343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383834363938353b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a363a22613a303a7b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31373a2262696c642d322d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(13, 89, 1688852184, 2, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=e.oDh9rt6IitGDdBs8a9k62Lu34aXwlpE5mDCLncguLP4.yww6xub68-bzLUJfCL9jgMr2p_250tVS2VLIqapMRKfGdjTFt7-8kuIGdA&ref=w5yQeV0s', '', 0x613a303a7b7d),
(14, 89, 1688852184, 2, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=e.oDh9rt6IitGDdBs8a9k62Lu34aXwlpE5mDCLncguLP4.yww6xub68-bzLUJfCL9jgMr2p_250tVS2VLIqapMRKfGdjTFt7-8kuIGdA&ref=w5yQeV0s', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35313b733a333a22706964223b693a38393b733a363a22747374616d70223b693a313638383835323138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35363b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638383835323138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(15, 89, 1688852265, 3, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=075505e664a637.rVa9WTbCRT9s0il00FwcLJriS2GNsTlcLAQnXQHTfIU.xmL6MQ6wPAgci3AXszpFdOujDTnE9X03bWZkaWOxFNzLGPQyX_VzfA2gRg&ref=MVHgJw2B', '', 0x613a34303a7b733a323a226964223b693a38393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835323236353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383834363938353b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31373a2262696c642d322d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36313b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(16, 89, 1688852265, 3, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=075505e664a637.rVa9WTbCRT9s0il00FwcLJriS2GNsTlcLAQnXQHTfIU.xmL6MQ6wPAgci3AXszpFdOujDTnE9X03bWZkaWOxFNzLGPQyX_VzfA2gRg&ref=MVHgJw2B', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36313b733a333a22706964223b693a38393b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383835323236353b733a373a22706167655f6964223b693a33323b7d7d),
(17, 89, 1688852265, 3, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=075505e664a637.rVa9WTbCRT9s0il00FwcLJriS2GNsTlcLAQnXQHTfIU.xmL6MQ6wPAgci3AXszpFdOujDTnE9X03bWZkaWOxFNzLGPQyX_VzfA2gRg&ref=MVHgJw2B', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35313b733a333a22706964223b693a38393b733a363a22747374616d70223b693a313638383835323138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35363b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638383835323138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(18, 89, 1688919359, 4, 'tl_iso_product', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=96.oXDQR8fIP8A82zO21GhOcq6LfFk_arZLWsMkTAjI6gk.ykSXL_-6RvdMgmrVtw4XKt_KOgF2LvIgG6FneGqqglDHPpksrv8Jg12pXA&ref=Ti2EJI-N', '', 0x613a34303a7b733a323a226964223b693a38393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393335393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383834363938353b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a33383a2262696c642d332d6e6f2d76617269616e74732d7175616e746974792d322d7265736572766564223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a35363a2242696c64203320262334303b6e6f2076617269616e74732c207175616e7469747920262336313b20322c205245534552564544262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36313b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(19, 89, 1688919359, 4, 'tl_iso_product_category', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=96.oXDQR8fIP8A82zO21GhOcq6LfFk_arZLWsMkTAjI6gk.ykSXL_-6RvdMgmrVtw4XKt_KOgF2LvIgG6FneGqqglDHPpksrv8Jg12pXA&ref=Ti2EJI-N', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36313b733a333a22706964223b693a38393b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383835323236353b733a373a22706167655f6964223b693a33323b7d7d),
(20, 89, 1688919359, 4, 'tl_iso_product_price', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=96.oXDQR8fIP8A82zO21GhOcq6LfFk_arZLWsMkTAjI6gk.ykSXL_-6RvdMgmrVtw4XKt_KOgF2LvIgG6FneGqqglDHPpksrv8Jg12pXA&ref=Ti2EJI-N', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35313b733a333a22706964223b693a38393b733a363a22747374616d70223b693a313638383835323138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35363b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638383835323138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(21, 89, 1688919382, 5, 'tl_iso_product', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=4c2.whVKmZu3tgYDlpkc5P6uCAgmAT5AHfSXPXIvWKEq-YE.qSEN8aPFzzFzz8B_h5j3UHlnR2YJWbD8fBBsbMNIkdikWwPy8oCARWLk9g&ref=VgGUf5f8', '', 0x613a34303a7b733a323a226964223b693a38393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393338323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383834363938353b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a33383a2262696c642d332d6e6f2d76617269616e74732d7175616e746974792d322d7265736572766564223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a35363a2242696c64203320262334303b6e6f2076617269616e74732c207175616e7469747920262336313b20322c205245534552564544262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36313b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(22, 89, 1688919382, 5, 'tl_iso_product_category', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=4c2.whVKmZu3tgYDlpkc5P6uCAgmAT5AHfSXPXIvWKEq-YE.qSEN8aPFzzFzz8B_h5j3UHlnR2YJWbD8fBBsbMNIkdikWwPy8oCARWLk9g&ref=VgGUf5f8', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36313b733a333a22706964223b693a38393b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383835323236353b733a373a22706167655f6964223b693a33323b7d7d),
(23, 89, 1688919382, 5, 'tl_iso_product_price', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=4c2.whVKmZu3tgYDlpkc5P6uCAgmAT5AHfSXPXIvWKEq-YE.qSEN8aPFzzFzz8B_h5j3UHlnR2YJWbD8fBBsbMNIkdikWwPy8oCARWLk9g&ref=VgGUf5f8', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35313b733a333a22706964223b693a38393b733a363a22747374616d70223b693a313638383835323138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35363b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638383835323138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(24, 98, 1688919638, 1, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=98&rt=a78a2c3e60f63b.LQWpduU16GHbT8y3lSUWcVga9fAXOUBYghcvEmkwcGg.RjHuHt1HkVarFpXU9kNPKSlbs6hefQQzw3VsJgtSGDFLS-AdjALeIro9ow&ref=6d3dEv9_', '', 0x613a33383a7b733a323a226964223b693a39383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393633383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a363a22613a303a7b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(25, 89, 1688919651, 6, 'tl_iso_product', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=23fa4eee8c6adf4c8df9.84J5dAfxpxFOcbyhgAHkLY195_adHDOww3uaUnPa6eI.mLY-HD-D3iY-KOXC42e9dfw8oa7UWHfbghnZZhG4gbuVzDAfbsaRUi8D0w&ref=Gu3Q_V2P', '1', 0x613a34303a7b733a323a226964223b693a38393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393635313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383834363938353b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a33383a2262696c642d332d6e6f2d76617269616e74732d7175616e746974792d322d7265736572766564223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303033223b733a343a226e616d65223b733a35363a2242696c64203320262334303b6e6f2076617269616e74732c207175616e7469747920262336313b20322c205245534552564544262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36313b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(26, 89, 1688919651, 6, 'tl_iso_product_category', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=23fa4eee8c6adf4c8df9.84J5dAfxpxFOcbyhgAHkLY195_adHDOww3uaUnPa6eI.mLY-HD-D3iY-KOXC42e9dfw8oa7UWHfbghnZZhG4gbuVzDAfbsaRUi8D0w&ref=Gu3Q_V2P', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36313b733a333a22706964223b693a38393b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383835323236353b733a373a22706167655f6964223b693a33323b7d7d),
(27, 89, 1688919651, 6, 'tl_iso_product_price', 4, 'test', 'Bild 3 &#40;no variants, quantity &#61; 2, RESERVED&#41;', 'backend?do=iso_products&act=edit&id=89&rt=23fa4eee8c6adf4c8df9.84J5dAfxpxFOcbyhgAHkLY195_adHDOww3uaUnPa6eI.mLY-HD-D3iY-KOXC42e9dfw8oa7UWHfbghnZZhG4gbuVzDAfbsaRUi8D0w&ref=Gu3Q_V2P', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35313b733a333a22706964223b693a38393b733a363a22747374616d70223b693a313638383835323138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35363b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638383835323138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(28, 98, 1688919638, 1, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=98&rt=a78a2c3e60f63b.LQWpduU16GHbT8y3lSUWcVga9fAXOUBYghcvEmkwcGg.RjHuHt1HkVarFpXU9kNPKSlbs6hefQQzw3VsJgtSGDFLS-AdjALeIro9ow&ref=6d3dEv9_', '', 0x613a303a7b7d),
(29, 98, 1688919659, 2, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=98&rt=f9c.Ak5aQDLZaDteMkgJmSgRYefhIjHI1cIFGcRTuKUzMW8.aXodKAqrEQwuaxFq-k5IOZagZGmBkYZuWKYQjMdRWTZkABMrW-5eeD9AJw&ref=RyEZF_1L', '', 0x613a34303a7b733a323a226964223b693a39383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393635393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a363a22613a303a7b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(30, 98, 1688919659, 2, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=98&rt=f9c.Ak5aQDLZaDteMkgJmSgRYefhIjHI1cIFGcRTuKUzMW8.aXodKAqrEQwuaxFq-k5IOZagZGmBkYZuWKYQjMdRWTZkABMrW-5eeD9AJw&ref=RyEZF_1L', '1', 0x613a303a7b7d),
(31, 98, 1688919659, 2, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=98&rt=f9c.Ak5aQDLZaDteMkgJmSgRYefhIjHI1cIFGcRTuKUzMW8.aXodKAqrEQwuaxFq-k5IOZagZGmBkYZuWKYQjMdRWTZkABMrW-5eeD9AJw&ref=RyEZF_1L', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35323b733a333a22706964223b693a39383b733a363a22747374616d70223b693a313638383931393633383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35373b733a333a22706964223b693a35323b733a363a22747374616d70223b693a313638383931393633383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(32, 98, 1688919700, 3, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=98&rt=bace4b157.6L26xx6xbPMmJp8GNrkn6C1QzcA8e0NL8AvK9FoDDy4.g4n9rybDFcRWf8ZlVd9-sFwRi5h1PwcgsWmJwDhhZ3eO8_Osd4ZasEdU8A&ref=2rgHGKOU', '1', 0x613a33383a7b733a323a226964223b693a39383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393730303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(33, 99, 1688919796, 1, 'tl_iso_product', 4, 'test', '', 'backend?do=iso_products&rt=56ad53a70ef9f4.rSJlFIdgXGvakEjY5tXqIKO1C55D7XseENX_NQ_iw_U.xhYifL8SJVyqyRG7hbOzeNL0TcYKqT91Ube8AW2Aq6zLbCx_7ldqKLviJw&ref=eVc08N7c&act=edit&id=99&s2e=1', '', 0x613a33393a7b733a323a226964223b693a39393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393739363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383931393739323b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a32363a22613a313a7b733a343a22756e6974223b733a323a226b67223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a303a7b7d7d),
(34, 99, 1688919796, 1, 'tl_iso_product_category', 4, 'test', '', 'backend?do=iso_products&rt=56ad53a70ef9f4.rSJlFIdgXGvakEjY5tXqIKO1C55D7XseENX_NQ_iw_U.xhYifL8SJVyqyRG7hbOzeNL0TcYKqT91Ube8AW2Aq6zLbCx_7ldqKLviJw&ref=eVc08N7c&act=edit&id=99&s2e=1', '1', 0x613a303a7b7d),
(35, 99, 1688919816, 2, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=56ad53a70ef9f4.rSJlFIdgXGvakEjY5tXqIKO1C55D7XseENX_NQ_iw_U.xhYifL8SJVyqyRG7hbOzeNL0TcYKqT91Ube8AW2Aq6zLbCx_7ldqKLviJw&ref=eVc08N7c&act=edit&id=99&s2e=1', '', 0x613a33383a7b733a323a226964223b693a39393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393831363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383931393739323b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(36, 99, 1688919823, 3, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=56ad53a70ef9f4.rSJlFIdgXGvakEjY5tXqIKO1C55D7XseENX_NQ_iw_U.xhYifL8SJVyqyRG7hbOzeNL0TcYKqT91Ube8AW2Aq6zLbCx_7ldqKLviJw&ref=eVc08N7c&act=edit&id=99&s2e=1', '', 0x613a33383a7b733a323a226964223b693a39393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393831363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383931393739323b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a34353a223c703e42696c64203220286e6f2076617269616e74732c207175616e7469747920262336313b2032293c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(37, 99, 1688919910, 4, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&state=1&rt=d4a2d78375fc3fc.LmJn1zmh8g90VsoTE5adel8eGSOEQMMHqTXLAvngFqI.RVYgvwHTizgED5NwcPDEIi5fX3vNBIds6FeINpuCfvtILC68UJbETBUkpQ&tid=99', '1', 0x613a33383a7b733a323a226964223b693a39393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383931393831363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383931393739323b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a34353a223c703e42696c64203220286e6f2076617269616e74732c207175616e7469747920262336313b2032293c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(38, 88, 1688920158, 1, 'tl_iso_product', 0, NULL, 'Bild 1 &#40;no variants, unlimited&#41;', 'backend?do=iso_products&act=edit&id=88&rt=d06.4rvzK_V6d_5XD9M64E1n6aNq3HjkFxmZUDM51x_KTG0.iY-0Q80IDsknVopZgys-sdIrmiCtU13yEVF6432oJDSE9bpAnE1BvTZ9vA&ref=KwthOrZv', '1', 0x613a33383a7b733a323a226964223b693a38383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834383930333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539333238333b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31343a2262696c642d756e6c696d69746564223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303031223b733a343a226e616d65223b733a33393a2242696c64203120262334303b6e6f2076617269616e74732c20756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420313c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(39, 88, 1688920158, 1, 'tl_iso_product_category', 0, NULL, 'Bild 1 &#40;no variants, unlimited&#41;', 'backend?do=iso_products&act=edit&id=88&rt=d06.4rvzK_V6d_5XD9M64E1n6aNq3HjkFxmZUDM51x_KTG0.iY-0Q80IDsknVopZgys-sdIrmiCtU13yEVF6432oJDSE9bpAnE1BvTZ9vA&ref=KwthOrZv', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36303b733a333a22706964223b693a38383b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638383539333332343b733a373a22706167655f6964223b693a33323b7d7d),
(40, 100, 1688920239, 1, 'tl_iso_product', 4, 'test', '', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a33393a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932303233393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a32363a22613a313a7b733a343a22756e6974223b733a323a226b67223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a303a7b7d7d),
(41, 100, 1688920239, 1, 'tl_iso_product_category', 4, 'test', '', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a303a7b7d),
(42, 100, 1688920258, 2, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a33383a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932303235383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(43, 100, 1688920265, 3, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a33383a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932303235383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a343a2242303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(44, 100, 1688920281, 4, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a34303a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932303238313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a343a2242303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(45, 100, 1688920281, 4, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a303a7b7d),
(46, 100, 1688920281, 4, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35343b733a333a22706964223b693a3130303b733a363a22747374616d70223b693a313638383932303235383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35393b733a333a22706964223b693a35343b733a363a22747374616d70223b693a313638383932303235383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(47, 100, 1688920284, 5, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a33383a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932303238343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a363a22613a303a7b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a343a2242303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(48, 100, 1688920302, 6, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a33383a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932303330323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a343a2242303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(49, 100, 1688921279, 7, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a34303a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932313237393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a343a2242303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36323b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(50, 100, 1688921279, 7, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36323b733a333a22706964223b693a3130303b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383932313237393b733a373a22706167655f6964223b693a35383b7d7d),
(51, 100, 1688921279, 7, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35343b733a333a22706964223b693a3130303b733a363a22747374616d70223b693a313638383932303235383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35393b733a333a22706964223b693a35343b733a363a22747374616d70223b693a313638383932303235383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(52, 100, 1688921291, 8, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a34303a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932313239313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a343a2242303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36323b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(53, 100, 1688921291, 8, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36323b733a333a22706964223b693a3130303b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383932313237393b733a373a22706167655f6964223b693a35383b7d7d),
(54, 100, 1688921291, 8, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35343b733a333a22706964223b693a3130303b733a363a22747374616d70223b693a313638383932303235383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35393b733a333a22706964223b693a35343b733a363a22747374616d70223b693a313638383932303235383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(55, 100, 1688921318, 9, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '1', 0x613a34303a7b733a323a226964223b693a3130303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383932313331373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383932303233363b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32393a2262696c642d322d6e6f2d76617269616e74732d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36333b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(56, 100, 1688921318, 9, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36333b733a333a22706964223b693a3130303b733a373a22736f7274696e67223b693a3338343b733a363a22747374616d70223b693a313638383932313331373b733a373a22706167655f6964223b693a33323b7d7d),
(57, 100, 1688921318, 9, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&rt=8a61e904.B21C-w0I9ikR48tfmmr43fb_j8Awt8mD0-Ef2jKrlV8.bFkFkzV6jx5hupI8-QyhhYe-yZh5843okoNc7lDJ_QZhIwuQZD_AanCRpA&ref=X9IexA-9&act=edit&id=100&s2e=1', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35343b733a333a22706964223b693a3130303b733a363a22747374616d70223b693a313638383932303235383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35393b733a333a22706964223b693a35343b733a363a22747374616d70223b693a313638383932303235383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(58, 31, 1688930934, 1, 'tl_iso_product', 0, NULL, 'Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a9703cf6c4fd8.LDeabTPbgCaKxUWnUHjgTbb-WFM-K6JZexMiDs5zArY.RwPdBQup-RH6nBzEMx65Fce_Hgt3b-YyOnFhOqwRau9KedMGWuy2Zeu3Kg&ref=jAyCa1KJ', '', 0x613a33383a7b733a323a226964223b693a33313b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393430333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037313337353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31303a22736b756c707475722d31223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303031223b733a343a226e616d65223b733a34323a22536b756c70747572203120262334303b756e6c696d697465642c20554e53454c4c41424c45262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31373a223c703e536b756c7074757220313c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223337223b733a353a227769647468223b733a323a223238223b733a363a22686569676874223b733a323a223234223b733a31363a22696e76656e746f72795f737461747573223b733a313a2231223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(59, 31, 1688930934, 1, 'tl_iso_product_category', 0, NULL, 'Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a9703cf6c4fd8.LDeabTPbgCaKxUWnUHjgTbb-WFM-K6JZexMiDs5zArY.RwPdBQup-RH6nBzEMx65Fce_Hgt3b-YyOnFhOqwRau9KedMGWuy2Zeu3Kg&ref=jAyCa1KJ', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313637393037323230373b733a373a22706167655f6964223b693a33333b7d7d),
(60, 31, 1688930940, 2, 'tl_iso_product', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a9703cf6c4fd8.LDeabTPbgCaKxUWnUHjgTbb-WFM-K6JZexMiDs5zArY.RwPdBQup-RH6nBzEMx65Fce_Hgt3b-YyOnFhOqwRau9KedMGWuy2Zeu3Kg&ref=jAyCa1KJ', '', 0x613a34303a7b733a323a226964223b693a33313b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933303934303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037313337353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31303a22736b756c707475722d31223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303031223b733a343a226e616d65223b733a33303a22536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31373a223c703e536b756c7074757220313c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223337223b733a353a227769647468223b733a323a223238223b733a363a22686569676874223b733a323a223234223b733a31363a22696e76656e746f72795f737461747573223b733a313a2231223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34373b7d733a353a227072696365223b733a343a22302e3030223b7d),
(61, 31, 1688930940, 2, 'tl_iso_product_category', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a9703cf6c4fd8.LDeabTPbgCaKxUWnUHjgTbb-WFM-K6JZexMiDs5zArY.RwPdBQup-RH6nBzEMx65Fce_Hgt3b-YyOnFhOqwRau9KedMGWuy2Zeu3Kg&ref=jAyCa1KJ', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313637393037323230373b733a373a22706167655f6964223b693a33333b7d7d),
(62, 31, 1688930940, 2, 'tl_iso_product_price', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a9703cf6c4fd8.LDeabTPbgCaKxUWnUHjgTbb-WFM-K6JZexMiDs5zArY.RwPdBQup-RH6nBzEMx65Fce_Hgt3b-YyOnFhOqwRau9KedMGWuy2Zeu3Kg&ref=jAyCa1KJ', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32333b733a333a22706964223b693a33313b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32333b733a333a22706964223b693a32333b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(63, 46, 1688930945, 1, 'tl_iso_product', 0, NULL, 'Variante Kopie von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=46&act=edit&rt=1669478fa6f43ca0898742a31381f9.vTsU8ONkXZCBEFs5hQPCCLDFV-VIy57S62cSCMShNXw.1g9TmNsWJKfxSQJa5mWbUMGEEb0Bj9q5qgVRPKbDXSXbdV2bilNr0-BiNA&ref=Z-niIXNB', '', 0x613a33383a7b733a323a226964223b693a34363b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393333373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33343a22613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36313a2256617269616e7465204b6f70696520766f6e20536b756c70747572203120262334303b756e6c696d697465642c20554e53454c4c41424c45262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2231223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a323b7d),
(64, 46, 1688930959, 2, 'tl_iso_product', 4, 'test', 'Variante Kopie von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=46&act=edit&rt=1669478fa6f43ca0898742a31381f9.vTsU8ONkXZCBEFs5hQPCCLDFV-VIy57S62cSCMShNXw.1g9TmNsWJKfxSQJa5mWbUMGEEb0Bj9q5qgVRPKbDXSXbdV2bilNr0-BiNA&ref=Z-niIXNB', '', 0x613a34303a7b733a323a226964223b693a34363b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933303935393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33343a22613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36313a2256617269616e7465204b6f70696520766f6e20536b756c70747572203120262334303b756e6c696d697465642c20554e53454c4c41424c45262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(65, 46, 1688930959, 2, 'tl_iso_product_category', 4, 'test', 'Variante Kopie von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=46&act=edit&rt=1669478fa6f43ca0898742a31381f9.vTsU8ONkXZCBEFs5hQPCCLDFV-VIy57S62cSCMShNXw.1g9TmNsWJKfxSQJa5mWbUMGEEb0Bj9q5qgVRPKbDXSXbdV2bilNr0-BiNA&ref=Z-niIXNB', '', 0x613a303a7b7d),
(66, 46, 1688930959, 2, 'tl_iso_product_price', 4, 'test', 'Variante Kopie von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=46&act=edit&rt=1669478fa6f43ca0898742a31381f9.vTsU8ONkXZCBEFs5hQPCCLDFV-VIy57S62cSCMShNXw.1g9TmNsWJKfxSQJa5mWbUMGEEb0Bj9q5qgVRPKbDXSXbdV2bilNr0-BiNA&ref=Z-niIXNB', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33363b733a333a22706964223b693a34363b733a363a22747374616d70223b693a313638323532373731313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33383b733a333a22706964223b693a33363b733a363a22747374616d70223b693a313638323532373731313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(67, 47, 1688930982, 1, 'tl_iso_product', 0, NULL, 'Variante Original von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=47&act=edit&rt=fb4cd422b5af8039c4a.MtHzv8IkE7RQRtyuAZWPIkk5o4RiRbucQIzNEQYkkJE.WeW01_pWaoMgH4XNYvPWejh45dwrAf_3Ae6OJWRG-MhUn7rUqxMl9zE0sw&ref=AOKZ000K', '', 0x613a33383a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393034353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36343a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203120262334303b756e6c696d697465642c20554e53454c4c41424c45262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2231223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a313b7d),
(68, 47, 1688930989, 2, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=47&act=edit&rt=fb4cd422b5af8039c4a.MtHzv8IkE7RQRtyuAZWPIkk5o4RiRbucQIzNEQYkkJE.WeW01_pWaoMgH4XNYvPWejh45dwrAf_3Ae6OJWRG-MhUn7rUqxMl9zE0sw&ref=AOKZ000K', '', 0x613a34303a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933303938393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36343a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203120262334303b756e6c696d697465642c20554e53454c4c41424c45262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(69, 47, 1688930989, 2, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=47&act=edit&rt=fb4cd422b5af8039c4a.MtHzv8IkE7RQRtyuAZWPIkk5o4RiRbucQIzNEQYkkJE.WeW01_pWaoMgH4XNYvPWejh45dwrAf_3Ae6OJWRG-MhUn7rUqxMl9zE0sw&ref=AOKZ000K', '', 0x613a303a7b7d),
(70, 47, 1688930989, 2, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', 'backend?do=iso_products&id=47&act=edit&rt=fb4cd422b5af8039c4a.MtHzv8IkE7RQRtyuAZWPIkk5o4RiRbucQIzNEQYkkJE.WeW01_pWaoMgH4XNYvPWejh45dwrAf_3Ae6OJWRG-MhUn7rUqxMl9zE0sw&ref=AOKZ000K', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33373b733a333a22706964223b693a34373b733a363a22747374616d70223b693a313638323533353233373b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33393b733a333a22706964223b693a33373b733a363a22747374616d70223b693a313638323533353233373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(71, 7, 1688931021, 1, 'tl_iso_producttype', 0, NULL, 'Skulpturen', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=7&rt=d2e4289.xuBpvCNKS6kIRmySn453Fj7I_NmxwwZMBkls6BS2F1w.rdQu1Bs4Mp54HzXx_OguTk-JuoH4h0InRysv3HbUfwWgriDXSn196mk0Aw&ref=01EXBxZZ', '', 0x613a31393a7b733a323a226964223b693a373b733a363a22747374616d70223b693a313638383537363631353b733a343a226e616d65223b733a31303a22536b756c70747572656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932303a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a313a2231223b733a31383a2276617269616e745f61747472696275746573223b733a343232343a22613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a31303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d223b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a313a2231223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(72, 7, 1688931029, 2, 'tl_iso_producttype', 4, 'test', 'Skulpturen', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=7&rt=d2e4289.xuBpvCNKS6kIRmySn453Fj7I_NmxwwZMBkls6BS2F1w.rdQu1Bs4Mp54HzXx_OguTk-JuoH4h0InRysv3HbUfwWgriDXSn196mk0Aw&ref=01EXBxZZ', '1', 0x613a31393a7b733a323a226964223b693a373b733a363a22747374616d70223b693a313638383933313032393b733a343a226e616d65223b733a31303a22536b756c70747572656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932303a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a313a2231223b733a31383a2276617269616e745f61747472696275746573223b733a343232353a22613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a31313b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d223b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a313a2231223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(73, 46, 1688931050, 3, 'tl_iso_product', 4, 'test', 'Variante Kopie von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=a56b0630c86fd66420c55d81d9bd.G8NS3cbjeVCTpoEjtP49GO2QWe9UyBPB3c11yGdwmlk.cPcVtf6RAGfj_9hA15hkQJzRH7cdjFeqnK82_AUS8gB9jRu2r9RPE_LU7g&ref=uCwbLAZp', '', 0x613a34303a7b733a323a226964223b693a34363b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933313035303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33343a22613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a34393a2256617269616e7465204b6f70696520766f6e20536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(74, 46, 1688931050, 3, 'tl_iso_product_category', 4, 'test', 'Variante Kopie von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=a56b0630c86fd66420c55d81d9bd.G8NS3cbjeVCTpoEjtP49GO2QWe9UyBPB3c11yGdwmlk.cPcVtf6RAGfj_9hA15hkQJzRH7cdjFeqnK82_AUS8gB9jRu2r9RPE_LU7g&ref=uCwbLAZp', '', 0x613a303a7b7d),
(75, 46, 1688931050, 3, 'tl_iso_product_price', 4, 'test', 'Variante Kopie von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=a56b0630c86fd66420c55d81d9bd.G8NS3cbjeVCTpoEjtP49GO2QWe9UyBPB3c11yGdwmlk.cPcVtf6RAGfj_9hA15hkQJzRH7cdjFeqnK82_AUS8gB9jRu2r9RPE_LU7g&ref=uCwbLAZp', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33363b733a333a22706964223b693a34363b733a363a22747374616d70223b693a313638323532373731313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33383b733a333a22706964223b693a33363b733a363a22747374616d70223b693a313638323532373731313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(76, 47, 1688931060, 3, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=47&act=edit&rt=e81.YgcjrFbQAraiLGtou6CAabACt_K7aVHPUTjsnqCHvnE.CTNkxG6ie4HSdTIL2MbZMcFD8aryLRWkEFqvqsLl1igESWrHP-c09cNeBA&ref=ZHnmaW81', '', 0x613a34303a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933313036303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(77, 47, 1688931060, 3, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=47&act=edit&rt=e81.YgcjrFbQAraiLGtou6CAabACt_K7aVHPUTjsnqCHvnE.CTNkxG6ie4HSdTIL2MbZMcFD8aryLRWkEFqvqsLl1igESWrHP-c09cNeBA&ref=ZHnmaW81', '', 0x613a303a7b7d),
(78, 47, 1688931060, 3, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=47&act=edit&rt=e81.YgcjrFbQAraiLGtou6CAabACt_K7aVHPUTjsnqCHvnE.CTNkxG6ie4HSdTIL2MbZMcFD8aryLRWkEFqvqsLl1igESWrHP-c09cNeBA&ref=ZHnmaW81', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33373b733a333a22706964223b693a34373b733a363a22747374616d70223b693a313638323533353233373b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33393b733a333a22706964223b693a33373b733a363a22747374616d70223b693a313638323533353233373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(79, 46, 1688931186, 4, 'tl_iso_product', 4, 'test', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=efda20d4e221682032aed332902.emVy_xUpQJ5CMkCN0HBa1LCYp3JJpI5Nf8sXKhA0Fac.EVE1ly1bOakyaxnusxYDjMHZ4SoA4MomPqlUHnJWff4cKzuUfB523SNALw&ref=QWcWwG96', '', 0x613a34303a7b733a323a226964223b693a34363b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933313138363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33343a22613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e746520262333343b4b6f706965262333343b20766f6e20536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(80, 46, 1688931186, 4, 'tl_iso_product_category', 4, 'test', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=efda20d4e221682032aed332902.emVy_xUpQJ5CMkCN0HBa1LCYp3JJpI5Nf8sXKhA0Fac.EVE1ly1bOakyaxnusxYDjMHZ4SoA4MomPqlUHnJWff4cKzuUfB523SNALw&ref=QWcWwG96', '', 0x613a303a7b7d),
(81, 46, 1688931186, 4, 'tl_iso_product_price', 4, 'test', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=efda20d4e221682032aed332902.emVy_xUpQJ5CMkCN0HBa1LCYp3JJpI5Nf8sXKhA0Fac.EVE1ly1bOakyaxnusxYDjMHZ4SoA4MomPqlUHnJWff4cKzuUfB523SNALw&ref=QWcWwG96', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33363b733a333a22706964223b693a34363b733a363a22747374616d70223b693a313638323532373731313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33383b733a333a22706964223b693a33363b733a363a22747374616d70223b693a313638323532373731313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(82, 47, 1688931197, 4, 'tl_iso_product', 4, 'test', 'Variante &#34;Original&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=47&act=edit&rt=20452fa6.5w_p_kmZGyB5vpcHFNRJHnwFZmFK6vtM3tvlpNRP9zo.jDuulnHrYhcJ585kd7IQRg1EIDkDrr8nn7mmkLYtn2OBQaCVIK4tYxjM-A&ref=9f6NIiIC', '1', 0x613a34303a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933313139373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e746520262333343b4f726967696e616c262333343b20766f6e20536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(83, 47, 1688931197, 4, 'tl_iso_product_category', 4, 'test', 'Variante &#34;Original&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=47&act=edit&rt=20452fa6.5w_p_kmZGyB5vpcHFNRJHnwFZmFK6vtM3tvlpNRP9zo.jDuulnHrYhcJ585kd7IQRg1EIDkDrr8nn7mmkLYtn2OBQaCVIK4tYxjM-A&ref=9f6NIiIC', '1', 0x613a303a7b7d),
(84, 47, 1688931197, 4, 'tl_iso_product_price', 4, 'test', 'Variante &#34;Original&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=47&act=edit&rt=20452fa6.5w_p_kmZGyB5vpcHFNRJHnwFZmFK6vtM3tvlpNRP9zo.jDuulnHrYhcJ585kd7IQRg1EIDkDrr8nn7mmkLYtn2OBQaCVIK4tYxjM-A&ref=9f6NIiIC', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33373b733a333a22706964223b693a34373b733a363a22747374616d70223b693a313638323533353233373b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33393b733a333a22706964223b693a33373b733a363a22747374616d70223b693a313638323533353233373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(85, 31, 1688931265, 3, 'tl_iso_product', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=544782d83cbc54ef5faa6d.lbGZCbNDqrAsCYA8i5jMrtd5ISjnOLyCBmhP5m7zCq4._oXeYYsx04dcUNlf6P6V9qY4Z3CufPjpRwoM0gyRYvfz_9Bi2nSc80177w&ref=rRAbowCu', '', 0x613a34303a7b733a323a226964223b693a33313b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933313236353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037313337353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31303a22736b756c707475722d31223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303031223b733a343a226e616d65223b733a33303a22536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31373a223c703e536b756c7074757220313c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223337223b733a353a227769647468223b733a323a223238223b733a363a22686569676874223b733a323a223234223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34373b7d733a353a227072696365223b733a343a22302e3030223b7d),
(86, 31, 1688931265, 3, 'tl_iso_product_category', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=544782d83cbc54ef5faa6d.lbGZCbNDqrAsCYA8i5jMrtd5ISjnOLyCBmhP5m7zCq4._oXeYYsx04dcUNlf6P6V9qY4Z3CufPjpRwoM0gyRYvfz_9Bi2nSc80177w&ref=rRAbowCu', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313637393037323230373b733a373a22706167655f6964223b693a33333b7d7d),
(87, 31, 1688931265, 3, 'tl_iso_product_price', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=544782d83cbc54ef5faa6d.lbGZCbNDqrAsCYA8i5jMrtd5ISjnOLyCBmhP5m7zCq4._oXeYYsx04dcUNlf6P6V9qY4Z3CufPjpRwoM0gyRYvfz_9Bi2nSc80177w&ref=rRAbowCu', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32333b733a333a22706964223b693a33313b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32333b733a333a22706964223b693a32333b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(88, 31, 1688931356, 4, 'tl_iso_product', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a8658eb03e70221d6c139d4b842b5f6c.H8z8gvsxVKtLQ6y1hsDuB5ucCyRjmUM8vqfp0iW8sw8.dPi76sNDLZw7GvXW5aa3X-rdTXwq3QdX_8Wq5kfe21Z5grXpkgZi6Coxww&ref=kR1QGLSO', '1', 0x613a34303a7b733a323a226964223b693a33313b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933313335363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037313337353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31303a22736b756c707475722d31223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303031223b733a343a226e616d65223b733a33303a22536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31373a223c703e536b756c7074757220313c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223337223b733a353a227769647468223b733a323a223238223b733a363a22686569676874223b733a323a223234223b733a31363a22696e76656e746f72795f737461747573223b733a313a2231223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34373b7d733a353a227072696365223b733a343a22302e3030223b7d),
(89, 31, 1688931356, 4, 'tl_iso_product_category', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a8658eb03e70221d6c139d4b842b5f6c.H8z8gvsxVKtLQ6y1hsDuB5ucCyRjmUM8vqfp0iW8sw8.dPi76sNDLZw7GvXW5aa3X-rdTXwq3QdX_8Wq5kfe21Z5grXpkgZi6Coxww&ref=kR1QGLSO', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34373b733a333a22706964223b693a33313b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313637393037323230373b733a373a22706167655f6964223b693a33333b7d7d),
(90, 31, 1688931356, 4, 'tl_iso_product_price', 4, 'test', 'Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&act=edit&id=31&rt=a8658eb03e70221d6c139d4b842b5f6c.H8z8gvsxVKtLQ6y1hsDuB5ucCyRjmUM8vqfp0iW8sw8.dPi76sNDLZw7GvXW5aa3X-rdTXwq3QdX_8Wq5kfe21Z5grXpkgZi6Coxww&ref=kR1QGLSO', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32333b733a333a22706964223b693a33313b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32333b733a333a22706964223b693a32333b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(91, 46, 1688931800, 5, 'tl_iso_product', 4, 'test', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=3d26a940e21c1bccb15cd4a19.-PNiX8UriGoR-lfoiL64O9Vq2jgesKj_ylpuo4PGnZA.k8clN_1Z8V1how6L69jhY6QrnGBX9OyUizgtl-Gk9cmevSs0rBy-KXCIOA&ref=-GQ_P_Om', '1', 0x613a34303a7b733a323a226964223b693a34363b733a333a22706964223b693a33313b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933313830303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e746520262333343b4b6f706965262333343b20766f6e20536b756c70747572203120262334303b756e6c696d69746564262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(92, 46, 1688931800, 5, 'tl_iso_product_category', 4, 'test', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=3d26a940e21c1bccb15cd4a19.-PNiX8UriGoR-lfoiL64O9Vq2jgesKj_ylpuo4PGnZA.k8clN_1Z8V1how6L69jhY6QrnGBX9OyUizgtl-Gk9cmevSs0rBy-KXCIOA&ref=-GQ_P_Om', '1', 0x613a303a7b7d),
(93, 46, 1688931800, 5, 'tl_iso_product_price', 4, 'test', 'Variante &#34;Kopie&#34; von Skulptur 1 &#40;unlimited&#41;', 'backend?do=iso_products&id=46&act=edit&rt=3d26a940e21c1bccb15cd4a19.-PNiX8UriGoR-lfoiL64O9Vq2jgesKj_ylpuo4PGnZA.k8clN_1Z8V1how6L69jhY6QrnGBX9OyUizgtl-Gk9cmevSs0rBy-KXCIOA&ref=-GQ_P_Om', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33363b733a333a22706964223b693a34363b733a363a22747374616d70223b693a313638323532373731313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33383b733a333a22706964223b693a33363b733a363a22747374616d70223b693a313638323532373731313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(94, 29, 1688931985, 1, 'tl_module', 0, NULL, 'Shop - Produktliste - aktive Kategorie - alle', 'backend?do=themes&id=29&table=tl_module&act=edit&rt=5d6688495c7aaa55c133340a71940d82.368pbfJbNsdiogwLVLF-tIEIvBU-qrTSXgIkqhXZ32c.tJtuBcopT_AS-1VoN9cn7PBJ-k137vC5H2Bnnne7tz654WAGm2wAhAPQYw&ref=mzr-_toY', '1', 0x613a3138363a7b733a323a226964223b693a32393b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638323434303736393b733a343a226e616d65223b733a34353a2253686f70202d2050726f64756b746c69737465202d20616b74697665204b617465676f726965202d20616c6c65223b733a383a22686561646c696e65223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226832223b733a353a2276616c7565223b733a303a22223b7d223b733a343a2274797065223b733a31353a2269736f5f70726f647563746c697374223b733a31313a226c6576656c4f6666736574223b693a303b733a393a2273686f774c6576656c223b693a303b733a393a22686172644c696d6974223b733a303a22223b733a31333a2273686f7750726f746563746564223b733a303a22223b733a31303a22646566696e65526f6f74223b733a303a22223b733a383a22726f6f7450616765223b693a303b733a31333a226e617669676174696f6e54706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a353a227061676573223b4e3b733a31303a2273686f7748696464656e223b733a303a22223b733a31313a22637573746f6d4c6162656c223b733a303a22223b733a393a226175746f6c6f67696e223b733a303a22223b733a363a226a756d70546f223b693a303b733a31323a226f7665727669657750616765223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a383a226564697461626c65223b4e3b733a393a226d656d62657254706c223b733a303a22223b733a343a22666f726d223b693a303b733a393a22717565727954797065223b733a333a22616e64223b733a353a2266757a7a79223b733a303a22223b733a31333a22636f6e746578744c656e677468223b733a303a22223b733a31363a226d696e4b6579776f72644c656e677468223b693a343b733a373a2270657250616765223b693a303b733a31303a2273656172636854797065223b733a363a2273696d706c65223b733a393a2273656172636854706c223b733a303a22223b733a383a22696e436f6c756d6e223b733a343a226d61696e223b733a393a22736b69704669727374223b693a303b733a393a226c6f61644669727374223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a2275726c223b4e3b733a373a22696d6753697a65223b733a303a22223b733a31303a2275736543617074696f6e223b733a303a22223b733a383a2266756c6c73697a65223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a343a2268746d6c223b4e3b733a393a227273735f6361636865223b693a333630303b733a383a227273735f66656564223b4e3b733a31323a227273735f74656d706c617465223b733a303a22223b733a31333a226e756d6265724f664974656d73223b693a303b733a31343a2264697361626c6543617074636861223b733a303a22223b733a31303a227265675f67726f757073223b4e3b733a31343a227265675f616c6c6f774c6f67696e223b733a303a22223b733a31323a227265675f736b69704e616d65223b733a303a22223b733a393a227265675f636c6f7365223b733a303a22223b733a31333a227265675f64656c657465446972223b733a303a22223b733a31333a227265675f61737369676e446972223b733a303a22223b733a31313a227265675f686f6d65446972223b4e3b733a31323a227265675f6163746976617465223b733a303a22223b733a31303a227265675f6a756d70546f223b693a303b733a383a227265675f74657874223b4e3b733a31323a227265675f70617373776f7264223b4e3b733a343a2264617461223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a34303a22613a323a7b693a303b733a31313a2270726f647563746c697374223b693a313b733a303a22223b7d223b733a32343a22726f6f7450616765446570656e64656e744d6f64756c6573223b4e3b733a31343a226661715f63617465676f72696573223b4e3b733a31363a226661715f7265616465724d6f64756c65223b693a303b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31333a226e6577735f6172636869766573223b4e3b733a31333a226e6577735f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31383a226e6577735f6a756d70546f43757272656e74223b733a303a22223b733a31373a226e6577735f7265616465724d6f64756c65223b693a303b733a31353a226e6577735f6d6574614669656c6473223b733a33383a22613a323a7b693a303b733a343a2264617465223b693a313b733a363a22617574686f72223b7d223b733a31333a226e6577735f74656d706c617465223b733a303a22223b733a31313a226e6577735f666f726d6174223b733a31303a226e6577735f6d6f6e7468223b733a31333a226e6577735f7374617274446179223b693a303b733a31303a226e6577735f6f72646572223b733a31353a226f726465725f646174655f64657363223b733a31373a226e6577735f73686f775175616e74697479223b733a303a22223b733a31303a226c6973745f7461626c65223b733a303a22223b733a31313a226c6973745f6669656c6473223b4e3b733a31303a226c6973745f7768657265223b4e3b733a31313a226c6973745f736561726368223b4e3b733a393a226c6973745f736f7274223b4e3b733a393a226c6973745f696e666f223b4e3b733a31353a226c6973745f696e666f5f7768657265223b4e3b733a31313a226c6973745f6c61796f7574223b733a303a22223b733a31363a226c6973745f696e666f5f6c61796f7574223b733a303a22223b733a31323a2263616c5f63616c656e646172223b4e3b733a31303a2263616c5f6e6f5370616e223b733a303a22223b733a31353a2263616c5f6869646552756e6e696e67223b733a303a22223b733a31323a2263616c5f7374617274446179223b693a313b733a31303a2263616c5f666f726d6174223b733a393a2263616c5f6d6f6e7468223b733a31373a2263616c5f69676e6f726544796e616d6963223b733a303a22223b733a393a2263616c5f6f72646572223b733a393a22617363656e64696e67223b733a31363a2263616c5f7265616465724d6f64756c65223b693a303b733a393a2263616c5f6c696d6974223b693a303b733a31323a2263616c5f74656d706c617465223b733a303a22223b733a31333a2263616c5f6374656d706c617465223b733a303a22223b733a31363a2263616c5f73686f775175616e74697479223b733a303a22223b733a31323a2263616c5f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6c5f6368616e6e656c73223b4e3b733a373a226e6c5f74657874223b4e3b733a31353a226e6c5f686964654368616e6e656c73223b733a303a22223b733a31323a226e6c5f737562736372696265223b4e3b733a31343a226e6c5f756e737562736372696265223b4e3b733a31313a226e6c5f74656d706c617465223b733a303a22223b733a31343a2269736f5f747370726f6475637473223b733a303a22223b733a31343a2269736f5f7473636865636b6f7574223b733a303a22223b733a31333a2269736f5f7473796f6666736574223b693a303b733a31353a2269736f5f7473646972656374696f6e223b733a303a22223b733a31333a2269736f5f7473646973706c6179223b733a383a227374616e64617264223b733a31333a2269736f5f747372657669657773223b733a313a2231223b733a383a2269736f5f74736964223b733a303a22223b733a31373a2269736f5f6e6f74696669636174696f6e73223b733a303a22223b733a31363a2269736f5f70726f647563746361636865223b4e3b733a31373a2269736f5f616464726573734669656c6473223b4e3b733a31313a2269736f5f61646472657373223b4e3b733a32303a2269736f5f636f6e74696e756553686f7070696e67223b733a303a22223b733a31393a2269736f5f696e636c7564654d65737361676573223b733a313a2231223b733a32323a2269736f5f72656c617465645f63617465676f72696573223b4e3b733a31313a2269736f5f627574746f6e73223b4e3b733a32343a2269736f5f6c697374696e67536f7274446972656374696f6e223b733a343a2244455343223b733a32303a2269736f5f6c697374696e67536f72744669656c64223b733a393a22646174654164646564223b733a31393a2269736f5f636865636b6f75745f6a756d70546f223b693a303b733a31353a2269736f5f636172745f6a756d70546f223b693a303b733a31313a2269736f5f70657250616765223b733a31303a22382c31322c33322c3634223b733a31353a2269736f5f656e61626c654c696d6974223b733a303a22223b733a31373a2269736f5f736f7274696e674669656c6473223b4e3b733a32323a2269736f5f7365617263684175746f636f6d706c657465223b733a303a22223b733a31353a2269736f5f7365617263684578616374223b4e3b733a31363a2269736f5f7365617263684669656c6473223b4e3b733a32303a2269736f5f66696c7465724869646553696e676c65223b733a303a22223b733a31333a2269736f5f6e657746696c746572223b733a383a2273686f775f616c6c223b733a31353a2269736f5f72616e67654669656c6473223b4e3b733a32303a2269736f5f63756d756c61746976654669656c6473223b4e3b733a31363a2269736f5f66696c7465724669656c6473223b4e3b733a31373a2269736f5f66696c7465724d6f64756c6573223b733a34353a22613a333a7b693a303b733a323a223332223b693a313b733a323a223334223b693a323b733a323a223430223b7d223b733a31343a2269736f5f6c6973745f7768657265223b733a303a22223b733a31383a2269736f5f63617465676f72795f73636f7065223b733a31363a2263757272656e745f63617465676f7279223b733a31323a2269736f5f6e6f46696c746572223b733a303a22223b733a31353a2269736f5f656d70747946696c746572223b733a303a22223b733a31343a2269736f5f6e6f50726f6475637473223b733a303a22223b733a31363a2269736f5f656d7074794d657373616765223b733a303a22223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a32303a2269736f5f616464546f41646472657373626f6f6b223b733a303a22223b733a32303a2269736f5f6f726465725f636f6e646974696f6e73223b4e3b733a32323a2269736f5f636865636b6f75745f736b69707061626c65223b4e3b733a31383a2269736f5f666f72776172645f726576696577223b733a303a22223b733a31393a226f72646572436f6d706c6574654a756d70546f223b693a303b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31343a2269736f5f636f6e6669675f696473223b4e3b733a31333a2269736f5f636f6e6669675f6964223b693a303b733a383a2269736f5f636f6c73223b693a303b733a31383a2269736f5f776973686c6973744a756d70546f223b693a303b733a32303a2269736f5f61646450726f647563744a756d70546f223b693a383b733a31373a2269736f5f6c6f67696e5265717569726564223b733a303a22223b733a31363a2269736f5f6c6f67696e5f6a756d70546f223b693a303b733a31393a2269736f5f636865636b6f75745f6d6574686f64223b733a363a226d656d626572223b733a31383a2269736f5f646973706c617934303450616765223b733a303a22223b733a31363a2269736f5f7573655f7175616e74697479223b733a303a22223b733a31393a2269736f5f64697361626c655f6f7074696f6e73223b733a303a22223b733a31333a2269736f5f686964655f6c697374223b733a313a2231223b733a31363a2269736f5f6c696e6b5f7072696d617279223b733a303a22223b733a31343a2269736f5f6a756d705f6669727374223b733a303a22223b733a31333a2269736f5f66696c74657254706c223b733a31383a2269736f5f66696c7465725f64656661756c74223b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a31313a2269736f5f67616c6c657279223b693a303b733a31373a2269736f5f7265616465725f6c61796f7574223b733a303a22223b733a31353a2269736f5f6c6973745f6c61796f7574223b733a31363a2269736f5f6c6973745f64656661756c74223b733a32363a226e635f61637469766174696f6e5f6e6f74696669636174696f6e223b693a303b733a31353a226e635f6e6f74696669636174696f6e223b693a303b733a31383a22637573746f6d4c616e677561676554657874223b4e3b733a31343a22637573746f6d4c616e6775616765223b733a303a22223b733a31343a22686964654e6f46616c6c6261636b223b733a303a22223b733a31383a22686964654163746976654c616e6775616765223b733a303a22223b733a31373a227265675f61637469766174654c6f67696e223b733a303a22223b733a31363a227265675f6175746f4163746976617465223b733a373a2264697361626c65223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(95, 32, 1688931997, 1, 'tl_module', 0, NULL, 'Shop - Produktfilter - Limit', 'backend?do=themes&id=32&table=tl_module&act=edit&rt=13b09729a1aab8128afb1901bda1f0.HajQViMJ7j_4TAZqU8sZlJ_f3T8SyKSa4uaofESRz98.dpyXPht7lwiIFV8JMK1AzO6em2dbjODxo4TrSCbzp4Z75pk9Sj7YfJk-aQ&ref=zuCwGGVD', '', 0x613a3138363a7b733a323a226964223b693a33323b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638323433343538323b733a343a226e616d65223b733a32383a2253686f70202d2050726f64756b7466696c746572202d204c696d6974223b733a383a22686561646c696e65223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226832223b733a353a2276616c7565223b733a303a22223b7d223b733a343a2274797065223b733a31373a2269736f5f70726f6475637466696c746572223b733a31313a226c6576656c4f6666736574223b693a303b733a393a2273686f774c6576656c223b693a303b733a393a22686172644c696d6974223b733a303a22223b733a31333a2273686f7750726f746563746564223b733a303a22223b733a31303a22646566696e65526f6f74223b733a303a22223b733a383a22726f6f7450616765223b693a303b733a31333a226e617669676174696f6e54706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a353a227061676573223b4e3b733a31303a2273686f7748696464656e223b733a303a22223b733a31313a22637573746f6d4c6162656c223b733a303a22223b733a393a226175746f6c6f67696e223b733a303a22223b733a363a226a756d70546f223b693a303b733a31323a226f7665727669657750616765223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a383a226564697461626c65223b4e3b733a393a226d656d62657254706c223b733a303a22223b733a343a22666f726d223b693a303b733a393a22717565727954797065223b733a333a22616e64223b733a353a2266757a7a79223b733a303a22223b733a31333a22636f6e746578744c656e677468223b733a303a22223b733a31363a226d696e4b6579776f72644c656e677468223b693a343b733a373a2270657250616765223b693a303b733a31303a2273656172636854797065223b733a363a2273696d706c65223b733a393a2273656172636854706c223b733a303a22223b733a383a22696e436f6c756d6e223b733a343a226d61696e223b733a393a22736b69704669727374223b693a303b733a393a226c6f61644669727374223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a2275726c223b4e3b733a373a22696d6753697a65223b733a303a22223b733a31303a2275736543617074696f6e223b733a303a22223b733a383a2266756c6c73697a65223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a343a2268746d6c223b4e3b733a393a227273735f6361636865223b693a333630303b733a383a227273735f66656564223b4e3b733a31323a227273735f74656d706c617465223b733a303a22223b733a31333a226e756d6265724f664974656d73223b693a333b733a31343a2264697361626c6543617074636861223b733a303a22223b733a31303a227265675f67726f757073223b4e3b733a31343a227265675f616c6c6f774c6f67696e223b733a303a22223b733a31323a227265675f736b69704e616d65223b733a303a22223b733a393a227265675f636c6f7365223b733a303a22223b733a31333a227265675f64656c657465446972223b733a303a22223b733a31333a227265675f61737369676e446972223b733a303a22223b733a31313a227265675f686f6d65446972223b4e3b733a31323a227265675f6163746976617465223b733a303a22223b733a31303a227265675f6a756d70546f223b693a303b733a383a227265675f74657874223b4e3b733a31323a227265675f70617373776f7264223b4e3b733a343a2264617461223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a33333a22613a323a7b693a303b733a303a22223b693a313b733a353a226c696d6974223b7d223b733a32343a22726f6f7450616765446570656e64656e744d6f64756c6573223b4e3b733a31343a226661715f63617465676f72696573223b4e3b733a31363a226661715f7265616465724d6f64756c65223b693a303b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31333a226e6577735f6172636869766573223b4e3b733a31333a226e6577735f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31383a226e6577735f6a756d70546f43757272656e74223b733a303a22223b733a31373a226e6577735f7265616465724d6f64756c65223b693a303b733a31353a226e6577735f6d6574614669656c6473223b733a33383a22613a323a7b693a303b733a343a2264617465223b693a313b733a363a22617574686f72223b7d223b733a31333a226e6577735f74656d706c617465223b733a303a22223b733a31313a226e6577735f666f726d6174223b733a31303a226e6577735f6d6f6e7468223b733a31333a226e6577735f7374617274446179223b693a303b733a31303a226e6577735f6f72646572223b733a31353a226f726465725f646174655f64657363223b733a31373a226e6577735f73686f775175616e74697479223b733a303a22223b733a31303a226c6973745f7461626c65223b733a303a22223b733a31313a226c6973745f6669656c6473223b4e3b733a31303a226c6973745f7768657265223b4e3b733a31313a226c6973745f736561726368223b4e3b733a393a226c6973745f736f7274223b4e3b733a393a226c6973745f696e666f223b4e3b733a31353a226c6973745f696e666f5f7768657265223b4e3b733a31313a226c6973745f6c61796f7574223b733a303a22223b733a31363a226c6973745f696e666f5f6c61796f7574223b733a303a22223b733a31323a2263616c5f63616c656e646172223b4e3b733a31303a2263616c5f6e6f5370616e223b733a303a22223b733a31353a2263616c5f6869646552756e6e696e67223b733a303a22223b733a31323a2263616c5f7374617274446179223b693a313b733a31303a2263616c5f666f726d6174223b733a393a2263616c5f6d6f6e7468223b733a31373a2263616c5f69676e6f726544796e616d6963223b733a303a22223b733a393a2263616c5f6f72646572223b733a393a22617363656e64696e67223b733a31363a2263616c5f7265616465724d6f64756c65223b693a303b733a393a2263616c5f6c696d6974223b693a303b733a31323a2263616c5f74656d706c617465223b733a303a22223b733a31333a2263616c5f6374656d706c617465223b733a303a22223b733a31363a2263616c5f73686f775175616e74697479223b733a303a22223b733a31323a2263616c5f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6c5f6368616e6e656c73223b4e3b733a373a226e6c5f74657874223b4e3b733a31353a226e6c5f686964654368616e6e656c73223b733a303a22223b733a31323a226e6c5f737562736372696265223b4e3b733a31343a226e6c5f756e737562736372696265223b4e3b733a31313a226e6c5f74656d706c617465223b733a303a22223b733a31343a2269736f5f747370726f6475637473223b733a303a22223b733a31343a2269736f5f7473636865636b6f7574223b733a303a22223b733a31333a2269736f5f7473796f6666736574223b693a303b733a31353a2269736f5f7473646972656374696f6e223b733a303a22223b733a31333a2269736f5f7473646973706c6179223b733a383a227374616e64617264223b733a31333a2269736f5f747372657669657773223b733a313a2231223b733a383a2269736f5f74736964223b733a303a22223b733a31373a2269736f5f6e6f74696669636174696f6e73223b733a303a22223b733a31363a2269736f5f70726f647563746361636865223b4e3b733a31373a2269736f5f616464726573734669656c6473223b4e3b733a31313a2269736f5f61646472657373223b4e3b733a32303a2269736f5f636f6e74696e756553686f7070696e67223b733a303a22223b733a31393a2269736f5f696e636c7564654d65737361676573223b733a313a2231223b733a32323a2269736f5f72656c617465645f63617465676f72696573223b4e3b733a31313a2269736f5f627574746f6e73223b733a32393a22613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d223b733a32343a2269736f5f6c697374696e67536f7274446972656374696f6e223b733a333a22415343223b733a32303a2269736f5f6c697374696e67536f72744669656c64223b733a333a22736b75223b733a31393a2269736f5f636865636b6f75745f6a756d70546f223b693a303b733a31353a2269736f5f636172745f6a756d70546f223b693a303b733a31313a2269736f5f70657250616765223b733a393a22322c352c31302c3135223b733a31353a2269736f5f656e61626c654c696d6974223b733a313a2231223b733a31373a2269736f5f736f7274696e674669656c6473223b4e3b733a32323a2269736f5f7365617263684175746f636f6d706c657465223b733a343a226e616d65223b733a31353a2269736f5f7365617263684578616374223b4e3b733a31363a2269736f5f7365617263684669656c6473223b4e3b733a32303a2269736f5f66696c7465724869646553696e676c65223b733a303a22223b733a31333a2269736f5f6e657746696c746572223b733a383a2273686f775f616c6c223b733a31353a2269736f5f72616e67654669656c6473223b4e3b733a32303a2269736f5f63756d756c61746976654669656c6473223b4e3b733a31363a2269736f5f66696c7465724669656c6473223b4e3b733a31373a2269736f5f66696c7465724d6f64756c6573223b4e3b733a31343a2269736f5f6c6973745f7768657265223b733a303a22223b733a31383a2269736f5f63617465676f72795f73636f7065223b733a31363a2263757272656e745f63617465676f7279223b733a31323a2269736f5f6e6f46696c746572223b733a303a22223b733a31353a2269736f5f656d70747946696c746572223b733a303a22223b733a31343a2269736f5f6e6f50726f6475637473223b733a303a22223b733a31363a2269736f5f656d7074794d657373616765223b733a303a22223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a32303a2269736f5f616464546f41646472657373626f6f6b223b733a303a22223b733a32303a2269736f5f6f726465725f636f6e646974696f6e73223b4e3b733a32323a2269736f5f636865636b6f75745f736b69707061626c65223b4e3b733a31383a2269736f5f666f72776172645f726576696577223b733a303a22223b733a31393a226f72646572436f6d706c6574654a756d70546f223b693a303b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31343a2269736f5f636f6e6669675f696473223b4e3b733a31333a2269736f5f636f6e6669675f6964223b693a303b733a383a2269736f5f636f6c73223b693a313b733a31383a2269736f5f776973686c6973744a756d70546f223b693a303b733a32303a2269736f5f61646450726f647563744a756d70546f223b693a303b733a31373a2269736f5f6c6f67696e5265717569726564223b733a303a22223b733a31363a2269736f5f6c6f67696e5f6a756d70546f223b693a303b733a31393a2269736f5f636865636b6f75745f6d6574686f64223b733a363a226d656d626572223b733a31383a2269736f5f646973706c617934303450616765223b733a303a22223b733a31363a2269736f5f7573655f7175616e74697479223b733a303a22223b733a31393a2269736f5f64697361626c655f6f7074696f6e73223b733a303a22223b733a31333a2269736f5f686964655f6c697374223b733a313a2231223b733a31363a2269736f5f6c696e6b5f7072696d617279223b733a303a22223b733a31343a2269736f5f6a756d705f6669727374223b733a303a22223b733a31333a2269736f5f66696c74657254706c223b733a31383a2269736f5f66696c7465725f64656661756c74223b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a31313a2269736f5f67616c6c657279223b693a303b733a31373a2269736f5f7265616465725f6c61796f7574223b733a303a22223b733a31353a2269736f5f6c6973745f6c61796f7574223b733a303a22223b733a32363a226e635f61637469766174696f6e5f6e6f74696669636174696f6e223b693a303b733a31353a226e635f6e6f74696669636174696f6e223b693a303b733a31383a22637573746f6d4c616e677561676554657874223b4e3b733a31343a22637573746f6d4c616e6775616765223b733a303a22223b733a31343a22686964654e6f46616c6c6261636b223b733a303a22223b733a31383a22686964654163746976654c616e6775616765223b733a303a22223b733a31373a227265675f61637469766174654c6f67696e223b733a303a22223b733a31363a227265675f6175746f4163746976617465223b733a373a2264697361626c65223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(96, 32, 1688932025, 2, 'tl_module', 4, 'test', 'Shop - Produktfilter - Limit', 'backend?do=themes&id=32&table=tl_module&act=edit&rt=13b09729a1aab8128afb1901bda1f0.HajQViMJ7j_4TAZqU8sZlJ_f3T8SyKSa4uaofESRz98.dpyXPht7lwiIFV8JMK1AzO6em2dbjODxo4TrSCbzp4Z75pk9Sj7YfJk-aQ&ref=zuCwGGVD', '', 0x613a3138363a7b733a323a226964223b693a33323b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638383933323032353b733a343a226e616d65223b733a32383a2253686f70202d2050726f64756b7466696c746572202d204c696d6974223b733a383a22686561646c696e65223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226832223b733a353a2276616c7565223b733a303a22223b7d223b733a343a2274797065223b733a31373a2269736f5f70726f6475637466696c746572223b733a31313a226c6576656c4f6666736574223b693a303b733a393a2273686f774c6576656c223b693a303b733a393a22686172644c696d6974223b733a303a22223b733a31333a2273686f7750726f746563746564223b733a303a22223b733a31303a22646566696e65526f6f74223b733a303a22223b733a383a22726f6f7450616765223b693a303b733a31333a226e617669676174696f6e54706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a353a227061676573223b4e3b733a31303a2273686f7748696464656e223b733a303a22223b733a31313a22637573746f6d4c6162656c223b733a303a22223b733a393a226175746f6c6f67696e223b733a303a22223b733a363a226a756d70546f223b693a303b733a31323a226f7665727669657750616765223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a383a226564697461626c65223b4e3b733a393a226d656d62657254706c223b733a303a22223b733a343a22666f726d223b693a303b733a393a22717565727954797065223b733a333a22616e64223b733a353a2266757a7a79223b733a303a22223b733a31333a22636f6e746578744c656e677468223b733a303a22223b733a31363a226d696e4b6579776f72644c656e677468223b693a343b733a373a2270657250616765223b693a303b733a31303a2273656172636854797065223b733a363a2273696d706c65223b733a393a2273656172636854706c223b733a303a22223b733a383a22696e436f6c756d6e223b733a343a226d61696e223b733a393a22736b69704669727374223b693a303b733a393a226c6f61644669727374223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a2275726c223b4e3b733a373a22696d6753697a65223b733a303a22223b733a31303a2275736543617074696f6e223b733a303a22223b733a383a2266756c6c73697a65223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a343a2268746d6c223b4e3b733a393a227273735f6361636865223b693a333630303b733a383a227273735f66656564223b4e3b733a31323a227273735f74656d706c617465223b733a303a22223b733a31333a226e756d6265724f664974656d73223b693a333b733a31343a2264697361626c6543617074636861223b733a303a22223b733a31303a227265675f67726f757073223b4e3b733a31343a227265675f616c6c6f774c6f67696e223b733a303a22223b733a31323a227265675f736b69704e616d65223b733a303a22223b733a393a227265675f636c6f7365223b733a303a22223b733a31333a227265675f64656c657465446972223b733a303a22223b733a31333a227265675f61737369676e446972223b733a303a22223b733a31313a227265675f686f6d65446972223b4e3b733a31323a227265675f6163746976617465223b733a303a22223b733a31303a227265675f6a756d70546f223b693a303b733a383a227265675f74657874223b4e3b733a31323a227265675f70617373776f7264223b4e3b733a343a2264617461223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a33333a22613a323a7b693a303b733a303a22223b693a313b733a353a226c696d6974223b7d223b733a32343a22726f6f7450616765446570656e64656e744d6f64756c6573223b4e3b733a31343a226661715f63617465676f72696573223b4e3b733a31363a226661715f7265616465724d6f64756c65223b693a303b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31333a226e6577735f6172636869766573223b4e3b733a31333a226e6577735f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31383a226e6577735f6a756d70546f43757272656e74223b733a303a22223b733a31373a226e6577735f7265616465724d6f64756c65223b693a303b733a31353a226e6577735f6d6574614669656c6473223b733a33383a22613a323a7b693a303b733a343a2264617465223b693a313b733a363a22617574686f72223b7d223b733a31333a226e6577735f74656d706c617465223b733a303a22223b733a31313a226e6577735f666f726d6174223b733a31303a226e6577735f6d6f6e7468223b733a31333a226e6577735f7374617274446179223b693a303b733a31303a226e6577735f6f72646572223b733a31353a226f726465725f646174655f64657363223b733a31373a226e6577735f73686f775175616e74697479223b733a303a22223b733a31303a226c6973745f7461626c65223b733a303a22223b733a31313a226c6973745f6669656c6473223b4e3b733a31303a226c6973745f7768657265223b4e3b733a31313a226c6973745f736561726368223b4e3b733a393a226c6973745f736f7274223b4e3b733a393a226c6973745f696e666f223b4e3b733a31353a226c6973745f696e666f5f7768657265223b4e3b733a31313a226c6973745f6c61796f7574223b733a303a22223b733a31363a226c6973745f696e666f5f6c61796f7574223b733a303a22223b733a31323a2263616c5f63616c656e646172223b4e3b733a31303a2263616c5f6e6f5370616e223b733a303a22223b733a31353a2263616c5f6869646552756e6e696e67223b733a303a22223b733a31323a2263616c5f7374617274446179223b693a313b733a31303a2263616c5f666f726d6174223b733a393a2263616c5f6d6f6e7468223b733a31373a2263616c5f69676e6f726544796e616d6963223b733a303a22223b733a393a2263616c5f6f72646572223b733a393a22617363656e64696e67223b733a31363a2263616c5f7265616465724d6f64756c65223b693a303b733a393a2263616c5f6c696d6974223b693a303b733a31323a2263616c5f74656d706c617465223b733a303a22223b733a31333a2263616c5f6374656d706c617465223b733a303a22223b733a31363a2263616c5f73686f775175616e74697479223b733a303a22223b733a31323a2263616c5f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6c5f6368616e6e656c73223b4e3b733a373a226e6c5f74657874223b4e3b733a31353a226e6c5f686964654368616e6e656c73223b733a303a22223b733a31323a226e6c5f737562736372696265223b4e3b733a31343a226e6c5f756e737562736372696265223b4e3b733a31313a226e6c5f74656d706c617465223b733a303a22223b733a31343a2269736f5f747370726f6475637473223b733a303a22223b733a31343a2269736f5f7473636865636b6f7574223b733a303a22223b733a31333a2269736f5f7473796f6666736574223b693a303b733a31353a2269736f5f7473646972656374696f6e223b733a303a22223b733a31333a2269736f5f7473646973706c6179223b733a383a227374616e64617264223b733a31333a2269736f5f747372657669657773223b733a313a2231223b733a383a2269736f5f74736964223b733a303a22223b733a31373a2269736f5f6e6f74696669636174696f6e73223b733a303a22223b733a31363a2269736f5f70726f647563746361636865223b4e3b733a31373a2269736f5f616464726573734669656c6473223b4e3b733a31313a2269736f5f61646472657373223b4e3b733a32303a2269736f5f636f6e74696e756553686f7070696e67223b733a303a22223b733a31393a2269736f5f696e636c7564654d65737361676573223b733a313a2231223b733a32323a2269736f5f72656c617465645f63617465676f72696573223b4e3b733a31313a2269736f5f627574746f6e73223b733a32393a22613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d223b733a32343a2269736f5f6c697374696e67536f7274446972656374696f6e223b733a333a22415343223b733a32303a2269736f5f6c697374696e67536f72744669656c64223b733a333a22736b75223b733a31393a2269736f5f636865636b6f75745f6a756d70546f223b693a303b733a31353a2269736f5f636172745f6a756d70546f223b693a303b733a31313a2269736f5f70657250616765223b733a31323a2231302c322c352c31302c3135223b733a31353a2269736f5f656e61626c654c696d6974223b733a313a2231223b733a31373a2269736f5f736f7274696e674669656c6473223b4e3b733a32323a2269736f5f7365617263684175746f636f6d706c657465223b733a343a226e616d65223b733a31353a2269736f5f7365617263684578616374223b4e3b733a31363a2269736f5f7365617263684669656c6473223b4e3b733a32303a2269736f5f66696c7465724869646553696e676c65223b733a303a22223b733a31333a2269736f5f6e657746696c746572223b733a383a2273686f775f616c6c223b733a31353a2269736f5f72616e67654669656c6473223b4e3b733a32303a2269736f5f63756d756c61746976654669656c6473223b4e3b733a31363a2269736f5f66696c7465724669656c6473223b4e3b733a31373a2269736f5f66696c7465724d6f64756c6573223b4e3b733a31343a2269736f5f6c6973745f7768657265223b733a303a22223b733a31383a2269736f5f63617465676f72795f73636f7065223b733a31363a2263757272656e745f63617465676f7279223b733a31323a2269736f5f6e6f46696c746572223b733a303a22223b733a31353a2269736f5f656d70747946696c746572223b733a303a22223b733a31343a2269736f5f6e6f50726f6475637473223b733a303a22223b733a31363a2269736f5f656d7074794d657373616765223b733a303a22223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a32303a2269736f5f616464546f41646472657373626f6f6b223b733a303a22223b733a32303a2269736f5f6f726465725f636f6e646974696f6e73223b4e3b733a32323a2269736f5f636865636b6f75745f736b69707061626c65223b4e3b733a31383a2269736f5f666f72776172645f726576696577223b733a303a22223b733a31393a226f72646572436f6d706c6574654a756d70546f223b693a303b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31343a2269736f5f636f6e6669675f696473223b4e3b733a31333a2269736f5f636f6e6669675f6964223b693a303b733a383a2269736f5f636f6c73223b693a313b733a31383a2269736f5f776973686c6973744a756d70546f223b693a303b733a32303a2269736f5f61646450726f647563744a756d70546f223b693a303b733a31373a2269736f5f6c6f67696e5265717569726564223b733a303a22223b733a31363a2269736f5f6c6f67696e5f6a756d70546f223b693a303b733a31393a2269736f5f636865636b6f75745f6d6574686f64223b733a363a226d656d626572223b733a31383a2269736f5f646973706c617934303450616765223b733a303a22223b733a31363a2269736f5f7573655f7175616e74697479223b733a303a22223b733a31393a2269736f5f64697361626c655f6f7074696f6e73223b733a303a22223b733a31333a2269736f5f686964655f6c697374223b733a313a2231223b733a31363a2269736f5f6c696e6b5f7072696d617279223b733a303a22223b733a31343a2269736f5f6a756d705f6669727374223b733a303a22223b733a31333a2269736f5f66696c74657254706c223b733a31383a2269736f5f66696c7465725f64656661756c74223b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a31313a2269736f5f67616c6c657279223b693a303b733a31373a2269736f5f7265616465725f6c61796f7574223b733a303a22223b733a31353a2269736f5f6c6973745f6c61796f7574223b733a303a22223b733a32363a226e635f61637469766174696f6e5f6e6f74696669636174696f6e223b693a303b733a31353a226e635f6e6f74696669636174696f6e223b693a303b733a31383a22637573746f6d4c616e677561676554657874223b4e3b733a31343a22637573746f6d4c616e6775616765223b733a303a22223b733a31343a22686964654e6f46616c6c6261636b223b733a303a22223b733a31383a22686964654163746976654c616e6775616765223b733a303a22223b733a31373a227265675f61637469766174654c6f67696e223b733a303a22223b733a31363a227265675f6175746f4163746976617465223b733a373a2264697361626c65223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(97, 52, 1688932040, 1, 'tl_module', 0, NULL, 'Shop - Produktliste - aktive Kategorie - alle &#40;sm&#41;', 'backend?do=themes&id=52&table=tl_module&act=edit&rt=ee86c3edca7c.KxNWRFIsm9ULc5c0Eas92ERsDQ7fMqZS9xuiSK7A_M0.QCcRLGpe4uJ7Ks5Xcs1kgDUtS1aWduI5tnnhfMyilJRNXR8vOxutlmoB-A&ref=xCV14SKl', '1', 0x613a3138363a7b733a323a226964223b693a35323b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638323433343434353b733a343a226e616d65223b733a35383a2253686f70202d2050726f64756b746c69737465202d20616b74697665204b617465676f726965202d20616c6c6520262334303b736d262334313b223b733a383a22686561646c696e65223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226832223b733a353a2276616c7565223b733a303a22223b7d223b733a343a2274797065223b733a31353a2269736f5f70726f647563746c697374223b733a31313a226c6576656c4f6666736574223b693a303b733a393a2273686f774c6576656c223b693a303b733a393a22686172644c696d6974223b733a303a22223b733a31333a2273686f7750726f746563746564223b733a303a22223b733a31303a22646566696e65526f6f74223b733a303a22223b733a383a22726f6f7450616765223b693a303b733a31333a226e617669676174696f6e54706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a353a227061676573223b4e3b733a31303a2273686f7748696464656e223b733a303a22223b733a31313a22637573746f6d4c6162656c223b733a303a22223b733a393a226175746f6c6f67696e223b733a303a22223b733a363a226a756d70546f223b693a303b733a31323a226f7665727669657750616765223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a383a226564697461626c65223b4e3b733a393a226d656d62657254706c223b733a303a22223b733a343a22666f726d223b693a303b733a393a22717565727954797065223b733a333a22616e64223b733a353a2266757a7a79223b733a303a22223b733a31333a22636f6e746578744c656e677468223b733a303a22223b733a31363a226d696e4b6579776f72644c656e677468223b693a343b733a373a2270657250616765223b693a313b733a31303a2273656172636854797065223b733a363a2273696d706c65223b733a393a2273656172636854706c223b733a303a22223b733a383a22696e436f6c756d6e223b733a343a226d61696e223b733a393a22736b69704669727374223b693a303b733a393a226c6f61644669727374223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a2275726c223b4e3b733a373a22696d6753697a65223b733a303a22223b733a31303a2275736543617074696f6e223b733a303a22223b733a383a2266756c6c73697a65223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a343a2268746d6c223b4e3b733a393a227273735f6361636865223b693a333630303b733a383a227273735f66656564223b4e3b733a31323a227273735f74656d706c617465223b733a303a22223b733a31333a226e756d6265724f664974656d73223b693a303b733a31343a2264697361626c6543617074636861223b733a303a22223b733a31303a227265675f67726f757073223b4e3b733a31343a227265675f616c6c6f774c6f67696e223b733a303a22223b733a31323a227265675f736b69704e616d65223b733a303a22223b733a393a227265675f636c6f7365223b733a303a22223b733a31333a227265675f64656c657465446972223b733a303a22223b733a31333a227265675f61737369676e446972223b733a303a22223b733a31313a227265675f686f6d65446972223b4e3b733a31323a227265675f6163746976617465223b733a303a22223b733a31303a227265675f6a756d70546f223b693a303b733a383a227265675f74657874223b4e3b733a31323a227265675f70617373776f7264223b4e3b733a343a2264617461223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a34323a22613a323a7b693a303b733a31313a2270726f647563746c697374223b693a313b733a323a22736d223b7d223b733a32343a22726f6f7450616765446570656e64656e744d6f64756c6573223b4e3b733a31343a226661715f63617465676f72696573223b4e3b733a31363a226661715f7265616465724d6f64756c65223b693a303b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31333a226e6577735f6172636869766573223b4e3b733a31333a226e6577735f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31383a226e6577735f6a756d70546f43757272656e74223b733a303a22223b733a31373a226e6577735f7265616465724d6f64756c65223b693a303b733a31353a226e6577735f6d6574614669656c6473223b733a33383a22613a323a7b693a303b733a343a2264617465223b693a313b733a363a22617574686f72223b7d223b733a31333a226e6577735f74656d706c617465223b733a303a22223b733a31313a226e6577735f666f726d6174223b733a31303a226e6577735f6d6f6e7468223b733a31333a226e6577735f7374617274446179223b693a303b733a31303a226e6577735f6f72646572223b733a31353a226f726465725f646174655f64657363223b733a31373a226e6577735f73686f775175616e74697479223b733a303a22223b733a31303a226c6973745f7461626c65223b733a303a22223b733a31313a226c6973745f6669656c6473223b4e3b733a31303a226c6973745f7768657265223b4e3b733a31313a226c6973745f736561726368223b4e3b733a393a226c6973745f736f7274223b4e3b733a393a226c6973745f696e666f223b4e3b733a31353a226c6973745f696e666f5f7768657265223b4e3b733a31313a226c6973745f6c61796f7574223b733a303a22223b733a31363a226c6973745f696e666f5f6c61796f7574223b733a303a22223b733a31323a2263616c5f63616c656e646172223b4e3b733a31303a2263616c5f6e6f5370616e223b733a303a22223b733a31353a2263616c5f6869646552756e6e696e67223b733a303a22223b733a31323a2263616c5f7374617274446179223b693a313b733a31303a2263616c5f666f726d6174223b733a393a2263616c5f6d6f6e7468223b733a31373a2263616c5f69676e6f726544796e616d6963223b733a303a22223b733a393a2263616c5f6f72646572223b733a393a22617363656e64696e67223b733a31363a2263616c5f7265616465724d6f64756c65223b693a303b733a393a2263616c5f6c696d6974223b693a303b733a31323a2263616c5f74656d706c617465223b733a303a22223b733a31333a2263616c5f6374656d706c617465223b733a303a22223b733a31363a2263616c5f73686f775175616e74697479223b733a303a22223b733a31323a2263616c5f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6c5f6368616e6e656c73223b4e3b733a373a226e6c5f74657874223b4e3b733a31353a226e6c5f686964654368616e6e656c73223b733a303a22223b733a31323a226e6c5f737562736372696265223b4e3b733a31343a226e6c5f756e737562736372696265223b4e3b733a31313a226e6c5f74656d706c617465223b733a303a22223b733a31343a2269736f5f747370726f6475637473223b733a303a22223b733a31343a2269736f5f7473636865636b6f7574223b733a303a22223b733a31333a2269736f5f7473796f6666736574223b693a303b733a31353a2269736f5f7473646972656374696f6e223b733a303a22223b733a31333a2269736f5f7473646973706c6179223b733a383a227374616e64617264223b733a31333a2269736f5f747372657669657773223b733a313a2231223b733a383a2269736f5f74736964223b733a303a22223b733a31373a2269736f5f6e6f74696669636174696f6e73223b733a303a22223b733a31363a2269736f5f70726f647563746361636865223b4e3b733a31373a2269736f5f616464726573734669656c6473223b4e3b733a31313a2269736f5f61646472657373223b4e3b733a32303a2269736f5f636f6e74696e756553686f7070696e67223b733a303a22223b733a31393a2269736f5f696e636c7564654d65737361676573223b733a303a22223b733a32323a2269736f5f72656c617465645f63617465676f72696573223b4e3b733a31313a2269736f5f627574746f6e73223b4e3b733a32343a2269736f5f6c697374696e67536f7274446972656374696f6e223b733a343a2244455343223b733a32303a2269736f5f6c697374696e67536f72744669656c64223b733a393a22646174654164646564223b733a31393a2269736f5f636865636b6f75745f6a756d70546f223b693a303b733a31353a2269736f5f636172745f6a756d70546f223b693a303b733a31313a2269736f5f70657250616765223b733a31303a22382c31322c33322c3634223b733a31353a2269736f5f656e61626c654c696d6974223b733a303a22223b733a31373a2269736f5f736f7274696e674669656c6473223b4e3b733a32323a2269736f5f7365617263684175746f636f6d706c657465223b733a303a22223b733a31353a2269736f5f7365617263684578616374223b4e3b733a31363a2269736f5f7365617263684669656c6473223b4e3b733a32303a2269736f5f66696c7465724869646553696e676c65223b733a303a22223b733a31333a2269736f5f6e657746696c746572223b733a383a2273686f775f616c6c223b733a31353a2269736f5f72616e67654669656c6473223b4e3b733a32303a2269736f5f63756d756c61746976654669656c6473223b4e3b733a31363a2269736f5f66696c7465724669656c6473223b4e3b733a31373a2269736f5f66696c7465724d6f64756c6573223b733a33323a22613a323a7b693a303b733a323a223334223b693a313b733a323a223430223b7d223b733a31343a2269736f5f6c6973745f7768657265223b733a303a22223b733a31383a2269736f5f63617465676f72795f73636f7065223b733a31363a2263757272656e745f63617465676f7279223b733a31323a2269736f5f6e6f46696c746572223b733a303a22223b733a31353a2269736f5f656d70747946696c746572223b733a303a22223b733a31343a2269736f5f6e6f50726f6475637473223b733a303a22223b733a31363a2269736f5f656d7074794d657373616765223b733a303a22223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a32303a2269736f5f616464546f41646472657373626f6f6b223b733a303a22223b733a32303a2269736f5f6f726465725f636f6e646974696f6e73223b4e3b733a32323a2269736f5f636865636b6f75745f736b69707061626c65223b4e3b733a31383a2269736f5f666f72776172645f726576696577223b733a303a22223b733a31393a226f72646572436f6d706c6574654a756d70546f223b693a303b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31343a2269736f5f636f6e6669675f696473223b4e3b733a31333a2269736f5f636f6e6669675f6964223b693a303b733a383a2269736f5f636f6c73223b693a303b733a31383a2269736f5f776973686c6973744a756d70546f223b693a303b733a32303a2269736f5f61646450726f647563744a756d70546f223b693a383b733a31373a2269736f5f6c6f67696e5265717569726564223b733a303a22223b733a31363a2269736f5f6c6f67696e5f6a756d70546f223b693a303b733a31393a2269736f5f636865636b6f75745f6d6574686f64223b733a363a226d656d626572223b733a31383a2269736f5f646973706c617934303450616765223b733a303a22223b733a31363a2269736f5f7573655f7175616e74697479223b733a303a22223b733a31393a2269736f5f64697361626c655f6f7074696f6e73223b733a303a22223b733a31333a2269736f5f686964655f6c697374223b733a313a2231223b733a31363a2269736f5f6c696e6b5f7072696d617279223b733a303a22223b733a31343a2269736f5f6a756d705f6669727374223b733a303a22223b733a31333a2269736f5f66696c74657254706c223b733a31383a2269736f5f66696c7465725f64656661756c74223b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a31313a2269736f5f67616c6c657279223b693a303b733a31373a2269736f5f7265616465725f6c61796f7574223b733a303a22223b733a31353a2269736f5f6c6973745f6c61796f7574223b733a31363a2269736f5f6c6973745f64656661756c74223b733a32363a226e635f61637469766174696f6e5f6e6f74696669636174696f6e223b693a303b733a31353a226e635f6e6f74696669636174696f6e223b693a303b733a31383a22637573746f6d4c616e677561676554657874223b4e3b733a31343a22637573746f6d4c616e6775616765223b733a303a22223b733a31343a22686964654e6f46616c6c6261636b223b733a303a22223b733a31383a22686964654163746976654c616e6775616765223b733a303a22223b733a31373a227265675f61637469766174654c6f67696e223b733a303a22223b733a31363a227265675f6175746f4163746976617465223b733a373a2264697361626c65223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(98, 32, 1688932076, 3, 'tl_module', 4, 'test', 'Shop - Produktfilter - Limit', 'backend?do=themes&id=32&table=tl_module&act=edit&rt=cf66115727818ef.Do1EjELlX_3cqsiHw72J6deqJGz0LApBCj3SVSRYj4U.ZbkD5HqXJsqs85HkoNvQsabrYjS9aE4qS1-RYUY659xoww3nK9Jpvr3Ypw&ref=wAem2O6w', '', 0x613a3138363a7b733a323a226964223b693a33323b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638383933323037363b733a343a226e616d65223b733a32383a2253686f70202d2050726f64756b7466696c746572202d204c696d6974223b733a383a22686561646c696e65223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226832223b733a353a2276616c7565223b733a303a22223b7d223b733a343a2274797065223b733a31373a2269736f5f70726f6475637466696c746572223b733a31313a226c6576656c4f6666736574223b693a303b733a393a2273686f774c6576656c223b693a303b733a393a22686172644c696d6974223b733a303a22223b733a31333a2273686f7750726f746563746564223b733a303a22223b733a31303a22646566696e65526f6f74223b733a303a22223b733a383a22726f6f7450616765223b693a303b733a31333a226e617669676174696f6e54706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a353a227061676573223b4e3b733a31303a2273686f7748696464656e223b733a303a22223b733a31313a22637573746f6d4c6162656c223b733a303a22223b733a393a226175746f6c6f67696e223b733a303a22223b733a363a226a756d70546f223b693a303b733a31323a226f7665727669657750616765223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a383a226564697461626c65223b4e3b733a393a226d656d62657254706c223b733a303a22223b733a343a22666f726d223b693a303b733a393a22717565727954797065223b733a333a22616e64223b733a353a2266757a7a79223b733a303a22223b733a31333a22636f6e746578744c656e677468223b733a303a22223b733a31363a226d696e4b6579776f72644c656e677468223b693a343b733a373a2270657250616765223b693a303b733a31303a2273656172636854797065223b733a363a2273696d706c65223b733a393a2273656172636854706c223b733a303a22223b733a383a22696e436f6c756d6e223b733a343a226d61696e223b733a393a22736b69704669727374223b693a303b733a393a226c6f61644669727374223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a2275726c223b4e3b733a373a22696d6753697a65223b733a303a22223b733a31303a2275736543617074696f6e223b733a303a22223b733a383a2266756c6c73697a65223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a343a2268746d6c223b4e3b733a393a227273735f6361636865223b693a333630303b733a383a227273735f66656564223b4e3b733a31323a227273735f74656d706c617465223b733a303a22223b733a31333a226e756d6265724f664974656d73223b693a333b733a31343a2264697361626c6543617074636861223b733a303a22223b733a31303a227265675f67726f757073223b4e3b733a31343a227265675f616c6c6f774c6f67696e223b733a303a22223b733a31323a227265675f736b69704e616d65223b733a303a22223b733a393a227265675f636c6f7365223b733a303a22223b733a31333a227265675f64656c657465446972223b733a303a22223b733a31333a227265675f61737369676e446972223b733a303a22223b733a31313a227265675f686f6d65446972223b4e3b733a31323a227265675f6163746976617465223b733a303a22223b733a31303a227265675f6a756d70546f223b693a303b733a383a227265675f74657874223b4e3b733a31323a227265675f70617373776f7264223b4e3b733a343a2264617461223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a33333a22613a323a7b693a303b733a303a22223b693a313b733a353a226c696d6974223b7d223b733a32343a22726f6f7450616765446570656e64656e744d6f64756c6573223b4e3b733a31343a226661715f63617465676f72696573223b4e3b733a31363a226661715f7265616465724d6f64756c65223b693a303b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31333a226e6577735f6172636869766573223b4e3b733a31333a226e6577735f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31383a226e6577735f6a756d70546f43757272656e74223b733a303a22223b733a31373a226e6577735f7265616465724d6f64756c65223b693a303b733a31353a226e6577735f6d6574614669656c6473223b733a33383a22613a323a7b693a303b733a343a2264617465223b693a313b733a363a22617574686f72223b7d223b733a31333a226e6577735f74656d706c617465223b733a303a22223b733a31313a226e6577735f666f726d6174223b733a31303a226e6577735f6d6f6e7468223b733a31333a226e6577735f7374617274446179223b693a303b733a31303a226e6577735f6f72646572223b733a31353a226f726465725f646174655f64657363223b733a31373a226e6577735f73686f775175616e74697479223b733a303a22223b733a31303a226c6973745f7461626c65223b733a303a22223b733a31313a226c6973745f6669656c6473223b4e3b733a31303a226c6973745f7768657265223b4e3b733a31313a226c6973745f736561726368223b4e3b733a393a226c6973745f736f7274223b4e3b733a393a226c6973745f696e666f223b4e3b733a31353a226c6973745f696e666f5f7768657265223b4e3b733a31313a226c6973745f6c61796f7574223b733a303a22223b733a31363a226c6973745f696e666f5f6c61796f7574223b733a303a22223b733a31323a2263616c5f63616c656e646172223b4e3b733a31303a2263616c5f6e6f5370616e223b733a303a22223b733a31353a2263616c5f6869646552756e6e696e67223b733a303a22223b733a31323a2263616c5f7374617274446179223b693a313b733a31303a2263616c5f666f726d6174223b733a393a2263616c5f6d6f6e7468223b733a31373a2263616c5f69676e6f726544796e616d6963223b733a303a22223b733a393a2263616c5f6f72646572223b733a393a22617363656e64696e67223b733a31363a2263616c5f7265616465724d6f64756c65223b693a303b733a393a2263616c5f6c696d6974223b693a303b733a31323a2263616c5f74656d706c617465223b733a303a22223b733a31333a2263616c5f6374656d706c617465223b733a303a22223b733a31363a2263616c5f73686f775175616e74697479223b733a303a22223b733a31323a2263616c5f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6c5f6368616e6e656c73223b4e3b733a373a226e6c5f74657874223b4e3b733a31353a226e6c5f686964654368616e6e656c73223b733a303a22223b733a31323a226e6c5f737562736372696265223b4e3b733a31343a226e6c5f756e737562736372696265223b4e3b733a31313a226e6c5f74656d706c617465223b733a303a22223b733a31343a2269736f5f747370726f6475637473223b733a303a22223b733a31343a2269736f5f7473636865636b6f7574223b733a303a22223b733a31333a2269736f5f7473796f6666736574223b693a303b733a31353a2269736f5f7473646972656374696f6e223b733a303a22223b733a31333a2269736f5f7473646973706c6179223b733a383a227374616e64617264223b733a31333a2269736f5f747372657669657773223b733a313a2231223b733a383a2269736f5f74736964223b733a303a22223b733a31373a2269736f5f6e6f74696669636174696f6e73223b733a303a22223b733a31363a2269736f5f70726f647563746361636865223b4e3b733a31373a2269736f5f616464726573734669656c6473223b4e3b733a31313a2269736f5f61646472657373223b4e3b733a32303a2269736f5f636f6e74696e756553686f7070696e67223b733a303a22223b733a31393a2269736f5f696e636c7564654d65737361676573223b733a313a2231223b733a32323a2269736f5f72656c617465645f63617465676f72696573223b4e3b733a31313a2269736f5f627574746f6e73223b733a32393a22613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d223b733a32343a2269736f5f6c697374696e67536f7274446972656374696f6e223b733a333a22415343223b733a32303a2269736f5f6c697374696e67536f72744669656c64223b733a333a22736b75223b733a31393a2269736f5f636865636b6f75745f6a756d70546f223b693a303b733a31353a2269736f5f636172745f6a756d70546f223b693a303b733a31313a2269736f5f70657250616765223b733a393a2231302c322c352c3135223b733a31353a2269736f5f656e61626c654c696d6974223b733a313a2231223b733a31373a2269736f5f736f7274696e674669656c6473223b4e3b733a32323a2269736f5f7365617263684175746f636f6d706c657465223b733a343a226e616d65223b733a31353a2269736f5f7365617263684578616374223b4e3b733a31363a2269736f5f7365617263684669656c6473223b4e3b733a32303a2269736f5f66696c7465724869646553696e676c65223b733a303a22223b733a31333a2269736f5f6e657746696c746572223b733a383a2273686f775f616c6c223b733a31353a2269736f5f72616e67654669656c6473223b4e3b733a32303a2269736f5f63756d756c61746976654669656c6473223b4e3b733a31363a2269736f5f66696c7465724669656c6473223b4e3b733a31373a2269736f5f66696c7465724d6f64756c6573223b4e3b733a31343a2269736f5f6c6973745f7768657265223b733a303a22223b733a31383a2269736f5f63617465676f72795f73636f7065223b733a31363a2263757272656e745f63617465676f7279223b733a31323a2269736f5f6e6f46696c746572223b733a303a22223b733a31353a2269736f5f656d70747946696c746572223b733a303a22223b733a31343a2269736f5f6e6f50726f6475637473223b733a303a22223b733a31363a2269736f5f656d7074794d657373616765223b733a303a22223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a32303a2269736f5f616464546f41646472657373626f6f6b223b733a303a22223b733a32303a2269736f5f6f726465725f636f6e646974696f6e73223b4e3b733a32323a2269736f5f636865636b6f75745f736b69707061626c65223b4e3b733a31383a2269736f5f666f72776172645f726576696577223b733a303a22223b733a31393a226f72646572436f6d706c6574654a756d70546f223b693a303b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31343a2269736f5f636f6e6669675f696473223b4e3b733a31333a2269736f5f636f6e6669675f6964223b693a303b733a383a2269736f5f636f6c73223b693a313b733a31383a2269736f5f776973686c6973744a756d70546f223b693a303b733a32303a2269736f5f61646450726f647563744a756d70546f223b693a303b733a31373a2269736f5f6c6f67696e5265717569726564223b733a303a22223b733a31363a2269736f5f6c6f67696e5f6a756d70546f223b693a303b733a31393a2269736f5f636865636b6f75745f6d6574686f64223b733a363a226d656d626572223b733a31383a2269736f5f646973706c617934303450616765223b733a303a22223b733a31363a2269736f5f7573655f7175616e74697479223b733a303a22223b733a31393a2269736f5f64697361626c655f6f7074696f6e73223b733a303a22223b733a31333a2269736f5f686964655f6c697374223b733a313a2231223b733a31363a2269736f5f6c696e6b5f7072696d617279223b733a303a22223b733a31343a2269736f5f6a756d705f6669727374223b733a303a22223b733a31333a2269736f5f66696c74657254706c223b733a31383a2269736f5f66696c7465725f64656661756c74223b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a31313a2269736f5f67616c6c657279223b693a303b733a31373a2269736f5f7265616465725f6c61796f7574223b733a303a22223b733a31353a2269736f5f6c6973745f6c61796f7574223b733a303a22223b733a32363a226e635f61637469766174696f6e5f6e6f74696669636174696f6e223b693a303b733a31353a226e635f6e6f74696669636174696f6e223b693a303b733a31383a22637573746f6d4c616e677561676554657874223b4e3b733a31343a22637573746f6d4c616e6775616765223b733a303a22223b733a31343a22686964654e6f46616c6c6261636b223b733a303a22223b733a31383a22686964654163746976654c616e6775616765223b733a303a22223b733a31373a227265675f61637469766174654c6f67696e223b733a303a22223b733a31363a227265675f6175746f4163746976617465223b733a373a2264697361626c65223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(99, 32, 1688932100, 4, 'tl_module', 4, 'test', 'Shop - Produktfilter - Limit', 'backend?do=themes&id=32&table=tl_module&act=edit&rt=cf66115727818ef.Do1EjELlX_3cqsiHw72J6deqJGz0LApBCj3SVSRYj4U.ZbkD5HqXJsqs85HkoNvQsabrYjS9aE4qS1-RYUY659xoww3nK9Jpvr3Ypw&ref=wAem2O6w', '1', 0x613a3138363a7b733a323a226964223b693a33323b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638383933323130303b733a343a226e616d65223b733a32383a2253686f70202d2050726f64756b7466696c746572202d204c696d6974223b733a383a22686561646c696e65223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226832223b733a353a2276616c7565223b733a303a22223b7d223b733a343a2274797065223b733a31373a2269736f5f70726f6475637466696c746572223b733a31313a226c6576656c4f6666736574223b693a303b733a393a2273686f774c6576656c223b693a303b733a393a22686172644c696d6974223b733a303a22223b733a31333a2273686f7750726f746563746564223b733a303a22223b733a31303a22646566696e65526f6f74223b733a303a22223b733a383a22726f6f7450616765223b693a303b733a31333a226e617669676174696f6e54706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a353a227061676573223b4e3b733a31303a2273686f7748696464656e223b733a303a22223b733a31313a22637573746f6d4c6162656c223b733a303a22223b733a393a226175746f6c6f67696e223b733a303a22223b733a363a226a756d70546f223b693a303b733a31323a226f7665727669657750616765223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a383a226564697461626c65223b4e3b733a393a226d656d62657254706c223b733a303a22223b733a343a22666f726d223b693a303b733a393a22717565727954797065223b733a333a22616e64223b733a353a2266757a7a79223b733a303a22223b733a31333a22636f6e746578744c656e677468223b733a303a22223b733a31363a226d696e4b6579776f72644c656e677468223b693a343b733a373a2270657250616765223b693a303b733a31303a2273656172636854797065223b733a363a2273696d706c65223b733a393a2273656172636854706c223b733a303a22223b733a383a22696e436f6c756d6e223b733a343a226d61696e223b733a393a22736b69704669727374223b693a303b733a393a226c6f61644669727374223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a2275726c223b4e3b733a373a22696d6753697a65223b733a303a22223b733a31303a2275736543617074696f6e223b733a303a22223b733a383a2266756c6c73697a65223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a343a2268746d6c223b4e3b733a393a227273735f6361636865223b693a333630303b733a383a227273735f66656564223b4e3b733a31323a227273735f74656d706c617465223b733a303a22223b733a31333a226e756d6265724f664974656d73223b693a333b733a31343a2264697361626c6543617074636861223b733a303a22223b733a31303a227265675f67726f757073223b4e3b733a31343a227265675f616c6c6f774c6f67696e223b733a303a22223b733a31323a227265675f736b69704e616d65223b733a303a22223b733a393a227265675f636c6f7365223b733a303a22223b733a31333a227265675f64656c657465446972223b733a303a22223b733a31333a227265675f61737369676e446972223b733a303a22223b733a31313a227265675f686f6d65446972223b4e3b733a31323a227265675f6163746976617465223b733a303a22223b733a31303a227265675f6a756d70546f223b693a303b733a383a227265675f74657874223b4e3b733a31323a227265675f70617373776f7264223b4e3b733a343a2264617461223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a33333a22613a323a7b693a303b733a303a22223b693a313b733a353a226c696d6974223b7d223b733a32343a22726f6f7450616765446570656e64656e744d6f64756c6573223b4e3b733a31343a226661715f63617465676f72696573223b4e3b733a31363a226661715f7265616465724d6f64756c65223b693a303b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31333a226e6577735f6172636869766573223b4e3b733a31333a226e6577735f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31383a226e6577735f6a756d70546f43757272656e74223b733a303a22223b733a31373a226e6577735f7265616465724d6f64756c65223b693a303b733a31353a226e6577735f6d6574614669656c6473223b733a33383a22613a323a7b693a303b733a343a2264617465223b693a313b733a363a22617574686f72223b7d223b733a31333a226e6577735f74656d706c617465223b733a303a22223b733a31313a226e6577735f666f726d6174223b733a31303a226e6577735f6d6f6e7468223b733a31333a226e6577735f7374617274446179223b693a303b733a31303a226e6577735f6f72646572223b733a31353a226f726465725f646174655f64657363223b733a31373a226e6577735f73686f775175616e74697479223b733a303a22223b733a31303a226c6973745f7461626c65223b733a303a22223b733a31313a226c6973745f6669656c6473223b4e3b733a31303a226c6973745f7768657265223b4e3b733a31313a226c6973745f736561726368223b4e3b733a393a226c6973745f736f7274223b4e3b733a393a226c6973745f696e666f223b4e3b733a31353a226c6973745f696e666f5f7768657265223b4e3b733a31313a226c6973745f6c61796f7574223b733a303a22223b733a31363a226c6973745f696e666f5f6c61796f7574223b733a303a22223b733a31323a2263616c5f63616c656e646172223b4e3b733a31303a2263616c5f6e6f5370616e223b733a303a22223b733a31353a2263616c5f6869646552756e6e696e67223b733a303a22223b733a31323a2263616c5f7374617274446179223b693a313b733a31303a2263616c5f666f726d6174223b733a393a2263616c5f6d6f6e7468223b733a31373a2263616c5f69676e6f726544796e616d6963223b733a303a22223b733a393a2263616c5f6f72646572223b733a393a22617363656e64696e67223b733a31363a2263616c5f7265616465724d6f64756c65223b693a303b733a393a2263616c5f6c696d6974223b693a303b733a31323a2263616c5f74656d706c617465223b733a303a22223b733a31333a2263616c5f6374656d706c617465223b733a303a22223b733a31363a2263616c5f73686f775175616e74697479223b733a303a22223b733a31323a2263616c5f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6c5f6368616e6e656c73223b4e3b733a373a226e6c5f74657874223b4e3b733a31353a226e6c5f686964654368616e6e656c73223b733a303a22223b733a31323a226e6c5f737562736372696265223b4e3b733a31343a226e6c5f756e737562736372696265223b4e3b733a31313a226e6c5f74656d706c617465223b733a303a22223b733a31343a2269736f5f747370726f6475637473223b733a303a22223b733a31343a2269736f5f7473636865636b6f7574223b733a303a22223b733a31333a2269736f5f7473796f6666736574223b693a303b733a31353a2269736f5f7473646972656374696f6e223b733a303a22223b733a31333a2269736f5f7473646973706c6179223b733a383a227374616e64617264223b733a31333a2269736f5f747372657669657773223b733a313a2231223b733a383a2269736f5f74736964223b733a303a22223b733a31373a2269736f5f6e6f74696669636174696f6e73223b733a303a22223b733a31363a2269736f5f70726f647563746361636865223b4e3b733a31373a2269736f5f616464726573734669656c6473223b4e3b733a31313a2269736f5f61646472657373223b4e3b733a32303a2269736f5f636f6e74696e756553686f7070696e67223b733a303a22223b733a31393a2269736f5f696e636c7564654d65737361676573223b733a313a2231223b733a32323a2269736f5f72656c617465645f63617465676f72696573223b4e3b733a31313a2269736f5f627574746f6e73223b733a32393a22613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d223b733a32343a2269736f5f6c697374696e67536f7274446972656374696f6e223b733a333a22415343223b733a32303a2269736f5f6c697374696e67536f72744669656c64223b733a333a22736b75223b733a31393a2269736f5f636865636b6f75745f6a756d70546f223b693a303b733a31353a2269736f5f636172745f6a756d70546f223b693a303b733a31313a2269736f5f70657250616765223b733a353a2231302c3135223b733a31353a2269736f5f656e61626c654c696d6974223b733a313a2231223b733a31373a2269736f5f736f7274696e674669656c6473223b4e3b733a32323a2269736f5f7365617263684175746f636f6d706c657465223b733a343a226e616d65223b733a31353a2269736f5f7365617263684578616374223b4e3b733a31363a2269736f5f7365617263684669656c6473223b4e3b733a32303a2269736f5f66696c7465724869646553696e676c65223b733a303a22223b733a31333a2269736f5f6e657746696c746572223b733a383a2273686f775f616c6c223b733a31353a2269736f5f72616e67654669656c6473223b4e3b733a32303a2269736f5f63756d756c61746976654669656c6473223b4e3b733a31363a2269736f5f66696c7465724669656c6473223b4e3b733a31373a2269736f5f66696c7465724d6f64756c6573223b4e3b733a31343a2269736f5f6c6973745f7768657265223b733a303a22223b733a31383a2269736f5f63617465676f72795f73636f7065223b733a31363a2263757272656e745f63617465676f7279223b733a31323a2269736f5f6e6f46696c746572223b733a303a22223b733a31353a2269736f5f656d70747946696c746572223b733a303a22223b733a31343a2269736f5f6e6f50726f6475637473223b733a303a22223b733a31363a2269736f5f656d7074794d657373616765223b733a303a22223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a32303a2269736f5f616464546f41646472657373626f6f6b223b733a303a22223b733a32303a2269736f5f6f726465725f636f6e646974696f6e73223b4e3b733a32323a2269736f5f636865636b6f75745f736b69707061626c65223b4e3b733a31383a2269736f5f666f72776172645f726576696577223b733a303a22223b733a31393a226f72646572436f6d706c6574654a756d70546f223b693a303b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31343a2269736f5f636f6e6669675f696473223b4e3b733a31333a2269736f5f636f6e6669675f6964223b693a303b733a383a2269736f5f636f6c73223b693a313b733a31383a2269736f5f776973686c6973744a756d70546f223b693a303b733a32303a2269736f5f61646450726f647563744a756d70546f223b693a303b733a31373a2269736f5f6c6f67696e5265717569726564223b733a303a22223b733a31363a2269736f5f6c6f67696e5f6a756d70546f223b693a303b733a31393a2269736f5f636865636b6f75745f6d6574686f64223b733a363a226d656d626572223b733a31383a2269736f5f646973706c617934303450616765223b733a303a22223b733a31363a2269736f5f7573655f7175616e74697479223b733a303a22223b733a31393a2269736f5f64697361626c655f6f7074696f6e73223b733a303a22223b733a31333a2269736f5f686964655f6c697374223b733a313a2231223b733a31363a2269736f5f6c696e6b5f7072696d617279223b733a303a22223b733a31343a2269736f5f6a756d705f6669727374223b733a303a22223b733a31333a2269736f5f66696c74657254706c223b733a31383a2269736f5f66696c7465725f64656661756c74223b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a31313a2269736f5f67616c6c657279223b693a303b733a31373a2269736f5f7265616465725f6c61796f7574223b733a303a22223b733a31353a2269736f5f6c6973745f6c61796f7574223b733a303a22223b733a32363a226e635f61637469766174696f6e5f6e6f74696669636174696f6e223b693a303b733a31353a226e635f6e6f74696669636174696f6e223b693a303b733a31383a22637573746f6d4c616e677561676554657874223b4e3b733a31343a22637573746f6d4c616e6775616765223b733a303a22223b733a31343a22686964654e6f46616c6c6261636b223b733a303a22223b733a31383a22686964654163746976654c616e6775616765223b733a303a22223b733a31373a227265675f61637469766174654c6f67696e223b733a303a22223b733a31363a227265675f6175746f4163746976617465223b733a373a2264697361626c65223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(100, 38, 1688932245, 1, 'tl_iso_product', 0, NULL, 'Variante Original von S0004 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=66bd3b48.56wm-7LIfkLhOs2xzCdyLYSHyJlcVbcxNPBSCueCpmQ.jJhhk4q6B3WRY5TSr0ErdfXGjsEVEfNadZIRPoXgzj2B4m-Q2_9IAYBIog&ref=TOFTzDGP', '', 0x613a33383a7b733a323a226964223b693a33383b733a333a22706964223b693a33343b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393738373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323433393433343b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35383a2256617269616e7465204f726967696e616c20766f6e20533030303420262334303b7175616e7469747920312c205245534552564544262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a32383a223c703e446965732069737420646173206f726967696e616c3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b7d),
(101, 38, 1688932248, 2, 'tl_iso_product', 4, 'test', 'Variante Original von S0004 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=66bd3b48.56wm-7LIfkLhOs2xzCdyLYSHyJlcVbcxNPBSCueCpmQ.jJhhk4q6B3WRY5TSr0ErdfXGjsEVEfNadZIRPoXgzj2B4m-Q2_9IAYBIog&ref=TOFTzDGP', '', 0x613a34303a7b733a323a226964223b693a33383b733a333a22706964223b693a33343b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323234383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323433393433343b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35383a2256617269616e7465204f726967696e616c20766f6e20533030303420262334303b7175616e7469747920312c205245534552564544262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a32383a223c703e446965732069737420646173206f726967696e616c3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35363a223235302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(102, 38, 1688932248, 2, 'tl_iso_product_category', 4, 'test', 'Variante Original von S0004 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=66bd3b48.56wm-7LIfkLhOs2xzCdyLYSHyJlcVbcxNPBSCueCpmQ.jJhhk4q6B3WRY5TSr0ErdfXGjsEVEfNadZIRPoXgzj2B4m-Q2_9IAYBIog&ref=TOFTzDGP', '', 0x613a303a7b7d),
(103, 38, 1688932248, 2, 'tl_iso_product_price', 4, 'test', 'Variante Original von S0004 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=66bd3b48.56wm-7LIfkLhOs2xzCdyLYSHyJlcVbcxNPBSCueCpmQ.jJhhk4q6B3WRY5TSr0ErdfXGjsEVEfNadZIRPoXgzj2B4m-Q2_9IAYBIog&ref=TOFTzDGP', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323433393838333b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223235302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33323b733a333a22706964223b693a33303b733a363a22747374616d70223b693a313638323434313130333b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223235302e3030223b7d7d7d),
(104, 38, 1688932281, 3, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=66bd3b48.56wm-7LIfkLhOs2xzCdyLYSHyJlcVbcxNPBSCueCpmQ.jJhhk4q6B3WRY5TSr0ErdfXGjsEVEfNadZIRPoXgzj2B4m-Q2_9IAYBIog&ref=TOFTzDGP', '', 0x613a34303a7b733a323a226964223b693a33383b733a333a22706964223b693a33343b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323238313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323433393433343b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203420262334303b7175616e7469747920312c205245534552564544262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a32383a223c703e446965732069737420646173206f726967696e616c3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35363a223235302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(105, 38, 1688932281, 3, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=66bd3b48.56wm-7LIfkLhOs2xzCdyLYSHyJlcVbcxNPBSCueCpmQ.jJhhk4q6B3WRY5TSr0ErdfXGjsEVEfNadZIRPoXgzj2B4m-Q2_9IAYBIog&ref=TOFTzDGP', '', 0x613a303a7b7d),
(106, 38, 1688932281, 3, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=66bd3b48.56wm-7LIfkLhOs2xzCdyLYSHyJlcVbcxNPBSCueCpmQ.jJhhk4q6B3WRY5TSr0ErdfXGjsEVEfNadZIRPoXgzj2B4m-Q2_9IAYBIog&ref=TOFTzDGP', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323433393838333b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223235302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33323b733a333a22706964223b693a33303b733a363a22747374616d70223b693a313638323434313130333b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223235302e3030223b7d7d7d),
(107, 49, 1688932344, 1, 'tl_iso_product', 0, NULL, 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=35dc01c464e9b.bBJJuCJ9uFeXnUx2s7vMtXV5YR2_oTKtYKvpMR7R8qI.ByYO0BoPwWDnxBUV0N2V7QQ4J0X25XbGIcmqBXyzmvsKXADTS0qOFPbvIw&ref=rPogchUO', '', 0x613a33383a7b733a323a226964223b693a34393b733a333a22706964223b693a33373b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303034333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203520262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b7d),
(108, 49, 1688932349, 2, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=35dc01c464e9b.bBJJuCJ9uFeXnUx2s7vMtXV5YR2_oTKtYKvpMR7R8qI.ByYO0BoPwWDnxBUV0N2V7QQ4J0X25XbGIcmqBXyzmvsKXADTS0qOFPbvIw&ref=rPogchUO', '', 0x613a34303a7b733a323a226964223b693a34393b733a333a22706964223b693a33373b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323334393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203520262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(109, 49, 1688932349, 2, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=35dc01c464e9b.bBJJuCJ9uFeXnUx2s7vMtXV5YR2_oTKtYKvpMR7R8qI.ByYO0BoPwWDnxBUV0N2V7QQ4J0X25XbGIcmqBXyzmvsKXADTS0qOFPbvIw&ref=rPogchUO', '', 0x613a303a7b7d),
(110, 49, 1688932349, 2, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=35dc01c464e9b.bBJJuCJ9uFeXnUx2s7vMtXV5YR2_oTKtYKvpMR7R8qI.ByYO0BoPwWDnxBUV0N2V7QQ4J0X25XbGIcmqBXyzmvsKXADTS0qOFPbvIw&ref=rPogchUO', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33383b733a333a22706964223b693a34393b733a363a22747374616d70223b693a313638323533373138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323533373138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(111, 49, 1688932370, 3, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=35dc01c464e9b.bBJJuCJ9uFeXnUx2s7vMtXV5YR2_oTKtYKvpMR7R8qI.ByYO0BoPwWDnxBUV0N2V7QQ4J0X25XbGIcmqBXyzmvsKXADTS0qOFPbvIw&ref=rPogchUO', '', 0x613a34303a7b733a323a226964223b693a34393b733a333a22706964223b693a33373b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323337303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203520262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(112, 49, 1688932370, 3, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=35dc01c464e9b.bBJJuCJ9uFeXnUx2s7vMtXV5YR2_oTKtYKvpMR7R8qI.ByYO0BoPwWDnxBUV0N2V7QQ4J0X25XbGIcmqBXyzmvsKXADTS0qOFPbvIw&ref=rPogchUO', '', 0x613a303a7b7d),
(113, 49, 1688932370, 3, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=35dc01c464e9b.bBJJuCJ9uFeXnUx2s7vMtXV5YR2_oTKtYKvpMR7R8qI.ByYO0BoPwWDnxBUV0N2V7QQ4J0X25XbGIcmqBXyzmvsKXADTS0qOFPbvIw&ref=rPogchUO', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33383b733a333a22706964223b693a34393b733a363a22747374616d70223b693a313638323533373138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323533373138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(114, 50, 1688932396, 1, 'tl_iso_product', 0, NULL, 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=c2ae0a0c4235520e6d.sR5Tx7bMscMlY9eRGle8DiXwlnKwIUJ-OvFwo1WnvOM.2ioUr46-yPRVOo7yeTHlVlSx0Cr5ZQYVe5MzlzfF1LrXUBqs3_uHgEQRuA&ref=qWK6U29i', '', 0x613a33383a7b733a323a226964223b693a35303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303133313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323533373830353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a373a2266696775722d36223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303036223b733a343a226e616d65223b733a34303a22536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31343a223c703e466967757220363c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(115, 50, 1688932396, 1, 'tl_iso_product_category', 0, NULL, 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=c2ae0a0c4235520e6d.sR5Tx7bMscMlY9eRGle8DiXwlnKwIUJ-OvFwo1WnvOM.2ioUr46-yPRVOo7yeTHlVlSx0Cr5ZQYVe5MzlzfF1LrXUBqs3_uHgEQRuA&ref=qWK6U29i', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35353b733a333a22706964223b693a35303b733a373a22736f7274696e67223b693a3736383b733a363a22747374616d70223b693a313638323533373830353b733a373a22706167655f6964223b693a33333b7d7d),
(116, 50, 1688932401, 2, 'tl_iso_product', 4, 'test', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=c2ae0a0c4235520e6d.sR5Tx7bMscMlY9eRGle8DiXwlnKwIUJ-OvFwo1WnvOM.2ioUr46-yPRVOo7yeTHlVlSx0Cr5ZQYVe5MzlzfF1LrXUBqs3_uHgEQRuA&ref=qWK6U29i', '', 0x613a34303a7b733a323a226964223b693a35303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323430313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323533373830353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a373a2266696775722d36223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303036223b733a343a226e616d65223b733a34303a22536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31343a223c703e466967757220363c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35353b7d733a353a227072696365223b733a35393a22302e30302c302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(117, 50, 1688932401, 2, 'tl_iso_product_category', 4, 'test', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=c2ae0a0c4235520e6d.sR5Tx7bMscMlY9eRGle8DiXwlnKwIUJ-OvFwo1WnvOM.2ioUr46-yPRVOo7yeTHlVlSx0Cr5ZQYVe5MzlzfF1LrXUBqs3_uHgEQRuA&ref=qWK6U29i', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35353b733a333a22706964223b693a35303b733a373a22736f7274696e67223b693a3736383b733a363a22747374616d70223b693a313638323533373830353b733a373a22706167655f6964223b693a33333b7d7d),
(118, 50, 1688932401, 2, 'tl_iso_product_price', 4, 'test', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=c2ae0a0c4235520e6d.sR5Tx7bMscMlY9eRGle8DiXwlnKwIUJ-OvFwo1WnvOM.2ioUr46-yPRVOo7yeTHlVlSx0Cr5ZQYVe5MzlzfF1LrXUBqs3_uHgEQRuA&ref=qWK6U29i', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34303b733a333a22706964223b693a35303b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a333a22312c31223b733a31313a22746965725f76616c756573223b733a393a22302e30302c302e3030223b7d7d733a353a227469657273223b613a323a7b693a303b613a353a7b733a323a226964223b693a34323b733a333a22706964223b693a34303b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d693a313b613a353a7b733a323a226964223b693a34333b733a333a22706964223b693a34303b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(119, 51, 1688932407, 1, 'tl_iso_product', 0, NULL, 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=7993d4808128e7f96ad765.dXQ-E6TykaQB5td8CuppImjQBDFDNwwgqhONlAKYMdk.HkB5e5yA6JNxv44faYwwehmRQmkKc0hL63HOoGD6WYATOnd4zcWn52CUuA&ref=MihP5RGW', '', 0x613a33383a7b733a323a226964223b693a35313b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303231373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e7465204b6f70696520766f6e20536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b7d),
(120, 51, 1688932412, 2, 'tl_iso_product', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=7993d4808128e7f96ad765.dXQ-E6TykaQB5td8CuppImjQBDFDNwwgqhONlAKYMdk.HkB5e5yA6JNxv44faYwwehmRQmkKc0hL63HOoGD6WYATOnd4zcWn52CUuA&ref=MihP5RGW', '', 0x613a34303a7b733a323a226964223b693a35313b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323431323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e7465204b6f70696520766f6e20536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(121, 51, 1688932412, 2, 'tl_iso_product_category', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=7993d4808128e7f96ad765.dXQ-E6TykaQB5td8CuppImjQBDFDNwwgqhONlAKYMdk.HkB5e5yA6JNxv44faYwwehmRQmkKc0hL63HOoGD6WYATOnd4zcWn52CUuA&ref=MihP5RGW', '', 0x613a303a7b7d),
(122, 51, 1688932412, 2, 'tl_iso_product_price', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=7993d4808128e7f96ad765.dXQ-E6TykaQB5td8CuppImjQBDFDNwwgqhONlAKYMdk.HkB5e5yA6JNxv44faYwwehmRQmkKc0hL63HOoGD6WYATOnd4zcWn52CUuA&ref=MihP5RGW', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34313b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34343b733a333a22706964223b693a34313b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(123, 52, 1688932415, 1, 'tl_iso_product', 0, NULL, 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=2e46a0fae26d2df0a.MCGmwcgL4Sxt6NoCuJL6MLvELLiNis-MWxgZmp3dalk.WxXhqfB5mBsdsYNh2_SjaMqFauDEzovnGnparv-_AgBWb--qoTzXbwyatQ&ref=K1mFrLzV', '', 0x613a33383a7b733a323a226964223b693a35323b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835303138343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203620262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b7d),
(124, 52, 1688932418, 2, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=2e46a0fae26d2df0a.MCGmwcgL4Sxt6NoCuJL6MLvELLiNis-MWxgZmp3dalk.WxXhqfB5mBsdsYNh2_SjaMqFauDEzovnGnparv-_AgBWb--qoTzXbwyatQ&ref=K1mFrLzV', '', 0x613a34303a7b733a323a226964223b693a35323b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323431383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203620262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(125, 52, 1688932418, 2, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=2e46a0fae26d2df0a.MCGmwcgL4Sxt6NoCuJL6MLvELLiNis-MWxgZmp3dalk.WxXhqfB5mBsdsYNh2_SjaMqFauDEzovnGnparv-_AgBWb--qoTzXbwyatQ&ref=K1mFrLzV', '', 0x613a303a7b7d),
(126, 52, 1688932418, 2, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=2e46a0fae26d2df0a.MCGmwcgL4Sxt6NoCuJL6MLvELLiNis-MWxgZmp3dalk.WxXhqfB5mBsdsYNh2_SjaMqFauDEzovnGnparv-_AgBWb--qoTzXbwyatQ&ref=K1mFrLzV', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34323b733a333a22706964223b693a35323b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34353b733a333a22706964223b693a34323b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(127, 51, 1688932450, 3, 'tl_iso_product', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=133f94e1d4ce3e4b25c4974a72e.epsYYPO75XefQBGXvPat3I4NhUN0tfazV1rNdUKVXMg.Ea9fCMvJnEDvGUj035D0hP9Mwxs98bLYFjiOQSD3NJEc1VELmozTNP4yfg&ref=mA2rhrWV', '', 0x613a34303a7b733a323a226964223b693a35313b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323435303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e7465204b6f70696520766f6e20536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(128, 51, 1688932450, 3, 'tl_iso_product_category', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=133f94e1d4ce3e4b25c4974a72e.epsYYPO75XefQBGXvPat3I4NhUN0tfazV1rNdUKVXMg.Ea9fCMvJnEDvGUj035D0hP9Mwxs98bLYFjiOQSD3NJEc1VELmozTNP4yfg&ref=mA2rhrWV', '', 0x613a303a7b7d),
(129, 51, 1688932450, 3, 'tl_iso_product_price', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=133f94e1d4ce3e4b25c4974a72e.epsYYPO75XefQBGXvPat3I4NhUN0tfazV1rNdUKVXMg.Ea9fCMvJnEDvGUj035D0hP9Mwxs98bLYFjiOQSD3NJEc1VELmozTNP4yfg&ref=mA2rhrWV', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34313b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34343b733a333a22706964223b693a34313b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(130, 52, 1688932457, 3, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=23.Aby0Q6JbJ3lJDwzdu7AA3bCLKOfJFZRwqX_f9FmHp60.aojzK5opXk45VlW-2NZZhcHKbr-AUdAb6B2cwDvlz_Rn8v0oy2wROih9Yw&ref=OV9jlxdh', '', 0x613a34303a7b733a323a226964223b693a35323b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323435373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203620262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(131, 52, 1688932457, 3, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=23.Aby0Q6JbJ3lJDwzdu7AA3bCLKOfJFZRwqX_f9FmHp60.aojzK5opXk45VlW-2NZZhcHKbr-AUdAb6B2cwDvlz_Rn8v0oy2wROih9Yw&ref=OV9jlxdh', '', 0x613a303a7b7d),
(132, 52, 1688932457, 3, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=23.Aby0Q6JbJ3lJDwzdu7AA3bCLKOfJFZRwqX_f9FmHp60.aojzK5opXk45VlW-2NZZhcHKbr-AUdAb6B2cwDvlz_Rn8v0oy2wROih9Yw&ref=OV9jlxdh', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34323b733a333a22706964223b693a35323b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34353b733a333a22706964223b693a34323b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(133, 50, 1688932470, 3, 'tl_iso_product', 4, 'test', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=09014ce7381ca0e0302e.09bTLEgSm2AV7jKmq6NzO06OP-VeJhiLyCp-6DWSR0E.uOKURHBg4ldlt2vFyMUqYz_Peb0XYlzgiUg93FfwLxi1mJpHISWtI3ScXQ&ref=g8Bj8FLi', '1', 0x613a34303a7b733a323a226964223b693a35303b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383933323437303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323533373830353b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a373a2266696775722d36223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303036223b733a343a226e616d65223b733a34303a22536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31343a223c703e466967757220363c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35353b7d733a353a227072696365223b733a35393a22302e30302c302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(134, 50, 1688932470, 3, 'tl_iso_product_category', 4, 'test', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=09014ce7381ca0e0302e.09bTLEgSm2AV7jKmq6NzO06OP-VeJhiLyCp-6DWSR0E.uOKURHBg4ldlt2vFyMUqYz_Peb0XYlzgiUg93FfwLxi1mJpHISWtI3ScXQ&ref=g8Bj8FLi', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35353b733a333a22706964223b693a35303b733a373a22736f7274696e67223b693a3736383b733a363a22747374616d70223b693a313638323533373830353b733a373a22706167655f6964223b693a33333b7d7d),
(135, 50, 1688932470, 3, 'tl_iso_product_price', 4, 'test', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&act=edit&id=50&rt=09014ce7381ca0e0302e.09bTLEgSm2AV7jKmq6NzO06OP-VeJhiLyCp-6DWSR0E.uOKURHBg4ldlt2vFyMUqYz_Peb0XYlzgiUg93FfwLxi1mJpHISWtI3ScXQ&ref=g8Bj8FLi', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34303b733a333a22706964223b693a35303b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a333a22312c31223b733a31313a22746965725f76616c756573223b733a393a22302e30302c302e3030223b7d7d733a353a227469657273223b613a323a7b693a303b613a353a7b733a323a226964223b693a34323b733a333a22706964223b693a34303b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d693a313b613a353a7b733a323a226964223b693a34333b733a333a22706964223b693a34303b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(136, 32, 1689001434, 1, 'tl_iso_product', 0, NULL, 'Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&act=edit&id=32&rt=81129759.By2_SeFBjPHdlgyncx1BpLh9t9qXLKoBczYfcZtDAIg.bBn4Idkz9catz1XEEHsY_Mk88YLeaO5qMlRcRfkhaNFhY_YiiHa6srzkYw&ref=Tcqwyv3y', '', 0x613a33383a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393134393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a22736b756c707475722d322d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a33313a22536b756c70747572203220262334303b7175616e746974792032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31373a223c703e536b756c7074757220323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(137, 32, 1689001434, 1, 'tl_iso_product_category', 0, NULL, 'Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&act=edit&id=32&rt=81129759.By2_SeFBjPHdlgyncx1BpLh9t9qXLKoBczYfcZtDAIg.bBn4Idkz9catz1XEEHsY_Mk88YLeaO5qMlRcRfkhaNFhY_YiiHa6srzkYw&ref=Tcqwyv3y', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(138, 32, 1689001455, 2, 'tl_iso_product', 4, 'test', 'Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&act=edit&id=32&rt=81129759.By2_SeFBjPHdlgyncx1BpLh9t9qXLKoBczYfcZtDAIg.bBn4Idkz9catz1XEEHsY_Mk88YLeaO5qMlRcRfkhaNFhY_YiiHa6srzkYw&ref=Tcqwyv3y', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393030313435353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a22736b756c707475722d322d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a33313a22536b756c70747572203220262334303b7175616e746974792032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31373a223c703e536b756c7074757220323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2234223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(139, 32, 1689001455, 2, 'tl_iso_product_category', 4, 'test', 'Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&act=edit&id=32&rt=81129759.By2_SeFBjPHdlgyncx1BpLh9t9qXLKoBczYfcZtDAIg.bBn4Idkz9catz1XEEHsY_Mk88YLeaO5qMlRcRfkhaNFhY_YiiHa6srzkYw&ref=Tcqwyv3y', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(140, 32, 1689001455, 2, 'tl_iso_product_price', 4, 'test', 'Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&act=edit&id=32&rt=81129759.By2_SeFBjPHdlgyncx1BpLh9t9qXLKoBczYfcZtDAIg.bBn4Idkz9catz1XEEHsY_Mk88YLeaO5qMlRcRfkhaNFhY_YiiHa6srzkYw&ref=Tcqwyv3y', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(141, 44, 1689002911, 1, 'tl_iso_product', 0, NULL, 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&id=44&act=edit&rt=dc49e327.R3bEPUMZh0EBEfatsVYZqSzBzxjIKzF5NYw9XvH-peY.LEKDVXtr_nZxSK_O0jBA8V2AiUCBb3USdO5-apOczb8hOI1WKi6xAmBjmQ&ref=_yDgCeI5', '', 0x613a33383a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393230363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35303a2256617269616e7465204b6f70696520766f6e20536b756c70747572203220262334303b7175616e746974792032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b7d),
(142, 45, 1689002919, 1, 'tl_iso_product', 0, NULL, 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 'backend?do=iso_products&id=45&act=edit&rt=86f682d2f47871b89805e808.1-urcnrfCMSq_jzsJpEFbZErqIHso1WQkCaIolJ_QVI.vN_sGkKtcfPap2WPRfdcNeBq7tml5xH70UTLljAdKQuxpeIZE-g-h8uMUw&ref=WJTaNf0B', '', 0x613a33383a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393139313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203220262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b7d),
(143, 45, 1689003185, 2, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 'backend?do=iso_products&id=45&act=edit&rt=451fb63289f.ilegp3SLoYBdrvRL9Y6hrYDkPAGqxwQfsL_TMyFinWM.4WPnz0z52Lct960oluj49fGlelnjg0B08d2QB0MA9TrsGenMHbyXwzzcmw&ref=ze3Iu_5D', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393030333138353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203220262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(144, 45, 1689003185, 2, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 'backend?do=iso_products&id=45&act=edit&rt=451fb63289f.ilegp3SLoYBdrvRL9Y6hrYDkPAGqxwQfsL_TMyFinWM.4WPnz0z52Lct960oluj49fGlelnjg0B08d2QB0MA9TrsGenMHbyXwzzcmw&ref=ze3Iu_5D', '', 0x613a303a7b7d),
(145, 45, 1689003185, 2, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 'backend?do=iso_products&id=45&act=edit&rt=451fb63289f.ilegp3SLoYBdrvRL9Y6hrYDkPAGqxwQfsL_TMyFinWM.4WPnz0z52Lct960oluj49fGlelnjg0B08d2QB0MA9TrsGenMHbyXwzzcmw&ref=ze3Iu_5D', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(146, 32, 1689007625, 3, 'tl_iso_product', 4, 'test', 'Skulptur 2 &#40;quantity 2&#41;', 'backend?act=edit&do=iso_products&id=32&ref=MdCqMBzV&rt=17d9120e195a6a4b207b632e8e749b11.X6O4zqMODWWbWV8J7bHiA2r5UfLQHOuM4ia-rBWlvcw.NJf_ppt8dFLrAAZqjte7Wxu4F6qZWK_no0T9mHfH1ZU57fGlyjk7JvorMA', '1', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393030373632353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a22736b756c707475722d322d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a33313a22536b756c70747572203220262334303b7175616e746974792032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31373a223c703e536b756c7074757220323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2234223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(147, 32, 1689007625, 3, 'tl_iso_product_category', 4, 'test', 'Skulptur 2 &#40;quantity 2&#41;', 'backend?act=edit&do=iso_products&id=32&ref=MdCqMBzV&rt=17d9120e195a6a4b207b632e8e749b11.X6O4zqMODWWbWV8J7bHiA2r5UfLQHOuM4ia-rBWlvcw.NJf_ppt8dFLrAAZqjte7Wxu4F6qZWK_no0T9mHfH1ZU57fGlyjk7JvorMA', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(148, 32, 1689007625, 3, 'tl_iso_product_price', 4, 'test', 'Skulptur 2 &#40;quantity 2&#41;', 'backend?act=edit&do=iso_products&id=32&ref=MdCqMBzV&rt=17d9120e195a6a4b207b632e8e749b11.X6O4zqMODWWbWV8J7bHiA2r5UfLQHOuM4ia-rBWlvcw.NJf_ppt8dFLrAAZqjte7Wxu4F6qZWK_no0T9mHfH1ZU57fGlyjk7JvorMA', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(149, 44, 1689007634, 2, 'tl_iso_product', 4, 'test', 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&id=44&act=edit&rt=b3f233cacaeb95d4ea5.chdVgMFwADrXXjULuBdo-YUlnI3YexBxwN4Zl7AlCFg.GSMS6PkCeQ2nB2xo23ExofRk2tWRP1Qagbxao9JHYAEUWRzrqEc2ebYsWg&ref=HXRACb_t', '1', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393030373633343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35303a2256617269616e7465204b6f70696520766f6e20536b756c70747572203220262334303b7175616e746974792032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(150, 44, 1689007634, 2, 'tl_iso_product_category', 4, 'test', 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&id=44&act=edit&rt=b3f233cacaeb95d4ea5.chdVgMFwADrXXjULuBdo-YUlnI3YexBxwN4Zl7AlCFg.GSMS6PkCeQ2nB2xo23ExofRk2tWRP1Qagbxao9JHYAEUWRzrqEc2ebYsWg&ref=HXRACb_t', '1', 0x613a303a7b7d),
(151, 44, 1689007634, 2, 'tl_iso_product_price', 4, 'test', 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', 'backend?do=iso_products&id=44&act=edit&rt=b3f233cacaeb95d4ea5.chdVgMFwADrXXjULuBdo-YUlnI3YexBxwN4Zl7AlCFg.GSMS6PkCeQ2nB2xo23ExofRk2tWRP1Qagbxao9JHYAEUWRzrqEc2ebYsWg&ref=HXRACb_t', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(152, 45, 1689007641, 3, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 'backend?do=iso_products&id=45&act=edit&rt=b83af863e15e3906c642.M-NcCbnGEMJXR1QlqeUdHikSkXB5xIBSFAtXhjDDyvQ.WNcbYYG0afUnHg1GyoNERlhT1ygwgMQ5VWkUslKhoq1VrRVi0PEmgTY1Ow&ref=s_vEvVON', '1', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393030373634313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203220262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(153, 45, 1689007641, 3, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 'backend?do=iso_products&id=45&act=edit&rt=b83af863e15e3906c642.M-NcCbnGEMJXR1QlqeUdHikSkXB5xIBSFAtXhjDDyvQ.WNcbYYG0afUnHg1GyoNERlhT1ygwgMQ5VWkUslKhoq1VrRVi0PEmgTY1Ow&ref=s_vEvVON', '1', 0x613a303a7b7d),
(154, 45, 1689007641, 3, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', 'backend?do=iso_products&id=45&act=edit&rt=b83af863e15e3906c642.M-NcCbnGEMJXR1QlqeUdHikSkXB5xIBSFAtXhjDDyvQ.WNcbYYG0afUnHg1GyoNERlhT1ygwgMQ5VWkUslKhoq1VrRVi0PEmgTY1Ow&ref=s_vEvVON', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(155, 52, 1689705034, 4, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=87196f1f39fbc32abaa4fe.ldj6gc27gj8CW2bLPTe_Rw8ueNfYl5cEo7VOMZ1VMgE.o4-D0r3U3Q4wNhKyfATeCGtXEoe5_8Yzx9s_evIfdlLfks2spIK6THEQKw&ref=vOPIZsIx', '', 0x613a34303a7b733a323a226964223b693a35323b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393730353033343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203620262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(156, 52, 1689705034, 4, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=87196f1f39fbc32abaa4fe.ldj6gc27gj8CW2bLPTe_Rw8ueNfYl5cEo7VOMZ1VMgE.o4-D0r3U3Q4wNhKyfATeCGtXEoe5_8Yzx9s_evIfdlLfks2spIK6THEQKw&ref=vOPIZsIx', '', 0x613a303a7b7d),
(157, 52, 1689705034, 4, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=52&act=edit&rt=87196f1f39fbc32abaa4fe.ldj6gc27gj8CW2bLPTe_Rw8ueNfYl5cEo7VOMZ1VMgE.o4-D0r3U3Q4wNhKyfATeCGtXEoe5_8Yzx9s_evIfdlLfks2spIK6THEQKw&ref=vOPIZsIx', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34323b733a333a22706964223b693a35323b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34353b733a333a22706964223b693a34323b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(158, 52, 1689705047, 5, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', 'backend?do=iso_products&id=52&act=edit&rt=21c00faab1a251d6c902b41b.9yLe6RDeybOBx8f-5Z22CXSEHszV4HjM9vdhF0muRM0.wXWnumCxloKzqrOHpK7XRhD9dJy0iCn7kpkQXCbkAJ69aOnEeefxwPKMig&ref=awoxtXXR', '', 0x613a34303a7b733a323a226964223b693a35323b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393730353034373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203620262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(159, 52, 1689705047, 5, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', 'backend?do=iso_products&id=52&act=edit&rt=21c00faab1a251d6c902b41b.9yLe6RDeybOBx8f-5Z22CXSEHszV4HjM9vdhF0muRM0.wXWnumCxloKzqrOHpK7XRhD9dJy0iCn7kpkQXCbkAJ69aOnEeefxwPKMig&ref=awoxtXXR', '', 0x613a303a7b7d),
(160, 52, 1689705047, 5, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', 'backend?do=iso_products&id=52&act=edit&rt=21c00faab1a251d6c902b41b.9yLe6RDeybOBx8f-5Z22CXSEHszV4HjM9vdhF0muRM0.wXWnumCxloKzqrOHpK7XRhD9dJy0iCn7kpkQXCbkAJ69aOnEeefxwPKMig&ref=awoxtXXR', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34323b733a333a22706964223b693a35323b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34353b733a333a22706964223b693a34323b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(161, 4, 1689965801, 1, 'tl_member', 4, 'test', '', 'backend?do=member&rt=4f8a8a.JeA0GIXpvksQXDDr7lZI5x9vPvMvahdZFV8LEgol_S4.cL9wIeqL_zxRMkmltgMZjFE3eooXIVwoJGxRWzsSymxvj2ZvwMTzLERxCA&ref=JIA0b5jn&act=edit&id=4', '', 0x613a33383a7b733a323a226964223b693a343b733a363a22747374616d70223b693a313638393936353830313b733a393a2266697273746e616d65223b733a303a22223b733a383a226c6173746e616d65223b733a303a22223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a303a22223b733a363a22706f7374616c223b733a303a22223b733a343a2263697479223b733a303a22223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a303a22223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a303a22223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b4e3b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b4e3b733a383a2270617373776f7264223b733a303a22223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936353737313b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b733a303a22223b7d),
(162, 4, 1689965816, 2, 'tl_member', 4, 'test', 'Test Tester', 'backend?do=member&rt=4f8a8a.JeA0GIXpvksQXDDr7lZI5x9vPvMvahdZFV8LEgol_S4.cL9wIeqL_zxRMkmltgMZjFE3eooXIVwoJGxRWzsSymxvj2ZvwMTzLERxCA&ref=JIA0b5jn&act=edit&id=4', '', 0x613a33383a7b733a323a226964223b693a343b733a363a22747374616d70223b693a313638393936353830313b733a393a2266697273746e616d65223b733a343a2254657374223b733a383a226c6173746e616d65223b733a363a22546573746572223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a303a22223b733a363a22706f7374616c223b733a303a22223b733a343a2263697479223b733a303a22223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a303a22223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a31323a227465737440746573742e6465223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b733a31383a22613a313a7b693a303b733a313a2231223b7d223b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b733a31323a227465737440746573742e6465223b733a383a2270617373776f7264223b733a36303a2224327924313324766a3271592f3157504a353657533477696a41796a2e614d4d6a586372436e4866627a365667526e626e616d356d6d4e6942583747223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936353737313b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b4e3b7d),
(163, 4, 1689965843, 3, 'tl_member', 4, 'test', 'Test Tester', 'backend?do=member&rt=4f8a8a.JeA0GIXpvksQXDDr7lZI5x9vPvMvahdZFV8LEgol_S4.cL9wIeqL_zxRMkmltgMZjFE3eooXIVwoJGxRWzsSymxvj2ZvwMTzLERxCA&ref=JIA0b5jn&act=edit&id=4', '1', 0x613a33383a7b733a323a226964223b693a343b733a363a22747374616d70223b693a313638393936353834333b733a393a2266697273746e616d65223b733a343a2254657374223b733a383a226c6173746e616d65223b733a363a22546573746572223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a303a22223b733a363a22706f7374616c223b733a303a22223b733a343a2263697479223b733a303a22223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a323a226465223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a31323a227465737440746573742e6465223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b733a31383a22613a313a7b693a303b733a313a2231223b7d223b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b733a31323a227465737440746573742e6465223b733a383a2270617373776f7264223b733a36303a2224327924313324655748475759584a4743494e7a4d4e41394f6536746556476f73372e6a77684b4a796c384646306241674b7448316539614c755269223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936353737313b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b4e3b7d),
(164, 5, 1689967934, 1, 'tl_member', 4, 'test', '', 'backend?do=member&rt=673ed877541b2fb36ebc9bfb5741.G9oTDvOiJ7DSAIclt_3UkMCkJTbwWKMd_5bGPoHi3AM.ToVXN5zAZseTbv5r76iF-478YU_IE-hszqWcd7DV60FRtUF5to9q14Ytvw&ref=uqAFhx1-&act=edit&id=5', '', 0x613a33383a7b733a323a226964223b693a353b733a363a22747374616d70223b693a313638393936373933343b733a393a2266697273746e616d65223b733a303a22223b733a383a226c6173746e616d65223b733a303a22223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a303a22223b733a363a22706f7374616c223b733a303a22223b733a343a2263697479223b733a303a22223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a303a22223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a303a22223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b4e3b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b4e3b733a383a2270617373776f7264223b733a303a22223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936373838393b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b733a303a22223b7d),
(165, 5, 1689967952, 2, 'tl_member', 4, 'test', 'Test Tester', 'backend?do=member&rt=673ed877541b2fb36ebc9bfb5741.G9oTDvOiJ7DSAIclt_3UkMCkJTbwWKMd_5bGPoHi3AM.ToVXN5zAZseTbv5r76iF-478YU_IE-hszqWcd7DV60FRtUF5to9q14Ytvw&ref=uqAFhx1-&act=edit&id=5', '', 0x613a33383a7b733a323a226964223b693a353b733a363a22747374616d70223b693a313638393936373935323b733a393a2266697273746e616d65223b733a343a2254657374223b733a383a226c6173746e616d65223b733a363a22546573746572223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a31373a22416d206b6c65696e656e20576567652031223b733a363a22706f7374616c223b733a353a223130303030223b733a343a2263697479223b733a363a224265726c696e223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a323a226465223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a31323a227465737440746573742e6465223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b733a31383a22613a313a7b693a303b733a313a2231223b7d223b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b733a31323a227465737440746573742e6465223b733a383a2270617373776f7264223b733a36303a222432792431332437685972302e736e3376642f364b3968644d58646275576c756f774c707962466f5041666f77467677796c54506672356d59434b4b223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936373838393b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b4e3b7d),
(166, 5, 1689968187, 3, 'tl_member', 4, 'test', 'Test Tester', 'backend?do=member&act=edit&field=disable&id=5&rt=07cf123f7dcd596b3b4d74a8.FxdHlIHm16ztz-JJsn8y42jz9MRyCtGTD4K8XtUWGlM.elAl9c20rcaDh9sQ3AZGoT28uq8CQOjDa-yODodzUipvUSvBzLy-x7n8tw&ref=u9O8YW_f', '', 0x613a33383a7b733a323a226964223b693a353b733a363a22747374616d70223b693a313638393936383138373b733a393a2266697273746e616d65223b733a343a2254657374223b733a383a226c6173746e616d65223b733a363a22546573746572223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a31373a22416d206b6c65696e656e20576567652031223b733a363a22706f7374616c223b733a353a223130303030223b733a343a2263697479223b733a363a224265726c696e223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a323a226465223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a31323a227465737440746573742e6465223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b733a31383a22613a313a7b693a303b733a313a2231223b7d223b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b733a31323a227465737440746573742e6465223b733a383a2270617373776f7264223b733a36303a222432792431332437685972302e736e3376642f364b3968644d58646275576c756f774c707962466f5041666f77467677796c54506672356d59434b4b223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936373838393b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b4e3b7d),
(167, 61, 1689969381, 1, 'tl_page', 4, 'test', 'Anmelden', 'backend?do=page&rt=cbb09c94.J0Ii07ECbAehsCPKNr_xvMYPjDPtTcWArwUizETj7jw.SgVAsv1QFm3P-BqTWMaF_pNAwlidB_zQy2sQnBaGpkVfBE6G_FgFbPWDdg&ref=LxXyV4dO&act=edit&id=61', '1', 0x613a37353a7b733a323a226964223b693a36313b733a333a22706964223b693a313b733a373a22736f7274696e67223b693a3730343b733a363a22747374616d70223b693a313638393936393338313b733a353a227469746c65223b733a383a22416e6d656c64656e223b733a343a2274797065223b733a373a22726567756c6172223b733a353a22616c696173223b733a383a22616e6d656c64656e223b733a31313a22726571756972654974656d223b733a303a22223b733a31333a22726f7574655072696f72697479223b693a303b733a393a22706167655469746c65223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a22726f626f7473223b733a31323a22696e6465782c666f6c6c6f77223b733a31313a226465736372697074696f6e223b4e3b733a383a227265646972656374223b733a393a227065726d616e656e74223b733a363a226a756d70546f223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a333a2275726c223b733a303a22223b733a363a22746172676574223b733a303a22223b733a333a22646e73223b733a303a22223b733a31313a2273746174696346696c6573223b733a303a22223b733a31333a22737461746963506c7567696e73223b733a303a22223b733a383a2266616c6c6261636b223b733a303a22223b733a32333a2264697361626c654c616e67756167655265646972656374223b733a303a22223b733a373a2266617669636f6e223b4e3b733a393a22726f626f7473547874223b4e3b733a31353a226d61696e74656e616e63654d6f6465223b733a303a22223b733a31353a226d61696c65725472616e73706f7274223b733a303a22223b733a31353a22656e61626c6543616e6f6e6963616c223b733a313a2231223b733a31333a2263616e6f6e6963616c4c696e6b223b733a303a22223b733a31393a2263616e6f6e6963616c4b656570506172616d73223b733a303a22223b733a31303a2261646d696e456d61696c223b733a303a22223b733a31303a2264617465466f726d6174223b733a303a22223b733a31303a2274696d65466f726d6174223b733a303a22223b733a31313a22646174696d466f726d6174223b733a303a22223b733a32303a2276616c6964416c69617343686172616374657273223b733a303a22223b733a31323a22757365466f6c64657255726c223b733a303a22223b733a393a2275726c507265666978223b733a303a22223b733a393a2275726c537566666978223b733a303a22223b733a363a2275736553534c223b733a313a2231223b733a31313a226175746f666f7277617264223b733a303a22223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a31333a22696e636c7564654c61796f7574223b733a303a22223b733a363a226c61796f7574223b693a303b733a31333a22737562706167654c61796f7574223b693a303b733a31323a22696e636c7564654361636865223b733a303a22223b733a353a226361636865223b693a303b733a31393a22616c776179734c6f616446726f6d4361636865223b733a303a22223b733a31313a22636c69656e744361636865223b693a303b733a31323a22696e636c75646543686d6f64223b733a303a22223b733a353a226375736572223b693a323b733a363a226367726f7570223b693a313b733a353a2263686d6f64223b733a3136353a22613a31323a7b693a303b733a323a227531223b693a313b733a323a227532223b693a323b733a323a227533223b693a333b733a323a227534223b693a343b733a323a227535223b693a353b733a323a227536223b693a363b733a323a226731223b693a373b733a323a226732223b693a383b733a323a226733223b693a393b733a323a226734223b693a31303b733a323a226735223b693a31313b733a323a226736223b7d223b733a383a226e6f536561726368223b733a303a22223b733a383a22637373436c617373223b733a303a22223b733a373a22736974656d6170223b733a31313a226d61705f64656661756c74223b733a343a2268696465223b733a303a22223b733a363a22677565737473223b733a303a22223b733a383a22746162696e646578223b693a303b733a393a226163636573736b6579223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a31363a22656e666f72636554776f466163746f72223b733a303a22223b733a31353a2274776f466163746f724a756d70546f223b693a303b733a31363a2269736f5f7265616465724a756d70546f223b693a303b733a31343a2269736f5f7265616465724d6f6465223b733a373a2263757272656e74223b733a31323a2269736f5f73746f72655f6964223b693a303b733a31303a2269736f5f636f6e666967223b693a303b733a31333a226c616e67756167655175657279223b733a303a22223b733a31323a226c616e6775616765526f6f74223b693a303b733a31323a226c616e67756167654d61696e223b693a303b733a31323a2265723234436c69656e744964223b733a303a22223b733a31303a2265723234536563726574223b733a303a22223b733a31303a22657232344170694b6579223b733a303a22223b7d),
(168, 255, 1689969410, 1, 'tl_content', 4, 'test', '', 'backend?do=article&rt=b332.Q50B_JSg_UcAJfUru8Ap9zoNzDMU6el3plflQ-q4vyM.Ltpjndjyhy1ubcxy1bldtW9Cglhko9AnwjnXE7jd91o7222p2fqULFQWoA&ref=xC0h_-Cp&table=tl_content&act=edit&id=255', '', 0x613a3130313a7b733a323a226964223b693a3235353b733a343a2274797065223b733a363a226d6f64756c65223b733a333a22706964223b693a36313b733a363a22707461626c65223b733a31303a22746c5f61727469636c65223b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638393936393431303b733a383a22686561646c696e65223b733a34353a22613a323a7b733a353a2276616c7565223b733a303a22223b733a343a22756e6974223b733a323a226832223b7d223b733a343a2274657874223b4e3b733a383a22616464496d616765223b733a303a22223b733a31313a2273686f7750726576696577223b733a303a22223b733a363a22696e6c696e65223b733a303a22223b733a31333a226f76657277726974654d657461223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a22616c74223b733a303a22223b733a31303a22696d6167655469746c65223b733a303a22223b733a343a2273697a65223b733a303a22223b733a31313a22696d6167656d617267696e223b733a303a22223b733a383a22696d61676555726c223b4e3b733a383a2266756c6c73697a65223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a383a22666c6f6174696e67223b733a353a2261626f7665223b733a343a2268746d6c223b4e3b733a383a226c69737474797065223b733a303a22223b733a393a226c6973746974656d73223b4e3b733a31303a227461626c656974656d73223b4e3b733a373a2273756d6d617279223b733a303a22223b733a353a227468656164223b733a303a22223b733a353a2274666f6f74223b733a303a22223b733a353a22746c656674223b733a303a22223b733a383a22736f727461626c65223b733a303a22223b733a393a22736f7274496e646578223b693a303b733a393a22736f72744f72646572223b733a393a22617363656e64696e67223b733a31313a226d6f6f486561646c696e65223b733a303a22223b733a383a226d6f6f5374796c65223b733a303a22223b733a31303a226d6f6f436c6173736573223b733a303a22223b733a393a22686967686c69676874223b733a303a22223b733a31343a226d61726b646f776e536f75726365223b733a31303a22736f7572636554657874223b733a343a22636f6465223b4e3b733a333a2275726c223b4e3b733a363a22746172676574223b733a303a22223b733a31333a226f76657277726974654c696e6b223b733a303a22223b733a393a227469746c6554657874223b733a303a22223b733a393a226c696e6b5469746c65223b733a303a22223b733a353a22656d626564223b733a303a22223b733a333a2272656c223b733a303a22223b733a383a22757365496d616765223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a31303a22757365486f6d65446972223b733a303a22223b733a363a22706572526f77223b693a343b733a373a2270657250616765223b693a303b733a31333a226e756d6265724f664974656d73223b693a303b733a363a22736f72744279223b733a303a22223b733a31303a226d65746149676e6f7265223b733a303a22223b733a31303a2267616c6c65727954706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a393a22706c61796572535243223b4e3b733a373a22796f7574756265223b733a303a22223b733a353a2276696d656f223b733a303a22223b733a393a22706f73746572535243223b4e3b733a31303a22706c6179657253697a65223b733a303a22223b733a31333a22706c617965724f7074696f6e73223b4e3b733a31313a22706c617965725374617274223b693a303b733a31303a22706c6179657253746f70223b693a303b733a31333a22706c6179657243617074696f6e223b733a303a22223b733a31323a22706c61796572417370656374223b733a303a22223b733a31313a2273706c617368496d616765223b733a303a22223b733a31333a22706c617965725072656c6f6164223b733a303a22223b733a31313a22706c61796572436f6c6f72223b733a303a22223b733a31343a22796f75747562654f7074696f6e73223b4e3b733a31323a2276696d656f4f7074696f6e73223b4e3b733a31313a22736c6964657244656c6179223b693a303b733a31313a22736c696465725370656564223b693a3330303b733a31363a22736c696465725374617274536c696465223b693a303b733a31363a22736c69646572436f6e74696e756f7573223b733a303a22223b733a343a2264617461223b4e3b733a383a22637465416c696173223b693a303b733a31323a2261727469636c65416c696173223b693a303b733a373a2261727469636c65223b693a303b733a343a22666f726d223b693a303b733a363a226d6f64756c65223b693a303b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a32383a22613a323a7b693a303b733a303a22223b693a313b733a303a22223b7d223b733a393a22696e76697369626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31313a22636f6d5f70657250616765223b693a303b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31313a2272656d61726b5f69636f6e223b733a343a2273686f77223b733a383a226572323448746d6c223b4e3b733a383a226572323454797065223b733a303a22223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(169, 255, 1689969416, 2, 'tl_content', 4, 'test', '', 'backend?do=article&rt=b332.Q50B_JSg_UcAJfUru8Ap9zoNzDMU6el3plflQ-q4vyM.Ltpjndjyhy1ubcxy1bldtW9Cglhko9AnwjnXE7jd91o7222p2fqULFQWoA&ref=xC0h_-Cp&table=tl_content&act=edit&id=255', '1', 0x613a3130313a7b733a323a226964223b693a3235353b733a343a2274797065223b733a363a226d6f64756c65223b733a333a22706964223b693a36313b733a363a22707461626c65223b733a31303a22746c5f61727469636c65223b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638393936393431363b733a383a22686561646c696e65223b733a34353a22613a323a7b733a353a2276616c7565223b733a303a22223b733a343a22756e6974223b733a323a226832223b7d223b733a343a2274657874223b4e3b733a383a22616464496d616765223b733a303a22223b733a31313a2273686f7750726576696577223b733a303a22223b733a363a22696e6c696e65223b733a303a22223b733a31333a226f76657277726974654d657461223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a22616c74223b733a303a22223b733a31303a22696d6167655469746c65223b733a303a22223b733a343a2273697a65223b733a303a22223b733a31313a22696d6167656d617267696e223b733a303a22223b733a383a22696d61676555726c223b4e3b733a383a2266756c6c73697a65223b733a303a22223b733a373a2263617074696f6e223b733a303a22223b733a383a22666c6f6174696e67223b733a353a2261626f7665223b733a343a2268746d6c223b4e3b733a383a226c69737474797065223b733a303a22223b733a393a226c6973746974656d73223b4e3b733a31303a227461626c656974656d73223b4e3b733a373a2273756d6d617279223b733a303a22223b733a353a227468656164223b733a303a22223b733a353a2274666f6f74223b733a303a22223b733a353a22746c656674223b733a303a22223b733a383a22736f727461626c65223b733a303a22223b733a393a22736f7274496e646578223b693a303b733a393a22736f72744f72646572223b733a393a22617363656e64696e67223b733a31313a226d6f6f486561646c696e65223b733a303a22223b733a383a226d6f6f5374796c65223b733a303a22223b733a31303a226d6f6f436c6173736573223b733a303a22223b733a393a22686967686c69676874223b733a303a22223b733a31343a226d61726b646f776e536f75726365223b733a31303a22736f7572636554657874223b733a343a22636f6465223b4e3b733a333a2275726c223b4e3b733a363a22746172676574223b733a303a22223b733a31333a226f76657277726974654c696e6b223b733a303a22223b733a393a227469746c6554657874223b733a303a22223b733a393a226c696e6b5469746c65223b733a303a22223b733a353a22656d626564223b733a303a22223b733a333a2272656c223b733a303a22223b733a383a22757365496d616765223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a31303a22757365486f6d65446972223b733a303a22223b733a363a22706572526f77223b693a343b733a373a2270657250616765223b693a303b733a31333a226e756d6265724f664974656d73223b693a303b733a363a22736f72744279223b733a303a22223b733a31303a226d65746149676e6f7265223b733a303a22223b733a31303a2267616c6c65727954706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a393a22706c61796572535243223b4e3b733a373a22796f7574756265223b733a303a22223b733a353a2276696d656f223b733a303a22223b733a393a22706f73746572535243223b4e3b733a31303a22706c6179657253697a65223b733a303a22223b733a31333a22706c617965724f7074696f6e73223b4e3b733a31313a22706c617965725374617274223b693a303b733a31303a22706c6179657253746f70223b693a303b733a31333a22706c6179657243617074696f6e223b733a303a22223b733a31323a22706c61796572417370656374223b733a303a22223b733a31313a2273706c617368496d616765223b733a303a22223b733a31333a22706c617965725072656c6f6164223b733a303a22223b733a31313a22706c61796572436f6c6f72223b733a303a22223b733a31343a22796f75747562654f7074696f6e73223b4e3b733a31323a2276696d656f4f7074696f6e73223b4e3b733a31313a22736c6964657244656c6179223b693a303b733a31313a22736c696465725370656564223b693a3330303b733a31363a22736c696465725374617274536c696465223b693a303b733a31363a22736c69646572436f6e74696e756f7573223b733a303a22223b733a343a2264617461223b4e3b733a383a22637465416c696173223b693a303b733a31323a2261727469636c65416c696173223b693a303b733a373a2261727469636c65223b693a303b733a343a22666f726d223b693a303b733a363a226d6f64756c65223b693a32373b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a32383a22613a323a7b693a303b733a303a22223b693a313b733a303a22223b7d223b733a393a22696e76697369626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31313a22636f6d5f70657250616765223b693a303b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31313a2272656d61726b5f69636f6e223b733a343a2273686f77223b733a383a226572323448746d6c223b4e3b733a383a226572323454797065223b733a303a22223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(170, 5, 1689969462, 4, 'tl_member', 4, 'test', 'Test Tester', 'backend?do=member&act=edit&field=disable&id=5&rt=5.IJERV7vR24-Y8MDw4gVVCZoh6zvNttzgBee7TwIhcWo.TdZzNveDoeX2uPmpjHwhS89upVC9_OWwYYmJH1BEORNY130C9ouy5MzDlQ&ref=W2yGHQsn', '1', 0x613a33383a7b733a323a226964223b693a353b733a363a22747374616d70223b693a313638393936393436323b733a393a2266697273746e616d65223b733a343a2254657374223b733a383a226c6173746e616d65223b733a363a22546573746572223b733a31313a22646174654f664269727468223b733a303a22223b733a363a2267656e646572223b733a303a22223b733a373a22636f6d70616e79223b733a303a22223b733a363a22737472656574223b733a31373a22416d206b6c65696e656e20576567652031223b733a363a22706f7374616c223b733a353a223130303030223b733a343a2263697479223b733a363a224265726c696e223b733a353a227374617465223b733a303a22223b733a373a22636f756e747279223b733a323a226465223b733a353a2270686f6e65223b733a303a22223b733a363a226d6f62696c65223b733a303a22223b733a333a22666178223b733a303a22223b733a353a22656d61696c223b733a31323a227465737440746573742e6465223b733a373a2277656273697465223b733a303a22223b733a383a226c616e6775616765223b733a303a22223b733a363a2267726f757073223b733a31383a22613a313a7b693a303b733a313a2231223b7d223b733a353a226c6f67696e223b733a313a2231223b733a383a22757365726e616d65223b733a31323a227465737440746573742e6465223b733a383a2270617373776f7264223b733a36303a222432792431332437685972302e736e3376642f364b3968644d58646275576c756f774c707962466f5041666f77467677796c54506672356d59434b4b223b733a393a2261737369676e446972223b733a303a22223b733a373a22686f6d65446972223b4e3b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22646174654164646564223b693a313638393936373838393b733a393a226c6173744c6f67696e223b693a303b733a31323a2263757272656e744c6f67696e223b693a303b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a373a2273657373696f6e223b4e3b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a31303a226e6577736c6574746572223b4e3b7d),
(171, 40, 1689969766, 1, 'tl_iso_product', 0, NULL, 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 'backend?do=iso_products&id=40&act=edit&rt=fb7333001b201ec.rnN241tWZY-Yfyf-2EiPaOOHAgSt4-XaWt-5SiTT9pw.wzQUghcEH-X2Nx6ntjH7KrbITG_dqdyKPrGLGna2vuXWNRq2FgwM5MxMcg&ref=MUoj7qh0', '', 0x613a33383a7b733a323a226964223b693a34303b733a333a22706964223b693a33333b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383834393539323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323434313233313b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203320262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b7d),
(172, 40, 1689969772, 2, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 'backend?do=iso_products&id=40&act=edit&rt=fb7333001b201ec.rnN241tWZY-Yfyf-2EiPaOOHAgSt4-XaWt-5SiTT9pw.wzQUghcEH-X2Nx6ntjH7KrbITG_dqdyKPrGLGna2vuXWNRq2FgwM5MxMcg&ref=MUoj7qh0', '', 0x613a34303a7b733a323a226964223b693a34303b733a333a22706964223b693a33333b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393936393737323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323434313233313b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203320262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35363a223236302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(173, 40, 1689969772, 2, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 'backend?do=iso_products&id=40&act=edit&rt=fb7333001b201ec.rnN241tWZY-Yfyf-2EiPaOOHAgSt4-XaWt-5SiTT9pw.wzQUghcEH-X2Nx6ntjH7KrbITG_dqdyKPrGLGna2vuXWNRq2FgwM5MxMcg&ref=MUoj7qh0', '', 0x613a303a7b7d),
(174, 40, 1689969772, 2, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 'backend?do=iso_products&id=40&act=edit&rt=fb7333001b201ec.rnN241tWZY-Yfyf-2EiPaOOHAgSt4-XaWt-5SiTT9pw.wzQUghcEH-X2Nx6ntjH7KrbITG_dqdyKPrGLGna2vuXWNRq2FgwM5MxMcg&ref=MUoj7qh0', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33313b733a333a22706964223b693a34303b733a363a22747374616d70223b693a313638323434313235383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223236302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33333b733a333a22706964223b693a33313b733a363a22747374616d70223b693a313638323434313235383b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223236302e3030223b7d7d7d),
(175, 38, 1689969843, 4, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=43c9b38e53ceb5a9607edef.VgAGOjo39kZaOX_I4hQBmd2dZ_306gZ72rQiSZJBCZQ.O0dkW3ZljCw0cUaRjG1124jSKZaEoD8rvtoQGcAkQe0uRmpvd22fLQ4KKg&ref=jiS0b-Tu', '1', 0x613a34303a7b733a323a226964223b693a33383b733a333a22706964223b693a33343b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393936393834333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323433393433343b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203420262334303b7175616e7469747920312c205245534552564544262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a32383a223c703e446965732069737420646173206f726967696e616c3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35363a223235302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(176, 38, 1689969843, 4, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=43c9b38e53ceb5a9607edef.VgAGOjo39kZaOX_I4hQBmd2dZ_306gZ72rQiSZJBCZQ.O0dkW3ZljCw0cUaRjG1124jSKZaEoD8rvtoQGcAkQe0uRmpvd22fLQ4KKg&ref=jiS0b-Tu', '1', 0x613a303a7b7d),
(177, 38, 1689969843, 4, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 4 &#40;quantity 1, RESERVED&#41;', 'backend?do=iso_products&id=38&act=edit&rt=43c9b38e53ceb5a9607edef.VgAGOjo39kZaOX_I4hQBmd2dZ_306gZ72rQiSZJBCZQ.O0dkW3ZljCw0cUaRjG1124jSKZaEoD8rvtoQGcAkQe0uRmpvd22fLQ4KKg&ref=jiS0b-Tu', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323433393838333b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223235302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33323b733a333a22706964223b693a33303b733a363a22747374616d70223b693a313638323434313130333b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223235302e3030223b7d7d7d),
(178, 40, 1689969917, 3, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 'backend?do=iso_products&id=40&act=edit&rt=7.ALDhmSMn4j9LzThii2x4R1ga7RmCZ4SjIxXAg7W0TqM.bfeD-G91mFUlhQE75RUMBQ1Vo3LyLb3zR3vy0-fRBtp49o3Mbn2LVB_-bQ&ref=boL8coOb', '1', 0x613a34303a7b733a323a226964223b693a34303b733a333a22706964223b693a33333b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393936393931373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638323434313233313b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203320262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35363a223236302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(179, 40, 1689969917, 3, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 'backend?do=iso_products&id=40&act=edit&rt=7.ALDhmSMn4j9LzThii2x4R1ga7RmCZ4SjIxXAg7W0TqM.bfeD-G91mFUlhQE75RUMBQ1Vo3LyLb3zR3vy0-fRBtp49o3Mbn2LVB_-bQ&ref=boL8coOb', '1', 0x613a303a7b7d),
(180, 40, 1689969917, 3, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', 'backend?do=iso_products&id=40&act=edit&rt=7.ALDhmSMn4j9LzThii2x4R1ga7RmCZ4SjIxXAg7W0TqM.bfeD-G91mFUlhQE75RUMBQ1Vo3LyLb3zR3vy0-fRBtp49o3Mbn2LVB_-bQ&ref=boL8coOb', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33313b733a333a22706964223b693a34303b733a363a22747374616d70223b693a313638323434313235383b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223236302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33333b733a333a22706964223b693a33313b733a363a22747374616d70223b693a313638323434313235383b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223236302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(181, 49, 1689969966, 4, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '', 0x613a34303a7b733a323a226964223b693a34393b733a333a22706964223b693a33373b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393936393936363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203520262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(182, 49, 1689969966, 4, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '', 0x613a303a7b7d),
(183, 49, 1689969966, 4, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33383b733a333a22706964223b693a34393b733a363a22747374616d70223b693a313638323533373138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323533373138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(184, 49, 1689969991, 5, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '', 0x613a34303a7b733a323a226964223b693a34393b733a333a22706964223b693a33373b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393936393939313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203520262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(185, 49, 1689969991, 5, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '', 0x613a303a7b7d),
(186, 49, 1689969991, 5, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33383b733a333a22706964223b693a34393b733a363a22747374616d70223b693a313638323533373138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323533373138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(187, 49, 1689970020, 6, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '1', 0x613a34303a7b733a323a226964223b693a34393b733a333a22706964223b693a33373b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393937303032303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a36323a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203520262334303b7175616e7469747920312c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(188, 49, 1689970020, 6, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '1', 0x613a303a7b7d),
(189, 49, 1689970020, 6, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', 'backend?do=iso_products&id=49&act=edit&rt=562d5be109a690402cc9e.FFBSvJC7mMut3piM3qM4cJoTCr45ORp6ey7CMGZYOFs.eRcw3dzp4qHDlqHVsNpMMs9cRNVJcyMqH0DwYDQ9cCJsFj7p3eHxoPntzQ&ref=VUm5RCSZ', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33383b733a333a22706964223b693a34393b733a363a22747374616d70223b693a313638323533373138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34303b733a333a22706964223b693a33383b733a363a22747374616d70223b693a313638323533373138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(190, 52, 1689970061, 6, 'tl_iso_product', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', 'backend?do=iso_products&id=52&act=edit&rt=7.YIBtvxSpFJYlUufL24SMzRvYo5I9ijYhq-pgB7C66WU.DccP3lj7bvxLGt6Stf34j06X7flNwA9xz4RSV-LfoRwYxgHqWfN9_XFhsg&ref=EC6ZaQ2x', '1', 0x613a34303a7b733a323a226964223b693a35323b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393937303036313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35333a2256617269616e7465204f726967696e616c20766f6e20536b756c70747572203620262334303b7175616e746974792031262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(191, 52, 1689970061, 6, 'tl_iso_product_category', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', 'backend?do=iso_products&id=52&act=edit&rt=7.YIBtvxSpFJYlUufL24SMzRvYo5I9ijYhq-pgB7C66WU.DccP3lj7bvxLGt6Stf34j06X7flNwA9xz4RSV-LfoRwYxgHqWfN9_XFhsg&ref=EC6ZaQ2x', '1', 0x613a303a7b7d),
(192, 52, 1689970061, 6, 'tl_iso_product_price', 4, 'test', 'Variante Original von Skulptur 6 &#40;quantity 1&#41;', 'backend?do=iso_products&id=52&act=edit&rt=7.YIBtvxSpFJYlUufL24SMzRvYo5I9ijYhq-pgB7C66WU.DccP3lj7bvxLGt6Stf34j06X7flNwA9xz4RSV-LfoRwYxgHqWfN9_XFhsg&ref=EC6ZaQ2x', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34323b733a333a22706964223b693a35323b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34353b733a333a22706964223b693a34323b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(193, 51, 1689970082, 4, 'tl_iso_product', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=79532e7e7ada9fdbca37dd0330.OR1swGupJLzQ6PYowkegUIBuIUbq-xBGLV7FiRl_Bp4.VFoOoSf7Xta-oM9xrD7UEtUhby2asSkWSTD32UsaTudBWwCVJvNN14Tbow&ref=aArRPb5e', '', 0x613a34303a7b733a323a226964223b693a35313b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393937303038323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e7465204b6f70696520766f6e20536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(194, 51, 1689970082, 4, 'tl_iso_product_category', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=79532e7e7ada9fdbca37dd0330.OR1swGupJLzQ6PYowkegUIBuIUbq-xBGLV7FiRl_Bp4.VFoOoSf7Xta-oM9xrD7UEtUhby2asSkWSTD32UsaTudBWwCVJvNN14Tbow&ref=aArRPb5e', '', 0x613a303a7b7d),
(195, 51, 1689970082, 4, 'tl_iso_product_price', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=79532e7e7ada9fdbca37dd0330.OR1swGupJLzQ6PYowkegUIBuIUbq-xBGLV7FiRl_Bp4.VFoOoSf7Xta-oM9xrD7UEtUhby2asSkWSTD32UsaTudBWwCVJvNN14Tbow&ref=aArRPb5e', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34313b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34343b733a333a22706964223b693a34313b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(196, 51, 1689970102, 5, 'tl_iso_product', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=27d.Qrg_0dtOIYziKXgQUiuGY7E_eCq3Kfy6AIlkO6gfNxU.L_9dsJccW-aMYUFJPFLyIeRwNkHHY8XqZOdWa_p6f2w6_lOElhRI57YaLQ&ref=De2G9JaO', '1', 0x613a34303a7b733a323a226964223b693a35313b733a333a22706964223b693a35303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638393937303130323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a35393a2256617269616e7465204b6f70696520766f6e20536b756c70747572203620262334303b7175616e7469747920322c20534f4c444f5554262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(197, 51, 1689970102, 5, 'tl_iso_product_category', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=27d.Qrg_0dtOIYziKXgQUiuGY7E_eCq3Kfy6AIlkO6gfNxU.L_9dsJccW-aMYUFJPFLyIeRwNkHHY8XqZOdWa_p6f2w6_lOElhRI57YaLQ&ref=De2G9JaO', '1', 0x613a303a7b7d),
(198, 51, 1689970102, 5, 'tl_iso_product_price', 4, 'test', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', 'backend?do=iso_products&id=51&act=edit&rt=27d.Qrg_0dtOIYziKXgQUiuGY7E_eCq3Kfy6AIlkO6gfNxU.L_9dsJccW-aMYUFJPFLyIeRwNkHHY8XqZOdWa_p6f2w6_lOElhRI57YaLQ&ref=De2G9JaO', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34313b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638323533373830353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a34343b733a333a22706964223b693a34313b733a363a22747374616d70223b693a313638323533373830353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(199, 15, 1691179793, 1, 'tl_iso_orderstatus', 4, 'test', 'Overbought', 'backend?do=iso_setup&mod=orderstatus&rt=5894428fe2d539de2a334f6.Fh9k7pPxjpK724yxm77A02-yFWRUq6EmKnowqZs5NaM.X2UBufyCo6Drg_nE3tSfhwPhSlYn35lEYQhBwqMOXs54bVWC-IjnoNmsxQ&ref=wi4tGGB3&table=tl_iso_orderstatus&act=edit&id=15', '', 0x613a31303a7b733a323a226964223b693a31353b733a333a22706964223b693a303b733a363a22747374616d70223b693a313639313137393739333b733a373a22736f7274696e67223b693a3132383b733a343a226e616d65223b733a31303a224f766572626f75676874223b733a353a22636f6c6f72223b733a363a22666631353030223b733a343a2270616964223b733a303a22223b733a31333a2277656c636f6d6573637265656e223b733a313a2231223b733a31323a226e6f74696669636174696f6e223b733a303a22223b733a31353a2273616665727061795f737461747573223b733a303a22223b7d),
(200, 17, 1691182018, 1, 'tl_nc_notification', 0, NULL, 'Overbought', 'backend?do=nc_notifications&act=edit&id=17&rt=646ca13417b97bea4f3c162.tiGaNZ-M4h0Q5lZATZDiuLCTJAAF3s1UmE83yIQOkL8._1v_YvD_zy9AviM1CPq97NzAezJ2qvU20z1Go7w5-9LYU6tZ9PWLL3KRHw&ref=fggNcYnw', '1', 0x613a31303a7b733a323a226964223b693a31373b733a363a22747374616d70223b693a313639313137383433393b733a353a227469746c65223b733a31303a224f766572626f75676874223b733a343a2274797065223b733a32333a2269736f5f6f726465725f7374617475735f6368616e6765223b733a31373a22666c617474656e5f64656c696d69746572223b733a313a222c223b733a393a2274656d706c61746573223b4e3b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a31313a2269736f5f67616c6c657279223b693a303b733a31323a2269736f5f646f63756d656e74223b693a303b7d),
(201, 15, 1691182032, 1, 'tl_nc_message', 4, 'test', '', 'backend?do=nc_notifications&rt=7c75.I2ZEel6zNoAl9ztJPXIeS2jIFLlTNVpD5JRLhZ2CCKc.ahwhLTHAG7J1r048eBhBHwSbS4sgQWIhr-Y67qW1Y8pNFHUWNcpfskeAcg&ref=HEIxZtbw&table=tl_nc_message&act=edit&id=15', '', 0x613a31313a7b733a323a226964223b693a31353b733a333a22706964223b693a31373b733a363a22747374616d70223b693a313639313138323033323b733a353a227469746c65223b733a303a22223b733a373a2267617465776179223b693a313b733a31323a22676174657761795f74797065223b733a353a22656d61696c223b733a31343a22656d61696c5f7072696f72697479223b693a333b733a31343a22656d61696c5f74656d706c617465223b733a31323a226d61696c5f64656661756c74223b733a31323a22706f73746d61726b5f746167223b733a303a22223b733a31393a22706f73746d61726b5f747261636b4f70656e73223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b7d),
(202, 27, 1691182090, 1, 'tl_nc_language', 4, 'test', '', 'backend?dcawizard=tl_nc_language%3A15&do=nc_notifications&field=languages&popup=1&rt=dd24bb604b6f8739f030a55a7983.O3v0jzEaY2GRFcWuWqEqOBYNvnTUFaVW1xBwCfVK448.cgGR2F5pTlPBTbDbH8t1bHpe4UanYZ00nGIBYs19iOJVCcXjWmMKU_NijA&ref=5axakIdR&table=tl_nc_language&act=edit&id=27', '1', 0x613a32333a7b733a323a226964223b693a32373b733a333a22706964223b693a31353b733a363a22747374616d70223b693a313639313138323039303b733a31323a22676174657761795f74797065223b733a353a22656d61696c223b733a383a226c616e6775616765223b733a323a226465223b733a383a2266616c6c6261636b223b733a303a22223b733a31303a22726563697069656e7473223b733a31323a227465737440746573742e6465223b733a31373a226174746163686d656e745f746f6b656e73223b733a303a22223b733a31313a226174746163686d656e7473223b4e3b733a32303a226174746163686d656e745f74656d706c61746573223b4e3b733a31373a22656d61696c5f73656e6465725f6e616d65223b733a31323a227465737440746573742e6465223b733a32303a22656d61696c5f73656e6465725f61646472657373223b733a31323a227465737440746573742e6465223b733a31383a22656d61696c5f726563697069656e745f6363223b4e3b733a31393a22656d61696c5f726563697069656e745f626363223b4e3b733a31333a22656d61696c5f7265706c79546f223b733a303a22223b733a31333a22656d61696c5f7375626a656374223b733a32343a2242657374656c6c756e6720c3bc6265727665726b61756674223b733a31303a22656d61696c5f6d6f6465223b733a383a22746578744f6e6c79223b733a31303a22656d61696c5f74657874223b733a34343a224469652042657374656c6c756e67202323756e6971696423232069737420c3bc6265727665726b617566742e223b733a31303a22656d61696c5f68746d6c223b4e3b733a32313a22656d61696c5f65787465726e616c5f696d61676573223b733a303a22223b733a393a2266696c655f6e616d65223b733a303a22223b733a31373a2266696c655f73746f726167655f6d6f6465223b733a303a22223b733a31323a2266696c655f636f6e74656e74223b4e3b7d),
(203, 28, 1691182126, 1, 'tl_nc_language', 4, 'test', '', 'backend?dcawizard=tl_nc_language%3A15&do=nc_notifications&field=languages&popup=1&rt=a2c494f50e289727a44b3e0498.WTmSulSJsYf4POXy44TfgqIGRrk_-vWnE7EOHuH5-Xw.EEP37Tv6nLWoZJCHpu6A1s5VGYtMjs3FWMN_ddnOkhE3S6PWP_DYtZpLrA&ref=fcaDd6Zt&table=tl_nc_language&act=edit&id=28', '1', 0x613a32333a7b733a323a226964223b693a32383b733a333a22706964223b693a31353b733a363a22747374616d70223b693a313639313138323132363b733a31323a22676174657761795f74797065223b733a353a22656d61696c223b733a383a226c616e6775616765223b733a323a22656e223b733a383a2266616c6c6261636b223b733a313a2231223b733a31303a22726563697069656e7473223b733a31323a227465737440746573742e6465223b733a31373a226174746163686d656e745f746f6b656e73223b733a303a22223b733a31313a226174746163686d656e7473223b4e3b733a32303a226174746163686d656e745f74656d706c61746573223b4e3b733a31373a22656d61696c5f73656e6465725f6e616d65223b733a31323a227465737440746573742e6465223b733a32303a22656d61696c5f73656e6465725f61646472657373223b733a31323a227465737440746573742e6465223b733a31383a22656d61696c5f726563697069656e745f6363223b4e3b733a31393a22656d61696c5f726563697069656e745f626363223b4e3b733a31333a22656d61696c5f7265706c79546f223b733a303a22223b733a31333a22656d61696c5f7375626a656374223b733a31363a224f72646572206f766572626f75676874223b733a31303a22656d61696c5f6d6f6465223b733a383a22746578744f6e6c79223b733a31303a22656d61696c5f74657874223b733a33353a22546865206f72646572202323756e697169642323206973206f766572626f756768742e223b733a31303a22656d61696c5f68746d6c223b4e3b733a32313a22656d61696c5f65787465726e616c5f696d61676573223b733a303a22223b733a393a2266696c655f6e616d65223b733a303a22223b733a31373a2266696c655f73746f726167655f6d6f6465223b733a303a22223b733a31323a2266696c655f636f6e74656e74223b4e3b7d),
(204, 15, 1691182431, 2, 'tl_nc_message', 4, 'test', '', 'backend?do=nc_notifications&table=tl_nc_message&id=17&rt=3559d8285e.yeace8arpydUXNkdpy7fFwjZd9iXS8n8a8tn6Evak6A.gJz5LKnYihUEBKxo4kSAQ2SKKOrkP_GeILkWg3Pt-M2nlK0XrdLOFTYrkA&ref=K9ZZ89pN&state=1&tid=15', '1', 0x613a31313a7b733a323a226964223b693a31353b733a333a22706964223b693a31373b733a363a22747374616d70223b693a313639313138323433313b733a353a227469746c65223b733a303a22223b733a373a2267617465776179223b693a313b733a31323a22676174657761795f74797065223b733a353a22656d61696c223b733a31343a22656d61696c5f7072696f72697479223b693a333b733a31343a22656d61696c5f74656d706c617465223b733a31323a226d61696c5f64656661756c74223b733a31323a22706f73746d61726b5f746167223b733a303a22223b733a31393a22706f73746d61726b5f747261636b4f70656e73223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b7d),
(205, 15, 1691183016, 2, 'tl_iso_orderstatus', 4, 'test', 'Overbought', 'backend?do=iso_setup&mod=orderstatus&table=tl_iso_orderstatus&act=edit&id=15&rt=14a7a38f8.qITmUxPmo6Ulb0g4wzTcWqGfI5QLIIZvXJVZZdrODYQ.4f6DBHyVjpd1Nz1Nhl6DDs3MfKZ4VL4NF-coDuL5ZunG9tc_eJ_Kl0cYAQ&ref=O1KRNA5c', '1', 0x613a31303a7b733a323a226964223b693a31353b733a333a22706964223b693a303b733a363a22747374616d70223b693a313639313138333031363b733a373a22736f7274696e67223b693a3132383b733a343a226e616d65223b733a31303a224f766572626f75676874223b733a353a22636f6c6f72223b733a363a22666631353030223b733a343a2270616964223b733a303a22223b733a31333a2277656c636f6d6573637265656e223b733a313a2231223b733a31323a226e6f74696669636174696f6e223b733a323a223137223b733a31353a2273616665727061795f737461747573223b733a303a22223b7d),
(206, 101, 1691357685, 1, 'tl_iso_product', 4, 'test', 'Weitere Variante Kopie von Skulptur 2', 'backend?do=iso_products&rt=f14c8ad39e2297414a3af6dcbf.mZfADw_MdY-rcaGemi2gDeneVdY9aOAQuSxTZfxUENA.8ciNZDyBLf7vH-3w0BjodbO6IoBEAoN-5k0EVLd5Roiu5rpCaoAE591F8A&ref=9mPJSRfw&act=edit&id=101', '1', 0x613a34303a7b733a323a226964223b693a3130313b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313639313335373638353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313639313335373633383b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a33373a22576569746572652056617269616e7465204b6f70696520766f6e20536b756c707475722032223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(207, 101, 1691357685, 1, 'tl_iso_product_category', 4, 'test', 'Weitere Variante Kopie von Skulptur 2', 'backend?do=iso_products&rt=f14c8ad39e2297414a3af6dcbf.mZfADw_MdY-rcaGemi2gDeneVdY9aOAQuSxTZfxUENA.8ciNZDyBLf7vH-3w0BjodbO6IoBEAoN-5k0EVLd5Roiu5rpCaoAE591F8A&ref=9mPJSRfw&act=edit&id=101', '1', 0x613a303a7b7d),
(208, 101, 1691357685, 1, 'tl_iso_product_price', 4, 'test', 'Weitere Variante Kopie von Skulptur 2', 'backend?do=iso_products&rt=f14c8ad39e2297414a3af6dcbf.mZfADw_MdY-rcaGemi2gDeneVdY9aOAQuSxTZfxUENA.8ciNZDyBLf7vH-3w0BjodbO6IoBEAoN-5k0EVLd5Roiu5rpCaoAE591F8A&ref=9mPJSRfw&act=edit&id=101', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35353b733a333a22706964223b693a3130313b733a363a22747374616d70223b693a313639313335373638353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a36303b733a333a22706964223b693a35353b733a363a22747374616d70223b693a313639313335373638353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tl_article`
--
ALTER TABLE `tl_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`),
  ADD KEY `pid_published_incolumn_start_stop` (`pid`,`published`,`inColumn`,`start`,`stop`);

--
-- Indexes for table `tl_calendar`
--
ALTER TABLE `tl_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_calendar_events`
--
ALTER TABLE `tl_calendar_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`),
  ADD KEY `pid_published_featured_start_stop` (`pid`,`published`,`featured`,`start`,`stop`);

--
-- Indexes for table `tl_calendar_feed`
--
ALTER TABLE `tl_calendar_feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`);

--
-- Indexes for table `tl_comments`
--
ALTER TABLE `tl_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`),
  ADD KEY `source_parent_published` (`source`,`parent`,`published`);

--
-- Indexes for table `tl_comments_notify`
--
ALTER TABLE `tl_comments_notify`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_parent_active_email` (`source`,`parent`,`active`,`email`),
  ADD KEY `tokenremove` (`tokenRemove`);

--
-- Indexes for table `tl_content`
--
ALTER TABLE `tl_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid_ptable_invisible_start_stop` (`pid`,`ptable`,`invisible`,`start`,`stop`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `tl_crawl_queue`
--
ALTER TABLE `tl_crawl_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `uri_hash` (`uri_hash`),
  ADD KEY `processed` (`processed`);

--
-- Indexes for table `tl_cron_job`
--
ALTER TABLE `tl_cron_job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `tl_faq`
--
ALTER TABLE `tl_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid_published` (`pid`,`published`);

--
-- Indexes for table `tl_faq_category`
--
ALTER TABLE `tl_faq_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_files`
--
ALTER TABLE `tl_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `path` (`path`(768)),
  ADD KEY `extension` (`extension`);

--
-- Indexes for table `tl_form`
--
ALTER TABLE `tl_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`);

--
-- Indexes for table `tl_form_field`
--
ALTER TABLE `tl_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid_invisible` (`pid`,`invisible`);

--
-- Indexes for table `tl_image_size`
--
ALTER TABLE `tl_image_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_image_size_item`
--
ALTER TABLE `tl_image_size_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_address`
--
ALTER TABLE `tl_iso_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid_store_id` (`pid`,`store_id`);

--
-- Indexes for table `tl_iso_attribute`
--
ALTER TABLE `tl_iso_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `tl_iso_attribute_option`
--
ALTER TABLE `tl_iso_attribute_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ptable_pid` (`ptable`,`pid`);

--
-- Indexes for table `tl_iso_baseprice`
--
ALTER TABLE `tl_iso_baseprice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_config`
--
ALTER TABLE `tl_iso_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_document`
--
ALTER TABLE `tl_iso_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_download`
--
ALTER TABLE `tl_iso_download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_gallery`
--
ALTER TABLE `tl_iso_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_group`
--
ALTER TABLE `tl_iso_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_label`
--
ALTER TABLE `tl_iso_label`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language` (`language`);

--
-- Indexes for table `tl_iso_orderstatus`
--
ALTER TABLE `tl_iso_orderstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `paid` (`paid`);

--
-- Indexes for table `tl_iso_payment`
--
ALTER TABLE `tl_iso_payment`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tl_iso_productcache`
--
ALTER TABLE `tl_iso_productcache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniqid_requestcache_id_keywords_expires` (`uniqid`,`requestcache_id`,`keywords`,`expires`),
  ADD KEY `page_id_module_id_requestcache_id_keywords_expires` (`page_id`,`module_id`,`requestcache_id`,`keywords`,`expires`);

--
-- Indexes for table `tl_iso_producttype`
--
ALTER TABLE `tl_iso_producttype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants` (`variants`);

--
-- Indexes for table `tl_iso_product_category`
--
ALTER TABLE `tl_iso_product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `page_id` (`page_id`);

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
-- Indexes for table `tl_iso_product_collection_download`
--
ALTER TABLE `tl_iso_product_collection_download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_product_collection_item`
--
ALTER TABLE `tl_iso_product_collection_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tl_iso_product_collection_log`
--
ALTER TABLE `tl_iso_product_collection_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_product_collection_surcharge`
--
ALTER TABLE `tl_iso_product_collection_surcharge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_product_price`
--
ALTER TABLE `tl_iso_product_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `config_id_member_group_start_stop_pid` (`config_id`,`member_group`,`start`,`stop`,`pid`);

--
-- Indexes for table `tl_iso_product_pricetier`
--
ALTER TABLE `tl_iso_product_pricetier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_related_category`
--
ALTER TABLE `tl_iso_related_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_related_product`
--
ALTER TABLE `tl_iso_related_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_requestcache`
--
ALTER TABLE `tl_iso_requestcache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_store_id` (`id`,`store_id`);

--
-- Indexes for table `tl_iso_rule`
--
ALTER TABLE `tl_iso_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_rule_restriction`
--
ALTER TABLE `tl_iso_rule_restriction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid_type` (`pid`,`type`),
  ADD KEY `type_object_id_pid` (`type`,`object_id`,`pid`);

--
-- Indexes for table `tl_iso_rule_usage`
--
ALTER TABLE `tl_iso_rule_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_iso_shipping`
--
ALTER TABLE `tl_iso_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_tax_class`
--
ALTER TABLE `tl_iso_tax_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_iso_tax_rate`
--
ALTER TABLE `tl_iso_tax_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_layout`
--
ALTER TABLE `tl_layout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_link_category`
--
ALTER TABLE `tl_link_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_link_data`
--
ALTER TABLE `tl_link_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_log`
--
ALTER TABLE `tl_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_member`
--
ALTER TABLE `tl_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `login_disable_start_stop` (`login`,`disable`,`start`,`stop`);

--
-- Indexes for table `tl_member_group`
--
ALTER TABLE `tl_member_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disable_start_stop` (`disable`,`start`,`stop`);

--
-- Indexes for table `tl_module`
--
ALTER TABLE `tl_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_nc_gateway`
--
ALTER TABLE `tl_nc_gateway`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_croninterval` (`queue_cronInterval`);

--
-- Indexes for table `tl_nc_language`
--
ALTER TABLE `tl_nc_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `language` (`language`);

--
-- Indexes for table `tl_nc_message`
--
ALTER TABLE `tl_nc_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_nc_notification`
--
ALTER TABLE `tl_nc_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_nc_queue`
--
ALTER TABLE `tl_nc_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message` (`message`),
  ADD KEY `sourcequeue` (`sourceQueue`),
  ADD KEY `targetgateway` (`targetGateway`);

--
-- Indexes for table `tl_news`
--
ALTER TABLE `tl_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`),
  ADD KEY `pid_published_featured_start_stop` (`pid`,`published`,`featured`,`start`,`stop`);

--
-- Indexes for table `tl_newsletter`
--
ALTER TABLE `tl_newsletter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_newsletter_channel`
--
ALTER TABLE `tl_newsletter_channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_newsletter_deny_list`
--
ALTER TABLE `tl_newsletter_deny_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pid_hash` (`pid`,`hash`);

--
-- Indexes for table `tl_newsletter_recipients`
--
ALTER TABLE `tl_newsletter_recipients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pid_email` (`pid`,`email`),
  ADD KEY `email` (`email`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `tl_news_archive`
--
ALTER TABLE `tl_news_archive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_news_feed`
--
ALTER TABLE `tl_news_feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`);

--
-- Indexes for table `tl_opt_in`
--
ALTER TABLE `tl_opt_in`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `removeon` (`removeOn`);

--
-- Indexes for table `tl_opt_in_related`
--
ALTER TABLE `tl_opt_in_related`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reltable_relid` (`relTable`,`relId`);

--
-- Indexes for table `tl_page`
--
ALTER TABLE `tl_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`),
  ADD KEY `type_dns` (`type`,`dns`),
  ADD KEY `pid_published_type_start_stop` (`pid`,`published`,`type`,`start`,`stop`),
  ADD KEY `languagemain` (`languageMain`);

--
-- Indexes for table `tl_preview_link`
--
ALTER TABLE `tl_preview_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_published_expiresat` (`id`,`published`,`expiresAt`);

--
-- Indexes for table `tl_remember_me`
--
ALTER TABLE `tl_remember_me`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD KEY `series` (`series`);

--
-- Indexes for table `tl_search`
--
ALTER TABLE `tl_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD UNIQUE KEY `checksum_pid` (`checksum`,`pid`);

--
-- Indexes for table `tl_search_index`
--
ALTER TABLE `tl_search_index`
  ADD PRIMARY KEY (`termId`,`pid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_search_term`
--
ALTER TABLE `tl_search_term`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `term` (`term`),
  ADD KEY `documentfrequency` (`documentFrequency`);

--
-- Indexes for table `tl_style`
--
ALTER TABLE `tl_style`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tl_style_sheet`
--
ALTER TABLE `tl_style_sheet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tl_theme`
--
ALTER TABLE `tl_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_trusted_device`
--
ALTER TABLE `tl_trusted_device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_undo`
--
ALTER TABLE `tl_undo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_user`
--
ALTER TABLE `tl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `tl_user_group`
--
ALTER TABLE `tl_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_version`
--
ALTER TABLE `tl_version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pid_fromtable_version` (`pid`,`fromTable`,`version`),
  ADD KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tl_article`
--
ALTER TABLE `tl_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tl_calendar`
--
ALTER TABLE `tl_calendar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_calendar_events`
--
ALTER TABLE `tl_calendar_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_calendar_feed`
--
ALTER TABLE `tl_calendar_feed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_comments`
--
ALTER TABLE `tl_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_comments_notify`
--
ALTER TABLE `tl_comments_notify`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_content`
--
ALTER TABLE `tl_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `tl_crawl_queue`
--
ALTER TABLE `tl_crawl_queue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_cron_job`
--
ALTER TABLE `tl_cron_job`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `tl_faq`
--
ALTER TABLE `tl_faq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_faq_category`
--
ALTER TABLE `tl_faq_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_files`
--
ALTER TABLE `tl_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tl_form`
--
ALTER TABLE `tl_form`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_form_field`
--
ALTER TABLE `tl_form_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tl_image_size`
--
ALTER TABLE `tl_image_size`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_image_size_item`
--
ALTER TABLE `tl_image_size_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_address`
--
ALTER TABLE `tl_iso_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_iso_attribute`
--
ALTER TABLE `tl_iso_attribute`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tl_iso_attribute_option`
--
ALTER TABLE `tl_iso_attribute_option`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_iso_baseprice`
--
ALTER TABLE `tl_iso_baseprice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_config`
--
ALTER TABLE `tl_iso_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_iso_document`
--
ALTER TABLE `tl_iso_document`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_iso_download`
--
ALTER TABLE `tl_iso_download`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_gallery`
--
ALTER TABLE `tl_iso_gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tl_iso_group`
--
ALTER TABLE `tl_iso_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_label`
--
ALTER TABLE `tl_iso_label`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tl_iso_orderstatus`
--
ALTER TABLE `tl_iso_orderstatus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tl_iso_payment`
--
ALTER TABLE `tl_iso_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tl_iso_product`
--
ALTER TABLE `tl_iso_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `tl_iso_productcache`
--
ALTER TABLE `tl_iso_productcache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_producttype`
--
ALTER TABLE `tl_iso_producttype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tl_iso_product_category`
--
ALTER TABLE `tl_iso_product_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection`
--
ALTER TABLE `tl_iso_product_collection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_download`
--
ALTER TABLE `tl_iso_product_collection_download`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_item`
--
ALTER TABLE `tl_iso_product_collection_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3149;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_log`
--
ALTER TABLE `tl_iso_product_collection_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_surcharge`
--
ALTER TABLE `tl_iso_product_collection_surcharge`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tl_iso_product_price`
--
ALTER TABLE `tl_iso_product_price`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tl_iso_product_pricetier`
--
ALTER TABLE `tl_iso_product_pricetier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tl_iso_related_category`
--
ALTER TABLE `tl_iso_related_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_related_product`
--
ALTER TABLE `tl_iso_related_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_requestcache`
--
ALTER TABLE `tl_iso_requestcache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tl_iso_rule`
--
ALTER TABLE `tl_iso_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_rule_restriction`
--
ALTER TABLE `tl_iso_rule_restriction`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_rule_usage`
--
ALTER TABLE `tl_iso_rule_usage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_shipping`
--
ALTER TABLE `tl_iso_shipping`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tl_iso_tax_class`
--
ALTER TABLE `tl_iso_tax_class`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tl_iso_tax_rate`
--
ALTER TABLE `tl_iso_tax_rate`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_layout`
--
ALTER TABLE `tl_layout`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_link_category`
--
ALTER TABLE `tl_link_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_link_data`
--
ALTER TABLE `tl_link_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_log`
--
ALTER TABLE `tl_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `tl_member`
--
ALTER TABLE `tl_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tl_member_group`
--
ALTER TABLE `tl_member_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_module`
--
ALTER TABLE `tl_module`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tl_nc_gateway`
--
ALTER TABLE `tl_nc_gateway`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_nc_language`
--
ALTER TABLE `tl_nc_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tl_nc_message`
--
ALTER TABLE `tl_nc_message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tl_nc_notification`
--
ALTER TABLE `tl_nc_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tl_nc_queue`
--
ALTER TABLE `tl_nc_queue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_news`
--
ALTER TABLE `tl_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tl_newsletter`
--
ALTER TABLE `tl_newsletter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tl_newsletter_channel`
--
ALTER TABLE `tl_newsletter_channel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_newsletter_deny_list`
--
ALTER TABLE `tl_newsletter_deny_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_newsletter_recipients`
--
ALTER TABLE `tl_newsletter_recipients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tl_news_archive`
--
ALTER TABLE `tl_news_archive`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_news_feed`
--
ALTER TABLE `tl_news_feed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_opt_in`
--
ALTER TABLE `tl_opt_in`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tl_opt_in_related`
--
ALTER TABLE `tl_opt_in_related`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tl_page`
--
ALTER TABLE `tl_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tl_preview_link`
--
ALTER TABLE `tl_preview_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_remember_me`
--
ALTER TABLE `tl_remember_me`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `tl_search`
--
ALTER TABLE `tl_search`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_search_term`
--
ALTER TABLE `tl_search_term`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_style`
--
ALTER TABLE `tl_style`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_style_sheet`
--
ALTER TABLE `tl_style_sheet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_theme`
--
ALTER TABLE `tl_theme`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_trusted_device`
--
ALTER TABLE `tl_trusted_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_undo`
--
ALTER TABLE `tl_undo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tl_user`
--
ALTER TABLE `tl_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tl_user_group`
--
ALTER TABLE `tl_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_version`
--
ALTER TABLE `tl_version`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
