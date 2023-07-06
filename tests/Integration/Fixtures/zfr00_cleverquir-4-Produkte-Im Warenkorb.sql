-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 05, 2023 at 09:44 PM
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
-- Database: `zfr00_cleverquir`
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
(31, 0, 0, 1682535619, '', 1679071375, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'augen-zu-und-ohren-auch', '', 'S0001', 'Augen zu und ... Ohren auch!', 'Strandgut &#40;Elbe&#41;, Silicon, Puppenkopf / 2013-2014', '<p><span lang=\"de-DE\">Aus kleinen bunten Plastikteilen ist diese Maske entstanden. Sie repräsentiert den Menschen und steht symbolisch als Mahnmal für das Sterben. Was uns daran erinnern sollte, dass wir letztendlich verantwortlich für den desaströsen Zustand unseres Planeten sind.</span></p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d312e6a7067223b733a333a22616c74223b733a32383a22417567656e207a7520756e64202e2e2e204f6872656e206175636821223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32383a22417567656e207a7520756e64202e2e2e204f6872656e206175636821223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d, '', NULL, '', '1', '', '', '', '37', '28', '24', '1', '1', 0),
(32, 0, 0, 1688570813, '', 1679072602, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'erstickungsgefährdet', '', 'S0002', 'Erstickungsgefährdet', 'Strandgut &#40;Elbe&#41;, Ackryl, Hartlaminat-Arbeitsplatte / 2020', '<p><span lang=\"de-DE\">Zwei Einweg Aluteller als Maske, über die Maske ein Orangen Netz, alles auf einem Stück Hartlaminat-Arbeitsplatte.</span></p>\n<p><span lang=\"de-DE\">Mit dieser Arbeit möchte ich das Leid der Natur vermitteln und zwei Frage stellen:</span></p>\n<p style=\"padding-left: 40px;\"><span lang=\"de-DE\">Sind alle Menschen in der Lage, sich in das Leiden der Tiere hineinzuversetzen?</span></p>\n<p style=\"padding-left: 40px;\"><span lang=\"de-DE\"> Wenn ja, </span><span lang=\"de-DE\">warum lassen wir es zu, dass es passiert, warum tun wir nicht genug dagegen?</span></p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d, '', NULL, '', '1', '', '', '', '50', '18', '12', '3', '2', 0),
(33, 0, 0, 1683064913, '', 1679072864, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'elbperlen', '', 'S0003', 'Elbperlen', 'Strandgut &#40;Elbe&#41;, Rahmen, Spiegel / 2021', '<p><span lang=\"de-DE\">Mit einer Länge von 1094,26 km (1245 km inkl. Moldau) ist die Elbe der zwölftlängste Fluss in Europa und gehört zu den 100 längsten Flüssen der Erde.</span></p>\n<p><span lang=\"de-DE\">Dieser kleinen &#34;Perlen&#34; nur in ein paar Minuten am Ufer des Blankeneser Strands gesammelt, sind Zeuge, wie viel kleine Teile im Fluss sich auf die &#34;Reise&#34; ins Meer bewegen. Ich finde keine Antwort auf meine Frage, wo landen bzw woher kommen diese Plastik Pellets im Fluss? Wer steckt dahinter?, Kann man etwas dagegen tun?</span></p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31363a22696d675f323032312d332d322e6a7067223b733a333a22616c74223b733a393a22456c627065726c656e223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a393a22456c627065726c656e223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d, '', NULL, '', '1', '', '', '', '25', '25', '6', '3', '3', 0),
(34, 0, 0, 1682537033, '', 1679073170, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'speed-limit-00-kinder-bueno', '', 'S0004', 'Speed Limit 0,0 Kinder Bueno', 'Strandgut &#40;Elbe&#41;, verlassene Vogelnetzer, Feder, Alufolie, Ackryl, Foto, Stoffbänder, Luftballons, MDF Platte / 2021', '<p><span lang=\"de-DE\">Ironisch und als ein unerreichbares Ziel sollte der Titel klingen. Gerade Kinder werden von der Industrie mit Produkten beworben, die viel Müll verursachen und obendrein ungesund sind.</span></p>\n<p><span lang=\"de-DE\">Die Industrie bringt täglich Millionen von Gegenständen auf den Markt. Angeblich um den Hunger unserer Gesellschaft zu stillen. Letztendlich ist der Hauptgrund, Geld damit zu gewinnen. Eine große Mehrheit dieser Dinge sind nicht unbedingt zu gebrauchen. Dazu kommt noch, dass sie ungesund sind.</span></p>\n<p><span lang=\"de-DE\">Besonders Kinder eigenen sich als eine gute „Klientel“ für diese Gegenstände. Dabei wird viel an Werbung investiert. Hier in dem Werk nutze ich zwei verlassene Vogelnetze, drinnen jeweils eine Kapsel von Kinder-„Bueno“ bzw. Überraschungsei. (Dieses Wortspiel ist ironisch gemeint, denn bueno auf Spanisch bedeutet „gut“, obwohl sich die Kinder aus Unwissenheit nicht gut verhalten.) Die Kapseln sind am Ufer der Elbe gesammelt, die Schnüre und Luftballons zeigen eine von vielen Möglichkeiten, wie Tiere an diesen Folgen verenden</span></p>\n<p><span lang=\"de-DE\">Speed Limit 0,0 ist ein unerreichbares Ziel, so wie aktuell die Ziele gegen den CO2-Ausstoß klingen.</span></p>\n<p><span lang=\"de-DE\">Mein Wunsch bzw. Traum wäre, dass man ein Ziel von 0,0 Vermüllung in der Natur erreicht.</span></p>\n<p><span lang=\"de-DE\">Die Federn stehen als Symbol für die Millionen von Vögeln, die ihr Leben durch das unachtsame Verhalten der Menschen verlieren.</span></p>\n<p><br><br></p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d342e6a7067223b733a333a22616c74223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d, '', NULL, '', '1', '', '', '', '50', '50', '12', '2', '', 0),
(35, 0, 0, 1688593195, '', 1679073393, 9, 'a:1:{i:0;s:2:\"58\";}', NULL, '', 'schneller-schlau', '', 'K0001', 'Schneller schlau', '2021', '<p><span lang=\"de-DE\">Einer von viele Berichten aus verschiedenen Zeitungen ist das Thema Plastik-Vermüllung in der ganzen Welt. Diese Berichte werden oft ignoriert, denn viele haben kein Interesse, sich mit dem Thema zu befassen, und bleiben lieber nicht &#34;schlau&#34;.</span></p>\n<p><span lang=\"de-DE\">Deshalb habe ich mir die Mühe gegeben, ein paar Zeilen zu markieren, und sie mit Rot am Rand wieder hinzuschreiben.</span></p>\n<p><span lang=\"de-DE\">Die Kollage besteht aus Fotos von mir und aus dem Internet. Sie sprechen für sich.</span></p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '3', '2', 0),
(37, 0, 0, 1682537155, '', 1682433897, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-5', '', 'S0005', 'Figur 5', NULL, '<p>Figur 5</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 0),
(38, 34, 0, 1682537049, '', 1682439434, 0, NULL, NULL, '', '', '', '', 'Variante Original von S0004', NULL, '<p>Dies ist das original</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(39, 34, 0, 1682537061, '', 1682439491, 0, NULL, NULL, '', '', '', '', 'Variante Kopie von S0004', NULL, '<p>Dies ist eine Kopie</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(40, 33, 0, 1683063865, '', 1682441231, 0, NULL, NULL, '', '', '', '', 'Original von S0003', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '3', '1', 1),
(42, 33, 0, 1683064872, '', 1682441268, 0, NULL, NULL, '', '', '', '', 'Kopie von S0003', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '3', '4', 2),
(44, 32, 0, 1688577185, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', 'Kopie', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31313a22666f722074657374696e67223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d, '', NULL, '', '1', '', '', '', '', '', '', '3', '2', 2),
(45, 32, 0, 1688570835, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '3', '1', 1),
(46, 31, 0, 1682535720, '', 0, 0, NULL, 0x613a313a7b693a303b733a31363a22696e76656e746f72795f737461747573223b7d, '', '', '', '', 'Kopie von S0001', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '1', '', 2),
(47, 31, 0, 1682535732, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '1', '', 1),
(48, 37, 0, 1682537196, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '2', 2),
(49, 37, 0, 1682537184, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(50, 0, 0, 1682537825, '', 1682537805, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-6', '', 'S0006', 'Figur 6', NULL, '<p>Figur 6</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '3', 0),
(51, 50, 0, 1682537907, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '', 2),
(52, 50, 0, 1682537899, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '1', 1),
(53, 0, 0, 1682603978, '', 1682603952, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'figur-7', '', 'S0007', 'Figur 7', NULL, '<p>Figur 7</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '1', '', '', '', '', '', '', '2', '3', 0),
(54, 53, 0, 1682603952, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '', '', '', '', '', '', '', '2', '', 2),
(55, 53, 0, 1682603952, '', 0, 0, NULL, 0x613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d, '', '', '', '', '', NULL, NULL, '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"mg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', NULL, '', NULL, '', '', '', '', '', '', '', '', '2', '1', 1),
(86, 0, 0, 1688591773, '', 1688590376, 7, 'a:1:{i:0;s:2:\"33\";}', NULL, '', 'produkt-ohne-varianten', '', 'S0019', 'Produkt ohne Varianten', NULL, '<p>test</p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d312e6a7067223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a303a22223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d, '', NULL, '', '1', '', '', '', '1', '3', '2', '2', '', 0),
(88, 0, 0, 1688593369, '', 1688593283, 6, 'a:1:{i:0;s:2:\"32\";}', NULL, '', 'bild-unlimited', '', 'B0001', 'Bild unlimited', '2021', '<p><span lang=\"de-DE\">Einer von viele Berichten aus verschiedenen Zeitungen ist das Thema Plastik-Vermüllung in der ganzen Welt. Diese Berichte werden oft ignoriert, denn viele haben kein Interesse, sich mit dem Thema zu befassen, und bleiben lieber nicht &#34;schlau&#34;.</span></p>\n<p><span lang=\"de-DE\">Deshalb habe ich mir die Mühe gegeben, ein paar Zeilen zu markieren, und sie mit Rot am Rand wieder hinzuschreiben.</span></p>\n<p><span lang=\"de-DE\">Die Kollage besteht aus Fotos von mir und aus dem Internet. Sie sprechen für sich.</span></p>', '', NULL, NULL, '', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', '', '', '0.00', 0x613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d, '', NULL, '', '1', '', '', '', '50', '60', '0,2', '2', '', 0);

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
(263, 1688593395, 'cart', 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '', '98c9f94fa4ab41b4f7ee8648e9bcd5ef480bf7d229e052a86ed0b774beef1350', 0, NULL, NULL, '', 1, 0, 0, 0, 0, '300.00', '300.00', '300.00', '300.00', 'EUR', '', NULL, NULL);

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
(3102, 263, 1688583064, 35, 'standard', 'K0001', 'Schneller schlau', 0x613a303a7b7d, 2, '100.00', '100.00', '', 58),
(3103, 263, 1688571424, 45, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a313b7d, 1, '0.00', '0.00', '', 33),
(3104, 263, 1688571460, 44, 'standard', 'S0002', 'Erstickungsgefährdet', 0x613a313a7b733a363a22737461747573223b693a323b7d, 2, '0.00', '0.00', '', 33),
(3105, 263, 1688593394, 88, 'standard', 'B0001', 'Bild unlimited', 0x613a303a7b7d, 1, '100.00', '100.00', '', 32);

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
(12, 1671051654, 'Abholung', 'Abholung', 'flat', '', '<p>Diese Artikel werden nicht versendet. Bitte holen Sie die Ware bei mir ab.</p>', NULL, NULL, NULL, '0.00', '0.00', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'a:2:{s:4:\"unit\";s:2:\"kg\";s:5:\"value\";s:0:\"\";}', 'cart_products', 0, 0, NULL, 'onlyAvailable', NULL, '', '0', 0, '', 'a:2:{s:4:\"unit\";s:1:\"g\";s:5:\"value\";s:3:\"500\";}', 'a:1:{s:4:\"unit\";s:2:\"kg\";}', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', '1'),
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
(32, 1, 1682434582, 'Shop - Produktfilter - Limit', 'a:2:{s:4:\"unit\";s:2:\"h2\";s:5:\"value\";s:0:\"\";}', 'iso_productfilter', 0, 0, '', '', '', 0, '', '', NULL, '', '', '', 0, 0, '', NULL, '', 0, 'and', '', '', 4, 0, 'simple', '', 'main', 0, '', NULL, NULL, '', '', '', NULL, NULL, NULL, 3600, NULL, '', 3, '', NULL, '', '', '', '', '', NULL, '', 0, NULL, NULL, NULL, '', NULL, '', 'a:2:{i:0;s:0:\"\";i:1;s:5:\"limit\";}', NULL, NULL, 0, 'ascending', '', '', '', '', '', NULL, 'all_items', '', 0, 'a:2:{i:0;s:4:\"date\";i:1;s:6:\"author\";}', '', 'news_month', 0, 'order_date_desc', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', 1, 'cal_month', '', 'ascending', 0, 0, '', '', '', 'all_items', NULL, NULL, NULL, '', NULL, NULL, '', '', '', 0, '', 'standard', '1', '', '', NULL, NULL, NULL, '', '1', NULL, 0x613a313a7b693a303b733a31313a226164645f746f5f63617274223b7d, 'ASC', 'sku', 0, 0, '2,5,10,15', '1', NULL, 'name', NULL, NULL, '', 'show_all', NULL, NULL, NULL, NULL, '', 'current_category', '', '', '', '', 'asc_id', '', NULL, NULL, '', 0, NULL, NULL, NULL, 0, 1, 0, 0, '', 0, 'member', '', '', '', '1', '', '', 'iso_filter_default', 'iso_collection_default', 0, '', '', 0, 0, NULL, '', '', '', '', 'disable', '', '', NULL, '', NULL, '', '', '', NULL),
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
(1, 1, 1671309150, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'Clever Quiroz', 'cleno1970@hotmail.de', NULL, NULL, '', 'Vielen Dank für Ihre Bestellung ##document_number## im webshop von Clever Quiroz', 'textAndHtml', 'Hallo,\n\n\nvielen Dank für Ihre Bestellung.\n\n{if shipping_label == \"Abholung\"}\n\nBitte kontaktieren sie mich um die Details der Abholung zu vereinbaren.\n\n{endif}\n\n{if order_status_notes != \'\'}\n\n##order_status_notes##\n\n{endif}\n\n[nbsp]\n\n[nbsp]\n\n{if payment_label == \"Bezahlung auf Vorkasse\"}\n\nBitte überweisen Sie den Rechnungsbetrag ##order_total## auf mein Konto\n\nIBAN: DE\n\n{endif}\n\n[nbsp]\n\nZusammenfassung Ihrer Bestellung:\n\nBestellnummer: ##document_number##\n\n[nbsp]\n\n##cart_html##\n\n[nbsp]\n\n##payment_label##\n\n{if shipping_label !== \"Abholung\"}\n\n##shipping_label## an ##shipping_address##\n\n{endif}\n\n##shipping_note##\n\n[nbsp]\n\nHerzliche Grüße,\n\nIhr Clever Quiroz', '<p>Hallo,</p>\n<p><br>vielen Dank für Ihre Bestellung.</p>\n<p>{if shipping_label &#61;&#61; &#34;Abholung&#34;}</p>\n<p>Bitte kontaktieren sie mich um die Details der Abholung zu vereinbaren.</p>\n<p>{endif}</p>\n<p>{if order_status_notes !&#61; &#39;&#39;}</p>\n<p>##order_status_notes##</p>\n<p>{endif}</p>\n<p>[nbsp]</p>\n<p>[nbsp]</p>\n<p>{if payment_label &#61;&#61; &#34;Bezahlung auf Vorkasse&#34;}</p>\n<p>Bitte überweisen Sie den Rechnungsbetrag ##order_total## auf mein Konto</p>\n<p>IBAN: DE</p>\n<p>{endif}</p>\n<p>[nbsp]</p>\n<p>Zusammenfassung Ihrer Bestellung:</p>\n<p>Bestellnummer: ##document_number##</p>\n<p>[nbsp]</p>\n<p>##cart_html##</p>\n<p>[nbsp]</p>\n<p>##payment_label##</p>\n<p>{if shipping_label !&#61;&#61; &#34;Abholung&#34;}</p>\n<p>##shipping_label## an ##shipping_address##</p>\n<p>{endif}</p>\n<p>##shipping_note##</p>\n<p>[nbsp]</p>\n<p><span style=\"font-size: 0.875rem;\">Herzliche Grüße,</span></p>\n<p>Ihr Clever Quiroz</p>', '', '', '', NULL),
(2, 1, 1669572909, 'email', 'en', '1', '##recipient_email##', '', NULL, NULL, '', '', NULL, NULL, '', 'order confirmation ##uniqid##', 'textAndHtml', 'Dear customer', '<p>Dear customer</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(3, 2, 1670099541, 'email', 'de', '', '##member_email##', '', NULL, NULL, 'Clever Quiroz', 'cleno1970@hotmail.de', '##admin_email##', NULL, '', 'Bitte validieren Sie Ihre Registrierung im Webshop von Clever Quiroz', 'textAndHtml', 'Liebe/r ##member_firstname## ##member_lastname##,\n\nVielen Dank für Ihr Interesse an meinem Webshop. Bitte bestätigen Sie, dass Sie sich in meinem Webshop registrieren möchten, indem Sie auf diesen ##link## klicken. Dadurch wird Ihre Registrierung gültig und Sie werden auf meine Webseite geleitet.\n\nHerzliche Grüße,\n\nClever Quiroz\n\n\n\n\nP.S.\n\nFalls Sie diese Email irrtümlich erhalten und Sie sich nicht registrieren möchten, ignorieren Sie diese Email bitte einfach.', '<p>Liebe/r ##member_firstname## ##member_lastname##,</p>\n<p>Vielen Dank für Ihr Interesse an meinem Webshop. Bitte bestätigen Sie, dass Sie sich in meinem Webshop registrieren möchten, indem Sie auf diesen <a href=\"##link##\" target=\"_blank\" rel=\"noopener\">Link </a>klicken. Dadurch wird Ihre Registrierung gültig und Sie werden auf meine Webseite geleitet.</p>\n<p>Herzliche Grüße,</p>\n<p>Clever Quiroz</p>\n<p>[nbsp]</p>\n<p>P.S.</p>\n<p>Falls Sie diese Email irrtümlich erhalten und Sie sich nicht registrieren möchten, ignorieren Sie diese Email bitte einfach.</p>', '', '', '', NULL),
(4, 2, 1669995047, 'email', 'en', '1', '##recipient_email##', '', NULL, NULL, '', '', NULL, NULL, '', 'order confirmation ##uniqid##', 'textAndHtml', 'Dear customer', '<p>Dear customer</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(7, 4, 1671822010, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'Clever Quiroz', 'cleno1970@hotmail.de', NULL, NULL, '', 'Bitte validieren Sie Ihre Passwortanfrage für den Webshop von Clever Quiroz', 'textAndHtml', 'Hallo,\n\nVielen Dank für Ihr Interesse an meinem Webshop. Bitte bestätigen Sie, dass Sie ein neues Passwort für meinen Webshop [nbsp]möchten, indem Sie auf diesen Link klicken. Danach werden Sie auf meine Webseite geleitet und können ein neues Passwort festlegen.\n\nHerzliche Grüße,\n\nClever Quiroz\n\n[nbsp]\n\n\nP.S.\n\nFalls Sie diese Email irrtümlich erhalten und Sie kein neues Passwort vergeben möchten, ignorieren Sie diese Email bitte einfach.', '<p>Hallo,</p>\n<p>Vielen Dank für Ihr Interesse an meinem Webshop. Bitte bestätigen Sie, dass Sie ein neues Passwort für meinen Webshop [nbsp]möchten, indem Sie auf diesen <a href=\"##link##\">Link</a> klicken. Danach werden Sie auf meine Webseite geleitet und können ein neues Passwort festlegen.</p>\n<p>Herzliche Grüße,</p>\n<p>Clever Quiroz</p>\n<p>[nbsp]</p>\n<p><br>P.S.</p>\n<p>Falls Sie diese Email irrtümlich erhalten und Sie kein neues Passwort vergeben möchten, ignorieren Sie diese Email bitte einfach.</p>', '', '', '', NULL),
(8, 4, 1670099351, 'email', 'en', '1', '##recipient_email##', '', NULL, NULL, '', '', NULL, NULL, '', 'order confirmation ##uniqid##', 'textAndHtml', 'Dear customer', '<p>Dear customer</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(11, 6, 1670103590, 'email', 'de', '', '##member_email##', '', NULL, NULL, 'Clever Quiroz', 'cleno1970@hotmail.de', '##admin_email##', NULL, '', 'Ihre Änderung Ihrer persönlichen Daten im Webshop von Clever Quiroz', 'textAndHtml', 'Liebe/r ##member_firstname## ##member_lastname##,\n\nSie haben Ihre persönlichen Daten im Webshop von Clever Quiroz erfolgreich geändert. \n\nVielen Dank und herzliche Grüße,\n\nIhr Clever Quiroz', '<p>Liebe/r ##member_firstname## ##member_lastname##,</p>\n<p>Sie haben <a href=\"{{link_url::7|urlattr}}\">Ihre persönlichen Daten im Webshop von Clever Quiroz </a>erfolgreich geändert.</p>\n<p>Vielen Dank und herzliche Grüße,</p>\n<p>Ihr Clever Quiroz</p>', '', '', '', NULL),
(12, 6, 1670102981, 'email', 'en', '1', '##recipient_email##', '', NULL, NULL, '', '', NULL, NULL, '', 'order confirmation ##uniqid##', 'textAndHtml', 'Dear customer', '<p>Dear customer</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(15, 8, 1671309560, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'Clever Quiroz', 'cleno1970@hotmail.de', NULL, NULL, '', 'Vielen Dank für Ihren Zahlungseingang zur Bestellung ##document_number## im webshop von Clever Quiroz', 'textAndHtml', 'Hallo,\n\n\nvielen Dank, Ihre Zahlung für Ihre Bestellung mit der Bestellnummer: ##document_number## ist eingegangen.\n\n{if shipping_label == \"Abholung\"}\n\nSofern noch nicht geschehen, kontaktieren sie mich bitte, um die Details der Abholung zu vereinbaren.\n\n{endif}\n\n{if order_status_notes != \'\'}\n\n##order_status_notes##\n\n{endif}\n\n[nbsp]\n\nZusammenfassung Ihrer Bestellung:\n\nBestellnummer: ##document_number##\n\n[nbsp]\n\n##cart_html##\n\n[nbsp]\n\n##payment_label##\n\nMein Konto IBAN: DE\n\n{if shipping_label !== \"Abholung\"}\n\n##shipping_label## an ##shipping_address##\n\n{endif}\n\n##shipping_note##\n\n[nbsp]\n\nHerzliche Grüße,\n\nIhr Clever Quiroz', '<p>Hallo,</p>\n<p><br>vielen Dank, Ihre Zahlung für Ihre Bestellung mit der Bestellnummer: ##document_number## ist eingegangen.</p>\n<p><span style=\"font-size: 0.875rem;\">{if shipping_label &#61;&#61; &#34;Abholung&#34;}</span></p>\n<p>Sofern noch nicht geschehen, kontaktieren sie mich bitte, um die Details der Abholung zu vereinbaren.</p>\n<p>{endif}</p>\n<p>{if order_status_notes !&#61; &#39;&#39;}</p>\n<p>##order_status_notes##</p>\n<p>{endif}</p>\n<p><span style=\"font-size: 0.875rem;\">[nbsp]</span></p>\n<p>Zusammenfassung Ihrer Bestellung:</p>\n<p>Bestellnummer: ##document_number##</p>\n<p>[nbsp]</p>\n<p>##cart_html##</p>\n<p>[nbsp]</p>\n<p><span style=\"font-size: 0.875rem;\">##payment_label##</span></p>\n<p>Mein Konto <span style=\"font-size: 0.875rem;\">IBAN: DE</span></p>\n<p>{if shipping_label !&#61;&#61; &#34;Abholung&#34;}</p>\n<p>##shipping_label## an ##shipping_address##</p>\n<p>{endif}</p>\n<p>##shipping_note##</p>\n<p>[nbsp]</p>\n<p><span style=\"font-size: 0.875rem;\">Herzliche Grüße,</span></p>\n<p>Ihr Clever Quiroz</p>', '', '', '', NULL),
(16, 8, 1671143629, 'email', 'en', '1', '##recipient_email##', '', NULL, NULL, '', '', NULL, NULL, '', 'order confirmation ##uniqid##', 'textAndHtml', 'Dear customer', '<p>Dear customer</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(17, 9, 1671307076, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'Clever Quiroz', 'cleno1970@hotmail.de', NULL, NULL, '', 'Stornierung ihrer Bestellung ##document_number## im webshop von Clever Quiroz', 'textAndHtml', 'Hallo,\n\nIhre Stornierung für Ihre Bestellung mit der Bestellnummer: ##document_number## ist eingegangen.\n\nIch Danke Ihnen für Ihr Interesse und hoffe, Sie bleiben weiter interessiert.\n\n[nbsp]\n\n{if order_status_notes !== \'\'}\n\n##order_status_notes##\n\n{endif}\n\n[nbsp]\n\n{if order_status == \"Zahlung eingegangen\"}\n\nIch erstatte Ihre Zahlung in den nächsten Tagen.\n\n{endif}\n\n[nbsp]\n\n[nbsp]\n\nZusammenfassung Ihrer Bestellung:\n\nBestellnummer: ##document_number####\n\nStatus: ##order_status##\n\n[nbsp]\n\n##cart_html##\n\n[nbsp]\n\nZahlung per ##payment_label##\n\n{if shipping_label !== \"Abholung\"}\n\nVersand per ##shipping_label## an ##shipping_address##\n\n##shipping_note##\n\n{endif}\n\n[nbsp]\n\n[nbsp]\n\nHerzliche Grüße,\n\nIhr Clever Quiroz', '<p>Hallo,</p>\n<p>Ihre Stornierung für Ihre Bestellung mit der Bestellnummer: <span style=\"font-size: 0.875rem;\">##document_number## ist eingegangen.</span></p>\n<p>Ich Danke Ihnen für Ihr Interesse und hoffe, Sie bleiben weiter interessiert.</p>\n<p><span style=\"font-size: 0.875rem;\">[nbsp]</span></p>\n<p>{if order_status_notes !&#61;&#61; &#39;&#39;}</p>\n<p>##order_status_notes##</p>\n<p>{endif}</p>\n<p>[nbsp]</p>\n<p>{if order_status &#61;&#61; &#34;Zahlung eingegangen&#34;}</p>\n<p>Ich erstatte Ihre Zahlung in den nächsten Tagen.</p>\n<p>{endif}</p>\n<p>[nbsp]</p>\n<p>[nbsp]</p>\n<p><span style=\"font-size: 0.875rem;\">Zusammenfassung Ihrer Bestellung:</span></p>\n<p>Bestellnummer: ##document_number####</p>\n<p>Status: ##order_status##</p>\n<p>[nbsp]</p>\n<p>##cart_html##</p>\n<p>[nbsp]</p>\n<p>Zahlung per ##payment_label##</p>\n<p>{if shipping_label !&#61;&#61; &#34;Abholung&#34;}</p>\n<p>Versand per ##shipping_label## an ##shipping_address##</p>\n<p><span style=\"font-size: 0.875rem;\">##shipping_note##</span></p>\n<p><span style=\"font-size: 0.875rem;\">{endif}</span></p>\n<p>[nbsp]</p>\n<p>[nbsp]</p>\n<p>Herzliche Grüße,</p>\n<p>Ihr Clever Quiroz</p>', '', '', '', NULL),
(18, 9, 1671144297, 'email', 'en', '1', '##recipient_email##', '', NULL, NULL, '', '', NULL, NULL, '', 'order confirmation ##uniqid##', 'textAndHtml', 'Dear customer', '<p>Dear customer</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(19, 10, 1671147987, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'Clever Quiroz', 'cleno1970@hotmail.de', NULL, NULL, '', 'Ihre Ware zur Bestellung ##document_number## im webshop von Clever Quiroz wurde versandt', 'textAndHtml', 'Hallo,\n\n{if order_status == \"Zahlung eingegangen\"}\n\n\nVielen Dank für Ihre Zahlung.\n\n{endif}\n\nIch habe Ihre bestellte Ware versandt. \n\n[nbsp]\n\n{if order_status_notes != \'\'}\n\n##order_status_notes##\n\n{endif}\n\n[nbsp]\n\n[nbsp]\n\nZusammenfassung Ihrer Bestellung:\n\nBestellnummer: ##order_id##\n\nStatus: ##order_status##\n\n[nbsp]\n\n##cart_html##\n\n[nbsp]\n\nZahlung per ##payment_label##\n\nVersand per ##shipping_label## an ##shipping_address##\n\n##shipping_note##\n\n[nbsp]\n\n[nbsp]\n\nHerzliche Grüße,\n\nIhr Clever Quiroz', '<p>Hallo,</p>\n<p><span style=\"font-size: 0.875rem;\">{if order_status &#61;&#61; &#34;Zahlung eingegangen&#34;}</span></p>\n<p>Vielen Dank für Ihre Zahlung.</p>\n<p>{endif}</p>\n<p>Ich habe Ihre bestellte Ware versandt. </p>\n<p><span style=\"font-size: 0.875rem;\">[nbsp]</span></p>\n<p>{if order_status_notes !&#61; &#39;&#39;}</p>\n<p>##order_status_notes##</p>\n<p>{endif}</p>\n<p>[nbsp]</p>\n<p>[nbsp]</p>\n<p><span style=\"font-size: 0.875rem;\">Zusammenfassung Ihrer Bestellung:</span></p>\n<p>Bestellnummer: ##order_id##</p>\n<p>Status: ##order_status##</p>\n<p>[nbsp]</p>\n<p>##cart_html##</p>\n<p>[nbsp]</p>\n<p>Zahlung per ##payment_label##</p>\n<p>Versand per ##shipping_label## an ##shipping_address##</p>\n<p>##shipping_note##</p>\n<p>[nbsp]</p>\n<p>[nbsp]</p>\n<p>Herzliche Grüße,</p>\n<p>Ihr Clever Quiroz</p>', '', '', '', NULL),
(20, 10, 1671147770, 'email', 'en', '1', '##recipient_email##', '', NULL, NULL, '', '', NULL, NULL, '', 'order confirmation ##uniqid##', 'textAndHtml', 'Dear customer', '<p>Dear customer</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(21, 11, 1681677346, 'email', 'de', '', 'info@clever-quiroz.de', '', NULL, NULL, 'Clever Quiroz', 'admin@clever-quiroz.de', NULL, NULL, '', 'Neue Anfrage über das Kontaktformular clever-quiroz.de', 'textAndHtml', 'Es ist eine neue Anfrage über das Kontaktformular hereingekommen.\n\n\n\n\nAbsender: ##form_email##\n\n\n\n\nNachricht: ##form_message##', '<p>Es ist eine neue Anfrage über das Kontaktformular hereingekommen.</p>\n<p>[nbsp]</p>\n<p>Absender: ##form_email##</p>\n<p>[nbsp]</p>\n<p>Nachricht: ##form_message##</p>\n<p>[nbsp]</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(22, 12, 1681738699, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'Clever-Quiroz.de', 'admin@clever-quiroz.de', NULL, NULL, '', 'Ihr Newsletter Abonnement bei Clever-Quiroz.de', 'textAndHtml', 'Moin,\n\nWir haben eine Anfrage erhalten, dass Sie meinen Newsletter abonnieren möchten.\n\nBitte bestätigen Sie: ##link## \n\nIch freue mich über Ihr Interesse, herzliche Grüße,\n\nClever Quiroz', '<p>Moin,</p>\n<p>Wir haben eine Anfrage erhalten, dass Sie meinen Newsletter abonnieren möchten.</p>\n<p>[nbsp]</p>\n<p><a href=\"##link##\">Bitte bestätigen Sie!</a></p>\n<p>[nbsp]</p>\n<p>Ich freue mich über Ihr Interesse, herzliche Grüße,</p>\n<p>Clever Quiroz</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(23, 13, 1679413826, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'ernst.jendritzki@nachhaltig-im-web.de', 'ernst.jendritzki@nachhaltig-im-web.de', NULL, NULL, '', 'Neues Newsletter Abonnement bei Clever.Quiroz.de', 'textAndHtml', 'Lieber Clever,\n\nJemand hat deinen Newsletter abonniert: ##recipient_email##.\n\nHerzliche Grüße,\n\nDeine nette Webseite', '<p>Lieber Clever,</p>\n<p>Jemand hat deinen Newsletter abonniert: ##recipient_email##.</p>\n<p>Herzliche Grüße,</p>\n<p>Deine nette Webseite</p>\n<p>[nbsp]</p>', '', '', '', NULL),
(24, 14, 1681765141, 'email', 'de', '', '##recipient_email##', '', NULL, NULL, 'Clever Quiroz', 'admin@clever-quiroz.de', NULL, NULL, '', 'Neues von Clever Quiroz - Newsletter', 'textAndHtml', 'Moin,\n\nich hoffe, Sie haben viel Freude an meinem neuen Newsletter.\n\nHerzliche Grüße,\n\nClever Quiroz\n\n##news_headline##\n\n##news_text##', '<p>Moin,</p>\n<p>ich hoffe, Sie haben viel Freude an meinem neuen Newsletter.</p>\n<p>Herzliche Grüße,</p>\n<p>Clever Quiroz</p>\n<p>[nbsp]</p>\n<p>[nbsp]</p>\n<h3><span style=\"font-size: 0.875rem;\">##news_headline##</span></h3>\n<p><span style=\"font-size: 0.875rem;\">##news_text##</span></p>\n<p>[nbsp]</p>', '', '', '', NULL);

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
(1, 3, 1678375371, 'Bestellbestätigung', 1, 'email', 3, 'mail_default', '', '', '1'),
(2, 4, 1670015324, 'Registrierungsvalidierung', 1, 'email', 3, 'mail_default', '', '', '1'),
(4, 6, 1671822083, 'Validierung Passwortanfrage', 1, 'email', 3, 'mail_default', '', '', '1'),
(6, 8, 1670103602, 'Bestätigung der Änderung Ihrer persönlichen Daten', 1, 'email', 3, 'mail_default', '', '', '1'),
(8, 10, 1671309563, 'Zahlungsbestätigung', 1, 'email', 3, 'mail_default', '', '', '1'),
(9, 11, 1671307079, 'Stornierungsbestätigung', 1, 'email', 3, 'mail_default', '', '', '1'),
(10, 12, 1671147991, 'Versandbestätigung', 1, 'email', 3, 'mail_default', '', '', '1'),
(11, 13, 1681677350, 'Neue Kontaktanfrage', 1, 'email', 3, 'mail_default', '', '', '1'),
(12, 14, 1681738702, 'Newsletter abonniert', 1, 'email', 3, 'mail_default', '', '', '1'),
(13, 15, 1679413838, 'Newsletter aktiviert', 1, 'email', 3, 'mail_default', '', '', '1'),
(14, 16, 1681765144, 'News to Newsletter', 1, 'email', 3, 'mail_newsletter', '', '', '1');

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
(3, 1678375233, 'Bestellbestätigung', 'iso_order_status_change', ',', NULL, 'iso_collection_default', 'asc_id', 0, 1),
(4, 1670099400, 'Validierung Registrierung', 'member_registration', ',', NULL, 'iso_collection_default', 'asc_id', 0, 1),
(6, 1670099369, 'Validierung Passwortanfrage', 'member_password', ',', NULL, 'iso_collection_default', 'asc_id', 0, 1),
(8, 1670103003, 'Bestätigung Datenänderung', 'member_personaldata', ',', NULL, 'iso_collection_default', 'asc_id', 0, 1),
(10, 1671143821, 'Zahlungsbestätigung', 'iso_order_status_change', ',', NULL, 'iso_collection_default', 'asc_id', 0, 0),
(11, 1671144311, 'Stornierungsbestätigung', 'iso_order_status_change', ',', NULL, 'iso_collection_default', 'asc_id', 0, 0),
(12, 1671147781, 'Versandbestätigung', 'iso_order_status_change', ',', NULL, 'iso_collection_default', 'asc_id', 0, 0),
(13, 1681676925, 'Kontaktanfrage', 'core_form', ',', NULL, '', 'asc_id', 0, 0),
(14, 1681736216, 'Newsletter abonniert', 'newsletter_subscribe', ',', NULL, '', 'asc_id', 0, 0),
(15, 1679413702, 'Newsletter aktiviert', 'newsletter_activate', ',', NULL, '', 'asc_id', 0, 0),
(16, 1681758736, 'News to Newsletter', 'news_newsletter_default', ',', NULL, '', 'asc_id', 0, 0);

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
-- Dumping data for table `tl_news`
--

INSERT INTO `tl_news` (`id`, `pid`, `tstamp`, `headline`, `featured`, `alias`, `author`, `date`, `time`, `pageTitle`, `robots`, `description`, `subheadline`, `teaser`, `addImage`, `overwriteMeta`, `singleSRC`, `alt`, `imageTitle`, `size`, `imagemargin`, `imageUrl`, `fullsize`, `caption`, `floating`, `addEnclosure`, `enclosure`, `source`, `jumpTo`, `articleId`, `url`, `target`, `cssClass`, `noComments`, `published`, `start`, `stop`, `languageMain`, `newsletter`) VALUES
(1, 1, 1680121134, 'Meine Webseite ist in Arbeit', '', 'meine-webseite-ist-in-arbeit', 1, 1679495640, 1679495640, '', 'index,follow', NULL, '', '<p>Ernst und ich bauen an meiner neuen Webseite. Eine Kunstgalerie</p>', '1', '', 0xeca3d279ca4011ed8ef80242ac10ee0c, '', '', 'a:3:{i:0;s:3:\"400\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', '', '', '', 'above', '', NULL, 'default', 0, 0, '', '', '', '', '1', '', '', 0, '0'),
(2, 1, 1681763733, 'Eine Ausstellung im Zukunftshaus Rissen wird geplant', '', 'eine-ausstellung-im-zukunftshaus-rissen-wird-geplant', 1, 1679600880, 1679600880, '', 'index,follow', NULL, '', '<p>Ich bereite eine Ausstellung einiger meiner Kunstobjekte im Pop-Up-Zukunftshaus Rissen vor.</p>', '1', '', 0xbf5162fcca4211ed8ef80242ac10ee0c, '', '', 'a:3:{i:0;s:3:\"500\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', '', '', '', 'above', '', NULL, 'default', 0, 0, '', '', '', '', '1', '', '', 0, '0'),
(5, 1, 1681558638, 'Ältere-Nachricht-1', '', 'aeltere-nachricht-1', 1, 1677676560, 1677676560, '', 'index,follow', NULL, '', '<p>Inhalt von Ältere-Nachricht-1</p>', '1', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:3:\"400\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', '', '', '', 'above', '', NULL, 'default', 0, 0, '', '', '', '', '1', '', '', 0, '0'),
(6, 1, 1681558635, 'Ältere-Nachricht-3', '', 'aeltere-nachricht-3', 1, 1677849480, 1677849480, '', 'index,follow', NULL, '', '<p>Inhalt von Ältere-Nachricht-3</p>', '1', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:3:\"400\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', '', '', '', 'above', '', NULL, 'default', 0, 0, '', '', '', '', '1', '', '', 0, '0'),
(7, 1, 1681558635, 'Ältere-Nachricht-2', '', 'aeltere-nachricht-2', 1, 1677763080, 1677763080, '', 'index,follow', NULL, '', '<p>Inhalt von Ältere-Nachricht-2</p>', '1', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:3:\"400\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', '', '', '', 'above', '', NULL, 'default', 0, 0, '', '', '', '', '1', '', '', 0, '0'),
(8, 1, 1681758688, 'Ältere-Nachricht-4', '', 'aeltere-nachricht-4', 3, 1677938280, 1677938280, '', 'index,follow', NULL, '', '<p>Inhalt von Ältere-Nachricht-3</p>', '1', '', 0x2e61d057c4e911ed99b40242ac10ee0c, '', '', 'a:3:{i:0;s:3:\"400\";i:1;s:0:\"\";i:2;s:12:\"proportional\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', '', '', '', 'above', '', NULL, 'default', 0, 0, '', '', '', '', '1', '', '', 0, '0'),
(9, 1, 1681759142, 'Ich stelle auf der altonale aus!', '', 'ich-stelle-auf-der-altonale-aus-2', 3, 1681759080, 1681759080, '', 'index,follow', NULL, '', '<p>Gerade bin ich sehr beschäftigt, meine Ausstellung im Rahmen der altonale vorzubereiten.</p>', '1', '', 0x929249a7ca4011ed8ef80242ac10ee0c, '', '', 'a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:11:\"_newsletter\";}', 'a:5:{s:6:\"bottom\";s:0:\"\";s:4:\"left\";s:0:\"\";s:5:\"right\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"unit\";s:0:\"\";}', '', '', '', 'above', '', NULL, 'default', 0, 0, '', '', '', '', '1', '', '', 0, '0');

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

--
-- Dumping data for table `tl_newsletter`
--

INSERT INTO `tl_newsletter` (`id`, `pid`, `tstamp`, `subject`, `alias`, `content`, `text`, `addFile`, `files`, `template`, `sendText`, `externalImages`, `mailerTransport`, `sender`, `senderName`, `sent`, `date`) VALUES
(8, 1, 1681853372, 'Mein erster frei formulierter Newsletter', '', '<p>Was soll ich schreiben?</p>', 'Was soll ich schreiben?', '', NULL, '', '', '', '', '', '', '1', '1681853287');

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

--
-- Dumping data for table `tl_newsletter_channel`
--

INSERT INTO `tl_newsletter_channel` (`id`, `tstamp`, `title`, `jumpTo`, `template`, `mailerTransport`, `sender`, `senderName`) VALUES
(1, 1681680579, 'Newsletter', 0, 'mail_newsletter', '', 'admin@clever-quiroz.de', 'Clever Quiroz');

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

--
-- Dumping data for table `tl_newsletter_recipients`
--

INSERT INTO `tl_newsletter_recipients` (`id`, `pid`, `tstamp`, `email`, `active`, `addedOn`) VALUES
(24, 1, 1681758498, 'ernstjendritzki@web.de', '1', '1681758490'),
(25, 1, 1682602676, 'ernst.jendritzki@nachhaltig-im-web.de', '1', '1681820162');

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
-- Dumping data for table `tl_opt_in`
--

INSERT INTO `tl_opt_in` (`id`, `tstamp`, `token`, `createdOn`, `confirmedOn`, `removeOn`, `invalidatedThrough`, `email`, `emailSubject`, `emailText`) VALUES
(1, 1671571642, 'reg-8e1073f9d1d034527d67', 1671571621, 1671571642, 1766266042, '', 'ernst.jendritzki@nachhaltig-im-web.de', '', NULL),
(2, 1671571885, 'reg-2e49e7b11ce6d493b21a', 1671571870, 1671571885, 1766266285, '', 'ernstjendritzki@web.de', '', NULL),
(3, 1671662450, 'reg-c07ce2cb853c07575929', 1671662384, 1671662450, 1766356850, '', 'ernst.jendritzki@nachhaltig-im-web.de', '', NULL),
(5, 1671822057, 'pw-96b13e13abdc288cfb3a6', 1671822032, 1671822057, 1766516457, '', 'ernstjendritzki@web.de', '', NULL),
(6, 1671822344, 'pw-a67d2c673de4f0b92e518', 1671822318, 1671822344, 1766516744, '', 'ernstjendritzki@web.de', '', NULL),
(7, 1671834606, 'pw-c62a4efa29bcdfd4d2e94', 1671834587, 1671834606, 1766529006, '', 'ernstjendritzki@web.de', '', NULL),
(8, 1671834683, 'pw-725e58a8195f875b900ef', 1671834653, 1671834683, 1766529083, '', 'ernstjendritzki@web.de', '', NULL),
(9, 1671834722, 'pw-2ae415999a4bb065c104f', 1671834704, 1671834722, 1766529122, '', 'ernstjendritzki@web.de', '', NULL),
(15, 1681736437, 'nl-894f48aa8692810f2b874', 1681736431, 1681736437, 1776430837, '', 'ernstjendritzki@web.de', '', NULL),
(21, 1681738719, 'nl-f22495813ad21ba2d791b', 1681738710, 1681738719, 1776433119, '', 'ernstjendritzki@web.de', '', NULL),
(22, 1681758498, 'nl-3a4b77e10db1c7acc78d3', 1681758490, 1681758498, 1776452898, '', 'ernstjendritzki@web.de', '', NULL),
(23, 1681820175, 'nl-369e09b4e864dc4f1419e', 1681820162, 1681820175, 1776514575, '', 'ernst.jendritzki@nachhaltig-im-web.de', '', NULL);

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

--
-- Dumping data for table `tl_opt_in_related`
--

INSERT INTO `tl_opt_in_related` (`id`, `pid`, `relTable`, `relId`) VALUES
(1, 1, 'tl_member', 1),
(2, 2, 'tl_member', 2),
(3, 3, 'tl_member', 3),
(5, 5, 'tl_member', 2),
(6, 6, 'tl_member', 2),
(7, 7, 'tl_member', 2),
(8, 8, 'tl_member', 2),
(9, 9, 'tl_member', 2),
(15, 15, 'tl_newsletter_recipients', 17),
(21, 21, 'tl_newsletter_recipients', 23),
(22, 22, 'tl_newsletter_recipients', 24),
(23, 23, 'tl_newsletter_recipients', 25);

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
(1, 0, 128, 1682432105, 'Clever Quiroz', 'root', 'startpoint', '', 0, 'Clever Quiroz', 'de', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '1', '', '', '1', '', '', 0x613a313a7b693a303b733a313a2231223b7d, '1', 1, 0, '1', 31536000, '', 900, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', '', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 1, '', 0, 0, '', '', ''),
(2, 1, 128, 1682432105, 'Willkommen', 'regular', 'willkommen', '', 0, 'Meine Kunst', '', 'noindex,nofollow', 'Ich bin freischaffender Künstler mit Herz und Leidenschaft.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'willkommen', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 31, '', '', ''),
(3, 1, 256, 1682432105, 'Galerie', 'forward', 'galerie', '', 0, 'Meine Kunstwerke', '', 'noindex,nofollow', 'Hier sehen Sie eine Auswahl aus meinem Schaffen.', 'permanent', 32, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '1', 2, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(4, 1, 384, 1682432106, 'Shop', 'forward', 'shop', '', 0, 'Kaufen Sie gerne', '', 'noindex,nofollow', 'Erwerben Sie meine Kunstwerke und bringen Sie Freude in Ihr Zu Hause.', 'permanent', 8, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'shop', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(7, 1, 448, 1682432106, 'Mein Konto', 'forward', 'shop/mein-konto', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 40, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 0, 0, '1', 900, '', 900, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'user account', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(8, 4, 320, 1682432106, 'Warenkorb', 'regular', 'shop/warenkorb', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'cart', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(9, 4, 640, 1682432106, 'AGB und Info', 'regular', 'shop/rechtlicheInformationen', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'info', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(10, 1, 512, 1682432107, 'Kontakt', 'regular', 'kontakt', '', 0, 'Kontakt', '', 'noindex,nofollow', 'Wie Sie mich erreichen können...', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'contact', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(11, 10, 128, 1682432107, 'Bestätigung Ihrer Kontaktanfrage', 'regular', 'kontakt/bestaetigung-ihrer-kontaktanfrage', '', 0, 'Bestätigung Ihrer Kontaktanfrage', '', 'noindex,nofollow', 'Bestätigung Ihrer Kontaktanfrage', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'contact', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(12, 1, 640, 1682432107, 'Impressum', 'regular', 'impressum', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'imprint', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(13, 1, 768, 1682432107, 'Datenschutz', 'regular', 'datenschutz', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'privacy', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(14, 1, 896, 1682432107, 'Suchergebnisse', 'regular', 'suchergebnisse', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'searchres', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(18, 4, 336, 1682432106, 'Kasse', 'regular', 'shop/warenkorb/kasse', '', 0, 'Kasse', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'checkout', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(19, 4, 488, 1682432106, 'Bestellung abgeschlossen', 'regular', 'shop/warenkorb/bestellung-abgeschlossen', '', 0, 'Bestellung abgeschlossen', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'order_finished', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(22, 42, 56, 1682432106, 'Meine Bestellungen', 'regular', 'shop/mein-konto/bestellhistorie', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(23, 22, 128, 1682432106, 'Bestelldetails', 'regular', 'shop/mein-konto/bestellhistorie/bestelldetails', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', 0x613a313a7b693a303b733a323a222d31223b7d, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'order_details', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(24, 1, 496, 1682432107, 'Passwort vergessen', 'regular', 'shop/mein-konto/passwort-vergessen', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', 0x613a313a7b693a303b733a323a222d31223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'password', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(25, 42, 256, 1682432106, 'Logout', 'regular', 'shop/mein-konto/logout', '', 0, '', '', 'noindex,nofollow', 'unsichtbare Seite, die den Benutzer automatisch abmeldet', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', '', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(26, 1, 1024, 1682432107, '404 Seite nicht gefunden', 'error_404', '', '', 0, 'Seite nicht gefunden', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '404', '', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(28, 42, 384, 1682432106, 'Bestätigung der Änderung Ihrer Personendaten', 'regular', 'shop/mein-konto/aenderung-personendaen-bestaetigen', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'user', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(29, 42, 512, 1682432107, 'Bestätigung Ihrer Kontoschliessung', 'regular', 'shop/mein-konto/kontoschliessung-bestaetigen', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'user', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(30, 0, 64, 1682432105, 'Clever Quiroz &#40;en&#41;', 'root', 'clever-quiroz-en', '', 0, 'Clever Quiroz', 'en', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '1', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '1', '', '', '1', '', '', 0x613a313a7b693a303b733a313a2231223b7d, '1', 1, 0, '1', 31536000, '', 900, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', '', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 1, '', 0, 0, '81903', '2a8602575983082d55331afcd1a5e7743ba335ca6b99c8abbf8e90f0350464706f2e93c037d002e9cca0166c964a57051066d1c6c84081ff215346ffaf48dbce', '8620d6957f6182cc4b29676afe94d8e51c560f7d67ed4609bbc6cdd9695be4dc'),
(31, 30, 128, 1682432105, 'welcome', 'regular', 'welcome', '', 0, 'My art', '', 'index,follow', 'I am a self employed artist', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'willkommen', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(32, 3, 128, 1682432105, 'Bilder', 'regular', 'kunstwerke/bilder', '', 0, 'Meine Bilder', '', 'noindex,nofollow', 'Auf meiner Webseite präsentiere ich faszinierende Kunstwerke, die ich durch Upcycling geschaffen habe.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(33, 3, 256, 1682432105, 'Skulpturen', 'regular', 'kunstwerke/skulpturen', '', 0, 'Meine Skulpturen', '', 'noindex,nofollow', 'Auf meiner Webseite präsentiere ich faszinierende Kunstwerke, die ich durch Upcycling geschaffen habe.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(34, 4, 768, 1682432106, 'AGB', 'regular', 'shop/agb', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'info', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(36, 24, 128, 1682432107, 'Validierung Ihrer Passwortanfrage', 'regular', 'shop/mein-konto/passwort-vergessen/validierung-ihrer-passwortanfrage', '', 0, '', '', 'noindex,nofollow', 'Hinweis, dass der Link in der Email geklickt werden muß.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'user', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(37, 24, 256, 1682432107, 'Neues Passwort wurde vergeben', 'regular', 'shop/mein-konto/passwort-vergessen/neues-passwort-vergeben', '', 0, '', '', 'noindex,nofollow', 'Der Anwender kann sich hier ein neues Passwort für die Anmeldung vergeben.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'user', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(40, 7, 16, 1682432106, 'Anmelden', 'regular', 'shop/mein-konto/anmelden', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'log-reg', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(41, 4, 328, 1682432106, 'Bestellmodus', 'regular', 'shop/warenkorb/bestellmodus', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a323a222d31223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'order_mode', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(42, 1, 480, 1682432106, 'Mein Konto', 'regular', 'mein-konto', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'account', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(44, 42, 160, 1682432106, 'Passwort vergessen', 'forward', 'mein-konto/passwort-vergessen', '', 0, '', '', 'index,follow', NULL, 'permanent', 24, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(45, 42, 112, 1682432106, 'Meine Adressen', 'regular', 'mein-konto/meine-adressen', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 22, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'address', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(46, 42, 136, 1682432106, 'Bestätigung der Änderung Ihrer Rechnungsadresse', 'regular', 'mein-konto/bestaetigung-der-aenderung-ihrer-rechnungsadresse', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', 0x613a313a7b693a303b733a313a2231223b7d, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'user', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(48, 7, 144, 1682432106, 'Passwort vergessen', 'forward', 'shop/mein-konto/passwort-vergessen-2', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 24, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(49, 1, 576, 1682432107, 'Newsletter', 'regular', 'newsletter', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', 'newsletter', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(50, 49, 128, 1682432107, 'Newsletter bitte bestätigen', 'regular', 'newsletter/newsletter-bitte-bestaetigen', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', '', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(51, 49, 256, 1682432107, 'Newsletter ist aktiviert', 'regular', 'newsletter/newsletter-ist-aktiviert', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', '', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(52, 49, 384, 1682432107, 'Newsletter kündigen', 'regular', 'newsletter/newsletter-kuendigen', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', '', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(53, 49, 512, 1682432107, 'Newsletter ist gekündigt', 'regular', 'newsletter/newsletter-ist-gekuendigt', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', '', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(54, 1, 320, 1682432105, 'Neues', 'regular', 'neues', '', 0, 'Neues von Clever Quiroz - Upcycling Art', '', 'noindex,nofollow', 'Meine Kunst ist besonders - und ein Aufruf zum Handeln.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'news', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(55, 54, 128, 1682432105, 'Nachrichtendetails', 'regular', 'neues/nachrichtendetails', '', 0, 'Nachrichtendetails zu Clever Quiroz - Upcycling Art', '', 'noindex,nofollow', 'Ich möchte auch dazu inspirieren, achtsamer mit unserem Konsumverhalten umzugehen.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 2, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'news', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(56, 1, 704, 1682432107, 'Pflichtangaben', 'regular', 'pflichtangaben', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', '', 'map_default', '1', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', ''),
(57, 13, 128, 1682432107, 'Datenschutz socialmedia', 'regular', 'datenschutz/datenschutz-socialmedia', '', 0, '', '', 'noindex,nofollow', NULL, 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '1', 3, 1, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '1', '', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'none', 0, 0, '', 0, 0, '', '', ''),
(58, 3, 192, 1682432105, 'Kollagen', 'regular', 'galerie/kollagen', '', 0, 'Meine Bilder', '', 'noindex,nofollow', 'Auf meiner Webseite präsentiere ich faszinierende Kunstwerke, die ich durch Upcycling geschaffen habe.', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 3, 0, 'a:10:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g4\";i:8;s:2:\"g5\";i:9;s:2:\"g6\";}', '', 'gallery', 'map_default', '', '', 0, '', '1', '', '', '', 0, 17, 'current', 0, 0, '', 0, 0, '', '', ''),
(59, 1, 504, 1682432107, 'Links', 'regular', 'links', '', 0, 'Weitere Quellen zu Upcycling Art', '', 'index,follow', 'Upcycling Art findet sich bei Clever Quiroz und an anderen Stellen', 'permanent', 0, '', '', '', '', '', '', '', '', NULL, NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', NULL, '', 0, 0, '', 0, '', 0, '', 2, 2, 'a:12:{i:0;s:2:\"u1\";i:1;s:2:\"u2\";i:2;s:2:\"u3\";i:3;s:2:\"u4\";i:4;s:2:\"u5\";i:5;s:2:\"u6\";i:6;s:2:\"g1\";i:7;s:2:\"g2\";i:8;s:2:\"g3\";i:9;s:2:\"g4\";i:10;s:2:\"g5\";i:11;s:2:\"g6\";}', '', '', 'map_default', '', '', 0, '', '1', '', '', '', 0, 0, 'current', 0, 0, '', 0, 0, '', '', '');

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
(118, 0x4099322eeb3c5633a4908ecb2086f39d31a8d107ca05ce52a78239be57a7d1b2, 0x38e5a641b2cd95a7276a9f99bf1b640cbd9aa72f59bf4f245e32dcf13b107b322f65923c04347139babcdda9e7f7423bceba3bc99c46a5c6fe48237e9d90fe9d, '2022-12-22 01:04:42', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(122, 0xee47b95f10c128bb3246dcbf6da862cadf7322158648dc8ce5cdd89f44df786e, 0xf05e025bfc5350855f25706ebc5d871d926f6a62d9be4d9b77f81352c86a87be2b5a597eeafaf8f7d13f091daf55b6b7aaff14fc43edf492a3b8649f3e243e5b, '2022-12-22 01:13:27', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(127, 0x8da2e910a490e0ed1e9761bb2aa8684321ad49e8604d207fe11d534f885b7a98, 0xfbfdfbb6ebf04a69f38b75d34ba8e4250905094476d5d8d375d17a48aaedbe686630c08997690f0f235b35b3f9e90ba98cf74e399395c8dd748809af4d8a6a3e, '2022-12-22 01:24:02', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(128, 0x4f40baba8b51426fd0acf06fcb4614610a1ee5af5f971d548f005c3d5dddf58a, 0x8ada9ee6d869ca6edc648b6845db1e4327537b26c99edff0b672b411ac9879e3fa32e5b4a1598d547ef6b0c62b4ac67e8d2204e4ec1a8630daad217ec8d2b07b, '2022-12-22 01:41:01', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(129, 0x3a4c4372fc47980d2c08dee027c5d861734cf448f6f1cd324b00b52bdcf8a78a, 0x089e1fea987678f9ed93e120ee58915f70fe09ec6a9768d2f8dafccab7c9318080e4055052f6cb7aa6213afef153fff9a8dc106a51316d2d99dd3e040c9da5a6, '2022-12-22 01:43:33', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(130, 0xbf5c5dbba82428862c94585c9f109678b082a3b9f10e8ff0455630dc7a96f3e0, 0xfa231ccc9d82472c93d186e36793505e0617c1ef75920c63fc3bc2c01a80d01ee34c794fee6f4dcdbf33f639c421cd5bc78b850b2612f263ed28ca9be96304d5, '2022-12-22 01:43:53', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(131, 0x3cb079dc5063e26a43a4c660a2f673abb4b257336a79b86cd308e62c89a7ebd2, 0xce614fd961370f5739d792d6ae39d7de16c0bba9537c44d391f7e4ebd0484b165835a72706029dad460f2354861011760eab270b7c4c733acb1b78e3de6f0273, '2022-12-22 01:46:29', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(140, 0x2b3f0ef5b274aa24ff212f4c7c60cf3d0ac29455b0d1ec1180a129312a4c7ae7, 0x6286d0d0f4ae739076c4c148ada79999e06742b5125a5eb9a13bd957b49a4eb0363979678c3381b569c31a13a7204c9139ee29df1666252e57b94346b0370f6f, '2022-12-24 22:52:27', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(159, 0x03f6f3b2bab07d467a5d1e913e734cf33a7191e2e2c9310ede67065cf3b22e02, 0x849a4b9ca951b1d9fce0aa918564edb017df4a9f491a9dd49cd5a0b9783fce8d1c5749a5109a018348393d234923e41fd1d4b704b1771ea615fe361b4fc9e815, '2023-03-09 22:03:39', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(161, 0x8b0deca3f11add847b380c6db0a31f155e20ac2fd5f6775ac3e15d0fd92d6361, 0xc45403e948dfe2f2e36b616e32b90f2ed33a87e3805b4ae5279e997952af3ef0d79bcdfb55788dc6322cd575ba1e776ba805fe65a6bdd47bc94b7889688d0c95, '2023-03-10 13:23:03', NULL, 'Contao\\FrontendUser', 'ernstjendritzki@web.de'),
(162, 0xb5eeecbd109adc91caf2a4dd69206339c6f402fc4bfa75d936f2f4a44fa5a8a6, 0x55516fc1241937c0d49e0a898a5785fa62d2edfc8ceb08f56d9b5bd95d183d6ba42061b7c4106aadaa4301328fbe3276c85c69983ca49129ee81acf97be36e57, '2023-04-27 15:38:37', '2023-05-02 19:42:08', 'Contao\\FrontendUser', 'ernst.jendritzki@nachhaltig-im-web.de'),
(163, 0xb5eeecbd109adc91caf2a4dd69206339c6f402fc4bfa75d936f2f4a44fa5a8a6, 0xeb56ca14b2c05c567122e231c9efd9c916336739a525e17e657c1289998e51dffae1c1ec0147d04dc4a0e32b0c2ffc8c45c621aa05296c9a54935fb9b6d2671a, '2023-05-02 19:41:08', NULL, 'Contao\\FrontendUser', 'ernst.jendritzki@nachhaltig-im-web.de'),
(164, 0x7082081b3a02f4ed6c18a0befeee36dd2bdddfbb1904d4fd9cc8b01bd0432101, 0x335ba49d6e05536dc1da157c275de7b1ccf76e2df43e3f0d3a515c2c0fbc5cd1cd8dc43da2c55edecac30060a413803f52ff297014594a62b6a766b6c097510e, '2023-06-08 13:52:07', NULL, 'Contao\\FrontendUser', 'ernst.jendritzki@nachhaltig-im-web.de');

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
(1, 3, 1688591857, 'tl_iso_product', 'DELETE FROM tl_iso_product WHERE id=87', 3, 0x613a333a7b733a31343a22746c5f69736f5f70726f64756374223b613a313a7b693a303b613a33383a7b733a323a226964223b693a38373b733a333a22706964223b693a38363b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539313833323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539313831343b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a313b7d7d733a32303a22746c5f69736f5f70726f647563745f7072696365223b613a313a7b693a303b613a383a7b733a323a226964223b693a34393b733a333a22706964223b693a38373b733a363a22747374616d70223b693a313638383539313833323b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b7d7d733a32343a22746c5f69736f5f70726f647563745f707269636574696572223b613a313a7b693a303b613a353a7b733a323a226964223b693a35343b733a333a22706964223b693a34393b733a363a22747374616d70223b693a313638383539313833323b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d, 0x613a343a7b693a303b733a363a22266e6273703b223b693a313b733a32323a2250726f64756b74206f686e652056617269616e74656e223b693a323b733a303a22223b693a333b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d, NULL);

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
(2, 1681852917, 'cleno1970@hotmail.de', 'Clever Quiroz', 'cleno1970@hotmail.de', 'de', 'flexible', '', 'DropZone', '1', '1', '1', '', '$2y$13$zjK1bNpl5B/UnZccB1V1J.i8j50mzZKSEDChX0Eup4wNWbb9JZZcm', '', '', 0x613a313a7b693a303b733a313a2232223b7d, 'group', 0x613a31303a7b693a303b733a373a2261727469636c65223b693a313b733a343a22666f726d223b693a323b733a383a22636f6d6d656e7473223b693a333b733a343a226e657773223b693a343b733a31303a226e6577736c6574746572223b693a353b733a31323a2269736f5f70726f6475637473223b693a363b733a31363a226e635f6e6f74696669636174696f6e73223b693a373b733a31333a22566964656f68616e6462756368223b693a383b733a353a2266696c6573223b693a393b733a31323a22707265766965775f6c696e6b223b7d, 0x613a303a7b7d, 0x613a363a7b693a303b733a383a22686561646c696e65223b693a313b733a343a2274657874223b693a323b733a31303a2262655f72656d61726b73223b693a333b733a393a2268797065726c696e6b223b693a343b733a353a22696d616765223b693a353b733a373a2267616c6c657279223b7d, 0x613a313a7b693a303b733a31313a226578706c616e6174696f6e223b7d, 0x613a31363a7b693a303b693a33303b693a313b693a313b693a323b693a323b693a333b693a333b693a343b693a33323b693a353b693a33333b693a363b693a31303b693a373b693a31313b693a383b693a31343b693a393b693a35343b693a31303b693a35353b693a31313b693a34393b693a31323b693a35303b693a31333b693a35313b693a31343b693a35323b693a31353b693a35333b7d, 0x613a323a7b693a303b733a373a22726567756c6172223b693a313b733a373a22666f7277617264223b7d, 0x613a313a7b693a303b733a31363a22979dcfe763a211edb8900242ac10ee0c223b7d, 0x613a333a7b693a303b733a323a226631223b693a313b733a323a226632223b693a323b733a323a226633223b7d, 0x613a353a7b693a303b733a31313a225f6e6577736c6574746572223b693a313b733a363a225f7731323030223b693a323b733a383a225f66697474696e67223b693a333b733a31323a2270726f706f7274696f6e616c223b693a343b733a333a22626f78223b7d, 0x613a313a7b693a303b733a313a2231223b7d, 0x613a303a7b7d, 0x613a303a7b7d, '', '', '', 0x613a31353a7b733a31393a2269736f5f70726f647563745f75706461746572223b4e3b733a31353a226669656c647365745f737461746573223b613a373a7b733a393a22746c5f6d6f64756c65223b613a313a7b733a31353a2274656d706c6174655f6c6567656e64223b693a313b7d733a32353a22746c5f69736f5f70726f647563745f636f6c6c656374696f6e223b613a313a7b733a31333a227374617475735f6c6567656e64223b693a313b7d733a31303a22746c5f61727469636c65223b613a313a7b733a31333a227465617365725f6c6567656e64223b693a303b7d733a31303a22746c5f636f6e74656e74223b613a323a7b733a31313a22747970655f6c6567656e64223b693a313b733a31343a22696d676c696e6b5f6c6567656e64223b693a313b7d733a31353a22746c5f6e6577735f61726368697665223b613a323a7b733a31373a226e6577736c65747465725f6c6567656e64223b693a313b733a31353a22636f6d6d656e74735f6c6567656e64223b693a313b7d733a373a22746c5f6e657773223b613a323a7b733a31363a22656e636c6f737572655f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b7d733a31333a22746c5f6e6577736c6574746572223b613a313a7b733a31313a22746578745f6c6567656e64223b693a313b7d7d733a32333a22746c5f61727469636c655f746c5f706167655f74726565223b613a33373a7b693a33303b693a313b693a313b693a313b693a323b693a303b693a333b693a303b693a343b693a303b693a31303b693a303b693a31323b693a303b693a31333b693a303b693a31343b693a303b693a32363b693a303b693a31373b693a303b693a353b693a303b693a363b693a303b693a383b693a303b693a373b693a303b693a393b693a303b693a33343b693a303b693a34303b693a303b693a34353b693a303b693a33323b693a303b693a33333b693a303b693a34393b693a303b693a34323b693a303b693a35343b693a303b693a35353b693a303b693a33313b693a303b693a34313b693a303b693a31383b693a303b693a31393b693a303b693a34383b693a303b693a32343b693a303b693a33363b693a303b693a33373b693a303b693a35303b693a303b693a35313b693a303b693a35323b693a303b693a35333b693a303b7d733a363a2266696c746572223b613a303a7b7d733a373a22736f7274696e67223b613a303a7b7d733a363a22736561726368223b613a303a7b7d733a31323a22746c5f706167655f74726565223b613a34323a7b693a33303b693a313b693a313b693a313b693a323b693a303b693a333b693a313b693a343b693a303b693a31303b693a303b693a31323b693a303b693a31333b693a303b693a31343b693a303b693a32363b693a303b693a33323b693a303b693a33333b693a303b693a373b693a303b693a34303b693a303b693a34323b693a303b693a34333b693a303b693a34353b693a303b693a34363b693a303b693a34343b693a303b693a32353b693a303b693a32383b693a303b693a32393b693a303b693a33313b693a303b693a32343b693a303b693a31373b693a303b693a353b693a303b693a363b693a303b693a383b693a303b693a32323b693a303b693a393b693a303b693a33343b693a303b693a35343b693a303b693a35353b693a303b693a34313b693a303b693a31383b693a303b693a31393b693a303b693a34383b693a303b693a34393b693a313b693a35303b693a303b693a35313b693a303b693a35323b693a303b693a35333b693a303b7d733a383a2266696c6574726565223b613a353a7b733a383a223837303965313162223b693a313b733a383a226534363633363933223b693a313b733a383a223237363330373062223b693a313b733a383a223338373635643735223b693a313b733a383a223038663365613530223b693a313b7d733a31373a22746c5f69736f5f67726f75705f74726565223b613a333a7b693a333b693a303b693a313b693a303b693a323b693a303b7d733a31363a2269736f5f70726f64756374735f676964223b693a303b733a31313a226e65775f7265636f726473223b613a303a7b7d733a31323a22746c5f706167655f6e6f6465223b733a313a2230223b733a31313a2269736f5f7265706f727473223b613a333a7b733a31313a2273616c65735f746f74616c223b613a363a7b733a363a22706572696f64223b733a353a226d6f6e7468223b733a343a2273746f70223b693a313637313939393637383b733a353a227374617274223b693a313635363138343837383b733a373a22636f6c756d6e73223b733a313a2236223b733a31303a22646174655f6669656c64223b733a363a226c6f636b6564223b733a343a2266726f6d223b733a303a22223b7d733a31333a2273616c65735f70726f64756374223b613a353a7b733a373a22746c5f736f7274223b733a353a22746f74616c223b733a363a22706572696f64223b733a353a226d6f6e7468223b733a373a22636f6c756d6e73223b733a313a2236223b733a31303a22646174655f6669656c64223b733a363a226c6f636b6564223b733a343a2266726f6d223b733a303a22223b7d733a31343a226d656d626572735f677565737473223b613a363a7b733a363a22706572696f64223b733a353a226d6f6e7468223b733a343a2273746f70223b693a313637313939393638373b733a353a227374617274223b693a313635363138343838373b733a373a22636f6c756d6e73223b733a313a2236223b733a31303a22646174655f6669656c64223b733a363a226c6f636b6564223b733a343a2266726f6d223b733a303a22223b7d7d733a31363a2264636157697a61726452656665726572223b733a3230303a226261636b656e643f646f3d6e635f6e6f74696669636174696f6e732669643d3131267461626c653d746c5f6e635f6d657373616765266163743d656469742672743d3037653065383634656339303736633864362e736552345138676e7846366270336256376641494932723770576a566869474932566248746f586d4f4e6f2e7771556f495a352d6e413738315244696e34646b6552796f78692d7a3052586d6d6869672d4c6131655a5f43306b3473765561464e716d534551267265663d63345363676e4a65223b733a31303a2243555252454e545f4944223b4e3b7d, 1669571264, NULL, '', 1681491165, 1681491359, 0, 0, NULL, 0, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a313a7b693a303b733a313a2231223b7d, 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a363a2264656c657465223b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a313a7b693a303b733a313a2231223b7d, 0x613a303a7b7d, '', '', 0x613a363a7b693a303b733a383a22686561646c696e65223b693a313b733a343a2274657874223b693a323b733a31353a226163636f7264696f6e53696e676c65223b693a333b733a393a2268797065726c696e6b223b693a343b733a353a22696d616765223b693a353b733a373a2267616c6c657279223b7d, 0x613a333a7b693a303b733a353a227061676573223b693a313b733a383a2261727469636c6573223b693a323b733a383a22636f6e74656e7473223b7d, 0x613a333a7b693a303b733a31313a2273616c65735f746f74616c223b693a313b733a31333a2273616c65735f70726f64756374223b693a323b733a31343a226d656d626572735f677565737473223b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a313a7b693a303b733a313a2231223b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a323a7b693a303b733a313a2236223b693a313b733a313a2237223b7d, 0x613a323a7b693a303b733a31383a2272656c617465645f63617465676f72696573223b693a313b733a393a22696e74656772697479223b7d, NULL, '', 'be_mod', NULL, ''),
(3, 1681676680, 'ernst.jendritzki@nachhaltig-im-web.de', 'ernst.jendritzki@nachhaltig-im-web.de', 'ernst.jendritzki@nachhaltig-im-web.de', 'de', 'flexible', '', 'DropZone', '1', '1', '1', '1', '$2y$13$j8Z8BndCtw3.n/xe9/E2MeIGoLLAzkOmTL5bGD.O./tsD.drPR.o6', '', '1', NULL, 'group', 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, '', '', '', 0x613a383a7b733a31393a2269736f5f70726f647563745f75706461746572223b4e3b733a31353a226669656c647365745f737461746573223b613a333a7b733a31383a22746c5f69736f5f70726f6475637474797065223b613a343a7b733a31353a2274656d706c6174655f6c6567656e64223b693a313b733a31333a227072696365735f6c6567656e64223b693a303b733a31383a226465736372697074696f6e5f6c6567656e64223b693a303b733a31353a2276617269616e74735f6c6567656e64223b693a313b7d733a393a22746c5f6d6f64756c65223b613a343a7b733a31363a227265666572656e63655f6c6567656e64223b693a303b733a31353a2274656d706c6174655f6c6567656e64223b693a313b733a31363a2270726f7465637465645f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b7d733a373a22746c5f75736572223b613a313a7b733a31353a2270617373776f72645f6c6567656e64223b693a313b7d7d733a31313a226e65775f7265636f726473223b613a303a7b7d733a31323a22746c5f706167655f74726565223b613a32303a7b693a33303b693a303b693a313b693a313b693a323b693a303b693a333b693a313b693a35343b693a303b693a343b693a303b693a373b693a303b693a34323b693a303b693a32343b693a303b693a35393b693a303b693a31303b693a303b693a34393b693a303b693a31323b693a303b693a35363b693a303b693a31333b693a303b693a31343b693a303b693a32363b693a303b693a33323b693a303b693a35383b693a303b693a33333b693a303b7d733a373a22736f7274696e67223b613a313a7b733a393a22746c5f6d6f64756c65223b733a343a226e616d65223b7d733a363a22736561726368223b613a313a7b733a393a22746c5f6d6f64756c65223b613a323a7b733a353a226669656c64223b733a323a226964223b733a353a2276616c7565223b733a323a223239223b7d7d733a363a2266696c746572223b613a313a7b733a31313a22746c5f6d6f64756c655f31223b613a313a7b733a353a226c696d6974223b733a343a22302c3330223b7d7d733a31303a2243555252454e545f4944223b4e3b7d, 1681676680, NULL, '', 1688591659, 1688592045, 0, 0, NULL, 0, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, '1', '1', 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, 0x613a303a7b7d, NULL, '', 'contextmenu', NULL, '');

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
(1, 35, 1686225473, 1, 'tl_iso_product', 0, NULL, 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=e57.AlIXnnog42wAdipfn43XFN3-20iySXQHmy6Hfpi8BSQ.ayJjrTtL1V05QV0dp7_vbbCWgjDYAU111WXtGs6KaAlRDTrzNxWpFnADGg&ref=MCFNyDSo', '', 0x613a33383a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232353037373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a303b7d),
(2, 35, 1686225473, 1, 'tl_iso_product_category', 0, NULL, 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=e57.AlIXnnog42wAdipfn43XFN3-20iySXQHmy6Hfpi8BSQ.ayJjrTtL1V05QV0dp7_vbbCWgjDYAU111WXtGs6KaAlRDTrzNxWpFnADGg&ref=MCFNyDSo', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35333b733a333a22706964223b693a33353b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638313636363536343b733a373a22706167655f6964223b693a35383b7d7d),
(3, 35, 1686225481, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=e57.AlIXnnog42wAdipfn43XFN3-20iySXQHmy6Hfpi8BSQ.ayJjrTtL1V05QV0dp7_vbbCWgjDYAU111WXtGs6KaAlRDTrzNxWpFnADGg&ref=MCFNyDSo', '', 0x613a34303a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232353438313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35333b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(4, 35, 1686225481, 2, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=e57.AlIXnnog42wAdipfn43XFN3-20iySXQHmy6Hfpi8BSQ.ayJjrTtL1V05QV0dp7_vbbCWgjDYAU111WXtGs6KaAlRDTrzNxWpFnADGg&ref=MCFNyDSo', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35333b733a333a22706964223b693a33353b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638313636363536343b733a373a22706167655f6964223b693a35383b7d7d),
(5, 35, 1686225481, 2, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=e57.AlIXnnog42wAdipfn43XFN3-20iySXQHmy6Hfpi8BSQ.ayJjrTtL1V05QV0dp7_vbbCWgjDYAU111WXtGs6KaAlRDTrzNxWpFnADGg&ref=MCFNyDSo', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313637393037373037363b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32373b733a333a22706964223b693a32373b733a363a22747374616d70223b693a313638323434313333363b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(6, 3, 1686225495, 1, 'tl_user', 0, NULL, 'ernst.jendritzki@nachhaltig-im-web.de', 'backend?do=user&act=edit&id=3&ref=0o3TvIbk&rt=c8f2959ff33a.qwgpjmqpPTFP96I0PxDCWbrK-7M1TFZTZxpK1GnVEVQ.wnhdvSvCCwB2wNV2ByL6INeiostfBG8hKVEgsD_jfHn4VwTjJ5x3Sz-Ckg', '1', 0x613a38313a7b733a323a226964223b693a333b733a363a22747374616d70223b693a313638313637363638303b733a383a22757365726e616d65223b733a33373a2265726e73742e6a656e647269747a6b69406e61636868616c7469672d696d2d7765622e6465223b733a343a226e616d65223b733a33373a2265726e73742e6a656e647269747a6b69406e61636868616c7469672d696d2d7765622e6465223b733a353a22656d61696c223b733a33373a2265726e73742e6a656e647269747a6b69406e61636868616c7469672d696d2d7765622e6465223b733a383a226c616e6775616765223b733a323a226465223b733a31323a226261636b656e645468656d65223b733a383a22666c657869626c65223b733a31303a2266756c6c73637265656e223b733a303a22223b733a383a2275706c6f61646572223b733a303a22223b733a383a2273686f7748656c70223b733a313a2231223b733a31303a227468756d626e61696c73223b733a313a2231223b733a363a22757365525445223b733a313a2231223b733a353a227573654345223b733a313a2231223b733a383a2270617373776f7264223b733a36303a22243279243133246a385a38426e64437477332e6e2f7865392f45324d6549476f4c4c417a6b4f6d544c356247442e4f2e2f7473442e647250522e6f36223b733a383a2270774368616e6765223b733a303a22223b733a353a2261646d696e223b733a313a2231223b733a363a2267726f757073223b4e3b733a373a22696e6865726974223b733a353a2267726f7570223b733a373a226d6f64756c6573223b733a363a22613a303a7b7d223b733a363a227468656d6573223b733a363a22613a303a7b7d223b733a383a22656c656d656e7473223b733a363a22613a303a7b7d223b733a363a226669656c6473223b733a363a22613a303a7b7d223b733a31303a22706167656d6f756e7473223b733a363a22613a303a7b7d223b733a353a22616c707479223b733a363a22613a303a7b7d223b733a31303a2266696c656d6f756e7473223b733a363a22613a303a7b7d223b733a333a22666f70223b733a363a22613a303a7b7d223b733a31303a22696d61676553697a6573223b733a363a22613a303a7b7d223b733a353a22666f726d73223b733a363a22613a303a7b7d223b733a353a22666f726d70223b733a363a22613a303a7b7d223b733a333a22616d67223b733a363a22613a303a7b7d223b733a373a2264697361626c65223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a373a2273657373696f6e223b733a323935353a22613a31333a7b733a31323a22746c5f706167655f74726565223b613a31323a7b693a313b693a313b693a333b693a313b693a343b693a313b693a373b693a313b693a31303b693a313b693a31333b693a313b693a32323b693a313b693a32343b693a313b693a33303b693a313b693a34323b693a313b693a34393b693a313b693a35343b693a313b7d733a31353a226669656c647365745f737461746573223b613a31363a7b733a373a22746c5f70616765223b613a363a7b733a31343a22776562736974655f6c6567656e64223b693a313b733a31363a2270726f7465637465645f6c6567656e64223b693a313b733a31333a226c61796f75745f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b733a31323a2263686d6f645f6c6567656e64223b693a313b733a31323a2263616368655f6c6567656e64223b693a313b7d733a373a22746c5f666f726d223b613a333a7b733a31323a2273746f72655f6c6567656e64223b693a313b733a31353a2274656d706c6174655f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b7d733a31333a22746c5f6e635f6d657373616765223b613a313a7b733a31333a226578706572745f6c6567656e64223b693a313b7d733a31333a22746c5f6e6577736c6574746572223b613a333a7b733a31313a22746578745f6c6567656e64223b693a303b733a31333a2273656e6465725f6c6567656e64223b693a303b733a31353a2274656d706c6174655f6c6567656e64223b693a303b7d733a393a22746c5f6d6f64756c65223b613a343a7b733a31353a2274656d706c6174655f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b733a31363a2270726f7465637465645f6c6567656e64223b693a313b733a31363a227265666572656e63655f6c6567656e64223b693a313b7d733a31353a22746c5f6e6577735f61726368697665223b613a313a7b733a31373a226e6577736c65747465725f6c6567656e64223b693a313b7d733a373a22746c5f6e657773223b613a323a7b733a31333a226578706572745f6c6567656e64223b693a313b733a31363a22656e636c6f737572655f6c6567656e64223b693a313b7d733a31303a22746c5f636f6e74656e74223b613a323a7b733a31353a2274656d706c6174655f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b7d733a32313a22746c5f6e6577736c65747465725f6368616e6e656c223b613a313a7b733a31353a2274656d706c6174655f6c6567656e64223b693a313b7d733a31333a22746c5f757365725f67726f7570223b613a313a7b733a31323a22616c6578665f6c6567656e64223b693a313b7d733a31353a22746c5f6661715f63617465676f7279223b613a313a7b733a31353a22636f6d6d656e74735f6c6567656e64223b693a313b7d733a363a22746c5f666171223b613a323a7b733a31363a22656e636c6f737572655f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b7d733a31383a22746c5f69736f5f70726f6475637474797065223b613a343a7b733a31353a2276617269616e74735f6c6567656e64223b693a313b733a31333a226578706572745f6c6567656e64223b693a313b733a31383a226465736372697074696f6e5f6c6567656e64223b693a313b733a31333a227072696365735f6c6567656e64223b693a313b7d733a31363a22746c5f69736f5f617474726962757465223b613a313a7b733a31383a226465736372697074696f6e5f6c6567656e64223b693a313b7d733a32333a22746c5f69736f5f6174747269627574655f6f7074696f6e223b613a313a7b733a31333a226578706572745f6c6567656e64223b693a313b7d733a32323a2269736f5f62655f6f766572766965775f6c6567656e64223b613a313a7b733a31333a226d697363656c6c616e656f7573223b693a313b7d7d733a31363a2264636157697a61726452656665726572223b733a3139353a226261636b656e643f646f3d69736f5f7365747570266d6f643d61747472696275746573267461626c653d746c5f69736f5f617474726962757465266163743d656469742669643d31352672743d66662e415a716f433843332d3279425341527854386a48376766374d6437356f38482d5956424e366351584530382e61614b61637647476c67584f416e344349507a7971477a5758704f5036504b5a55796745323564745a53705a34754643746f4764482d6b795151267265663d4e53574d51715747223b733a31323a22746c5f706167655f6e6f6465223b733a313a2230223b733a32333a22746c5f61727469636c655f746c5f706167655f74726565223b613a31323a7b693a313b693a313b693a333b693a313b693a343b693a313b693a373b693a313b693a31303b693a313b693a31333b693a313b693a32323b693a313b693a32343b693a313b693a33303b693a313b693a34323b693a313b693a34393b693a313b693a35343b693a313b7d733a31313a226e65775f7265636f726473223b613a323a7b733a31353a22746c5f6661715f63617465676f7279223b613a313a7b693a303b733a313a2231223b7d733a363a22746c5f666171223b613a313a7b693a303b733a313a2231223b7d7d733a383a2266696c6574726565223b613a333a7b733a383a223338373635643735223b693a313b733a383a223038663365613530223b693a313b733a383a223733393930336463223b693a303b7d733a31353a22636865636b626f785f67726f757073223b613a31393a7b733a31383a226362635f6d6f64756c65735f6c61796f7574223b693a313b733a32313a226362635f616c6578665f746c5f636f6d6d656e7473223b693a303b733a32303a226362635f616c6578665f746c5f636f6e74656e74223b693a303b733a31383a226362635f616c6578665f746c5f66696c6573223b693a303b733a31373a226362635f616c6578665f746c5f666f726d223b693a303b733a32333a226362635f616c6578665f746c5f666f726d5f6669656c64223b693a303b733a32333a226362635f616c6578665f746c5f696d6167655f73697a65223b693a303b733a32323a226362635f616c6578665f746c5f69736f5f67726f7570223b693a303b733a32343a226362635f616c6578665f746c5f69736f5f70726f64756374223b693a303b733a33303a226362635f616c6578665f746c5f69736f5f70726f647563745f7072696365223b693a303b733a32343a226362635f616c6578665f746c5f6e635f6c616e6775616765223b693a303b733a32333a226362635f616c6578665f746c5f6e635f6d657373616765223b693a303b733a32383a226362635f616c6578665f746c5f6e635f6e6f74696669636174696f6e223b693a303b733a31373a226362635f616c6578665f746c5f6e657773223b693a303b733a32353a226362635f616c6578665f746c5f6e6577735f61726368697665223b693a303b733a32333a226362635f616c6578665f746c5f6e6577736c6574746572223b693a303b733a33313a226362635f616c6578665f746c5f6e6577736c65747465725f6368616e6e656c223b693a303b733a32323a226362635f616c6578665f746c5f6c696e6b5f64617461223b693a313b733a32363a226362635f616c6578665f746c5f6c696e6b5f63617465676f7279223b693a313b7d733a363a2266696c746572223b613a323a7b733a363a22746c5f6c6f67223b613a313a7b733a353a226c696d6974223b733a353a2233302c3330223b7d733a31313a22746c5f6d6f64756c655f31223b613a313a7b733a353a226c696d6974223b733a353a2233302c3330223b7d7d733a31393a2269736f5f70726f647563745f75706461746572223b4e3b733a373a22736f7274696e67223b613a303a7b7d733a363a22736561726368223b613a303a7b7d733a31303a2243555252454e545f4944223b4e3b7d223b733a393a22646174654164646564223b693a313638313637363638303b733a363a22736563726574223b4e3b733a31323a2275736554776f466163746f72223b733a303a22223b733a393a226c6173744c6f67696e223b693a313638333437393735353b733a31323a2263757272656e744c6f67696e223b693a313638363232353034353b733a31333a226c6f67696e417474656d707473223b693a303b733a363a226c6f636b6564223b693a303b733a31313a226261636b7570436f646573223b4e3b733a31393a2274727573746564546f6b656e56657273696f6e223b693a303b733a343a2266617173223b733a363a22613a303a7b7d223b733a343a2266617170223b733a363a22613a303a7b7d223b733a343a226e657773223b733a363a22613a303a7b7d223b733a343a226e657770223b733a363a22613a303a7b7d223b733a393a226e6577736665656473223b733a363a22613a303a7b7d223b733a393a226e6577736665656470223b733a363a22613a303a7b7d223b733a393a2263616c656e64617273223b733a363a22613a303a7b7d223b733a393a2263616c656e64617270223b733a363a22613a303a7b7d223b733a31333a2263616c656e6461726665656473223b733a363a22613a303a7b7d223b733a31333a2263616c656e6461726665656470223b733a363a22613a303a7b7d223b733a31313a226e6577736c657474657273223b733a363a22613a303a7b7d223b733a31313a226e6577736c657474657270223b733a363a22613a303a7b7d223b733a33313a22726f636b736f6c696446726f6e74656e6448656c7065724c69676874626f78223b733a313a2231223b733a32333a22726f636b736f6c696446726f6e74656e6448656c706572223b733a313a2231223b733a33383a22726f636b736f6c696446726f6e74656e6448656c706572436f6e74656e74456c656d656e7473223b733a363a22613a303a7b7d223b733a33333a22726f636b736f6c696446726f6e74656e6448656c7065724f7065726174696f6e73223b733a363a22613a303a7b7d223b733a31313a2269736f5f7265706f727473223b733a363a22613a303a7b7d223b733a31373a2269736f5f6d656d6265725f67726f757073223b733a363a22613a303a7b7d223b733a31303a2269736f5f67726f757070223b733a363a22613a303a7b7d223b733a31303a2269736f5f67726f757073223b733a363a22613a303a7b7d223b733a31313a2269736f5f636f6e66696770223b733a363a22613a303a7b7d223b733a31313a2269736f5f636f6e66696773223b733a363a22613a303a7b7d223b733a31333a2269736f5f7461785f7261746570223b733a363a22613a303a7b7d223b733a31333a2269736f5f7461785f7261746573223b733a363a22613a303a7b7d223b733a31343a2269736f5f7461785f636c61737370223b733a363a22613a303a7b7d223b733a31353a2269736f5f7461785f636c6173736573223b733a363a22613a303a7b7d223b733a32303a2269736f5f7368697070696e675f6d6f64756c6570223b733a363a22613a303a7b7d223b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b733a363a22613a303a7b7d223b733a31393a2269736f5f7061796d656e745f6d6f64756c6570223b733a363a22613a303a7b7d223b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b733a363a22613a303a7b7d223b733a31373a2269736f5f70726f647563745f7479706570223b733a363a22613a303a7b7d223b733a31373a2269736f5f70726f647563745f7479706573223b733a363a22613a303a7b7d223b733a31313a2269736f5f6d6f64756c6573223b733a363a22613a303a7b7d223b733a31383a22706167654c616e67756167654c6162656c73223b4e3b733a31313a2265745f62656d6f64526566223b733a303a22223b733a373a2265745f6d6f6465223b733a31313a22636f6e746578746d656e75223b733a31363a2265745f6163746976654d6f64756c6573223b4e3b733a393a2265745f656e61626c65223b733a303a22223b7d),
(7, 35, 1686225878, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=67.Qa7mC_Mo2M7GVT4e-Rl6QFAoVmWPe47eHLIqwXSAnQ0.L8iRcpdBi4SJNFRfnmg8AipYZzf_LeeqXcIdrkCzr3h42dRxtneUg6USCg&ref=u-Lp0Z7l', '', 0x613a34303a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232353837383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35333b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(8, 35, 1686225878, 3, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=67.Qa7mC_Mo2M7GVT4e-Rl6QFAoVmWPe47eHLIqwXSAnQ0.L8iRcpdBi4SJNFRfnmg8AipYZzf_LeeqXcIdrkCzr3h42dRxtneUg6USCg&ref=u-Lp0Z7l', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35333b733a333a22706964223b693a33353b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638313636363536343b733a373a22706167655f6964223b693a35383b7d7d),
(9, 35, 1686225878, 3, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=67.Qa7mC_Mo2M7GVT4e-Rl6QFAoVmWPe47eHLIqwXSAnQ0.L8iRcpdBi4SJNFRfnmg8AipYZzf_LeeqXcIdrkCzr3h42dRxtneUg6USCg&ref=u-Lp0Z7l', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313637393037373037363b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32373b733a333a22706964223b693a32373b733a363a22747374616d70223b693a313638323434313333363b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(10, 35, 1686225951, 4, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=67.Qa7mC_Mo2M7GVT4e-Rl6QFAoVmWPe47eHLIqwXSAnQ0.L8iRcpdBi4SJNFRfnmg8AipYZzf_LeeqXcIdrkCzr3h42dRxtneUg6USCg&ref=u-Lp0Z7l', '', 0x613a34303a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232353935313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35333b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(11, 35, 1686225951, 4, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=67.Qa7mC_Mo2M7GVT4e-Rl6QFAoVmWPe47eHLIqwXSAnQ0.L8iRcpdBi4SJNFRfnmg8AipYZzf_LeeqXcIdrkCzr3h42dRxtneUg6USCg&ref=u-Lp0Z7l', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35333b733a333a22706964223b693a33353b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638313636363536343b733a373a22706167655f6964223b693a35383b7d7d),
(12, 35, 1686225951, 4, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=67.Qa7mC_Mo2M7GVT4e-Rl6QFAoVmWPe47eHLIqwXSAnQ0.L8iRcpdBi4SJNFRfnmg8AipYZzf_LeeqXcIdrkCzr3h42dRxtneUg6USCg&ref=u-Lp0Z7l', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313637393037373037363b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32373b733a333a22706964223b693a32373b733a363a22747374616d70223b693a313638323434313333363b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(13, 32, 1686228973, 1, 'tl_iso_product', 0, NULL, 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=a5808d4fcc7ca49233bd.swXh_G8GaUmw4QssqEf0-9lls834Ze4CeaB6_RzsJ20.3WOWhQtvOgP_gGFtzzayuaMVgp-IM4d2ONBNkijfFRiKctOGKlklBNOmPw&ref=LgoJ6tF0', '', 0x613a33383a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638323533353739343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a303b7d),
(14, 32, 1686228973, 1, 'tl_iso_product_category', 0, NULL, 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=a5808d4fcc7ca49233bd.swXh_G8GaUmw4QssqEf0-9lls834Ze4CeaB6_RzsJ20.3WOWhQtvOgP_gGFtzzayuaMVgp-IM4d2ONBNkijfFRiKctOGKlklBNOmPw&ref=LgoJ6tF0', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(15, 32, 1686228981, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=a5808d4fcc7ca49233bd.swXh_G8GaUmw4QssqEf0-9lls834Ze4CeaB6_RzsJ20.3WOWhQtvOgP_gGFtzzayuaMVgp-IM4d2ONBNkijfFRiKctOGKlklBNOmPw&ref=LgoJ6tF0', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232383938313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(16, 32, 1686228981, 2, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=a5808d4fcc7ca49233bd.swXh_G8GaUmw4QssqEf0-9lls834Ze4CeaB6_RzsJ20.3WOWhQtvOgP_gGFtzzayuaMVgp-IM4d2ONBNkijfFRiKctOGKlklBNOmPw&ref=LgoJ6tF0', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(17, 32, 1686228981, 2, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=a5808d4fcc7ca49233bd.swXh_G8GaUmw4QssqEf0-9lls834Ze4CeaB6_RzsJ20.3WOWhQtvOgP_gGFtzzayuaMVgp-IM4d2ONBNkijfFRiKctOGKlklBNOmPw&ref=LgoJ6tF0', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(18, 44, 1686228988, 1, 'tl_iso_product', 0, NULL, 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=ecd11feff6c9ce245.UCIGqN7knxq5KAQNQlwpd6AeyjTaYAoN5QfVi-HnrW4.PkRx0bqNzFD2SW5MJS1vNdpu-2aqNmN5pHfi5NXUnxtpVTTSm7vTV9pvMA&ref=3Je-Sm3g', '', 0x613a33383a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638323533363032343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a323b7d),
(19, 44, 1686229005, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=ecd11feff6c9ce245.UCIGqN7knxq5KAQNQlwpd6AeyjTaYAoN5QfVi-HnrW4.PkRx0bqNzFD2SW5MJS1vNdpu-2aqNmN5pHfi5NXUnxtpVTTSm7vTV9pvMA&ref=3Je-Sm3g', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232393030353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(20, 44, 1686229005, 2, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=ecd11feff6c9ce245.UCIGqN7knxq5KAQNQlwpd6AeyjTaYAoN5QfVi-HnrW4.PkRx0bqNzFD2SW5MJS1vNdpu-2aqNmN5pHfi5NXUnxtpVTTSm7vTV9pvMA&ref=3Je-Sm3g', '', 0x613a303a7b7d),
(21, 44, 1686229005, 2, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=ecd11feff6c9ce245.UCIGqN7knxq5KAQNQlwpd6AeyjTaYAoN5QfVi-HnrW4.PkRx0bqNzFD2SW5MJS1vNdpu-2aqNmN5pHfi5NXUnxtpVTTSm7vTV9pvMA&ref=3Je-Sm3g', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(22, 45, 1686229009, 1, 'tl_iso_product', 0, NULL, '', 'backend?do=iso_products&id=45&act=edit&rt=b8edde717c99b14688715a1d69c.2vBD1lZqeLEtBai86zcOvCtX3Djc_N0fVKCCxboDqnQ.tJY0rzIDK_tiZML9jEZI_lEn7WqsqrRrFdC1qo4wmAHjh3GsEzU0_E5CnA&ref=LyJLwEbf', '', 0x613a33383a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638323533363033323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a313b7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(23, 45, 1686229014, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=b8edde717c99b14688715a1d69c.2vBD1lZqeLEtBai86zcOvCtX3Djc_N0fVKCCxboDqnQ.tJY0rzIDK_tiZML9jEZI_lEn7WqsqrRrFdC1qo4wmAHjh3GsEzU0_E5CnA&ref=LyJLwEbf', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232393031343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(24, 45, 1686229014, 2, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=b8edde717c99b14688715a1d69c.2vBD1lZqeLEtBai86zcOvCtX3Djc_N0fVKCCxboDqnQ.tJY0rzIDK_tiZML9jEZI_lEn7WqsqrRrFdC1qo4wmAHjh3GsEzU0_E5CnA&ref=LyJLwEbf', '', 0x613a303a7b7d),
(25, 45, 1686229014, 2, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=b8edde717c99b14688715a1d69c.2vBD1lZqeLEtBai86zcOvCtX3Djc_N0fVKCCxboDqnQ.tJY0rzIDK_tiZML9jEZI_lEn7WqsqrRrFdC1qo4wmAHjh3GsEzU0_E5CnA&ref=LyJLwEbf', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(26, 44, 1686344749, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=2b6fb14e436751e79144.k2w6nyek-J7qrKPwqk3eL1iozQiS56fJXyfQvyIEstE._QpN5kPNq9SlzcmxzTyYbSLY_Frisc69Hlfn0BY3gKSqGwjlYvu004nrlw&ref=bMypeVe_', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363334343734393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(27, 44, 1686344749, 3, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=2b6fb14e436751e79144.k2w6nyek-J7qrKPwqk3eL1iozQiS56fJXyfQvyIEstE._QpN5kPNq9SlzcmxzTyYbSLY_Frisc69Hlfn0BY3gKSqGwjlYvu004nrlw&ref=bMypeVe_', '', 0x613a303a7b7d),
(28, 44, 1686344749, 3, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=2b6fb14e436751e79144.k2w6nyek-J7qrKPwqk3eL1iozQiS56fJXyfQvyIEstE._QpN5kPNq9SlzcmxzTyYbSLY_Frisc69Hlfn0BY3gKSqGwjlYvu004nrlw&ref=bMypeVe_', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(29, 45, 1686344764, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=3f4e2fc86c68bda151.8acKNDPZ1rJq2rpjzfdPcHhRYv5HfMLpI-yGA_Aor6w.n8F9TVewhfglu9AiqoYJMgIhU6w3KqudYpyxbMQbndnI0DhOdoaa_wmdjg&ref=N40sTDNE', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363334343736343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2234223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(30, 45, 1686344764, 3, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=3f4e2fc86c68bda151.8acKNDPZ1rJq2rpjzfdPcHhRYv5HfMLpI-yGA_Aor6w.n8F9TVewhfglu9AiqoYJMgIhU6w3KqudYpyxbMQbndnI0DhOdoaa_wmdjg&ref=N40sTDNE', '', 0x613a303a7b7d),
(31, 45, 1686344764, 3, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=3f4e2fc86c68bda151.8acKNDPZ1rJq2rpjzfdPcHhRYv5HfMLpI-yGA_Aor6w.n8F9TVewhfglu9AiqoYJMgIhU6w3KqudYpyxbMQbndnI0DhOdoaa_wmdjg&ref=N40sTDNE', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(32, 44, 1686346432, 4, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=95bc1c3158e5.q2nWZXBO90oXtaiqxY4I0NnSMpkkYpN0hXxS7e_Hsxo.xQ-hHBQnpABY1MLrov9OkqOiA8tUNPoAxAxlgtv0gW-SHuQfNRG7B3TynA&ref=sGgwHcoQ', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363334363433323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(33, 44, 1686346432, 4, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=95bc1c3158e5.q2nWZXBO90oXtaiqxY4I0NnSMpkkYpN0hXxS7e_Hsxo.xQ-hHBQnpABY1MLrov9OkqOiA8tUNPoAxAxlgtv0gW-SHuQfNRG7B3TynA&ref=sGgwHcoQ', '', 0x613a303a7b7d),
(34, 44, 1686346432, 4, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=95bc1c3158e5.q2nWZXBO90oXtaiqxY4I0NnSMpkkYpN0hXxS7e_Hsxo.xQ-hHBQnpABY1MLrov9OkqOiA8tUNPoAxAxlgtv0gW-SHuQfNRG7B3TynA&ref=sGgwHcoQ', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(35, 45, 1686346442, 4, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=eada64f38dc300d47cc.UiC31onJWR2MGHTNmBFkjEYMGjtooDlnkVVMBmUnY_E.PEbAr-2gClfDeR6M_2Aizjx8K2kY9lAT0CV7aVEUUYRrV4WszJYVUO9fQA&ref=1rwuotdF', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363334363434323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(36, 45, 1686346442, 4, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=eada64f38dc300d47cc.UiC31onJWR2MGHTNmBFkjEYMGjtooDlnkVVMBmUnY_E.PEbAr-2gClfDeR6M_2Aizjx8K2kY9lAT0CV7aVEUUYRrV4WszJYVUO9fQA&ref=1rwuotdF', '', 0x613a303a7b7d),
(37, 45, 1686346442, 4, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=eada64f38dc300d47cc.UiC31onJWR2MGHTNmBFkjEYMGjtooDlnkVVMBmUnY_E.PEbAr-2gClfDeR6M_2Aizjx8K2kY9lAT0CV7aVEUUYRrV4WszJYVUO9fQA&ref=1rwuotdF', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(38, 45, 1686346748, 5, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?act=edit&do=iso_products&id=45&ref=V_eiHGC3&rt=574b78459d26.687J92CdyDzS5M_AWJAlZFcOhVc7kZEJ8ddbbNYYgYY.hai-jgT0m3adhaWBP-FjJi1-tAVLx_h9sKdsA-Irs_PSufuNJcKEcbGj-w', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363334363734383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(39, 45, 1686346748, 5, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?act=edit&do=iso_products&id=45&ref=V_eiHGC3&rt=574b78459d26.687J92CdyDzS5M_AWJAlZFcOhVc7kZEJ8ddbbNYYgYY.hai-jgT0m3adhaWBP-FjJi1-tAVLx_h9sKdsA-Irs_PSufuNJcKEcbGj-w', '', 0x613a303a7b7d),
(40, 45, 1686346748, 5, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?act=edit&do=iso_products&id=45&ref=V_eiHGC3&rt=574b78459d26.687J92CdyDzS5M_AWJAlZFcOhVc7kZEJ8ddbbNYYgYY.hai-jgT0m3adhaWBP-FjJi1-tAVLx_h9sKdsA-Irs_PSufuNJcKEcbGj-w', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(41, 44, 1686346769, 5, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=991284bdf1e55e5.boO-8bQAAZwxL2uiTSwsdi0ZpgS9xfQ5wIFkzHYHBoY.AOXJiNBpUtZ-TgHjKl1qNFdpl1bNk51NgfFTo0I0NPNX9IyL8V9N0VJoXw&ref=R0vgscVL', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363334363736393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2230223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(42, 44, 1686346769, 5, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=991284bdf1e55e5.boO-8bQAAZwxL2uiTSwsdi0ZpgS9xfQ5wIFkzHYHBoY.AOXJiNBpUtZ-TgHjKl1qNFdpl1bNk51NgfFTo0I0NPNX9IyL8V9N0VJoXw&ref=R0vgscVL', '', 0x613a303a7b7d),
(43, 44, 1686346769, 5, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=991284bdf1e55e5.boO-8bQAAZwxL2uiTSwsdi0ZpgS9xfQ5wIFkzHYHBoY.AOXJiNBpUtZ-TgHjKl1qNFdpl1bNk51NgfFTo0I0NPNX9IyL8V9N0VJoXw&ref=R0vgscVL', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(44, 32, 1686397979, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=e976fed4ac9e2befb.8GNy8-30BYaPBWjRcFGR2kELDFVEqTCj4D-cnEJHZ-k.ozkApKmxQuH-dAOTEzbyni9aITwRxkmWk2f3yzIQA8SkTjWbgph35-lIIQ&ref=n8LauRaf', '', 0x613a33383a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232383938313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(45, 32, 1686398264, 4, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=29b8304f9b0c8e24e281d8643094d51f.P1JrHUpbf6sKGHsMmjlKLNLt3zp3oeivTJjw7HSpG6k.bAgZSg4eOMx7aRBO-V4paLy88lMizpGaP8CbuwT-f4Rrfyx1JTcNymxVMg&ref=Ghi2liOy', '', 0x613a33383a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363232383938313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32343a226572737469636b756e6773676566c3a468726465742e3332223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(46, 32, 1686398455, 5, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=f2.4QFgnNhLEneBrRVbt1G53Eor3i_4mSuevpY6Fcq8x24.slsSy5wOVRDw3H4Z1DbamCR680at9lKrzc5RQrrro0O1LCf0tydgFufgXA&ref=MSDu6iit', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363339383435353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(47, 32, 1686398455, 5, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=f2.4QFgnNhLEneBrRVbt1G53Eor3i_4mSuevpY6Fcq8x24.slsSy5wOVRDw3H4Z1DbamCR680at9lKrzc5RQrrro0O1LCf0tydgFufgXA&ref=MSDu6iit', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(48, 32, 1686398455, 5, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=f2.4QFgnNhLEneBrRVbt1G53Eor3i_4mSuevpY6Fcq8x24.slsSy5wOVRDw3H4Z1DbamCR680at9lKrzc5RQrrro0O1LCf0tydgFufgXA&ref=MSDu6iit', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(49, 44, 1686398475, 6, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=982f3957da94b938124dd07.llLRrH5-72zuAzarTZFB_DU8rE7lGdzWsto7Z9bG6uc.xQij-zo7qAufcl3pLvYiuFttgSewdqXjwYJQMKaRjsrCf5bEERKdDYhOfw&ref=6YzOwASW', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363339383437353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(50, 44, 1686398475, 6, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=982f3957da94b938124dd07.llLRrH5-72zuAzarTZFB_DU8rE7lGdzWsto7Z9bG6uc.xQij-zo7qAufcl3pLvYiuFttgSewdqXjwYJQMKaRjsrCf5bEERKdDYhOfw&ref=6YzOwASW', '', 0x613a303a7b7d),
(51, 44, 1686398475, 6, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=982f3957da94b938124dd07.llLRrH5-72zuAzarTZFB_DU8rE7lGdzWsto7Z9bG6uc.xQij-zo7qAufcl3pLvYiuFttgSewdqXjwYJQMKaRjsrCf5bEERKdDYhOfw&ref=6YzOwASW', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(52, 45, 1686398486, 6, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=979c828b97fc7d47.bxBiHirr0JZW_hU2JIypAwX_5-EmVbWKxwuCGuM4GUM.PEoQSW6ul_Enj350R-vKR2uuyohzOsy_tFPpTZNvfW47PSV2RYei9zCzXA&ref=RZ1dqVY0', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363339383438363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(53, 45, 1686398486, 6, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=979c828b97fc7d47.bxBiHirr0JZW_hU2JIypAwX_5-EmVbWKxwuCGuM4GUM.PEoQSW6ul_Enj350R-vKR2uuyohzOsy_tFPpTZNvfW47PSV2RYei9zCzXA&ref=RZ1dqVY0', '', 0x613a303a7b7d),
(54, 45, 1686398486, 6, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=979c828b97fc7d47.bxBiHirr0JZW_hU2JIypAwX_5-EmVbWKxwuCGuM4GUM.PEoQSW6ul_Enj350R-vKR2uuyohzOsy_tFPpTZNvfW47PSV2RYei9zCzXA&ref=RZ1dqVY0', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(55, 44, 1686398622, 7, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=e4acc7ca792.im9x76tqNUiHaX9pfFzjXMz-3kC8rKOSr0ZcYtJqNH4.2TUDuO8vci_2GBQrHzuAGKKv8ynpw9qn3B43NaI9UFPeQjaHxAZHKeEkNg&ref=OtFyEKdS', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363339383632323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(56, 44, 1686398622, 7, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=e4acc7ca792.im9x76tqNUiHaX9pfFzjXMz-3kC8rKOSr0ZcYtJqNH4.2TUDuO8vci_2GBQrHzuAGKKv8ynpw9qn3B43NaI9UFPeQjaHxAZHKeEkNg&ref=OtFyEKdS', '', 0x613a303a7b7d),
(57, 44, 1686398622, 7, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=e4acc7ca792.im9x76tqNUiHaX9pfFzjXMz-3kC8rKOSr0ZcYtJqNH4.2TUDuO8vci_2GBQrHzuAGKKv8ynpw9qn3B43NaI9UFPeQjaHxAZHKeEkNg&ref=OtFyEKdS', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(58, 45, 1686398629, 7, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=d8119af5f0302c08d958bb7fe.eFA5SG8a2MmLvpEDhvmme7DOcX6s8H_JNVojovAkw_I.KwpLHytfn676z_pB5Z7FP96fXBf5nwb8RgJI9YBzp98sfX4gAHaqqO3z2A&ref=pDgF1TiN', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363339383632393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(59, 45, 1686398629, 7, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=d8119af5f0302c08d958bb7fe.eFA5SG8a2MmLvpEDhvmme7DOcX6s8H_JNVojovAkw_I.KwpLHytfn676z_pB5Z7FP96fXBf5nwb8RgJI9YBzp98sfX4gAHaqqO3z2A&ref=pDgF1TiN', '', 0x613a303a7b7d),
(60, 45, 1686398629, 7, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=d8119af5f0302c08d958bb7fe.eFA5SG8a2MmLvpEDhvmme7DOcX6s8H_JNVojovAkw_I.KwpLHytfn676z_pB5Z7FP96fXBf5nwb8RgJI9YBzp98sfX4gAHaqqO3z2A&ref=pDgF1TiN', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(61, 35, 1686407882, 5, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=14a7fde9ff2280.TYptWFWSlMTmIPnq23SvLyE0ih0xkmPBZOPlCCIGs5A.HtAfDxHX06OXUZKouBPMa09lp3Rk_Rr0F7uOX1JR170ZpyowOv7mpYBtsA&ref=xyL-ZtrL', '', 0x613a34303a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363430373838323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35333b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(62, 35, 1686407882, 5, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=14a7fde9ff2280.TYptWFWSlMTmIPnq23SvLyE0ih0xkmPBZOPlCCIGs5A.HtAfDxHX06OXUZKouBPMa09lp3Rk_Rr0F7uOX1JR170ZpyowOv7mpYBtsA&ref=xyL-ZtrL', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35333b733a333a22706964223b693a33353b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638313636363536343b733a373a22706167655f6964223b693a35383b7d7d),
(63, 35, 1686407882, 5, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=14a7fde9ff2280.TYptWFWSlMTmIPnq23SvLyE0ih0xkmPBZOPlCCIGs5A.HtAfDxHX06OXUZKouBPMa09lp3Rk_Rr0F7uOX1JR170ZpyowOv7mpYBtsA&ref=xyL-ZtrL', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313637393037373037363b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32373b733a333a22706964223b693a32373b733a363a22747374616d70223b693a313638323434313333363b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(64, 32, 1686409243, 6, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=5df4d40a1c3d24219132aef8e785f0.Xdi6YLFLln3x1CCRGt_TjmguGOjhg_sNkVSUEmUOYHE.DoLIN_UO0RqApUvTebiwygZ_NYG07II44gz_RRVZBFwJ9f0I3ifkHJeZaQ&ref=z6W1ZT9u', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363430393234333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(65, 32, 1686409243, 6, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=5df4d40a1c3d24219132aef8e785f0.Xdi6YLFLln3x1CCRGt_TjmguGOjhg_sNkVSUEmUOYHE.DoLIN_UO0RqApUvTebiwygZ_NYG07II44gz_RRVZBFwJ9f0I3ifkHJeZaQ&ref=z6W1ZT9u', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(66, 32, 1686409243, 6, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=5df4d40a1c3d24219132aef8e785f0.Xdi6YLFLln3x1CCRGt_TjmguGOjhg_sNkVSUEmUOYHE.DoLIN_UO0RqApUvTebiwygZ_NYG07II44gz_RRVZBFwJ9f0I3ifkHJeZaQ&ref=z6W1ZT9u', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(67, 44, 1686409256, 8, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b7e3652b99.qS9Yls-IP1Y36NC92IcnaEavcO4wdnFIeAvjbF7HAjY.-nUqwYvNeDFGmbv_u-BELCj-XYdlGQh9C1OIOy6QZhv9Ah_-oORNN1GlmQ&ref=GuFQGyYL', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363430393235363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(68, 44, 1686409256, 8, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b7e3652b99.qS9Yls-IP1Y36NC92IcnaEavcO4wdnFIeAvjbF7HAjY.-nUqwYvNeDFGmbv_u-BELCj-XYdlGQh9C1OIOy6QZhv9Ah_-oORNN1GlmQ&ref=GuFQGyYL', '', 0x613a303a7b7d),
(69, 44, 1686409256, 8, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b7e3652b99.qS9Yls-IP1Y36NC92IcnaEavcO4wdnFIeAvjbF7HAjY.-nUqwYvNeDFGmbv_u-BELCj-XYdlGQh9C1OIOy6QZhv9Ah_-oORNN1GlmQ&ref=GuFQGyYL', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(70, 45, 1686409269, 8, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=38f484690c1bf7a3d027c8e.dqWNHdEIh3GZZX9xq6n5l2wmTLiHV1ADZC6rd8frVK4.Jf__SpVNwBboFBQzyM6a0wJ3YdHSOCk2F3bAILe8MIMiiMp1vmT1EP8oNg&ref=-X1mXZo7', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363430393236393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(71, 45, 1686409269, 8, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=38f484690c1bf7a3d027c8e.dqWNHdEIh3GZZX9xq6n5l2wmTLiHV1ADZC6rd8frVK4.Jf__SpVNwBboFBQzyM6a0wJ3YdHSOCk2F3bAILe8MIMiiMp1vmT1EP8oNg&ref=-X1mXZo7', '', 0x613a303a7b7d),
(72, 45, 1686409269, 8, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=38f484690c1bf7a3d027c8e.dqWNHdEIh3GZZX9xq6n5l2wmTLiHV1ADZC6rd8frVK4.Jf__SpVNwBboFBQzyM6a0wJ3YdHSOCk2F3bAILe8MIMiiMp1vmT1EP8oNg&ref=-X1mXZo7', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(73, 32, 1686483230, 7, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?act=edit&do=iso_products&id=32&ref=qqn2eMav&rt=7e55222bb16c902c41508d3372b3e.3KK4klvLe3rC_o9lFtoD81E84pNYLLXPTtnlIapHEsk.j_jKxR-OPB2zj-Qndb1gtz9tz_oNQ8z6PYGOdtoQduSIj__6NKcJG6Szxg', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363438333233303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(74, 32, 1686483230, 7, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?act=edit&do=iso_products&id=32&ref=qqn2eMav&rt=7e55222bb16c902c41508d3372b3e.3KK4klvLe3rC_o9lFtoD81E84pNYLLXPTtnlIapHEsk.j_jKxR-OPB2zj-Qndb1gtz9tz_oNQ8z6PYGOdtoQduSIj__6NKcJG6Szxg', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(75, 32, 1686483230, 7, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?act=edit&do=iso_products&id=32&ref=qqn2eMav&rt=7e55222bb16c902c41508d3372b3e.3KK4klvLe3rC_o9lFtoD81E84pNYLLXPTtnlIapHEsk.j_jKxR-OPB2zj-Qndb1gtz9tz_oNQ8z6PYGOdtoQduSIj__6NKcJG6Szxg', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(76, 44, 1686483245, 9, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b12549d52ac874b5e789213a.9ykj96RvnPZsq3CAEhPgvU86EZDVMvL9BCuxo_qomXE.pHNRoOAq25Ed2hvCcXSD-SFrPPmAXYvId3Pa9Ir__VyjBGSfywPulwrmOQ&ref=Byx4s3Tn', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363438333234353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(77, 44, 1686483245, 9, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b12549d52ac874b5e789213a.9ykj96RvnPZsq3CAEhPgvU86EZDVMvL9BCuxo_qomXE.pHNRoOAq25Ed2hvCcXSD-SFrPPmAXYvId3Pa9Ir__VyjBGSfywPulwrmOQ&ref=Byx4s3Tn', '', 0x613a303a7b7d),
(78, 44, 1686483245, 9, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b12549d52ac874b5e789213a.9ykj96RvnPZsq3CAEhPgvU86EZDVMvL9BCuxo_qomXE.pHNRoOAq25Ed2hvCcXSD-SFrPPmAXYvId3Pa9Ir__VyjBGSfywPulwrmOQ&ref=Byx4s3Tn', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(79, 45, 1686483251, 9, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=11cae7bbad87.q_1UjRq3pk1BBxNmB_WKw9jC4xPOjOO5kv9PpGvhzlg.-Kcm2l7y4SowdngkZJLph7aTznqb45qM4ack8xu2qnX_0BPlddvULCdKWg&ref=DFvHS0tR', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363438333235313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(80, 45, 1686483251, 9, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=11cae7bbad87.q_1UjRq3pk1BBxNmB_WKw9jC4xPOjOO5kv9PpGvhzlg.-Kcm2l7y4SowdngkZJLph7aTznqb45qM4ack8xu2qnX_0BPlddvULCdKWg&ref=DFvHS0tR', '', 0x613a303a7b7d),
(81, 45, 1686483251, 9, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=11cae7bbad87.q_1UjRq3pk1BBxNmB_WKw9jC4xPOjOO5kv9PpGvhzlg.-Kcm2l7y4SowdngkZJLph7aTznqb45qM4ack8xu2qnX_0BPlddvULCdKWg&ref=DFvHS0tR', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(82, 35, 1686483353, 6, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=2227edad2d877a2525b99.NJ1OrfAmQ316hyzI4feFOnB0mjhspFXaK3OoNGzAKT4.Z8c8-rRjBBoL9keKgpDmfh4lt1E5yyzvWCvDYxyXTRNgsAnFn0oxHBzKZQ&ref=A6meQE1H', '', 0x613a34303a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363438333335333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35333b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(83, 35, 1686483353, 6, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=2227edad2d877a2525b99.NJ1OrfAmQ316hyzI4feFOnB0mjhspFXaK3OoNGzAKT4.Z8c8-rRjBBoL9keKgpDmfh4lt1E5yyzvWCvDYxyXTRNgsAnFn0oxHBzKZQ&ref=A6meQE1H', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35333b733a333a22706964223b693a33353b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638313636363536343b733a373a22706167655f6964223b693a35383b7d7d),
(84, 35, 1686483353, 6, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=2227edad2d877a2525b99.NJ1OrfAmQ316hyzI4feFOnB0mjhspFXaK3OoNGzAKT4.Z8c8-rRjBBoL9keKgpDmfh4lt1E5yyzvWCvDYxyXTRNgsAnFn0oxHBzKZQ&ref=A6meQE1H', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313637393037373037363b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32373b733a333a22706964223b693a32373b733a363a22747374616d70223b693a313638323434313333363b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(85, 44, 1686484734, 10, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=14382.pGYC5-tlNdOgKtmHcA7j5XQhf1KIdyaCsmvllJqZd1U.9zxwsK8gcrTRW7LFE2mAoRpwUjvdGF-3wTOOw-rOE3jwS0WPhAlHssZnkA&ref=oug3V34V', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363438343733343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(86, 44, 1686484734, 10, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=14382.pGYC5-tlNdOgKtmHcA7j5XQhf1KIdyaCsmvllJqZd1U.9zxwsK8gcrTRW7LFE2mAoRpwUjvdGF-3wTOOw-rOE3jwS0WPhAlHssZnkA&ref=oug3V34V', '', 0x613a303a7b7d),
(87, 44, 1686484734, 10, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=14382.pGYC5-tlNdOgKtmHcA7j5XQhf1KIdyaCsmvllJqZd1U.9zxwsK8gcrTRW7LFE2mAoRpwUjvdGF-3wTOOw-rOE3jwS0WPhAlHssZnkA&ref=oug3V34V', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(88, 32, 1686927744, 8, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=3423096077.qRFutJenFe5npbbtNjLCrY8hTTDcr_N0ij8nyTrHqqw.9iEk0PPIRp8Ww_SDaXu46MpKGVif25kg6UlXv2i-m-uQSwDm2pYguzPv9w&ref=9mNu58IG', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363932373734343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(89, 32, 1686927744, 8, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=3423096077.qRFutJenFe5npbbtNjLCrY8hTTDcr_N0ij8nyTrHqqw.9iEk0PPIRp8Ww_SDaXu46MpKGVif25kg6UlXv2i-m-uQSwDm2pYguzPv9w&ref=9mNu58IG', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(90, 32, 1686927744, 8, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=3423096077.qRFutJenFe5npbbtNjLCrY8hTTDcr_N0ij8nyTrHqqw.9iEk0PPIRp8Ww_SDaXu46MpKGVif25kg6UlXv2i-m-uQSwDm2pYguzPv9w&ref=9mNu58IG', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(91, 45, 1686927764, 10, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=954c93fb05f0fb8de3.8SZRDggde8Gy_993YxbyknKomsOnY2hP3vwNLGGV0p4.rhYbamxyKLDDmZ0ZPF-I1zfDzqvkFwIbvYp9WjPs49nIfD9cRSxOlOa1ng&ref=rs2pKEgV', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638363932373736343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(92, 45, 1686927764, 10, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=954c93fb05f0fb8de3.8SZRDggde8Gy_993YxbyknKomsOnY2hP3vwNLGGV0p4.rhYbamxyKLDDmZ0ZPF-I1zfDzqvkFwIbvYp9WjPs49nIfD9cRSxOlOa1ng&ref=rs2pKEgV', '', 0x613a303a7b7d),
(93, 45, 1686927764, 10, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=954c93fb05f0fb8de3.8SZRDggde8Gy_993YxbyknKomsOnY2hP3vwNLGGV0p4.rhYbamxyKLDDmZ0ZPF-I1zfDzqvkFwIbvYp9WjPs49nIfD9cRSxOlOa1ng&ref=rs2pKEgV', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(94, 32, 1687292381, 9, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=1d8b41c06d836be2a3d69cb2b07419.XcvtFkoVT574fAPcNxS9K4KXd6_ruj2jHtXGBMMKDYY.aam6Qhkgd9aQP1uoTjncfOzaD-O8j1_Ic5ijW7A_RsQyh6F3E00p5L4bbA&ref=A9vC4zQY', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638373239323338313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(95, 32, 1687292381, 9, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=1d8b41c06d836be2a3d69cb2b07419.XcvtFkoVT574fAPcNxS9K4KXd6_ruj2jHtXGBMMKDYY.aam6Qhkgd9aQP1uoTjncfOzaD-O8j1_Ic5ijW7A_RsQyh6F3E00p5L4bbA&ref=A9vC4zQY', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(96, 32, 1687292381, 9, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=1d8b41c06d836be2a3d69cb2b07419.XcvtFkoVT574fAPcNxS9K4KXd6_ruj2jHtXGBMMKDYY.aam6Qhkgd9aQP1uoTjncfOzaD-O8j1_Ic5ijW7A_RsQyh6F3E00p5L4bbA&ref=A9vC4zQY', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(97, 44, 1687292402, 11, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=d05143287163783e05d30c178bb709b5._5sAABvbVWAT4zbw-GIM8mgqLVczvaMiTkxOe_7Plpg.y_lXVEjubSh7oG6EgU9tpQZnVRtkiMFJIwErJI363dqQ10xhQoMzGlWEWQ&ref=O1BxyZzA', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638373239323430323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a36313a22613a323a7b693a303b733a31363a22696e76656e746f72795f737461747573223b693a313b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(98, 44, 1687292402, 11, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=d05143287163783e05d30c178bb709b5._5sAABvbVWAT4zbw-GIM8mgqLVczvaMiTkxOe_7Plpg.y_lXVEjubSh7oG6EgU9tpQZnVRtkiMFJIwErJI363dqQ10xhQoMzGlWEWQ&ref=O1BxyZzA', '', 0x613a303a7b7d),
(99, 44, 1687292402, 11, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=d05143287163783e05d30c178bb709b5._5sAABvbVWAT4zbw-GIM8mgqLVczvaMiTkxOe_7Plpg.y_lXVEjubSh7oG6EgU9tpQZnVRtkiMFJIwErJI363dqQ10xhQoMzGlWEWQ&ref=O1BxyZzA', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(100, 45, 1687292411, 11, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=d3a76688a05.ShyiVtAqVJsj56n955U8Uam5CysaTcPS01m3T5VrGPA.fn71AoMfbNNLpPGJnrhdBsf0c2dNeKG5vhTSEOZeU7IlUO43iXIy4WWAxg&ref=OQAdRYQT', '', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638373239323431313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(101, 45, 1687292411, 11, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=d3a76688a05.ShyiVtAqVJsj56n955U8Uam5CysaTcPS01m3T5VrGPA.fn71AoMfbNNLpPGJnrhdBsf0c2dNeKG5vhTSEOZeU7IlUO43iXIy4WWAxg&ref=OQAdRYQT', '', 0x613a303a7b7d),
(102, 45, 1687292411, 11, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=d3a76688a05.ShyiVtAqVJsj56n955U8Uam5CysaTcPS01m3T5VrGPA.fn71AoMfbNNLpPGJnrhdBsf0c2dNeKG5vhTSEOZeU7IlUO43iXIy4WWAxg&ref=OQAdRYQT', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(103, 35, 1688570802, 7, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=5ab6968648aceb9d1be65a081.WGkgEhMuk5T1GqLTzhVvrquODqxqgMFdGeEZGjgxGoE.KlEQJVdd4PG2TP27ikoOysXKa9YN9vRkK6hcLUFzVbIZBWpAYVqi_rYqmg&ref=W6nERTEj', '', 0x613a34303a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537303830323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35333b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(104, 35, 1688570802, 7, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=5ab6968648aceb9d1be65a081.WGkgEhMuk5T1GqLTzhVvrquODqxqgMFdGeEZGjgxGoE.KlEQJVdd4PG2TP27ikoOysXKa9YN9vRkK6hcLUFzVbIZBWpAYVqi_rYqmg&ref=W6nERTEj', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35333b733a333a22706964223b693a33353b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638313636363536343b733a373a22706167655f6964223b693a35383b7d7d),
(105, 35, 1688570802, 7, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&act=edit&id=35&rt=5ab6968648aceb9d1be65a081.WGkgEhMuk5T1GqLTzhVvrquODqxqgMFdGeEZGjgxGoE.KlEQJVdd4PG2TP27ikoOysXKa9YN9vRkK6hcLUFzVbIZBWpAYVqi_rYqmg&ref=W6nERTEj', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313637393037373037363b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32373b733a333a22706964223b693a32373b733a363a22747374616d70223b693a313638323434313333363b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(106, 32, 1688570813, 10, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=7b186ac7f010.q0EcaPig0vr4Q9yw7tXg3Jr79gc5sWqQZLJDz0YSNEc.2XksX7zToZ-7FYPYqoqBuPS_k31ex1-pVvsG-D9Qe3TqLVY6itTjkLtz5A&ref=XCiwF8pW', '', 0x613a34303a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537303831333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a34383b7d733a353a227072696365223b733a343a22302e3030223b7d),
(107, 32, 1688570813, 10, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=7b186ac7f010.q0EcaPig0vr4Q9yw7tXg3Jr79gc5sWqQZLJDz0YSNEc.2XksX7zToZ-7FYPYqoqBuPS_k31ex1-pVvsG-D9Qe3TqLVY6itTjkLtz5A&ref=XCiwF8pW', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a34383b733a333a22706964223b693a33323b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313637393037323630323b733a373a22706167655f6964223b693a33333b7d7d),
(108, 32, 1688570813, 10, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&act=edit&id=32&rt=7b186ac7f010.q0EcaPig0vr4Q9yw7tXg3Jr79gc5sWqQZLJDz0YSNEc.2XksX7zToZ-7FYPYqoqBuPS_k31ex1-pVvsG-D9Qe3TqLVY6itTjkLtz5A&ref=XCiwF8pW', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a32343b733a333a22706964223b693a33323b733a363a22747374616d70223b693a313637393037373037373b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a32343b733a333a22706964223b693a32343b733a363a22747374616d70223b693a313637393136393334373b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(109, 45, 1688570835, 12, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=761bf80e07f786e11.EG6LjGRwD8pI6ZqIvNctFZXPM6lY2gEx3UrhqGcSyhg.Yla7uyADfK8Lv8Xg-IhMcfuLVtM_rDQI7wOknx5QhStRAsHeFgQ-oAvZog&ref=6UeExre6', '1', 0x613a34303a7b733a323a226964223b693a34353b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537303833353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2231223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(110, 45, 1688570835, 12, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=761bf80e07f786e11.EG6LjGRwD8pI6ZqIvNctFZXPM6lY2gEx3UrhqGcSyhg.Yla7uyADfK8Lv8Xg-IhMcfuLVtM_rDQI7wOknx5QhStRAsHeFgQ-oAvZog&ref=6UeExre6', '1', 0x613a303a7b7d),
(111, 45, 1688570835, 12, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&id=45&act=edit&rt=761bf80e07f786e11.EG6LjGRwD8pI6ZqIvNctFZXPM6lY2gEx3UrhqGcSyhg.Yla7uyADfK8Lv8Xg-IhMcfuLVtM_rDQI7wOknx5QhStRAsHeFgQ-oAvZog&ref=6UeExre6', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33353b733a333a22706964223b693a34353b733a363a22747374616d70223b693a313638323434323332313b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33373b733a333a22706964223b693a33353b733a363a22747374616d70223b693a313638323434323332313b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(112, 44, 1688574581, 12, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b520a382c9.ieLWCtbdqy4iKr5WkKkMcmWtXVC93gwfl2r-nBiavF0.pIisX5uS4HsUQ_wd2OZgHDX9PwXS7ENW9AS68Crp6x6_juBBme7gSG4T0Q&ref=YeBi4n83', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537343538313b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(113, 44, 1688574581, 12, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b520a382c9.ieLWCtbdqy4iKr5WkKkMcmWtXVC93gwfl2r-nBiavF0.pIisX5uS4HsUQ_wd2OZgHDX9PwXS7ENW9AS68Crp6x6_juBBme7gSG4T0Q&ref=YeBi4n83', '', 0x613a303a7b7d),
(114, 44, 1688574581, 12, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b520a382c9.ieLWCtbdqy4iKr5WkKkMcmWtXVC93gwfl2r-nBiavF0.pIisX5uS4HsUQ_wd2OZgHDX9PwXS7ENW9AS68Crp6x6_juBBme7gSG4T0Q&ref=YeBi4n83', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(115, 44, 1688574596, 13, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b520a382c9.ieLWCtbdqy4iKr5WkKkMcmWtXVC93gwfl2r-nBiavF0.pIisX5uS4HsUQ_wd2OZgHDX9PwXS7ENW9AS68Crp6x6_juBBme7gSG4T0Q&ref=YeBi4n83', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537343539363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(116, 44, 1688574596, 13, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b520a382c9.ieLWCtbdqy4iKr5WkKkMcmWtXVC93gwfl2r-nBiavF0.pIisX5uS4HsUQ_wd2OZgHDX9PwXS7ENW9AS68Crp6x6_juBBme7gSG4T0Q&ref=YeBi4n83', '', 0x613a303a7b7d),
(117, 44, 1688574596, 13, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=b520a382c9.ieLWCtbdqy4iKr5WkKkMcmWtXVC93gwfl2r-nBiavF0.pIisX5uS4HsUQ_wd2OZgHDX9PwXS7ENW9AS68Crp6x6_juBBme7gSG4T0Q&ref=YeBi4n83', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(118, 7, 1688574697, 1, 'tl_iso_producttype', 0, NULL, 'Skulpturen', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=7&rt=0910fc73f526fc0c827.ckauu10EbcRgdiqCm2zN2NsBhzHvzFo5m4QFYu5tAC4.XyzU7hBLJpFWH2jJ0yOhtotR5WSA_hVw-OpBDtweV21EKpjwEjcmoixPRQ&ref=RtxZShny', '', 0x613a31393a7b733a323a226964223b693a373b733a363a22747374616d70223b693a313638323532373933383b733a343a226e616d65223b733a31303a22536b756c70747572656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932303a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a313a2231223b733a31383a2276617269616e745f61747472696275746573223b733a343232333a22613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a31303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d223b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a313a2231223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(119, 7, 1688576615, 2, 'tl_iso_producttype', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Skulpturen', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=7&rt=d4.4TiWcjzPU7QksEQLC4W0cAmyvU_v25dUoPUOtaVcP8c.zFLsJ3GAGOES2QZAQ8rYHlni3xqA6dgdw5tK2ZcvaITXVKA5c_wY0miJKw&ref=7tNs-6Bq', '1', 0x613a31393a7b733a323a226964223b693a373b733a363a22747374616d70223b693a313638383537363631353b733a343a226e616d65223b733a31303a22536b756c70747572656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932303a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a313a2231223b733a31383a2276617269616e745f61747472696275746573223b733a343232343a22613a32353a7b733a383a2266616c6c6261636b223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a2266616c6c6261636b223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a363a22737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22737461747573223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a333a22796573223b733a383a22706f736974696f6e223b693a31303b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d7d223b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a313a2231223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(120, 44, 1688576655, 14, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=9cf4ee7cece6b24687d3.cySSGnTZ6zHGOoiRcUr-QrzgDPXwmLXCvQIwou5RHfU.Xk7oTzmWoGTwU8raOQWSLOywbqCfqvqL3mx0ztwiSrZFSKRRO-qgV4oD5w&ref=aJrw3WJQ', '', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537363635353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a35303a22613a323a7b693a303b733a31353a227368697070696e675f776569676874223b693a313b733a363a22696d61676573223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(121, 44, 1688576655, 14, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=9cf4ee7cece6b24687d3.cySSGnTZ6zHGOoiRcUr-QrzgDPXwmLXCvQIwou5RHfU.Xk7oTzmWoGTwU8raOQWSLOywbqCfqvqL3mx0ztwiSrZFSKRRO-qgV4oD5w&ref=aJrw3WJQ', '', 0x613a303a7b7d),
(122, 44, 1688576655, 14, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=9cf4ee7cece6b24687d3.cySSGnTZ6zHGOoiRcUr-QrzgDPXwmLXCvQIwou5RHfU.Xk7oTzmWoGTwU8raOQWSLOywbqCfqvqL3mx0ztwiSrZFSKRRO-qgV4oD5w&ref=aJrw3WJQ', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(123, 44, 1688577185, 15, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=0f574bca3f.KYzyH_qgOrOJNEdGtAAMs6S86Cq-6m1hQbY3KYlUGTo.BOaISrfvcea_XQUN_E9g3fTsin_R2CIoIthzRbsnTnkf4MRUtZNx1cUNKA&ref=SQDbqRtz', '1', 0x613a34303a7b733a323a226964223b693a34343b733a333a22706964223b693a33323b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537373138353b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a303b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b733a33333a22613a313a7b693a303b733a31353a227368697070696e675f776569676874223b7d223b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a353a224b6f706965223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226d67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3134303a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31313a22666f722074657374696e67223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a323b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(124, 44, 1688577185, 15, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=0f574bca3f.KYzyH_qgOrOJNEdGtAAMs6S86Cq-6m1hQbY3KYlUGTo.BOaISrfvcea_XQUN_E9g3fTsin_R2CIoIthzRbsnTnkf4MRUtZNx1cUNKA&ref=SQDbqRtz', '1', 0x613a303a7b7d),
(125, 44, 1688577185, 15, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Kopie', 'backend?do=iso_products&id=44&act=edit&rt=0f574bca3f.KYzyH_qgOrOJNEdGtAAMs6S86Cq-6m1hQbY3KYlUGTo.BOaISrfvcea_XQUN_E9g3fTsin_R2CIoIthzRbsnTnkf4MRUtZNx1cUNKA&ref=SQDbqRtz', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a33343b733a333a22706964223b693a34343b733a363a22747374616d70223b693a313638323434323330353b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a33363b733a333a22706964223b693a33343b733a363a22747374616d70223b693a313638323434323330353b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(126, 83, 1688590020, 1, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&childs=1&rt=e07e3943.Z7pZlpF38N60uylT-Ggn-702IiKfJNtmBNSOLBoMyck.StAjw9w4u4uC0msYsCdLle1mQHfwFpQvZ7rKQCh_nopR1m_d3kS7uPiCRg&ref=yadAzzEJ&act=edit&id=83', '', 0x613a34303a7b733a323a226964223b693a38333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539303032303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383538393938383b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a33343a2273706565642d6c696d69742d30302d6b696e6465722d6275656e6f2d73696e676c65223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a363a22533030303230223b733a343a226e616d65223b733a33353a225370656564204c696d697420302c30204b696e646572204275656e6f2053696e676c65223b733a363a22746561736572223b733a3132353a22537472616e6467757420262334303b456c6265262334313b2c207665726c617373656e6520566f67656c6e65747a65722c2046656465722c20416c75666f6c69652c2041636b72796c2c20466f746f2c2053746f666662c3a46e6465722c204c75667462616c6c6f6e732c204d444620506c61747465202f2032303231223b733a31313a226465736372697074696f6e223b733a313536373a223c703e3c7370616e206c616e673d2264652d4445223e49726f6e6973636820756e6420616c732065696e20756e657272656963686261726573205a69656c20736f6c6c74652064657220546974656c206b6c696e67656e2e20476572616465204b696e6465722077657264656e20766f6e2064657220496e64757374726965206d69742050726f64756b74656e206265776f7262656e2c20646965207669656c204dc3bc6c6c20766572757273616368656e20756e64206f62656e647265696e20756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44696520496e64757374726965206272696e67742074c3a4676c696368204d696c6c696f6e656e20766f6e20476567656e7374c3a46e64656e206175662064656e204d61726b742e20416e6765626c69636820756d2064656e2048756e67657220756e736572657220476573656c6c736368616674207a75207374696c6c656e2e204c65747a74656e646c69636820697374206465722048617570746772756e642c2047656c642064616d6974207a7520676577696e6e656e2e2045696e652067726fc39f65204d65687268656974206469657365722044696e67652073696e64206e6963687420756e626564696e6774207a75206765627261756368656e2e2044617a75206b6f6d6d74206e6f63682c20646173732073696520756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4265736f6e64657273204b696e64657220656967656e656e207369636820616c732065696e65206775746520e2809e4b6c69656e74656ce2809c2066c3bc7220646965736520476567656e7374c3a46e64652e2044616265692077697264207669656c20616e2057657262756e6720696e76657374696572742e204869657220696e2064656d205765726b206e75747a6520696368207a776569207665726c617373656e6520566f67656c6e65747a652c206472696e6e656e206a657765696c732065696e65204b617073656c20766f6e204b696e6465722de2809e4275656e6fe2809c20627a772e20c39c6265727261736368756e677365692e202844696573657320576f7274737069656c206973742069726f6e697363682067656d65696e742c2064656e6e206275656e6f20617566205370616e6973636820626564657574657420e2809e677574e2809c2c206f62776f686c207369636820646965204b696e6465722061757320556e77697373656e68656974206e69636874206775742076657268616c74656e2e2920446965204b617073656c6e2073696e6420616d20556665722064657220456c626520676573616d6d656c742c20646965205363686ec3bc726520756e64204c75667462616c6c6f6e73207a656967656e2065696e6520766f6e207669656c656e204dc3b6676c6963686b656974656e2c2077696520546965726520616e2064696573656e20466f6c67656e20766572656e64656e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e5370656564204c696d697420302c30206973742065696e20756e657272656963686261726573205a69656c2c20736f2077696520616b7475656c6c20646965205a69656c6520676567656e2064656e20434f322d41757373746fc39f206b6c696e67656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d65696e2057756e73636820627a772e20547261756d2077c3a472652c2064617373206d616e2065696e205a69656c20766f6e20302c30205665726dc3bc6c6c756e6720696e20646572204e617475722065727265696368742e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4469652046656465726e2073746568656e20616c732053796d626f6c2066c3bc7220646965204d696c6c696f6e656e20766f6e2056c3b667656c6e2c2064696520696872204c6562656e2064757263682064617320756e6163687473616d652056657268616c74656e20646572204d656e736368656e207665726c696572656e2e3c2f7370616e3e3c2f703e0a3c703e3c62723e3c62723e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3138363a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d342e6a7067223b733a333a22616c74223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223530223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35373b7d733a353a227072696365223b733a343a22302e3030223b7d),
(127, 83, 1688590020, 1, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&childs=1&rt=e07e3943.Z7pZlpF38N60uylT-Ggn-702IiKfJNtmBNSOLBoMyck.StAjw9w4u4uC0msYsCdLle1mQHfwFpQvZ7rKQCh_nopR1m_d3kS7uPiCRg&ref=yadAzzEJ&act=edit&id=83', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35373b733a333a22706964223b693a38333b733a373a22736f7274696e67223b693a313032343b733a363a22747374616d70223b693a313638383538393938383b733a373a22706167655f6964223b693a33333b7d7d),
(128, 83, 1688590020, 1, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&childs=1&rt=e07e3943.Z7pZlpF38N60uylT-Ggn-702IiKfJNtmBNSOLBoMyck.StAjw9w4u4uC0msYsCdLle1mQHfwFpQvZ7rKQCh_nopR1m_d3kS7uPiCRg&ref=yadAzzEJ&act=edit&id=83', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34363b733a333a22706964223b693a38333b733a363a22747374616d70223b693a313638383538393938383b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35303b733a333a22706964223b693a34363b733a363a22747374616d70223b693a313638383538393938383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(129, 83, 1688590073, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&ref=jWhgf2h8&state=1&rt=e92678d1ba72e75965.0RVj2IG9rEqIzY4ncBCofzdylbTQybCuofJKCjecu8c._H8Zjczy5x--pMxsOF_EEWci9-G_-__nwpwOZgXv7ITneVWTzo7nLMT04Q&tid=83', '', 0x613a33383a7b733a323a226964223b693a38333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539303032303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383538393938383b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a33343a2273706565642d6c696d69742d30302d6b696e6465722d6275656e6f2d73696e676c65223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a363a22533030303230223b733a343a226e616d65223b733a33353a225370656564204c696d697420302c30204b696e646572204275656e6f2053696e676c65223b733a363a22746561736572223b733a3132353a22537472616e6467757420262334303b456c6265262334313b2c207665726c617373656e6520566f67656c6e65747a65722c2046656465722c20416c75666f6c69652c2041636b72796c2c20466f746f2c2053746f666662c3a46e6465722c204c75667462616c6c6f6e732c204d444620506c61747465202f2032303231223b733a31313a226465736372697074696f6e223b733a313536373a223c703e3c7370616e206c616e673d2264652d4445223e49726f6e6973636820756e6420616c732065696e20756e657272656963686261726573205a69656c20736f6c6c74652064657220546974656c206b6c696e67656e2e20476572616465204b696e6465722077657264656e20766f6e2064657220496e64757374726965206d69742050726f64756b74656e206265776f7262656e2c20646965207669656c204dc3bc6c6c20766572757273616368656e20756e64206f62656e647265696e20756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44696520496e64757374726965206272696e67742074c3a4676c696368204d696c6c696f6e656e20766f6e20476567656e7374c3a46e64656e206175662064656e204d61726b742e20416e6765626c69636820756d2064656e2048756e67657220756e736572657220476573656c6c736368616674207a75207374696c6c656e2e204c65747a74656e646c69636820697374206465722048617570746772756e642c2047656c642064616d6974207a7520676577696e6e656e2e2045696e652067726fc39f65204d65687268656974206469657365722044696e67652073696e64206e6963687420756e626564696e6774207a75206765627261756368656e2e2044617a75206b6f6d6d74206e6f63682c20646173732073696520756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4265736f6e64657273204b696e64657220656967656e656e207369636820616c732065696e65206775746520e2809e4b6c69656e74656ce2809c2066c3bc7220646965736520476567656e7374c3a46e64652e2044616265692077697264207669656c20616e2057657262756e6720696e76657374696572742e204869657220696e2064656d205765726b206e75747a6520696368207a776569207665726c617373656e6520566f67656c6e65747a652c206472696e6e656e206a657765696c732065696e65204b617073656c20766f6e204b696e6465722de2809e4275656e6fe2809c20627a772e20c39c6265727261736368756e677365692e202844696573657320576f7274737069656c206973742069726f6e697363682067656d65696e742c2064656e6e206275656e6f20617566205370616e6973636820626564657574657420e2809e677574e2809c2c206f62776f686c207369636820646965204b696e6465722061757320556e77697373656e68656974206e69636874206775742076657268616c74656e2e2920446965204b617073656c6e2073696e6420616d20556665722064657220456c626520676573616d6d656c742c20646965205363686ec3bc726520756e64204c75667462616c6c6f6e73207a656967656e2065696e6520766f6e207669656c656e204dc3b6676c6963686b656974656e2c2077696520546965726520616e2064696573656e20466f6c67656e20766572656e64656e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e5370656564204c696d697420302c30206973742065696e20756e657272656963686261726573205a69656c2c20736f2077696520616b7475656c6c20646965205a69656c6520676567656e2064656e20434f322d41757373746fc39f206b6c696e67656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d65696e2057756e73636820627a772e20547261756d2077c3a472652c2064617373206d616e2065696e205a69656c20766f6e20302c30205665726dc3bc6c6c756e6720696e20646572204e617475722065727265696368742e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4469652046656465726e2073746568656e20616c732053796d626f6c2066c3bc7220646965204d696c6c696f6e656e20766f6e2056c3b667656c6e2c2064696520696872204c6562656e2064757263682064617320756e6163687473616d652056657268616c74656e20646572204d656e736368656e207665726c696572656e2e3c2f7370616e3e3c2f703e0a3c703e3c62723e3c62723e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3138363a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d342e6a7067223b733a333a22616c74223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223530223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(130, 83, 1688590340, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&act=edit&id=83&rt=3a66196a.Z-FcBHY0mta4KCq1BCqv1Qn50Aoy-K4L5S2E-C6V5XU.SosmUTt70YOOQWj-TGXDu1mpsl9dyuFChkPAlBzmsjZRjWpPOQfRsPQRRQ&ref=XMuQql8O', '', 0x613a34303a7b733a323a226964223b693a38333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539303334303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383538393938383b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a33343a2273706565642d6c696d69742d30302d6b696e6465722d6275656e6f2d73696e676c65223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a363a22533030303230223b733a343a226e616d65223b733a33353a225370656564204c696d697420302c30204b696e646572204275656e6f2053696e676c65223b733a363a22746561736572223b733a3132353a22537472616e6467757420262334303b456c6265262334313b2c207665726c617373656e6520566f67656c6e65747a65722c2046656465722c20416c75666f6c69652c2041636b72796c2c20466f746f2c2053746f666662c3a46e6465722c204c75667462616c6c6f6e732c204d444620506c61747465202f2032303231223b733a31313a226465736372697074696f6e223b733a313536373a223c703e3c7370616e206c616e673d2264652d4445223e49726f6e6973636820756e6420616c732065696e20756e657272656963686261726573205a69656c20736f6c6c74652064657220546974656c206b6c696e67656e2e20476572616465204b696e6465722077657264656e20766f6e2064657220496e64757374726965206d69742050726f64756b74656e206265776f7262656e2c20646965207669656c204dc3bc6c6c20766572757273616368656e20756e64206f62656e647265696e20756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44696520496e64757374726965206272696e67742074c3a4676c696368204d696c6c696f6e656e20766f6e20476567656e7374c3a46e64656e206175662064656e204d61726b742e20416e6765626c69636820756d2064656e2048756e67657220756e736572657220476573656c6c736368616674207a75207374696c6c656e2e204c65747a74656e646c69636820697374206465722048617570746772756e642c2047656c642064616d6974207a7520676577696e6e656e2e2045696e652067726fc39f65204d65687268656974206469657365722044696e67652073696e64206e6963687420756e626564696e6774207a75206765627261756368656e2e2044617a75206b6f6d6d74206e6f63682c20646173732073696520756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4265736f6e64657273204b696e64657220656967656e656e207369636820616c732065696e65206775746520e2809e4b6c69656e74656ce2809c2066c3bc7220646965736520476567656e7374c3a46e64652e2044616265692077697264207669656c20616e2057657262756e6720696e76657374696572742e204869657220696e2064656d205765726b206e75747a6520696368207a776569207665726c617373656e6520566f67656c6e65747a652c206472696e6e656e206a657765696c732065696e65204b617073656c20766f6e204b696e6465722de2809e4275656e6fe2809c20627a772e20c39c6265727261736368756e677365692e202844696573657320576f7274737069656c206973742069726f6e697363682067656d65696e742c2064656e6e206275656e6f20617566205370616e6973636820626564657574657420e2809e677574e2809c2c206f62776f686c207369636820646965204b696e6465722061757320556e77697373656e68656974206e69636874206775742076657268616c74656e2e2920446965204b617073656c6e2073696e6420616d20556665722064657220456c626520676573616d6d656c742c20646965205363686ec3bc726520756e64204c75667462616c6c6f6e73207a656967656e2065696e6520766f6e207669656c656e204dc3b6676c6963686b656974656e2c2077696520546965726520616e2064696573656e20466f6c67656e20766572656e64656e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e5370656564204c696d697420302c30206973742065696e20756e657272656963686261726573205a69656c2c20736f2077696520616b7475656c6c20646965205a69656c6520676567656e2064656e20434f322d41757373746fc39f206b6c696e67656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d65696e2057756e73636820627a772e20547261756d2077c3a472652c2064617373206d616e2065696e205a69656c20766f6e20302c30205665726dc3bc6c6c756e6720696e20646572204e617475722065727265696368742e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4469652046656465726e2073746568656e20616c732053796d626f6c2066c3bc7220646965204d696c6c696f6e656e20766f6e2056c3b667656c6e2c2064696520696872204c6562656e2064757263682064617320756e6163687473616d652056657268616c74656e20646572204d656e736368656e207665726c696572656e2e3c2f7370616e3e3c2f703e0a3c703e3c62723e3c62723e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3138363a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d342e6a7067223b733a333a22616c74223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223530223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35373b7d733a353a227072696365223b733a343a22302e3030223b7d),
(131, 83, 1688590340, 3, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&act=edit&id=83&rt=3a66196a.Z-FcBHY0mta4KCq1BCqv1Qn50Aoy-K4L5S2E-C6V5XU.SosmUTt70YOOQWj-TGXDu1mpsl9dyuFChkPAlBzmsjZRjWpPOQfRsPQRRQ&ref=XMuQql8O', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35373b733a333a22706964223b693a38333b733a373a22736f7274696e67223b693a313032343b733a363a22747374616d70223b693a313638383538393938383b733a373a22706167655f6964223b693a33333b7d7d),
(132, 83, 1688590340, 3, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&act=edit&id=83&rt=3a66196a.Z-FcBHY0mta4KCq1BCqv1Qn50Aoy-K4L5S2E-C6V5XU.SosmUTt70YOOQWj-TGXDu1mpsl9dyuFChkPAlBzmsjZRjWpPOQfRsPQRRQ&ref=XMuQql8O', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34363b733a333a22706964223b693a38333b733a363a22747374616d70223b693a313638383538393938383b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35303b733a333a22706964223b693a34363b733a363a22747374616d70223b693a313638383538393938383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(133, 83, 1688590357, 4, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&act=edit&id=83&rt=92ed033cd7b6a5c4d5b0613ad6.2c4bZvY_jmW9Atp-G5z-RVh6EZvOr2adFVf27LsxntI.9KRhM7twxTCLa5g1U9OSKwgqc86hnSnUdjmygIlCyZHvoi0tuQzFA_E7tQ&ref=stTFu2DJ', '1', 0x613a34303a7b733a323a226964223b693a38333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539303335373b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383538393938383b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a33343a2273706565642d6c696d69742d30302d6b696e6465722d6275656e6f2d73696e676c65223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a363a22533030303230223b733a343a226e616d65223b733a33353a225370656564204c696d697420302c30204b696e646572204275656e6f2053696e676c65223b733a363a22746561736572223b733a3132353a22537472616e6467757420262334303b456c6265262334313b2c207665726c617373656e6520566f67656c6e65747a65722c2046656465722c20416c75666f6c69652c2041636b72796c2c20466f746f2c2053746f666662c3a46e6465722c204c75667462616c6c6f6e732c204d444620506c61747465202f2032303231223b733a31313a226465736372697074696f6e223b733a313536373a223c703e3c7370616e206c616e673d2264652d4445223e49726f6e6973636820756e6420616c732065696e20756e657272656963686261726573205a69656c20736f6c6c74652064657220546974656c206b6c696e67656e2e20476572616465204b696e6465722077657264656e20766f6e2064657220496e64757374726965206d69742050726f64756b74656e206265776f7262656e2c20646965207669656c204dc3bc6c6c20766572757273616368656e20756e64206f62656e647265696e20756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44696520496e64757374726965206272696e67742074c3a4676c696368204d696c6c696f6e656e20766f6e20476567656e7374c3a46e64656e206175662064656e204d61726b742e20416e6765626c69636820756d2064656e2048756e67657220756e736572657220476573656c6c736368616674207a75207374696c6c656e2e204c65747a74656e646c69636820697374206465722048617570746772756e642c2047656c642064616d6974207a7520676577696e6e656e2e2045696e652067726fc39f65204d65687268656974206469657365722044696e67652073696e64206e6963687420756e626564696e6774207a75206765627261756368656e2e2044617a75206b6f6d6d74206e6f63682c20646173732073696520756e676573756e642073696e642e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4265736f6e64657273204b696e64657220656967656e656e207369636820616c732065696e65206775746520e2809e4b6c69656e74656ce2809c2066c3bc7220646965736520476567656e7374c3a46e64652e2044616265692077697264207669656c20616e2057657262756e6720696e76657374696572742e204869657220696e2064656d205765726b206e75747a6520696368207a776569207665726c617373656e6520566f67656c6e65747a652c206472696e6e656e206a657765696c732065696e65204b617073656c20766f6e204b696e6465722de2809e4275656e6fe2809c20627a772e20c39c6265727261736368756e677365692e202844696573657320576f7274737069656c206973742069726f6e697363682067656d65696e742c2064656e6e206275656e6f20617566205370616e6973636820626564657574657420e2809e677574e2809c2c206f62776f686c207369636820646965204b696e6465722061757320556e77697373656e68656974206e69636874206775742076657268616c74656e2e2920446965204b617073656c6e2073696e6420616d20556665722064657220456c626520676573616d6d656c742c20646965205363686ec3bc726520756e64204c75667462616c6c6f6e73207a656967656e2065696e6520766f6e207669656c656e204dc3b6676c6963686b656974656e2c2077696520546965726520616e2064696573656e20466f6c67656e20766572656e64656e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e5370656564204c696d697420302c30206973742065696e20756e657272656963686261726573205a69656c2c20736f2077696520616b7475656c6c20646965205a69656c6520676567656e2064656e20434f322d41757373746fc39f206b6c696e67656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d65696e2057756e73636820627a772e20547261756d2077c3a472652c2064617373206d616e2065696e205a69656c20766f6e20302c30205665726dc3bc6c6c756e6720696e20646572204e617475722065727265696368742e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4469652046656465726e2073746568656e20616c732053796d626f6c2066c3bc7220646965204d696c6c696f6e656e20766f6e2056c3b667656c6e2c2064696520696872204c6562656e2064757263682064617320756e6163687473616d652056657268616c74656e20646572204d656e736368656e207665726c696572656e2e3c2f7370616e3e3c2f703e0a3c703e3c62723e3c62723e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3138363a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d342e6a7067223b733a333a22616c74223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32383a225370656564204c696d697420302c30204b696e646572204275656e6f223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223530223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35373b7d733a353a227072696365223b733a343a22302e3030223b7d),
(134, 83, 1688590357, 4, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&act=edit&id=83&rt=92ed033cd7b6a5c4d5b0613ad6.2c4bZvY_jmW9Atp-G5z-RVh6EZvOr2adFVf27LsxntI.9KRhM7twxTCLa5g1U9OSKwgqc86hnSnUdjmygIlCyZHvoi0tuQzFA_E7tQ&ref=stTFu2DJ', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35373b733a333a22706964223b693a38333b733a373a22736f7274696e67223b693a313032343b733a363a22747374616d70223b693a313638383538393938383b733a373a22706167655f6964223b693a33333b7d7d),
(135, 83, 1688590357, 4, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Speed Limit 0,0 Kinder Bueno Single', 'backend?do=iso_products&act=edit&id=83&rt=92ed033cd7b6a5c4d5b0613ad6.2c4bZvY_jmW9Atp-G5z-RVh6EZvOr2adFVf27LsxntI.9KRhM7twxTCLa5g1U9OSKwgqc86hnSnUdjmygIlCyZHvoi0tuQzFA_E7tQ&ref=stTFu2DJ', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34363b733a333a22706964223b693a38333b733a363a22747374616d70223b693a313638383538393938383b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35303b733a333a22706964223b693a34363b733a363a22747374616d70223b693a313638383538393938383b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(136, 86, 1688590380, 1, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&rt=3eb7cc958b2dd3ea98fdc2088133.W117IkvBQkzDEjMt1aAs48OxAcvpRlbpnURP9OO8j-E.djcBdwaOCRn1e3Fmne9AjZPhY56GdBmg_ioLmNHP2KJtMU1pBPIJKo8rXA&ref=txrX1aad&act=edit&id=86&s2e=1', '', 0x613a33393a7b733a323a226964223b693a38363b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539303338303b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539303337363b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a32363a22613a313a7b733a343a22756e6974223b733a323a226b67223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a303a7b7d7d),
(137, 86, 1688590380, 1, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&rt=3eb7cc958b2dd3ea98fdc2088133.W117IkvBQkzDEjMt1aAs48OxAcvpRlbpnURP9OO8j-E.djcBdwaOCRn1e3Fmne9AjZPhY56GdBmg_ioLmNHP2KJtMU1pBPIJKo8rXA&ref=txrX1aad&act=edit&id=86&s2e=1', '', 0x613a303a7b7d),
(138, 86, 1688590422, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&rt=3eb7cc958b2dd3ea98fdc2088133.W117IkvBQkzDEjMt1aAs48OxAcvpRlbpnURP9OO8j-E.djcBdwaOCRn1e3Fmne9AjZPhY56GdBmg_ioLmNHP2KJtMU1pBPIJKo8rXA&ref=txrX1aad&act=edit&id=86&s2e=1', '', 0x613a33383a7b733a323a226964223b693a38363b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539303432323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539303337363b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32323a2270726f64756b742d6f686e652d76617269616e74656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303139223b733a343a226e616d65223b733a32323a2250726f64756b74206f686e652056617269616e74656e223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(139, 86, 1688590429, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&rt=3eb7cc958b2dd3ea98fdc2088133.W117IkvBQkzDEjMt1aAs48OxAcvpRlbpnURP9OO8j-E.djcBdwaOCRn1e3Fmne9AjZPhY56GdBmg_ioLmNHP2KJtMU1pBPIJKo8rXA&ref=txrX1aad&act=edit&id=86&s2e=1', '', 0x613a34303a7b733a323a226964223b693a38363b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539303432393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539303337363b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32323a2270726f64756b742d6f686e652d76617269616e74656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303139223b733a343a226e616d65223b733a32323a2250726f64756b74206f686e652056617269616e74656e223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35383b7d733a353a227072696365223b733a303a22223b7d),
(140, 86, 1688590429, 3, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&rt=3eb7cc958b2dd3ea98fdc2088133.W117IkvBQkzDEjMt1aAs48OxAcvpRlbpnURP9OO8j-E.djcBdwaOCRn1e3Fmne9AjZPhY56GdBmg_ioLmNHP2KJtMU1pBPIJKo8rXA&ref=txrX1aad&act=edit&id=86&s2e=1', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35383b733a333a22706964223b693a38363b733a373a22736f7274696e67223b693a313032343b733a363a22747374616d70223b693a313638383539303432323b733a373a22706167655f6964223b693a33333b7d7d),
(141, 86, 1688590429, 3, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&rt=3eb7cc958b2dd3ea98fdc2088133.W117IkvBQkzDEjMt1aAs48OxAcvpRlbpnURP9OO8j-E.djcBdwaOCRn1e3Fmne9AjZPhY56GdBmg_ioLmNHP2KJtMU1pBPIJKo8rXA&ref=txrX1aad&act=edit&id=86&s2e=1', '', 0x613a323a7b733a363a22707269636573223b613a303a7b7d733a353a227469657273223b613a303a7b7d7d),
(142, 32, 1688591264, 11, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&state=0&rt=5ac9ee094821b.LFaSKzGxloeR6couHBjCtkHTCgff0XEZLDBCq9CnTcA.ATzofnz-3dKngIhlVFeu2BGDaFKw4z5QT14Gx-LUGoMaOqRgfoLd4d3QpQ&tid=32', '', 0x613a33383a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537303831333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(143, 32, 1688591278, 12, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Erstickungsgefährdet', 'backend?do=iso_products&state=1&rt=5ac9ee094821b.LFaSKzGxloeR6couHBjCtkHTCgff0XEZLDBCq9CnTcA.ATzofnz-3dKngIhlVFeu2BGDaFKw4z5QT14Gx-LUGoMaOqRgfoLd4d3QpQ&tid=32', '1', 0x613a33383a7b733a323a226964223b693a33323b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537303831333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323630323b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32313a226572737469636b756e6773676566c3a46872646574223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303032223b733a343a226e616d65223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a363a22746561736572223b733a36363a22537472616e6467757420262334303b456c6265262334313b2c2041636b72796c2c20486172746c616d696e61742d41726265697473706c61747465202f2032303230223b733a31313a226465736372697074696f6e223b733a3538313a223c703e3c7370616e206c616e673d2264652d4445223e5a7765692045696e77656720416c7574656c6c657220616c73204d61736b652c20c3bc62657220646965204d61736b652065696e204f72616e67656e204e65747a2c20616c6c6573206175662065696e656d205374c3bc636b20486172746c616d696e61742d41726265697473706c617474652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e4d69742064696573657220417262656974206dc3b6636874652069636820646173204c65696420646572204e61747572207665726d697474656c6e20756e64207a776569204672616765207374656c6c656e3a3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e53696e6420616c6c65204d656e736368656e20696e20646572204c6167652c207369636820696e20646173204c656964656e206465722054696572652068696e65696e7a757665727365747a656e3f3c2f7370616e3e3c2f703e0a3c70207374796c653d2270616464696e672d6c6566743a20343070783b223e3c7370616e206c616e673d2264652d4445223e2057656e6e206a612c203c2f7370616e3e3c7370616e206c616e673d2264652d4445223e776172756d206c617373656e20776972206573207a752c20646173732065732070617373696572742c20776172756d2074756e20776972206e696368742067656e7567206461676567656e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3137313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d322e6a7067223b733a333a22616c74223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a32313a224572737469636b756e6773676566c3a46872646574223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223138223b733a363a22686569676874223b733a323a223132223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(144, 86, 1688591281, 4, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&state=0&rt=5ac9ee094821b.LFaSKzGxloeR6couHBjCtkHTCgff0XEZLDBCq9CnTcA.ATzofnz-3dKngIhlVFeu2BGDaFKw4z5QT14Gx-LUGoMaOqRgfoLd4d3QpQ&tid=86', '', 0x613a33383a7b733a323a226964223b693a38363b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539313031333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539303337363b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32323a2270726f64756b742d6f686e652d76617269616e74656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303139223b733a343a226e616d65223b733a32323a2250726f64756b74206f686e652056617269616e74656e223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d),
(145, 86, 1688591298, 5, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&state=1&rt=5ac9ee094821b.LFaSKzGxloeR6couHBjCtkHTCgff0XEZLDBCq9CnTcA.ATzofnz-3dKngIhlVFeu2BGDaFKw4z5QT14Gx-LUGoMaOqRgfoLd4d3QpQ&tid=86', '', 0x613a33383a7b733a323a226964223b693a38363b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539313031333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539303337363b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32323a2270726f64756b742d6f686e652d76617269616e74656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303139223b733a343a226e616d65223b733a32323a2250726f64756b74206f686e652056617269616e74656e223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(146, 86, 1688591358, 6, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&act=edit&id=86&rt=5ac9ee094821b.LFaSKzGxloeR6couHBjCtkHTCgff0XEZLDBCq9CnTcA.ATzofnz-3dKngIhlVFeu2BGDaFKw4z5QT14Gx-LUGoMaOqRgfoLd4d3QpQ&ref=fQREvPuR', '', 0x613a34303a7b733a323a226964223b693a38363b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539313335383b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539303337363b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32323a2270726f64756b742d6f686e652d76617269616e74656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303139223b733a343a226e616d65223b733a32323a2250726f64756b74206f686e652056617269616e74656e223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3132383a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d312e6a7067223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a303a22223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35383b7d733a353a227072696365223b733a303a22223b7d),
(147, 86, 1688591358, 6, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&act=edit&id=86&rt=5ac9ee094821b.LFaSKzGxloeR6couHBjCtkHTCgff0XEZLDBCq9CnTcA.ATzofnz-3dKngIhlVFeu2BGDaFKw4z5QT14Gx-LUGoMaOqRgfoLd4d3QpQ&ref=fQREvPuR', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35383b733a333a22706964223b693a38363b733a373a22736f7274696e67223b693a313032343b733a363a22747374616d70223b693a313638383539303432323b733a373a22706167655f6964223b693a33333b7d7d),
(148, 86, 1688591358, 6, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&act=edit&id=86&rt=5ac9ee094821b.LFaSKzGxloeR6couHBjCtkHTCgff0XEZLDBCq9CnTcA.ATzofnz-3dKngIhlVFeu2BGDaFKw4z5QT14Gx-LUGoMaOqRgfoLd4d3QpQ&ref=fQREvPuR', '', 0x613a323a7b733a363a22707269636573223b613a303a7b7d733a353a227469657273223b613a303a7b7d7d),
(149, 35, 1688591513, 8, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&state=1&rt=7c0a4d8652d6.i3DCpSWphVZ8capxNefiB_uFIvvz5JfJOiNevtxbNfc.phq48GjmzgNKGOg6faiOaavVQK6c1tiAWU0a0u4oYrS9HPTuaprOMDBIxQ&tid=35', '1', 0x613a33383a7b733a323a226964223b693a33353b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383537303830323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037333339333b733a343a2274797065223b693a393b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31363a227363686e656c6c65722d7363686c6175223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224b30303031223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b7d),
(150, 33, 1688591728, 1, 'tl_iso_product', 0, NULL, 'Elbperlen', 'backend?do=iso_products&ref=IxtNPNCs&state=0&rt=db3f6e442a2824fbf9d2918d7cf3d3.3XTn0j9rpOeYVuNi34_IhD2jUKSLgLnBTnbujMK215M.8B6dh3Ik77KuP6Epl8Ck6m3zMvHksvaILRiq4PDFgNDrGNGZcFjvgdRvjA&tid=33', '', 0x613a33383a7b733a323a226964223b693a33333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638333036343931333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323836343b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a393a22656c627065726c656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303033223b733a343a226e616d65223b733a393a22456c627065726c656e223b733a363a22746561736572223b733a34383a22537472616e6467757420262334303b456c6265262334313b2c205261686d656e2c205370696567656c202f2032303231223b733a31313a226465736372697074696f6e223b733a3536303a223c703e3c7370616e206c616e673d2264652d4445223e4d69742065696e6572204cc3a46e676520766f6e20313039342c3236206b6d202831323435206b6d20696e6b6c2e204d6f6c64617529206973742064696520456c626520646572207a77c3b66c66746cc3a46e6773746520466c75737320696e204575726f706120756e6420676568c3b67274207a752064656e20313030206cc3a46e677374656e20466cc3bc7373656e2064657220457264652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965736572206b6c65696e656e20262333343b5065726c656e262333343b206e757220696e2065696e2070616172204d696e7574656e20616d20556665722064657320426c616e6b656e6573657220537472616e647320676573616d6d656c742c2073696e64205a657567652c20776965207669656c206b6c65696e65205465696c6520696d20466c7573732073696368206175662064696520262333343b5265697365262333343b20696e73204d656572206265776567656e2e204963682066696e6465206b65696e6520416e74776f727420617566206d65696e652046726167652c20776f206c616e64656e20627a7720776f686572206b6f6d6d656e20646965736520506c617374696b2050656c6c65747320696d20466c7573733f2057657220737465636b7420646168696e7465723f2c204b616e6e206d616e206574776173206461676567656e2074756e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3134373a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31363a22696d675f323032312d332d322e6a7067223b733a333a22616c74223b733a393a22456c627065726c656e223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a393a22456c627065726c656e223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223235223b733a353a227769647468223b733a323a223235223b733a363a22686569676874223b733a313a2236223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2233223b733a363a22737461747573223b693a303b7d),
(151, 33, 1688591728, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Elbperlen', 'backend?do=iso_products&ref=IxtNPNCs&state=0&rt=db3f6e442a2824fbf9d2918d7cf3d3.3XTn0j9rpOeYVuNi34_IhD2jUKSLgLnBTnbujMK215M.8B6dh3Ik77KuP6Epl8Ck6m3zMvHksvaILRiq4PDFgNDrGNGZcFjvgdRvjA&tid=33', '', 0x613a33383a7b733a323a226964223b693a33333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638333036343931333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323836343b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a393a22656c627065726c656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303033223b733a343a226e616d65223b733a393a22456c627065726c656e223b733a363a22746561736572223b733a34383a22537472616e6467757420262334303b456c6265262334313b2c205261686d656e2c205370696567656c202f2032303231223b733a31313a226465736372697074696f6e223b733a3536303a223c703e3c7370616e206c616e673d2264652d4445223e4d69742065696e6572204cc3a46e676520766f6e20313039342c3236206b6d202831323435206b6d20696e6b6c2e204d6f6c64617529206973742064696520456c626520646572207a77c3b66c66746cc3a46e6773746520466c75737320696e204575726f706120756e6420676568c3b67274207a752064656e20313030206cc3a46e677374656e20466cc3bc7373656e2064657220457264652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965736572206b6c65696e656e20262333343b5065726c656e262333343b206e757220696e2065696e2070616172204d696e7574656e20616d20556665722064657320426c616e6b656e6573657220537472616e647320676573616d6d656c742c2073696e64205a657567652c20776965207669656c206b6c65696e65205465696c6520696d20466c7573732073696368206175662064696520262333343b5265697365262333343b20696e73204d656572206265776567656e2e204963682066696e6465206b65696e6520416e74776f727420617566206d65696e652046726167652c20776f206c616e64656e20627a7720776f686572206b6f6d6d656e20646965736520506c617374696b2050656c6c65747320696d20466c7573733f2057657220737465636b7420646168696e7465723f2c204b616e6e206d616e206574776173206461676567656e2074756e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3134373a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31363a22696d675f323032312d332d322e6a7067223b733a333a22616c74223b733a393a22456c627065726c656e223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a393a22456c627065726c656e223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223235223b733a353a227769647468223b733a323a223235223b733a363a22686569676874223b733a313a2236223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2233223b733a363a22737461747573223b693a303b7d),
(152, 33, 1688591739, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Elbperlen', 'backend?do=iso_products&ref=IxtNPNCs&state=1&rt=db3f6e442a2824fbf9d2918d7cf3d3.3XTn0j9rpOeYVuNi34_IhD2jUKSLgLnBTnbujMK215M.8B6dh3Ik77KuP6Epl8Ck6m3zMvHksvaILRiq4PDFgNDrGNGZcFjvgdRvjA&tid=33', '1', 0x613a33383a7b733a323a226964223b693a33333b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638333036343931333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313637393037323836343b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a393a22656c627065726c656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303033223b733a343a226e616d65223b733a393a22456c627065726c656e223b733a363a22746561736572223b733a34383a22537472616e6467757420262334303b456c6265262334313b2c205261686d656e2c205370696567656c202f2032303231223b733a31313a226465736372697074696f6e223b733a3536303a223c703e3c7370616e206c616e673d2264652d4445223e4d69742065696e6572204cc3a46e676520766f6e20313039342c3236206b6d202831323435206b6d20696e6b6c2e204d6f6c64617529206973742064696520456c626520646572207a77c3b66c66746cc3a46e6773746520466c75737320696e204575726f706120756e6420676568c3b67274207a752064656e20313030206cc3a46e677374656e20466cc3bc7373656e2064657220457264652e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965736572206b6c65696e656e20262333343b5065726c656e262333343b206e757220696e2065696e2070616172204d696e7574656e20616d20556665722064657320426c616e6b656e6573657220537472616e647320676573616d6d656c742c2073696e64205a657567652c20776965207669656c206b6c65696e65205465696c6520696d20466c7573732073696368206175662064696520262333343b5265697365262333343b20696e73204d656572206265776567656e2e204963682066696e6465206b65696e6520416e74776f727420617566206d65696e652046726167652c20776f206c616e64656e20627a7720776f686572206b6f6d6d656e20646965736520506c617374696b2050656c6c65747320696d20466c7573733f2057657220737465636b7420646168696e7465723f2c204b616e6e206d616e206574776173206461676567656e2074756e3f3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3134373a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31363a22696d675f323032312d332d322e6a7067223b733a333a22616c74223b733a393a22456c627065726c656e223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a393a22456c627065726c656e223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223235223b733a353a227769647468223b733a323a223235223b733a363a22686569676874223b733a313a2236223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2233223b733a363a22737461747573223b693a303b7d),
(153, 86, 1688591773, 7, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&act=edit&id=86&rt=db3f6e442a2824fbf9d2918d7cf3d3.3XTn0j9rpOeYVuNi34_IhD2jUKSLgLnBTnbujMK215M.8B6dh3Ik77KuP6Epl8Ck6m3zMvHksvaILRiq4PDFgNDrGNGZcFjvgdRvjA&ref=iG-SUXif', '1', 0x613a34303a7b733a323a226964223b693a38363b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539313737333b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539303337363b733a343a2274797065223b693a373b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223333223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a32323a2270726f64756b742d6f686e652d76617269616e74656e223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a225330303139223b733a343a226e616d65223b733a32323a2250726f64756b74206f686e652056617269616e74656e223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b733a31313a223c703e746573743c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3132383a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d312e6a7067223b733a333a22616c74223b733a303a22223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a303a22223b733a393a227472616e736c617465223b733a343a226e6f6e65223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a313a2231223b733a353a227769647468223b733a313a2233223b733a363a22686569676874223b733a313a2232223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35383b7d733a353a227072696365223b733a303a22223b7d),
(154, 86, 1688591773, 7, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&act=edit&id=86&rt=db3f6e442a2824fbf9d2918d7cf3d3.3XTn0j9rpOeYVuNi34_IhD2jUKSLgLnBTnbujMK215M.8B6dh3Ik77KuP6Epl8Ck6m3zMvHksvaILRiq4PDFgNDrGNGZcFjvgdRvjA&ref=iG-SUXif', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35383b733a333a22706964223b693a38363b733a373a22736f7274696e67223b693a313032343b733a363a22747374616d70223b693a313638383539303432323b733a373a22706167655f6964223b693a33333b7d7d),
(155, 86, 1688591773, 7, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Produkt ohne Varianten', 'backend?do=iso_products&act=edit&id=86&rt=db3f6e442a2824fbf9d2918d7cf3d3.3XTn0j9rpOeYVuNi34_IhD2jUKSLgLnBTnbujMK215M.8B6dh3Ik77KuP6Epl8Ck6m3zMvHksvaILRiq4PDFgNDrGNGZcFjvgdRvjA&ref=iG-SUXif', '1', 0x613a323a7b733a363a22707269636573223b613a303a7b7d733a353a227469657273223b613a303a7b7d7d),
(156, 87, 1688591832, 1, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&rt=a42b8fb.plJ6oyjltFR2yfvfrmtVWFYAjS4wY3Ma4VrEok1VZ7A.izgA9mWq_wFAoLmU5iQ5NgZQ73tfUTxTgjSAzn8mMPOQPkzoZ9b_MjrwlA&ref=CqlhT8iU&act=edit&id=87', '1', 0x613a34303a7b733a323a226964223b693a38373b733a333a22706964223b693a38363b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539313833323b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539313831343b733a343a2274797065223b693a303b733a31303a226f726465725061676573223b4e3b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a303a22223b733a363a22746561736572223b4e3b733a31313a226465736372697074696f6e223b4e3b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a303a22223b733a353a227769647468223b733a303a22223b733a363a22686569676874223b733a303a22223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a313b733a353a227061676573223b613a303a7b7d733a353a227072696365223b733a35343a22302e30302028556d7361747a7374657565726672656920776567656e204b6c65696e756e7465726e65686d6572726567656c756e6729223b7d),
(157, 87, 1688591832, 1, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&rt=a42b8fb.plJ6oyjltFR2yfvfrmtVWFYAjS4wY3Ma4VrEok1VZ7A.izgA9mWq_wFAoLmU5iQ5NgZQ73tfUTxTgjSAzn8mMPOQPkzoZ9b_MjrwlA&ref=CqlhT8iU&act=edit&id=87', '1', 0x613a303a7b7d),
(158, 87, 1688591832, 1, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', '', 'backend?do=iso_products&rt=a42b8fb.plJ6oyjltFR2yfvfrmtVWFYAjS4wY3Ma4VrEok1VZ7A.izgA9mWq_wFAoLmU5iQ5NgZQ73tfUTxTgjSAzn8mMPOQPkzoZ9b_MjrwlA&ref=CqlhT8iU&act=edit&id=87', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a34393b733a333a22706964223b693a38373b733a363a22747374616d70223b693a313638383539313833323b733a393a227461785f636c617373223b693a333b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a343a22302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35343b733a333a22706964223b693a34393b733a363a22747374616d70223b693a313638383539313833323b733a333a226d696e223b693a313b733a353a227072696365223b733a343a22302e3030223b7d7d7d),
(159, 29, 1688591909, 1, 'tl_module', 0, NULL, 'Shop - Produktliste - aktive Kategorie - alle', 'backend?do=themes&id=29&table=tl_module&act=edit&rt=98bd83652.qDU0wMZL4cRZli_viplb2-TOM-oGspY8b-VG3juQlJM.hV9OlYsEqpFv_22kwtY3tbSeUb9pgNl1DIsCsgnjw9CeWQKLiXiqohWvQA&ref=HCerunjV', '1', 0x613a3138363a7b733a323a226964223b693a32393b733a333a22706964223b693a313b733a363a22747374616d70223b693a313638323434303736393b733a343a226e616d65223b733a34353a2253686f70202d2050726f64756b746c69737465202d20616b74697665204b617465676f726965202d20616c6c65223b733a383a22686561646c696e65223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226832223b733a353a2276616c7565223b733a303a22223b7d223b733a343a2274797065223b733a31353a2269736f5f70726f647563746c697374223b733a31313a226c6576656c4f6666736574223b693a303b733a393a2273686f774c6576656c223b693a303b733a393a22686172644c696d6974223b733a303a22223b733a31333a2273686f7750726f746563746564223b733a303a22223b733a31303a22646566696e65526f6f74223b733a303a22223b733a383a22726f6f7450616765223b693a303b733a31333a226e617669676174696f6e54706c223b733a303a22223b733a393a22637573746f6d54706c223b733a303a22223b733a353a227061676573223b4e3b733a31303a2273686f7748696464656e223b733a303a22223b733a31313a22637573746f6d4c6162656c223b733a303a22223b733a393a226175746f6c6f67696e223b733a303a22223b733a363a226a756d70546f223b693a303b733a31323a226f7665727669657750616765223b693a303b733a31323a2272656469726563744261636b223b733a303a22223b733a383a226564697461626c65223b4e3b733a393a226d656d62657254706c223b733a303a22223b733a343a22666f726d223b693a303b733a393a22717565727954797065223b733a333a22616e64223b733a353a2266757a7a79223b733a303a22223b733a31333a22636f6e746578744c656e677468223b733a303a22223b733a31363a226d696e4b6579776f72644c656e677468223b693a343b733a373a2270657250616765223b693a303b733a31303a2273656172636854797065223b733a363a2273696d706c65223b733a393a2273656172636854706c223b733a303a22223b733a383a22696e436f6c756d6e223b733a343a226d61696e223b733a393a22736b69704669727374223b693a303b733a393a226c6f61644669727374223b733a303a22223b733a393a2273696e676c65535243223b4e3b733a333a2275726c223b4e3b733a373a22696d6753697a65223b733a303a22223b733a31303a2275736543617074696f6e223b733a303a22223b733a383a2266756c6c73697a65223b733a303a22223b733a383a226d756c7469535243223b4e3b733a383a226f72646572535243223b4e3b733a343a2268746d6c223b4e3b733a393a227273735f6361636865223b693a333630303b733a383a227273735f66656564223b4e3b733a31323a227273735f74656d706c617465223b733a303a22223b733a31333a226e756d6265724f664974656d73223b693a303b733a31343a2264697361626c6543617074636861223b733a303a22223b733a31303a227265675f67726f757073223b4e3b733a31343a227265675f616c6c6f774c6f67696e223b733a303a22223b733a31323a227265675f736b69704e616d65223b733a303a22223b733a393a227265675f636c6f7365223b733a303a22223b733a31333a227265675f64656c657465446972223b733a303a22223b733a31333a227265675f61737369676e446972223b733a303a22223b733a31313a227265675f686f6d65446972223b4e3b733a31323a227265675f6163746976617465223b733a303a22223b733a31303a227265675f6a756d70546f223b693a303b733a383a227265675f74657874223b4e3b733a31323a227265675f70617373776f7264223b4e3b733a343a2264617461223b4e3b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a353a226373734944223b733a34303a22613a323a7b693a303b733a31313a2270726f647563746c697374223b693a313b733a303a22223b7d223b733a32343a22726f6f7450616765446570656e64656e744d6f64756c6573223b4e3b733a31343a226661715f63617465676f72696573223b4e3b733a31363a226661715f7265616465724d6f64756c65223b693a303b733a393a22636f6d5f6f72646572223b733a393a22617363656e64696e67223b733a31323a22636f6d5f6d6f646572617465223b733a303a22223b733a31303a22636f6d5f6262636f6465223b733a303a22223b733a31363a22636f6d5f726571756972654c6f67696e223b733a303a22223b733a31383a22636f6d5f64697361626c6543617074636861223b733a303a22223b733a31323a22636f6d5f74656d706c617465223b733a303a22223b733a31333a226e6577735f6172636869766573223b4e3b733a31333a226e6577735f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31383a226e6577735f6a756d70546f43757272656e74223b733a303a22223b733a31373a226e6577735f7265616465724d6f64756c65223b693a303b733a31353a226e6577735f6d6574614669656c6473223b733a33383a22613a323a7b693a303b733a343a2264617465223b693a313b733a363a22617574686f72223b7d223b733a31333a226e6577735f74656d706c617465223b733a303a22223b733a31313a226e6577735f666f726d6174223b733a31303a226e6577735f6d6f6e7468223b733a31333a226e6577735f7374617274446179223b693a303b733a31303a226e6577735f6f72646572223b733a31353a226f726465725f646174655f64657363223b733a31373a226e6577735f73686f775175616e74697479223b733a303a22223b733a31303a226c6973745f7461626c65223b733a303a22223b733a31313a226c6973745f6669656c6473223b4e3b733a31303a226c6973745f7768657265223b4e3b733a31313a226c6973745f736561726368223b4e3b733a393a226c6973745f736f7274223b4e3b733a393a226c6973745f696e666f223b4e3b733a31353a226c6973745f696e666f5f7768657265223b4e3b733a31313a226c6973745f6c61796f7574223b733a303a22223b733a31363a226c6973745f696e666f5f6c61796f7574223b733a303a22223b733a31323a2263616c5f63616c656e646172223b4e3b733a31303a2263616c5f6e6f5370616e223b733a303a22223b733a31353a2263616c5f6869646552756e6e696e67223b733a303a22223b733a31323a2263616c5f7374617274446179223b693a313b733a31303a2263616c5f666f726d6174223b733a393a2263616c5f6d6f6e7468223b733a31373a2263616c5f69676e6f726544796e616d6963223b733a303a22223b733a393a2263616c5f6f72646572223b733a393a22617363656e64696e67223b733a31363a2263616c5f7265616465724d6f64756c65223b693a303b733a393a2263616c5f6c696d6974223b693a303b733a31323a2263616c5f74656d706c617465223b733a303a22223b733a31333a2263616c5f6374656d706c617465223b733a303a22223b733a31363a2263616c5f73686f775175616e74697479223b733a303a22223b733a31323a2263616c5f6665617475726564223b733a393a22616c6c5f6974656d73223b733a31313a226e6577736c657474657273223b4e3b733a31313a226e6c5f6368616e6e656c73223b4e3b733a373a226e6c5f74657874223b4e3b733a31353a226e6c5f686964654368616e6e656c73223b733a303a22223b733a31323a226e6c5f737562736372696265223b4e3b733a31343a226e6c5f756e737562736372696265223b4e3b733a31313a226e6c5f74656d706c617465223b733a303a22223b733a31343a2269736f5f747370726f6475637473223b733a303a22223b733a31343a2269736f5f7473636865636b6f7574223b733a303a22223b733a31333a2269736f5f7473796f6666736574223b693a303b733a31353a2269736f5f7473646972656374696f6e223b733a303a22223b733a31333a2269736f5f7473646973706c6179223b733a383a227374616e64617264223b733a31333a2269736f5f747372657669657773223b733a313a2231223b733a383a2269736f5f74736964223b733a303a22223b733a31373a2269736f5f6e6f74696669636174696f6e73223b733a303a22223b733a31363a2269736f5f70726f647563746361636865223b4e3b733a31373a2269736f5f616464726573734669656c6473223b4e3b733a31313a2269736f5f61646472657373223b4e3b733a32303a2269736f5f636f6e74696e756553686f7070696e67223b733a303a22223b733a31393a2269736f5f696e636c7564654d65737361676573223b733a313a2231223b733a32323a2269736f5f72656c617465645f63617465676f72696573223b4e3b733a31313a2269736f5f627574746f6e73223b4e3b733a32343a2269736f5f6c697374696e67536f7274446972656374696f6e223b733a343a2244455343223b733a32303a2269736f5f6c697374696e67536f72744669656c64223b733a393a22646174654164646564223b733a31393a2269736f5f636865636b6f75745f6a756d70546f223b693a303b733a31353a2269736f5f636172745f6a756d70546f223b693a303b733a31313a2269736f5f70657250616765223b733a31303a22382c31322c33322c3634223b733a31353a2269736f5f656e61626c654c696d6974223b733a303a22223b733a31373a2269736f5f736f7274696e674669656c6473223b4e3b733a32323a2269736f5f7365617263684175746f636f6d706c657465223b733a303a22223b733a31353a2269736f5f7365617263684578616374223b4e3b733a31363a2269736f5f7365617263684669656c6473223b4e3b733a32303a2269736f5f66696c7465724869646553696e676c65223b733a303a22223b733a31333a2269736f5f6e657746696c746572223b733a383a2273686f775f616c6c223b733a31353a2269736f5f72616e67654669656c6473223b4e3b733a32303a2269736f5f63756d756c61746976654669656c6473223b4e3b733a31363a2269736f5f66696c7465724669656c6473223b4e3b733a31373a2269736f5f66696c7465724d6f64756c6573223b733a34353a22613a333a7b693a303b733a323a223332223b693a313b733a323a223334223b693a323b733a323a223430223b7d223b733a31343a2269736f5f6c6973745f7768657265223b733a303a22223b733a31383a2269736f5f63617465676f72795f73636f7065223b733a31363a2263757272656e745f63617465676f7279223b733a31323a2269736f5f6e6f46696c746572223b733a303a22223b733a31353a2269736f5f656d70747946696c746572223b733a303a22223b733a31343a2269736f5f6e6f50726f6475637473223b733a303a22223b733a31363a2269736f5f656d7074794d657373616765223b733a303a22223b733a32313a2269736f5f6f72646572436f6c6c656374696f6e4279223b733a363a226173635f6964223b733a32303a2269736f5f616464546f41646472657373626f6f6b223b733a303a22223b733a32303a2269736f5f6f726465725f636f6e646974696f6e73223b4e3b733a32323a2269736f5f636865636b6f75745f736b69707061626c65223b4e3b733a31383a2269736f5f666f72776172645f726576696577223b733a303a22223b733a31393a226f72646572436f6d706c6574654a756d70546f223b693a303b733a32303a2269736f5f7368697070696e675f6d6f64756c6573223b4e3b733a31393a2269736f5f7061796d656e745f6d6f64756c6573223b4e3b733a31343a2269736f5f636f6e6669675f696473223b4e3b733a31333a2269736f5f636f6e6669675f6964223b693a303b733a383a2269736f5f636f6c73223b693a303b733a31383a2269736f5f776973686c6973744a756d70546f223b693a303b733a32303a2269736f5f61646450726f647563744a756d70546f223b693a383b733a31373a2269736f5f6c6f67696e5265717569726564223b733a303a22223b733a31363a2269736f5f6c6f67696e5f6a756d70546f223b693a303b733a31393a2269736f5f636865636b6f75745f6d6574686f64223b733a363a226d656d626572223b733a31383a2269736f5f646973706c617934303450616765223b733a303a22223b733a31363a2269736f5f7573655f7175616e74697479223b733a303a22223b733a31393a2269736f5f64697361626c655f6f7074696f6e73223b733a303a22223b733a31333a2269736f5f686964655f6c697374223b733a313a2231223b733a31363a2269736f5f6c696e6b5f7072696d617279223b733a303a22223b733a31343a2269736f5f6a756d705f6669727374223b733a303a22223b733a31333a2269736f5f66696c74657254706c223b733a31383a2269736f5f66696c7465725f64656661756c74223b733a31373a2269736f5f636f6c6c656374696f6e54706c223b733a32323a2269736f5f636f6c6c656374696f6e5f64656661756c74223b733a31313a2269736f5f67616c6c657279223b693a303b733a31373a2269736f5f7265616465725f6c61796f7574223b733a303a22223b733a31353a2269736f5f6c6973745f6c61796f7574223b733a31363a2269736f5f6c6973745f64656661756c74223b733a32363a226e635f61637469766174696f6e5f6e6f74696669636174696f6e223b693a303b733a31353a226e635f6e6f74696669636174696f6e223b693a303b733a31383a22637573746f6d4c616e677561676554657874223b4e3b733a31343a22637573746f6d4c616e6775616765223b733a303a22223b733a31343a22686964654e6f46616c6c6261636b223b733a303a22223b733a31383a22686964654163746976654c616e6775616765223b733a303a22223b733a31373a227265675f61637469766174654c6f67696e223b733a303a22223b733a31363a227265675f6175746f4163746976617465223b733a373a2264697361626c65223b733a32313a227368617265627574746f6e735f74656d706c617465223b733a303a22223b733a31383a227368617265627574746f6e735f7468656d65223b733a303a22223b733a32313a227368617265627574746f6e735f6e6574776f726b73223b4e3b7d),
(160, 9, 1688593228, 1, 'tl_iso_producttype', 0, NULL, 'Kollagen', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=9&rt=06bb8943.J_KEAkqvSSJN3HyFijn6_tTTXgZE-yCOQl-WMm1j5pI.Cpj-VwfgAnd7tT7OwnaWkISDPFMryW_HITHSXl8QsdERnrJJBZwCRAHlEw&ref=jIRZXNGD', '1', 0x613a31393a7b733a323a226964223b693a393b733a363a22747374616d70223b693a313638323433323832303b733a343a226e616d65223b733a383a224b6f6c6c6167656e223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b4e3b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932313a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a303a22223b733a31383a2276617269616e745f61747472696275746573223b4e3b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a303a22223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d);
INSERT INTO `tl_version` (`id`, `pid`, `tstamp`, `version`, `fromTable`, `userid`, `username`, `description`, `editUrl`, `active`, `data`) VALUES
(161, 88, 1688593286, 1, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&childs=1&rt=139adee2e9ceb.LIEUItjh2v4xX00dCEgAq6MPkeOs83ZbpV9Ba08lly0.Aetud5WukasHNg9WQAdsxfNf87bDwTkSxjEFB31WwG4a7SJpl9KRmH1mIg&ref=k1cmtb0G&act=edit&id=88', '', 0x613a34303a7b733a323a226964223b693a38383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539333238363b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539333238333b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223538223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a303a22223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a303a22223b733a343a226e616d65223b733a31363a225363686e656c6c6572207363686c6175223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a303a22223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2233223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a35393b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(162, 88, 1688593286, 1, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&childs=1&rt=139adee2e9ceb.LIEUItjh2v4xX00dCEgAq6MPkeOs83ZbpV9Ba08lly0.Aetud5WukasHNg9WQAdsxfNf87bDwTkSxjEFB31WwG4a7SJpl9KRmH1mIg&ref=k1cmtb0G&act=edit&id=88', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a35393b733a333a22706964223b693a38383b733a373a22736f7274696e67223b693a3235363b733a363a22747374616d70223b693a313638383539333238333b733a373a22706167655f6964223b693a35383b7d7d),
(163, 88, 1688593286, 1, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Schneller schlau', 'backend?do=iso_products&childs=1&rt=139adee2e9ceb.LIEUItjh2v4xX00dCEgAq6MPkeOs83ZbpV9Ba08lly0.Aetud5WukasHNg9WQAdsxfNf87bDwTkSxjEFB31WwG4a7SJpl9KRmH1mIg&ref=k1cmtb0G&act=edit&id=88', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35303b733a333a22706964223b693a38383b733a363a22747374616d70223b693a313638383539333238333b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35353b733a333a22706964223b693a35303b733a363a22747374616d70223b693a313638383539333238333b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(164, 88, 1688593324, 2, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bild unlimited', 'backend?do=iso_products&childs=1&rt=139adee2e9ceb.LIEUItjh2v4xX00dCEgAq6MPkeOs83ZbpV9Ba08lly0.Aetud5WukasHNg9WQAdsxfNf87bDwTkSxjEFB31WwG4a7SJpl9KRmH1mIg&ref=k1cmtb0G&act=edit&id=88', '', 0x613a34303a7b733a323a226964223b693a38383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539333332343b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539333238333b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31343a2262696c642d756e6c696d69746564223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303031223b733a343a226e616d65223b733a31343a2242696c6420756e6c696d69746564223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a313a2232223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36303b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(165, 88, 1688593324, 2, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bild unlimited', 'backend?do=iso_products&childs=1&rt=139adee2e9ceb.LIEUItjh2v4xX00dCEgAq6MPkeOs83ZbpV9Ba08lly0.Aetud5WukasHNg9WQAdsxfNf87bDwTkSxjEFB31WwG4a7SJpl9KRmH1mIg&ref=k1cmtb0G&act=edit&id=88', '', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36303b733a333a22706964223b693a38383b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638383539333332343b733a373a22706167655f6964223b693a33323b7d7d),
(166, 88, 1688593324, 2, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bild unlimited', 'backend?do=iso_products&childs=1&rt=139adee2e9ceb.LIEUItjh2v4xX00dCEgAq6MPkeOs83ZbpV9Ba08lly0.Aetud5WukasHNg9WQAdsxfNf87bDwTkSxjEFB31WwG4a7SJpl9KRmH1mIg&ref=k1cmtb0G&act=edit&id=88', '', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35303b733a333a22706964223b693a38383b733a363a22747374616d70223b693a313638383539333238333b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35353b733a333a22706964223b693a35303b733a363a22747374616d70223b693a313638383539333238333b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d),
(167, 6, 1688593332, 1, 'tl_iso_producttype', 0, NULL, 'Bilder', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=6&rt=7bb71.BEuD7-Xj_m3p0NIniGyqxq7I9g_2D8gydUvOmIGftjs.KSH5uqistTjfuZBswCPGqP6YlFqZPYd7FiWK9LPs4XgyJ7WkqtC1C6XpvQ&ref=QVY8r5ll', '', 0x613a31393a7b733a323a226964223b693a363b733a363a22747374616d70223b693a313638323630343236313b733a343a226e616d65223b733a363a2242696c646572223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b733a33343a224469657365722050726f64756b747479702067696c742066c3bc722042696c646572223b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932303a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a313a2231223b733a31383a2276617269616e745f61747472696275746573223b4e3b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a303a22223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(168, 6, 1688593349, 2, 'tl_iso_producttype', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bilder', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=6&rt=7bb71.BEuD7-Xj_m3p0NIniGyqxq7I9g_2D8gydUvOmIGftjs.KSH5uqistTjfuZBswCPGqP6YlFqZPYd7FiWK9LPs4XgyJ7WkqtC1C6XpvQ&ref=QVY8r5ll', '', 0x613a31393a7b733a323a226964223b693a363b733a363a22747374616d70223b693a313638383539333334393b733a343a226e616d65223b733a363a2242696c646572223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b733a33343a224469657365722050726f64756b747479702067696c742066c3bc722042696c646572223b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932303a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a303a22223b733a31383a2276617269616e745f61747472696275746573223b4e3b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a303a22223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(169, 6, 1688593353, 3, 'tl_iso_producttype', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bilder', 'backend?do=iso_setup&mod=producttypes&table=tl_iso_producttype&act=edit&id=6&rt=7bb71.BEuD7-Xj_m3p0NIniGyqxq7I9g_2D8gydUvOmIGftjs.KSH5uqistTjfuZBswCPGqP6YlFqZPYd7FiWK9LPs4XgyJ7WkqtC1C6XpvQ&ref=QVY8r5ll', '1', 0x613a31393a7b733a323a226964223b693a363b733a363a22747374616d70223b693a313638383539333335333b733a343a226e616d65223b733a363a2242696c646572223b733a353a22636c617373223b733a383a227374616e64617264223b733a383a2266616c6c6261636b223b733a303a22223b733a31313a226465736372697074696f6e223b733a33343a224469657365722050726f64756b747479702067696c742066c3bc722042696c646572223b733a363a22707269636573223b733a303a22223b733a31363a2273686f775f70726963655f7469657273223b733a313a2231223b733a31333a226c6973745f74656d706c617465223b733a31363a2269736f5f6c6973745f64656661756c74223b733a31353a227265616465725f74656d706c617465223b733a31393a2269736f5f7265616465725f656e68616e636564223b733a31323a226c6973745f67616c6c657279223b693a313b733a31343a227265616465725f67616c6c657279223b693a323b733a383a22637373436c617373223b733a303a22223b733a31303a2261747472696275746573223b733a343932313a22613a32393a7b733a343a2274797065223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2274797065223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a303b7d733a353a227061676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227061676573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a313b7d733a353a22616c696173223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a22616c696173223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a323b7d733a333a22736b75223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a333a22736b75223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a333b7d733a343a226e616d65223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a226e616d65223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a343b7d733a363a22746561736572223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22746561736572223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a353b7d733a31313a226465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31313a226465736372697074696f6e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a363b7d733a31363a22696e76656e746f72795f737461747573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31363a22696e76656e746f72795f737461747573223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a373b7d733a383a227175616e74697479223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a383a227175616e74697479223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a383b7d733a363a22696d61676573223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22696d61676573223b733a363a226c6567656e64223b733a31323a226d656469615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a393b7d733a393a227075626c6973686564223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a393a227075626c6973686564223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31303b7d733a353a227374617274223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227374617274223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31313b7d733a343a2273746f70223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a343a2273746f70223b733a363a226c6567656e64223b733a31343a227075626c6973685f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31323b7d733a363a226c656e677468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a226c656e677468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31333b7d733a353a227769647468223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227769647468223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31343b7d733a363a22686569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a363a22686569676874223b733a363a226c6567656e64223b733a31343a226f7074696f6e735f6c6567656e64223b733a383a22746c5f636c617373223b733a333a22773530223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31353b7d733a353a227072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a353a227072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31363b7d733a31353a227368697070696e675f776569676874223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f776569676874223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31373b7d733a31353a227368697070696e675f6578656d7074223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f6578656d7074223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31383b7d733a31353a227368697070696e675f7069636b7570223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31353a227368697070696e675f7069636b7570223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a31393b7d733a31343a227368697070696e675f7072696365223b613a363a7b733a373a22656e61626c6564223b733a313a2231223b733a343a226e616d65223b733a31343a227368697070696e675f7072696365223b733a363a226c6567656e64223b733a31353a227368697070696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32303b7d733a343a226774696e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a343a226774696e223b733a363a226c6567656e64223b733a31343a2267656e6572616c5f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32313b7d733a393a22626173657072696365223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a22626173657072696365223b733a363a226c6567656e64223b733a31343a2270726963696e675f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32323b7d733a353a226373734944223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a353a226373734944223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32333b7d733a393a2270726f746563746564223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a393a2270726f746563746564223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32343b7d733a363a22677565737473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a363a22677565737473223b733a363a226c6567656e64223b733a31333a226578706572745f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32353b7d733a31303a226d6574615f7469746c65223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31303a226d6574615f7469746c65223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32363b7d733a31363a226d6574615f6465736372697074696f6e223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31363a226d6574615f6465736372697074696f6e223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32373b7d733a31333a226d6574615f6b6579776f726473223b613a363a7b733a373a22656e61626c6564223b733a303a22223b733a343a226e616d65223b733a31333a226d6574615f6b6579776f726473223b733a363a226c6567656e64223b733a31313a226d6574615f6c6567656e64223b733a383a22746c5f636c617373223b733a303a22223b733a393a226d616e6461746f7279223b733a303a22223b733a383a22706f736974696f6e223b693a32383b7d7d223b733a383a2276617269616e7473223b733a303a22223b733a31383a2276617269616e745f61747472696275746573223b4e3b733a32313a22666f7263655f76617269616e745f6f7074696f6e73223b733a303a22223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a393a22646f776e6c6f616473223b733a303a22223b7d),
(170, 88, 1688593369, 3, 'tl_iso_product', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bild unlimited', 'backend?do=iso_products&act=edit&id=88&rt=5157a50fc3ca.y3c6QIt1xytPVJXc-MnOLhJQoms9VPomcrmQzyqvstY.5h1AFcY6jH55PdeXsIaiQEIAwD5SZrVvEdfUoxjc5ZX9GwwLxEaMTQNt-g&ref=z-7dLnTh', '1', 0x613a34303a7b733a323a226964223b693a38383b733a333a22706964223b693a303b733a333a22676964223b693a303b733a363a22747374616d70223b693a313638383539333336393b733a383a226c616e6775616765223b733a303a22223b733a393a22646174654164646564223b693a313638383539333238333b733a343a2274797065223b693a363b733a31303a226f726465725061676573223b733a31393a22613a313a7b693a303b733a323a223332223b7d223b733a373a22696e6865726974223b4e3b733a383a2266616c6c6261636b223b733a303a22223b733a353a22616c696173223b733a31343a2262696c642d756e6c696d69746564223b733a343a226774696e223b733a303a22223b733a333a22736b75223b733a353a224230303031223b733a343a226e616d65223b733a31343a2242696c6420756e6c696d69746564223b733a363a22746561736572223b733a343a2232303231223b733a31313a226465736372697074696f6e223b733a3535323a223c703e3c7370616e206c616e673d2264652d4445223e45696e657220766f6e207669656c652042657269636874656e2061757320766572736368696564656e656e205a656974756e67656e2069737420646173205468656d6120506c617374696b2d5665726dc3bc6c6c756e6720696e206465722067616e7a656e2057656c742e2044696573652042657269636874652077657264656e206f66742069676e6f72696572742c2064656e6e207669656c6520686162656e206b65696e20496e746572657373652c2073696368206d69742064656d205468656d61207a7520626566617373656e2c20756e6420626c656962656e206c6965626572206e6963687420262333343b7363686c6175262333343b2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e44657368616c62206861626520696368206d697220646965204dc3bc6865206765676562656e2c2065696e2070616172205a65696c656e207a75206d61726b696572656e2c20756e6420736965206d697420526f7420616d2052616e64207769656465722068696e7a7573636872656962656e2e3c2f7370616e3e3c2f703e0a3c703e3c7370616e206c616e673d2264652d4445223e446965204b6f6c6c61676520626573746568742061757320466f746f7320766f6e206d697220756e64206175732064656d20496e7465726e65742e2053696520737072656368656e2066c3bc7220736963682e3c2f7370616e3e3c2f703e223b733a31303a226d6574615f7469746c65223b733a303a22223b733a31363a226d6574615f6465736372697074696f6e223b4e3b733a31333a226d6574615f6b6579776f726473223b4e3b733a393a22626173657072696365223b733a303a22223b733a31353a227368697070696e675f776569676874223b733a34353a22613a323a7b733a343a22756e6974223b733a323a226b67223b733a353a2276616c7565223b733a303a22223b7d223b733a31353a227368697070696e675f6578656d7074223b733a303a22223b733a31353a227368697070696e675f7069636b7570223b733a303a22223b733a31343a227368697070696e675f7072696365223b733a343a22302e3030223b733a363a22696d61676573223b733a3136313a22613a313a7b693a303b613a353a7b733a333a22737263223b733a31343a22696d675f323032312d352e6a7067223b733a333a22616c74223b733a31363a225363686e656c6c6572207363686c6175223b733a343a226c696e6b223b733a303a22223b733a343a2264657363223b733a31363a225363686e656c6c6572207363686c6175223b733a393a227472616e736c617465223b733a333a22616c6c223b7d7d223b733a393a2270726f746563746564223b733a303a22223b733a363a2267726f757073223b4e3b733a363a22677565737473223b733a303a22223b733a393a227075626c6973686564223b733a313a2231223b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a353a226373734944223b733a303a22223b733a363a226c656e677468223b733a323a223530223b733a353a227769647468223b733a323a223630223b733a363a22686569676874223b733a333a22302c32223b733a31363a22696e76656e746f72795f737461747573223b733a313a2232223b733a383a227175616e74697479223b733a303a22223b733a363a22737461747573223b693a303b733a353a227061676573223b613a313a7b693a303b693a36303b7d733a353a227072696365223b733a363a223130302e3030223b7d),
(171, 88, 1688593369, 3, 'tl_iso_product_category', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bild unlimited', 'backend?do=iso_products&act=edit&id=88&rt=5157a50fc3ca.y3c6QIt1xytPVJXc-MnOLhJQoms9VPomcrmQzyqvstY.5h1AFcY6jH55PdeXsIaiQEIAwD5SZrVvEdfUoxjc5ZX9GwwLxEaMTQNt-g&ref=z-7dLnTh', '1', 0x613a313a7b693a303b613a353a7b733a323a226964223b693a36303b733a333a22706964223b693a38383b733a373a22736f7274696e67223b693a3132383b733a363a22747374616d70223b693a313638383539333332343b733a373a22706167655f6964223b693a33323b7d7d),
(172, 88, 1688593369, 3, 'tl_iso_product_price', 3, 'ernst.jendritzki@nachhaltig-im-web.de', 'Bild unlimited', 'backend?do=iso_products&act=edit&id=88&rt=5157a50fc3ca.y3c6QIt1xytPVJXc-MnOLhJQoms9VPomcrmQzyqvstY.5h1AFcY6jH55PdeXsIaiQEIAwD5SZrVvEdfUoxjc5ZX9GwwLxEaMTQNt-g&ref=z-7dLnTh', '1', 0x613a323a7b733a363a22707269636573223b613a313a7b693a303b613a31303a7b733a323a226964223b693a35303b733a333a22706964223b693a38383b733a363a22747374616d70223b693a313638383539333238333b733a393a227461785f636c617373223b693a303b733a393a22636f6e6669675f6964223b693a303b733a31323a226d656d6265725f67726f7570223b693a303b733a353a227374617274223b733a303a22223b733a343a2273746f70223b733a303a22223b733a393a22746965725f6b657973223b733a313a2231223b733a31313a22746965725f76616c756573223b733a363a223130302e3030223b7d7d733a353a227469657273223b613a313a7b693a303b613a353a7b733a323a226964223b693a35353b733a333a22706964223b693a35303b733a363a22747374616d70223b693a313638383539333238333b733a333a226d696e223b693a313b733a353a227072696365223b733a363a223130302e3030223b7d7d7d);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_download`
--
ALTER TABLE `tl_iso_product_collection_download`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_iso_product_collection_item`
--
ALTER TABLE `tl_iso_product_collection_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3106;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
