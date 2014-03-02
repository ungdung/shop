/*
SQLyog Enterprise v10.42 
MySQL - 5.5.32 : Database - efox_ungdung
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`efox_ungdung` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `efox_ungdung`;

/*Table structure for table `efox_news` */

DROP TABLE IF EXISTS `efox_news`;

CREATE TABLE `efox_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_category_id` int(11) DEFAULT NULL,
  `news_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_intro` text COLLATE utf8_unicode_ci,
  `news_description` longtext COLLATE utf8_unicode_ci,
  `news_date` datetime DEFAULT NULL,
  `news_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_source` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `efox_news` */

/*Table structure for table `efox_news_category` */

DROP TABLE IF EXISTS `efox_news_category`;

CREATE TABLE `efox_news_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `category_layer` int(11) DEFAULT NULL,
  `category_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `category_meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `efox_news_category` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
