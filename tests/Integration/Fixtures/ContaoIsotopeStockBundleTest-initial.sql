-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 09, 2023 at 03:18 PM
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
(60, 58, 64, 1682433093, 'Kollagen', 'kollagen', 1, 'main', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, '', '', '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '1', '', '', 0, 'sharebuttons_default', '', NULL);

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
(212, 'image', 2, 'tl_news', 64, 1681820807, 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', '<p>Ich bereite eine Ausstellung einiger meiner Kunstobjekte im Pop-Up-Zukunftshaus Rissen vor. Thema: Unsere Wegwerf-Gesellschaft.[nbsp] [nbsp]</p>', '1', '', '', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', NULL, '', '', '', NULL);
INSERT INTO `tl_content` (`id`, `type`, `pid`, `ptable`, `sorting`, `tstamp`, `headline`, `text`, `addImage`, `showPreview`, `inline`, `overwriteMeta`, `singleSRC`, `alt`, `imageTitle`, `size`, `imagemargin`, `imageUrl`, `fullsize`, `caption`, `floating`, `html`, `listtype`, `listitems`, `tableitems`, `summary`, `thead`, `tfoot`, `tleft`, `sortable`, `sortIndex`, `sortOrder`, `mooHeadline`, `mooStyle`, `mooClasses`, `highlight`, `markdownSource`, `code`, `url`, `target`, `overwriteLink`, `titleText`, `linkTitle`, `embed`, `rel`, `useImage`, `multiSRC`, `orderSRC`, `useHomeDir`, `perRow`, `perPage`, `numberOfItems`, `sortBy`, `metaIgnore`, `galleryTpl`, `customTpl`, `playerSRC`, `youtube`, `vimeo`, `posterSRC`, `playerSize`, `playerOptions`, `playerStart`, `playerStop`, `playerCaption`, `playerAspect`, `splashImage`, `playerPreload`, `playerColor`, `youtubeOptions`, `vimeoOptions`, `sliderDelay`, `sliderSpeed`, `sliderStartSlide`, `sliderContinuous`, `data`, `cteAlias`, `articleAlias`, `article`, `form`, `module`, `protected`, `groups`, `guests`, `cssID`, `invisible`, `start`, `stop`, `com_order`, `com_perPage`, `com_moderate`, `com_bbcode`, `com_disableCaptcha`, `com_requireLogin`, `com_template`, `remark_icon`, `er24Html`, `er24Type`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`) VALUES
(215, 'er24_legal_text', 12, 'tl_article', 128, 1679774096, 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', NULL, '', '', '', '', NULL, '', '', '', '', NULL, '', '', 'above', NULL, '', NULL, NULL, '', '', '', '', '', 0, 'ascending', '', '', '', '', 'sourceText', NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, '', 4, 0, 0, '', '', '', '', NULL, '', '', NULL, '', NULL, 0, 0, '', '', '', '', '', NULL, NULL, 0, 300, 0, '', NULL, 0, 0, 0, 0, 0, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', '', '', '', 'ascending', 0, '', '', '', '', '', 'show', 0x3c68313e446174656e73636875747a267368793b65726b6c2661756d6c3b72756e673c2f68313e0a3c68323e312e20446174656e73636875747a206175662065696e656e20426c69636b3c2f68323e0a3c68333e416c6c67656d65696e652048696e77656973653c2f68333e203c703e44696520666f6c67656e64656e2048696e776569736520676562656e2065696e656e2065696e66616368656e202655756d6c3b626572626c69636b206461722675756d6c3b6265722c20776173206d697420496872656e20706572736f6e656e62657a6f67656e656e20446174656e2070617373696572742c2077656e6e20536965206469657365205765627369746520626573756368656e2e20506572736f6e656e62657a6f67656e6520446174656e2073696e6420616c6c6520446174656e2c206d69742064656e656e205369652070657273266f756d6c3b6e6c696368206964656e746966697a696572742077657264656e206b266f756d6c3b6e6e656e2e20417573662675756d6c3b68726c6963686520496e666f726d6174696f6e656e207a756d205468656d6120446174656e73636875747a20656e746e65686d656e2053696520756e736572657220756e7465722064696573656d2054657874206175666765662675756d6c3b687274656e20446174656e73636875747a65726b6c2661756d6c3b72756e672e3c2f703e0a3c68333e446174656e657266617373756e67206175662064696573657220576562736974653c2f68333e203c68343e5765722069737420766572616e74776f72746c69636820662675756d6c3b722064696520446174656e657266617373756e67206175662064696573657220576562736974653f3c2f68343e203c703e44696520446174656e766572617262656974756e6720617566206469657365722057656273697465206572666f6c67742064757263682064656e20576562736974656265747265696265722e2044657373656e204b6f6e74616b74646174656e206b266f756d6c3b6e6e656e205369652064656d2041627363686e6974742026626471756f3b48696e77656973207a757220566572616e74776f72746c696368656e205374656c6c65266c6471756f3b20696e2064696573657220446174656e73636875747a65726b6c2661756d6c3b72756e6720656e746e65686d656e2e3c2f703e203c68343e57696520657266617373656e20776972204968726520446174656e3f3c2f68343e203c703e4968726520446174656e2077657264656e207a756d2065696e656e2064616475726368206572686f62656e2c20646173732053696520756e73206469657365206d69747465696c656e2e2048696572626569206b616e6e2065732073696368207a2e266e6273703b422e20756d20446174656e2068616e64656c6e2c206469652053696520696e2065696e204b6f6e74616b74666f726d756c61722065696e676562656e2e3c2f703e203c703e416e6465726520446174656e2077657264656e206175746f6d617469736368206f646572206e6163682049687265722045696e77696c6c6967756e67206265696d2042657375636820646572205765627369746520647572636820756e736572652049542d53797374656d6520657266617373742e204461732073696e6420766f7220616c6c656d20746563686e697363686520446174656e20287a2e266e6273703b422e20496e7465726e657462726f777365722c20426574726965627373797374656d206f646572205568727a656974206465732053656974656e61756672756673292e2044696520457266617373756e672064696573657220446174656e206572666f6c6774206175746f6d6174697363682c20736f62616c6420536965206469657365205765627369746520626574726574656e2e3c2f703e203c68343e576f662675756d6c3b72206e75747a656e20776972204968726520446174656e3f3c2f68343e203c703e45696e205465696c2064657220446174656e2077697264206572686f62656e2c20756d2065696e65206665686c65726672656965204265726569747374656c6c756e67206465722057656273697465207a75206765772661756d6c3b68726c65697374656e2e20416e6465726520446174656e206b266f756d6c3b6e6e656e207a757220416e616c797365204968726573204e75747a657276657268616c74656e732076657277656e6465742077657264656e2e3c2f703e203c68343e57656c6368652052656368746520686162656e205369652062657a2675756d6c3b676c69636820496872657220446174656e3f3c2f68343e203c703e53696520686162656e206a656465727a656974206461732052656368742c20756e656e7467656c746c696368204175736b756e6674202675756d6c3b626572204865726b756e66742c20456d70662661756d6c3b6e67657220756e64205a7765636b204968726572206765737065696368657274656e20706572736f6e656e62657a6f67656e656e20446174656e207a7520657268616c74656e2e2053696520686162656e20617526737a6c69673b657264656d2065696e2052656368742c2064696520426572696368746967756e67206f646572204c266f756d6c3b736368756e672064696573657220446174656e207a75207665726c616e67656e2e2057656e6e205369652065696e652045696e77696c6c6967756e67207a757220446174656e766572617262656974756e672065727465696c7420686162656e2c206b266f756d6c3b6e6e656e205369652064696573652045696e77696c6c6967756e67206a656465727a65697420662675756d6c3b7220646965205a756b756e6674207769646572727566656e2e20417526737a6c69673b657264656d20686162656e20536965206461732052656368742c20756e7465722062657374696d6d74656e20556d73742661756d6c3b6e64656e206469652045696e736368722661756d6c3b6e6b756e672064657220566572617262656974756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e207a75207665726c616e67656e2e2044657320576569746572656e2073746568742049686e656e2065696e204265736368776572646572656368742062656920646572207a7573742661756d6c3b6e646967656e20417566736963687473626568266f756d6c3b726465207a752e3c2f703e203c703e486965727a7520736f776965207a7520776569746572656e2046726167656e207a756d205468656d6120446174656e73636875747a206b266f756d6c3b6e6e656e205369652073696368206a656465727a65697420616e20756e732077656e64656e2e3c2f703e0a3c68323e322e20486f7374696e673c2f68323e0a3c703e57697220686f7374656e2064696520496e68616c746520756e736572657220576562736974652062656920666f6c67656e64656d20416e6269657465723a3c2f703e0a3c68333e45787465726e657320486f7374696e673c2f68333e203c703e4469657365205765627369746520776972642065787465726e206765686f737465742e2044696520706572736f6e656e62657a6f67656e656e20446174656e2c206469652061756620646965736572205765627369746520657266617373742077657264656e2c2077657264656e206175662064656e205365727665726e2064657320486f7374657273202f2064657220486f737465722067657370656963686572742e2048696572626569206b616e6e206573207369636820762e266e6273703b612e20756d2049502d416472657373656e2c204b6f6e74616b74616e66726167656e2c204d6574612d20756e64204b6f6d6d756e696b6174696f6e73646174656e2c205665727472616773646174656e2c204b6f6e74616b74646174656e2c204e616d656e2c20576562736974657a7567726966666520756e6420736f6e737469676520446174656e2c20646965202675756d6c3b6265722065696e6520576562736974652067656e6572696572742077657264656e2c2068616e64656c6e2e3c2f703e203c703e4461732065787465726e6520486f7374696e67206572666f6c6774207a756d205a7765636b65206465722056657274726167736572662675756d6c3b6c6c756e6720676567656e2675756d6c3b62657220756e736572656e20706f74656e7a69656c6c656e20756e6420626573746568656e64656e204b756e64656e20284172742e2036204162732e2031206c69742e206220445347564f2920756e6420696d20496e746572657373652065696e657220736963686572656e2c207363686e656c6c656e20756e6420656666697a69656e74656e204265726569747374656c6c756e6720756e7365726573204f6e6c696e652d416e6765626f74732064757263682065696e656e2070726f66657373696f6e656c6c656e20416e62696574657220284172742e2036204162732e2031206c69742e206620445347564f292e20536f6665726e2065696e6520656e74737072656368656e64652045696e77696c6c6967756e67206162676566726167742077757264652c206572666f6c67742064696520566572617262656974756e67206175737363686c696526737a6c69673b6c69636820617566204772756e646c61676520766f6e204172742e2036204162732e2031206c69742e206120445347564f20756e642026736563743b203235204162732e20312054544453472c20736f77656974206469652045696e77696c6c6967756e6720646965205370656963686572756e6720766f6e20436f6f6b696573206f6465722064656e205a7567726966662061756620496e666f726d6174696f6e656e20696d20456e646765722661756d6c3b7420646573204e75747a65727320287a2e266e6273703b422e204465766963652d46696e6765727072696e74696e672920696d2053696e6e652064657320545444534720756d66617373742e204469652045696e77696c6c6967756e6720697374206a656465727a6569742077696465727275666261722e3c2f703e203c703e556e73657228652920486f73746572207769726420627a772e2077657264656e204968726520446174656e206e757220696e736f7765697420766572617262656974656e2c207769652064696573207a7572204572662675756d6c3b6c6c756e67207365696e6572204c65697374756e677370666c69636874656e206572666f726465726c6963682069737420756e6420756e736572652057656973756e67656e20696e2042657a75672061756620646965736520446174656e206265666f6c67656e2e3c2f703e203c703e576972207365747a656e20666f6c67656e6465286e2920486f737465722065696e3a3c2f703e0a3c703e486f737473686172696e672065473c6272202f3e0d0a466c7567686166656e7374726126737a6c69673b65203532613c6272202f3e0d0a32323333352048616d627572673c2f703e0a3c68343e4175667472616773766572617262656974756e673c2f68343e203c703e57697220686162656e2065696e656e2056657274726167202675756d6c3b626572204175667472616773766572617262656974756e67202841565629207a7572204e75747a756e6720646573206f62656e2067656e616e6e74656e204469656e737465732067657363686c6f7373656e2e20486965726265692068616e64656c74206573207369636820756d2065696e656e20646174656e73636875747a72656368746c69636820766f72676573636872696562656e656e20566572747261672c20646572206765772661756d6c3b68726c6569737465742c2064617373206469657365722064696520706572736f6e656e62657a6f67656e656e20446174656e20756e736572657220576562736974656265737563686572206e7572206e61636820756e736572656e2057656973756e67656e20756e6420756e7465722045696e68616c74756e672064657220445347564f2076657261726265697465742e3c2f703e0a3c68323e332e20416c6c67656d65696e652048696e776569736520756e642050666c69636874267368793b696e666f726d6174696f6e656e3c2f68323e0a3c68333e446174656e73636875747a3c2f68333e203c703e44696520426574726569626572206469657365722053656974656e206e65686d656e2064656e2053636875747a2049687265722070657273266f756d6c3b6e6c696368656e20446174656e20736568722065726e73742e2057697220626568616e64656c6e204968726520706572736f6e656e62657a6f67656e656e20446174656e20766572747261756c69636820756e6420656e74737072656368656e642064656e2067657365747a6c696368656e20446174656e73636875747a766f7273636872696674656e20736f7769652064696573657220446174656e73636875747a65726b6c2661756d6c3b72756e672e3c2f703e203c703e57656e6e2053696520646965736520576562736974652062656e75747a656e2c2077657264656e20766572736368696564656e6520706572736f6e656e62657a6f67656e6520446174656e206572686f62656e2e20506572736f6e656e62657a6f67656e6520446174656e2073696e6420446174656e2c206d69742064656e656e205369652070657273266f756d6c3b6e6c696368206964656e746966697a696572742077657264656e206b266f756d6c3b6e6e656e2e2044696520766f726c696567656e646520446174656e73636875747a65726b6c2661756d6c3b72756e672065726c2661756d6c3b75746572742c2077656c63686520446174656e20776972206572686562656e20756e6420776f662675756d6c3b722077697220736965206e75747a656e2e205369652065726c2661756d6c3b757465727420617563682c2077696520756e64207a752077656c6368656d205a7765636b20646173206765736368696568742e3c2f703e203c703e5769722077656973656e206461726175662068696e2c20646173732064696520446174656e2675756d6c3b62657274726167756e6720696d20496e7465726e657420287a2e266e6273703b422e2062656920646572204b6f6d6d756e696b6174696f6e2070657220452d4d61696c292053696368657268656974736c2675756d6c3b636b656e2061756677656973656e206b616e6e2e2045696e206c2675756d6c3b636b656e6c6f7365722053636875747a2064657220446174656e20766f722064656d205a7567726966662064757263682044726974746520697374206e69636874206d266f756d6c3b676c6963682e3c2f703e0a3c68333e48696e77656973207a757220766572616e74776f72746c696368656e205374656c6c653c2f68333e203c703e44696520766572616e74776f72746c69636865205374656c6c6520662675756d6c3b722064696520446174656e766572617262656974756e6720617566206469657365722057656273697465206973743a3c2f703e203c703e436c6576657220517569726f7a3c6272202f3e0d0a4b616d657273742675756d6c3b636b656e2038323c6272202f3e0d0a32323538392048616d627572673c2f703e0a0a3c703e54656c65666f6e3a202b34392031353220333830382032392031363c6272202f3e0a452d4d61696c3a207b7b656d61696c3a3a636c656e6f3139373040686f746d61696c2e64657d7d3c2f703e0a203c703e566572616e74776f72746c69636865205374656c6c652069737420646965206e61742675756d6c3b726c69636865206f646572206a7572697374697363686520506572736f6e2c2064696520616c6c65696e206f6465722067656d65696e73616d206d697420616e646572656e202675756d6c3b62657220646965205a7765636b6520756e64204d697474656c2064657220566572617262656974756e6720766f6e20706572736f6e656e62657a6f67656e656e20446174656e20287a2e266e6273703b422e204e616d656e2c20452d4d61696c2d416472657373656e206f2e202641756d6c3b2e2920656e7473636865696465742e3c2f703e0a0a3c68333e537065696368657264617565723c2f68333e203c703e536f7765697420696e6e657268616c622064696573657220446174656e73636875747a65726b6c2661756d6c3b72756e67206b65696e65207370657a69656c6c65726520537065696368657264617565722067656e616e6e742077757264652c20766572626c656962656e204968726520706572736f6e656e62657a6f67656e656e20446174656e2062656920756e732c2062697320646572205a7765636b20662675756d6c3b722064696520446174656e766572617262656974756e6720656e74662661756d6c3b6c6c742e2057656e6e205369652065696e20626572656368746967746573204c266f756d6c3b736368657273756368656e2067656c74656e64206d616368656e206f6465722065696e652045696e77696c6c6967756e67207a757220446174656e766572617262656974756e67207769646572727566656e2c2077657264656e204968726520446174656e2067656c266f756d6c3b736368742c20736f6665726e20776972206b65696e6520616e646572656e2072656368746c696368207a756c2661756d6c3b73736967656e2047722675756d6c3b6e646520662675756d6c3b7220646965205370656963686572756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e20686162656e20287a2e266e6273703b422e207374657565722d206f6465722068616e64656c7372656368746c6963686520417566626577616872756e67736672697374656e293b20696d206c65747a7467656e616e6e74656e2046616c6c206572666f6c677420646965204c266f756d6c3b736368756e67206e61636820466f727466616c6c206469657365722047722675756d6c3b6e64652e3c2f703e0a3c68333e416c6c67656d65696e652048696e7765697365207a752064656e205265636874736772756e646c6167656e2064657220446174656e766572617262656974756e67206175662064696573657220576562736974653c2f68333e203c703e536f6665726e2053696520696e2064696520446174656e766572617262656974756e672065696e676577696c6c69677420686162656e2c20766572617262656974656e20776972204968726520706572736f6e656e62657a6f67656e656e20446174656e20617566204772756e646c61676520766f6e204172742e2036204162732e2031206c69742e206120445347564f20627a772e204172742e2039204162732e2032206c69742e206120445347564f2c20736f6665726e206265736f6e6465726520446174656e6b617465676f7269656e206e616368204172742e2039204162732e203120445347564f2076657261726265697465742077657264656e2e20496d2046616c6c652065696e65722061757364722675756d6c3b636b6c696368656e2045696e77696c6c6967756e6720696e20646965202655756d6c3b62657274726167756e6720706572736f6e656e62657a6f67656e657220446174656e20696e2044726974747374616174656e206572666f6c67742064696520446174656e766572617262656974756e6720617526737a6c69673b657264656d20617566204772756e646c61676520766f6e204172742e203439204162732e2031206c69742e206120445347564f2e20536f6665726e2053696520696e20646965205370656963686572756e6720766f6e20436f6f6b696573206f64657220696e2064656e205a7567726966662061756620496e666f726d6174696f6e656e20696e2049687220456e646765722661756d6c3b7420287a2e266e6273703b422e20766961204465766963652d46696e6765727072696e74696e67292065696e676577696c6c69677420686162656e2c206572666f6c67742064696520446174656e766572617262656974756e67207a75732661756d6c3b747a6c69636820617566204772756e646c61676520766f6e2026736563743b203235204162732e20312054544453472e204469652045696e77696c6c6967756e6720697374206a656465727a6569742077696465727275666261722e2053696e64204968726520446174656e207a75722056657274726167736572662675756d6c3b6c6c756e67206f646572207a7572204475726368662675756d6c3b6872756e6720766f72766572747261676c6963686572204d6126737a6c69673b6e61686d656e206572666f726465726c6963682c20766572617262656974656e20776972204968726520446174656e20617566204772756e646c61676520646573204172742e2036204162732e2031206c69742e206220445347564f2e2044657320576569746572656e20766572617262656974656e20776972204968726520446174656e2c20736f6665726e206469657365207a7572204572662675756d6c3b6c6c756e672065696e65722072656368746c696368656e2056657270666c69636874756e67206572666f726465726c6963682073696e6420617566204772756e646c61676520766f6e204172742e2036204162732e2031206c69742e206320445347564f2e2044696520446174656e766572617262656974756e67206b616e6e206665726e657220617566204772756e646c61676520756e73657265732062657265636874696774656e20496e7465726573736573206e616368204172742e2036204162732e2031206c69742e206620445347564f206572666f6c67656e2e202655756d6c3b62657220646965206a657765696c7320696d2045696e7a656c66616c6c2065696e7363686c2661756d6c3b676967656e205265636874736772756e646c6167656e207769726420696e2064656e20666f6c67656e64656e204162732661756d6c3b747a656e2064696573657220446174656e73636875747a65726b6c2661756d6c3b72756e6720696e666f726d696572742e3c2f703e0a3c68333e57696465727275662049687265722045696e77696c6c6967756e67207a757220446174656e766572617262656974756e673c2f68333e203c703e5669656c6520446174656e766572617262656974756e6773766f72672661756d6c3b6e67652073696e64206e7572206d69742049687265722061757364722675756d6c3b636b6c696368656e2045696e77696c6c6967756e67206d266f756d6c3b676c6963682e20536965206b266f756d6c3b6e6e656e2065696e6520626572656974732065727465696c74652045696e77696c6c6967756e67206a656465727a656974207769646572727566656e2e204469652052656368746d2661756d6c3b26737a6c69673b69676b6569742064657220626973207a756d205769646572727566206572666f6c6774656e20446174656e766572617262656974756e6720626c6569627420766f6d20576964657272756620756e6265722675756d6c3b6872742e3c2f703e0a3c68333e576964657273707275636873726563687420676567656e2064696520446174656e6572686562756e6720696e206265736f6e646572656e20462661756d6c3b6c6c656e20736f77696520676567656e20446972656b7477657262756e6720284172742e20323120445347564f293c2f68333e203c703e57454e4e2044494520444154454e564552415242454954554e4720415546204752554e444c41474520564f4e204152542e2036204142532e2031204c49542e2045204f444552204620445347564f204552464f4c47542c20484142454e20534945204a454445525a454954204441532052454348542c204155532047522655756d6c3b4e44454e2c20444945205349434820415553204948524552204245534f4e444552454e20534954554154494f4e204552474542454e2c20474547454e2044494520564552415242454954554e4720494852455220504552534f4e454e42455a4f47454e454e20444154454e2057494445525350525543482045494e5a554c4547454e3b20444945532047494c54204155434820462655756d6c3b522045494e204155462044494553452042455354494d4d554e47454e20474553542655756d6c3b545a5445532050524f46494c494e472e20444945204a455745494c494745205245434854534752554e444c4147452c204155462044454e454e2045494e4520564552415242454954554e47204245525548542c20454e544e45484d454e205349452044494553455220444154454e53434855545a45524b4c2641756d6c3b52554e472e2057454e4e205349452057494445525350525543482045494e4c4547454e2c2057455244454e20574952204948524520424554524f4646454e454e20504552534f4e454e42455a4f47454e454e20444154454e204e49434854204d45485220564552415242454954454e2c204553205345492044454e4e2c20574952204b264f756d6c3b4e4e454e205a57494e47454e44452053434855545a572655756d6c3b52444947452047522655756d6c3b4e444520462655756d6c3b522044494520564552415242454954554e47204e41434857454953454e2c20444945204948524520494e544552455353454e2c2052454348544520554e44204652454948454954454e202655756d6c3b42455257494547454e204f4445522044494520564552415242454954554e47204449454e54204445522047454c54454e444d414348554e472c204155532655756d6c3b42554e47204f44455220564552544549444947554e4720564f4e20524543485453414e5350522655756d6c3b4348454e20285749444552535052554348204e414348204152542e203231204142532e203120445347564f292e3c2f703e203c703e57455244454e204948524520504552534f4e454e42455a4f47454e454e20444154454e2056455241524245495445542c20554d20444952454b5457455242554e47205a552042455452454942454e2c20534f20484142454e20534945204441532052454348542c204a454445525a45495420574944455253505255434820474547454e2044494520564552415242454954554e47205349452042455452454646454e44455220504552534f4e454e42455a4f47454e455220444154454e205a554d205a5745434b4520444552415254494745522057455242554e472045494e5a554c4547454e3b20444945532047494c54204155434820462655756d6c3b52204441532050524f46494c494e472c20534f57454954204553204d495420534f4c4348455220444952454b5457455242554e4720494e2056455242494e44554e472053544548542e2057454e4e20534945205749444552535052454348454e2c2057455244454e204948524520504552534f4e454e42455a4f47454e454e20444154454e20414e5343484c49455353454e44204e49434854204d454852205a554d205a5745434b452044455220444952454b5457455242554e472056455257454e44455420285749444552535052554348204e414348204152542e203231204142532e203220445347564f292e3c2f703e0a3c68333e42657363687765726465267368793b72656368742062656920646572207a7573742661756d6c3b6e646967656e20417566736963687473267368793b626568266f756d6c3b7264653c2f68333e203c703e496d2046616c6c6520766f6e205665727374266f756d6c3b26737a6c69673b656e20676567656e2064696520445347564f2073746568742064656e20426574726f6666656e656e2065696e20426573636877657264657265636874206265692065696e657220417566736963687473626568266f756d6c3b7264652c20696e736265736f6e6465726520696e2064656d204d6974676c696564737461617420696872657320676577266f756d6c3b686e6c696368656e20417566656e7468616c74732c2069687265732041726265697473706c61747a6573206f64657220646573204f72747320646573206d75746d6126737a6c69673b6c696368656e2056657273746f26737a6c69673b6573207a752e2044617320426573636877657264657265636874206265737465687420756e62657363686164657420616e64657277656974696765722076657277616c74756e677372656368746c6963686572206f64657220676572696368746c696368657220526563687473626568656c66652e3c2f703e0a3c68333e52656368742061756620446174656e267368793b2675756d6c3b62657274726167267368793b6261726b6569743c2f68333e203c703e53696520686162656e206461732052656368742c20446174656e2c206469652077697220617566204772756e646c6167652049687265722045696e77696c6c6967756e67206f64657220696e204572662675756d6c3b6c6c756e672065696e6573205665727472616773206175746f6d617469736965727420766572617262656974656e2c20616e2073696368206f64657220616e2065696e656e204472697474656e20696e2065696e656d20672661756d6c3b6e676967656e2c206d61736368696e656e6c6573626172656e20466f726d617420617573682661756d6c3b6e646967656e207a75206c617373656e2e20536f6665726e205369652064696520646972656b7465202655756d6c3b62657274726167756e672064657220446174656e20616e2065696e656e20616e646572656e20566572616e74776f72746c696368656e207665726c616e67656e2c206572666f6c67742064696573206e75722c20736f7765697420657320746563686e69736368206d616368626172206973742e3c2f703e0a3c68333e4175736b756e66742c20426572696368746967756e6720756e64204c266f756d6c3b736368756e673c2f68333e203c703e53696520686162656e20696d205261686d656e206465722067656c74656e64656e2067657365747a6c696368656e2042657374696d6d756e67656e206a656465727a656974206461732052656368742061756620756e656e7467656c746c69636865204175736b756e6674202675756d6c3b6265722049687265206765737065696368657274656e20706572736f6e656e62657a6f67656e656e20446174656e2c20646572656e204865726b756e667420756e6420456d70662661756d6c3b6e67657220756e642064656e205a7765636b2064657220446174656e766572617262656974756e6720756e64206767662e2065696e2052656368742061756620426572696368746967756e67206f646572204c266f756d6c3b736368756e672064696573657220446174656e2e20486965727a7520736f776965207a7520776569746572656e2046726167656e207a756d205468656d6120706572736f6e656e62657a6f67656e6520446174656e206b266f756d6c3b6e6e656e205369652073696368206a656465727a65697420616e20756e732077656e64656e2e3c2f703e0a3c68333e5265636874206175662045696e736368722661756d6c3b6e6b756e672064657220566572617262656974756e673c2f68333e203c703e53696520686162656e206461732052656368742c206469652045696e736368722661756d6c3b6e6b756e672064657220566572617262656974756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e207a75207665726c616e67656e2e20486965727a75206b266f756d6c3b6e6e656e205369652073696368206a656465727a65697420616e20756e732077656e64656e2e20446173205265636874206175662045696e736368722661756d6c3b6e6b756e672064657220566572617262656974756e67206265737465687420696e20666f6c67656e64656e20462661756d6c3b6c6c656e3a3c2f703e203c756c3e203c6c693e57656e6e205369652064696520526963687469676b6569742049687265722062656920756e73206765737065696368657274656e20706572736f6e656e62657a6f67656e656e20446174656e206265737472656974656e2c2062656e266f756d6c3b746967656e2077697220696e2064657220526567656c205a6569742c20756d2064696573207a75202675756d6c3b62657270722675756d6c3b66656e2e20462675756d6c3b7220646965204461756572206465722050722675756d6c3b66756e6720686162656e20536965206461732052656368742c206469652045696e736368722661756d6c3b6e6b756e672064657220566572617262656974756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e207a75207665726c616e67656e2e3c2f6c693e203c6c693e57656e6e2064696520566572617262656974756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e20756e72656368746d2661756d6c3b26737a6c69673b696720676573636861682f6765736368696568742c206b266f756d6c3b6e6e656e2053696520737461747420646572204c266f756d6c3b736368756e67206469652045696e736368722661756d6c3b6e6b756e672064657220446174656e766572617262656974756e67207665726c616e67656e2e3c2f6c693e203c6c693e57656e6e20776972204968726520706572736f6e656e62657a6f67656e656e20446174656e206e69636874206d6568722062656e266f756d6c3b746967656e2c2053696520736965206a65646f6368207a7572204175732675756d6c3b62756e672c20566572746569646967756e67206f6465722047656c74656e646d616368756e6720766f6e20526563687473616e7370722675756d6c3b6368656e2062656e266f756d6c3b746967656e2c20686162656e20536965206461732052656368742c20737461747420646572204c266f756d6c3b736368756e67206469652045696e736368722661756d6c3b6e6b756e672064657220566572617262656974756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e207a75207665726c616e67656e2e3c2f6c693e203c6c693e57656e6e205369652065696e656e205769646572737072756368206e616368204172742e203231204162732e203120445347564f2065696e67656c65677420686162656e2c206d7573732065696e65204162772661756d6c3b67756e67207a7769736368656e20496872656e20756e6420756e736572656e20496e746572657373656e20766f7267656e6f6d6d656e2077657264656e2e20536f6c616e6765206e6f6368206e69636874206665737473746568742c2077657373656e20496e746572657373656e202675756d6c3b62657277696567656e2c20686162656e20536965206461732052656368742c206469652045696e736368722661756d6c3b6e6b756e672064657220566572617262656974756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e207a75207665726c616e67656e2e3c2f6c693e203c2f756c3e203c703e57656e6e205369652064696520566572617262656974756e6720496872657220706572736f6e656e62657a6f67656e656e20446174656e2065696e6765736368722661756d6c3b6e6b7420686162656e2c20642675756d6c3b7266656e20646965736520446174656e20266e646173683b20766f6e206968726572205370656963686572756e672061626765736568656e20266e646173683b206e7572206d69742049687265722045696e77696c6c6967756e67206f646572207a75722047656c74656e646d616368756e672c204175732675756d6c3b62756e67206f64657220566572746569646967756e6720766f6e20526563687473616e7370722675756d6c3b6368656e206f646572207a756d2053636875747a20646572205265636874652065696e657220616e646572656e206e61742675756d6c3b726c696368656e206f646572206a757269737469736368656e20506572736f6e206f646572206175732047722675756d6c3b6e64656e2065696e65732077696368746967656e20266f756d6c3b6666656e746c696368656e20496e746572657373657320646572204575726f702661756d6c3b69736368656e20556e696f6e206f6465722065696e6573204d6974676c6965647374616174732076657261726265697465742077657264656e2e3c2f703e0a3c68333e576964657273707275636820676567656e2057657262652d452d4d61696c733c2f68333e203c703e446572204e75747a756e6720766f6e20696d205261686d656e2064657220496d7072657373756d7370666c6963687420766572266f756d6c3b6666656e746c69636874656e204b6f6e74616b74646174656e207a7572202655756d6c3b62657273656e64756e6720766f6e206e696368742061757364722675756d6c3b636b6c69636820616e6765666f726465727465722057657262756e6720756e6420496e666f726d6174696f6e736d6174657269616c69656e207769726420686965726d69742077696465727370726f6368656e2e2044696520426574726569626572206465722053656974656e20626568616c74656e20736963682061757364722675756d6c3b636b6c6963682072656368746c6963686520536368726974746520696d2046616c6c652064657220756e7665726c616e6774656e205a7573656e64756e6720766f6e205765726265696e666f726d6174696f6e656e2c2065747761206475726368205370616d2d452d4d61696c732c20766f722e3c2f703e0a3c68323e342e20446174656e657266617373756e67206175662064696573657220576562736974653c2f68323e0a3c68333e436f6f6b6965733c2f68333e203c703e556e7365726520496e7465726e657473656974656e2076657277656e64656e20736f2067656e616e6e74652026626471756f3b436f6f6b696573266c6471756f3b2e20436f6f6b6965732073696e64206b6c65696e6520446174656e70616b65746520756e64207269636874656e2061756620496872656d20456e646765722661756d6c3b74206b65696e656e205363686164656e20616e2e205369652077657264656e20656e74776564657220766f722675756d6c3b626572676568656e6420662675756d6c3b72206469652044617565722065696e6572205369747a756e67202853657373696f6e2d436f6f6b69657329206f6465722064617565726861667420287065726d616e656e746520436f6f6b696573292061756620496872656d20456e646765722661756d6c3b742067657370656963686572742e2053657373696f6e2d436f6f6b6965732077657264656e206e61636820456e64652049687265732042657375636873206175746f6d6174697363682067656c266f756d6c3b736368742e205065726d616e656e746520436f6f6b69657320626c656962656e2061756620496872656d20456e646765722661756d6c3b742067657370656963686572742c20626973205369652064696573652073656c627374206c266f756d6c3b736368656e206f6465722065696e65206175746f6d61746973636865204c266f756d6c3b736368756e6720647572636820496872656e2057656262726f77736572206572666f6c67742e3c2f703e203c703e436f6f6b696573206b266f756d6c3b6e6e656e20766f6e20756e73202846697273742d50617274792d436f6f6b69657329206f64657220766f6e204472697474756e7465726e65686d656e207374616d6d656e2028736f672e2054686972642d50617274792d436f6f6b696573292e2054686972642d50617274792d436f6f6b6965732065726d266f756d6c3b676c696368656e206469652045696e62696e64756e672062657374696d6d746572204469656e73746c65697374756e67656e20766f6e204472697474756e7465726e65686d656e20696e6e657268616c6220766f6e2057656273656974656e20287a2e266e6273703b422e20436f6f6b696573207a75722041627769636b6c756e6720766f6e205a61686c756e67736469656e73746c65697374756e67656e292e3c2f703e203c703e436f6f6b69657320686162656e20766572736368696564656e652046756e6b74696f6e656e2e205a61686c72656963686520436f6f6b6965732073696e6420746563686e69736368206e6f7477656e6469672c2064612062657374696d6d74652057656273656974656e66756e6b74696f6e656e206f686e65206469657365206e696368742066756e6b74696f6e696572656e20772675756d6c3b7264656e20287a2e266e6273703b422e2064696520576172656e6b6f726266756e6b74696f6e206f6465722064696520416e7a6569676520766f6e20566964656f73292e20416e6465726520436f6f6b696573206b266f756d6c3b6e6e656e207a75722041757377657274756e6720646573204e75747a657276657268616c74656e73206f646572207a752057657262657a7765636b656e2076657277656e6465742077657264656e2e3c2f703e203c703e436f6f6b6965732c20646965207a7572204475726368662675756d6c3b6872756e672064657320656c656b74726f6e69736368656e204b6f6d6d756e696b6174696f6e73766f7267616e67732c207a7572204265726569747374656c6c756e672062657374696d6d7465722c20766f6e2049686e656e206572772675756d6c3b6e7363687465722046756e6b74696f6e656e20287a2e266e6273703b422e20662675756d6c3b722064696520576172656e6b6f726266756e6b74696f6e29206f646572207a7572204f7074696d696572756e6720646572205765627369746520287a2e266e6273703b422e20436f6f6b696573207a7572204d657373756e6720646573205765627075626c696b756d7329206572666f726465726c6963682073696e6420286e6f7477656e6469676520436f6f6b696573292c2077657264656e20617566204772756e646c61676520766f6e204172742e2036204162732e2031206c69742e206620445347564f2067657370656963686572742c20736f6665726e206b65696e6520616e64657265205265636874736772756e646c61676520616e6765676562656e20776972642e204465722057656273697465626574726569626572206861742065696e2062657265636874696774657320496e7465726573736520616e20646572205370656963686572756e6720766f6e206e6f7477656e646967656e20436f6f6b696573207a757220746563686e69736368206665686c657266726569656e20756e64206f7074696d69657274656e204265726569747374656c6c756e67207365696e6572204469656e7374652e20536f6665726e2065696e652045696e77696c6c6967756e67207a7572205370656963686572756e6720766f6e20436f6f6b69657320756e6420766572676c65696368626172656e2057696564657265726b656e6e756e6773746563686e6f6c6f6769656e206162676566726167742077757264652c206572666f6c67742064696520566572617262656974756e67206175737363686c696526737a6c69673b6c69636820617566204772756e646c616765206469657365722045696e77696c6c6967756e6720284172742e2036204162732e2031206c69742e206120445347564f20756e642026736563743b203235204162732e2031205454445347293b206469652045696e77696c6c6967756e6720697374206a656465727a6569742077696465727275666261722e3c2f703e203c703e536965206b266f756d6c3b6e6e656e20496872656e2042726f7773657220736f2065696e7374656c6c656e2c206461737320536965202675756d6c3b62657220646173205365747a656e20766f6e20436f6f6b69657320696e666f726d696572742077657264656e20756e6420436f6f6b696573206e757220696d2045696e7a656c66616c6c2065726c617562656e2c2064696520416e6e61686d6520766f6e20436f6f6b69657320662675756d6c3b722062657374696d6d746520462661756d6c3b6c6c65206f6465722067656e6572656c6c206175737363686c696526737a6c69673b656e20736f77696520646173206175746f6d61746973636865204c266f756d6c3b736368656e2064657220436f6f6b696573206265696d205363686c696526737a6c69673b656e206465732042726f777365727320616b746976696572656e2e2042656920646572204465616b746976696572756e6720766f6e20436f6f6b696573206b616e6e206469652046756e6b74696f6e616c69742661756d6c3b742064696573657220576562736974652065696e6765736368722661756d6c3b6e6b74207365696e2e3c2f703e203c703e57656c63686520436f6f6b69657320756e64204469656e737465206175662064696573657220576562736974652065696e67657365747a742077657264656e2c206b266f756d6c3b6e6e656e205369652064696573657220446174656e73636875747a65726b6c2661756d6c3b72756e6720656e746e65686d656e2e3c2f703e0a3c68333e5365727665722d4c6f672d4461746569656e3c2f68333e203c703e4465722050726f7669646572206465722053656974656e2065726865627420756e6420737065696368657274206175746f6d61746973636820496e666f726d6174696f6e656e20696e20736f2067656e616e6e74656e205365727665722d4c6f672d4461746569656e2c20646965204968722042726f77736572206175746f6d61746973636820616e20756e73202675756d6c3b6265726d697474656c742e20446965732073696e643a3c2f703e203c756c3e203c6c693e42726f7773657274797020756e642042726f7773657276657273696f6e3c2f6c693e203c6c693e76657277656e646574657320426574726965627373797374656d3c2f6c693e203c6c693e52656665727265722055524c3c2f6c693e203c6c693e486f73746e616d6520646573207a756772656966656e64656e20526563686e6572733c2f6c693e203c6c693e5568727a6569742064657220536572766572616e66726167653c2f6c693e203c6c693e49502d416472657373653c2f6c693e203c2f756c3e203c703e45696e65205a7573616d6d656e662675756d6c3b6872756e672064696573657220446174656e206d697420616e646572656e20446174656e7175656c6c656e2077697264206e6963687420766f7267656e6f6d6d656e2e3c2f703e203c703e44696520457266617373756e672064696573657220446174656e206572666f6c677420617566204772756e646c61676520766f6e204172742e2036204162732e2031206c69742e206620445347564f2e204465722057656273697465626574726569626572206861742065696e2062657265636874696774657320496e7465726573736520616e2064657220746563686e69736368206665686c657266726569656e204461727374656c6c756e6720756e6420646572204f7074696d696572756e67207365696e6572205765627369746520266e646173683b20686965727a75206d2675756d6c3b7373656e20646965205365727665722d4c6f672d46696c657320657266617373742077657264656e2e3c2f703e0a3c68333e4b6f6e74616b74666f726d756c61723c2f68333e203c703e57656e6e2053696520756e7320706572204b6f6e74616b74666f726d756c617220416e66726167656e207a756b6f6d6d656e206c617373656e2c2077657264656e204968726520416e676162656e206175732064656d20416e6672616765666f726d756c617220696e6b6c75736976652064657220766f6e2049686e656e20646f727420616e6765676562656e656e204b6f6e74616b74646174656e207a7765636b73204265617262656974756e672064657220416e667261676520756e6420662675756d6c3b722064656e2046616c6c20766f6e20416e7363686c75737366726167656e2062656920756e732067657370656963686572742e20446965736520446174656e20676562656e20776972206e69636874206f686e6520496872652045696e77696c6c6967756e67207765697465722e3c2f703e203c703e44696520566572617262656974756e672064696573657220446174656e206572666f6c677420617566204772756e646c61676520766f6e204172742e2036204162732e2031206c69742e206220445347564f2c20736f6665726e204968726520416e6672616765206d697420646572204572662675756d6c3b6c6c756e672065696e6573205665727472616773207a7573616d6d656e682661756d6c3b6e6774206f646572207a7572204475726368662675756d6c3b6872756e6720766f72766572747261676c6963686572204d6126737a6c69673b6e61686d656e206572666f726465726c696368206973742e20496e20616c6c656e202675756d6c3b62726967656e20462661756d6c3b6c6c656e206265727568742064696520566572617262656974756e672061756620756e736572656d2062657265636874696774656e20496e7465726573736520616e2064657220656666656b746976656e204265617262656974756e672064657220616e20756e7320676572696368746574656e20416e66726167656e20284172742e2036204162732e2031206c69742e206620445347564f29206f646572206175662049687265722045696e77696c6c6967756e6720284172742e2036204162732e2031206c69742e206120445347564f2920736f6665726e206469657365206162676566726167742077757264653b206469652045696e77696c6c6967756e6720697374206a656465727a6569742077696465727275666261722e3c2f703e203c703e44696520766f6e2049686e656e20696d204b6f6e74616b74666f726d756c61722065696e6765676562656e656e20446174656e20766572626c656962656e2062656920756e732c206269732053696520756e73207a7572204c266f756d6c3b736368756e6720617566666f726465726e2c20496872652045696e77696c6c6967756e67207a7572205370656963686572756e67207769646572727566656e206f64657220646572205a7765636b20662675756d6c3b722064696520446174656e7370656963686572756e6720656e74662661756d6c3b6c6c7420287a2e266e6273703b422e206e61636820616267657363686c6f7373656e6572204265617262656974756e6720496872657220416e6672616765292e205a77696e67656e64652067657365747a6c696368652042657374696d6d756e67656e20266e646173683b20696e736265736f6e6465726520417566626577616872756e67736672697374656e20266e646173683b20626c656962656e20756e6265722675756d6c3b6872742e3c2f703e0a3c68333e416e66726167652070657220452d4d61696c2c2054656c65666f6e206f6465722054656c656661783c2f68333e203c703e57656e6e2053696520756e732070657220452d4d61696c2c2054656c65666f6e206f6465722054656c65666178206b6f6e74616b74696572656e2c2077697264204968726520416e667261676520696e6b6c757369766520616c6c65722064617261757320686572766f72676568656e64656e20706572736f6e656e62657a6f67656e656e20446174656e20284e616d652c20416e667261676529207a756d205a7765636b6520646572204265617262656974756e6720496872657320416e6c696567656e732062656920756e7320676573706569636865727420756e642076657261726265697465742e20446965736520446174656e20676562656e20776972206e69636874206f686e6520496872652045696e77696c6c6967756e67207765697465722e3c2f703e203c703e44696520566572617262656974756e672064696573657220446174656e206572666f6c677420617566204772756e646c61676520766f6e204172742e2036204162732e2031206c69742e206220445347564f2c20736f6665726e204968726520416e6672616765206d697420646572204572662675756d6c3b6c6c756e672065696e6573205665727472616773207a7573616d6d656e682661756d6c3b6e6774206f646572207a7572204475726368662675756d6c3b6872756e6720766f72766572747261676c6963686572204d6126737a6c69673b6e61686d656e206572666f726465726c696368206973742e20496e20616c6c656e202675756d6c3b62726967656e20462661756d6c3b6c6c656e206265727568742064696520566572617262656974756e672061756620756e736572656d2062657265636874696774656e20496e7465726573736520616e2064657220656666656b746976656e204265617262656974756e672064657220616e20756e7320676572696368746574656e20416e66726167656e20284172742e2036204162732e2031206c69742e206620445347564f29206f646572206175662049687265722045696e77696c6c6967756e6720284172742e2036204162732e2031206c69742e206120445347564f2920736f6665726e206469657365206162676566726167742077757264653b206469652045696e77696c6c6967756e6720697374206a656465727a6569742077696465727275666261722e3c2f703e203c703e44696520766f6e2049686e656e20616e20756e7320706572204b6f6e74616b74616e66726167656e202675756d6c3b62657273616e6474656e20446174656e20766572626c656962656e2062656920756e732c206269732053696520756e73207a7572204c266f756d6c3b736368756e6720617566666f726465726e2c20496872652045696e77696c6c6967756e67207a7572205370656963686572756e67207769646572727566656e206f64657220646572205a7765636b20662675756d6c3b722064696520446174656e7370656963686572756e6720656e74662661756d6c3b6c6c7420287a2e266e6273703b422e206e61636820616267657363686c6f7373656e6572204265617262656974756e6720496872657320416e6c696567656e73292e205a77696e67656e64652067657365747a6c696368652042657374696d6d756e67656e20266e646173683b20696e736265736f6e646572652067657365747a6c6963686520417566626577616872756e67736672697374656e20266e646173683b20626c656962656e20756e6265722675756d6c3b6872742e3c2f703e0a3c68333e4b6f6d6d656e746172267368793b66756e6b74696f6e206175662064696573657220576562736974653c2f68333e203c703e462675756d6c3b7220646965204b6f6d6d656e74617266756e6b74696f6e20617566206469657365722053656974652077657264656e206e6562656e20496872656d204b6f6d6d656e746172206175636820416e676162656e207a756d205a65697470756e6b74206465722045727374656c6c756e6720646573204b6f6d6d656e746172732c204968726520452d4d61696c2d4164726573736520756e642c2077656e6e20536965206e6963687420616e6f6e796d20706f7374656e2c2064657220766f6e2049686e656e206765772661756d6c3b686c7465204e75747a65726e616d652067657370656963686572742e3c2f703e0a3c68343e41626f6e6e696572656e20766f6e204b6f6d6d656e746172656e3c2f68343e203c703e416c73204e75747a657220646572205365697465206b266f756d6c3b6e6e656e20536965206e6163682065696e657220416e6d656c64756e67204b6f6d6d656e746172652061626f6e6e696572656e2e2053696520657268616c74656e2065696e6520426573742661756d6c3b746967756e6773656d61696c2c20756d207a752070722675756d6c3b66656e2c206f62205369652064657220496e68616265722064657220616e6765676562656e656e20452d4d61696c2d416472657373652073696e642e20536965206b266f756d6c3b6e6e656e2064696573652046756e6b74696f6e206a656465727a656974202675756d6c3b6265722065696e656e204c696e6b20696e2064656e20496e666f2d4d61696c7320616262657374656c6c656e2e2044696520696d205261686d656e206465732041626f6e6e696572656e7320766f6e204b6f6d6d656e746172656e2065696e6765676562656e656e20446174656e2077657264656e20696e2064696573656d2046616c6c2067656c266f756d6c3b736368743b2077656e6e2053696520646965736520446174656e20662675756d6c3b7220616e64657265205a7765636b6520756e6420616e20616e6465726572205374656c6c6520287a2e266e6273703b422e204e6577736c657474657262657374656c6c756e672920616e20756e73202675756d6c3b6265726d697474656c7420686162656e2c20766572626c656962656e20646965736520446174656e206a65646f63682062656920756e732e3c2f703e0a3c68343e5370656963686572646175657220646572204b6f6d6d656e746172653c2f68343e203c703e446965204b6f6d6d656e7461726520756e64206469652064616d69742076657262756e64656e656e20446174656e2077657264656e20676573706569636865727420756e6420766572626c656962656e206175662064696573657220576562736974652c2062697320646572206b6f6d6d656e74696572746520496e68616c7420766f6c6c73742661756d6c3b6e6469672067656c266f756d6c3b73636874207775726465206f64657220646965204b6f6d6d656e74617265206175732072656368746c696368656e2047722675756d6c3b6e64656e2067656c266f756d6c3b736368742077657264656e206d2675756d6c3b7373656e20287a2e266e6273703b422e2062656c6569646967656e6465204b6f6d6d656e74617265292e3c2f703e0a3c68343e5265636874736772756e646c6167653c2f68343e203c703e446965205370656963686572756e6720646572204b6f6d6d656e74617265206572666f6c677420617566204772756e646c6167652049687265722045696e77696c6c6967756e6720284172742e2036204162732e2031206c69742e206120445347564f292e20536965206b266f756d6c3b6e6e656e2065696e6520766f6e2049686e656e2065727465696c74652045696e77696c6c6967756e67206a656465727a656974207769646572727566656e2e2044617a75207265696368742065696e6520666f726d6c6f7365204d69747465696c756e672070657220452d4d61696c20616e20756e732e204469652052656368746d2661756d6c3b26737a6c69673b69676b656974206465722062657265697473206572666f6c6774656e20446174656e766572617262656974756e6773766f72672661756d6c3b6e676520626c6569627420766f6d20576964657272756620756e6265722675756d6c3b6872742e3c2f703e0a3c68323e352e204e6577736c65747465723c2f68323e0a3c68333e4e6577736c6574746572267368793b646174656e3c2f68333e203c703e57656e6e205369652064656e2061756620646572205765627369746520616e6765626f74656e656e204e6577736c65747465722062657a696568656e206d266f756d6c3b636874656e2c2062656e266f756d6c3b746967656e2077697220766f6e2049686e656e2065696e6520452d4d61696c2d4164726573736520736f77696520496e666f726d6174696f6e656e2c2077656c63686520756e7320646965202655756d6c3b62657270722675756d6c3b66756e672067657374617474656e2c2064617373205369652064657220496e68616265722064657220616e6765676562656e656e20452d4d61696c2d416472657373652073696e6420756e64206d69742064656d20456d7066616e6720646573204e6577736c6574746572732065696e7665727374616e64656e2073696e642e205765697465726520446174656e2077657264656e206e6963687420627a772e206e757220617566206672656977696c6c69676572204261736973206572686f62656e2e20446965736520446174656e2076657277656e64656e20776972206175737363686c696526737a6c69673b6c69636820662675756d6c3b722064656e2056657273616e642064657220616e6765666f7264657274656e20496e666f726d6174696f6e656e20756e6420676562656e206469657365206e6963687420616e20447269747465207765697465722e3c2f703e203c703e44696520566572617262656974756e672064657220696e20646173204e6577736c6574746572616e6d656c6465666f726d756c61722065696e6765676562656e656e20446174656e206572666f6c6774206175737363686c696526737a6c69673b6c69636820617566204772756e646c6167652049687265722045696e77696c6c6967756e6720284172742e2036204162732e2031206c69742e206120445347564f292e204469652065727465696c74652045696e77696c6c6967756e67207a7572205370656963686572756e672064657220446174656e2c2064657220452d4d61696c2d4164726573736520736f77696520646572656e204e75747a756e67207a756d2056657273616e6420646573204e6577736c657474657273206b266f756d6c3b6e6e656e20536965206a656465727a656974207769646572727566656e2c2065747761202675756d6c3b6265722064656e2026626471756f3b41757374726167656e266c6471756f3b2d4c696e6b20696d204e6577736c65747465722e204469652052656368746d2661756d6c3b26737a6c69673b69676b656974206465722062657265697473206572666f6c6774656e20446174656e766572617262656974756e6773766f72672661756d6c3b6e676520626c6569627420766f6d20576964657272756620756e6265722675756d6c3b6872742e3c2f703e203c703e44696520766f6e2049686e656e207a756d205a7765636b6520646573204e6577736c65747465722d42657a7567732062656920756e732068696e7465726c656774656e20446174656e2077657264656e20766f6e20756e7320626973207a752049687265722041757374726167756e67206175732064656d204e6577736c65747465722062656920756e7320627a772e2064656d204e6577736c65747465726469656e737465616e62696574657220676573706569636865727420756e64206e6163682064657220416262657374656c6c756e6720646573204e6577736c657474657273206f646572206e616368205a7765636b666f727466616c6c2061757320646572204e6577736c65747465727665727465696c65726c697374652067656c266f756d6c3b736368742e2057697220626568616c74656e20756e7320766f722c20452d4d61696c2d416472657373656e2061757320756e736572656d204e6577736c65747465727665727465696c6572206e61636820656967656e656d2045726d657373656e20696d205261686d656e20756e73657265732062657265636874696774656e20496e7465726573736573206e616368204172742e2036204162732e2031206c69742e206620445347564f207a75206c266f756d6c3b736368656e206f646572207a75207370657272656e2e3c2f703e203c703e446174656e2c20646965207a7520616e646572656e205a7765636b656e2062656920756e732067657370656963686572742077757264656e2c20626c656962656e2068696572766f6e20756e6265722675756d6c3b6872742e3c2f703e203c703e4e6163682049687265722041757374726167756e672061757320646572204e6577736c65747465727665727465696c65726c697374652077697264204968726520452d4d61696c2d416472657373652062656920756e7320627a772e2064656d204e6577736c65747465726469656e737465616e626965746572206767662e20696e2065696e657220426c61636b6c6973742067657370656963686572742c20736f6665726e2064696573207a75722056657268696e646572756e67206b2675756d6c3b6e667469676572204d61696c696e6773206572666f726465726c696368206973742e2044696520446174656e206175732064657220426c61636b6c6973742077657264656e206e757220662675756d6c3b722064696573656e205a7765636b2076657277656e64657420756e64206e69636874206d697420616e646572656e20446174656e207a7573616d6d656e6765662675756d6c3b6872742e2044696573206469656e7420736f776f686c20496872656d20496e7465726573736520616c73206175636820756e736572656d20496e7465726573736520616e206465722045696e68616c74756e67206465722067657365747a6c696368656e20566f72676162656e206265696d2056657273616e6420766f6e204e6577736c65747465726e202862657265636874696774657320496e7465726573736520696d2053696e6e6520646573204172742e2036204162732e2031206c69742e206620445347564f292e20446965205370656963686572756e6720696e2064657220426c61636b6c69737420697374207a6569746c696368206e69636874206265667269737465742e203c7374726f6e673e536965206b266f756d6c3b6e6e656e20646572205370656963686572756e67207769646572737072656368656e2c20736f6665726e204968726520496e746572657373656e20756e7365722062657265636874696774657320496e74657265737365202675756d6c3b62657277696567656e2e3c2f7374726f6e673e3c2f703e0a3c68323e362e2065436f6d6d6572636520756e64205a61686c756e6773267368793b616e6269657465723c2f68323e0a3c68333e566572617262656974656e20766f6e204b756e64656e2d20756e64205665727472616773646174656e3c2f68333e203c703e576972206572686562656e2c20766572617262656974656e20756e64206e75747a656e20706572736f6e656e62657a6f67656e65204b756e64656e2d20756e64205665727472616773646174656e207a757220426567722675756d6c3b6e64756e672c20696e68616c746c696368656e2041757367657374616c74756e6720756e64202641756d6c3b6e646572756e6720756e736572657220566572747261677362657a696568756e67656e2e20506572736f6e656e62657a6f67656e6520446174656e202675756d6c3b6265722064696520496e616e7370727563686e61686d6520646965736572205765627369746520284e75747a756e6773646174656e29206572686562656e2c20766572617262656974656e20756e64206e75747a656e20776972206e75722c20736f776569742064696573206572666f726465726c696368206973742c20756d2064656d204e75747a65722064696520496e616e7370727563686e61686d6520646573204469656e73746573207a752065726d266f756d6c3b676c696368656e206f6465722061627a75726563686e656e2e205265636874736772756e646c6167652068696572662675756d6c3b7220697374204172742e2036204162732e2031206c69742e206220445347564f2e3c2f703e203c703e446965206572686f62656e656e204b756e64656e646174656e2077657264656e206e6163682041627363686c75737320646573204175667472616773206f646572204265656e646967756e67206465722047657363682661756d6c3b66747362657a696568756e6720756e642041626c61756620646572206767662e20626573746568656e64656e2067657365747a6c696368656e20417566626577616872756e67736672697374656e2067656c266f756d6c3b736368742e2047657365747a6c6963686520417566626577616872756e67736672697374656e20626c656962656e20756e6265722675756d6c3b6872742e3c2f703e, 'privacy_policy', '', '', NULL);
INSERT INTO `tl_content` (`id`, `type`, `pid`, `ptable`, `sorting`, `tstamp`, `headline`, `text`, `addImage`, `showPreview`, `inline`, `overwriteMeta`, `singleSRC`, `alt`, `imageTitle`, `size`, `imagemargin`, `imageUrl`, `fullsize`, `caption`, `floating`, `html`, `listtype`, `listitems`, `tableitems`, `summary`, `thead`, `tfoot`, `tleft`, `sortable`, `sortIndex`, `sortOrder`, `mooHeadline`, `mooStyle`, `mooClasses`, `highlight`, `markdownSource`, `code`, `url`, `target`, `overwriteLink`, `titleText`, `linkTitle`, `embed`, `rel`, `useImage`, `multiSRC`, `orderSRC`, `useHomeDir`, `perRow`, `perPage`, `numberOfItems`, `sortBy`, `metaIgnore`, `galleryTpl`, `customTpl`, `playerSRC`, `youtube`, `vimeo`, `posterSRC`, `playerSize`, `playerOptions`, `playerStart`, `playerStop`, `playerCaption`, `playerAspect`, `splashImage`, `playerPreload`, `playerColor`, `youtubeOptions`, `vimeoOptions`, `sliderDelay`, `sliderSpeed`, `sliderStartSlide`, `sliderContinuous`, `data`, `cteAlias`, `articleAlias`, `article`, `form`, `module`, `protected`, `groups`, `guests`, `cssID`, `invisible`, `start`, `stop`, `com_order`, `com_perPage`, `com_moderate`, `com_bbcode`, `com_disableCaptcha`, `com_requireLogin`, `com_template`, `remark_icon`, `er24Html`, `er24Type`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`) VALUES
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
(1, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMinutely', '2023-07-09 17:17:07'),
(2, 'Contao\\CoreBundle\\Cron\\LegacyCron::onHourly', '2023-07-09 17:15:32'),
(3, 'Contao\\CoreBundle\\Cron\\LegacyCron::onDaily', '2023-07-09 17:15:32'),
(4, 'Contao\\CoreBundle\\Cron\\LegacyCron::onWeekly', '2023-07-09 17:15:32'),
(5, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMonthly', '2023-07-08 21:22:58'),
(6, 'Contao\\CoreBundle\\Cron\\PurgeExpiredDataCron::onHourly', '2023-07-09 17:15:32'),
(7, 'Contao\\CoreBundle\\Cron\\PurgePreviewLinksCron', '2023-07-09 17:15:32'),
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
(100, 112, 1671542256, 'tl_iso_product_collection', '', 0, '', '', 'Ernst', 'Jendritzki', '', 'Zukunftsdesign', '', 'Blütenweg', '', '', '22589', 'Hamburg', '', 'de', '040414318121', 'ernstjendritzki@web.de', '', ''),
(135, 2, 1671907891, 'tl_member', '', 0, '', '', 'Ernst', 'Jendritzki', '', 'Zukunftsdesign', '', 'Blütenweg', '', '', '22589', 'Hamburg', '', 'de', '040414318121', 'ernstjendritzki@web.de', '', ''),
(200, 244, 1678912742, 'tl_iso_product_collection', '', 0, '', '', 'Ernst-August Karl-Otto', 'Jendritzki', '', 'Nachhaltig im Web', '', 'Blütenweg 11', '', '', '22589', 'Hamburg', '', 'de', '040414318121', 'ernstjendritzki@web.de', '1', ''),
(202, 256, 1682602764, 'tl_iso_product_collection', '', 0, '', '', 'Ernst', 'Jendritzki', '', 'Zukunftsdesign', '', 'Blütenweg', '', '', '22589', 'Hamburg', '', 'de', '040414318121', 'ernst.jendritzki@nachhaltig-im-web.de', '', '');

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
(10, 0, 0, 0, 'Pending', '', '', '1', '', ''),
(11, 0, 0, 128, 'Processing', '', '', '', '', ''),
(12, 0, 0, 256, 'Complete', '', '1', '', '', ''),
(13, 0, 0, 384, 'On Hold', '', '', '', '', ''),
(14, 0, 0, 512, 'Cancelled', '', '', '', '', '');

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
  `inventory_status` char(1) NOT NULL DEFAULT '2',
  `quantity` varchar(255) NOT NULL DEFAULT '',
  `status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_iso_product`
--

INSERT INTO `tl_iso_product` (`id`, `pid`, `gid`, `tstamp`, `language`, `dateAdded`, `type`, `orderPages`, `inherit`, `fallback`, `alias`, `gtin`, `sku`, `name`, `teaser`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `baseprice`, `shipping_weight`, `shipping_exempt`, `shipping_pickup`, `shipping_price`, `images`, `protected`, `groups`, `guests`, `published`, `start`, `stop`, `cssID`, `length`, `width`, `height`, `inventory_status`, `quantity`, `status`) VALUES
(31, 0, 0, 1688849403, '', 1679071375, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-1', '', 'S0001', 'Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', NULL, '<p>Skulptur 1</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '37', '28', '24', '1', '', 0),
(32, 0, 0, 1688849149, '', 1679072602, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-2-quantity-2', '', 'S0002', 'Skulptur 2 &#40;quantity 2&#41;', NULL, '<p>Skulptur 2</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '18', '12', '2', '2', 0),
(33, 0, 0, 1688848904, '', 1679072864, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'elbperlen', '', 'S0003', 'Skulptur 3 &#40;quantity 3&#41;', NULL, '<p>Skulptur 3</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '25', '25', '6', '2', '3', 0),
(34, 0, 0, 1688849872, '', 1679073170, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-4-unlimited', '', 'S0004', 'Skulptur 4 &#40;unlimited&#41;', NULL, '<p>Skulptur 4</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '50', '12', '2', '', 0),
(35, 0, 0, 1688850847, '', 1679073393, 9, 'a:1:{i:0;s:2:\"58\";}', NULL, '', 'eintrittskarte-1-quantity-100', '', 'K0001', 'Eintrittskarte 1 &#40;quantity 100&#41;', NULL, '<p>Karte</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '100', 0),
(37, 0, 0, 1688849955, '', 1682433897, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-5-quantity-2', '', 'S0005', 'Skulptur 5 &#40;quantity 2&#41;', NULL, '<p>Figur 5</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 0),
(38, 34, 0, 1688849787, '', 1682439434, 0, NULL, NULL, '', '', '', '', 'Variante Original von S0004 &#40;quantity 1, RESERVED&#41;', NULL, '<p>Dies ist das original</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '3', '1', 1),
(39, 34, 0, 1688849843, '', 1682439491, 0, NULL, NULL, '', '', '', '', 'Variante Kopie von Skulptur 4 &#40;unlimited&#41;', NULL, '<p>Dies ist eine Kopie</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(40, 33, 0, 1688849592, '', 1682441231, 0, NULL, NULL, '', '', '', '', 'Variante Original von Skulptur 3 &#40;quantity 1&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(42, 33, 0, 1688849566, '', 1682441268, 0, NULL, NULL, '', '', '', '', 'Variante Kopie von Skulptur 3 &#40;unlimited&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(44, 32, 0, 1688849206, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Kopie von Skulptur 2 &#40;quantity 2&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 2),
(45, 32, 0, 1688849191, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 2 &#40;quantity 1&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(46, 31, 0, 1688849337, '', 0, 0, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, '', '', '', '', 'Variante Kopie von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '1', '', 2),
(47, 31, 0, 1688849045, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 1 &#40;unlimited, UNSELLABLE&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '1', '', 1),
(48, 37, 0, 1688849998, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Kopie von Skulptur 5 &#40;quantity 2&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 2),
(49, 37, 0, 1688850043, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 5 &#40;quantity 1, SOLDOUT&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '1', 1),
(50, 0, 0, 1688850131, '', 1682537805, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-6', '', 'S0006', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', NULL, '<p>Figur 6</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '2', 0),
(51, 50, 0, 1688850217, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '2', 2),
(52, 50, 0, 1688850184, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '1', 1),
(88, 0, 0, 1688848903, '', 1688593283, 6, 'a:1:{i:0;s:2:\"32\";}', NULL, '', 'bild-unlimited', '', 'B0001', 'Bild 1 &#40;no variants, unlimited&#41;', NULL, '<p>Bild 1</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '', 0),
(89, 0, 0, 1688852265, '', 1688846985, 6, 'a:1:{i:0;s:2:\"32\";}', NULL, '', 'bild-2-quantity-2', '', 'B0002', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', NULL, '<p>Bild 2</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '2', 0),
(90, 0, 0, 0, '', 1688850377, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', '', '', '', 'Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', NULL, '<p>Figur 6</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '4', '2', 0),
(91, 90, 0, 1688850377, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Kopie von Skulptur 6 &#40;quantity 2, SOLDOUT&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '', '', '', '', '', '', '', '4', '2', 2),
(92, 90, 0, 1688850377, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante Original von Skulptur 6 &#40;quantity 1, SOLDOUT&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '', '', '', '', '', '', '', '4', '1', 1),
(93, 0, 0, 1688850431, '', 1688850385, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-7-quantity-100', '', 'S0007', 'Skulptur 7 &#40;quantity 100&#41;', NULL, '<p>Figur 6</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '100', 0),
(94, 93, 0, 1688850504, '', 0, 0, NULL, 0x613a323a7b693a303b733a383a227175616e74697479223b693a313b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante 1 von Skulptur 7 &#40;quantity -&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 2),
(95, 93, 0, 1688850481, '', 0, 0, NULL, 0x613a323a7b693a303b733a383a227175616e74697479223b693a313b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Variante 1 von Skulptur 7 &#40;quantity -&#41;', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(96, 35, 0, 1688850958, '', 0, 0, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, '', '', '', '', 'Eintrittskarte online', NULL, NULL, '', NULL, NULL, '', '', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(97, 35, 0, 1688850975, '', 0, 0, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, '', '', '', '', 'Eintrittskarte Schalter', NULL, NULL, '', NULL, NULL, '', '', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 1);

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
(7, 1688576615, 'Skulpturen', 'standard', '', NULL, '', '1', 'iso_list_default', 'iso_reader_enhanced', 1, 2, '', 0x613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d, '1', 0x613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a31303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d, '1', '', ''),
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
(61, 89, 256, 1688852265, 32);

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
(3102, 263, 1688846529, 35, 'standard', 'K0001', 'Schneller schlau', 0x613a303a7b7d, 2, '100.00', '100.00', '', 58),
(3103, 263, 1688571424, 45, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3104, 263, 1688571460, 44, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a323b7d, 2, '0.00', '0.00', '', 33),
(3105, 263, 1688846529, 88, 'standard', 'B0001', 'Bild unlimited', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32),
(3106, 264, 1688761560, 35, 'standard', 'K0001', 'Schneller schlau', 0x613a303a7b7d, 2, '100.00', '100.00', '', 58),
(3107, 264, 1688761560, 45, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3108, 264, 1688761560, 44, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a323b7d, 2, '0.00', '0.00', '', 33),
(3109, 264, 1688761560, 88, 'standard', 'B0001', 'Bild unlimited', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32),
(3112, 265, 1688852341, 88, 'standard', 'B0001', 'Bild 1 &#40;no variants, unlimited&#41;', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32),
(3113, 265, 1688852341, 89, 'standard', 'B0002', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 0x613a303a7b7d, 1, '0.00', '0.00', '', 32);

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
(51, 89, 1688852184, 3, 0, 0, '', '');

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
(56, 51, 1688852184, 1, '0.00');

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
(1, 1688846355, 0, 0x613a333a7b733a373a2266696c74657273223b4e3b733a383a22736f7274696e6773223b4e3b733a363a226c696d697473223b613a313a7b693a33323b4f3a32363a2249736f746f70655c5265717565737443616368655c4c696d6974223a313a7b733a31313a22002a00696e744c696d6974223b693a323b7d7d7d),
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
(27, 1688842433, 'FE', 'CRON', 'anon.', 'Purged the temp folder', 'Contao\\Automator::purgeTempFolder', 'N/A'),
(28, 1688842433, 'FE', 'CRON', 'anon.', 'Purged the expired double opt-in tokens', 'Contao\\Automator::purgeOptInTokens', 'N/A'),
(29, 1688842543, 'BE', 'ACCESS', 'anon.', 'Could not find user &quot;ernst.jendritzki@nachhaltig-im-web.de&quot;', 'Contao\\CoreBundle\\Security\\Authentication\\AuthenticationFailureHandler::logException', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(30, 1688842548, 'BE', 'ACCESS', 'anon.', 'Could not find user &quot;ernst.jendritzki@nachhaltig-im-web.de&quot;', 'Contao\\CoreBundle\\Security\\Authentication\\AuthenticationFailureHandler::logException', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(31, 1688845210, 'BE', 'ACCESS', 'ernst.jendritzki@nachhaltig-im-web.de', 'User &quot;ernst.jendritzki@nachhaltig-im-web.de&quot; has logged in', 'Contao\\CoreBundle\\Security\\Authentication\\AuthenticationSuccessHandler::onAuthenticationSuccess', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(32, 1688845570, 'BE', 'GENERAL', 'ernst.jendritzki@nachhaltig-im-web.de', 'A new entry &quot;tl_user.id=4&quot; has been created', 'Contao\\DC_Table::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(33, 1688845607, 'BE', 'GENERAL', 'ernst.jendritzki@nachhaltig-im-web.de', 'Version 1 of record &quot;tl_user.id=4&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(34, 1688845618, 'BE', 'GENERAL', 'ernst.jendritzki@nachhaltig-im-web.de', 'Version 2 of record &quot;tl_user.id=4&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(35, 1688845706, 'BE', 'ACCESS', 'ernst.jendritzki@nachhaltig-im-web.de', 'User &quot;ernst.jendritzki@nachhaltig-im-web.de&quot; has logged out', 'Contao\\CoreBundle\\EventListener\\Security\\LogoutSuccessListener::logout', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(36, 1688845714, 'BE', 'ACCESS', 'test', 'User &quot;test&quot; has logged in', 'Contao\\CoreBundle\\Security\\Authentication\\AuthenticationSuccessHandler::onAuthenticationSuccess', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(37, 1688846133, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_layout.id=1&quot; has been created (parent records: tl_theme.id=1)', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(38, 1688846158, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_page.id=1&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(39, 1688846340, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(40, 1688846344, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(41, 1688846356, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(42, 1688846361, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(43, 1688846372, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(44, 1688846503, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(45, 1688846506, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(46, 1688846510, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(47, 1688846524, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(48, 1688846529, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(49, 1688851693, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(50, 1688851698, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(51, 1688851701, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(52, 1688851845, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(53, 1688851850, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(54, 1688851873, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(55, 1688851882, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(56, 1688851899, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_iso_producttype.id=9&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(57, 1688851913, 'BE', 'GENERAL', 'test', 'Version 2 of record &quot;tl_iso_producttype.id=9&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(58, 1688851928, 'BE', 'GENERAL', 'test', 'Version 3 of record &quot;tl_iso_producttype.id=9&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(59, 1688851952, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_page.id=58&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(60, 1688851972, 'BE', 'GENERAL', 'test', 'Version 2 of record &quot;tl_page.id=58&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(61, 1688851998, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(62, 1688851998, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(63, 1688852003, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(64, 1688852007, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(65, 1688852030, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(66, 1688852035, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(67, 1688852051, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(68, 1688852061, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(69, 1688852078, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(70, 1688852088, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(71, 1688852095, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(72, 1688852117, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(73, 1688852119, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(74, 1688852123, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(75, 1688852127, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(76, 1688852134, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(77, 1688852138, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(78, 1688852143, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(79, 1688852148, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(80, 1688852176, 'BE', 'GENERAL', 'test', 'Version 1 of record &quot;tl_iso_product.id=89&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(81, 1688852184, 'BE', 'GENERAL', 'test', 'Version 2 of record &quot;tl_iso_product.id=89&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(82, 1688852195, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(83, 1688852217, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(84, 1688852223, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(85, 1688852265, 'BE', 'GENERAL', 'test', 'Version 3 of record &quot;tl_iso_product.id=89&quot; has been created', 'Contao\\Versions::create', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(86, 1688852274, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(87, 1688852278, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(88, 1688852298, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(89, 1688852342, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(90, 1688915732, 'FE', 'CRON', 'test', 'Purged the temp folder', 'Contao\\Automator::purgeTempFolder', 'N/A'),
(91, 1688915732, 'FE', 'CRON', 'test', 'Purged the expired double opt-in tokens', 'Contao\\Automator::purgeOptInTokens', 'N/A'),
(92, 1688915828, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(93, 1688915834, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(94, 1688915838, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(95, 1688915841, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(96, 1688915847, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'),
(97, 1688915859, 'FE', 'ERROR', 'anon.', 'Module class &quot;&quot; (module &quot;visitors&quot;) does not exist', 'Contao\\Controller::getFrontendModule', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36');

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
  `sharebuttons_networks` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tl_module`
--

INSERT INTO `tl_module` (`id`, `pid`, `tstamp`, `name`, `headline`, `type`, `levelOffset`, `showLevel`, `hardLimit`, `showProtected`, `defineRoot`, `rootPage`, `navigationTpl`, `customTpl`, `pages`, `showHidden`, `customLabel`, `autologin`, `jumpTo`, `overviewPage`, `redirectBack`, `editable`, `memberTpl`, `form`, `queryType`, `fuzzy`, `contextLength`, `minKeywordLength`, `perPage`, `searchType`, `searchTpl`, `inColumn`, `skipFirst`, `loadFirst`, `singleSRC`, `url`, `imgSize`, `useCaption`, `fullsize`, `multiSRC`, `orderSRC`, `html`, `rss_cache`, `rss_feed`, `rss_template`, `numberOfItems`, `disableCaptcha`, `reg_groups`, `reg_allowLogin`, `reg_skipName`, `reg_close`, `reg_deleteDir`, `reg_assignDir`, `reg_homeDir`, `reg_activate`, `reg_jumpTo`, `reg_text`, `reg_password`, `data`, `protected`, `groups`, `guests`, `cssID`, `rootPageDependentModules`, `faq_categories`, `faq_readerModule`, `com_order`, `com_moderate`, `com_bbcode`, `com_requireLogin`, `com_disableCaptcha`, `com_template`, `news_archives`, `news_featured`, `news_jumpToCurrent`, `news_readerModule`, `news_metaFields`, `news_template`, `news_format`, `news_startDay`, `news_order`, `news_showQuantity`, `list_table`, `list_fields`, `list_where`, `list_search`, `list_sort`, `list_info`, `list_info_where`, `list_layout`, `list_info_layout`, `cal_calendar`, `cal_noSpan`, `cal_hideRunning`, `cal_startDay`, `cal_format`, `cal_ignoreDynamic`, `cal_order`, `cal_readerModule`, `cal_limit`, `cal_template`, `cal_ctemplate`, `cal_showQuantity`, `cal_featured`, `newsletters`, `nl_channels`, `nl_text`, `nl_hideChannels`, `nl_subscribe`, `nl_unsubscribe`, `nl_template`, `iso_tsproducts`, `iso_tscheckout`, `iso_tsyoffset`, `iso_tsdirection`, `iso_tsdisplay`, `iso_tsreviews`, `iso_tsid`, `iso_notifications`, `iso_productcache`, `iso_addressFields`, `iso_address`, `iso_continueShopping`, `iso_includeMessages`, `iso_related_categories`, `iso_buttons`, `iso_listingSortDirection`, `iso_listingSortField`, `iso_checkout_jumpTo`, `iso_cart_jumpTo`, `iso_perPage`, `iso_enableLimit`, `iso_sortingFields`, `iso_searchAutocomplete`, `iso_searchExact`, `iso_searchFields`, `iso_filterHideSingle`, `iso_newFilter`, `iso_rangeFields`, `iso_cumulativeFields`, `iso_filterFields`, `iso_filterModules`, `iso_list_where`, `iso_category_scope`, `iso_noFilter`, `iso_emptyFilter`, `iso_noProducts`, `iso_emptyMessage`, `iso_orderCollectionBy`, `iso_addToAddressbook`, `iso_order_conditions`, `iso_checkout_skippable`, `iso_forward_review`, `orderCompleteJumpTo`, `iso_shipping_modules`, `iso_payment_modules`, `iso_config_ids`, `iso_config_id`, `iso_cols`, `iso_wishlistJumpTo`, `iso_addProductJumpTo`, `iso_loginRequired`, `iso_login_jumpTo`, `iso_checkout_method`, `iso_display404Page`, `iso_use_quantity`, `iso_disable_options`, `iso_hide_list`, `iso_link_primary`, `iso_jump_first`, `iso_filterTpl`, `iso_collectionTpl`, `iso_gallery`, `iso_reader_layout`, `iso_list_layout`, `nc_activation_notification`, `nc_notification`, `customLanguageText`, `customLanguage`, `hideNoFallback`, `hideActiveLanguage`, `reg_activateLogin`, `reg_autoActivate`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`) VALUES
(1, 1, 1668971050, 'HTML logo', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"logo\">\n  <a href=\"\" title=\"Clever Quiroz - Künstler\">\n      <img src=\"files/themes/images/logoCQ.svg\" width=\"150px\" alt=\"Clever Quiroz - Künstler - Logo\" itemprop=\"image\">\n  </a>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(2, 1, 1668430616, 'HTML nav -toggler', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"nav-toggler\"> <button class=\"nav-toggler__button\"></button></div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(3, 1, 1668430655, 'HTML TopLink', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<!-- indexer::stop -->\n<div class=\"toplink\">\n    <a href=\"{{env::request|urlattr}}#top\"> </a>\n</div>\n<!-- indexer::continue -->', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(4, 1, 1679428151, 'HTML webdesign', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"webdesign\">\n  <div class=\"company\"><a href=\"http://www.nachhaltig-im-web.de\" title=\"nachhaltig im web\">\n  	 <img src=\"files/themes/images/nch_logo.svg\" width=\"50px\" alt=\"nachhaltig im web\" itemprop=\"image\"><span>\n    Webdesign by nachhaltig im web</span>\n    </a>\n  </div>\n  <div class=\"cms\">\n  	<a href=\"http://www.contao.org\" title=\"Contao Open Source CMS\">\n      <img src=\"files/themes/images/support-contao-symbol-color.svg\" width=\"50px\" alt=\"Contao unterstützen\" itemprop=\"image\">\n      <span>Powered by Contao</span>\n  </a>\n  	  </div>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(6, 1, 1679677061, 'Navigation Individuell', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'customnav', 0, 0, '', '', '', 0, '', '', 0x613a333a7b693a303b693a323b693a313b693a333b693a323b693a35343b7d, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:9:\"mainPages\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(7, 1, 1679677110, 'Navigation individuell Info', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'customnav', 0, 0, '', '', '', 0, '', '', 0x613a333a7b693a303b693a31303b693a313b693a31323b693a323b693a31333b7d, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"info\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(8, 1, 1671566283, 'Navigation NavMenu', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'navigation', 0, 2, '', '', '', 0, 'nav_default', 'mod_navigation_noscript', 0x613a313a7b693a303b693a323b7d, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(9, 1, 1679949402, 'Tools - Suchmaschine', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'search', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 14, 0, '', NULL, '', 0, 'and', '1', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 3, 0, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(11, 1, 1679851830, 'Shop - Produktdetails', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productreader', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 6, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 3, 0, 8, '', 0, 'member', '', '1', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, 'iso_reader_enhanced', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(12, 1, 1672871994, 'Shop - Warenkorb &#40;für angemeldete Kunden - weiter zur Kasse&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_cart', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 18, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', 'Ihr Warenkorb ist &#40;noch&#41; leer.', '1', 'desc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(13, 1, 1671826442, 'Shop - Kasse', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_checkout', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '3', NULL, NULL, NULL, '1', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 18, 8, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', 'nix drin', '1', 'desc_id', '1', 0x613a313a7b693a303b613a353a7b733a343a22666f726d223b733a313a2232223b733a343a2273746570223b733a33303a2249736f746f70655c436865636b6f7574537465705c4f72646572496e666f223b733a383a22706f736974696f6e223b733a353a226166746572223b733a31333a2270726f647563745f7479706573223b613a323a7b693a303b733a313a2236223b693a313b733a313a2237223b7d733a32333a2270726f647563745f74797065735f636f6e646974696f6e223b733a31333a226f6e6c79417661696c61626c65223b7d7d, 'a:3:{i:0;s:15:\"billing_address\";i:1;s:14:\"payment_method\";i:2;s:15:\"shipping_method\";}', '1', 19, 0x613a323a7b693a303b733a323a223132223b693a313b733a323a223136223b7d, 0x613a343a7b693a303b733a313a2232223b693a313b733a313a2234223b693a323b733a313a2233223b693a333b733a313a2235223b7d, NULL, 0, 1, 0, 0, '', 0, 'both', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(14, 1, 1672871397, 'Shop - Bestellungsdetails', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_orderdetails', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 8, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '1', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(15, 1, 1671663567, 'Benutzer - Registrierung', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'registration', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 35, 0, '', 0x613a31313a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a373a22636f6d70616e79223b693a333b733a363a22737472656574223b693a343b733a363a22706f7374616c223b693a353b733a343a2263697479223b693a363b733a373a22636f756e747279223b693a373b733a353a2270686f6e65223b693a383b733a353a22656d61696c223b693a393b733a31303a226e6577736c6574746572223b693a31303b733a383a2270617373776f7264223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', 0x613a313a7b693a303b733a313a2231223b7d, '1', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 4, NULL, '', '', '', '', 'disable', '', '', NULL),
(16, 1, 1670103552, 'Benutzer - Personendaten', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'personalData', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 28, 0, '', 0x613a31333a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a31313a22646174654f664269727468223b693a333b733a373a22636f6d70616e79223b693a343b733a363a22737472656574223b693a353b733a363a22706f7374616c223b693a363b733a343a2263697479223b693a373b733a373a22636f756e747279223b693a383b733a353a2270686f6e65223b693a393b733a353a22656d61696c223b693a31303b733a373a2277656273697465223b693a31313b733a383a226c616e6775616765223b693a31323b733a31303a226e6577736c6574746572223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 8, NULL, '', '', '', '', 'disable', '', '', NULL),
(17, 1, 1670103680, 'Shop - Berstellhistorie', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_orderhistory', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 23, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(18, 1, 1670103970, 'Benutzer - Konto schließen', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'closeAccount', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 29, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', 'close_deactivate', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(19, 1, 1671822237, 'Benutzer - Passwort vergessen', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'lostPasswordNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 36, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '1', '', '', '', NULL, '', 37, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 6, NULL, '', '', '', '', 'disable', '', '', NULL),
(20, 1, 1671665417, 'Benutzer - Logout', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'logout', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 2, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(21, 1, 1671557679, 'Tools - Sprachenwechsler', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'changelanguage', 0, 0, '', '', '', 0, 'nav_dropdown', 'mod_changelanguage_noscript', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:8:\"language\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, 'a:2:{i:0;a:2:{s:3:\"key\";s:2:\"de\";s:5:\"value\";s:7:\"Deutsch\";}i:1;a:2:{s:3:\"key\";s:2:\"en\";s:5:\"value\";s:7:\"English\";}}', '', '', '', '', 'disable', '', '', NULL),
(22, 1, 1668972034, 'HTML nav-language-toggler', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"language\"> <button class=\"nav-language-toggler__button\"></button></div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(26, 1, 1671914681, 'Shop - Adressbuch', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_addressbook', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 23, 0, '', NULL, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, 0x613a313a7b693a303b733a313a2231223b7d, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(27, 1, 1672858690, 'Benutzer - Anmelden', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'login', 0, 0, '', '', '', 0, '', '', NULL, '', '', '1', 8, 0, '', 0x613a31313a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a373a22636f6d70616e79223b693a333b733a363a22737472656574223b693a343b733a363a22706f7374616c223b693a353b733a343a2263697479223b693a363b733a373a22636f756e747279223b693a373b733a353a2270686f6e65223b693a383b733a353a22656d61696c223b693a393b733a31303a226e6577736c6574746572223b693a31303b733a383a2270617373776f7264223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '1', '', '', '', '', NULL, '', 27, NULL, NULL, NULL, '', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 4, NULL, '', '', '', '', 'disable', '', '', NULL),
(29, 1, 1682440769, 'Shop - Produktliste - aktive Kategorie - alle', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productlist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:11:\"productlist\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, NULL, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, 0x613a333a7b693a303b733a323a223332223b693a313b733a323a223334223b693a323b733a323a223430223b7d, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 0, 0, 8, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', 'iso_list_default', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(30, 1, 1672872000, 'Shop - Warenkorb &#40;für Gäste - weiter über Mein Konto zur Kasse&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_cart', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"shop\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 41, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', 'Ihr Warenkorb ist &#40;noch&#41; leer.', '1', 'desc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(31, 1, 1671914369, 'Benutzer - Rechnungsadresse', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'personalData', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 46, 0, '', 0x613a393a7b693a303b733a393a2266697273746e616d65223b693a313b733a383a226c6173746e616d65223b693a323b733a373a22636f6d70616e79223b693a333b733a363a22737472656574223b693a343b733a363a22706f7374616c223b693a353b733a343a2263697479223b693a363b733a373a22636f756e747279223b693a373b733a353a2270686f6e65223b693a383b733a353a22656d61696c223b7d, 'member_default', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 'a:2:{i:0;s:0:\"\";i:1;s:4:\"user\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(32, 1, 1682434582, 'Shop - Produktfilter - Limit', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:5:\"limit\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'ASC', 'sku', 0, 0, '2,5,10,15', '1', NULL, 'name', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(34, 1, 1682434994, 'Shop - Produktfilter - Search', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '1,3,10,20,30', '', NULL, 'name', 0x613a313a7b693a303b733a333a22736b75223b7d, 0x613a343a7b693a303b733a333a22736b75223b693a313b733a343a226e616d65223b693a323b733a363a22746561736572223b693a333b733a31313a226465736372697074696f6e223b7d, '', 'show_all', NULL, NULL, 0x613a313a7b693a303b733a363a22737461747573223b7d, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(35, 1, 1679338717, 'Shop - Produktfilter Verfügbarkeit', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '1,3,10,20,30', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(37, 1, 1673217315, 'HTML Login Message', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"login\">\n  <p>\n    Sie sind angemeldet, {{user::firstname}}\n  </p>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '1', 0x613a313a7b693a303b733a313a2231223b7d, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(40, 1, 1679407848, 'Shop - Produktfilter - Sort', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:7:\"sorting\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '1,2,5,10,15,20,25', '', 0x613a343a7b693a303b733a393a22646174654164646564223b693a313b733a333a22736b75223b693a323b733a343a226e616d65223b693a333b733a353a227072696365223b7d, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(41, 1, 1679075041, 'Shop - Produktfilter', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', 'dateAdded', 0, 0, '2,5,10', '1', 0x613a343a7b693a303b733a393a22646174654164646564223b693a313b733a333a22736b75223b693a323b733a343a226e616d65223b693a333b733a353a227072696365223b7d, 'name', NULL, 0x613a343a7b693a303b733a333a22736b75223b693a313b733a343a226e616d65223b693a323b733a363a22746561736572223b693a333b733a31313a226465736372697074696f6e223b7d, '', 'show_all', NULL, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(42, 1, 1681681725, 'Newsletter - Abonnieren', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newsletterSubscribeNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 50, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, '1', 'Sie haben folgende Verteiler auf ##domain## abonniert:\n\n##channels##\n\nBitte klicken Sie hier, um Ihr Abonnement zu aktivieren:\n\n##link##\n\nDer Bestätigungslink ist 24 Stunden gültig. Sie können Ihr Abonnement jederzeit beenden.\n\nFalls Sie die Verteiler nicht selbst abonniert haben, ignorieren Sie diese E-Mail bitte.', NULL, 'nl_default', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 14, NULL, '', '', '', '', 'disable', '', '', NULL),
(43, 1, 1681735807, 'Newsletter - Aktivieren', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newsletterActivateNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 51, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, '1', NULL, NULL, 'nl_default', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 15, NULL, '', '', '', '', 'disable', '', '', NULL),
(44, 1, 1679415940, 'Newsletter kündigen', 'a:2:{s:4:\"unit\";s:2:\"h1\";s:5:\"value\";s:10:\"Newsletter\";}', 'newsletterUnsubscribeNotificationCenter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 53, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, 0x613a313a7b693a303b733a313a2231223b7d, NULL, '1', NULL, NULL, 'nl_default', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL);
INSERT INTO `tl_module` (`id`, `pid`, `tstamp`, `name`, `headline`, `type`, `levelOffset`, `showLevel`, `hardLimit`, `showProtected`, `defineRoot`, `rootPage`, `navigationTpl`, `customTpl`, `pages`, `showHidden`, `customLabel`, `autologin`, `jumpTo`, `overviewPage`, `redirectBack`, `editable`, `memberTpl`, `form`, `queryType`, `fuzzy`, `contextLength`, `minKeywordLength`, `perPage`, `searchType`, `searchTpl`, `inColumn`, `skipFirst`, `loadFirst`, `singleSRC`, `url`, `imgSize`, `useCaption`, `fullsize`, `multiSRC`, `orderSRC`, `html`, `rss_cache`, `rss_feed`, `rss_template`, `numberOfItems`, `disableCaptcha`, `reg_groups`, `reg_allowLogin`, `reg_skipName`, `reg_close`, `reg_deleteDir`, `reg_assignDir`, `reg_homeDir`, `reg_activate`, `reg_jumpTo`, `reg_text`, `reg_password`, `data`, `protected`, `groups`, `guests`, `cssID`, `rootPageDependentModules`, `faq_categories`, `faq_readerModule`, `com_order`, `com_moderate`, `com_bbcode`, `com_requireLogin`, `com_disableCaptcha`, `com_template`, `news_archives`, `news_featured`, `news_jumpToCurrent`, `news_readerModule`, `news_metaFields`, `news_template`, `news_format`, `news_startDay`, `news_order`, `news_showQuantity`, `list_table`, `list_fields`, `list_where`, `list_search`, `list_sort`, `list_info`, `list_info_where`, `list_layout`, `list_info_layout`, `cal_calendar`, `cal_noSpan`, `cal_hideRunning`, `cal_startDay`, `cal_format`, `cal_ignoreDynamic`, `cal_order`, `cal_readerModule`, `cal_limit`, `cal_template`, `cal_ctemplate`, `cal_showQuantity`, `cal_featured`, `newsletters`, `nl_channels`, `nl_text`, `nl_hideChannels`, `nl_subscribe`, `nl_unsubscribe`, `nl_template`, `iso_tsproducts`, `iso_tscheckout`, `iso_tsyoffset`, `iso_tsdirection`, `iso_tsdisplay`, `iso_tsreviews`, `iso_tsid`, `iso_notifications`, `iso_productcache`, `iso_addressFields`, `iso_address`, `iso_continueShopping`, `iso_includeMessages`, `iso_related_categories`, `iso_buttons`, `iso_listingSortDirection`, `iso_listingSortField`, `iso_checkout_jumpTo`, `iso_cart_jumpTo`, `iso_perPage`, `iso_enableLimit`, `iso_sortingFields`, `iso_searchAutocomplete`, `iso_searchExact`, `iso_searchFields`, `iso_filterHideSingle`, `iso_newFilter`, `iso_rangeFields`, `iso_cumulativeFields`, `iso_filterFields`, `iso_filterModules`, `iso_list_where`, `iso_category_scope`, `iso_noFilter`, `iso_emptyFilter`, `iso_noProducts`, `iso_emptyMessage`, `iso_orderCollectionBy`, `iso_addToAddressbook`, `iso_order_conditions`, `iso_checkout_skippable`, `iso_forward_review`, `orderCompleteJumpTo`, `iso_shipping_modules`, `iso_payment_modules`, `iso_config_ids`, `iso_config_id`, `iso_cols`, `iso_wishlistJumpTo`, `iso_addProductJumpTo`, `iso_loginRequired`, `iso_login_jumpTo`, `iso_checkout_method`, `iso_display404Page`, `iso_use_quantity`, `iso_disable_options`, `iso_hide_list`, `iso_link_primary`, `iso_jump_first`, `iso_filterTpl`, `iso_collectionTpl`, `iso_gallery`, `iso_reader_layout`, `iso_list_layout`, `nc_activation_notification`, `nc_notification`, `customLanguageText`, `customLanguage`, `hideNoFallback`, `hideActiveLanguage`, `reg_activateLogin`, `reg_autoActivate`, `sharebuttons_template`, `sharebuttons_theme`, `sharebuttons_networks`) VALUES
(46, 1, 1679669719, 'Nachrichten - Leser', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newsreader', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 54, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:8:\"_fitting\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', 'com_default', 0x613a313a7b693a303b733a313a2231223b7d, 'all_items', '', 0, 'a:3:{i:0;s:4:\"date\";i:1;s:6:\"author\";i:2;s:8:\"comments\";}', 'news_full', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(47, 1, 1681389547, 'Nachrichten - Liste &#40;3 latest&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'newslist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 3, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:11:\"_newsletter\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', 0x613a313a7b693a303b733a313a2231223b7d, 'all_items', '', 46, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', 'news_latest', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(48, 1, 1679949671, 'Tools - Suchmaschine - Eigene Seite', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'search', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '1', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', 3, 0, 'advanced', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', '', '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, '', '', 0, 0, '', '', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, '', '', '', '', '', '', '', '', '', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(50, 1, 1680088895, 'HTML - Instagram-Link', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'html', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, '<div class=\"instagram\">\n  <a rel=\"noreferrer\" target=\"_blank\" href=\"https://www.instagram.com/explore/tags/cleverquiroz/\" title=\"Instagram-Link für Clever Quiroz - Künstler\">\n  </a>\n</div>', 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(52, 1, 1682434445, 'Shop - Produktliste - aktive Kategorie - alle &#40;sm&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productlist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 1, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:11:\"productlist\";i:1;s:2:\"sm\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, NULL, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, 0x613a323a7b693a303b733a323a223334223b693a313b733a323a223430223b7d, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 0, 0, 8, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', 'iso_list_default', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(53, 1, 1681250314, 'Tools - Besucherzähler', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'visitors', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(54, 1, 1681423034, 'Nachrichten - Liste &#40;rest&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:19:\"Ältere Nachrichten\";}', 'newslist', 0, 0, '', '', '', 0, '', 'mod_newslist_rest', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 3, 'simple', '', 'main', 3, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:11:\"_newsletter\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', 0x613a313a7b693a303b733a313a2231223b7d, 'all_items', '', 46, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', 'news_simple', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(55, 1, 1682280669, 'Linkliste', 'a:2:{s:5:\"value\";s:0:\"\";s:4:\"unit\";s:2:\"h2\";}', 'delirius_linkliste', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'DESC', '', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL),
(56, 1, 1682440204, 'Shop - Produktvariantenliste - aktive Kategorie - alle &#40;Kopie&#41;', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productvariantlist', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 0, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:11:\"productlist\";i:1;s:0:\"\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '', NULL, NULL, 'DESC', 'dateAdded', 0, 0, '8,12,32,64', '', NULL, '', NULL, NULL, '', 'show_all', NULL, NULL, NULL, 0x613a333a7b693a303b733a323a223332223b693a313b733a323a223334223b693a323b733a323a223430223b7d, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 0, 0, 8, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', 'iso_list_variants', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL);

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
(58, 3, 192, 1688851972, 'Karten', 'regular', 'galerie/karten', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', '');

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
(4, 1688845618, 'test', 'test', 'test@domian.de', 'de', 'flexible', '', 'DropZone', '1', '1', '1', '1', '$2y$13$TTjXpFERpBjRjPlmJcirgexhr.yu9.Skh/fBC2y/wPNrzlCwJFjim', '', '1', NULL, 'group', 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, '', '', '', 0x613a343a7b733a31323a22746c5f706167655f74726565223b613a383a7b693a313b693a313b693a323b693a303b693a333b693a313b693a343b693a303b693a32363b693a303b693a33323b693a303b693a35383b693a303b693a33333b693a303b7d733a31353a226669656c647365745f737461746573223b613a313a7b733a31383a22746c5f69736f5f70726f6475637474797065223b613a313a7b733a31353a2276617269616e74735f6c6567656e64223b693a313b7d7d733a31393a2269736f5f70726f647563745f75706461746572223b4e3b733a31303a2243555252454e545f4944223b4e3b7d, 1688845570, NULL, '', 0, 1688845714, 0, 0, NULL, 0, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, '1', '1', 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, NULL, '', 'contextmenu', NULL, '');

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
(15, 89, 1688852265, 3, 'tl_iso_product', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=075505e664a637.rVa9WTbCRT9s0il00FwcLJriS2GNsTlcLAQnXQHTfIU.xmL6MQ6wPAgci3AXszpFdOujDTnE9X03bWZkaWOxFNzLGPQyX_VzfA2gRg&ref=MVHgJw2B', '1', 0x613a34303a7b733a323a226964223b693a38393b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383835323236353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383834363938353b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31373a2262696c642d322d7175616e746974792d32223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303032223b733a343a226e616d65223b733a34363a2242696c64203220262334303b6e6f2076617269616e74732c207175616e7469747920262336313b2032262334313b223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31333a223c703e42696c6420323c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36313b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(16, 89, 1688852265, 3, 'tl_iso_product_category', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=075505e664a637.rVa9WTbCRT9s0il00FwcLJriS2GNsTlcLAQnXQHTfIU.xmL6MQ6wPAgci3AXszpFdOujDTnE9X03bWZkaWOxFNzLGPQyX_VzfA2gRg&ref=MVHgJw2B', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36313b733a333a22706964223b693a38393b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383835323236353b733a373a22706167655f6964223b693a33323b7d7d),
(17, 89, 1688852265, 3, 'tl_iso_product_price', 4, 'test', 'Bild 2 &#40;no variants, quantity &#61; 2&#41;', 'backend?do=iso_products&act=edit&id=89&rt=075505e664a637.rVa9WTbCRT9s0il00FwcLJriS2GNsTlcLAQnXQHTfIU.xmL6MQ6wPAgci3AXszpFdOujDTnE9X03bWZkaWOxFNzLGPQyX_VzfA2gRg&ref=MVHgJw2B', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35313b733a333a22706964223b693a38393b733a363a22747374616d70223b693a313638383835323138343b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35363b733a333a22706964223b693a35313b733a363a22747374616d70223b693a313638383835323138343b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);

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
-- AUTO_INCREMENT for table `tl_iso_product`
--
ALTER TABLE `tl_iso_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection`
--
ALTER TABLE `tl_iso_product_collection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_download`
--
ALTER TABLE `tl_iso_product_collection_download`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_item`
--
ALTER TABLE `tl_iso_product_collection_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3114;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tl_iso_product_pricetier`
--
ALTER TABLE `tl_iso_product_pricetier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tl_member`
--
ALTER TABLE `tl_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tl_nc_message`
--
ALTER TABLE `tl_nc_message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tl_nc_notification`
--
ALTER TABLE `tl_nc_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tl_preview_link`
--
ALTER TABLE `tl_preview_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_remember_me`
--
ALTER TABLE `tl_remember_me`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
