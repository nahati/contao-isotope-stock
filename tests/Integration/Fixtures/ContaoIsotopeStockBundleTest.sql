-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 07, 2023 at 08:30 PM
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
(63, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMinutely', '2023-07-07 22:28:44'),
(64, 'Contao\\CoreBundle\\Cron\\LegacyCron::onHourly', '2023-07-07 22:06:13'),
(65, 'Contao\\CoreBundle\\Cron\\LegacyCron::onDaily', '2023-07-07 21:57:47'),
(66, 'Contao\\CoreBundle\\Cron\\LegacyCron::onWeekly', '2023-07-05 17:33:47'),
(67, 'Contao\\CoreBundle\\Cron\\LegacyCron::onMonthly', '2023-07-05 17:33:47'),
(68, 'Contao\\CoreBundle\\Cron\\PurgeExpiredDataCron::onHourly', '2023-07-07 22:06:13'),
(69, 'Contao\\CoreBundle\\Cron\\PurgePreviewLinksCron', '2023-07-07 21:57:47');

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
(31, 0, 0, 1688760627, '', 1679071375, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'skulptur-1', '', 'S0001', 'Skulptur 1', NULL, '<p>Skulptur 1</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '37', '28', '24', '1', '1', 0),
(32, 0, 0, 1688760764, '', 1679072602, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'erstickungsgefährdet', '', 'S0002', 'Skulptur 2', NULL, '<p>Skulptur 2</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '18', '12', '3', '2', 0),
(33, 0, 0, 1688760687, '', 1679072864, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'elbperlen', '', 'S0003', 'Skulptur 3', NULL, '<p>Skulptur 3</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '25', '25', '6', '2', '3', 0),
(34, 0, 0, 1688760883, '', 1679073170, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'speed-limit-00-kinder-bueno', '', 'S0004', 'Skulptur 4', NULL, '<p>Skulptur 4</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '50', '12', '2', '', 0),
(35, 0, 0, 1688760845, '', 1679073393, 9, 'a:1:{i:0;s:2:\"58\";}', NULL, '', 'schneller-schlau', '', 'K0001', 'Kollage 1', NULL, '<p>Kollage 1</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '3', '2', 0),
(37, 0, 0, 1682537155, '', 1682433897, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-5', '', 'S0005', 'Figur 5', NULL, '<p>Figur 5</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 0),
(38, 34, 0, 1682537049, '', 1682439434, 0, NULL, NULL, '', '', '', '', 'Variante Original von S0004', NULL, '<p>Dies ist das original</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(39, 34, 0, 1682537061, '', 1682439491, 0, NULL, NULL, '', '', '', '', 'Variante Kopie von S0004', NULL, '<p>Dies ist eine Kopie</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(40, 33, 0, 1688760707, '', 1682441231, 0, NULL, NULL, '', '', '', '', 'Original von S0003', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(42, 33, 0, 1688760715, '', 1682441268, 0, NULL, NULL, '', '', '', '', 'Kopie von S0003', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '4', 2),
(44, 32, 0, 1688760779, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Kopie', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '3', '2', 2),
(45, 32, 0, 1688760786, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '3', '1', 1),
(46, 31, 0, 1688760731, '', 0, 0, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, '', '', '', '', 'Kopie von S0001', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '1', '', 2),
(47, 31, 0, 1682535732, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '1', '', 1),
(48, 37, 0, 1682537196, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 2),
(49, 37, 0, 1682537184, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(50, 0, 0, 1682537825, '', 1682537805, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-6', '', 'S0006', 'Figur 6', NULL, '<p>Figur 6</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '3', 0),
(51, 50, 0, 1682537907, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(52, 50, 0, 1682537899, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(53, 0, 0, 1682603978, '', 1682603952, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-7', '', 'S0007', 'Figur 7', NULL, '<p>Figur 7</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '3', 0),
(54, 53, 0, 1682603952, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '', '', '', '', '', '', '', '2', '', 2),
(55, 53, 0, 1682603952, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '', '', '', '', '', '', '', '2', '1', 1),
(86, 0, 0, 1688760908, '', 1688590376, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'produkt-ohne-varianten', '', 'S0019', 'Skulptur 19', NULL, '<p>Skulptur 19</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '1', '3', '2', '2', '', 0),
(88, 0, 0, 1688760658, '', 1688593283, 6, 'a:1:{i:0;s:2:\"32\";}', NULL, '', 'bild-unlimited', '', 'B0001', 'Bild 1', NULL, '<p>Bild 1</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '', 0);

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
(9, 1682432820, 'Kollagen', 'standard', '', NULL, '', '1', 'iso_list_default', 'iso_reader_enhanced', 1, 2, '', 0x613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d, '', NULL, '', '', '');

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
(56, 53, 896, 1682603952, 33),
(58, 86, 1024, 1688590422, 33),
(60, 88, 128, 1688593324, 32);

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
(263, 1688761725, 'cart', 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '', '98c9f94fa4ab41b4f7ee8648e9bcd5ef480bf7d229e052a86ed0b774beef1350', 0, NULL, NULL, '', 1, 0, 0, 0, 0, '300.00', '300.00', '300.00', '300.00', 'EUR', '', NULL, NULL),
(264, 1688761561, 'order', 0, NULL, 0, NULL, NULL, NULL, NULL, 263, '', '64a874d8379f54.29166569', 0, NULL, NULL, '', 1, 0, 0, 0, 0, '300.00', '300.00', '300.00', '300.00', 'EUR', '', NULL, NULL);

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
(3102, 263, 1688761546, 35, 'standard', 'K0001', 'Schneller schlau', 0x613a303a7b7d, 2, '100.00', '100.00', '', 58),
(3103, 263, 1688571424, 45, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3104, 263, 1688571460, 44, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a323b7d, 2, '0.00', '0.00', '', 33),
(3105, 263, 1688761546, 88, 'standard', 'B0001', 'Bild unlimited', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32),
(3106, 264, 1688761560, 35, 'standard', 'K0001', 'Schneller schlau', 0x613a303a7b7d, 2, '100.00', '100.00', '', 58),
(3107, 264, 1688761560, 45, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3108, 264, 1688761560, 44, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a323b7d, 2, '0.00', '0.00', '', 33),
(3109, 264, 1688761560, 88, 'standard', 'B0001', 'Bild unlimited', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32);

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
(43, 53, 1682603952, 3, 0, 0, '', ''),
(44, 54, 1682603952, 3, 0, 0, '', ''),
(45, 55, 1682603952, 3, 0, 0, '', ''),
(50, 88, 1688593283, 0, 0, 0, '', '');

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
(55, 50, 1688593283, 1, '100.00');

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
  `sharebuttons_networks` blob DEFAULT NULL,
  `delirius_linkliste_imagesize` varchar(64) NOT NULL DEFAULT '',
  `delirius_linkliste_standardfavicon` blob DEFAULT NULL,
  `delirius_linkliste_showimage` char(1) NOT NULL DEFAULT '',
  `delirius_linkliste_template` varchar(64) NOT NULL DEFAULT '',
  `delirius_linkliste_fesort` varchar(32) NOT NULL DEFAULT '',
  `delirius_linkliste_categories` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


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


--
-- Table structure for table `tl_opt_in_related`
--

CREATE TABLE `tl_opt_in_related` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `relTable` varchar(64) DEFAULT NULL,
  `relId` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


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
(1, 0, 128, 1688760507, 'Clever Quiroz', 'root', 'startpoint', '', 0, 'Clever Quiroz', 'de', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '1', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '1', '', '', '1', '', '', 0x613a313a7b693a303b733a313a2231223b7d, '1', 1, 0, '1', 31536000, '', 900, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', '', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 1, '', 0, 0, '', '', ''),
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
(58, 3, 192, 1682432105, 'Kollagen', 'regular', 'galerie/kollagen', '', 0, 'Meine Bilder', '', 'noindex,nofollow', 'Auf meiner Webseite präsentiere ich faszinierende Kunstwerke, die ich durch Upcycling geschaffen habe.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', '');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_comments_notify`
--
ALTER TABLE `tl_comments_notify`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_content`
--
ALTER TABLE `tl_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tl_iso_payment`
--
ALTER TABLE `tl_iso_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tl_iso_product`
--
ALTER TABLE `tl_iso_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tl_iso_productcache`
--
ALTER TABLE `tl_iso_productcache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_producttype`
--
ALTER TABLE `tl_iso_producttype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tl_iso_product_category`
--
ALTER TABLE `tl_iso_product_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection`
--
ALTER TABLE `tl_iso_product_collection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_download`
--
ALTER TABLE `tl_iso_product_collection_download`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_item`
--
ALTER TABLE `tl_iso_product_collection_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3110;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tl_iso_product_pricetier`
--
ALTER TABLE `tl_iso_product_pricetier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tl_user_group`
--
ALTER TABLE `tl_user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tl_version`
--
ALTER TABLE `tl_version`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
