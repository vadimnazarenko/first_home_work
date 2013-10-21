/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : vadim

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2013-10-21 18:03:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `o5fpu_assets`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_assets`;
CREATE TABLE `o5fpu_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_assets
-- ----------------------------
INSERT INTO `o5fpu_assets` VALUES ('1', '0', '1', '93', '0', 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('2', '1', '1', '2', '1', 'com_admin', 'com_admin', '{}');
INSERT INTO `o5fpu_assets` VALUES ('3', '1', '3', '6', '1', 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('4', '1', '7', '8', '1', 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('5', '1', '9', '10', '1', 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('6', '1', '11', '12', '1', 'com_config', 'com_config', '{}');
INSERT INTO `o5fpu_assets` VALUES ('7', '1', '13', '16', '1', 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('8', '1', '17', '44', '1', 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('9', '1', '45', '46', '1', 'com_cpanel', 'com_cpanel', '{}');
INSERT INTO `o5fpu_assets` VALUES ('10', '1', '47', '48', '1', 'com_installer', 'com_installer', '{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}');
INSERT INTO `o5fpu_assets` VALUES ('11', '1', '49', '50', '1', 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('12', '1', '51', '52', '1', 'com_login', 'com_login', '{}');
INSERT INTO `o5fpu_assets` VALUES ('13', '1', '53', '54', '1', 'com_mailto', 'com_mailto', '{}');
INSERT INTO `o5fpu_assets` VALUES ('14', '1', '55', '56', '1', 'com_massmail', 'com_massmail', '{}');
INSERT INTO `o5fpu_assets` VALUES ('15', '1', '57', '58', '1', 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('16', '1', '59', '60', '1', 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('17', '1', '61', '62', '1', 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('18', '1', '63', '64', '1', 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('19', '1', '65', '68', '1', 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('20', '1', '69', '70', '1', 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('21', '1', '71', '72', '1', 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1},\"core.manage\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('22', '1', '73', '74', '1', 'com_search', 'com_search', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('23', '1', '75', '76', '1', 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('24', '1', '77', '80', '1', 'com_users', 'com_users', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('25', '1', '81', '84', '1', 'com_weblinks', 'com_weblinks', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('26', '1', '85', '86', '1', 'com_wrapper', 'com_wrapper', '{}');
INSERT INTO `o5fpu_assets` VALUES ('27', '8', '18', '19', '2', 'com_content.category.2', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('28', '3', '4', '5', '2', 'com_banners.category.3', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('29', '7', '14', '15', '2', 'com_contact.category.4', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('30', '19', '66', '67', '2', 'com_newsfeeds.category.5', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('31', '25', '82', '83', '2', 'com_weblinks.category.6', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('32', '24', '78', '79', '1', 'com_users.category.7', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('33', '1', '87', '88', '1', 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('34', '1', '89', '90', '1', 'com_joomlaupdate', 'com_joomlaupdate', '{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}');
INSERT INTO `o5fpu_assets` VALUES ('35', '8', '20', '27', '2', 'com_content.category.8', 'Картинки', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('36', '8', '28', '35', '2', 'com_content.category.9', 'Текст', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('37', '8', '36', '43', '2', 'com_content.category.10', 'Фотографии', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('38', '35', '21', '22', '3', 'com_content.article.1', 'Youtube', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('39', '35', '23', '24', '3', 'com_content.article.2', 'Гифка)', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('40', '35', '25', '26', '3', 'com_content.article.3', 'Государственный долг США', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('41', '36', '29', '30', '3', 'com_content.article.4', 'Первая девушка на луне', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('42', '36', '31', '32', '3', 'com_content.article.5', 'Хорошо мотивирует', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('43', '36', '33', '34', '3', 'com_content.article.6', 'Олег', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('44', '37', '37', '38', '3', 'com_content.article.7', 'Фото №1', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('45', '37', '39', '40', '3', 'com_content.article.8', 'Фото №2', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('46', '37', '41', '42', '3', 'com_content.article.9', 'Фото №3', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');
INSERT INTO `o5fpu_assets` VALUES ('47', '1', '91', '92', '1', 'com_donate', 'donate', '{}');

-- ----------------------------
-- Table structure for `o5fpu_associations`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_associations`;
CREATE TABLE `o5fpu_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_associations
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_banners`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_banners`;
CREATE TABLE `o5fpu_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_banners
-- ----------------------------
INSERT INTO `o5fpu_banners` VALUES ('1', '0', '0', 'Banner', 'banner', '0', '3', '1', 'http://www.vk.com/', '1', '3', '', '', '0', '1', '', '{\"imageurl\":\"images\\/banners\\/cc183e7897605a9269874b27a5db6e5b.jpg\",\"width\":1000,\"height\":200,\"alt\":\"alt\"}', '0', '', '-1', '0', '0', '600', '2013-10-21 14:39:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-10-21 14:31:50', '*');

-- ----------------------------
-- Table structure for `o5fpu_banner_clients`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_banner_clients`;
CREATE TABLE `o5fpu_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_banner_clients
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_banner_tracks`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_banner_tracks`;
CREATE TABLE `o5fpu_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_banner_tracks
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_categories`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_categories`;
CREATE TABLE `o5fpu_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_categories
-- ----------------------------
INSERT INTO `o5fpu_categories` VALUES ('1', '0', '0', '0', '19', '0', '', 'system', 'ROOT', 'root', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{}', '', '', '', '0', '2009-10-18 16:07:09', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('2', '27', '1', '1', '2', '1', 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:26:37', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('3', '28', '1', '3', '4', '1', 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:27:35', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('4', '29', '1', '5', '6', '1', 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:27:57', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('5', '30', '1', '7', '8', '1', 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:28:15', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('6', '31', '1', '9', '10', '1', 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:28:33', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('7', '32', '1', '11', '12', '1', 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', '42', '2010-06-28 13:28:33', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('8', '35', '1', '13', '14', '1', '2013-10-21-13-24-24', 'com_content', 'Картинки', '2013-10-21-13-24-24', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '600', '2013-10-21 13:24:24', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('9', '36', '1', '15', '16', '1', '2013-10-21-13-24-43', 'com_content', 'Текст', '2013-10-21-13-24-43', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '600', '2013-10-21 13:24:43', '0', '0000-00-00 00:00:00', '0', '*');
INSERT INTO `o5fpu_categories` VALUES ('10', '37', '1', '17', '18', '1', '2013-10-21-13-25-09', 'com_content', 'Фотографии', '2013-10-21-13-25-09', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '600', '2013-10-21 13:25:09', '600', '2013-10-21 13:25:18', '0', '*');

-- ----------------------------
-- Table structure for `o5fpu_contact_details`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_contact_details`;
CREATE TABLE `o5fpu_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_contact_details
-- ----------------------------
INSERT INTO `o5fpu_contact_details` VALUES ('1', 'Contact me', 'contact-me', '', '', '', '', '', '', '', '', '<p>mail: vadiknazarenko@gmail.com</p>', '', null, '', '0', '1', '0', '0000-00-00 00:00:00', '0', '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":false,\"linkb_name\":\"\",\"linkb\":false,\"linkc_name\":\"\",\"linkc\":false,\"linkd_name\":\"\",\"linkd\":false,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', '0', '4', '1', '', '', '', '', '', '*', '2013-10-21 14:19:49', '600', '', '2013-10-21 14:21:14', '600', '', '', '{\"robots\":\"\",\"rights\":\"\"}', '1', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `o5fpu_content`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_content`;
CREATE TABLE `o5fpu_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_content
-- ----------------------------
INSERT INTO `o5fpu_content` VALUES ('1', '38', 'Youtube', 'youtube', '', '<p><img src=\"http://s.pikabu.ru/post_img/2013/10/21/4/1382331553_562021089.png\" border=\"0\" width=\"684\" height=\"840\" /></p>', '', '1', '0', '0', '8', '2013-10-21 13:27:54', '600', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-21 13:27:54', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '2', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('2', '39', 'Гифка)', '2013-10-21-13-29-13', '', '<p><img src=\"http://s.pikabu.ru/post_img/2013/10/21/0/1382301907_861827108.gif\" border=\"0\" width=\"207\" height=\"207\" /></p>', '', '1', '0', '0', '8', '2013-10-21 13:29:13', '600', '', '2013-10-21 13:42:08', '600', '600', '2013-10-21 13:42:08', '2013-10-21 13:29:13', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '2', '0', '1', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('3', '40', 'Государственный долг США', '2013-10-21-13-30-32', '', '<p>Вот как бы она выглядела наличными</p>\r\n', '\r\n<p> </p>\r\n<p><img src=\"http://s.pikabu.ru/post_img/2013/10/21/6/1382344452_310505260.jpg\" border=\"0\" width=\"700\" height=\"1185\" /></p>', '1', '0', '0', '8', '2013-10-21 13:30:32', '600', '', '2013-10-21 13:45:32', '600', '0', '0000-00-00 00:00:00', '2013-10-21 13:30:32', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '2', '0', '0', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('4', '41', 'Первая девушка на луне', '2013-10-21-13-33-37', '', '<p><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">- Хьюстон, у нас проблемы!</span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">- В чем дело?</span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">- Знаете... Не важно.</span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">- Что произошло?</span></p>\r\n<p><span style=\"background-color: #fbfbfb; color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\">- Ничего.</span></p>\r\n<p><span style=\"background-color: #fbfbfb; color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\">- Говорите уже!</span></p>\r\n<p><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">- НЕТ!</span></p>', '', '1', '0', '0', '9', '2013-10-21 13:33:37', '600', '', '2013-10-21 13:33:54', '600', '0', '0000-00-00 00:00:00', '2013-10-21 13:33:37', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '2', '0', '2', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('5', '42', 'Хорошо мотивирует', '2013-10-21-13-34-34', '', '<p><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">-Ты к экзаменам-то готовишься? </span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">-Неа - не начинал еще.</span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">-Почему ответ не по уставу???</span></p>', '', '1', '0', '0', '9', '2013-10-21 13:34:34', '600', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-21 13:34:34', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '1', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('6', '43', 'Олег', '2013-10-21-13-35-57', '', '<p><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">Есть у нас в компании чувак-меломан по имени Олег. Постоянно таскает с собой какой-то дорогущий плеер с кучей песен. В плеере удивительно неплохие спикеры.</span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">Человек он довольно угрюмый, молчаливый, танцевать не особо любит, бухать тоже. Но с ним всегда весело. Дело в том, что он способен очень в тему включить музыку. То жена чья-то жена на вечеринку явится и начинает гонять одного из наших вокруг стола. Со стороны Олега начинает звучать музыка из Бэнни Хилла. На драку сразу включается музыка из Мортал Комбата. И т.п.</span></p>\r\n', '\r\n<p><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">Но недавно он вообще все границы перешел. Починили мы лодку на даче. Наложили заплату на пробоину и решили ее испытать. Набилось нас 7 человек в лодку. Олег на берегу сидеть остался, говорит, говно ваша заплатка, не по госту вы ее сделали. Мы рукой на него махнули и поплыли.</span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">Картина маслом. Озеро, вечер, туман. Угрюмый Олег сидит на лавочке на берегу под березой. Мимо проплываем мы. Тут нашу заплатку срывает нахер и лодка начинает стремительно тонуть. У нас, разумеется мат, крики, воду начинаем вычерпывать. А тут внезапно с берега Селин Дион: “Near, Far, wherever you are, I believe that the heart does go on.” Блять, никто ржать остановиться не может, руки не слушаются.</span><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><br style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px;\" /><span style=\"color: #2e2e2e; font-family: Tahoma, Arial, sans-serif; font-size: 13px; line-height: 18px; background-color: #fbfbfb;\">В итоге пошла лодка ко дну. Голову на отсечение даю, дотянули бы до берега если бы не песня.</span></p>', '1', '0', '0', '9', '2013-10-21 13:35:57', '600', '', '2013-10-21 13:37:22', '600', '0', '0000-00-00 00:00:00', '2013-10-21 13:35:57', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '2', '0', '0', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('7', '44', 'Фото №1', '1', '', '<p><img src=\"http://www.segodnya.ua/img/article/3994/20_main.jpg\" border=\"0\" width=\"380\" height=\"250\" /></p>', '', '1', '0', '0', '10', '2013-10-21 13:47:18', '600', '', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '2013-10-21 13:47:18', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '1', '0', '2', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('8', '45', 'Фото №2', '2', '', '<p><img src=\"http://www.epwr.ru/quotauthor/532/20.jpg\" border=\"0\" width=\"170\" height=\"167\" /></p>', '', '1', '0', '0', '10', '2013-10-21 13:48:27', '600', '', '2013-10-21 13:50:55', '600', '0', '0000-00-00 00:00:00', '2013-10-21 13:48:27', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '2', '0', '1', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');
INSERT INTO `o5fpu_content` VALUES ('9', '46', 'Фото №3', '3', '', '<p><img src=\"http://mirfactov.com/wp-content/uploads/1270.jpg\" border=\"0\" width=\"210\" height=\"148\" /></p>', '', '1', '0', '0', '10', '2013-10-21 13:49:05', '600', '', '2013-10-21 13:50:18', '600', '0', '0000-00-00 00:00:00', '2013-10-21 13:49:05', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', '2', '0', '0', '', '', '1', '0', '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '1', '*', '');

-- ----------------------------
-- Table structure for `o5fpu_content_frontpage`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_content_frontpage`;
CREATE TABLE `o5fpu_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_content_frontpage
-- ----------------------------
INSERT INTO `o5fpu_content_frontpage` VALUES ('1', '4');
INSERT INTO `o5fpu_content_frontpage` VALUES ('2', '8');
INSERT INTO `o5fpu_content_frontpage` VALUES ('3', '6');
INSERT INTO `o5fpu_content_frontpage` VALUES ('4', '5');
INSERT INTO `o5fpu_content_frontpage` VALUES ('5', '9');
INSERT INTO `o5fpu_content_frontpage` VALUES ('6', '7');
INSERT INTO `o5fpu_content_frontpage` VALUES ('7', '3');
INSERT INTO `o5fpu_content_frontpage` VALUES ('8', '2');
INSERT INTO `o5fpu_content_frontpage` VALUES ('9', '1');

-- ----------------------------
-- Table structure for `o5fpu_content_rating`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_content_rating`;
CREATE TABLE `o5fpu_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_content_rating
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_core_log_searches`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_core_log_searches`;
CREATE TABLE `o5fpu_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_core_log_searches
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_extensions`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_extensions`;
CREATE TABLE `o5fpu_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=803 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_extensions
-- ----------------------------
INSERT INTO `o5fpu_extensions` VALUES ('1', 'com_mailto', 'component', 'com_mailto', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('2', 'com_wrapper', 'component', 'com_wrapper', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('3', 'com_admin', 'component', 'com_admin', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('4', 'com_banners', 'component', 'com_banners', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('5', 'com_cache', 'component', 'com_cache', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('6', 'com_categories', 'component', 'com_categories', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('7', 'com_checkin', 'component', 'com_checkin', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('8', 'com_contact', 'component', 'com_contact', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_contact_category\":\"hide\",\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('9', 'com_cpanel', 'component', 'com_cpanel', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('10', 'com_installer', 'component', 'com_installer', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('11', 'com_languages', 'component', 'com_languages', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('12', 'com_login', 'component', 'com_login', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('13', 'com_media', 'component', 'com_media', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('14', 'com_menus', 'component', 'com_menus', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('15', 'com_messages', 'component', 'com_messages', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('16', 'com_modules', 'component', 'com_modules', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('17', 'com_newsfeeds', 'component', 'com_newsfeeds', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\",\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"display_num\":\"\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"show_cat_items\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('18', 'com_plugins', 'component', 'com_plugins', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('19', 'com_search', 'component', 'com_search', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}', '{\"enabled\":\"0\",\"show_date\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('20', 'com_templates', 'component', 'com_templates', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('21', 'com_weblinks', 'component', 'com_weblinks', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_comp_description\":\"1\",\"comp_description\":\"\",\"show_link_hits\":\"1\",\"show_link_description\":\"1\",\"show_other_cats\":\"0\",\"show_headings\":\"0\",\"show_numbers\":\"0\",\"show_report\":\"1\",\"count_clicks\":\"1\",\"target\":\"0\",\"link_icons\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('22', 'com_content', 'component', 'com_content', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"urls_position\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_heading_title_text\":\"1\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('23', 'com_config', 'component', 'com_config', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"12\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('24', 'com_redirect', 'component', 'com_redirect', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('25', 'com_users', 'component', 'com_users', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"guest_usergroup\":\"1\",\"sendpassword\":\"1\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('27', 'com_finder', 'component', 'com_finder', '', '1', '1', '0', '0', '{\"legacy\":false,\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('28', 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', '1', '1', '0', '1', '{\"legacy\":false,\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('100', 'PHPMailer', 'library', 'phpmailer', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"PHPMailer\",\"type\":\"library\",\"creationDate\":\"2001\",\"author\":\"PHPMailer\",\"copyright\":\"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.\",\"authorEmail\":\"jimjag@gmail.com\",\"authorUrl\":\"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/\",\"version\":\"5.2\",\"description\":\"LIB_PHPMAILER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('101', 'SimplePie', 'library', 'simplepie', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('102', 'phputf8', 'library', 'phputf8', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('103', 'Joomla! Platform', 'library', 'joomla', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"11.4\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('200', 'mod_articles_archive', 'module', 'mod_articles_archive', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('201', 'mod_articles_latest', 'module', 'mod_articles_latest', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('202', 'mod_articles_popular', 'module', 'mod_articles_popular', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('203', 'mod_banners', 'module', 'mod_banners', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('204', 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('205', 'mod_custom', 'module', 'mod_custom', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('206', 'mod_feed', 'module', 'mod_feed', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('207', 'mod_footer', 'module', 'mod_footer', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('208', 'mod_login', 'module', 'mod_login', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('209', 'mod_menu', 'module', 'mod_menu', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('210', 'mod_articles_news', 'module', 'mod_articles_news', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('211', 'mod_random_image', 'module', 'mod_random_image', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('212', 'mod_related_items', 'module', 'mod_related_items', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('213', 'mod_search', 'module', 'mod_search', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('214', 'mod_stats', 'module', 'mod_stats', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('215', 'mod_syndicate', 'module', 'mod_syndicate', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('216', 'mod_users_latest', 'module', 'mod_users_latest', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('217', 'mod_weblinks', 'module', 'mod_weblinks', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('218', 'mod_whosonline', 'module', 'mod_whosonline', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('219', 'mod_wrapper', 'module', 'mod_wrapper', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('220', 'mod_articles_category', 'module', 'mod_articles_category', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('221', 'mod_articles_categories', 'module', 'mod_articles_categories', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('222', 'mod_languages', 'module', 'mod_languages', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('223', 'mod_finder', 'module', 'mod_finder', '', '0', '1', '0', '0', '{\"legacy\":false,\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('300', 'mod_custom', 'module', 'mod_custom', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('301', 'mod_feed', 'module', 'mod_feed', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('302', 'mod_latest', 'module', 'mod_latest', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('303', 'mod_logged', 'module', 'mod_logged', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('304', 'mod_login', 'module', 'mod_login', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('305', 'mod_menu', 'module', 'mod_menu', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('307', 'mod_popular', 'module', 'mod_popular', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('308', 'mod_quickicon', 'module', 'mod_quickicon', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('309', 'mod_status', 'module', 'mod_status', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('310', 'mod_submenu', 'module', 'mod_submenu', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('311', 'mod_title', 'module', 'mod_title', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('312', 'mod_toolbar', 'module', 'mod_toolbar', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('313', 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"cache\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('314', 'mod_version', 'module', 'mod_version', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}', '{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('400', 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\"}', '{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('401', 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('402', 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `o5fpu_extensions` VALUES ('404', 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mode\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('405', 'plg_content_geshi', 'plugin', 'geshi', 'content', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_geshi\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"qbnz.com\\/highlighter\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_GESHI_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `o5fpu_extensions` VALUES ('406', 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"style\":\"xhtml\"}', '', '', '0', '2011-09-18 15:22:50', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('407', 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `o5fpu_extensions` VALUES ('408', 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\"}', '{\"position\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `o5fpu_extensions` VALUES ('409', 'plg_content_vote', 'plugin', 'vote', 'content', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '6', '0');
INSERT INTO `o5fpu_extensions` VALUES ('410', 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"linenumbers\":\"0\",\"tabmode\":\"indent\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('411', 'plg_editors_none', 'plugin', 'none', 'editors', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"2.5.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `o5fpu_extensions` VALUES ('412', 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2013\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\\/\",\"version\":\"3.5.4.1\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mode\":\"1\",\"skin\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"lang_code\":\"en\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"toolbar\":\"top\",\"toolbar_align\":\"left\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"true\",\"resize_horizontal\":\"false\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"format_date\":\"%Y-%m-%d\",\"inserttime\":\"1\",\"format_time\":\"%H:%M:%S\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"media\":\"1\",\"hr\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"style\":\"1\",\"layer\":\"1\",\"xhtmlxtras\":\"1\",\"visualchars\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advimage\":\"1\",\"advlink\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `o5fpu_extensions` VALUES ('413', 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('414', 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `o5fpu_extensions` VALUES ('415', 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `o5fpu_extensions` VALUES ('416', 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `o5fpu_extensions` VALUES ('417', 'plg_search_categories', 'plugin', 'categories', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('418', 'plg_search_contacts', 'plugin', 'contacts', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('419', 'plg_search_content', 'plugin', 'content', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('420', 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('421', 'plg_search_weblinks', 'plugin', 'weblinks', 'search', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('422', 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', '0', '0', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('423', 'plg_system_p3p', 'plugin', 'p3p', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\"}', '{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `o5fpu_extensions` VALUES ('424', 'plg_system_cache', 'plugin', 'cache', 'system', '0', '0', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', '', '0', '0000-00-00 00:00:00', '9', '0');
INSERT INTO `o5fpu_extensions` VALUES ('425', 'plg_system_debug', 'plugin', 'debug', 'system', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `o5fpu_extensions` VALUES ('426', 'plg_system_log', 'plugin', 'log', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `o5fpu_extensions` VALUES ('427', 'plg_system_redirect', 'plugin', 'redirect', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '6', '0');
INSERT INTO `o5fpu_extensions` VALUES ('428', 'plg_system_remember', 'plugin', 'remember', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '7', '0');
INSERT INTO `o5fpu_extensions` VALUES ('429', 'plg_system_sef', 'plugin', 'sef', 'system', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '8', '0');
INSERT INTO `o5fpu_extensions` VALUES ('430', 'plg_system_logout', 'plugin', 'logout', 'system', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `o5fpu_extensions` VALUES ('431', 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', '0', '0', '1', '1', '{\"legacy\":false,\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('432', 'plg_user_joomla', 'plugin', 'joomla', 'user', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2009 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"autoregister\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `o5fpu_extensions` VALUES ('433', 'plg_user_profile', 'plugin', 'profile', 'user', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', '', '600', '2013-10-21 14:18:51', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('434', 'plg_extension_joomla', 'plugin', 'joomla', 'extension', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('435', 'plg_content_joomla', 'plugin', 'joomla', 'content', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('436', 'plg_system_languagecode', 'plugin', 'languagecode', 'system', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '10', '0');
INSERT INTO `o5fpu_extensions` VALUES ('437', 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('438', 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('439', 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('440', 'plg_system_highlight', 'plugin', 'highlight', 'system', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '7', '0');
INSERT INTO `o5fpu_extensions` VALUES ('441', 'plg_content_finder', 'plugin', 'finder', 'content', '0', '0', '1', '0', '{\"legacy\":false,\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('442', 'plg_finder_categories', 'plugin', 'categories', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `o5fpu_extensions` VALUES ('443', 'plg_finder_contacts', 'plugin', 'contacts', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `o5fpu_extensions` VALUES ('444', 'plg_finder_content', 'plugin', 'content', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `o5fpu_extensions` VALUES ('445', 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `o5fpu_extensions` VALUES ('446', 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `o5fpu_extensions` VALUES ('500', 'atomic', 'template', 'atomic', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"atomic\",\"type\":\"template\",\"creationDate\":\"10\\/10\\/09\",\"author\":\"Ron Severdia\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"contact@kontentdesign.com\",\"authorUrl\":\"http:\\/\\/www.kontentdesign.com\",\"version\":\"2.5.0\",\"description\":\"TPL_ATOMIC_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('502', 'bluestork', 'template', 'bluestork', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"bluestork\",\"type\":\"template\",\"creationDate\":\"07\\/02\\/09\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"TPL_BLUESTORK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\",\"textBig\":\"0\",\"highContrast\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('503', 'beez_20', 'template', 'beez_20', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"beez_20\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ2_XML_DESCRIPTION\",\"group\":\"\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('504', 'hathor', 'template', 'hathor', '', '1', '1', '1', '0', '{\"legacy\":false,\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"2.5.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('505', 'beez5', 'template', 'beez5', '', '0', '1', '1', '0', '{\"legacy\":false,\"name\":\"beez5\",\"type\":\"template\",\"creationDate\":\"21 May 2010\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ5_XML_DESCRIPTION\",\"group\":\"\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"html5\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('600', 'English (United Kingdom)', 'language', 'en-GB', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.10\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('601', 'English (United Kingdom)', 'language', 'en-GB', '', '1', '1', '1', '1', '{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.10\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('700', 'files_joomla', 'file', 'joomla', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.14\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('800', 'PKG_JOOMLA', 'package', 'pkg_joomla', '', '0', '1', '1', '1', '{\"legacy\":false,\"name\":\"PKG_JOOMLA\",\"type\":\"package\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PKG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('801', 'donate', 'component', 'com_donate', '', '1', '1', '0', '0', '{\"legacy\":true,\"name\":\"donate\",\"type\":\"component\",\"creationDate\":\"02\\/02\\/2009\",\"author\":\"Michael Fatica\",\"copyright\":\"Copyright 2009 Michael Fatica,Fatica Consulting L.L.C. All Rights Reserved\",\"authorEmail\":\"mike@fatica.net\",\"authorUrl\":\"http:\\/\\/www.fatica.net\",\"version\":\"$Revision: 285 $\",\"description\":\" \\nDonations Component - Copyright 2009 Fatica Consulting L.L.C. All Rights Reserved \\n<h2>You must now configure the component before you can start accepting donations on-line.<\\/h2> \\n<p>For support, please visit <a href=\\\"http:\\/\\/www.fatica.net\\/forum\\\">www.fatica.net\\/forum<\\/a><\\/p>\\n\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `o5fpu_extensions` VALUES ('802', 'Donation Module', 'module', 'mod_donate', '', '0', '1', '0', '0', '{\"legacy\":true,\"name\":\"Donation Module\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Michael Fatica, Fatica Consulting L.L.C.\",\"copyright\":\"Copyright (C) 2009 Fatica Consulting L.L.C. All rights reserved.\",\"authorEmail\":\"mike@fatica.net\",\"authorUrl\":\"www.fatica.net\",\"version\":\"1.5.0\",\"description\":\"Donations\",\"group\":\"\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');

-- ----------------------------
-- Table structure for `o5fpu_finder_filters`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_filters`;
CREATE TABLE `o5fpu_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_filters
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links`;
CREATE TABLE `o5fpu_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms0`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms0`;
CREATE TABLE `o5fpu_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms0
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms1`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms1`;
CREATE TABLE `o5fpu_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms1
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms2`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms2`;
CREATE TABLE `o5fpu_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms2
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms3`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms3`;
CREATE TABLE `o5fpu_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms3
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms4`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms4`;
CREATE TABLE `o5fpu_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms4
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms5`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms5`;
CREATE TABLE `o5fpu_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms5
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms6`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms6`;
CREATE TABLE `o5fpu_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms6
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms7`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms7`;
CREATE TABLE `o5fpu_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms7
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms8`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms8`;
CREATE TABLE `o5fpu_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms8
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_terms9`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_terms9`;
CREATE TABLE `o5fpu_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_terms9
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_termsa`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_termsa`;
CREATE TABLE `o5fpu_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_termsa
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_termsb`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_termsb`;
CREATE TABLE `o5fpu_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_termsb
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_termsc`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_termsc`;
CREATE TABLE `o5fpu_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_termsc
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_termsd`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_termsd`;
CREATE TABLE `o5fpu_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_termsd
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_termse`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_termse`;
CREATE TABLE `o5fpu_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_termse
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_links_termsf`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_links_termsf`;
CREATE TABLE `o5fpu_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_links_termsf
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_taxonomy`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_taxonomy`;
CREATE TABLE `o5fpu_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_taxonomy
-- ----------------------------
INSERT INTO `o5fpu_finder_taxonomy` VALUES ('1', '0', 'ROOT', '0', '0', '0');

-- ----------------------------
-- Table structure for `o5fpu_finder_taxonomy_map`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_taxonomy_map`;
CREATE TABLE `o5fpu_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_taxonomy_map
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_terms`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_terms`;
CREATE TABLE `o5fpu_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_terms
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_terms_common`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_terms_common`;
CREATE TABLE `o5fpu_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_terms_common
-- ----------------------------
INSERT INTO `o5fpu_finder_terms_common` VALUES ('a', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('about', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('after', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('ago', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('all', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('am', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('an', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('and', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('ani', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('any', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('are', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('aren\'t', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('as', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('at', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('be', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('but', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('by', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('for', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('from', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('get', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('go', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('how', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('if', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('in', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('into', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('is', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('isn\'t', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('it', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('its', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('me', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('more', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('most', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('must', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('my', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('new', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('no', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('none', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('not', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('noth', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('nothing', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('of', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('off', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('often', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('old', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('on', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('onc', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('once', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('onli', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('only', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('or', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('other', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('our', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('ours', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('out', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('over', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('page', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('she', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('should', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('small', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('so', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('some', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('than', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('thank', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('that', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('the', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('their', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('theirs', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('them', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('then', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('there', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('these', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('they', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('this', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('those', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('thus', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('time', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('times', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('to', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('too', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('true', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('under', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('until', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('up', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('upon', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('use', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('user', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('users', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('veri', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('version', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('very', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('via', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('want', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('was', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('way', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('were', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('what', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('when', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('where', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('whi', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('which', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('who', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('whom', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('whose', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('why', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('wide', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('will', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('with', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('within', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('without', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('would', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('yes', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('yet', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('you', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('your', 'en');
INSERT INTO `o5fpu_finder_terms_common` VALUES ('yours', 'en');

-- ----------------------------
-- Table structure for `o5fpu_finder_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_tokens`;
CREATE TABLE `o5fpu_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_tokens_aggregate`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_tokens_aggregate`;
CREATE TABLE `o5fpu_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_tokens_aggregate
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_finder_types`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_finder_types`;
CREATE TABLE `o5fpu_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_finder_types
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_languages`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_languages`;
CREATE TABLE `o5fpu_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_languages
-- ----------------------------
INSERT INTO `o5fpu_languages` VALUES ('1', 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', '1', '0', '1');

-- ----------------------------
-- Table structure for `o5fpu_menu`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_menu`;
CREATE TABLE `o5fpu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_menu
-- ----------------------------
INSERT INTO `o5fpu_menu` VALUES ('1', '', 'Menu_Item_Root', 'root', '', '', '', '', '1', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0', '0', '', '0', '', '0', '57', '0', '*', '0');
INSERT INTO `o5fpu_menu` VALUES ('2', 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', '0', '1', '1', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners', '0', '', '1', '10', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('3', 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', '0', '2', '2', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners', '0', '', '2', '3', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('4', 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', '0', '2', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-cat', '0', '', '4', '5', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('5', 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', '0', '2', '2', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-clients', '0', '', '6', '7', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('6', 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', '0', '2', '2', '4', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-tracks', '0', '', '8', '9', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('7', 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', '0', '1', '1', '8', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact', '0', '', '11', '16', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('8', 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', '0', '7', '2', '8', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact', '0', '', '12', '13', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('9', 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', '0', '7', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact-cat', '0', '', '14', '15', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('10', 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', '0', '1', '1', '15', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages', '0', '', '17', '22', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('11', 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', '0', '10', '2', '15', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages-add', '0', '', '18', '19', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('12', 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', '0', '10', '2', '15', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages-read', '0', '', '20', '21', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('13', 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', '0', '1', '1', '17', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds', '0', '', '23', '28', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('14', 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', '0', '13', '2', '17', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds', '0', '', '24', '25', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('15', 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', '0', '13', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds-cat', '0', '', '26', '27', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('16', 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', '0', '1', '1', '24', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:redirect', '0', '', '41', '42', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('17', 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', '0', '1', '1', '19', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:search', '0', '', '33', '34', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('18', 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', '0', '1', '1', '21', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:weblinks', '0', '', '35', '40', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('19', 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', '0', '18', '2', '21', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:weblinks', '0', '', '36', '37', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('20', 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', '0', '18', '2', '6', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:weblinks-cat', '0', '', '38', '39', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('21', 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', '0', '1', '1', '27', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:finder', '0', '', '31', '32', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('22', 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', '0', '1', '1', '28', '0', '0', '0000-00-00 00:00:00', '0', '0', 'class:joomlaupdate', '0', '', '41', '42', '0', '*', '1');
INSERT INTO `o5fpu_menu` VALUES ('101', 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '29', '30', '1', '*', '0');
INSERT INTO `o5fpu_menu` VALUES ('102', 'mainmenu', 'Картинки', '2013-10-21-13-55-19', '', '2013-10-21-13-55-19', 'index.php?option=com_content&view=featured', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"featured_categories\":[\"8\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"1\",\"num_links\":\"4\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"alpha\",\"order_date\":\"created\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '43', '44', '0', '*', '0');
INSERT INTO `o5fpu_menu` VALUES ('103', 'mainmenu', 'Текст', '2013-10-21-14-00-13', '', '2013-10-21-14-00-13', 'index.php?option=com_content&view=featured', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"featured_categories\":[\"9\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '45', '46', '0', '*', '0');
INSERT INTO `o5fpu_menu` VALUES ('104', 'mainmenu', 'Фотографии', '2013-10-21-14-00-43', '', '2013-10-21-14-00-43', 'index.php?option=com_content&view=featured', 'component', '1', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"featured_categories\":[\"10\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"1\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '47', '48', '0', '*', '0');
INSERT INTO `o5fpu_menu` VALUES ('105', 'mainmenu', 'ьутг', '2013-10-21-14-02-39', '', '2013-10-21-14-02-39', 'index.php?option=com_content&view=categories&id=8', 'component', '-2', '1', '1', '22', '0', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"show_base_description\":\"\",\"categories_description\":\"\",\"maxLevelcat\":\"\",\"show_empty_categories_cat\":\"\",\"show_subcat_desc_cat\":\"\",\"show_cat_num_articles_cat\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_pagination_limit\":\"\",\"filter_field\":\"\",\"show_headings\":\"\",\"list_show_date\":\"\",\"date_format\":\"\",\"list_show_hits\":\"\",\"list_show_author\":\"\",\"display_num\":\"10\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '49', '50', '0', '*', '0');
INSERT INTO `o5fpu_menu` VALUES ('106', 'main', 'Donations', 'donations', '', 'donations', 'index.php?option=com_donate', 'component', '0', '1', '1', '801', '0', '0', '0000-00-00 00:00:00', '0', '1', 'js/ThemeOffice/component.png', '0', '', '51', '56', '0', '', '1');
INSERT INTO `o5fpu_menu` VALUES ('107', 'main', 'Show Donations', 'show-donations', '', 'donations/show-donations', 'index.php?option=com_donate&task=show', 'component', '0', '106', '2', '801', '0', '0', '0000-00-00 00:00:00', '0', '1', 'js/ThemeOffice/component.png', '0', '', '52', '53', '0', '', '1');
INSERT INTO `o5fpu_menu` VALUES ('108', 'main', 'Configure', 'configure', '', 'donations/configure', 'index.php?option=com_donate&task=configure', 'component', '0', '106', '2', '801', '0', '0', '0000-00-00 00:00:00', '0', '1', 'js/ThemeOffice/component.png', '0', '', '54', '55', '0', '', '1');

-- ----------------------------
-- Table structure for `o5fpu_menu_types`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_menu_types`;
CREATE TABLE `o5fpu_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_menu_types
-- ----------------------------
INSERT INTO `o5fpu_menu_types` VALUES ('1', 'mainmenu', 'Main Menu', 'The main menu for the site');

-- ----------------------------
-- Table structure for `o5fpu_messages`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_messages`;
CREATE TABLE `o5fpu_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_messages
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_messages_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_messages_cfg`;
CREATE TABLE `o5fpu_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_messages_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_modules`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_modules`;
CREATE TABLE `o5fpu_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_modules
-- ----------------------------
INSERT INTO `o5fpu_modules` VALUES ('1', 'Main Menu', '', '', '1', 'position-7', '600', '2013-10-21 13:54:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_menu', '1', '1', '{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('2', 'Login', '', '', '1', 'login', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_login', '1', '1', '', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('3', 'Popular Articles', '', '', '3', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_popular', '3', '1', '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('4', 'Recently Added Articles', '', '', '4', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_latest', '3', '1', '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('8', 'Toolbar', '', '', '1', 'toolbar', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_toolbar', '3', '1', '', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('9', 'Quick Icons', '', '', '1', 'icon', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_quickicon', '3', '1', '', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('10', 'Logged-in Users', '', '', '2', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_logged', '3', '1', '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('12', 'Admin Menu', '', '', '1', 'menu', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_menu', '3', '1', '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('13', 'Admin Submenu', '', '', '1', 'submenu', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_submenu', '3', '1', '', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('14', 'User Status', '', '', '2', 'status', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_status', '3', '1', '', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('15', 'Title', '', '', '1', 'title', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_title', '3', '1', '', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('16', 'Login Form', '', '', '7', 'position-7', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_login', '1', '1', '{\"greeting\":\"1\",\"name\":\"0\"}', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('17', 'Breadcrumbs', '', '', '1', 'position-2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_breadcrumbs', '1', '1', '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"Home\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('79', 'Multilanguage status', '', '', '1', 'status', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'mod_multilangstatus', '3', '1', '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('86', 'Joomla Version', '', '', '1', 'footer', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_version', '3', '1', '{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `o5fpu_modules` VALUES ('87', 'Custom HTML', '', '', '1', 'position-6', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-2', 'mod_custom', '1', '1', '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('88', 'Banner', '', '', '1', 'position-6', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-2', 'mod_banners', '1', '1', '{\"target\":\"1\",\"count\":\"5\",\"cid\":\"0\",\"catid\":[\"\"],\"tag_search\":\"0\",\"ordering\":\"0\",\"header_text\":\"\",\"footer_text\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\"}', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('89', 'Image', '', '', '1', 'position-10', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_random_image', '1', '1', '{\"type\":\"jpg\",\"folder\":\"images\",\"link\":\"\",\"width\":\"\",\"height\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('90', 'Image (copy)', '', '', '1', 'position-10', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-2', 'mod_random_image', '1', '1', '{\"type\":\"jpg\",\"folder\":\"\",\"link\":\"\",\"width\":\"\",\"height\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('91', 'Donation Module', '', '', '3', 'position-6', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-2', 'mod_donate', '1', '1', '', '0', '*');
INSERT INTO `o5fpu_modules` VALUES ('92', 'Banner', '', '', '1', 'position-2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_banners', '1', '1', '{\"target\":\"1\",\"count\":\"5\",\"cid\":\"0\",\"catid\":[\"\"],\"tag_search\":\"0\",\"ordering\":\"0\",\"header_text\":\"\",\"footer_text\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\"}', '0', '*');

-- ----------------------------
-- Table structure for `o5fpu_modules_menu`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_modules_menu`;
CREATE TABLE `o5fpu_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_modules_menu
-- ----------------------------
INSERT INTO `o5fpu_modules_menu` VALUES ('1', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('2', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('3', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('4', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('6', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('7', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('8', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('9', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('10', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('12', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('13', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('14', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('15', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('16', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('17', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('79', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('86', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('87', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('88', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('89', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('90', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('91', '0');
INSERT INTO `o5fpu_modules_menu` VALUES ('92', '0');

-- ----------------------------
-- Table structure for `o5fpu_newsfeeds`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_newsfeeds`;
CREATE TABLE `o5fpu_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_newsfeeds
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_overrider`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_overrider`;
CREATE TABLE `o5fpu_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_overrider
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_redirect_links`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_redirect_links`;
CREATE TABLE `o5fpu_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_redirect_links
-- ----------------------------
INSERT INTO `o5fpu_redirect_links` VALUES ('1', 'http://joomla.localhost/index.php/2013-10-21-14-02-39', '', 'http://joomla.localhost/index.php/2013-10-21-14-02-39', '', '2', '0', '2013-10-21 14:07:59', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `o5fpu_schemas`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_schemas`;
CREATE TABLE `o5fpu_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_schemas
-- ----------------------------
INSERT INTO `o5fpu_schemas` VALUES ('700', '2.5.14');

-- ----------------------------
-- Table structure for `o5fpu_session`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_session`;
CREATE TABLE `o5fpu_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_session
-- ----------------------------
INSERT INTO `o5fpu_session` VALUES ('69180a78bbb6d4b0ca45712e2b7e2e2d', '1', '0', '1382366365', '__default|a:8:{s:22:\"session.client.browser\";s:109:\"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36\";s:15:\"session.counter\";i:428;s:8:\"registry\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":15:{s:11:\"application\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}s:14:\"com_categories\";O:8:\"stdClass\":2:{s:10:\"categories\";O:8:\"stdClass\":1:{s:6:\"filter\";O:8:\"stdClass\":1:{s:9:\"extension\";s:11:\"com_banners\";}}s:4:\"edit\";O:8:\"stdClass\":1:{s:8:\"category\";O:8:\"stdClass\":2:{s:4:\"data\";N;s:2:\"id\";a:0:{}}}}s:13:\"com_installer\";O:8:\"stdClass\":3:{s:7:\"message\";s:0:\"\";s:17:\"extension_message\";s:0:\"\";s:12:\"redirect_url\";N;}s:11:\"com_content\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":1:{s:7:\"article\";O:8:\"stdClass\":2:{s:4:\"data\";N;s:2:\"id\";a:1:{i:0;i:2;}}}}s:9:\"com_menus\";O:8:\"stdClass\":2:{s:5:\"items\";O:8:\"stdClass\":2:{s:6:\"filter\";O:8:\"stdClass\":1:{s:8:\"menutype\";s:8:\"mainmenu\";}s:10:\"limitstart\";i:0;}s:4:\"edit\";O:8:\"stdClass\":2:{s:4:\"menu\";O:8:\"stdClass\":1:{s:4:\"data\";N;}s:4:\"item\";O:8:\"stdClass\":4:{s:4:\"data\";N;s:4:\"type\";N;s:4:\"link\";N;s:2:\"id\";a:0:{}}}}s:13:\"com_templates\";O:8:\"stdClass\":2:{s:6:\"styles\";O:8:\"stdClass\":1:{s:10:\"limitstart\";i:0;}s:4:\"edit\";O:8:\"stdClass\":2:{s:5:\"style\";O:8:\"stdClass\":2:{s:2:\"id\";a:2:{i:0;i:4;i:1;i:3;}s:4:\"data\";N;}s:6:\"source\";O:8:\"stdClass\":2:{s:2:\"id\";s:28:\"NTAzOmNzcy9wb3NpdGlvbi5jc3M=\";s:4:\"data\";N;}}}s:6:\"editor\";O:8:\"stdClass\":1:{s:6:\"source\";O:8:\"stdClass\":1:{s:6:\"syntax\";s:3:\"css\";}}s:11:\"com_modules\";O:8:\"stdClass\":3:{s:4:\"edit\";O:8:\"stdClass\":1:{s:6:\"module\";O:8:\"stdClass\":2:{s:4:\"data\";N;s:2:\"id\";a:2:{i:0;i:1;i:1;i:87;}}}s:3:\"add\";O:8:\"stdClass\":1:{s:6:\"module\";O:8:\"stdClass\":2:{s:12:\"extension_id\";N;s:6:\"params\";N;}}s:7:\"modules\";O:8:\"stdClass\":1:{s:6:\"filter\";O:8:\"stdClass\":1:{s:18:\"client_id_previous\";i:0;}}}s:4:\"item\";O:8:\"stdClass\":1:{s:6:\"filter\";O:8:\"stdClass\":1:{s:8:\"menutype\";s:8:\"mainmenu\";}}s:11:\"com_plugins\";O:8:\"stdClass\":2:{s:7:\"plugins\";O:8:\"stdClass\":4:{s:6:\"filter\";O:8:\"stdClass\":4:{s:6:\"search\";s:0:\"\";s:6:\"access\";i:0;s:5:\"state\";s:0:\"\";s:6:\"folder\";s:0:\"\";}s:10:\"limitstart\";s:2:\"40\";s:8:\"ordercol\";s:6:\"folder\";s:9:\"orderdirn\";s:3:\"asc\";}s:4:\"edit\";O:8:\"stdClass\":1:{s:6:\"plugin\";O:8:\"stdClass\":2:{s:2:\"id\";a:1:{i:0;i:433;}s:4:\"data\";N;}}}s:6:\"global\";O:8:\"stdClass\":1:{s:4:\"list\";O:8:\"stdClass\":1:{s:5:\"limit\";s:2:\"20\";}}s:11:\"com_contact\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":1:{s:7:\"contact\";O:8:\"stdClass\":2:{s:4:\"data\";N;s:2:\"id\";a:0:{}}}}s:9:\"com_users\";O:8:\"stdClass\":1:{s:5:\"users\";O:8:\"stdClass\":1:{s:5:\"modal\";O:8:\"stdClass\":1:{s:10:\"limitstart\";i:0;}}}s:12:\"com_messages\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":1:{s:7:\"message\";O:8:\"stdClass\":1:{s:4:\"data\";N;}}}s:11:\"com_banners\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":1:{s:6:\"banner\";O:8:\"stdClass\":2:{s:4:\"data\";N;s:2:\"id\";a:1:{i:0;i:1;}}}}}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\0*\0isRoot\";b:1;s:2:\"id\";s:3:\"600\";s:4:\"name\";s:10:\"Super User\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"vadimnazarenko@bk.ru\";s:8:\"password\";s:65:\"e0c0baff2d9115bf12ba79f93142c615:DpWKcI7NURGAlQT7IOS2GHTtJMYgioPM\";s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";s:10:\"deprecated\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2013-10-15 15:32:50\";s:13:\"lastvisitDate\";s:19:\"2013-10-21 13:05:39\";s:10:\"activation\";s:1:\"0\";s:6:\"params\";s:0:\"\";s:6:\"groups\";a:1:{i:8;s:1:\"8\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:10:\"\0*\0_params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:14:\"\0*\0_authGroups\";a:2:{i:0;i:1;i:1;i:8;}s:14:\"\0*\0_authLevels\";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:\"\0*\0_authActions\";N;s:12:\"\0*\0_errorMsg\";N;s:10:\"\0*\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"826a583416b87b8b6cd9a7d4c4c8ef13\";s:19:\"session.timer.start\";i:1382361767;s:18:\"session.timer.last\";i:1382366364;s:17:\"session.timer.now\";i:1382366364;}', '600', 'admin', '');
INSERT INTO `o5fpu_session` VALUES ('c0a6133e3faff2600e932283e6efb712', '0', '0', '1382367210', '__default|a:9:{s:15:\"session.counter\";i:79;s:19:\"session.timer.start\";i:1382362563;s:18:\"session.timer.last\";i:1382366371;s:17:\"session.timer.now\";i:1382367210;s:22:\"session.client.browser\";s:109:\"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36\";s:8:\"registry\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":1:{s:5:\"users\";O:8:\"stdClass\":1:{s:5:\"login\";O:8:\"stdClass\":1:{s:4:\"form\";O:8:\"stdClass\":2:{s:6:\"return\";s:20:\"index.php?Itemid=101\";s:4:\"data\";a:0:{}}}}}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\0*\0isRoot\";b:1;s:2:\"id\";s:3:\"600\";s:4:\"name\";s:10:\"Super User\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"vadimnazarenko@bk.ru\";s:8:\"password\";s:65:\"e0c0baff2d9115bf12ba79f93142c615:DpWKcI7NURGAlQT7IOS2GHTtJMYgioPM\";s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";s:10:\"deprecated\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2013-10-15 15:32:50\";s:13:\"lastvisitDate\";s:19:\"2013-10-21 13:22:47\";s:10:\"activation\";s:1:\"0\";s:6:\"params\";s:0:\"\";s:6:\"groups\";a:1:{i:8;s:1:\"8\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:10:\"\0*\0_params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:14:\"\0*\0_authGroups\";a:2:{i:0;i:1;i:1;i:8;}s:14:\"\0*\0_authLevels\";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:\"\0*\0_authActions\";N;s:12:\"\0*\0_errorMsg\";N;s:10:\"\0*\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"f6d6a45634ce8a32a33be068298da64f\";s:16:\"com_mailto.links\";a:4:{s:40:\"1ed199dcc6cc23841cff27e7d7aeec472c0dc6fb\";O:8:\"stdClass\":2:{s:4:\"link\";s:77:\"http://joomla.localhost/index.php/8-2013-10-21-13-24-24/2-2013-10-21-13-29-13\";s:6:\"expiry\";i:1382367210;}s:40:\"7da3960fba1aec9ec4c20303939b53d479671094\";O:8:\"stdClass\":2:{s:4:\"link\";s:65:\"http://joomla.localhost/index.php/8-2013-10-21-13-24-24/1-youtube\";s:6:\"expiry\";i:1382367210;}s:40:\"b2f8cd5c0ce426ed4c5fd2087791258cb2318658\";O:8:\"stdClass\":2:{s:4:\"link\";s:77:\"http://joomla.localhost/index.php/8-2013-10-21-13-24-24/3-2013-10-21-13-30-32\";s:6:\"expiry\";i:1382367210;}s:40:\"caab2290c8a684c3db1e5e20fe7054ff1e65c357\";O:8:\"stdClass\":2:{s:4:\"link\";s:77:\"http://joomla.localhost/index.php/9-2013-10-21-13-24-43/4-2013-10-21-13-33-37\";s:6:\"expiry\";i:1382367210;}}}', '600', 'admin', '');

-- ----------------------------
-- Table structure for `o5fpu_template_styles`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_template_styles`;
CREATE TABLE `o5fpu_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_template_styles
-- ----------------------------
INSERT INTO `o5fpu_template_styles` VALUES ('2', 'bluestork', '1', '1', 'Bluestork - Default', '{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\"}');
INSERT INTO `o5fpu_template_styles` VALUES ('3', 'atomic', '0', '0', 'Atomic - Default', '{}');
INSERT INTO `o5fpu_template_styles` VALUES ('4', 'beez_20', '0', '1', 'Beez2 - Default', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}');
INSERT INTO `o5fpu_template_styles` VALUES ('5', 'hathor', '1', '0', 'Hathor - Default', '{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}');
INSERT INTO `o5fpu_template_styles` VALUES ('6', 'beez5', '0', '0', 'Beez5 - Default', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/sampledata\\/fruitshop\\/fruits.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"html5\":\"0\"}');

-- ----------------------------
-- Table structure for `o5fpu_updates`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_updates`;
CREATE TABLE `o5fpu_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Available Updates';

-- ----------------------------
-- Records of o5fpu_updates
-- ----------------------------
INSERT INTO `o5fpu_updates` VALUES ('1', '3', '0', '0', 'Armenian', '', 'pkg_hy-AM', 'package', '', '0', '2.5.8.1', '', 'http://update.joomla.org/language/details/hy-AM_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('2', '3', '0', '0', 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/id-ID_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('3', '3', '0', '0', 'Danish', '', 'pkg_da-DK', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('4', '3', '0', '0', 'Khmer', '', 'pkg_km-KH', 'package', '', '0', '2.5.7.1', '', 'http://update.joomla.org/language/details/km-KH_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('5', '3', '0', '0', 'Swedish', '', 'pkg_sv-SE', 'package', '', '0', '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('6', '3', '0', '0', 'Hungarian', '', 'pkg_hu-HU', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/hu-HU_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('7', '3', '0', '0', 'Bulgarian', '', 'pkg_bg-BG', 'package', '', '0', '2.5.7.1', '', 'http://update.joomla.org/language/details/bg-BG_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('8', '3', '0', '0', 'French', '', 'pkg_fr-FR', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('9', '3', '0', '0', 'Italian', '', 'pkg_it-IT', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('10', '3', '0', '0', 'Spanish', '', 'pkg_es-ES', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('11', '3', '0', '0', 'Dutch', '', 'pkg_nl-NL', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('12', '3', '0', '0', 'Turkish', '', 'pkg_tr-TR', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/tr-TR_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('13', '3', '0', '0', 'Ukrainian', '', 'pkg_uk-UA', 'package', '', '0', '2.5.13.11', '', 'http://update.joomla.org/language/details/uk-UA_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('14', '3', '0', '0', 'Slovak', '', 'pkg_sk-SK', 'package', '', '0', '2.5.14.2', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('15', '3', '0', '0', 'Belarusian', '', 'pkg_be-BY', 'package', '', '0', '2.5.8.1', '', 'http://update.joomla.org/language/details/be-BY_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('16', '3', '0', '0', 'Latvian', '', 'pkg_lv-LV', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('17', '3', '0', '0', 'Estonian', '', 'pkg_et-EE', 'package', '', '0', '2.5.7.1', '', 'http://update.joomla.org/language/details/et-EE_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('18', '3', '0', '0', 'Romanian', '', 'pkg_ro-RO', 'package', '', '0', '2.5.11.1', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('19', '3', '0', '0', 'Flemish', '', 'pkg_nl-BE', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('20', '3', '0', '0', 'Macedonian', '', 'pkg_mk-MK', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('21', '3', '0', '0', 'Japanese', '', 'pkg_ja-JP', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('22', '3', '0', '0', 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('23', '3', '0', '0', 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('24', '3', '0', '0', 'German', '', 'pkg_de-DE', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('25', '3', '0', '0', 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', '0', '2.5.11.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('26', '3', '0', '0', 'English AU', '', 'pkg_en-AU', 'package', '', '0', '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('27', '3', '0', '0', 'English US', '', 'pkg_en-US', 'package', '', '0', '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('28', '3', '0', '0', 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('29', '3', '0', '0', 'Lithuanian', '', 'pkg_lt-LT', 'package', '', '0', '2.5.7.1', '', 'http://update.joomla.org/language/details/lt-LT_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('30', '3', '0', '0', 'Albanian', '', 'pkg_sq-AL', 'package', '', '0', '2.5.1.5', '', 'http://update.joomla.org/language/details/sq-AL_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('31', '3', '0', '0', 'Czech', '', 'pkg_cs-CZ', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('32', '3', '0', '0', 'Persian', '', 'pkg_fa-IR', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('33', '3', '0', '0', 'Galician', '', 'pkg_gl-ES', 'package', '', '0', '2.5.7.4', '', 'http://update.joomla.org/language/details/gl-ES_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('34', '3', '0', '0', 'Polish', '', 'pkg_pl-PL', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('35', '3', '0', '0', 'Syriac', '', 'pkg_sy-IQ', 'package', '', '0', '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('36', '3', '0', '0', 'Portuguese', '', 'pkg_pt-PT', 'package', '', '0', '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-PT_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('37', '3', '0', '0', 'Russian', '', 'pkg_ru-RU', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('38', '3', '0', '0', 'Hebrew', '', 'pkg_he-IL', 'package', '', '0', '2.5.7.1', '', 'http://update.joomla.org/language/details/he-IL_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('39', '3', '0', '0', 'Catalan', '', 'pkg_ca-ES', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('40', '3', '0', '0', 'Laotian', '', 'pkg_lo-LA', 'package', '', '0', '2.5.6.1', '', 'http://update.joomla.org/language/details/lo-LA_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('41', '3', '0', '0', 'Afrikaans', '', 'pkg_af-ZA', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('42', '3', '0', '0', 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('43', '3', '0', '0', 'Greek', '', 'pkg_el-GR', 'package', '', '0', '2.5.6.1', '', 'http://update.joomla.org/language/details/el-GR_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('44', '3', '0', '0', 'Esperanto', '', 'pkg_eo-XX', 'package', '', '0', '2.5.6.1', '', 'http://update.joomla.org/language/details/eo-XX_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('45', '3', '0', '0', 'Finnish', '', 'pkg_fi-FI', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('46', '3', '0', '0', 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', '0', '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('47', '3', '0', '0', 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('48', '3', '0', '0', 'Vietnamese', '', 'pkg_vi-VN', 'package', '', '0', '2.5.8.1', '', 'http://update.joomla.org/language/details/vi-VN_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('49', '3', '0', '0', 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', '0', '2.5.9.1', '', 'http://update.joomla.org/language/details/ckb-IQ_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('50', '3', '0', '0', 'Bosnian', '', 'pkg_bs-BA', 'package', '', '0', '2.5.11.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('51', '3', '0', '0', 'Croatian', '', 'pkg_hr-HR', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/hr-HR_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('52', '3', '0', '0', 'Azeri', '', 'pkg_az-AZ', 'package', '', '0', '2.5.7.1', '', 'http://update.joomla.org/language/details/az-AZ_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('53', '3', '0', '0', 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', '0', '2.5.8.1', '', 'http://update.joomla.org/language/details/nn-NO_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('54', '3', '0', '0', 'Tamil India', '', 'pkg_ta-IN', 'package', '', '0', '2.5.14.2', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('55', '3', '0', '0', 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', '0', '2.5.7.1', '', 'http://update.joomla.org/language/details/gd-GB_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('56', '3', '0', '0', 'Thai', '', 'pkg_th-TH', 'package', '', '0', '2.5.13.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('57', '3', '0', '0', 'Basque', '', 'pkg_eu-ES', 'package', '', '0', '1.7.0.1', '', 'http://update.joomla.org/language/details/eu-ES_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('58', '3', '0', '0', 'Uyghur', '', 'pkg_ug-CN', 'package', '', '0', '2.5.7.2', '', 'http://update.joomla.org/language/details/ug-CN_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('59', '3', '0', '0', 'Korean', '', 'pkg_ko-KR', 'package', '', '0', '2.5.11.1', '', 'http://update.joomla.org/language/details/ko-KR_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('60', '3', '0', '0', 'Hindi', '', 'pkg_hi-IN', 'package', '', '0', '2.5.6.1', '', 'http://update.joomla.org/language/details/hi-IN_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('61', '3', '0', '0', 'Welsh', '', 'pkg_cy-GB', 'package', '', '0', '2.5.6.1', '', 'http://update.joomla.org/language/details/cy-GB_details.xml', '');
INSERT INTO `o5fpu_updates` VALUES ('62', '3', '0', '0', 'Swahili', '', 'pkg_sw-KE', 'package', '', '0', '2.5.14.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', '');

-- ----------------------------
-- Table structure for `o5fpu_update_categories`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_update_categories`;
CREATE TABLE `o5fpu_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories';

-- ----------------------------
-- Records of o5fpu_update_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_update_sites`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_update_sites`;
CREATE TABLE `o5fpu_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Update Sites';

-- ----------------------------
-- Records of o5fpu_update_sites
-- ----------------------------
INSERT INTO `o5fpu_update_sites` VALUES ('1', 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', '1', '1382360742');
INSERT INTO `o5fpu_update_sites` VALUES ('2', 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', '1', '1382360742');
INSERT INTO `o5fpu_update_sites` VALUES ('3', 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', '1', '1382360742');

-- ----------------------------
-- Table structure for `o5fpu_update_sites_extensions`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_update_sites_extensions`;
CREATE TABLE `o5fpu_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

-- ----------------------------
-- Records of o5fpu_update_sites_extensions
-- ----------------------------
INSERT INTO `o5fpu_update_sites_extensions` VALUES ('1', '700');
INSERT INTO `o5fpu_update_sites_extensions` VALUES ('2', '700');
INSERT INTO `o5fpu_update_sites_extensions` VALUES ('3', '600');

-- ----------------------------
-- Table structure for `o5fpu_usergroups`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_usergroups`;
CREATE TABLE `o5fpu_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_usergroups
-- ----------------------------
INSERT INTO `o5fpu_usergroups` VALUES ('1', '0', '1', '20', 'Public');
INSERT INTO `o5fpu_usergroups` VALUES ('2', '1', '6', '17', 'Registered');
INSERT INTO `o5fpu_usergroups` VALUES ('3', '2', '7', '14', 'Author');
INSERT INTO `o5fpu_usergroups` VALUES ('4', '3', '8', '11', 'Editor');
INSERT INTO `o5fpu_usergroups` VALUES ('5', '4', '9', '10', 'Publisher');
INSERT INTO `o5fpu_usergroups` VALUES ('6', '1', '2', '5', 'Manager');
INSERT INTO `o5fpu_usergroups` VALUES ('7', '6', '3', '4', 'Administrator');
INSERT INTO `o5fpu_usergroups` VALUES ('8', '1', '18', '19', 'Super Users');

-- ----------------------------
-- Table structure for `o5fpu_users`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_users`;
CREATE TABLE `o5fpu_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_users
-- ----------------------------
INSERT INTO `o5fpu_users` VALUES ('600', 'Super User', 'admin', 'vadimnazarenko@bk.ru', 'e0c0baff2d9115bf12ba79f93142c615:DpWKcI7NURGAlQT7IOS2GHTtJMYgioPM', 'deprecated', '0', '1', '2013-10-15 15:32:50', '2013-10-21 14:21:34', '0', '', '0000-00-00 00:00:00', '0');

-- ----------------------------
-- Table structure for `o5fpu_user_notes`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_user_notes`;
CREATE TABLE `o5fpu_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_user_notes
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_user_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_user_profiles`;
CREATE TABLE `o5fpu_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- ----------------------------
-- Records of o5fpu_user_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for `o5fpu_user_usergroup_map`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_user_usergroup_map`;
CREATE TABLE `o5fpu_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_user_usergroup_map
-- ----------------------------
INSERT INTO `o5fpu_user_usergroup_map` VALUES ('600', '8');

-- ----------------------------
-- Table structure for `o5fpu_viewlevels`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_viewlevels`;
CREATE TABLE `o5fpu_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_viewlevels
-- ----------------------------
INSERT INTO `o5fpu_viewlevels` VALUES ('1', 'Public', '0', '[1]');
INSERT INTO `o5fpu_viewlevels` VALUES ('2', 'Registered', '1', '[6,2,8]');
INSERT INTO `o5fpu_viewlevels` VALUES ('3', 'Special', '2', '[6,3,8]');

-- ----------------------------
-- Table structure for `o5fpu_weblinks`
-- ----------------------------
DROP TABLE IF EXISTS `o5fpu_weblinks`;
CREATE TABLE `o5fpu_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o5fpu_weblinks
-- ----------------------------
