-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2014 at 07:40 PM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `efox_ungdung`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `createCustomer`()
BEGIN
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `efox_activity`
--

CREATE TABLE IF NOT EXISTS `efox_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `target_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `browser_version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`activity_id`,`browser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=827 ;

--
-- Dumping data for table `efox_activity`
--

INSERT INTO `efox_activity` (`activity_id`, `module`, `action`, `user_id`, `target_id`, `target_url`, `browser`, `browser_version`, `ip`, `os`, `created_on`, `read`, `customer_id`) VALUES
(1, 'users', 'updated a user', 1, 3, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 18:13:11', 0, 1),
(2, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:30:38', 0, 1),
(3, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:31:32', 0, 1),
(4, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:31:50', 0, 1),
(5, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:32:42', 0, 1),
(6, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:33:03', 0, 1),
(7, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:36:10', 0, 1),
(8, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:36:12', 0, 1),
(9, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 19:40:29', 0, 1),
(10, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Chrome', '33.0.1750.117', '127.0.0.1', 'Windows 7', '2014-03-02 19:42:10', 0, 1),
(11, 'users', 'created a user', 1, 6, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 20:00:03', 0, 1),
(12, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 20:28:15', 0, 1),
(13, 'users', 'has logged', 3, 3, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 20:50:18', 0, 2),
(14, 'users', 'updated a user', 1, 5, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-02 21:10:36', 0, 1),
(15, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-04 21:06:43', 0, 1),
(16, 'users', 'has logged', 6, 6, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 21:28:15', 0, 3),
(17, 'menu', NULL, 6, 29, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:24', 0, 3),
(18, 'menu', NULL, 6, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:24', 0, 3),
(19, 'menu', NULL, 6, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:24', 0, 3),
(20, 'menu', NULL, 6, 20, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:25', 0, 3),
(21, 'menu', NULL, 6, 23, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:25', 0, 3),
(22, 'menu', NULL, 6, 28, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:25', 0, 3),
(23, 'menu', NULL, 6, 29, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:29', 0, 3),
(24, 'menu', NULL, 6, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:29', 0, 3),
(25, 'menu', NULL, 6, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:29', 0, 3),
(26, 'menu', NULL, 6, 20, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:29', 0, 3),
(27, 'menu', NULL, 6, 28, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:29', 0, 3),
(28, 'menu', NULL, 6, 23, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:29', 0, 3),
(29, 'menu', NULL, 6, 29, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:32', 0, 3),
(30, 'menu', NULL, 6, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:32', 0, 3),
(31, 'menu', NULL, 6, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:33', 0, 3),
(32, 'menu', NULL, 6, 20, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:33', 0, 3),
(33, 'menu', NULL, 6, 28, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:33', 0, 3),
(34, 'menu', NULL, 6, 23, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:33', 0, 3),
(35, 'menu', NULL, 6, 29, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:35', 0, 3),
(36, 'menu', NULL, 6, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:35', 0, 3),
(37, 'menu', NULL, 6, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:35', 0, 3),
(38, 'menu', NULL, 6, 20, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:36', 0, 3),
(39, 'menu', NULL, 6, 28, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:36', 0, 3),
(40, 'menu', NULL, 6, 23, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:35:36', 0, 3),
(41, 'menu', NULL, 6, 29, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:17', 0, 3),
(42, 'menu', NULL, 6, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:17', 0, 3),
(43, 'menu', NULL, 6, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:17', 0, 3),
(44, 'menu', NULL, 6, 20, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:17', 0, 3),
(45, 'menu', NULL, 6, 28, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:18', 0, 3),
(46, 'menu', NULL, 6, 23, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:18', 0, 3),
(47, 'menu', NULL, 6, 29, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:19', 0, 3),
(48, 'menu', NULL, 6, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:19', 0, 3),
(49, 'menu', NULL, 6, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:19', 0, 3),
(50, 'menu', NULL, 6, 20, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:19', 0, 3),
(51, 'menu', NULL, 6, 28, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:19', 0, 3),
(52, 'menu', NULL, 6, 23, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-06 22:36:19', 0, 3),
(53, 'users', 'has logged', 1, 1, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 20:34:03', 0, 1),
(54, 'users', 'updated a user', 1, 2, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:12:35', 0, 1),
(55, 'users', 'updated a user', 1, 2, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:15:44', 0, 1),
(56, 'users', 'updated a user', 1, 2, '/settings/users/profile/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:18:15', 0, 1),
(57, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:00', 0, 1),
(58, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:00', 0, 1),
(59, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:00', 0, 1),
(60, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:00', 0, 1),
(61, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:00', 0, 1),
(62, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:02', 0, 1),
(63, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:02', 0, 1),
(64, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:02', 0, 1),
(65, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:02', 0, 1),
(66, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:02', 0, 1),
(67, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:06', 0, 1),
(68, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:06', 0, 1),
(69, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:07', 0, 1),
(70, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:07', 0, 1),
(71, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:41:07', 0, 1),
(72, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:44', 0, 1),
(73, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:44', 0, 1),
(74, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:44', 0, 1),
(75, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:44', 0, 1),
(76, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:44', 0, 1),
(77, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:44', 0, 1),
(78, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:45', 0, 1),
(79, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:45', 0, 1),
(80, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:45', 0, 1),
(81, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:45', 0, 1),
(82, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:46', 0, 1),
(83, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:46', 0, 1),
(84, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:48', 0, 1),
(85, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:48', 0, 1),
(86, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:48', 0, 1),
(87, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:49', 0, 1),
(88, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:49', 0, 1),
(89, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:42:49', 0, 1),
(90, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:41', 0, 1),
(91, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:41', 0, 1),
(92, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:41', 0, 1),
(93, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:41', 0, 1),
(94, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(95, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(96, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(97, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(98, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(99, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(100, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(101, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:42', 0, 1),
(102, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:57', 0, 1),
(103, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:58', 0, 1),
(104, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:58', 0, 1),
(105, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:58', 0, 1),
(106, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:58', 0, 1),
(107, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:43:58', 0, 1),
(108, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:44:58', 0, 1),
(109, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:44:58', 0, 1),
(110, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:44:59', 0, 1),
(111, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:44:59', 0, 1),
(112, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:44:59', 0, 1),
(113, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:44:59', 0, 1),
(114, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:45:21', 0, 1),
(115, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:45:21', 0, 1),
(116, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:45:21', 0, 1),
(117, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:45:21', 0, 1),
(118, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:45:21', 0, 1),
(119, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:45:21', 0, 1),
(120, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:46:16', 0, 1),
(121, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:46:16', 0, 1),
(122, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:46:16', 0, 1),
(123, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:46:17', 0, 1),
(124, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:46:17', 0, 1),
(125, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:46:17', 0, 1),
(126, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:48:32', 0, 1),
(127, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:48:32', 0, 1),
(128, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:48:32', 0, 1),
(129, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:48:32', 0, 1),
(130, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:48:32', 0, 1),
(131, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:48:33', 0, 1),
(132, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:48:33', 0, 1),
(133, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:23', 0, 1),
(134, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:23', 0, 1),
(135, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:23', 0, 1),
(136, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:23', 0, 1),
(137, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:23', 0, 1),
(138, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:23', 0, 1),
(139, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:23', 0, 1),
(140, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:25', 0, 1),
(141, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:25', 0, 1),
(142, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:25', 0, 1),
(143, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:25', 0, 1),
(144, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:25', 0, 1),
(145, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:25', 0, 1),
(146, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:25', 0, 1),
(147, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:28', 0, 1),
(148, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:29', 0, 1),
(149, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:29', 0, 1),
(150, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:29', 0, 1),
(151, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:29', 0, 1),
(152, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:29', 0, 1),
(153, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:29', 0, 1),
(154, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:31', 0, 1),
(155, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:31', 0, 1),
(156, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:31', 0, 1),
(157, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:31', 0, 1),
(158, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:31', 0, 1),
(159, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:31', 0, 1),
(160, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:31', 0, 1),
(161, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:37', 0, 1),
(162, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:37', 0, 1),
(163, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:37', 0, 1),
(164, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:37', 0, 1),
(165, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:37', 0, 1),
(166, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:37', 0, 1),
(167, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:37', 0, 1),
(168, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:40', 0, 1),
(169, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:40', 0, 1),
(170, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:40', 0, 1),
(171, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:40', 0, 1),
(172, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:40', 0, 1),
(173, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:40', 0, 1),
(174, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:40', 0, 1),
(175, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:45', 0, 1),
(176, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:45', 0, 1),
(177, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:45', 0, 1),
(178, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:45', 0, 1),
(179, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:45', 0, 1),
(180, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:45', 0, 1),
(181, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:49:45', 0, 1),
(182, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:50:00', 0, 1),
(183, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:50:00', 0, 1),
(184, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:50:00', 0, 1),
(185, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:50:01', 0, 1),
(186, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:50:01', 0, 1),
(187, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:50:01', 0, 1),
(188, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:50:01', 0, 1),
(189, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:33', 0, 1),
(190, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:33', 0, 1),
(191, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:33', 0, 1),
(192, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:33', 0, 1),
(193, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:34', 0, 1),
(194, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:34', 0, 1),
(195, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:34', 0, 1),
(196, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:40', 0, 1),
(197, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:40', 0, 1),
(198, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:40', 0, 1),
(199, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:41', 0, 1),
(200, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:41', 0, 1),
(201, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:41', 0, 1),
(202, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:41', 0, 1),
(203, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:44', 0, 1),
(204, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:45', 0, 1),
(205, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:45', 0, 1),
(206, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:45', 0, 1),
(207, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:45', 0, 1),
(208, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:45', 0, 1),
(209, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:45', 0, 1),
(210, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:49', 0, 1),
(211, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:49', 0, 1),
(212, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:49', 0, 1),
(213, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:49', 0, 1),
(214, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:49', 0, 1),
(215, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:49', 0, 1),
(216, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:55:49', 0, 1),
(217, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:15', 0, 1),
(218, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:15', 0, 1),
(219, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:15', 0, 1),
(220, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:15', 0, 1),
(221, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:16', 0, 1),
(222, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:16', 0, 1),
(223, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:16', 0, 1),
(224, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:48', 0, 1),
(225, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:48', 0, 1),
(226, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:48', 0, 1),
(227, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:48', 0, 1),
(228, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:48', 0, 1),
(229, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:48', 0, 1),
(230, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:58:48', 0, 1),
(231, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:59:34', 0, 1),
(232, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:59:35', 0, 1),
(233, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:59:35', 0, 1),
(234, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:59:35', 0, 1),
(235, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:59:35', 0, 1),
(236, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:59:35', 0, 1),
(237, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 21:59:35', 0, 1),
(238, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:16', 0, 1),
(239, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:16', 0, 1),
(240, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:16', 0, 1),
(241, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:16', 0, 1),
(242, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:16', 0, 1),
(243, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:16', 0, 1),
(244, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:16', 0, 1),
(245, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:18', 0, 1),
(246, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:18', 0, 1),
(247, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:18', 0, 1),
(248, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:18', 0, 1),
(249, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:18', 0, 1),
(250, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:18', 0, 1),
(251, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:19', 0, 1),
(252, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:19', 0, 1),
(253, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:19', 0, 1),
(254, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:19', 0, 1),
(255, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:19', 0, 1),
(256, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:20', 0, 1),
(257, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:20', 0, 1),
(258, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:20', 0, 1),
(259, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:27', 0, 1),
(260, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:27', 0, 1),
(261, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:28', 0, 1),
(262, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:28', 0, 1),
(263, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:28', 0, 1),
(264, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:28', 0, 1),
(265, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:00:28', 0, 1),
(266, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:23', 0, 1),
(267, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:23', 0, 1),
(268, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:23', 0, 1),
(269, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:23', 0, 1),
(270, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:23', 0, 1),
(271, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:23', 0, 1),
(272, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:23', 0, 1),
(273, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:25', 0, 1),
(274, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:25', 0, 1),
(275, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:25', 0, 1),
(276, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:25', 0, 1),
(277, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:25', 0, 1),
(278, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:25', 0, 1),
(279, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:25', 0, 1),
(280, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:26', 0, 1),
(281, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:26', 0, 1),
(282, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:26', 0, 1),
(283, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:26', 0, 1),
(284, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:27', 0, 1),
(285, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:27', 0, 1),
(286, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:15:27', 0, 1),
(287, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:48', 0, 1),
(288, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:48', 0, 1),
(289, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:48', 0, 1),
(290, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:48', 0, 1),
(291, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:48', 0, 1),
(292, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:48', 0, 1),
(293, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:48', 0, 1),
(294, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:51', 0, 1),
(295, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:52', 0, 1),
(296, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:52', 0, 1),
(297, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:52', 0, 1),
(298, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:52', 0, 1),
(299, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:52', 0, 1),
(300, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:52', 0, 1),
(301, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:53', 0, 1),
(302, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:53', 0, 1),
(303, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:53', 0, 1),
(304, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:53', 0, 1),
(305, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:53', 0, 1),
(306, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:53', 0, 1),
(307, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:53', 0, 1),
(308, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:54', 0, 1),
(309, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:54', 0, 1),
(310, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:54', 0, 1),
(311, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:54', 0, 1),
(312, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:54', 0, 1),
(313, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(314, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(315, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(316, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(317, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(318, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(319, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(320, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(321, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:55', 0, 1),
(322, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:56', 0, 1),
(323, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:56', 0, 1),
(324, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:57', 0, 1),
(325, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:57', 0, 1),
(326, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:57', 0, 1),
(327, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:57', 0, 1),
(328, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:19:57', 0, 1),
(329, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(330, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(331, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(332, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(333, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(334, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(335, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(336, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(337, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(338, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(339, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:46', 0, 1),
(340, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(341, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(342, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(343, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(344, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(345, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(346, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(347, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(348, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(349, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(350, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(351, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(352, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(353, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:47', 0, 1),
(354, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:48', 0, 1),
(355, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:48', 0, 1),
(356, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:20:48', 0, 1),
(357, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:11', 0, 1),
(358, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:12', 0, 1),
(359, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:12', 0, 1),
(360, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:12', 0, 1),
(361, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:12', 0, 1),
(362, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:12', 0, 1),
(363, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:12', 0, 1),
(364, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:14', 0, 1),
(365, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:14', 0, 1),
(366, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:14', 0, 1),
(367, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:14', 0, 1),
(368, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:14', 0, 1),
(369, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:14', 0, 1),
(370, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:15', 0, 1),
(371, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:37', 0, 1),
(372, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:37', 0, 1),
(373, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:37', 0, 1),
(374, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:37', 0, 1),
(375, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:37', 0, 1),
(376, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:37', 0, 1),
(377, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:37', 0, 1),
(378, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:40', 0, 1),
(379, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:40', 0, 1),
(380, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:40', 0, 1),
(381, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:40', 0, 1),
(382, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:40', 0, 1),
(383, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:40', 0, 1),
(384, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:40', 0, 1),
(385, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:41', 0, 1),
(386, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:41', 0, 1),
(387, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:41', 0, 1),
(388, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:41', 0, 1),
(389, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:41', 0, 1),
(390, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:42', 0, 1),
(391, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:22:42', 0, 1),
(392, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:23:54', 0, 1),
(393, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:23:54', 0, 1),
(394, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:23:54', 0, 1),
(395, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:23:54', 0, 1),
(396, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:23:54', 0, 1),
(397, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:23:54', 0, 1),
(398, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:23:54', 0, 1),
(399, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:43', 0, 1),
(400, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:43', 0, 1),
(401, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:43', 0, 1),
(402, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:43', 0, 1),
(403, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:44', 0, 1),
(404, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:44', 0, 1),
(405, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:44', 0, 1),
(406, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(407, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(408, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(409, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(410, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(411, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(412, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(413, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(414, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(415, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:45', 0, 1),
(416, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(417, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(418, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(419, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(420, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(421, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(422, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(423, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(424, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(425, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(426, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(427, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:46', 0, 1),
(428, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(429, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(430, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(431, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(432, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(433, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(434, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(435, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(436, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(437, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(438, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:47', 0, 1),
(439, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:48', 0, 1),
(440, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:48', 0, 1),
(441, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:48', 0, 1),
(442, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:48', 0, 1),
(443, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:48', 0, 1),
(444, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:48', 0, 1),
(445, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:48', 0, 1),
(446, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:49', 0, 1),
(447, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:24:49', 0, 1),
(448, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:03', 0, 1),
(449, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:03', 0, 1),
(450, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:03', 0, 1),
(451, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:03', 0, 1),
(452, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:03', 0, 1),
(453, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:03', 0, 1),
(454, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:04', 0, 1),
(455, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:06', 0, 1),
(456, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:06', 0, 1),
(457, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:06', 0, 1),
(458, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:07', 0, 1),
(459, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:07', 0, 1),
(460, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:07', 0, 1),
(461, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:07', 0, 1),
(462, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:28', 0, 1),
(463, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:28', 0, 1),
(464, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:28', 0, 1),
(465, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:28', 0, 1),
(466, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:28', 0, 1),
(467, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:28', 0, 1),
(468, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:28', 0, 1);
INSERT INTO `efox_activity` (`activity_id`, `module`, `action`, `user_id`, `target_id`, `target_url`, `browser`, `browser_version`, `ip`, `os`, `created_on`, `read`, `customer_id`) VALUES
(469, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:40', 0, 1),
(470, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:41', 0, 1),
(471, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:41', 0, 1),
(472, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:41', 0, 1),
(473, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:41', 0, 1),
(474, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:41', 0, 1),
(475, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:41', 0, 1),
(476, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:43', 0, 1),
(477, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:43', 0, 1),
(478, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:43', 0, 1),
(479, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:43', 0, 1),
(480, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:43', 0, 1),
(481, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:43', 0, 1),
(482, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:25:43', 0, 1),
(483, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:01', 0, 1),
(484, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:01', 0, 1),
(485, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:02', 0, 1),
(486, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:02', 0, 1),
(487, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:02', 0, 1),
(488, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:02', 0, 1),
(489, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:02', 0, 1),
(490, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:03', 0, 1),
(491, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:03', 0, 1),
(492, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:03', 0, 1),
(493, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:03', 0, 1),
(494, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:03', 0, 1),
(495, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:03', 0, 1),
(496, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:03', 0, 1),
(497, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:35', 0, 1),
(498, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:35', 0, 1),
(499, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:35', 0, 1),
(500, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:35', 0, 1),
(501, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:35', 0, 1),
(502, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:35', 0, 1),
(503, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:35', 0, 1),
(504, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:36', 0, 1),
(505, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:36', 0, 1),
(506, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:36', 0, 1),
(507, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:36', 0, 1),
(508, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:36', 0, 1),
(509, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:36', 0, 1),
(510, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:36', 0, 1),
(511, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(512, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(513, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(514, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(515, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(516, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(517, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(518, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(519, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:38', 0, 1),
(520, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:39', 0, 1),
(521, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:39', 0, 1),
(522, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:39', 0, 1),
(523, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:39', 0, 1),
(524, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:39', 0, 1),
(525, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:57', 0, 1),
(526, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:57', 0, 1),
(527, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:57', 0, 1),
(528, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:57', 0, 1),
(529, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:57', 0, 1),
(530, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:57', 0, 1),
(531, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:57', 0, 1),
(532, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:58', 0, 1),
(533, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:58', 0, 1),
(534, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:58', 0, 1),
(535, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:58', 0, 1),
(536, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:58', 0, 1),
(537, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:58', 0, 1),
(538, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:26:58', 0, 1),
(539, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:14', 0, 1),
(540, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:14', 0, 1),
(541, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:14', 0, 1),
(542, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:14', 0, 1),
(543, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:14', 0, 1),
(544, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:14', 0, 1),
(545, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:14', 0, 1),
(546, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:51', 0, 1),
(547, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:51', 0, 1),
(548, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:52', 0, 1),
(549, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:52', 0, 1),
(550, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:52', 0, 1),
(551, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:52', 0, 1),
(552, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:52', 0, 1),
(553, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:53', 0, 1),
(554, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:53', 0, 1),
(555, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:53', 0, 1),
(556, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:53', 0, 1),
(557, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:53', 0, 1),
(558, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:53', 0, 1),
(559, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:29:53', 0, 1),
(560, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:13', 0, 1),
(561, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:13', 0, 1),
(562, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:13', 0, 1),
(563, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:14', 0, 1),
(564, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:14', 0, 1),
(565, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:14', 0, 1),
(566, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:14', 0, 1),
(567, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:15', 0, 1),
(568, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:15', 0, 1),
(569, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:15', 0, 1),
(570, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:16', 0, 1),
(571, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:16', 0, 1),
(572, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:16', 0, 1),
(573, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:16', 0, 1),
(574, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:18', 0, 1),
(575, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:18', 0, 1),
(576, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:18', 0, 1),
(577, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:18', 0, 1),
(578, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:18', 0, 1),
(579, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:18', 0, 1),
(580, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:18', 0, 1),
(581, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:55', 0, 1),
(582, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:55', 0, 1),
(583, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:55', 0, 1),
(584, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:55', 0, 1),
(585, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:55', 0, 1),
(586, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:55', 0, 1),
(587, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:55', 0, 1),
(588, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:57', 0, 1),
(589, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:57', 0, 1),
(590, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:57', 0, 1),
(591, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:57', 0, 1),
(592, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:57', 0, 1),
(593, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:57', 0, 1),
(594, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:57', 0, 1),
(595, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:59', 0, 1),
(596, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:59', 0, 1),
(597, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:59', 0, 1),
(598, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:59', 0, 1),
(599, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:59', 0, 1),
(600, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:59', 0, 1),
(601, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:30:59', 0, 1),
(602, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:37', 0, 1),
(603, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:37', 0, 1),
(604, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:37', 0, 1),
(605, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:37', 0, 1),
(606, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:38', 0, 1),
(607, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:38', 0, 1),
(608, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:38', 0, 1),
(609, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:38', 0, 1),
(610, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:38', 0, 1),
(611, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:38', 0, 1),
(612, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(613, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(614, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(615, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(616, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(617, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(618, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(619, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:39', 0, 1),
(620, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:40', 0, 1),
(621, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:40', 0, 1),
(622, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:40', 0, 1),
(623, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:42', 0, 1),
(624, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:42', 0, 1),
(625, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:42', 0, 1),
(626, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:42', 0, 1),
(627, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:42', 0, 1),
(628, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:42', 0, 1),
(629, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:31:42', 0, 1),
(630, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:39', 0, 1),
(631, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:39', 0, 1),
(632, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:39', 0, 1),
(633, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:40', 0, 1),
(634, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:40', 0, 1),
(635, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:40', 0, 1),
(636, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:40', 0, 1),
(637, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:58', 0, 1),
(638, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:58', 0, 1),
(639, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:58', 0, 1),
(640, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:58', 0, 1),
(641, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:58', 0, 1),
(642, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:58', 0, 1),
(643, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:49:59', 0, 1),
(644, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:50:08', 0, 1),
(645, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:50:08', 0, 1),
(646, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:50:08', 0, 1),
(647, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:50:08', 0, 1),
(648, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:50:08', 0, 1),
(649, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:50:08', 0, 1),
(650, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:50:09', 0, 1),
(651, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:29', 0, 1),
(652, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:29', 0, 1),
(653, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:29', 0, 1),
(654, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:29', 0, 1),
(655, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:29', 0, 1),
(656, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:29', 0, 1),
(657, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:29', 0, 1),
(658, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:41', 0, 1),
(659, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:41', 0, 1),
(660, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:41', 0, 1),
(661, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:41', 0, 1),
(662, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:41', 0, 1),
(663, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:41', 0, 1),
(664, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:51:41', 0, 1),
(665, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:22', 0, 1),
(666, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:22', 0, 1),
(667, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:22', 0, 1),
(668, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:22', 0, 1),
(669, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:22', 0, 1),
(670, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:22', 0, 1),
(671, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:23', 0, 1),
(672, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:32', 0, 1),
(673, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:32', 0, 1),
(674, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:32', 0, 1),
(675, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:32', 0, 1),
(676, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:32', 0, 1),
(677, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:32', 0, 1),
(678, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:32', 0, 1),
(679, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:38', 0, 1),
(680, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:38', 0, 1),
(681, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:38', 0, 1),
(682, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:38', 0, 1),
(683, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:39', 0, 1),
(684, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:39', 0, 1),
(685, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:39', 0, 1),
(686, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:57', 0, 1),
(687, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:57', 0, 1),
(688, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:57', 0, 1),
(689, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:58', 0, 1),
(690, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:58', 0, 1),
(691, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:58', 0, 1),
(692, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 22:56:58', 0, 1),
(693, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:02:28', 0, 1),
(694, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:02:28', 0, 1),
(695, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:02:28', 0, 1),
(696, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:02:28', 0, 1),
(697, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:02:28', 0, 1),
(698, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:02:28', 0, 1),
(699, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:02:29', 0, 1),
(700, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:34:29', 0, 1),
(701, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:34:42', 0, 1),
(702, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:36', 0, 1),
(703, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:36', 0, 1),
(704, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:36', 0, 1),
(705, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:37', 0, 1),
(706, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:37', 0, 1),
(707, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:37', 0, 1),
(708, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:43', 0, 1),
(709, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:43', 0, 1),
(710, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:43', 0, 1),
(711, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:43', 0, 1),
(712, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:43', 0, 1),
(713, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:44', 0, 1),
(714, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:53', 0, 1),
(715, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:53', 0, 1),
(716, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:53', 0, 1),
(717, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:54', 0, 1),
(718, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:54', 0, 1),
(719, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:54', 0, 1),
(720, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:55', 0, 1),
(721, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:55', 0, 1),
(722, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:55', 0, 1),
(723, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:55', 0, 1),
(724, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:55', 0, 1),
(725, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:41:55', 0, 1),
(726, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:23', 0, 1),
(727, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:23', 0, 1),
(728, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:23', 0, 1),
(729, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:24', 0, 1),
(730, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:24', 0, 1),
(731, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:24', 0, 1),
(732, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:42', 0, 1),
(733, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:42', 0, 1),
(734, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:42', 0, 1),
(735, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:42', 0, 1),
(736, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:42', 0, 1),
(737, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:42', 0, 1),
(738, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:47', 0, 1),
(739, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:47', 0, 1),
(740, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:47', 0, 1),
(741, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:47', 0, 1),
(742, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:47', 0, 1),
(743, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:42:47', 0, 1),
(744, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:43:56', 0, 1),
(745, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:43:56', 0, 1),
(746, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:43:57', 0, 1),
(747, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:43:57', 0, 1),
(748, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:43:57', 0, 1),
(749, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:43:57', 0, 1),
(750, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:43:57', 0, 1),
(751, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:07', 0, 1),
(752, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:07', 0, 1),
(753, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:07', 0, 1),
(754, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:07', 0, 1),
(755, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:07', 0, 1),
(756, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:07', 0, 1),
(757, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:08', 0, 1),
(758, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:15', 0, 1),
(759, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:15', 0, 1),
(760, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:15', 0, 1),
(761, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:15', 0, 1),
(762, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:15', 0, 1),
(763, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:15', 0, 1),
(764, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:15', 0, 1),
(765, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:17', 0, 1),
(766, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:17', 0, 1),
(767, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:17', 0, 1),
(768, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:18', 0, 1),
(769, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:18', 0, 1),
(770, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:18', 0, 1),
(771, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:18', 0, 1),
(772, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:21', 0, 1),
(773, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:21', 0, 1),
(774, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:21', 0, 1),
(775, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:21', 0, 1),
(776, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:22', 0, 1),
(777, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:22', 0, 1),
(778, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:22', 0, 1),
(779, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:29', 0, 1),
(780, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:30', 0, 1),
(781, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:30', 0, 1),
(782, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:30', 0, 1),
(783, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:30', 0, 1),
(784, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:30', 0, 1),
(785, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:30', 0, 1),
(786, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:31', 0, 1),
(787, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:31', 0, 1),
(788, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:31', 0, 1),
(789, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:31', 0, 1),
(790, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:32', 0, 1),
(791, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:32', 0, 1),
(792, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:32', 0, 1),
(793, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:37', 0, 1),
(794, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:37', 0, 1),
(795, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:37', 0, 1),
(796, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:37', 0, 1),
(797, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:37', 0, 1),
(798, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:37', 0, 1),
(799, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:44:37', 0, 1),
(800, 'menu', NULL, 1, 8, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:37', 0, 1),
(801, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:49', 0, 1),
(802, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:50', 0, 1),
(803, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:50', 0, 1),
(804, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:50', 0, 1),
(805, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:50', 0, 1),
(806, 'menu', NULL, 1, 8, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:50', 0, 1),
(807, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:50', 0, 1),
(808, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:50', 0, 1),
(809, 'menu', NULL, 1, 9, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:52:53', 0, 1),
(810, 'menu', NULL, 1, 1, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(811, 'menu', NULL, 1, 2, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(812, 'menu', NULL, 1, 3, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(813, 'menu', NULL, 1, 5, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(814, 'menu', NULL, 1, 4, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(815, 'menu', NULL, 1, 8, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(816, 'menu', NULL, 1, 7, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(817, 'menu', NULL, 1, 6, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(818, 'menu', NULL, 1, 9, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:53:01', 0, 1),
(819, 'menu', NULL, 1, 10, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:54:58', 0, 1),
(820, 'menu', NULL, 1, 10, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:55:02', 0, 1),
(821, 'menu', NULL, 1, 10, NULL, 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-07 23:55:04', 0, 1),
(822, 'slider', 'updated a slider', 1, 1, '/content/slider/detail/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-08 01:15:28', 0, 1),
(823, 'slider', 'created a slider', 1, 2, '/content/slider/detail/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-08 01:19:53', 0, 1),
(824, 'slider', 'created a slider', 1, 3, '/content/slider/detail/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-08 01:20:28', 0, 1),
(825, 'slider', 'updated a slider', 1, 3, '/content/slider/detail/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-08 01:20:33', 0, 1),
(826, 'slider', 'updated a slider', 1, 3, '/content/slider/detail/', 'Firefox', '27.0', '127.0.0.1', 'Windows 7', '2014-03-08 01:20:36', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `efox_customer`
--

CREATE TABLE IF NOT EXISTS `efox_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expiry_date` date NOT NULL DEFAULT '0000-00-00',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `efox_customer`
--

INSERT INTO `efox_customer` (`customer_id`, `username`, `active`, `expiry_date`, `created_on`, `created_by`) VALUES
(1, 'duyanhvn', 1, '2014-03-21', NULL, NULL),
(2, 'tuanda', 1, '2014-03-28', NULL, NULL),
(3, 'duyanh980', 1, '2014-03-21', '2014-03-06 21:26:28', 6);

-- --------------------------------------------------------

--
-- Table structure for table `efox_customer_language`
--

CREATE TABLE IF NOT EXISTS `efox_customer_language` (
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`language_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `efox_customer_language`
--

INSERT INTO `efox_customer_language` (`language_id`, `customer_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `efox_domain`
--

CREATE TABLE IF NOT EXISTS `efox_domain` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_on` datetime DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `efox_domain`
--

INSERT INTO `efox_domain` (`domain_id`, `domain`, `active`, `created_by`, `created_on`, `modify_by`, `modify_on`, `deleted`, `deleted_on`, `customer_id`) VALUES
(1, 'customer.com', 1, NULL, NULL, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `efox_email_queue`
--

CREATE TABLE IF NOT EXISTS `efox_email_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `message` text,
  `to` longtext,
  `send_success` longtext,
  `send_failed` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `efox_email_queue`
--

INSERT INTO `efox_email_queue` (`id`, `subject`, `message`, `to`, `send_success`, `send_failed`) VALUES
(1, 'hhh', 'asdasd<br/>ha duy anh', '["keith@jupitech.sg","enternity90@gmail","coder.notepad@gmail.com"]', '["keith@jupitech.sg","coder.notepad@gmail.com"]', '["enternity90@gmail"]');

-- --------------------------------------------------------

--
-- Table structure for table `efox_language`
--

CREATE TABLE IF NOT EXISTS `efox_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `efox_language`
--

INSERT INTO `efox_language` (`language_id`, `code`, `name`) VALUES
(1, 'vn', 'Tieng Viet'),
(2, 'en', 'English'),
(3, 'ch', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `efox_login_attempts`
--

CREATE TABLE IF NOT EXISTS `efox_login_attempts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) NOT NULL,
  `login` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `efox_menu`
--

CREATE TABLE IF NOT EXISTS `efox_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` enum('_self','_top','_blank') COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `efox_menu`
--

INSERT INTO `efox_menu` (`menu_id`, `name`, `image`, `url`, `target`, `parent_id`, `customer_id`, `order`, `created_by`, `created_on`, `modify_by`, `modify_on`, `deleted`) VALUES
(1, 'Trang chu', 'assets/uploads/8d6ab84ca2af9fccd4e4048694176ebf/ce', 'Home', '_self', 0, 1, 1, NULL, NULL, 1, '2014-03-07 16:53:01', 0),
(2, 'About', '', '', '_self', 0, 1, 2, NULL, NULL, 1, '2014-03-07 16:53:01', 0),
(3, 'Products', '', '', '_self', 0, 1, 3, NULL, NULL, 1, '2014-03-07 16:53:01', 0),
(4, 'T-Short', '', '', '_self', 3, 1, 2, NULL, NULL, 1, '2014-03-07 16:53:01', 0),
(5, 'Shoes', '', '', '_self', 3, 1, 1, NULL, NULL, 1, '2014-03-07 16:53:01', 0),
(6, 'News', '', '', '_self', 4, 1, 3, NULL, NULL, 1, '2014-03-07 16:53:01', 0),
(7, 'Contact', '', '', '_self', 4, 1, 2, NULL, NULL, 1, '2014-03-07 16:53:01', 0),
(8, 'Contact', NULL, 'Contact', '_self', 4, 1, 1, 1, '2014-03-07 16:52:37', 1, '2014-03-07 16:53:01', 0),
(9, 'Contact', NULL, 'Contact', '_self', 0, 1, 4, 1, '2014-03-07 16:52:53', 1, '2014-03-07 16:53:01', 0),
(10, 'Contact2', NULL, 'Contact2', '_self', 4, 1, 0, 1, '2014-03-07 16:54:57', 1, '2014-03-07 16:55:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `efox_menu_backend`
--

CREATE TABLE IF NOT EXISTS `efox_menu_backend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `target` enum('_self','_blank','_top') DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT '0',
  `parent` int(11) DEFAULT '0',
  `image` varchar(250) DEFAULT NULL,
  `roles` text,
  `created_on` datetime DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `efox_menu_backend`
--

INSERT INTO `efox_menu_backend` (`id`, `name`, `url`, `target`, `active`, `order`, `parent`, `image`, `roles`, `created_on`, `modify_on`, `created_by`, `modify_by`) VALUES
(1, 'Dashboard', '/admin/content', '_self', 1, 0, 0, 'assets/uploads/8d6ab84ca2af9fccd4e4048694176ebf/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/dashboard.png', '["1","2"]', NULL, NULL, NULL, NULL),
(2, 'Users', '/admin/settings/users', '_self', 1, 2, 0, 'assets/uploads/8d6ab84ca2af9fccd4e4048694176ebf/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/users.png', '["1","2"]', NULL, '2014-03-06 15:36:19', NULL, 6),
(4, 'Settings', '/admin/settings/system', '_self', 1, 4, 0, 'assets/uploads/8d6ab84ca2af9fccd4e4048694176ebf/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/system.png', '["1","2"]', NULL, '2014-03-06 15:36:19', NULL, 6),
(11, 'Roles', '/admin/settings/roles', '_self', 0, 0, 4, '', '["1"]', NULL, NULL, NULL, NULL),
(20, 'Permissions', '/admin/settings/permissions', '_self', 0, 1, 4, '', '["1"]', NULL, '2014-03-06 15:36:19', NULL, 6),
(30, 'Slider', '/admin/content/slider', '_self', 1, 3, 0, NULL, '["1"]', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `efox_permissions`
--

CREATE TABLE IF NOT EXISTS `efox_permissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `efox_permissions`
--

INSERT INTO `efox_permissions` (`permission_id`, `name`, `description`, `status`) VALUES
(1, 'Site.BackEnd.Login', '', 'active'),
(2, 'Site.FrontEnd.Login', '', 'active'),
(4, 'Site.Roles.Manage', '', 'active'),
(5, 'Permission.Users.Manage', '', 'active'),
(6, 'Site.Administrator.Manage', '', 'active'),
(7, 'Site.Customers.Manage', '', 'active'),
(8, 'Site.Menu.Manage', '', 'active'),
(9, 'Site.Settings.Manage', '', 'active'),
(12, 'Emailer.Queue.Run', '', 'active'),
(13, 'Emailer.Queue.Update', '', 'active'),
(14, 'Emailer.Queue.Delete', '', 'active'),
(16, 'Site.Permissions.Manage', '', 'active'),
(18, 'Site.Customer.Manage', 'To manage the access control permissions for the  role', 'active'),
(19, 'Permission.Slider.Manage', '', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `efox_roles`
--

CREATE TABLE IF NOT EXISTS `efox_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  `login_destination` varchar(255) NOT NULL DEFAULT '/',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `default_context` varchar(255) NOT NULL DEFAULT 'content',
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `efox_roles`
--

INSERT INTO `efox_roles` (`role_id`, `role_name`, `description`, `default`, `can_delete`, `login_destination`, `deleted`, `default_context`, `customer_id`) VALUES
(1, 'Administrator', 'Has full control over every aspect of the site.', 0, 0, '/admin/settings/users', 0, 'content', 1),
(2, 'Customer', '', 1, 1, '/admin/settings/users', 0, 'content', 2);

-- --------------------------------------------------------

--
-- Table structure for table `efox_role_permissions`
--

CREATE TABLE IF NOT EXISTS `efox_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `efox_role_permissions`
--

INSERT INTO `efox_role_permissions` (`role_id`, `permission_id`, `customer_id`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 12, 0),
(1, 13, 0),
(1, 14, 0),
(1, 16, 0),
(1, 17, 0),
(1, 18, 0),
(1, 19, 0),
(2, 1, 0),
(2, 5, 0),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 17, 0),
(2, 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `efox_sessions`
--

CREATE TABLE IF NOT EXISTS `efox_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `efox_sessions`
--

INSERT INTO `efox_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('754eaded7b51addbd81634f569754429', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', 1391615995, 'a:11:{s:9:"user_data";s:0:"";s:7:"user_id";s:1:"1";s:8:"username";s:5:"admin";s:5:"email";s:17:"admin@jupitech.sg";s:6:"avatar";s:163:"assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/hinh-xam-ca-chep-dep-19-cua-nam-fuong-tattoo3.jpg";s:11:"auth_custom";s:17:"admin@jupitech.sg";s:10:"user_token";s:40:"53f6b34d3fb0e7c57372f6c5991ef137aec66fb0";s:8:"identity";s:17:"admin@jupitech.sg";s:7:"role_id";s:1:"1";s:9:"logged_in";b:1;s:13:"previous_page";s:41:"http://localhost/php/admin/settings/users";}');

-- --------------------------------------------------------

--
-- Table structure for table `efox_settings`
--

CREATE TABLE IF NOT EXISTS `efox_settings` (
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `efox_settings`
--

INSERT INTO `efox_settings` (`name`, `value`, `customer_id`) VALUES
('maintenance.content', '<p>maintenance</p>\r\n', 1),
('maintenance.mode', '0', 1),
('meta.description', NULL, 1),
('meta.keyword', NULL, 1),
('meta.title', 'Monster', 1),
('site.language', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `efox_slider`
--

CREATE TABLE IF NOT EXISTS `efox_slider` (
  `slider_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `customer_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `efox_slider`
--

INSERT INTO `efox_slider` (`slider_id`, `image`, `title`, `intro`, `active`, `customer_id`, `created_on`, `created_by`, `modify_on`, `modify_by`, `deleted`) VALUES
(1, 'assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/1558440_393198914151035_1640511908_n5.jpg', 'Test', 'asdasd', 1, 1, NULL, NULL, '2014-03-07 18:15:28', 1, 0),
(2, 'assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/1558440_393198914151035_1640511908_n6.jpg', '234234', '234234', 1, 1, '2014-03-07 18:19:53', 1, NULL, 1, 0),
(3, 'assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/1558440_393198914151035_1640511908_n6.jpg', '234234', '234234', 1, 1, '2014-03-07 18:20:28', 1, '2014-03-07 18:20:36', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `efox_system`
--

CREATE TABLE IF NOT EXISTS `efox_system` (
  `name` varchar(30) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `efox_system`
--

INSERT INTO `efox_system` (`name`, `value`) VALUES
('upload.documents', ''),
('upload.images', 'jpg,png,jpeg'),
('upload.media', ''),
('upload.size', '2048');

-- --------------------------------------------------------

--
-- Table structure for table `efox_users`
--

CREATE TABLE IF NOT EXISTS `efox_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '4',
  `email` varchar(120) NOT NULL,
  `first_name` varchar(30) NOT NULL DEFAULT '',
  `last_name` varchar(30) NOT NULL,
  `password_hash` char(60) NOT NULL,
  `reset_hash` varchar(40) DEFAULT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(40) NOT NULL DEFAULT '',
  `reset_by` int(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `modify_by` int(11) DEFAULT NULL,
  `modify_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `avatar` varchar(250) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `efox_users`
--

INSERT INTO `efox_users` (`id`, `role_id`, `email`, `first_name`, `last_name`, `password_hash`, `reset_hash`, `last_login`, `last_ip`, `reset_by`, `deleted`, `modify_by`, `modify_on`, `active`, `avatar`, `birthday`, `created_by`, `created_on`, `customer_id`) VALUES
(1, 1, 'keith@jupitech.sg', 'Duy Anh', 'Ha', '$2a$08$nEBztpwD7RMORzWSlx18RezmogItnin8ke5q6fejSFJbHYeJd1q5G', '04b953fa45286657763277530e27e1f794c59465', '2014-03-07 20:34:03', '127.0.0.1', 1392266953, 0, 1, '2014-03-07 13:34:03', 1, 'assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/hinh-xam-ca-chep-dep-19-cua-nam-fuong-tattoo3.jpg', '1990-01-22', 1, '2014-01-21 09:18:27', 1),
(2, 1, 'customer@jupitech.sg', 'Jupitech', 'test', '$2a$08$3bPGnaQj8nwDdslQ1QW1OedvZuko0degh6bjT53LKUAzKhKpgh14S', NULL, '2014-02-10 10:27:17', '::1', NULL, 0, 1, '2014-03-07 14:18:15', 1, 'assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/2014-03-02_20-55_Windows_Media_Player.jpg', '2014-02-06', 1, '2014-02-06 02:07:51', 1),
(3, 1, 'admin@jupitech.sg', 'Developer', 'j', '$2a$08$.sMgePH1RxmyxWmRQ3RbPuaicQ2X26pyZ0lBY0CC/K6wJDVtFnVQS', NULL, '2014-03-02 20:50:18', '127.0.0.1', NULL, 0, 3, '2014-03-02 13:50:18', 1, '', '2014-02-10', 1, '2014-02-10 08:58:41', 2),
(4, 1, 'haduyanh@gmail.com', 'Test', 'User', '$2a$08$53UILJt2wmAUlszWVyD3rOPPUU/onShqsAamRL55JA6N7hxSxA7py', NULL, '0000-00-00 00:00:00', '', NULL, 0, 1, '0000-00-00 00:00:00', 1, 'assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/0pbembhfqj6e5joe0mam1.jpg', '2014-03-21', 1, '2014-03-01 11:41:12', 2),
(5, 1, 'abc@Gmail.com', 'ha', 'anh', '$2a$08$uWiKplvhskj1iUMprio5O.a8McIO8N.X/31Zw32mSHTWBlNGzo3qq', NULL, '0000-00-00 00:00:00', '', NULL, 0, 1, '2014-03-02 14:10:36', 1, 'http://customer.com/assets/uploads/aec9f4efc5a055bbd053f220538c61e0/cee8d6b7ce52554fd70354e37bbf44a2/ff44570aca8241914870afbc310cdb85/1558440_393198914151035_1640511908_n1.jpg', '2014-03-19', 1, '2014-03-02 12:59:04', 1),
(6, 1, 'coder.notepad@gmail.com', 'ha', 'duy anh', '$2a$08$Zf04uZmRjDUHDJMuPdDW2uKRo.nyPlf6g9gVSruHHAnAtoi6TluNy', NULL, '2014-03-06 21:28:15', '127.0.0.1', NULL, 0, 6, '2014-03-06 14:28:15', 1, NULL, NULL, 1, '2014-03-06 14:26:28', 3);

-- --------------------------------------------------------

--
-- Table structure for table `efox_user_cookies`
--

CREATE TABLE IF NOT EXISTS `efox_user_cookies` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL,
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `efox_user_cookies`
--

INSERT INTO `efox_user_cookies` (`user_id`, `token`, `created_on`) VALUES
(1, 'zH45UtYVzZSvGS5zrVK7Uvzt1It3s7wuJV5ltjDYUWoIRvxrvJz9xcVpdCZ4yQx6uPG2C8IxBCWLLNFUxJZExQDE9s1emov88er5EvhUOo0ZypIIwFyRiYBQrT8u7vMP', '2014-01-24 03:05:22');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
