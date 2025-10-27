-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2025 at 12:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waslsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `road_no` varchar(255) DEFAULT NULL,
  `flat_no` varchar(255) DEFAULT NULL,
  `house_no` varchar(255) DEFAULT NULL,
  `address_line` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_coupons`
--

CREATE TABLE `admin_coupons` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `media_id`, `shop_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(4, '1', 30, 3, NULL, 1, '2025-08-23 20:11:50', '2025-08-23 20:11:50'),
(11, NULL, 133, 4, NULL, 1, '2025-08-26 13:08:53', '2025-08-26 13:08:53'),
(12, NULL, 134, 4, NULL, 1, '2025-08-26 13:23:24', '2025-08-26 13:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_views`
--

CREATE TABLE `blog_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_buy_now` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `access_token`, `product_id`, `shop_id`, `is_buy_now`, `quantity`, `color`, `size`, `unit`, `created_at`, `updated_at`) VALUES
(14, 8, NULL, 4, 4, 0, 2, NULL, NULL, NULL, '2025-08-26 14:14:41', '2025-08-26 14:14:41'),
(16, 8, NULL, 5, 4, 1, 1, NULL, NULL, NULL, '2025-08-26 14:14:47', '2025-08-26 14:14:47'),
(17, 8, NULL, 5, 4, 0, 3, NULL, NULL, NULL, '2025-08-26 14:14:52', '2025-08-26 14:15:28'),
(18, 8, NULL, 15, 4, 0, 1, NULL, NULL, NULL, '2025-08-26 18:05:12', '2025-08-26 18:05:12'),
(19, 8, NULL, 8, 4, 0, 1, NULL, NULL, NULL, '2025-08-26 18:06:13', '2025-08-26 18:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'other',
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_ar`, `type`, `media_id`, `description`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(6, 'طابعات', NULL, 'other', 51, 'كل ما يخص الطابعات وماركاتها', 1, '2025-08-25 12:06:15', '2025-08-25 12:06:15', 3),
(7, 'قسم القرطاسية', NULL, 'other', 52, 'قرطاسية وجميع ما يحتاجه الطالب من لوام مدرسية', 1, '2025-08-25 13:11:10', '2025-08-25 13:11:42', 4),
(9, 'الملازم المدرسية', NULL, 'other', 57, 'الملازم المدرسية لجميع المراحل الدراسية', 1, '2025-08-25 15:04:08', '2025-08-25 15:04:08', 4),
(11, 'اجهزة شبكات', NULL, 'other', 70, NULL, 1, '2025-08-25 16:19:19', '2025-08-25 16:19:19', 3),
(12, 'قطع الكومبيوتر الشخصي', NULL, 'other', 71, NULL, 1, '2025-08-25 16:23:35', '2025-08-25 16:23:35', 3),
(13, 'مجهز طاقة', NULL, 'other', 72, NULL, 1, '2025-08-25 16:25:44', '2025-08-25 16:25:44', 3),
(14, 'كامرات المراقبة', NULL, 'other', 73, NULL, 1, '2025-08-25 16:30:26', '2025-08-25 16:30:26', 3),
(15, 'شاشات', NULL, 'other', 74, NULL, 1, '2025-08-25 16:31:33', '2025-08-25 16:31:33', 3),
(16, 'الاكسسوارات', NULL, 'other', 75, NULL, 1, '2025-08-25 16:32:56', '2025-08-25 16:32:56', 3),
(17, 'الكمبيوتر المحمول', NULL, 'other', 76, NULL, 1, '2025-08-25 16:35:12', '2025-08-25 16:35:12', 3),
(18, 'التخفيضات والعروض', NULL, 'other', 77, NULL, 1, '2025-08-25 16:37:44', '2025-08-25 16:37:44', 3),
(21, 'الحاسوب الكل في واحد', NULL, 'other', 80, 'الحاسوب المكتبي', 1, '2025-08-25 16:44:05', '2025-08-25 20:13:36', 3);

-- --------------------------------------------------------

--
-- Table structure for table `category_subcategories`
--

CREATE TABLE `category_subcategories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_subcategories`
--

INSERT INTO `category_subcategories` (`category_id`, `sub_category_id`) VALUES
(7, 12),
(7, 13),
(7, 16),
(9, 18),
(6, 19),
(7, 20),
(7, 21),
(7, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `color_code` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `name_ar`, `shop_id`, `color_code`, `is_active`, `created_at`, `updated_at`) VALUES
(10, 'اصفر', NULL, 1, '#ffff00', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(11, 'ذهبي', NULL, 1, '#ffd700', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(12, 'فضي', NULL, 1, '#c0c0c0', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(13, 'بني', NULL, 1, '#8b4513', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(14, 'سماوي', NULL, 1, '#00ffff', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(15, 'تركواز', NULL, 1, '#40e0d0', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(16, 'نيلي', NULL, 1, '#4b0082', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(17, 'ازرق فاتح', NULL, 1, '#add8e6', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(18, 'اخضر فاتح', NULL, 1, '#90ee90', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(19, 'ليموني', NULL, 1, '#32cd32', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(20, 'زيتي', NULL, 1, '#556b2f', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(21, 'ازرق غامق', NULL, 1, '#00008b', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(22, 'اخضر غامق', NULL, 1, '#006400', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(23, 'رمادي فاتح', NULL, 1, '#d3d3d3', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(24, 'رمادي غامق', NULL, 1, '#a9a9a9', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(25, 'بيج', NULL, 1, '#f5f5dc', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(26, 'كحلي', NULL, 1, '#001f3f', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(27, 'برونزي', NULL, 1, '#cd7f32', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(28, 'عاجي', NULL, 1, '#fffff0', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(29, 'قرمزي', NULL, 1, '#dc143c', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(30, 'مشمشي', NULL, 1, '#fbceb1', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(31, 'خردلي', NULL, 1, '#ffdb58', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(32, 'فيـرزي', NULL, 1, '#50c878', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(33, 'ازرق ملكي', NULL, 1, '#4169e1', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(34, 'ازرق سماوي فاتح', NULL, 1, '#87cefa', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(35, 'بنفسجي فاتح', NULL, 1, '#dda0dd', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(36, 'زهري فاتح', NULL, 1, '#ffb6c1', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(37, 'كريمي', NULL, 1, '#fffdd0', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(38, 'احمر غامق', NULL, 1, '#8b0000', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(39, 'موف', NULL, 1, '#b266ff', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(40, 'ارجواني', NULL, 1, '#800080', 1, '2025-08-25 14:42:11', '2025-08-25 14:42:11'),
(41, 'ابيض', NULL, 1, '#ffffff', 1, '2025-08-25 17:42:36', '2025-08-25 17:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `messenger` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `phone`, `email`, `whatsapp`, `messenger`, `created_at`, `updated_at`) VALUES
(1, '+9647830200030', 'info@wasl.site', '+9647830200030', NULL, '2025-08-19 18:24:41', '2025-08-19 18:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `numeric_code` varchar(5) DEFAULT NULL,
  `phone_code` varchar(10) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `native` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `emoji` varchar(20) DEFAULT NULL,
  `emojiU` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `numeric_code`, `phone_code`, `capital`, `currency`, `currency_name`, `currency_symbol`, `native`, `region`, `latitude`, `longitude`, `emoji`, `emojiU`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', '004', '93', 'Kabul', 'AFN', 'Afghan afghani', '؋', 'افغانستان', 'Asia', '-74.65000000', '4.48000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(2, 'Antigua and Barbuda', '028', '1', 'St. John\'s', 'XCD', 'Eastern Caribbean dollar', '$', 'Antigua and Barbuda', 'Americas', '17.05000000', '-61.80000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(3, 'Argentina', '032', '54', 'Buenos Aires', 'ARS', 'Argentine peso', '$', 'Argentina', 'Americas', '-34.00000000', '-64.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(4, 'Armenia', '051', '374', 'Yerevan', 'AMD', 'Armenian dram', '֏', 'Հայաստան', 'Asia', '40.00000000', '45.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(5, 'Aruba', '533', '297', 'Oranjestad', 'AWG', 'Aruban florin', 'ƒ', 'Aruba', 'Americas', '12.50000000', '-69.96666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(6, 'Australia', '036', '61', 'Canberra', 'AUD', 'Australian dollar', '$', 'Australia', 'Oceania', '-27.00000000', '133.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(7, 'Austria', '040', '43', 'Vienna', 'EUR', 'Euro', '€', 'Österreich', 'Europe', '47.33333333', '13.33333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(8, 'Azerbaijan', '031', '994', 'Baku', 'AZN', 'Azerbaijani manat', 'm', 'Azərbaycan', 'Asia', '40.50000000', '47.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(9, 'Bahrain', '048', '973', 'Manama', 'BHD', 'Bahraini dinar', '.د.ب', '‏البحرين', 'Asia', '26.00000000', '50.55000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(10, 'Bangladesh', '050', '880', 'Dhaka', 'BDT', 'Bangladeshi taka', '৳', 'Bangladesh', 'Asia', '24.00000000', '90.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(11, 'Barbados', '052', '1', 'Bridgetown', 'BBD', 'Barbadian dollar', 'Bds$', 'Barbados', 'Americas', '13.16666666', '-59.53333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(12, 'Belarus', '112', '375', 'Minsk', 'BYN', 'Belarusian ruble', 'Br', 'Белару́сь', 'Europe', '53.00000000', '28.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(13, 'Belgium', '056', '32', 'Brussels', 'EUR', 'Euro', '€', 'België', 'Europe', '50.83333333', '4.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(14, 'Belize', '084', '501', 'Belmopan', 'BZD', 'Belize dollar', '$', 'Belize', 'Americas', '17.25000000', '-88.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(15, 'Benin', '204', '229', 'Porto-Novo', 'XOF', 'West African CFA franc', 'CFA', 'Bénin', 'Africa', '9.50000000', '2.25000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(16, 'Bermuda', '060', '1', 'Hamilton', 'BMD', 'Bermudian dollar', '$', 'Bermuda', 'Americas', '32.33333333', '-64.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(17, 'Bhutan', '064', '975', 'Thimphu', 'BTN', 'Bhutanese ngultrum', 'Nu.', 'ʼbrug-yul', 'Asia', '27.50000000', '90.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(18, 'Bolivia', '068', '591', 'Sucre', 'BOB', 'Bolivian boliviano', 'Bs.', 'Bolivia', 'Americas', '-10.00000000', '-55.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(19, 'British Indian Ocean Territory', '086', '246', 'Diego Garcia', 'USD', 'United States dollar', '$', 'British Indian Ocean Territory', 'Africa', '60.00000000', '-95.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(20, 'Cape Verde', '132', '238', 'Praia', 'CVE', 'Cape Verdean escudo', '$', 'Cabo Verde', 'Africa', '-30.00000000', '-71.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(21, 'China', '156', '86', 'Beijing', 'CNY', 'Chinese yuan', '¥', '中国', 'Asia', '35.00000000', '105.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(22, 'Christmas Island', '162', '61', 'Flying Fish Cove', 'AUD', 'Australian dollar', '$', 'Christmas Island', 'Oceania', '-10.50000000', '105.66666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(23, 'Cocos (Keeling) Islands', '166', '61', 'West Island', 'AUD', 'Australian dollar', '$', 'Cocos (Keeling) Islands', 'Oceania', '-12.50000000', '96.83333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(24, 'Colombia', '170', '57', 'Bogotá', 'COP', 'Colombian peso', '$', 'Colombia', 'Americas', '4.00000000', '-72.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(25, 'Comoros', '174', '269', 'Moroni', 'KMF', 'Comorian franc', 'CF', 'Komori', 'Africa', '-12.16666666', '44.25000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(26, 'Congo', '178', '242', 'Brazzaville', 'XAF', 'Central African CFA franc', 'FC', 'République du Congo', 'Africa', '-1.00000000', '15.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(27, 'Cook Islands', '184', '682', 'Avarua', 'NZD', 'Cook Islands dollar', '$', 'Cook Islands', 'Oceania', '-21.23333333', '-159.76666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(28, 'Costa Rica', '188', '506', 'San Jose', 'CRC', 'Costa Rican colón', '₡', 'Costa Rica', 'Americas', '10.00000000', '-84.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(29, 'Cote D\'Ivoire (Ivory Coast)', '384', '225', 'Yamoussoukro', 'XOF', 'West African CFA franc', 'CFA', NULL, 'Africa', '8.00000000', '-5.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(30, 'Croatia', '191', '385', 'Zagreb', 'HRK', 'Croatian kuna', 'kn', 'Hrvatska', 'Europe', '45.16666666', '15.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(31, 'Cuba', '192', '53', 'Havana', 'CUP', 'Cuban peso', '$', 'Cuba', 'Americas', '21.50000000', '-80.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(32, 'Curaçao', '531', '599', 'Willemstad', 'ANG', 'Netherlands Antillean guilder', 'ƒ', 'Curaçao', 'Americas', '12.11666700', '-68.93333300', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(33, 'Cyprus', '196', '357', 'Nicosia', 'EUR', 'Euro', '€', 'Κύπρος', 'Europe', '35.00000000', '33.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(34, 'Czech Republic', '203', '420', 'Prague', 'CZK', 'Czech koruna', 'Kč', 'Česká republika', 'Europe', '49.75000000', '15.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(35, 'Democratic Republic of the Congo', '180', '243', 'Kinshasa', 'CDF', 'Congolese Franc', 'FC', 'République démocratique du Congo', 'Africa', '0.00000000', '25.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(36, 'Denmark', '208', '45', 'Copenhagen', 'DKK', 'Danish krone', 'Kr.', 'Danmark', 'Europe', '56.00000000', '10.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(37, 'Djibouti', '262', '253', 'Djibouti', 'DJF', 'Djiboutian franc', 'Fdj', 'Djibouti', 'Africa', '11.50000000', '43.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(38, 'Dominica', '212', '1', 'Roseau', 'XCD', 'Eastern Caribbean dollar', '$', 'Dominica', 'Americas', '15.41666666', '-61.33333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(39, 'Dominican Republic', '214', '1', 'Santo Domingo', 'DOP', 'Dominican peso', '$', 'República Dominicana', 'Americas', '19.00000000', '-70.66666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(40, 'Ecuador', '218', '593', 'Quito', 'USD', 'United States dollar', '$', 'Ecuador', 'Americas', '-2.00000000', '-77.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(41, 'Egypt', '818', '20', 'Cairo', 'EGP', 'Egyptian pound', 'ج.م', 'مصر‎', 'Africa', '27.00000000', '30.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(42, 'El Salvador', '222', '503', 'San Salvador', 'USD', 'United States dollar', '$', 'El Salvador', 'Americas', '13.83333333', '-88.91666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(43, 'Equatorial Guinea', '226', '240', 'Malabo', 'XAF', 'Central African CFA franc', 'FCFA', 'Guinea Ecuatorial', 'Africa', '2.00000000', '10.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(44, 'Eritrea', '232', '291', 'Asmara', 'ERN', 'Eritrean nakfa', 'Nfk', 'ኤርትራ', 'Africa', '15.00000000', '39.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(45, 'Estonia', '233', '372', 'Tallinn', 'EUR', 'Euro', '€', 'Eesti', 'Europe', '59.00000000', '26.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(46, 'Eswatini', '748', '268', 'Mbabane', 'SZL', 'Lilangeni', 'E', 'Swaziland', 'Africa', '-26.50000000', '31.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(47, 'Ethiopia', '231', '251', 'Addis Ababa', 'ETB', 'Ethiopian birr', 'Nkf', 'ኢትዮጵያ', 'Africa', '8.00000000', '38.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(48, 'Falkland Islands', '238', '500', 'Stanley', 'FKP', 'Falkland Islands pound', '£', 'Falkland Islands', 'Americas', '-51.75000000', '-59.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(49, 'Faroe Islands', '234', '298', 'Torshavn', 'DKK', 'Danish krone', 'Kr.', 'Føroyar', 'Europe', '62.00000000', '-7.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(50, 'Fiji Islands', '242', '679', 'Suva', 'FJD', 'Fijian dollar', 'FJ$', 'Fiji', 'Oceania', '-18.00000000', '175.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(51, 'Finland', '246', '358', 'Helsinki', 'EUR', 'Euro', '€', 'Suomi', 'Europe', '64.00000000', '26.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(52, 'France', '250', '33', 'Paris', 'EUR', 'Euro', '€', 'France', 'Europe', '46.00000000', '2.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(53, 'French Guiana', '254', '594', 'Cayenne', 'EUR', 'Euro', '€', 'Guyane française', 'Americas', '4.00000000', '-53.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(54, 'French Polynesia', '258', '689', 'Papeete', 'XPF', 'CFP franc', '₣', 'Polynésie française', 'Oceania', '-15.00000000', '-140.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(55, 'French Southern Territories', '260', '262', 'Port-aux-Francais', 'EUR', 'Euro', '€', 'Territoire des Terres australes et antarctiques fr', 'Africa', '-49.25000000', '69.16700000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(56, 'Gabon', '266', '241', 'Libreville', 'XAF', 'Central African CFA franc', 'FCFA', 'Gabon', 'Africa', '-1.00000000', '11.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(57, 'Georgia', '268', '995', 'Tbilisi', 'GEL', 'Georgian lari', 'ლ', 'საქართველო', 'Asia', '42.00000000', '43.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(58, 'Germany', '276', '49', 'Berlin', 'EUR', 'Euro', '€', 'Deutschland', 'Europe', '51.00000000', '9.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(59, 'Ghana', '288', '233', 'Accra', 'GHS', 'Ghanaian cedi', 'GH₵', 'Ghana', 'Africa', '8.00000000', '-2.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(60, 'Gibraltar', '292', '350', 'Gibraltar', 'GIP', 'Gibraltar pound', '£', 'Gibraltar', 'Europe', '36.13333333', '-5.35000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(61, 'Greece', '300', '30', 'Athens', 'EUR', 'Euro', '€', 'Ελλάδα', 'Europe', '39.00000000', '22.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(62, 'Greenland', '304', '299', 'Nuuk', 'DKK', 'Danish krone', 'Kr.', 'Kalaallit Nunaat', 'Americas', '72.00000000', '-40.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(63, 'Grenada', '308', '1', 'St. George\'s', 'XCD', 'Eastern Caribbean dollar', '$', 'Grenada', 'Americas', '12.11666666', '-61.66666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(64, 'Guadeloupe', '312', '590', 'Basse-Terre', 'EUR', 'Euro', '€', 'Guadeloupe', 'Americas', '16.25000000', '-61.58333300', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(65, 'Guam', '316', '1', 'Hagatna', 'USD', 'US Dollar', '$', 'Guam', 'Oceania', '13.46666666', '144.78333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(66, 'Guatemala', '320', '502', 'Guatemala City', 'GTQ', 'Guatemalan quetzal', 'Q', 'Guatemala', 'Americas', '15.50000000', '-90.25000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(67, 'Guernsey and Alderney', '831', '44', 'St Peter Port', 'GBP', 'British pound', '£', 'Guernsey', 'Europe', '49.46666666', '-2.58333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(68, 'Guinea', '324', '224', 'Conakry', 'GNF', 'Guinean franc', 'FG', 'Guinée', 'Africa', '11.00000000', '-10.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(69, 'Guinea-Bissau', '624', '245', 'Bissau', 'XOF', 'West African CFA franc', 'CFA', 'Guiné-Bissau', 'Africa', '12.00000000', '-15.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(70, 'Guyana', '328', '592', 'Georgetown', 'GYD', 'Guyanese dollar', '$', 'Guyana', 'Americas', '5.00000000', '-59.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(71, 'Haiti', '332', '509', 'Port-au-Prince', 'HTG', 'Haitian gourde', 'G', 'Haïti', 'Americas', '19.00000000', '-72.41666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(72, 'Heard Island and McDonald Islands', '334', '672', '', 'AUD', 'Australian dollar', '$', 'Heard Island and McDonald Islands', '', '-53.10000000', '72.51666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(73, 'Honduras', '340', '504', 'Tegucigalpa', 'HNL', 'Honduran lempira', 'L', 'Honduras', 'Americas', '15.00000000', '-86.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(74, 'Hong Kong S.A.R.', '344', '852', 'Hong Kong', 'HKD', 'Hong Kong dollar', '$', '香港', 'Asia', '22.25000000', '114.16666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(75, 'Hungary', '348', '36', 'Budapest', 'HUF', 'Hungarian forint', 'Ft', 'Magyarország', 'Europe', '47.00000000', '20.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(76, 'Iceland', '352', '354', 'Reykjavik', 'ISK', 'Icelandic króna', 'kr', 'Ísland', 'Europe', '65.00000000', '-18.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(77, 'India', '356', '91', 'New Delhi', 'INR', 'Indian rupee', '₹', 'भारत', 'Asia', '20.00000000', '77.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(78, 'Indonesia', '360', '62', 'Jakarta', 'IDR', 'Indonesian rupiah', 'Rp', 'Indonesia', 'Asia', '-5.00000000', '120.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(79, 'Iran', '364', '98', 'Tehran', 'IRR', 'Iranian rial', '﷼', 'ایران', 'Asia', '32.00000000', '53.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(80, 'Iraq', '368', '964', 'Baghdad', 'IQD', 'Iraqi dinar', 'د.ع', 'العراق', 'Asia', '33.00000000', '44.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(81, 'Ireland', '372', '353', 'Dublin', 'EUR', 'Euro', '€', 'Éire', 'Europe', '53.00000000', '-8.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(82, 'Israel', '376', '972', 'Jerusalem', 'ILS', 'Israeli new shekel', '₪', 'יִשְׂרָאֵל', 'Asia', '31.50000000', '34.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(83, 'Italy', '380', '39', 'Rome', 'EUR', 'Euro', '€', 'Italia', 'Europe', '42.83333333', '12.83333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(84, 'Jamaica', '388', '1', 'Kingston', 'JMD', 'Jamaican dollar', 'J$', 'Jamaica', 'Americas', '18.25000000', '-77.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(85, 'Japan', '392', '81', 'Tokyo', 'JPY', 'Japanese yen', '¥', '日本', 'Asia', '36.00000000', '138.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(86, 'Jersey', '832', '44', 'Saint Helier', 'GBP', 'British pound', '£', 'Jersey', 'Europe', '49.25000000', '-2.16666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(87, 'Jordan', '400', '962', 'Amman', 'JOD', 'Jordanian dinar', 'ا.د', 'الأردن', 'Asia', '31.00000000', '36.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(88, 'Kazakhstan', '398', '7', 'Astana', 'KZT', 'Kazakhstani tenge', 'лв', 'Қазақстан', 'Asia', '48.00000000', '68.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(89, 'Kenya', '404', '254', 'Nairobi', 'KES', 'Kenyan shilling', 'KSh', 'Kenya', 'Africa', '1.00000000', '38.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(90, 'Kiribati', '296', '686', 'Tarawa', 'AUD', 'Australian dollar', '$', 'Kiribati', 'Oceania', '1.41666666', '173.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(91, 'Kosovo', '926', '383', 'Pristina', 'EUR', 'Euro', '€', 'Republika e Kosovës', 'Europe', '29.50000000', '45.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(92, 'Kyrgyzstan', '417', '996', 'Bishkek', 'KGS', 'Kyrgyzstani som', 'лв', 'Кыргызстан', 'Asia', '41.00000000', '75.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(93, 'Laos', '418', '856', 'Vientiane', 'LAK', 'Lao kip', '₭', 'ສປປລາວ', 'Asia', '18.00000000', '105.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(94, 'Latvia', '428', '371', 'Riga', 'EUR', 'Euro', '€', 'Latvija', 'Europe', '57.00000000', '25.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(95, 'Lebanon', '422', '961', 'Beirut', 'LBP', 'Lebanese pound', '£', 'لبنان', 'Asia', '33.83333333', '35.83333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(96, 'Lesotho', '426', '266', 'Maseru', 'LSL', 'Lesotho loti', 'L', 'Lesotho', 'Africa', '-29.50000000', '28.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(97, 'Liberia', '430', '231', 'Monrovia', 'LRD', 'Liberian dollar', '$', 'Liberia', 'Africa', '6.50000000', '-9.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(98, 'Libya', '434', '218', 'Tripolis', 'LYD', 'Libyan dinar', 'د.ل', '‏ليبيا', 'Africa', '25.00000000', '17.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(99, 'Liechtenstein', '438', '423', 'Vaduz', 'CHF', 'Swiss franc', 'CHf', 'Liechtenstein', 'Europe', '47.26666666', '9.53333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(100, 'Lithuania', '440', '370', 'Vilnius', 'EUR', 'Euro', '€', 'Lietuva', 'Europe', '56.00000000', '24.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(101, 'Luxembourg', '442', '352', 'Luxembourg', 'EUR', 'Euro', '€', 'Luxembourg', 'Europe', '49.75000000', '6.16666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(102, 'Macau S.A.R.', '446', '853', 'Macao', 'MOP', 'Macanese pataca', '$', '澳門', 'Asia', '22.16666666', '113.55000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(103, 'Madagascar', '450', '261', 'Antananarivo', 'MGA', 'Malagasy ariary', 'Ar', 'Madagasikara', 'Africa', '-20.00000000', '47.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(104, 'Malawi', '454', '265', 'Lilongwe', 'MWK', 'Malawian kwacha', 'MK', 'Malawi', 'Africa', '-13.50000000', '34.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(105, 'Malaysia', '458', '60', 'Kuala Lumpur', 'MYR', 'Malaysian ringgit', 'RM', 'Malaysia', 'Asia', '2.50000000', '112.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(106, 'Maldives', '462', '960', 'Male', 'MVR', 'Maldivian rufiyaa', 'Rf', 'Maldives', 'Asia', '3.25000000', '73.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(107, 'Mali', '466', '223', 'Bamako', 'XOF', 'West African CFA franc', 'CFA', 'Mali', 'Africa', '17.00000000', '-4.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(108, 'Malta', '470', '356', 'Valletta', 'EUR', 'Euro', '€', 'Malta', 'Europe', '35.83333333', '14.58333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(109, 'Man (Isle of)', '833', '44', 'Douglas, Isle of Man', 'GBP', 'British pound', '£', 'Isle of Man', 'Europe', '54.25000000', '-4.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(110, 'Marshall Islands', '584', '692', 'Majuro', 'USD', 'United States dollar', '$', 'M̧ajeļ', 'Oceania', '9.00000000', '168.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(111, 'Martinique', '474', '596', 'Fort-de-France', 'EUR', 'Euro', '€', 'Martinique', 'Americas', '14.66666700', '-61.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(112, 'Mauritania', '478', '222', 'Nouakchott', 'MRO', 'Mauritanian ouguiya', 'MRU', 'موريتانيا', 'Africa', '20.00000000', '-12.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(113, 'Mauritius', '480', '230', 'Port Louis', 'MUR', 'Mauritian rupee', '₨', 'Maurice', 'Africa', '-20.28333333', '57.55000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(114, 'Mayotte', '175', '262', 'Mamoudzou', 'EUR', 'Euro', '€', 'Mayotte', 'Africa', '-12.83333333', '45.16666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(115, 'Mexico', '484', '52', 'Ciudad de México', 'MXN', 'Mexican peso', '$', 'México', 'Americas', '23.00000000', '-102.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(116, 'Micronesia', '583', '691', 'Palikir', 'USD', 'United States dollar', '$', 'Micronesia', 'Oceania', '6.91666666', '158.25000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(117, 'Moldova', '498', '373', 'Chisinau', 'MDL', 'Moldovan leu', 'L', 'Moldova', 'Europe', '47.00000000', '29.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(118, 'Monaco', '492', '377', 'Monaco', 'EUR', 'Euro', '€', 'Monaco', 'Europe', '43.73333333', '7.40000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(119, 'Mongolia', '496', '976', 'Ulan Bator', 'MNT', 'Mongolian tögrög', '₮', 'Монгол улс', 'Asia', '46.00000000', '105.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(120, 'Montenegro', '499', '382', 'Podgorica', 'EUR', 'Euro', '€', 'Црна Гора', 'Europe', '42.50000000', '19.30000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(121, 'Montserrat', '500', '1', 'Plymouth', 'XCD', 'Eastern Caribbean dollar', '$', 'Montserrat', 'Americas', '16.75000000', '-62.20000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(122, 'Morocco', '504', '212', 'Rabat', 'MAD', 'Moroccan dirham', 'DH', 'المغرب', 'Africa', '32.00000000', '-5.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(123, 'Mozambique', '508', '258', 'Maputo', 'MZN', 'Mozambican metical', 'MT', 'Moçambique', 'Africa', '-18.25000000', '35.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(124, 'Myanmar', '104', '95', 'Nay Pyi Taw', 'MMK', 'Burmese kyat', 'K', 'မြန်မာ', 'Asia', '22.00000000', '98.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(125, 'Namibia', '516', '264', 'Windhoek', 'NAD', 'Namibian dollar', '$', 'Namibia', 'Africa', '-22.00000000', '17.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(126, 'Nauru', '520', '674', 'Yaren', 'AUD', 'Australian dollar', '$', 'Nauru', 'Oceania', '-0.53333333', '166.91666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(127, 'Nepal', '524', '977', 'Kathmandu', 'NPR', 'Nepalese rupee', '₨', 'नपल', 'Asia', '28.00000000', '84.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(128, 'Netherlands', '528', '31', 'Amsterdam', 'EUR', 'Euro', '€', 'Nederland', 'Europe', '52.50000000', '5.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(129, 'New Caledonia', '540', '687', 'Noumea', 'XPF', 'CFP franc', '₣', 'Nouvelle-Calédonie', 'Oceania', '-21.50000000', '165.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(130, 'New Zealand', '554', '64', 'Wellington', 'NZD', 'New Zealand dollar', '$', 'New Zealand', 'Oceania', '-41.00000000', '174.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(131, 'Nicaragua', '558', '505', 'Managua', 'NIO', 'Nicaraguan córdoba', 'C$', 'Nicaragua', 'Americas', '13.00000000', '-85.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(132, 'Niger', '562', '227', 'Niamey', 'XOF', 'West African CFA franc', 'CFA', 'Niger', 'Africa', '16.00000000', '8.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(133, 'Nigeria', '566', '234', 'Abuja', 'NGN', 'Nigerian naira', '₦', 'Nigeria', 'Africa', '10.00000000', '8.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(134, 'Niue', '570', '683', 'Alofi', 'NZD', 'New Zealand dollar', '$', 'Niuē', 'Oceania', '-19.03333333', '-169.86666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(135, 'Norfolk Island', '574', '672', 'Kingston', 'AUD', 'Australian dollar', '$', 'Norfolk Island', 'Oceania', '-29.03333333', '167.95000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(136, 'North Korea', '408', '850', 'Pyongyang', 'KPW', 'North Korean Won', '₩', '북한', 'Asia', '40.00000000', '127.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(137, 'North Macedonia', '807', '389', 'Skopje', 'MKD', 'Denar', 'ден', 'Северна Македонија', 'Europe', '41.83333333', '22.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(138, 'Northern Mariana Islands', '580', '1', 'Saipan', 'USD', 'United States dollar', '$', 'Northern Mariana Islands', 'Oceania', '15.20000000', '145.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(139, 'Norway', '578', '47', 'Oslo', 'NOK', 'Norwegian krone', 'kr', 'Norge', 'Europe', '62.00000000', '10.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(140, 'Oman', '512', '968', 'Muscat', 'OMR', 'Omani rial', '.ع.ر', 'عمان', 'Asia', '21.00000000', '57.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(141, 'Pakistan', '586', '92', 'Islamabad', 'PKR', 'Pakistani rupee', '₨', 'Pakistan', 'Asia', '30.00000000', '70.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(142, 'Palau', '585', '680', 'Melekeok', 'USD', 'United States dollar', '$', 'Palau', 'Oceania', '7.50000000', '134.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(143, 'Palestinian Territory Occupied', '275', '970', 'East Jerusalem', 'ILS', 'Israeli new shekel', '₪', 'فلسطين', 'Asia', '31.90000000', '35.20000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(144, 'Panama', '591', '507', 'Panama City', 'PAB', 'Panamanian balboa', 'B/.', 'Panamá', 'Americas', '9.00000000', '-80.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(145, 'Papua New Guinea', '598', '675', 'Port Moresby', 'PGK', 'Papua New Guinean kina', 'K', 'Papua Niugini', 'Oceania', '-6.00000000', '147.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(146, 'Paraguay', '600', '595', 'Asuncion', 'PYG', 'Paraguayan guarani', '₲', 'Paraguay', 'Americas', '-23.00000000', '-58.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(147, 'Peru', '604', '51', 'Lima', 'PEN', 'Peruvian sol', 'S/.', 'Perú', 'Americas', '-10.00000000', '-76.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(148, 'Philippines', '608', '63', 'Manila', 'PHP', 'Philippine peso', '₱', 'Pilipinas', 'Asia', '13.00000000', '122.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(149, 'Pitcairn Island', '612', '870', 'Adamstown', 'NZD', 'New Zealand dollar', '$', 'Pitcairn Islands', 'Oceania', '-25.06666666', '-130.10000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(150, 'Poland', '616', '48', 'Warsaw', 'PLN', 'Polish złoty', 'zł', 'Polska', 'Europe', '52.00000000', '20.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(151, 'Portugal', '620', '351', 'Lisbon', 'EUR', 'Euro', '€', 'Portugal', 'Europe', '39.50000000', '-8.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(152, 'Puerto Rico', '630', '1', 'San Juan', 'USD', 'United States dollar', '$', 'Puerto Rico', 'Americas', '18.25000000', '-66.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(153, 'Qatar', '634', '974', 'Doha', 'QAR', 'Qatari riyal', 'ق.ر', 'قطر', 'Asia', '25.50000000', '51.25000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(154, 'Reunion', '638', '262', 'Saint-Denis', 'EUR', 'Euro', '€', 'La Réunion', 'Africa', '-21.15000000', '55.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(155, 'Romania', '642', '40', 'Bucharest', 'RON', 'Romanian leu', 'lei', 'România', 'Europe', '46.00000000', '25.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(156, 'Russia', '643', '7', 'Moscow', 'RUB', 'Russian ruble', '₽', 'Россия', 'Europe', '60.00000000', '100.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(157, 'Rwanda', '646', '250', 'Kigali', 'RWF', 'Rwandan franc', 'FRw', 'Rwanda', 'Africa', '-2.00000000', '30.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(158, 'Saint Helena', '654', '290', 'Jamestown', 'SHP', 'Saint Helena pound', '£', 'Saint Helena', 'Africa', '-15.95000000', '-5.70000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(159, 'Saint Kitts and Nevis', '659', '1', 'Basseterre', 'XCD', 'Eastern Caribbean dollar', '$', 'Saint Kitts and Nevis', 'Americas', '17.33333333', '-62.75000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(160, 'Saint Lucia', '662', '1', 'Castries', 'XCD', 'Eastern Caribbean dollar', '$', 'Saint Lucia', 'Americas', '13.88333333', '-60.96666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(161, 'Saint Pierre and Miquelon', '666', '508', 'Saint-Pierre', 'EUR', 'Euro', '€', 'Saint-Pierre-et-Miquelon', 'Americas', '46.83333333', '-56.33333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(162, 'Saint Vincent and the Grenadines', '670', '1', 'Kingstown', 'XCD', 'Eastern Caribbean dollar', '$', 'Saint Vincent and the Grenadines', 'Americas', '13.25000000', '-61.20000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(163, 'Saint-Barthelemy', '652', '590', 'Gustavia', 'EUR', 'Euro', '€', 'Saint-Barthélemy', 'Americas', '18.50000000', '-63.41666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(164, 'Saint-Martin (French part)', '663', '590', 'Marigot', 'EUR', 'Euro', '€', 'Saint-Martin', 'Americas', '18.08333333', '-63.95000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(165, 'Samoa', '882', '685', 'Apia', 'WST', 'Samoan tālā', 'SAT', 'Samoa', 'Oceania', '-13.58333333', '-172.33333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(166, 'San Marino', '674', '378', 'San Marino', 'EUR', 'Euro', '€', 'San Marino', 'Europe', '43.76666666', '12.41666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(167, 'Sao Tome and Principe', '678', '239', 'Sao Tome', 'STD', 'Dobra', 'Db', 'São Tomé e Príncipe', 'Africa', '1.00000000', '7.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(168, 'Saudi Arabia', '682', '966', 'Riyadh', 'SAR', 'Saudi riyal', '﷼', 'المملكة العربية السعودية', 'Asia', '25.00000000', '45.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(169, 'Senegal', '686', '221', 'Dakar', 'XOF', 'West African CFA franc', 'CFA', 'Sénégal', 'Africa', '14.00000000', '-14.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(170, 'Serbia', '688', '381', 'Belgrade', 'RSD', 'Serbian dinar', 'din', 'Србија', 'Europe', '44.00000000', '21.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(171, 'Seychelles', '690', '248', 'Victoria', 'SCR', 'Seychellois rupee', 'SRe', 'Seychelles', 'Africa', '-4.58333333', '55.66666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(172, 'Sierra Leone', '694', '232', 'Freetown', 'SLL', 'Sierra Leonean leone', 'Le', 'Sierra Leone', 'Africa', '8.50000000', '-11.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(173, 'Singapore', '702', '65', 'Singapur', 'SGD', 'Singapore dollar', '$', 'Singapore', 'Asia', '1.36666666', '103.80000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(174, 'Sint Maarten (Dutch part)', '534', '1721', 'Philipsburg', 'ANG', 'Netherlands Antillean guilder', 'ƒ', 'Sint Maarten', 'Americas', '18.03333300', '-63.05000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(175, 'Slovakia', '703', '421', 'Bratislava', 'EUR', 'Euro', '€', 'Slovensko', 'Europe', '48.66666666', '19.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(176, 'Slovenia', '705', '386', 'Ljubljana', 'EUR', 'Euro', '€', 'Slovenija', 'Europe', '46.11666666', '14.81666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(177, 'Solomon Islands', '090', '677', 'Honiara', 'SBD', 'Solomon Islands dollar', 'Si$', 'Solomon Islands', 'Oceania', '-8.00000000', '159.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(178, 'Somalia', '706', '252', 'Mogadishu', 'SOS', 'Somali shilling', 'Sh.so.', 'Soomaaliya', 'Africa', '10.00000000', '49.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(179, 'South Africa', '710', '27', 'Pretoria', 'ZAR', 'South African rand', 'R', 'South Africa', 'Africa', '-29.00000000', '24.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(180, 'South Georgia', '239', '500', 'Grytviken', 'GBP', 'British pound', '£', 'South Georgia', 'Americas', '-54.50000000', '-37.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(181, 'South Korea', '410', '82', 'Seoul', 'KRW', 'Won', '₩', '대한민국', 'Asia', '37.00000000', '127.50000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(182, 'South Sudan', '728', '211', 'Juba', 'SSP', 'South Sudanese pound', '£', 'South Sudan', 'Africa', '7.00000000', '30.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(183, 'Spain', '724', '34', 'Madrid', 'EUR', 'Euro', '€', 'España', 'Europe', '40.00000000', '-4.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(184, 'Sri Lanka', '144', '94', 'Colombo', 'LKR', 'Sri Lankan rupee', 'Rs', 'śrī laṃkāva', 'Asia', '7.00000000', '81.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(185, 'Sudan', '729', '249', 'Khartoum', 'SDG', 'Sudanese pound', '.س.ج', 'السودان', 'Africa', '15.00000000', '30.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(186, 'Suriname', '740', '597', 'Paramaribo', 'SRD', 'Surinamese dollar', '$', 'Suriname', 'Americas', '4.00000000', '-56.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(187, 'Svalbard and Jan Mayen Islands', '744', '47', 'Longyearbyen', 'NOK', 'Norwegian Krone', 'kr', 'Svalbard og Jan Mayen', 'Europe', '78.00000000', '20.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(188, 'Sweden', '752', '46', 'Stockholm', 'SEK', 'Swedish krona', 'kr', 'Sverige', 'Europe', '62.00000000', '15.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(189, 'Switzerland', '756', '41', 'Bern', 'CHF', 'Swiss franc', 'CHf', 'Schweiz', 'Europe', '47.00000000', '8.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(190, 'Syria', '760', '963', 'Damascus', 'SYP', 'Syrian pound', 'LS', 'سوريا', 'Asia', '35.00000000', '38.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(191, 'Taiwan', '158', '886', 'Taipei', 'TWD', 'New Taiwan dollar', '$', '臺灣', 'Asia', '23.50000000', '121.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(192, 'Tajikistan', '762', '992', 'Dushanbe', 'TJS', 'Tajikistani somoni', 'SM', 'Тоҷикистон', 'Asia', '39.00000000', '71.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(193, 'Tanzania', '834', '255', 'Dodoma', 'TZS', 'Tanzanian shilling', 'TSh', 'Tanzania', 'Africa', '-6.00000000', '35.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(194, 'Thailand', '764', '66', 'Bangkok', 'THB', 'Thai baht', '฿', 'ประเทศไทย', 'Asia', '15.00000000', '100.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(195, 'The Bahamas', '044', '1', 'Nassau', 'BSD', 'Bahamian dollar', 'B$', 'Bahamas', 'Americas', '24.25000000', '-76.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(196, 'The Gambia ', '270', '220', 'Banjul', 'GMD', 'Gambian dalasi', 'D', 'Gambia', 'Africa', '13.46666666', '-16.56666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(197, 'Timor-Leste', '626', '670', 'Dili', 'USD', 'United States dollar', '$', 'Timor-Leste', 'Asia', '-8.83333333', '125.91666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(198, 'Togo', '768', '228', 'Lome', 'XOF', 'West African CFA franc', 'CFA', 'Togo', 'Africa', '8.00000000', '1.16666666', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(199, 'Tokelau', '772', '690', '', 'NZD', 'New Zealand dollar', '$', 'Tokelau', 'Oceania', '-9.00000000', '-172.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(200, 'Tonga', '776', '676', 'Nuku\'alofa', 'TOP', 'Tongan paʻanga', '$', 'Tonga', 'Oceania', '-20.00000000', '-175.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(201, 'Trinidad and Tobago', '780', '1', 'Port of Spain', 'TTD', 'Trinidad and Tobago dollar', '$', 'Trinidad and Tobago', 'Americas', '11.00000000', '-61.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(202, 'Tunisia', '788', '216', 'Tunis', 'TND', 'Tunisian dinar', 'ت.د', 'تونس', 'Africa', '34.00000000', '9.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(203, 'Turkey', '792', '90', 'Ankara', 'TRY', 'Turkish lira', '₺', 'Türkiye', 'Asia', '39.00000000', '35.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(204, 'Turkmenistan', '795', '993', 'Ashgabat', 'TMT', 'Turkmenistan manat', 'T', 'Türkmenistan', 'Asia', '40.00000000', '60.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(205, 'Turks and Caicos Islands', '796', '1', 'Cockburn Town', 'USD', 'United States dollar', '$', 'Turks and Caicos Islands', 'Americas', '21.75000000', '-71.58333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(206, 'Tuvalu', '798', '688', 'Funafuti', 'AUD', 'Australian dollar', '$', 'Tuvalu', 'Oceania', '-8.00000000', '178.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(207, 'Uganda', '800', '256', 'Kampala', 'UGX', 'Ugandan shilling', 'USh', 'Uganda', 'Africa', '1.00000000', '32.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(208, 'Ukraine', '804', '380', 'Kyiv', 'UAH', 'Ukrainian hryvnia', '₴', 'Україна', 'Europe', '49.00000000', '32.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(209, 'United Arab Emirates', '784', '971', 'Abu Dhabi', 'AED', 'United Arab Emirates dirham', 'إ.د', 'دولة الإمارات العربية المتحدة', 'Asia', '24.00000000', '54.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(210, 'United Kingdom', '826', '44', 'London', 'GBP', 'British pound', '£', 'United Kingdom', 'Europe', '54.00000000', '-2.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(211, 'United States', '840', '1', 'Washington', 'USD', 'United States dollar', '$', 'United States', 'Americas', '38.00000000', '-97.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(212, 'United States Minor Outlying Islands', '581', '1', '', 'USD', 'United States dollar', '$', 'United States Minor Outlying Islands', 'Americas', '0.00000000', '0.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(213, 'Uruguay', '858', '598', 'Montevideo', 'UYU', 'Uruguayan peso', '$', 'Uruguay', 'Americas', '-33.00000000', '-56.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(214, 'Uzbekistan', '860', '998', 'Tashkent', 'UZS', 'Uzbekistani soʻm', 'лв', 'O‘zbekiston', 'Asia', '41.00000000', '64.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(215, 'Vanuatu', '548', '678', 'Port Vila', 'VUV', 'Vanuatu vatu', 'VT', 'Vanuatu', 'Oceania', '-16.00000000', '167.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(216, 'Vatican City State (Holy See)', '336', '379', 'Vatican City', 'EUR', 'Euro', '€', 'Vaticano', 'Europe', '41.90000000', '12.45000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(217, 'Venezuela', '862', '58', 'Caracas', 'VES', 'Bolívar', 'Bs', 'Venezuela', 'Americas', '8.00000000', '-66.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(218, 'Vietnam', '704', '84', 'Hanoi', 'VND', 'Vietnamese đồng', '₫', 'Việt Nam', 'Asia', '16.16666666', '107.83333333', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(219, 'Virgin Islands (British)', '092', '1', 'Road Town', 'USD', 'United States dollar', '$', 'British Virgin Islands', 'Americas', '18.43138300', '-64.62305000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(220, 'Virgin Islands (US)', '850', '1', 'Charlotte Amalie', 'USD', 'United States dollar', '$', 'United States Virgin Islands', 'Americas', '18.34000000', '-64.93000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(221, 'Wallis and Futuna Islands', '876', '681', 'Mata Utu', 'XPF', 'CFP franc', '₣', 'Wallis et Futuna', 'Oceania', '-13.30000000', '-176.20000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(222, 'Western Sahara', '732', '212', 'El-Aaiun', 'MAD', 'Moroccan Dirham', 'MAD', 'الصحراء الغربية', 'Africa', '24.50000000', '-13.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(223, 'Yemen', '887', '967', 'Sanaa', 'YER', 'Yemeni rial', '﷼', 'اليَمَن', 'Asia', '15.00000000', '48.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(224, 'Zambia', '894', '260', 'Lusaka', 'ZMW', 'Zambian kwacha', 'ZK', 'Zambia', 'Africa', '-15.00000000', '30.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(225, 'Zimbabwe', '716', '263', 'Harare', 'ZWL', 'Zimbabwe Dollar', '$', 'Zimbabwe', 'Africa', '-20.00000000', '30.00000000', NULL, NULL, 1, NULL, '2025-08-19 18:22:15', '2025-08-19 18:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `min_amount` double NOT NULL,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expired_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `limit_for_user` int(11) DEFAULT 10,
  `max_discount_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `shop_id`, `type`, `discount`, `min_amount`, `started_at`, `expired_at`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `limit_for_user`, `max_discount_amount`) VALUES
(1, '1111', NULL, 'Amount', 1000, 1, '2025-08-22 01:00:00', '2025-08-31 02:00:00', 1, '2025-08-22 05:50:50', '2025-08-22 05:50:50', NULL, 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_collects`
--

CREATE TABLE `coupon_collects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `rate`, `is_active`, `is_default`, `created_at`, `updated_at`) VALUES
(6, 'دينار', NULL, 'IQD', '1', 1, 1, '2025-08-20 01:58:34', '2025-08-24 01:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 13, '2025-08-26 04:19:56', '2025-08-26 04:19:56'),
(8, 14, '2025-08-26 14:14:07', '2025-08-26 14:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `min_qty` int(11) DEFAULT NULL,
  `max_qty` int(11) DEFAULT NULL,
  `charge` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_keys`
--

CREATE TABLE `device_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `device_type` varchar(255) DEFAULT 'android',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_cash_collected` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_orders`
--

CREATE TABLE `driver_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `assign_for` varchar(255) DEFAULT NULL,
  `is_accept` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cash_collect` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 7, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_time` time NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_time` time NOT NULL,
  `end_date` date DEFAULT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `min_discount` double DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale_products`
--

CREATE TABLE `flash_sale_products` (
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `sale_quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footers`
--

CREATE TABLE `footers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `title`, `description`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, 1, '2025-08-19 18:22:15', '2025-08-20 02:02:50'),
(2, 'روابط سريعة', NULL, 2, 1, '2025-08-19 18:22:15', '2025-08-22 05:15:07'),
(3, 'الدعم', NULL, 3, 1, '2025-08-19 18:22:15', '2025-08-22 05:15:16'),
(4, '.', NULL, 4, 1, '2025-08-19 18:22:15', '2025-08-20 02:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `footer_items`
--

CREATE TABLE `footer_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `footer_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'link',
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `shop_type` varchar(255) NOT NULL DEFAULT 'single',
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `footer_items`
--

INSERT INTO `footer_items` (`id`, `footer_id`, `type`, `title`, `url`, `shop_type`, `target`, `is_active`, `order`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'logo', NULL, NULL, 'single', '_self', 1, 2, 1, '2025-08-19 18:22:15', '2025-08-20 02:01:00'),
(2, 1, 'text', 'The ultimate all-in-one solution for your eCommerce business worldwide.', NULL, 'single', '_self', 0, 3, 1, '2025-08-19 18:22:15', '2025-08-20 02:01:56'),
(3, 1, 'phone', '+9647830200030', NULL, 'single', '_self', 1, 4, 1, '2025-08-19 18:22:15', '2025-08-20 02:01:00'),
(4, 1, 'email', 'info@wasl.site', NULL, 'single', '_self', 1, 5, 1, '2025-08-19 18:22:15', '2025-08-20 02:01:28'),
(5, 4, 'social_links', NULL, NULL, 'single', '_self', 0, 2, 1, '2025-08-19 18:22:15', '2025-08-20 02:02:04'),
(6, 2, 'link', 'المنتجات', '/products', 'single', '_self', 1, 0, 0, '2025-08-19 18:22:15', '2025-08-22 05:14:12'),
(7, 2, 'link', 'الرائج', '/most-popular', 'single', '_self', 1, 1, 0, '2025-08-19 18:22:15', '2025-08-22 05:14:21'),
(8, 2, 'link', 'افضل العروض', '/best-deal', 'single', '_self', 1, 2, 0, '2025-08-19 18:22:15', '2025-08-22 05:14:30'),
(9, 2, 'link', 'Become a Seller', '/shop/register', 'multi', '_blank', 0, 3, 1, '2025-08-19 18:22:15', '2025-08-20 02:02:12'),
(10, 2, 'link', 'Blogs', '/blogs', 'single', '_self', 0, 5, 0, '2025-08-19 18:22:15', '2025-08-20 02:02:14'),
(11, 2, 'link', 'About us', '/about-us', 'single', '_self', 0, 0, 0, '2025-08-19 18:22:15', '2025-08-20 02:02:19'),
(12, 3, 'link', 'تواصل معنا', '/contact-us', 'single', '_self', 1, 1, 0, '2025-08-19 18:22:15', '2025-08-22 05:14:38'),
(13, 3, 'link', 'الشروط والاحكام', '/terms-and-conditions', 'single', '_self', 1, 2, 0, '2025-08-19 18:22:15', '2025-08-22 05:14:48'),
(14, 3, 'link', 'ساسية الخصوصية', '/privacy-policy', 'single', '_self', 1, 3, 0, '2025-08-19 18:22:15', '2025-08-22 05:14:58'),
(15, 4, 'app_store', NULL, NULL, 'single', '_self', 0, 1, 1, '2025-08-19 18:22:15', '2025-08-20 02:02:24');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `total_image` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generate_settings`
--

CREATE TABLE `generate_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `logo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `favicon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `google_playstore_url` varchar(255) DEFAULT NULL,
  `show_download_app` tinyint(1) NOT NULL DEFAULT 1,
  `app_store_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_position` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `show_footer` tinyint(1) NOT NULL DEFAULT 1,
  `footer_phone` varchar(255) DEFAULT NULL,
  `footer_email` varchar(255) DEFAULT NULL,
  `primary_color` varchar(255) NOT NULL DEFAULT '#8b5cf6',
  `secondary_color` varchar(255) NOT NULL DEFAULT '#ede9fe',
  `business_based_on` varchar(255) NOT NULL DEFAULT 'commission',
  `commission` double NOT NULL DEFAULT 10,
  `commission_type` varchar(255) DEFAULT 'percentage',
  `commission_charge` varchar(255) NOT NULL DEFAULT 'per_order',
  `shop_pos` tinyint(1) NOT NULL DEFAULT 1,
  `shop_register` tinyint(1) NOT NULL DEFAULT 1,
  `shop_type` varchar(255) DEFAULT 'multi' COMMENT 'multi, single',
  `new_product_approval` tinyint(1) NOT NULL DEFAULT 1,
  `update_product_approval` tinyint(1) NOT NULL DEFAULT 1,
  `min_withdraw` double DEFAULT NULL,
  `max_withdraw` double DEFAULT NULL,
  `withdraw_request` int(11) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `footer_description` varchar(255) DEFAULT NULL,
  `footer_logo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `footer_qrcode_id` bigint(20) UNSIGNED DEFAULT NULL,
  `app_logo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `show_sku` tinyint(1) NOT NULL DEFAULT 0,
  `default_delivery_charge` double NOT NULL DEFAULT 0,
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 1,
  `online_payment` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `generate_settings`
--

INSERT INTO `generate_settings` (`id`, `name`, `title`, `logo_id`, `favicon_id`, `mobile`, `email`, `address`, `google_playstore_url`, `show_download_app`, `app_store_url`, `created_at`, `updated_at`, `currency`, `currency_id`, `currency_position`, `direction`, `show_footer`, `footer_phone`, `footer_email`, `primary_color`, `secondary_color`, `business_based_on`, `commission`, `commission_type`, `commission_charge`, `shop_pos`, `shop_register`, `shop_type`, `new_product_approval`, `update_product_approval`, `min_withdraw`, `max_withdraw`, `withdraw_request`, `footer_text`, `footer_description`, `footer_logo_id`, `footer_qrcode_id`, `app_logo_id`, `show_sku`, `default_delivery_charge`, `cash_on_delivery`, `online_payment`) VALUES
(1, 'wasl - واصل', 'wasl - واصل', 12, 13, '9647830200030', 'info@wasl.site', 'العراق - بغداد', NULL, 0, NULL, '2025-08-19 18:22:15', '2025-08-24 01:02:25', 'IQD', 6, 'prefix', NULL, 0, '9647830200030', NULL, '#8044ee', '#e6dafc', 'commission', 10, 'percentage', 'per_order', 1, 0, 'multi', 0, 0, NULL, NULL, NULL, 'All right reserved by Tanfeeth Tech', NULL, 15, NULL, 14, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `google_re_captchas`
--

CREATE TABLE `google_re_captchas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_key` text NOT NULL,
  `secret_key` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest_orders`
--

CREATE TABLE `guest_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `governorate` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `nearest_landmark` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `subtotal` decimal(12,2) NOT NULL DEFAULT 0.00,
  `delivery_charge` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest_order_items`
--

CREATE TABLE `guest_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guest_order_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_thumbnail` varchar(255) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `unit_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `unit` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `color` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` varchar(255) DEFAULT 'ltr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `name`, `created_at`, `updated_at`, `direction`) VALUES
(1, 'Arabic', 'ar', '2025-08-14 02:20:00', '2025-08-14 02:20:15', 'rtl'),
(2, 'English', 'en', '2025-08-14 02:20:00', '2025-08-14 02:20:00', 'ltr');

-- --------------------------------------------------------

--
-- Table structure for table `legal_pages`
--

CREATE TABLE `legal_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `legal_pages`
--

INSERT INTO `legal_pages` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', 'privacy-policy', '<html><head><title>Consequatur est harum laboriosam qui ipsum.</title></head><body><form action=\"example.org\" method=\"POST\"><label for=\"username\">quis</label><input type=\"text\" id=\"username\"><label for=\"password\">architecto</label><input type=\"password\" id=\"password\"></form><div class=\"molestiae\"><i>Voluptatem rerum est dolorem.</i></div><div class=\"maxime\"></div><div id=\"56178\"></div></body></html>\n', '2025-08-13 23:14:10', '2025-08-13 23:14:10'),
(2, 'Terms of Service', 'terms-and-conditions', '<html><head><title>Vel repellendus totam officia est quidem ratione dolores porro quia nulla.</title></head><body><form action=\"example.com\" method=\"POST\"><label for=\"username\">commodi</label><input type=\"text\" id=\"username\"><label for=\"password\">harum</label><input type=\"password\" id=\"password\"></form><div class=\"distinctio\"><i>Est excepturi.</i><b>Non et modi quidem autem dolor et nemo.</b></div><div class=\"temporibus\"><div id=\"90266\"></div></div></body></html>\n', '2025-08-13 23:14:10', '2025-08-13 23:14:10'),
(3, 'Return policy / Refund Policy', 'return-and-refund-policy', '<html><head><title>Voluptatem accusamus labore.</title></head><body><form action=\"example.com\" method=\"POST\"><label for=\"username\">id</label><input type=\"text\" id=\"username\"><label for=\"password\">inventore</label><input type=\"password\" id=\"password\"></form><div class=\"enim\"><h3>Molestiae et velit consequatur explicabo et culpa fuga.</h3></div></body></html>\n', '2025-08-13 23:14:10', '2025-08-13 23:14:10'),
(4, 'Shipping & Delivery Policy', 'shipping-and-delivery-policy', '<html><head><title>Aut aut maxime qui.</title></head><body><form action=\"example.org\" method=\"POST\"><label for=\"username\">officiis</label><input type=\"text\" id=\"username\"><label for=\"password\">mollitia</label><input type=\"password\" id=\"password\"></form><div id=\"42357\"><div class=\"eveniet\"></div></div><div class=\"modi\"></div><div id=\"56407\"></div></body></html>\n', '2025-08-13 23:14:10', '2025-08-13 23:14:10'),
(5, 'About Us', 'about-us', '<html><head><title>Sapiente expedita occaecati aspernatur et.</title></head><body><form action=\"example.org\" method=\"POST\"><label for=\"username\">quo</label><input type=\"text\" id=\"username\"><label for=\"password\">autem</label><input type=\"password\" id=\"password\"></form><div class=\"in\"><a href=\"example.com\">Illo laboriosam necessitatibus dignissimos rem error ut inventore.</a><ul><li>Ex consequatur.</li><li>Molestiae voluptas.</li><li>Est illum quibusdam beatae.</li><li>Temporibus ea.</li><li>At.</li><li>Qui asperiores omnis dolorum ab.</li><li>Velit molestiae voluptatibus accusantium.</li><li>Itaque reprehenderit et placeat.</li><li>Quia impedit placeat.</li></ul></div></body></html>\n', '2025-08-13 23:14:10', '2025-08-13 23:14:10'),
(6, 'Privacy Policy', 'privacy-policy', '<html><head><title>Et dicta.</title></head><body><form action=\"example.org\" method=\"POST\"><label for=\"username\">molestias</label><input type=\"text\" id=\"username\"><label for=\"password\">ratione</label><input type=\"password\" id=\"password\"></form><div id=\"94274\"><b>Dolorem dolorem ea occaecati dignissimos aliquid blanditiis deleniti.</b><ul><li>Placeat blanditiis.</li><li>Aut voluptatem nihil deserunt et.</li><li>Repellendus.</li><li>Corrupti.</li><li>Ipsum.</li><li>Itaque qui.</li><li>Id.</li></ul>Quod.<a href=\"example.com\">Et aperiam sapiente qui quia sit non dolorem aut.</a></div><div class=\"id\">Eos aliquid.<ul><li>Quam et.</li><li>Harum ut aperiam.</li></ul><a href=\"example.org\">Eveniet cupiditate pariatur sed vitae eum quaerat.</a></div><div id=\"2658\"></div></body></html>\n', '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(7, 'Terms of Service', 'terms-and-conditions', '<html><head><title>Necessitatibus modi aliquam sint illo ab commodi.</title></head><body><form action=\"example.com\" method=\"POST\"><label for=\"username\">rem</label><input type=\"text\" id=\"username\"><label for=\"password\">qui</label><input type=\"password\" id=\"password\"></form><div id=\"31449\"><table><thead><tr><th>Dolor explicabo ratione.</th><th>Adipisci quod sed.</th></tr></thead><tbody><tr><td>Ut dicta quis ut aut accusamus quas odio.</td><td>Sit voluptatem molestiae distinctio pariatur.</td></tr><tr><td>Accusantium possimus reiciendis aut vel est.</td><td>Nesciunt ipsum qui deserunt eum.</td></tr><tr><td>Fuga perspiciatis corrupti dolor aspernatur magnam aut ea.</td><td>Neque voluptate praesentium ad a sed deleniti vel.</td></tr><tr><td>Et est dicta ad ab et placeat quia deleniti asperiores nisi assumenda.</td><td>Non ipsam tempore laboriosam at odit consectetur voluptate quas.</td></tr><tr><td>Quia dolorum vel accusamus qui numquam facere non est amet non reprehenderit.</td><td>Est in dolorem unde corporis est sit minus fuga sint.</td></tr><tr><td>Aut voluptatibus dolore rerum enim repellendus iste ut sequi aliquam vel.</td><td>Rerum ipsa beatae.</td></tr><tr><td>Consectetur suscipit totam neque facilis natus.</td><td>Quia sapiente.</td></tr><tr><td>Eum aperiam illo quis corporis laboriosam.</td><td>Id est aut.</td></tr><tr><td>Voluptatem molestiae qui consequatur nulla saepe id laborum voluptatem.</td><td>Dolores.</td></tr><tr><td>Tenetur veniam adipisci corporis aliquam.</td><td>Explicabo consectetur eius numquam.</td></tr></tbody></table><span>Non non veniam fuga aut repellendus expedita quia.</span></div><div class=\"exercitationem\"><div id=\"62277\"></div><div class=\"ullam\"><h1>Ut aut qui voluptatibus quidem ea.</h1><i>Placeat quae tenetur.</i></div><div id=\"55414\"></div></div><div class=\"error\">Qui mollitia enim aliquid quis aspernatur libero architecto qui est nemo harum vel.<h2>Est ut dolorem minus maiores libero aut qui amet aut.</h2><ul><li>Labore similique.</li><li>Aut molestiae.</li><li>Illum neque pariatur.</li><li>Et ex voluptatem.</li><li>Veniam autem.</li></ul>Placeat aliquid aut voluptatem architecto error voluptatum dolorem.</div></body></html>\n', '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(8, 'Return policy / Refund Policy', 'return-and-refund-policy', '<html><head><title>Aut quae unde.</title></head><body><form action=\"example.net\" method=\"POST\"><label for=\"username\">voluptatum</label><input type=\"text\" id=\"username\"><label for=\"password\">a</label><input type=\"password\" id=\"password\"></form><div id=\"63530\"></div><div class=\"reprehenderit\"></div><div class=\"placeat\"></div></body></html>\n', '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(9, 'Shipping & Delivery Policy', 'shipping-and-delivery-policy', '<html><head><title>Rem in aut omnis maiores beatae necessitatibus atque quas aperiam.</title></head><body><form action=\"example.org\" method=\"POST\"><label for=\"username\">quis</label><input type=\"text\" id=\"username\"><label for=\"password\">veritatis</label><input type=\"password\" id=\"password\"></form><div class=\"et\"></div><div class=\"iusto\"><div id=\"97803\"></div></div><div class=\"perspiciatis\"></div><div class=\"nihil\"><div id=\"44858\"></div><div id=\"33012\"><h1>Aut illo omnis magni quae.</h1>Repellat sequi dolorem quia sed aspernatur quasi quibusdam nulla delectus ut maxime.<p>Numquam ut.</p>Placeat nemo voluptatibus sit aut.</div></div></body></html>\n', '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(10, 'About Us', 'about-us', '<html><head><title>Quod minima non at est.</title></head><body><form action=\"example.net\" method=\"POST\"><label for=\"username\">suscipit</label><input type=\"text\" id=\"username\"><label for=\"password\">dolores</label><input type=\"password\" id=\"password\"></form><div class=\"est\"></div><div class=\"ullam\"><div class=\"magnam\"></div><div class=\"fugit\"></div><div id=\"34504\"><b>Earum ipsam molestias quibusdam accusamus.</b><h1>Mollitia commodi et libero placeat.</h1>Fuga ut ipsum.</div><div id=\"81430\">Sequi velit ratione aperiam vel harum.Natus asperiores velit voluptatem cum a perferendis quis voluptatem quaerat.<h3>Asperiores voluptatem quisquam rerum fugiat totam consequatur repellat.</h3><i>Perspiciatis ipsam temporibus doloremque consequatur eaque.</i><span>Ut eos voluptatem est numquam est aliquid autem repudiandae non est.</span><span>Consequatur suscipit labore eius modi culpa occaecati.</span></div></div></body></html>\n', '2025-08-19 18:22:15', '2025-08-19 18:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(45) DEFAULT 'image',
  `name` text DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `src` text NOT NULL,
  `extention` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `type`, `name`, `original_name`, `src`, `extention`, `created_at`, `updated_at`) VALUES
(1, 'image', '1700381578063.jpg', NULL, 'users/profile/c5JGIzGZzxWIHQjH7XXzaRoimras1z4hJ4CLoBkf.jpg', 'png', '2025-08-14 02:15:35', '2025-08-23 03:09:17'),
(2, 'image', 'facere', NULL, 'default/dummy-profile.png', 'png', '2025-08-14 02:15:35', '2025-08-14 02:15:35'),
(3, 'image', 'Untitled-11.png', NULL, 'shops/logo/PhfNb5bGo1sp7NCrR1mMkJEztPB1qUcSSMOWYV2j.png', 'png', '2025-08-14 02:15:35', '2025-08-23 03:17:04'),
(4, 'image', 'Untitled-1.png', NULL, 'shops/banner/3DZVCTQjTqO9Y3WWVk815BZOQXcqo49hrrG82EpI.png', 'png', '2025-08-14 02:15:35', '2025-08-23 03:09:02'),
(5, 'image', 'english.png', NULL, 'categories/ydUaJp1mgkbioYTRdp7ouafi4NZke0XQZGS8BEof.png', NULL, '2025-08-14 02:28:46', '2025-08-14 02:28:46'),
(6, 'thumbnail', '81eef742-d563-4996-8afb-16398e53223a.png', NULL, 'products/0EAKZpsyNKpGPWJ4TlhBgwaKTiFtNCjJ4SZMZkAu.png', NULL, '2025-08-14 02:31:07', '2025-08-14 02:31:07'),
(7, 'image', 'english.png', NULL, 'products/DvmwdvD9Z0ZQeWhzJI6Xzrf9uhWQObK7r1R0jq2Z.png', NULL, '2025-08-14 02:31:07', '2025-08-23 03:18:25'),
(8, 'image', '1700381578063.jpg', NULL, 'users/profile/GgpcHh3ZLgXEqxjTw2bJ6ZjirRV4XBhPttyJpct0.jpg', NULL, '2025-08-14 20:57:08', '2025-08-20 05:09:22'),
(9, 'image', 'Untitled-3.png', NULL, 'users/profile/Dgc0QWBbtlrUclXpVzeosD5FTB36aPCqWBYuYuFX.png', NULL, '2025-08-19 17:24:08', '2025-08-23 04:13:04'),
(10, 'image', 'Untitled-3.png', NULL, 'shops/logo/QhJQraQS1RsqW81eVfDY9YZYXExGmDz5cxulgl8Z.png', NULL, '2025-08-19 17:24:08', '2025-08-23 00:32:31'),
(11, 'image', 'Untitled-2.png', NULL, 'shops/banner/ky6wdc1hncnUBkUJFEqtwrBOt8IksX03iQ2q1Ykj.png', NULL, '2025-08-19 17:24:08', '2025-08-23 00:32:31'),
(12, 'image', 'Asset 3.png', NULL, 'logo/mFrNsGSRlAtNWevPcw7E8gdwRQngSXjoPmcij4OE.png', NULL, '2025-08-19 18:25:06', '2025-08-23 03:53:44'),
(13, 'image', 'Asset 6.png', NULL, 'favicon/MDRQpAmut7FHJn28DxoxVfKgfloGn2S46gJmV53v.png', NULL, '2025-08-19 20:03:20', '2025-08-23 04:01:43'),
(14, 'image', 'Asset 3.png', NULL, 'logo/91gSOfu4HsprV9J0zFdbD3cP4EQl5rkPa3s4ZdAc.png', NULL, '2025-08-19 20:03:20', '2025-08-23 03:55:43'),
(15, 'image', 'Asset 4.png', NULL, 'logo/Or0THHF8svfP7FqUqCqIl4fw8roDyqbDO81YJP7M.png', NULL, '2025-08-19 20:03:20', '2025-08-23 03:55:20'),
(22, 'thumbnail', '1714978386258.png', NULL, 'products/RcjiZnkebNxIh05C7C5rDqQQYgsW8tYWCta87aeD.png', NULL, '2025-08-19 20:25:29', '2025-08-19 20:25:29'),
(23, 'thumbnail', '81eef742-d563-4996-8afb-16398e53223a (1).png', NULL, 'products/dEsA6wPjG0PxxXTjqOgAq9n9pby4ZVwP1uDWMxhj.png', NULL, '2025-08-19 20:25:29', '2025-08-19 20:25:29'),
(24, 'thumbnail', '81eef742-d563-4996-8afb-16398e53223a.png', NULL, 'products/wH2FrDHRBnJ9bD1Chjfxz8FhBDiDqjY0FJImcUO4.png', NULL, '2025-08-19 20:25:29', '2025-08-19 20:25:29'),
(26, 'thumbnail', '1714978386258.png', NULL, 'products/0jhvTl6V4aHDVx6jhNiazcaF93bZ4GHFWkrM3NOS.png', NULL, '2025-08-23 03:18:25', '2025-08-23 03:18:25'),
(27, 'image', 'Capture.PNG', NULL, 'users/profile/rAnL4CXEKvHFEP5hPXrzkNmpOuWZHWzBns5gXGKr.png', NULL, '2025-08-23 17:32:52', '2025-08-23 17:32:52'),
(28, 'image', 'Capture.PNG', NULL, 'shops/logo/dneR3w9Tq3wRbIK6Ihy7EfvvlH8a380T41dhEpXj.png', NULL, '2025-08-23 17:32:52', '2025-08-23 17:32:52'),
(29, 'image', 'Capture1.PNG', NULL, 'shops/banner/TSc16kfTS9VvtwLgeQTCfwWJgakO5ywAWuydfZ2y.png', NULL, '2025-08-23 17:32:52', '2025-08-23 17:32:52'),
(30, 'thumbnail', '493893242_1035566562016739_7089187784284305479_n.jpg', NULL, 'banners/la6HPtRMtXeAm7JBE1SBIZsrQJ8PZCwqALGDbB2b.jpg', NULL, '2025-08-23 20:11:50', '2025-08-23 20:11:50'),
(34, 'image', 'cwwwf6bdf084b50064ad996dd0488ab880e.png', NULL, 'categories/y9f4ZkXuyWTOpPRbCYNBZBHh4Fs7qsqtVSMrKZMa.png', NULL, '2025-08-23 23:41:27', '2025-08-24 00:13:00'),
(35, 'image', '77a9ca72903232f51c90fe139eb589a1.png', NULL, 'categories/cISYVNxVNpYV8AV5MVfou6iAhJXau4cM9iDm3uV7.png', NULL, '2025-08-23 23:47:54', '2025-08-23 23:47:54'),
(36, 'image', '3e10fec27f0587226a5d88342df9222d (1).png', NULL, 'categories/kvEkk1id6Vq7GJuDFsXEF89rUfvGQlamI4SYSKK3.png', NULL, '2025-08-23 23:48:16', '2025-08-23 23:48:16'),
(37, 'image', 'f5ed1b610abf43b27257ddc942ae5312.png', NULL, 'categories/0XBjBWFhFMR6FNYPaE1cQJuMdBGGNi2jpFnUkGFW.png', NULL, '2025-08-23 23:48:52', '2025-08-23 23:48:52'),
(38, 'image', '26d3e9c4b5476ea657edba8f6a67878b.png', NULL, 'categories/5Adgz03RSFEV9eLGlfUzOUzayNY0Ih7dUwZSXwjL.png', NULL, '2025-08-23 23:49:14', '2025-08-23 23:49:14'),
(39, 'image', '904e959be9876e77fe30329cb0575a28.png', NULL, 'categories/58lBhvd6gok16ausMvmGa1So0rZuFbirNjH3RS83.png', NULL, '2025-08-23 23:49:30', '2025-08-23 23:49:30'),
(40, 'image', 'f996f33e455e84501bb6901600e8a9d1.png', NULL, 'categories/g6EeQThIAXrTlGTrTBwVs4kYxOWI0GZwiqUYvO5B.png', NULL, '2025-08-23 23:49:53', '2025-08-23 23:49:53'),
(41, 'image', 'ea5807a721735d3d40defd791f6d71ea.png', NULL, 'categories/0dy7UofcaeRKOgBHm2l5p73YMPAZw0gIBh5c9O8C.png', NULL, '2025-08-23 23:51:42', '2025-08-23 23:51:42'),
(42, 'image', 'bed4774cbab15caedd22f911dc6e9cc8 (1).png', NULL, 'categories/PDakg00EqY8e4bYTCoAGK363jgBxjBhAPFn0lNqz.png', NULL, '2025-08-23 23:52:05', '2025-08-23 23:52:05'),
(43, 'image', 'cf6bdf084b50064ad996dd0488ab880e.png', NULL, 'categories/Tv9qVQhbhR86IqqdceFz6bP1AmyfcAa14LQgYlwa.png', NULL, '2025-08-23 23:52:55', '2025-08-23 23:52:55'),
(44, 'image', 'cf6b.png', NULL, 'categories/m1GcK8aNFi3oaWZB3le21TSxI2NkW4aDoEwLxrja.png', NULL, '2025-08-24 00:04:24', '2025-08-24 00:04:24'),
(45, 'image', 'cf6bdf084b50064ad996dd0488ab880e222.png', NULL, 'categories/VAZ3tCFSBfHf13wKIjBjgtWsW0ijSNiX87F0ubYO.png', NULL, '2025-08-24 00:07:24', '2025-08-24 00:07:24'),
(46, 'image', 'cf6bdf084b50064ad996dd0488ab880e1111.png', NULL, 'categories/32hJyYmMNZ43E1IeE5sFegNHdjltq4yZOztSQgSo.png', NULL, '2025-08-24 00:07:49', '2025-08-24 00:07:49'),
(47, 'image', 'cwwwf6bdf084b50064ad996dd0488ab880e.png', NULL, 'categories/6lQAivwu6r18UxCdrPPlnEHhm1DKKKlnhLC3LYQX.png', NULL, '2025-08-24 00:11:06', '2025-08-24 00:11:06'),
(48, 'thumbnail', 'babd92c9ba638de6a2b8ece3f0e2a7b51-ezgif.com-webp-to-png-converter.png', NULL, 'products/88iBdv5fgAs9Oq9oj8mbUX7sDhjbFrgSoyqbIii9.png', NULL, '2025-08-24 00:19:57', '2025-08-24 00:19:57'),
(49, 'thumbnail', 'babd92c9ba638de6a2b8ece3f0e2a7b51-ezgif.com-webp-to-png-converter.png', NULL, 'products/5NWkn9NhOIyjJHcf92ILY0Y5P4Yj8NuZfG7T1GKP.png', NULL, '2025-08-24 00:19:58', '2025-08-24 00:19:58'),
(50, 'image', 'aaaaaaa.png', NULL, 'categories/nYTgHLZfZipZ9lNq87n9IiWeUv6BJncQrPzWFOY5.png', NULL, '2025-08-24 01:38:01', '2025-08-24 01:38:01'),
(51, 'image', '77a9ca72903232f51c90fe139eb589a1.png', NULL, 'categories/jTStjjd3RblJvdJMWrWxAF8AIjxU3RvNwRwjNHJM.png', NULL, '2025-08-25 12:06:15', '2025-08-25 12:06:15'),
(52, 'image', 'قرطاسية.jpg', NULL, 'categories/T4Zjb9kKDHzcUEP5lLBaSk2CWomTk2mz2CmF9WmL.jpg', NULL, '2025-08-25 13:11:10', '2025-08-25 13:11:10'),
(53, 'image', 'Untitled-3.png', NULL, 'users/profile/AvSXwbSsDS8grOldsGRwDPv1TsyA1xoRHP6eODTH.png', NULL, '2025-08-25 13:31:24', '2025-08-25 13:31:24'),
(54, 'image', 'Untitled-3.png', NULL, 'shops/logo/QhxHicCSDgqaRkLCredFrQxn5xntZvDsVCOQtzNr.png', NULL, '2025-08-25 13:31:24', '2025-08-25 13:31:24'),
(55, 'image', 'Untitled-5.jpg', NULL, 'shops/banner/ceHIjfQk4cUq80Zj3TTQr3L8cX2Xt02l7wJmieww.jpg', NULL, '2025-08-25 13:31:24', '2025-08-26 13:23:54'),
(56, 'image', 'aaaaaaa.png', NULL, 'categories/ow2PTtQ0pXb5b0vU0RfFu2iSgYkqpDXq4KTPXy9N.png', NULL, '2025-08-25 13:33:10', '2025-08-25 13:33:10'),
(57, 'image', 'الملازم.jpg', NULL, 'categories/hKSX31Ee7qofN3a9tuTdE902X4omyciDfhknOgYA.jpg', NULL, '2025-08-25 15:04:08', '2025-08-25 15:04:08'),
(58, 'image', '662.jpg', NULL, 'categories/14teEdvPlwozlCIRuwvQdXtVsAatnaPbQsz4NH1y.jpg', NULL, '2025-08-25 15:09:54', '2025-08-25 15:09:54'),
(59, 'thumbnail', 'photo_2025-08-25_15-39-04.jpg', NULL, 'products/HOF6fGWggw4ft1yR4RvacT9RMDO9GW912RBmN7Ap.jpg', NULL, '2025-08-25 15:39:34', '2025-08-25 15:39:34'),
(60, 'thumbnail', 'photo_4_2025-08-25_15-50-54.jpg', NULL, 'products/rIwGOqostgsJp8f5c3qAYlBdsIfkawZj7emBqbw2.jpg', NULL, '2025-08-25 15:53:43', '2025-08-25 15:53:43'),
(61, 'thumbnail', 'photo_1_2025-08-25_15-50-54.jpg', NULL, 'products/1qB0K7RKLIY6ZwAwWSAOYyYkVLbHkryeztZAxIje.jpg', NULL, '2025-08-25 15:56:24', '2025-08-25 15:56:24'),
(62, 'thumbnail', 'photo_2_2025-08-25_15-50-54.jpg', NULL, 'products/Mg63YHA8onZviG5CmpelTc7BGHF9CkY1PRr6Sv9j.jpg', NULL, '2025-08-25 15:58:26', '2025-08-25 15:58:26'),
(63, 'thumbnail', 'photo_6_2025-08-25_15-50-54.jpg', NULL, 'products/t0GJSe6Uyet0vr5fvW46fl4wqvAzWwG0yv2bjhA7.jpg', NULL, '2025-08-25 15:59:50', '2025-08-25 15:59:50'),
(64, 'thumbnail', 'photo_5_2025-08-25_15-50-54.jpg', NULL, 'products/25dyyx8aLekMynoPqx4COhnIprtT0JaBLNUX0Bjc.jpg', NULL, '2025-08-25 16:01:08', '2025-08-25 16:01:08'),
(65, 'image', 'photo_٢٠٢٥-٠٨-٢٥_١٦-٠٣-٤٠.jpg', NULL, 'categories/2M7gT1n0sKMAbRUjYyQxdqfnMplLQyviFkiaiuh9.jpg', NULL, '2025-08-25 16:04:11', '2025-08-25 16:04:11'),
(66, 'image', 'WhatsApp Image 2025-08-25 at 16.13.17_d66a1500.jpg', NULL, 'categories/W4PEMls6CIMwJ4ZgbojEYqckbxzfYPt39wb3PA7a.jpg', NULL, '2025-08-25 16:13:46', '2025-08-25 16:13:46'),
(67, 'thumbnail', 'photo_1_2025-08-25_16-06-04.jpg', NULL, 'products/6szrG0Ej6jdsS6I0Ra4UclhHGJCYXlQBdalfAN6I.jpg', NULL, '2025-08-25 16:15:19', '2025-08-25 16:15:19'),
(68, 'thumbnail', 'photo_3_2025-08-25_16-06-04.jpg', NULL, 'products/Q4nbsRgE8g2AtOsesmSeawcLPFXt4SBxHq4fD18T.jpg', NULL, '2025-08-25 16:15:19', '2025-08-25 16:15:19'),
(69, 'thumbnail', 'photo_2_2025-08-25_16-06-04.jpg', NULL, 'products/n7zal736oAY0t9jCuRNHq5iMPynEEpwPNTGsGI90.jpg', NULL, '2025-08-25 16:15:19', '2025-08-25 16:15:19'),
(70, 'image', 'WhatsApp Image 2025-08-25 at 16.12.06_aca91c34.jpg', NULL, 'categories/vthZkhUNYpyQoza8QKGLuZvjVutyoL3uT284pofs.jpg', NULL, '2025-08-25 16:19:19', '2025-08-25 16:19:19'),
(71, 'image', 'WhatsApp Image 2025-08-25 at 16.12.06_85bae693.jpg', NULL, 'categories/zKUvnCbsNIiwVYhTAyVAkwSqhXK22yfkMwQVccOF.jpg', NULL, '2025-08-25 16:23:35', '2025-08-25 16:23:35'),
(72, 'image', 'WhatsApp Image 2025-08-25 at 16.12.05_6d1df721.jpg', NULL, 'categories/hbejQu5IDm5sz2ujtZddKip0svXpY1nCEhUTDVXa.jpg', NULL, '2025-08-25 16:25:44', '2025-08-25 16:25:44'),
(73, 'image', 'WhatsApp Image 2025-08-25 at 16.12.05_2a642041.jpg', NULL, 'categories/Yj6Ops67fQk2Rc2qZIbJtlffREFKBADJHok9kb4m.jpg', NULL, '2025-08-25 16:30:26', '2025-08-25 16:30:26'),
(74, 'image', 'WhatsApp Image 2025-08-25 at 16.12.05_42a405c0.jpg', NULL, 'categories/LKfFj2zjkC1LhSO5BSC7eCbK3bVuelLF3cAqar8W.jpg', NULL, '2025-08-25 16:31:33', '2025-08-25 16:31:33'),
(75, 'image', 'WhatsApp Image 2025-08-25 at 16.12.06_85bae693.jpg', NULL, 'categories/DPr1TYM8O4bzkujPZP3uwWR20bvU8aHwUEIWV0Mk.jpg', NULL, '2025-08-25 16:32:56', '2025-08-25 16:32:56'),
(76, 'image', 'WhatsApp Image 2025-08-25 at 16.13.17_d66a1500.jpg', NULL, 'categories/juBLVL3fGipTrkUyRMz60tgiuGIYvtrfWHFiO8Vx.jpg', NULL, '2025-08-25 16:35:12', '2025-08-25 16:35:12'),
(77, 'image', 'WhatsApp Image 2025-08-25 at 16.12.05_3c91efd0.jpg', NULL, 'categories/SoYpqzE0dvz40ZE9qbklr6DnB9dTYjZaQC9aC7DG.jpg', NULL, '2025-08-25 16:37:44', '2025-08-25 16:37:44'),
(78, 'image', 'WhatsApp Image 2025-08-25 at 16.12.05_42a405c0.jpg', NULL, 'categories/ml2WRHCNpoAg4udqPmB70eS3wJkTCPEw3RDY5Sim.jpg', NULL, '2025-08-25 16:40:05', '2025-08-25 16:40:05'),
(79, 'image', 'WhatsApp Image 2025-08-25 at 16.12.05_42a405c0.jpg', NULL, 'categories/afjLQHMRIK9q6B7o14ROEdeVFNIeStvYmV7VMvOL.jpg', NULL, '2025-08-25 16:42:49', '2025-08-25 16:43:12'),
(80, 'image', 'WhatsApp Image 2025-08-25 at 16.12.05_42a405c0.jpg', NULL, 'categories/uQQiLWif0xoPbp7lrzFfvgbeTeBpTKOGoL6Kyo7E.jpg', NULL, '2025-08-25 16:44:05', '2025-08-25 16:44:05'),
(81, 'image', 'png-clipart-canon-logo-camera-camera-cdr-text.png', NULL, 'categories/1KnG5vnlAYiNmcjaGVxPcUSeKsaQYZV3gh7M9kBc.png', NULL, '2025-08-25 16:47:49', '2025-08-25 16:47:49'),
(82, 'image', 'canon-press-centre-canon-logo_301414581785538.png', NULL, 'categories/q3pgdcantjeGEPHbAFmXFEvj2gXBAukTxdSkUyDV.png', NULL, '2025-08-25 16:49:49', '2025-08-25 16:49:49'),
(83, 'image', 'group-black-pencils-one-pencil-with-dots.jpg', NULL, 'categories/hKRGK9aXbdG4Tv9FgaJLmnKMkMoKm1bbLk6dN7Dk.jpg', NULL, '2025-08-25 17:20:35', '2025-08-25 17:20:35'),
(84, 'thumbnail', 'photo_17_2025-08-25_17-30-11.jpg', NULL, 'products/GxOgUku9GcLJ1byrQNA3uMBWOS977EkykgD0NH1v.jpg', NULL, '2025-08-25 17:32:24', '2025-08-25 17:32:24'),
(85, 'thumbnail', 'photo_16_2025-08-25_17-30-11.jpg', NULL, 'products/XOICRLsDZmf4d8fDGiHL5Yv1Ayd8bxeix6D5mVnU.jpg', NULL, '2025-08-25 17:33:14', '2025-08-25 17:33:14'),
(86, 'thumbnail', 'photo_15_2025-08-25_17-30-11.jpg', NULL, 'products/U6DeI67AixMwbeMEswLXdu78MXqDuWOhkzUnbo2p.jpg', NULL, '2025-08-25 17:34:21', '2025-08-25 17:34:21'),
(87, 'thumbnail', 'photo_14_2025-08-25_17-30-11.jpg', NULL, 'products/S4awq42IQmIn2d5d24sKBh6zhtDPzBmbfsKS4rgd.jpg', NULL, '2025-08-25 17:35:21', '2025-08-25 17:35:21'),
(88, 'thumbnail', 'photo_13_2025-08-25_17-30-11.jpg', NULL, 'products/r9lvkzKrG4Jzdn5Zve9TgnZbBQJYiQbxizwFVDRB.jpg', NULL, '2025-08-25 17:36:12', '2025-08-25 17:36:12'),
(89, 'thumbnail', 'photo_12_2025-08-25_17-30-11.jpg', NULL, 'products/VPR4FOZgwpN6RfVo7C1zPCZfVlBGr0nF64StdVig.jpg', NULL, '2025-08-25 17:36:56', '2025-08-25 17:36:56'),
(90, 'thumbnail', 'photo_11_2025-08-25_17-30-11.jpg', NULL, 'products/P71QEJFOBObuNzrC10MIo0XtXSMbpd0o6HDUySQg.jpg', NULL, '2025-08-25 17:37:45', '2025-08-25 17:37:45'),
(91, 'thumbnail', 'photo_9_2025-08-25_17-30-11.jpg', NULL, 'products/aZr3SYh9EKOK9YuU601gGFAvEmP25oNfAd8PTdqq.jpg', NULL, '2025-08-25 17:40:05', '2025-08-25 17:40:05'),
(92, 'thumbnail', 'photo_8_2025-08-25_17-30-11.jpg', NULL, 'products/XJuIMSQBS1UZLnpzq7gTLNMGoDy590h53I1Gsr1o.jpg', NULL, '2025-08-25 17:41:07', '2025-08-25 17:41:07'),
(93, 'thumbnail', 'photo_7_2025-08-25_17-30-11.jpg', NULL, 'products/m4C6dF73I370q8wRYAEoiM5w1pidkQe3wsa1OvHF.jpg', NULL, '2025-08-25 17:41:51', '2025-08-25 17:41:51'),
(94, 'thumbnail', 'photo_6_2025-08-25_17-30-11.jpg', NULL, 'products/Wbl0EELe1wlLtrPOP4OZMQVaLbzyf1ZqdBbSLxAq.jpg', NULL, '2025-08-25 17:42:44', '2025-08-25 17:42:44'),
(95, 'thumbnail', 'photo_5_2025-08-25_17-30-11.jpg', NULL, 'products/V6nv6RZDunJy20cGSr7yCm91NcvNvJE45MuIqN19.jpg', NULL, '2025-08-25 17:43:38', '2025-08-25 17:43:38'),
(96, 'thumbnail', 'photo_3_2025-08-25_17-30-11.jpg', NULL, 'products/kJ3bNxCfyOIwPILyxdlTx7elrgqJYbnqMUv2DOvP.jpg', NULL, '2025-08-25 17:44:28', '2025-08-25 17:44:28'),
(97, 'thumbnail', 'photo_4_2025-08-25_17-30-11.jpg', NULL, 'products/jgp4ARQhuaoR75dfUZnVefq9mDPshYYQHU1oB1tl.jpg', NULL, '2025-08-25 17:45:09', '2025-08-25 17:45:09'),
(98, 'thumbnail', 'photo_2_2025-08-25_17-30-11.jpg', NULL, 'products/L1EursdkVSEMqmS0Wk24uKkWELBYMs9w64qi9yMM.jpg', NULL, '2025-08-25 17:46:00', '2025-08-25 17:46:00'),
(99, 'thumbnail', 'photo_1_2025-08-25_17-30-11.jpg', NULL, 'products/oOLE5WByHGqfFtQWqpZqMQ9cFjWH6vYh3Z79RYyG.jpg', NULL, '2025-08-25 17:47:07', '2025-08-25 17:47:07'),
(100, 'image', 'cpu.png', NULL, 'categories/bbmFE2p2WNGr9Qjj88YrZ8gM8rbeV0n8yKo9GsP8.png', NULL, '2025-08-25 18:24:33', '2025-08-25 18:24:33'),
(101, 'image', 'pngtree-colored-books-decorative-illustration-image_1385417.jpg', NULL, 'categories/FIZ5Acx4aOQ35OeiQmKRzFO81qcAJNUfKhchSXbm.jpg', NULL, '2025-08-25 18:30:09', '2025-08-25 18:30:09'),
(102, 'thumbnail', 'photo_2025-08-25_18-36-25.jpg', NULL, 'products/9XrP3fbUI7hJNzwxgAOW38friuqQdZG4ghVw6SsH.jpg', NULL, '2025-08-25 18:37:19', '2025-08-25 18:37:19'),
(103, 'image', 'canon-press-centre-canon-logo_301414581785538.png', NULL, 'categories/xcLCvVcwDJQzoT5zinsbkOYYMCWnRarzVPag7BP6.png', NULL, '2025-08-25 18:39:43', '2025-08-25 18:39:43'),
(104, 'image', 'photo_2025-08-25_18-55-11.jpg', NULL, 'products/lALjJ05M8MOJ5pIM3GXO00iAHrPaN3gPfdIdnZ7D.jpg', NULL, '2025-08-25 18:54:40', '2025-08-25 19:07:12'),
(105, 'thumbnail', 'photo_6_2025-08-25_16-06-04.jpg', NULL, 'products/Tblmh9uRHyfTP2SpO2jxgR4HveiAHCmzpQa6ShI3.jpg', NULL, '2025-08-25 19:44:41', '2025-08-25 19:44:41'),
(106, 'thumbnail', 'photo_5_2025-08-25_16-06-04.jpg', NULL, 'products/Z67EkAOmexfIvub52Pu8xtRYf754rCns3KnhaKsp.jpg', NULL, '2025-08-25 19:44:42', '2025-08-25 19:44:42'),
(107, 'thumbnail', 'photo_4_2025-08-25_16-06-04.jpg', NULL, 'products/c7tWGcrwb7YdxAVRm3dVOYlGVySbMQZRgIMR57j2.jpg', NULL, '2025-08-25 19:44:42', '2025-08-25 19:44:42'),
(108, 'image', 'multicoloured-fountain-writing-pens-white-background-3d-rendering.jpg', NULL, 'categories/PZjftWkhGVOzAkn7FLYH1x6JHZ54YVF91MK9gQOW.jpg', NULL, '2025-08-25 19:50:31', '2025-08-25 19:50:31'),
(109, 'thumbnail', 'photo_1_2025-08-25_19-45-22.jpg', NULL, 'products/mrc8JUhHhq9GTzuTYprwrQNp0gZXqtwpn6YdGptV.jpg', NULL, '2025-08-25 19:53:29', '2025-08-25 19:53:29'),
(110, 'thumbnail', 'photo_2_2025-08-25_19-45-22.jpg', NULL, 'products/AWczUPmGrZ1xFIKTDECYEbHnJsceNmmNq6F9jsyo.jpg', NULL, '2025-08-25 19:55:26', '2025-08-25 19:55:26'),
(111, 'thumbnail', 'photo_3_2025-08-25_19-45-22.jpg', NULL, 'products/XU3UnTHv58c6jw3phKWtRKsm9pOrJ0067aRg7Hiy.jpg', NULL, '2025-08-25 19:56:50', '2025-08-25 19:56:50'),
(112, 'thumbnail', 'photo_4_2025-08-25_19-45-22.jpg', NULL, 'products/M4d2JykNRgpMUbaif3YW9YBAt4T3TamcIWSnP0cH.jpg', NULL, '2025-08-25 19:59:05', '2025-08-25 19:59:05'),
(113, 'thumbnail', 'photo_5_2025-08-25_19-45-22.jpg', NULL, 'products/hSiQ6jhkwYsAP3NpxpWW3nqKK9wovO0cpt5sm1MU.jpg', NULL, '2025-08-25 20:03:01', '2025-08-25 20:03:01'),
(114, 'thumbnail', 'photo_6_2025-08-25_19-45-22.jpg', NULL, 'products/jaRxGY0Q9RNwOQ74Ppx7wgNps6VaOxoj2rHnjpYJ.jpg', NULL, '2025-08-25 20:04:27', '2025-08-25 20:04:27'),
(115, 'thumbnail', 'photo_7_2025-08-25_19-45-22.jpg', NULL, 'products/CvEoeCGjnkVkfKjKN9bUoOd65nsf3xdMe6RcH9Sc.jpg', NULL, '2025-08-25 20:06:13', '2025-08-25 20:06:13'),
(116, 'thumbnail', 'photo_8_2025-08-25_19-45-22.jpg', NULL, 'products/Vnkp5At68Qa2biVExLaax649VXOENfHt31CdWQav.jpg', NULL, '2025-08-25 20:11:31', '2025-08-25 20:11:31'),
(117, 'thumbnail', 'photo_9_2025-08-25_19-45-22.jpg', NULL, 'products/lOQB7q8cZEgR7OpPNnvKtOiZNrzVYHgTkvUBEKAv.jpg', NULL, '2025-08-25 20:12:53', '2025-08-25 20:12:53'),
(118, 'thumbnail', 'photo_10_2025-08-25_19-45-22.jpg', NULL, 'products/qnuUTuhUTCmUHGLdDULxYOcExS4jTbNVkcTExXcs.jpg', NULL, '2025-08-25 20:15:35', '2025-08-25 20:15:35'),
(119, 'thumbnail', 'photo_11_2025-08-25_19-45-22.jpg', NULL, 'products/M3Ydiaocm2ewl8g58T8qfI8fQ1ytkzoyCTLntbf5.jpg', NULL, '2025-08-25 20:17:51', '2025-08-25 20:17:51'),
(120, 'thumbnail', 'photo_12_2025-08-25_19-45-22.jpg', NULL, 'products/fdWlMo41igq4HzZLZDNVEU8bPvbvjYG006vXclzx.jpg', NULL, '2025-08-25 20:20:39', '2025-08-25 20:20:39'),
(121, 'thumbnail', 'photo_13_2025-08-25_19-45-22.jpg', NULL, 'products/mgEVOJ7ephK8kNrywdftybOvGYly5encG3DAQcVP.jpg', NULL, '2025-08-25 20:25:24', '2025-08-25 20:25:24'),
(122, 'thumbnail', 'photo_14_2025-08-25_19-45-22.jpg', NULL, 'products/QRYiZifH7fKN1BEqfWljZcW6aEXp24o1EK7gt31w.jpg', NULL, '2025-08-25 20:26:42', '2025-08-25 20:26:42'),
(123, 'thumbnail', 'photo_15_2025-08-25_19-45-22.jpg', NULL, 'products/3hYqJ8CljzTj68F649yShtTVZwbyJJF7rVMYGf2Q.jpg', NULL, '2025-08-25 20:28:01', '2025-08-25 20:28:01'),
(124, 'thumbnail', 'photo_16_2025-08-25_19-45-22.jpg', NULL, 'products/ffTKnbgIhTjRG9bETjjHdqIUprey9dfVuPeOZlgg.jpg', NULL, '2025-08-25 20:30:48', '2025-08-25 20:30:48'),
(125, 'thumbnail', 'photo_17_2025-08-25_19-45-22.jpg', NULL, 'products/xjAKVC9nOroJZ90fd1CBRynuTKIElIMk7NaMn2M4.jpg', NULL, '2025-08-25 20:33:43', '2025-08-25 20:33:43'),
(126, 'thumbnail', 'photo_1_2025-08-25_20-41-59.jpg', NULL, 'products/J9JH9P9624P5UV0olfJ8XgNfA7Ucw2o0nSsmeQcH.jpg', NULL, '2025-08-25 20:45:14', '2025-08-25 20:45:14'),
(127, 'thumbnail', 'photo_2_2025-08-25_20-41-59.jpg', NULL, 'products/ZVfTe1HYHfALOiu15xfU1g09h3oAjyoNiKINGogU.jpg', NULL, '2025-08-25 20:46:38', '2025-08-25 20:46:38'),
(128, 'thumbnail', 'photo_3_2025-08-25_20-41-59.jpg', NULL, 'products/p6TekMclkeawD07eDR2Gtd6ZWbeHTCdiJd42jFt1.jpg', NULL, '2025-08-25 20:47:37', '2025-08-25 20:47:37'),
(129, 'thumbnail', 'photo_2025-08-26_12-43-12.jpg', NULL, 'products/GvSnIhwPEmvuoVIS0lrGHL3Y70iXQhOmQWQqF7J7.jpg', NULL, '2025-08-26 12:44:13', '2025-08-26 12:44:13'),
(133, 'thumbnail', 'Untitled-3.jpg', NULL, 'banners/SwWbhsmX764k6kMtM1OFT2YfI3u6bOMsRUZ5VUx5.jpg', NULL, '2025-08-26 13:08:53', '2025-08-26 13:08:53'),
(134, 'thumbnail', 'Untitled-5.jpg', NULL, 'banners/14vBMdUPQZY5SRISX7nX05ZgrGlqSEdAzKSSQORB.jpg', NULL, '2025-08-26 13:23:24', '2025-08-26 13:23:24'),
(135, 'image', 'colorful-school-supplies-desk.jpg', NULL, 'categories/2KF5bxDnPyAV4iQdJlafu9x5Dmgor3uaSJszTf4s.jpg', NULL, '2025-08-26 14:59:24', '2025-08-26 14:59:24'),
(136, 'thumbnail', 'photo_1_2025-08-26_14-52-32.jpg', NULL, 'products/d36WcWbe5jw87lBEYrL4GcjfUXxk7rk4THwrDB6A.jpg', NULL, '2025-08-26 15:03:39', '2025-08-26 15:03:39'),
(137, 'thumbnail', 'photo_2025-08-26_14-53-28.jpg', NULL, 'products/KoJIdEVWTkFXgbA9AOZ6UcF8lPeS79CJ9ppqDvWe.jpg', NULL, '2025-08-26 15:03:39', '2025-08-26 15:03:39'),
(138, 'thumbnail', 'photo_3_2025-08-26_14-52-32.jpg', NULL, 'products/MRF9p2NTvizbX5lXN6O8q58pliRxerHx7CKMOPIu.jpg', NULL, '2025-08-26 15:03:39', '2025-08-26 15:03:39'),
(139, 'thumbnail', 'photo_2_2025-08-26_14-52-32.jpg', NULL, 'products/NZqi090Rlxcn9JOnFb7OaHfcFnOldaeTpD1P50c2.jpg', NULL, '2025-08-26 15:03:39', '2025-08-26 15:03:39'),
(140, 'thumbnail', 'photo_5_2025-08-26_15-04-04.jpg', NULL, 'products/qxCFKOUbWII9CcsIjUEaVMPjHnjEZ61lzyfAxj2P.jpg', NULL, '2025-08-26 15:18:15', '2025-08-26 15:18:15'),
(141, 'thumbnail', 'photo_6_2025-08-26_15-04-04.jpg', NULL, 'products/IDrLKfzWTkO3rIImsNfNF4sqIu769WScSRSKjDVz.jpg', NULL, '2025-08-26 15:18:16', '2025-08-26 15:18:16'),
(142, 'thumbnail', 'photo_1_2025-08-26_15-04-04.jpg', NULL, 'products/DnO6id5oo2nc6tFyWRHESdXKvk6WQsUeFXVE2vNk.jpg', NULL, '2025-08-26 15:18:16', '2025-08-26 15:18:16'),
(143, 'thumbnail', 'photo_2_2025-08-26_15-04-04.jpg', NULL, 'products/NJ1AAQET2i628icugZo0fUkh1eCIcJCOo6hLCoEG.jpg', NULL, '2025-08-26 15:18:16', '2025-08-26 15:18:16'),
(144, 'thumbnail', 'photo_4_2025-08-26_15-04-04.jpg', NULL, 'products/yOqgCFcwLkCEywS451a7gUWxnaaLDThpfKrPVdB2.jpg', NULL, '2025-08-26 15:18:16', '2025-08-26 15:18:16'),
(145, 'thumbnail', 'photo_3_2025-08-26_15-04-04.jpg', NULL, 'products/CYUaLiMkJCzwdahnqxWSkB70Vbah13Zeiyxzsugf.jpg', NULL, '2025-08-26 15:18:16', '2025-08-26 15:18:16'),
(146, 'thumbnail', 'photo_5_2025-08-26_15-20-02.jpg', NULL, 'products/Rb3gxtgIm2zjE9UguUwrAEpQ6WufofGj50IRUTNE.jpg', NULL, '2025-08-26 15:28:52', '2025-08-26 15:28:52'),
(147, 'thumbnail', 'photo_6_2025-08-26_15-20-02.jpg', NULL, 'products/Q2nAm2yx8248EJNyA6ukLZUosulRQHeyA9Oycbxy.jpg', NULL, '2025-08-26 15:28:52', '2025-08-26 15:28:52'),
(148, 'thumbnail', 'photo_2_2025-08-26_15-20-02.jpg', NULL, 'products/RFdGcH4LNpXaHV1W2QuAgLLF27pguZgITZHx6REB.jpg', NULL, '2025-08-26 15:28:52', '2025-08-26 15:28:52'),
(149, 'thumbnail', 'photo_1_2025-08-26_15-20-02.jpg', NULL, 'products/e7Ehrne11pP1cLfWKM6n2vN4mLGmGDP9wOUAKea2.jpg', NULL, '2025-08-26 15:28:52', '2025-08-26 15:28:52'),
(150, 'thumbnail', 'photo_4_2025-08-26_15-20-02.jpg', NULL, 'products/wn2YiJg8JosL6OhOFhU4NPgmypRJVk6GYmsiPX8k.jpg', NULL, '2025-08-26 15:28:52', '2025-08-26 15:28:52'),
(151, 'thumbnail', 'photo_3_2025-08-26_15-20-02.jpg', NULL, 'products/XrBt7BYbd9RXRLeu2do6mQhb3gIlzlh5ftoNDttv.jpg', NULL, '2025-08-26 15:28:52', '2025-08-26 15:28:52'),
(152, 'thumbnail', 'photo_4_2025-08-26_15-34-01.jpg', NULL, 'products/K2dzOBItCTCa0hSc5FGlTpxNLQOEZ3O3h3363LFr.jpg', NULL, '2025-08-26 15:38:05', '2025-08-26 15:38:05'),
(153, 'thumbnail', 'photo_5_2025-08-26_15-34-01.jpg', NULL, 'products/4lZHFfrE8RRkL3TKJaSdyjFFvUQhtVZ1AceKUWPD.jpg', NULL, '2025-08-26 15:38:05', '2025-08-26 15:38:05'),
(154, 'thumbnail', 'photo_2_2025-08-26_15-34-01.jpg', NULL, 'products/T3YPXBkUhrdsuK4Q7CGbJWMO7IxaHXDOu9Rzshat.jpg', NULL, '2025-08-26 15:38:05', '2025-08-26 15:38:05'),
(155, 'thumbnail', 'photo_1_2025-08-26_15-34-01.jpg', NULL, 'products/r9MUKw45LrvxienWPe71EjA6OzATiCtj2KAyyuhf.jpg', NULL, '2025-08-26 15:38:05', '2025-08-26 15:38:05'),
(156, 'thumbnail', 'photo_3_2025-08-26_15-34-01.jpg', NULL, 'products/c8duqfQQyJe6zv8BsjtY5vEOFRAoYdAWeXswkrS8.jpg', NULL, '2025-08-26 15:38:05', '2025-08-26 15:38:05'),
(157, 'thumbnail', 'photo_1_2025-08-26_15-39-54.jpg', NULL, 'products/5ZfKSGAjpf8764CF3mBc80PuJjoy4tkxTgjHaRdP.jpg', NULL, '2025-08-26 15:45:29', '2025-08-26 15:45:29'),
(158, 'thumbnail', 'photo_2_2025-08-26_15-39-54.jpg', NULL, 'products/cMTPgwE15uVE3kK5H95Eaw3WZSWJy6npYm9BNs2u.jpg', NULL, '2025-08-26 15:45:29', '2025-08-26 15:45:29'),
(159, 'thumbnail', 'photo_5_2025-08-26_15-46-25.jpg', NULL, 'products/IPxGaaJRN2JLjV4CBWDPybfiyMHbtY5uzG0m5yaU.jpg', NULL, '2025-08-26 15:50:28', '2025-08-26 15:50:28'),
(160, 'thumbnail', 'photo_2_2025-08-26_15-46-25.jpg', NULL, 'products/PseAlylUq8xSNDZ5lJQ9YrcIVGYXLmtqLeqSCtaW.jpg', NULL, '2025-08-26 15:50:28', '2025-08-26 15:50:28'),
(161, 'thumbnail', 'photo_1_2025-08-26_15-46-25.jpg', NULL, 'products/gZ3KjdMQZz5xGpYjxrHUIhcGKRTRugCvwFIJ0hA1.jpg', NULL, '2025-08-26 15:50:28', '2025-08-26 15:50:28'),
(162, 'thumbnail', 'photo_4_2025-08-26_15-46-25.jpg', NULL, 'products/KtCmoIskeeaDBHRX3Rxa2FX8a7xF1OS4iCOn6pXe.jpg', NULL, '2025-08-26 15:50:28', '2025-08-26 15:50:28'),
(163, 'thumbnail', 'photo_3_2025-08-26_15-46-25.jpg', NULL, 'products/yGiTeO3NO45704c6luulip0i4iQDXZPe5EAp8VMX.jpg', NULL, '2025-08-26 15:50:28', '2025-08-26 15:50:28'),
(164, 'thumbnail', 'photo_1_2025-08-26_15-51-43.jpg', NULL, 'products/5heKCeKeY6ZYn9wa5KOCkm7HVf6L9LQPplA3PPwh.jpg', NULL, '2025-08-26 15:58:41', '2025-08-26 15:58:41'),
(165, 'thumbnail', 'photo_2_2025-08-26_15-51-43.jpg', NULL, 'products/brIs5sdzZEabPOArTyRJ0FluayOoCt3BVyPlZCyI.jpg', NULL, '2025-08-26 15:58:41', '2025-08-26 15:58:41'),
(166, 'thumbnail', 'photo_4_2025-08-26_15-59-29.jpg', NULL, 'products/WWMupEqcMDSORMsZ2aqzPl3RUkVk846jOCR52Fzb.jpg', NULL, '2025-08-26 16:05:16', '2025-08-26 16:05:16'),
(167, 'thumbnail', 'photo_1_2025-08-26_15-59-29.jpg', NULL, 'products/8XnvYSXZaDnb5P64Mu5fR0JBMsEbRDNa6Uqbm9cC.jpg', NULL, '2025-08-26 16:05:16', '2025-08-26 16:05:16'),
(168, 'thumbnail', 'photo_3_2025-08-26_15-59-29.jpg', NULL, 'products/9TuccVNhJ9Ua97Y8WnoNXEKsY4YGVxYG0y3PNTeZ.jpg', NULL, '2025-08-26 16:05:16', '2025-08-26 16:05:16'),
(169, 'thumbnail', 'photo_2_2025-08-26_15-59-29.jpg', NULL, 'products/DbJ64jUbsK3tu3BSKPIGSFHByvUcqrE2kJgoEvJN.jpg', NULL, '2025-08-26 16:05:16', '2025-08-26 16:05:16'),
(170, 'thumbnail', 'photo_5_2025-08-26_15-59-29.jpg', NULL, 'products/Z9ff22tuas8Qg2YMYJqOEXDojmR2sNYy3nkuyEiw.jpg', NULL, '2025-08-26 16:05:16', '2025-08-26 16:05:16'),
(171, 'thumbnail', 'photo_4_2025-08-26_16-06-19.jpg', NULL, 'products/bd0yyRzeC4MAWJoRAtt6dYKb6WjIMicZfXKpFweD.jpg', NULL, '2025-08-26 16:12:59', '2025-08-26 16:12:59'),
(172, 'thumbnail', 'photo_1_2025-08-26_16-06-19.jpg', NULL, 'products/yRyfJXMFo2AaH8q08RPasD2bas3IxE7BVhTZUS9j.jpg', NULL, '2025-08-26 16:12:59', '2025-08-26 16:12:59'),
(173, 'thumbnail', 'photo_3_2025-08-26_16-06-19.jpg', NULL, 'products/Kfus6exQAa1MN6a65Y6AjeZW2sLeRyXWe6pbSxT3.jpg', NULL, '2025-08-26 16:12:59', '2025-08-26 16:12:59'),
(174, 'thumbnail', 'photo_2_2025-08-26_16-06-19.jpg', NULL, 'products/8BJYy5W4K4Gv1qwPnV3L0RnaC1iWq31l8GzyPsR6.jpg', NULL, '2025-08-26 16:12:59', '2025-08-26 16:12:59'),
(175, 'thumbnail', 'photo_5_2025-08-26_16-14-54.jpg', NULL, 'products/sG3sNHZBQrjKaAbCtB6UqulOdcGaO10Q67iiMkK1.jpg', NULL, '2025-08-26 16:18:46', '2025-08-26 16:18:46'),
(176, 'thumbnail', 'photo_2_2025-08-26_16-14-54.jpg', NULL, 'products/5Nd2dc7e4UTGiqK6D89aqMVixcF6LGl09Wtj8WXs.jpg', NULL, '2025-08-26 16:18:46', '2025-08-26 16:18:46'),
(177, 'thumbnail', 'photo_1_2025-08-26_16-14-54.jpg', NULL, 'products/yD34JdkzgUG4Iz6tbNjkFDNqgGkjtXgBaGhunH5z.jpg', NULL, '2025-08-26 16:18:46', '2025-08-26 16:18:46'),
(178, 'thumbnail', 'photo_4_2025-08-26_16-14-54.jpg', NULL, 'products/9lAXB4dTVgqaa2ewmif6Zd96jODSYmu8YC0Y6y9Z.jpg', NULL, '2025-08-26 16:18:46', '2025-08-26 16:18:46'),
(179, 'thumbnail', 'photo_3_2025-08-26_16-14-54.jpg', NULL, 'products/O6dNHrhA4Ytnr0u6ICZwqOFVoxam9cKzhyR4n6Pl.jpg', NULL, '2025-08-26 16:18:46', '2025-08-26 16:18:46'),
(180, 'thumbnail', 'photo_6_2025-08-26_16-14-54.jpg', NULL, 'products/bogqFPGlhvvmlBBNCH2si5H1OjRl1ON1L4DFws5j.jpg', NULL, '2025-08-26 16:18:46', '2025-08-26 16:18:46'),
(181, 'thumbnail', 'photo_4_2025-08-26_16-19-24.jpg', NULL, 'products/gZUXM2N5FltG8F4ut4Lsu15bdydtEU4vJxURdh9A.jpg', NULL, '2025-08-26 16:24:27', '2025-08-26 16:24:27'),
(182, 'thumbnail', 'photo_6_2025-08-26_16-19-24.jpg', NULL, 'products/DTutFB8NMB4Jcf64rS97agsF5QYu8OHz3qNi2N7N.jpg', NULL, '2025-08-26 16:24:27', '2025-08-26 16:24:27'),
(183, 'thumbnail', 'photo_2_2025-08-26_16-19-24.jpg', NULL, 'products/G2EGrhtwhJXX2Yyf7OYJ2BuSJmeDqnEL0Sz8ATkr.jpg', NULL, '2025-08-26 16:24:27', '2025-08-26 16:24:27'),
(184, 'thumbnail', 'photo_1_2025-08-26_16-19-24.jpg', NULL, 'products/a4kJuTjKJ65orqVmnPM12ZahHsj1PEVRuv2rB5Jf.jpg', NULL, '2025-08-26 16:24:27', '2025-08-26 16:24:27'),
(185, 'thumbnail', 'photo_3_2025-08-26_16-19-24.jpg', NULL, 'products/f4EcUGw6vEZt0Tzy72nivZmqGUqJ3AmzwZL3eDiz.jpg', NULL, '2025-08-26 16:24:27', '2025-08-26 16:24:27'),
(186, 'thumbnail', 'photo_5_2025-08-26_16-19-24.jpg', NULL, 'products/OWVpCiSOJIMTzoPpASlyiY8CIF1999pqfZieYH3L.jpg', NULL, '2025-08-26 16:24:27', '2025-08-26 16:24:27'),
(187, 'thumbnail', 'photo_9_2025-08-26_16-30-06.jpg', NULL, 'products/DpKsnjlnscbvMEP6IuJgwX4xw5WdVvrcYKrfAHFo.jpg', NULL, '2025-08-26 16:35:47', '2025-08-26 16:35:47'),
(188, 'thumbnail', 'photo_2_2025-08-26_16-30-06.jpg', NULL, 'products/u9rV90uCj0IFvUPm471bAJz28xd4CLAGz431w1OR.jpg', NULL, '2025-08-26 16:35:47', '2025-08-26 16:35:47'),
(189, 'thumbnail', 'photo_3_2025-08-26_16-30-06.jpg', NULL, 'products/PLvCS3ZCf5IdFw3TkYAeuABP0btfgbQ8zX5QLJyj.jpg', NULL, '2025-08-26 16:35:47', '2025-08-26 16:35:47'),
(190, 'thumbnail', 'photo_6_2025-08-26_16-30-06.jpg', NULL, 'products/VUMMHFzLpHdf6JNi3hDwqBEBkRZk0c7XibvypNdn.jpg', NULL, '2025-08-26 16:35:47', '2025-08-26 16:35:47'),
(191, 'thumbnail', 'photo_5_2025-08-26_16-30-06.jpg', NULL, 'products/zTk4r4keGPkrb1EI3ey2RXSNWehkrVNQiw2HC1FH.jpg', NULL, '2025-08-26 16:35:47', '2025-08-26 16:35:47'),
(192, 'thumbnail', 'photo_8_2025-08-26_16-30-06.jpg', NULL, 'products/b51H4FMk6ipVrzkYdKwhf7PaxdEzsF3NGsVjws2e.jpg', NULL, '2025-08-26 16:35:47', '2025-08-26 16:35:47'),
(193, 'thumbnail', 'photo_7_2025-08-26_16-30-06.jpg', NULL, 'products/DrEIAK5kkwvZfCnXuVJ7ZgkoFA3niti6Y6Rl5wnt.jpg', NULL, '2025-08-26 16:35:47', '2025-08-26 16:35:47'),
(194, 'thumbnail', 'photo_4_2025-08-26_16-36-48.jpg', NULL, 'products/1v6GoCOIdiFiJJmcqeC90sMNLRp8lmFrHVRdNPTv.jpg', NULL, '2025-08-26 16:40:45', '2025-08-26 16:40:45'),
(195, 'thumbnail', 'photo_1_2025-08-26_16-36-48.jpg', NULL, 'products/4SRvZol1i09Zu7wBkDzRa46X9sLWFSFjd4hfZ6Np.jpg', NULL, '2025-08-26 16:40:45', '2025-08-26 16:40:45'),
(196, 'thumbnail', 'photo_3_2025-08-26_16-36-48.jpg', NULL, 'products/57oSqFWENDBLRhovoS3MYGNwqqdtXLPuRrYhB5za.jpg', NULL, '2025-08-26 16:40:45', '2025-08-26 16:40:45'),
(197, 'thumbnail', 'photo_2_2025-08-26_16-36-48.jpg', NULL, 'products/xasYdK4638FmJs4kQgvZQdopQ2Bwyy2DLuakbfBu.jpg', NULL, '2025-08-26 16:40:45', '2025-08-26 16:40:45'),
(198, 'thumbnail', 'photo_5_2025-08-26_16-36-48.jpg', NULL, 'products/6LA7tSvODZQCPO42KFPvCBlF32asBA0j93IwiqJI.jpg', NULL, '2025-08-26 16:40:45', '2025-08-26 16:40:45'),
(199, 'thumbnail', 'photo_5_2025-08-26_16-42-00.jpg', NULL, 'products/UzqMTATVUmfkhWp3Oq3iKXqZYgk7CieTNdapLp61.jpg', NULL, '2025-08-26 16:50:51', '2025-08-26 16:50:51'),
(200, 'thumbnail', 'photo_6_2025-08-26_16-42-00.jpg', NULL, 'products/Nmh3f9nKho89uN4WqCprLxH4EppniSNUgjdqoK3L.jpg', NULL, '2025-08-26 16:50:51', '2025-08-26 16:50:51'),
(201, 'thumbnail', 'photo_1_2025-08-26_16-42-00.jpg', NULL, 'products/aITZe6fMXBatInnKIZ2PYvnzgj3apuGmFhjSyOhu.jpg', NULL, '2025-08-26 16:50:51', '2025-08-26 16:50:51'),
(202, 'thumbnail', 'photo_3_2025-08-26_16-42-00.jpg', NULL, 'products/r2R9BZ8N3VQeED2RmLvwndcQIrAYzpvc3VShLTK0.jpg', NULL, '2025-08-26 16:50:51', '2025-08-26 16:50:51'),
(203, 'thumbnail', 'photo_2_2025-08-26_16-42-00.jpg', NULL, 'products/uRCiigj5Yjs6rGGb6TwLjdaF0fgzSBMMRH7j4toN.jpg', NULL, '2025-08-26 16:50:51', '2025-08-26 16:50:51'),
(204, 'thumbnail', 'photo_4_2025-08-26_16-42-00.jpg', NULL, 'products/vSw3UFSNnmbJ2EyeUjscL9wCpMtRoqQrugWu81ZD.jpg', NULL, '2025-08-26 16:50:51', '2025-08-26 16:50:51'),
(205, 'thumbnail', 'photo_7_2025-08-26_16-51-38.jpg', NULL, 'products/BGD1WDuhOKTjpA2zSIMc2794qt3CZHCBSx2ugVs0.jpg', NULL, '2025-08-26 16:56:48', '2025-08-26 16:56:48'),
(206, 'thumbnail', 'photo_2_2025-08-26_16-51-38.jpg', NULL, 'products/ODjtNye5rytjDTqKRCOcMgmLmJgKJS4KowDjKNEe.jpg', NULL, '2025-08-26 16:56:48', '2025-08-26 16:56:48'),
(207, 'thumbnail', 'photo_1_2025-08-26_16-51-38.jpg', NULL, 'products/pFuKFImkFQcfwxfQQE8zqeYJKb0FgI9DvZs1DImM.jpg', NULL, '2025-08-26 16:56:48', '2025-08-26 16:56:48'),
(208, 'thumbnail', 'photo_4_2025-08-26_16-51-38.jpg', NULL, 'products/bel2ySjXlNtWkMUwqMZkbQIEyZY9MqSKtczJtB9Z.jpg', NULL, '2025-08-26 16:56:48', '2025-08-26 16:56:48'),
(209, 'thumbnail', 'photo_3_2025-08-26_16-51-38.jpg', NULL, 'products/lRHGW5COP0ksVUmWYvCiGY9DHWRYCL3vG2mmnDNP.jpg', NULL, '2025-08-26 16:56:48', '2025-08-26 16:56:48'),
(210, 'thumbnail', 'photo_6_2025-08-26_16-51-38.jpg', NULL, 'products/SQgFuHzj9GozAxd63370rnpkZGa1NM9qBXT8Cx6A.jpg', NULL, '2025-08-26 16:56:48', '2025-08-26 16:56:48'),
(211, 'thumbnail', 'photo_5_2025-08-26_16-51-38.jpg', NULL, 'products/OK1Q0EL6gRVZPULUHyc6a8R0IOJuGt6r3AGn7Gr5.jpg', NULL, '2025-08-26 16:56:48', '2025-08-26 16:56:48'),
(212, 'thumbnail', 'photo_5_2025-08-26_18-00-11.jpg', NULL, 'products/E1P4p9Cja7NEcXph2A8gDA2jVSLKFHym23Tpz6EM.jpg', NULL, '2025-08-26 18:03:27', '2025-08-26 18:03:27'),
(213, 'thumbnail', 'photo_9_2025-08-26_18-00-11.jpg', NULL, 'products/EQA93LD8mK0p1Xt8HFxiYn346lKK0R1XABlbSRuD.jpg', NULL, '2025-08-26 18:07:46', '2025-08-26 18:07:46'),
(214, 'thumbnail', 'photo_8_2025-08-26_18-00-11.jpg', NULL, 'products/pFDAZ7vHMmPGKtrQCIeow1yFgpnovUqZ1buEnywm.jpg', NULL, '2025-08-26 18:11:13', '2025-08-26 18:11:13'),
(215, 'thumbnail', 'photo_6_2025-08-26_18-00-11.jpg', NULL, 'products/LYbBKWnmKUXBEWalhF2Rf2FYXqYmhebKh4zDANmW.jpg', NULL, '2025-08-26 18:12:47', '2025-08-26 18:12:47'),
(216, 'thumbnail', 'photo_1_2025-08-26_18-00-11.jpg', NULL, 'products/jLXaBmjCruvbSLcFvCBYFEaXhMCY8wXyVONIzkrv.jpg', NULL, '2025-08-26 18:30:09', '2025-08-26 18:30:09'),
(217, 'thumbnail', 'photo_2_2025-08-26_18-00-11.jpg', NULL, 'products/2BNwTj7zLE404uHMWEQXnSwdzV3VyHDYKI9AqRIi.jpg', NULL, '2025-08-26 18:31:36', '2025-08-26 18:31:36'),
(218, 'thumbnail', 'photo_3_2025-08-26_18-00-11.jpg', NULL, 'products/nL2sWnXaAcycy1ZrMe56hdrujPv7j7Tokuy1d4wL.jpg', NULL, '2025-08-26 18:33:05', '2025-08-26 18:33:05'),
(219, 'thumbnail', 'photo_4_2025-08-26_18-00-11.jpg', NULL, 'products/oV2zCOm3uBHzM8tYhOhEikMlXZSt8ttxojr5vgmB.jpg', NULL, '2025-08-26 18:35:22', '2025-08-26 18:35:22'),
(220, 'thumbnail', 'photo_7_2025-08-26_18-00-11.jpg', NULL, 'products/G8JrIbqpgesVwNw1IdQ6Ac2E0XSkkbsjyIZaMNwk.jpg', NULL, '2025-08-26 18:37:04', '2025-08-26 18:37:04'),
(221, 'thumbnail', 'photo_1_2025-08-26_19-58-31.jpg', NULL, 'products/8TGqEAkwmEHMhf6u6TqpglZftY1uE99bykaxnBq3.jpg', NULL, '2025-08-26 20:02:47', '2025-08-26 20:02:47'),
(222, 'thumbnail', 'photo_7_2025-08-26_20-13-14.jpg', NULL, 'products/EYjCRW2B7Ltcsi8sl3rJD5rfY7ei74WNuhWIZY4A.jpg', NULL, '2025-08-26 20:16:26', '2025-08-26 20:16:26'),
(223, 'thumbnail', 'photo_8_2025-08-26_20-13-14.jpg', NULL, 'products/B9u0LvMx2wC4Eob0w2yXB8XkCowVE9JZuD2BiyvK.jpg', NULL, '2025-08-26 20:17:59', '2025-08-26 20:17:59'),
(224, 'thumbnail', 'photo_6_2025-08-26_20-13-14.jpg', NULL, 'products/GVG3sXVpHjvZ8boYpIRC9vGBPNrFj2JWUkqvIESG.jpg', NULL, '2025-08-26 20:19:23', '2025-08-26 20:19:23'),
(225, 'thumbnail', 'photo_14_2025-08-26_20-13-14.jpg', NULL, 'products/SclFZuctboNy1ZGgdcdV6YXoJpAUrExcUrJxao9u.jpg', NULL, '2025-08-26 20:20:52', '2025-08-26 20:20:52'),
(226, 'thumbnail', 'photo_13_2025-08-26_20-13-14.jpg', NULL, 'products/zz8WpYnnxtS33nvPnajoBR2dAE5gLotybRZp8ZUA.jpg', NULL, '2025-08-26 20:22:17', '2025-08-26 20:22:17'),
(227, 'thumbnail', 'photo_15_2025-08-26_20-13-14.jpg', NULL, 'products/jNUUX6Dqmpq5h7MVbyDbdUopVpnMmPNeKMpXhErU.jpg', NULL, '2025-08-26 20:26:22', '2025-08-26 20:26:22'),
(228, 'thumbnail', 'photo_12_2025-08-26_20-13-14.jpg', NULL, 'products/J2xrni3NLViMoy8yTQ2mClzAdku4NaIvVluU1Y5i.jpg', NULL, '2025-08-26 20:27:58', '2025-08-26 20:27:58'),
(229, 'thumbnail', 'photo_10_2025-08-26_20-13-14.jpg', NULL, 'products/Ou4W4we5JaKlwcPbBsChYAI6oir4oG6piEKZuszr.jpg', NULL, '2025-08-26 20:31:50', '2025-08-26 20:31:50'),
(230, 'image', 'photo_11_2025-08-26_20-13-14.jpg', NULL, 'products/3ZBvthW6O7CO26eMdwhwfKdJw6nMctqZlAhnCVBE.jpg', NULL, '2025-08-26 20:33:49', '2025-08-26 20:37:09'),
(231, 'thumbnail', 'photo_9_2025-08-26_20-13-14.jpg', NULL, 'products/37xQI4wyC8fsP1eQKUfmSMz0GY3O5TO7ng9YY4qF.jpg', NULL, '2025-08-26 20:35:46', '2025-08-26 20:35:46'),
(232, 'thumbnail', 'photo_1_2025-08-26_20-13-14.jpg', NULL, 'products/YFffkjzoOlg4nNQ8qxm89yrvjkZ1fNUUNvRLsNXG.jpg', NULL, '2025-08-26 20:39:02', '2025-08-26 20:39:02'),
(233, 'thumbnail', 'photo_2_2025-08-26_20-13-14.jpg', NULL, 'products/EjedL3jDccfO0lrMlMLnTog35gA9qWUFVIYhrr0F.jpg', NULL, '2025-08-26 20:40:05', '2025-08-26 20:40:05'),
(234, 'thumbnail', 'photo_4_2025-08-26_20-13-14.jpg', NULL, 'products/pDkcXdG02Jde9MwuLgThn3edQQYvsR4nV1MhJBpU.jpg', NULL, '2025-08-26 20:41:45', '2025-08-26 20:41:45'),
(235, 'thumbnail', 'photo_3_2025-08-26_20-13-14.jpg', NULL, 'products/sV7I5Ru1a92Z5A4ppaDqfVhfoY3fUdnvhCpcAqnf.jpg', NULL, '2025-08-26 20:43:07', '2025-08-26 20:43:07'),
(236, 'thumbnail', 'photo_10_2025-08-26_19-58-31.jpg', NULL, 'products/vvEHicvRwUalqZzkpYvfJn9PAMoHvZoeNvLZDLCg.jpg', NULL, '2025-08-26 20:44:25', '2025-08-26 20:44:25'),
(237, 'thumbnail', 'photo_5_2025-08-26_20-13-14.jpg', NULL, 'products/9r8yJLBNXTZaaDa7fDW0OqgKabi6Gr6XXt2JDaRs.jpg', NULL, '2025-08-26 20:45:18', '2025-08-26 20:45:18'),
(238, 'thumbnail', 'photo_9_2025-08-26_19-58-31.jpg', NULL, 'products/6GCtWjKuVef1W0qUYV21Om1tqryqqgKMd30x2V1Q.jpg', NULL, '2025-08-26 20:46:35', '2025-08-26 20:46:35'),
(239, 'image', 'flawless-image-photo-pencil-sharpener-isolated-white-background.jpg', NULL, 'categories/fNo6WzhpLfVDwsUYNbn7i47EDAR5hfw9UrjhrEtw.jpg', NULL, '2025-08-26 20:52:38', '2025-08-26 20:52:38'),
(240, 'thumbnail', 'photo_3_2025-08-26_19-58-31.jpg', NULL, 'products/eq4ZMxNkpplSgtQHhmId8vdv3cQomjTEVNN5d7M3.jpg', NULL, '2025-08-27 09:49:19', '2025-08-27 09:49:19'),
(241, 'thumbnail', 'photo_4_2025-08-26_19-58-31.jpg', NULL, 'products/2aDjFYcElt4Mse2kzsmIEVl3S46igOGYnyKXJ8aT.jpg', NULL, '2025-08-27 09:51:22', '2025-08-27 09:51:22'),
(242, 'thumbnail', 'photo_8_2025-08-26_19-58-31.jpg', NULL, 'products/aKNyFjf5yn2DNfNumrP8gMgwvybG7dSX2zE2pzWz.jpg', NULL, '2025-08-27 09:54:15', '2025-08-27 09:54:15'),
(243, 'thumbnail', 'photo_6_2025-08-26_19-58-31.jpg', NULL, 'products/gs9H3dZyjUEqfamke7zXiqVbxSdUutRSvGXjz6Y0.jpg', NULL, '2025-08-27 09:56:21', '2025-08-27 09:56:21'),
(244, 'thumbnail', 'photo_5_2025-08-26_19-58-31.jpg', NULL, 'products/64hj97hdnYE154CJLmzii3f0NKZ1lLvYL1RQ3gp9.jpg', NULL, '2025-08-27 09:58:28', '2025-08-27 09:58:28'),
(245, 'thumbnail', 'photo_2_2025-08-26_19-58-31.jpg', NULL, 'products/FRqLzAPiE2bTPrc6lf8P8U2zlphrDWk2UWDebL4p.jpg', NULL, '2025-08-27 09:59:58', '2025-08-27 09:59:58'),
(246, 'thumbnail', 'photo_7_2025-08-26_19-58-31.jpg', NULL, 'products/jyxYIKkEcXzEfR5dTRmy8rouyfh1uOAMVDCvTvmT.jpg', NULL, '2025-08-27 10:01:15', '2025-08-27 10:01:15'),
(247, 'thumbnail', 'photo_2025-08-27_10-58-54.jpg', NULL, 'products/kiuLsbaCpESnK8GTWPrkFHdUA5NoUt7ARli8SfdQ.jpg', NULL, '2025-08-27 11:03:41', '2025-08-27 11:03:41'),
(248, 'thumbnail', 'photo_11_2025-08-27_10-56-00.jpg', NULL, 'products/19ZnpT3ZZPqMDGYABxV5XTWVRdFSuhmPbF8y5aKJ.jpg', NULL, '2025-08-27 11:07:33', '2025-08-27 11:07:33'),
(249, 'thumbnail', 'photo_9_2025-08-27_10-56-00.jpg', NULL, 'products/B3OjMuvN8H5RyCprb9V2IqR8iHXvIEHzbuUDSeok.jpg', NULL, '2025-08-27 11:13:55', '2025-08-27 11:13:55'),
(250, 'thumbnail', 'photo_10_2025-08-27_10-56-00.jpg', NULL, 'products/pHmVfg52eQDGA3mIquVJ6p91XMvFadRZo0scsQBg.jpg', NULL, '2025-08-27 11:16:37', '2025-08-27 11:16:37'),
(251, 'thumbnail', 'photo_7_2025-08-27_10-56-00.jpg', NULL, 'products/flOafmIZeOf5uTRErWZ4YenV8j71gENvhUAJgZz5.jpg', NULL, '2025-08-27 11:20:36', '2025-08-27 11:20:36'),
(252, 'thumbnail', 'photo_25_2025-08-27_11-18-39.jpg', NULL, 'products/aJtusXS4OFHRvd0UEVtFGpc96ezlRjmJfIwkRWcQ.jpg', NULL, '2025-08-27 11:21:49', '2025-08-27 11:21:49'),
(253, 'thumbnail', 'photo_8_2025-08-27_10-56-00.jpg', NULL, 'products/dN0iYswOpaOeebTd3RKR8iOXQ7wPHxRE1Pm4DpZe.jpg', NULL, '2025-08-27 11:23:24', '2025-08-27 11:23:24'),
(254, 'thumbnail', 'photo_27_2025-08-27_11-18-39.jpg', NULL, 'products/OQhyhVu7bGLXgzkDNiskyP3utFHlgxa8qsb327Pf.jpg', NULL, '2025-08-27 11:26:01', '2025-08-27 11:26:01'),
(255, 'thumbnail', 'photo_6_2025-08-27_10-56-00.jpg', NULL, 'products/dcaCckDpLUw3VF0uFZvsUZYXdH9QiMQygWwouwYi.jpg', NULL, '2025-08-27 11:27:12', '2025-08-27 11:27:12'),
(256, 'thumbnail', 'photo_26_2025-08-27_11-18-39.jpg', NULL, 'products/3nMfHtikrbHn6ihBue6Y27Q4mAvXZADSx3EFQF5L.jpg', NULL, '2025-08-27 11:27:18', '2025-08-27 11:27:18'),
(257, 'thumbnail', 'photo_5_2025-08-27_10-56-00.jpg', NULL, 'products/xHUZAa2FRRB6h2xAPNcUKMFmfRr90wmUbkFbBac6.jpg', NULL, '2025-08-27 11:29:50', '2025-08-27 11:29:50'),
(258, 'thumbnail', 'photo_24_2025-08-27_11-18-39.jpg', NULL, 'products/z9L1i0ik2vHkM3T1IgMTH7wlbFyVc4H1e2kIrLSi.jpg', NULL, '2025-08-27 11:30:39', '2025-08-27 11:30:39'),
(259, 'thumbnail', 'photo_23_2025-08-27_11-18-39.jpg', NULL, 'products/SrKYKn8eH4Q45FHrzGooVmPAoaw1PSpSxcgJJTqQ.jpg', NULL, '2025-08-27 11:32:05', '2025-08-27 11:32:05'),
(260, 'thumbnail', 'photo_11_2025-08-27_11-18-39.jpg', NULL, 'products/CxkbmerRSKGxIJ2yAr6gikFOZCVBlFiaw4GuyNd5.jpg', NULL, '2025-08-27 11:33:23', '2025-08-27 11:33:23'),
(261, 'thumbnail', 'photo_4_2025-08-27_10-56-00.jpg', NULL, 'products/kc9KSEXvSC49mEENxnI0R9vld2g9CSmBCNdfpiAz.jpg', NULL, '2025-08-27 11:34:38', '2025-08-27 11:34:38'),
(262, 'thumbnail', 'photo_1_2025-08-27_10-56-00.jpg', NULL, 'products/m61M8659JFB3yWT0YGnnHM8g53OrZliRPUmEsGBd.jpg', NULL, '2025-08-27 11:37:10', '2025-08-27 11:37:10'),
(263, 'thumbnail', 'photo_10_2025-08-27_11-18-39.jpg', NULL, 'products/bgquAXTI2VAhE9aH71drPCgwLi3d8048E8r56AgS.jpg', NULL, '2025-08-27 11:39:34', '2025-08-27 11:39:34'),
(264, 'thumbnail', 'photo_2_2025-08-27_10-56-00.jpg', NULL, 'products/Vthb4Rqm5O9PXGwMsukYMb8KSjXXMrkJ6pXcle3t.jpg', NULL, '2025-08-27 11:40:55', '2025-08-27 11:40:55'),
(265, 'thumbnail', 'photo_9_2025-08-27_11-18-39.jpg', NULL, 'products/n5W0PdAokWeNzCdv8ACNkBbWNsmaCQ1hsW70Ot2z.jpg', NULL, '2025-08-27 11:41:52', '2025-08-27 11:41:52'),
(266, 'thumbnail', 'photo_8_2025-08-27_11-18-39.jpg', NULL, 'products/4QMjGCRjh4JqNB3gNUbFB8I8v08OeYFp0a3dOo3s.jpg', NULL, '2025-08-27 11:43:21', '2025-08-27 11:43:21'),
(267, 'thumbnail', 'photo_3_2025-08-27_10-56-00.jpg', NULL, 'products/3EGXb6teahSfNnqNffsqRpEJBNrXIw7ujYNwPTPL.jpg', NULL, '2025-08-27 11:45:29', '2025-08-27 11:45:29'),
(268, 'thumbnail', 'photo_14_2025-08-27_11-18-39.jpg', NULL, 'products/HfIq1tNEzfLaMXwurLlNWIG4xE0wlZp6PBtd2vCR.jpg', NULL, '2025-08-27 11:45:42', '2025-08-27 11:45:42'),
(269, 'thumbnail', 'photo_15_2025-08-27_11-18-39.jpg', NULL, 'products/M4GieUigQZiC3gZ4Y7R8kT9FY2kRPeQeddFriFmQ.jpg', NULL, '2025-08-27 11:47:11', '2025-08-27 11:47:11'),
(270, 'thumbnail', 'photo_13_2025-08-27_11-18-39.jpg', NULL, 'products/416csXptlgA2BAObicvYViQaFuCevONN7klR0oDg.jpg', NULL, '2025-08-27 11:49:53', '2025-08-27 11:49:53'),
(271, 'thumbnail', 'photo_12_2025-08-27_11-18-39.jpg', NULL, 'products/JvDfWSyHL3pm7oSPXBSpdv6kIBjyADbFArmrBAxT.jpg', NULL, '2025-08-27 11:51:07', '2025-08-27 11:51:07'),
(272, 'thumbnail', 'photo_16_2025-08-27_11-18-39.jpg', NULL, 'products/XUHaRa7nio9L1whu9bLZLX5RW3FyZvkWIDGyaJzi.jpg', NULL, '2025-08-27 11:52:21', '2025-08-27 11:52:21'),
(273, 'thumbnail', 'photo_2_2025-08-27_11-47-07.jpg', NULL, 'products/E6oa6KrMi9Sauw8nuwbtsPf2OHEF0svpj5JOQrma.jpg', NULL, '2025-08-27 11:52:52', '2025-08-27 11:52:52'),
(274, 'thumbnail', 'photo_17_2025-08-27_11-18-39.jpg', NULL, 'products/A8wjFkvjBNVyEy7Qk3zu7pEPukalFjLjb5s6x0fr.jpg', NULL, '2025-08-27 11:53:42', '2025-08-27 11:53:42'),
(275, 'thumbnail', 'photo_18_2025-08-27_11-18-39.jpg', NULL, 'products/xyVUuEk5KVv1l7anKL4dzLjqN44kAhZlvGWRcoki.jpg', NULL, '2025-08-27 11:55:01', '2025-08-27 11:55:01'),
(276, 'thumbnail', 'photo_19_2025-08-27_11-18-39.jpg', NULL, 'products/YC9jolmSddgvm65QVUR48vevFSgoBVbMzpg3USUw.jpg', NULL, '2025-08-27 11:56:09', '2025-08-27 11:56:09'),
(277, 'thumbnail', 'photo_1_2025-08-27_11-47-07.jpg', NULL, 'products/HoCot1g8r5DMS9Zkn8c0f9u5a9qumE0NGYITcMk6.jpg', NULL, '2025-08-27 11:57:07', '2025-08-27 11:57:07'),
(278, 'thumbnail', 'photo_20_2025-08-27_11-18-39.jpg', NULL, 'products/8X30FTNEGfrOYp27f0Emh7amtnCr5hmX16GGvGog.jpg', NULL, '2025-08-27 11:58:50', '2025-08-27 11:58:50'),
(279, 'thumbnail', 'photo_10_2025-08-27_11-47-07.jpg', NULL, 'products/nI2BmVuPpJo7gwX7uARuGCGBVprE9LdKOgfyzaLa.jpg', NULL, '2025-08-27 11:59:32', '2025-08-27 11:59:32'),
(280, 'thumbnail', 'photo_22_2025-08-27_11-18-39.jpg', NULL, 'products/zlM03AHBCzEhhnJdYNHt8t2BrL8nNkFtnqNWR641.jpg', NULL, '2025-08-27 12:01:02', '2025-08-27 12:01:02'),
(281, 'thumbnail', 'photo_1_2025-08-27_11-18-39.jpg', NULL, 'products/Vi9igSdwAw3OamQUFvwh9lpcstV2trnTrZwqiUYV.jpg', NULL, '2025-08-27 12:02:48', '2025-08-27 12:02:48'),
(282, 'thumbnail', 'photo_2_2025-08-27_11-18-39.jpg', NULL, 'products/I8tM4aGJcSM31iM6IF3vvOcDYzjwmDRlJc1g6piR.jpg', NULL, '2025-08-27 12:02:48', '2025-08-27 12:02:48'),
(283, 'thumbnail', 'photo_3_2025-08-27_11-18-39.jpg', NULL, 'products/jBlP9NPPoLWBvUEoo6BbyHQAdy7nShOOQzx4zdYf.jpg', NULL, '2025-08-27 12:04:00', '2025-08-27 12:04:00'),
(284, 'thumbnail', 'photo_7_2025-08-27_11-18-39.jpg', NULL, 'products/3OlbvrPwwAk3acA5OZRgyoPJa5Yv43W8ejTmQndX.jpg', NULL, '2025-08-27 12:05:31', '2025-08-27 12:05:31'),
(285, 'thumbnail', 'photo_6_2025-08-27_11-18-39.jpg', NULL, 'products/uy1J2vhWFtQDi8ziTCkJ5S9D9WeniTc8zHKxstyy.jpg', NULL, '2025-08-27 12:06:43', '2025-08-27 12:06:43'),
(286, 'thumbnail', 'photo_8_2025-08-27_11-47-07.jpg', NULL, 'products/gzIibi2UDDQAPmokPUsuT3lZFAFTRMafSJPCkKn3.jpg', NULL, '2025-08-27 12:06:57', '2025-08-27 12:06:57'),
(287, 'thumbnail', 'photo_5_2025-08-27_11-18-39.jpg', NULL, 'products/KgCjuBlWHVGsG8fm2m6VM9vSNIsT9csLkaOnAlgJ.jpg', NULL, '2025-08-27 12:08:04', '2025-08-27 12:08:04'),
(288, 'thumbnail', 'photo_4_2025-08-27_11-18-39.jpg', NULL, 'products/Lz5iJE0xUbao30vGf54ijBElcESvXdsZ2XPxQqtm.jpg', NULL, '2025-08-27 12:09:16', '2025-08-27 12:09:16'),
(289, 'thumbnail', 'photo_9_2025-08-27_11-47-07.jpg', NULL, 'products/5NMeJdciNvMAMDZpeGP0h8jXDNpASpE72izigCCk.jpg', NULL, '2025-08-27 12:09:46', '2025-08-27 12:09:46'),
(290, 'thumbnail', 'photo_1_2025-08-27_12-12-19.jpg', NULL, 'products/4ybahpu9thSTnMzRFnQT45bheibzXkqfkk1NblvW.jpg', NULL, '2025-08-27 12:12:52', '2025-08-27 12:12:52'),
(291, 'thumbnail', 'photo_7_2025-08-27_11-47-07.jpg', NULL, 'products/9ZqSwlGipahQJviGD3CEWy3H0dEnLTNoxvluOlb0.jpg', NULL, '2025-08-27 12:14:10', '2025-08-27 12:14:10'),
(292, 'thumbnail', 'photo_21_2025-08-27_11-18-39.jpg', NULL, 'products/YDipEBVrPslX5ESgFyJBIuJSNeCtxL7yzHMxUuvh.jpg', NULL, '2025-08-27 12:15:32', '2025-08-27 12:15:32'),
(293, 'thumbnail', 'photo_6_2025-08-27_11-47-07.jpg', NULL, 'products/SC3gCWTYOebQIc4r6ozMzVMtJqj2EnAK410TNdq9.jpg', NULL, '2025-08-27 12:17:55', '2025-08-27 12:17:55'),
(294, 'thumbnail', 'photo_10_2025-08-27_12-17-18.jpg', NULL, 'products/PNZQllaS4AaU3E1dNEesHNQyQD8usWW7rQx1ZJ7c.jpg', NULL, '2025-08-27 12:20:35', '2025-08-27 12:20:35'),
(295, 'thumbnail', 'photo_1_2025-08-27_12-21-58.jpg', NULL, 'products/gSFo1DVhjupr7TQRATQ6OcBp5B2JNd2eZdiMqqmw.jpg', NULL, '2025-08-27 12:22:18', '2025-08-27 12:22:18'),
(296, 'thumbnail', 'photo_3_2025-08-27_11-47-07.jpg', NULL, 'products/HlvsBXGMQFoRpQ6BOIzbwdX5Id4ls9GLaixB0Biu.jpg', NULL, '2025-08-27 12:22:32', '2025-08-27 12:22:32'),
(297, 'thumbnail', 'photo_9_2025-08-27_12-17-18.jpg', NULL, 'products/L3is9tE2OACVcC5Lg5kLfFgijM0LE5Y5B39TEHNZ.jpg', NULL, '2025-08-27 12:23:53', '2025-08-27 12:23:53'),
(298, 'thumbnail', 'photo_8_2025-08-27_12-17-18.jpg', NULL, 'products/hphB57Jf0jQ79enzEkusUWkeLXAccNUR90Rz2gdY.jpg', NULL, '2025-08-27 12:25:06', '2025-08-27 12:25:06'),
(299, 'thumbnail', 'photo_7_2025-08-27_12-17-18.jpg', NULL, 'products/WPKRc2Rx1N7nzxS70oy8HPMA56LbWFqwrVDgSXhS.jpg', NULL, '2025-08-27 12:26:25', '2025-08-27 12:26:25'),
(300, 'thumbnail', 'photo_6_2025-08-27_12-17-18.jpg', NULL, 'products/4sHWccx2PpBU4fvPr3UqC4FMMyGPCQZjnvFBM8UG.jpg', NULL, '2025-08-27 12:27:34', '2025-08-27 12:27:34'),
(301, 'thumbnail', 'photo_5_2025-08-27_12-17-18.jpg', NULL, 'products/hrrkm1meROpa3Tl6I2DHrbL9JdjUtZRtyeWgxaMc.jpg', NULL, '2025-08-27 12:28:55', '2025-08-27 12:28:55'),
(302, 'thumbnail', 'photo_5_2025-08-27_11-47-07.jpg', NULL, 'products/6p7ifIenN1Gmwz6dZM34k9ZEz97KJqEVHizzcvNZ.jpg', NULL, '2025-08-27 12:29:21', '2025-08-27 12:29:21'),
(303, 'thumbnail', 'photo_4_2025-08-27_12-17-18.jpg', NULL, 'products/3vxLsW0gEuLjDWAkSi255e0BnwqZyeEqDBwh38Vt.jpg', NULL, '2025-08-27 12:30:48', '2025-08-27 12:30:48'),
(304, 'thumbnail', 'photo_4_2025-08-27_11-47-07.jpg', NULL, 'products/BzY1S5sztgS21dCiNVb2qkj7s8Hv2ANaNzh8cdG7.jpg', NULL, '2025-08-27 12:37:01', '2025-08-27 12:37:01'),
(305, 'thumbnail', 'photo_3_2025-08-27_12-17-18.jpg', NULL, 'products/cUcCdHtScUz7vIPJfobneMWUz4B93V5yncR5zojD.jpg', NULL, '2025-08-27 12:38:12', '2025-08-27 12:38:12'),
(306, 'thumbnail', 'photo_1_2025-08-27_12-17-18.jpg', NULL, 'products/tzzVbMnwMtjO98bAFdKzXREFgdNum4yeG2ocq691.jpg', NULL, '2025-08-27 12:39:23', '2025-08-27 12:39:23'),
(307, 'thumbnail', 'photo_2_2025-08-27_12-17-18.jpg', NULL, 'products/wb7BLelgtljE0Pjzy6rMlhUvpEgEC3JVVTvruBUR.jpg', NULL, '2025-08-27 12:41:04', '2025-08-27 12:41:04'),
(308, 'image', 'photo_12_2025-08-27_14-56-13.jpg', NULL, 'categories/pJeQBtaEuVCIumWt1GmITEYFbbz0plzGYstnVoI0.jpg', NULL, '2025-08-27 15:01:35', '2025-08-27 15:01:35'),
(309, 'thumbnail', 'photo_19_2025-08-27_14-58-13.jpg', NULL, 'products/b5NWtHm5TvNwEORjjqDeBw1Sx5g3POYg0MF48kr0.jpg', NULL, '2025-08-27 15:04:45', '2025-08-27 15:04:45'),
(310, 'thumbnail', 'photo_10_2025-08-27_14-56-13.jpg', NULL, 'products/Z6ryjHA3hPXthFC5B130Uo7Wakk3awt7smpxUGOb.jpg', NULL, '2025-08-27 15:08:17', '2025-08-27 15:08:17'),
(311, 'thumbnail', 'photo_18_2025-08-27_14-58-13.jpg', NULL, 'products/lt2iK743M1MbipZq6X3ndKYGQDCxU9ppd9WT2uYt.jpg', NULL, '2025-08-27 15:11:12', '2025-08-27 15:11:12');
INSERT INTO `media` (`id`, `type`, `name`, `original_name`, `src`, `extention`, `created_at`, `updated_at`) VALUES
(312, 'thumbnail', 'photo_9_2025-08-27_14-56-13.jpg', NULL, 'products/FpLItT9NIOurL99cb2M1YXmzdtiVMSTYU5jWQtYM.jpg', NULL, '2025-08-27 15:13:02', '2025-08-27 15:13:02'),
(313, 'thumbnail', 'photo_17_2025-08-27_14-58-13.jpg', NULL, 'products/iGnZo8ctkcihGIHdVK1DjK4BPZFjv4X0Gxk39RPa.jpg', NULL, '2025-08-27 15:13:39', '2025-08-27 15:13:39'),
(314, 'thumbnail', 'photo_16_2025-08-27_14-58-13.jpg', NULL, 'products/PBjznmvRqvPJSXsEDKCeIi3pWaEESP1Z34CQEGA8.jpg', NULL, '2025-08-27 15:17:05', '2025-08-27 15:17:05'),
(315, 'thumbnail', 'photo_15_2025-08-27_14-58-13.jpg', NULL, 'products/QDpBv4wnKT2DLgt72OojrG9pIDN5xcoquUw9qsNm.jpg', NULL, '2025-08-27 15:19:45', '2025-08-27 15:19:45'),
(316, 'thumbnail', 'photo_14_2025-08-27_14-58-13.jpg', NULL, 'products/JYnBiXJiA2ExTIGHOWMWoBWSUsELvrOE9Jgmayss.jpg', NULL, '2025-08-27 15:22:43', '2025-08-27 15:22:43'),
(317, 'thumbnail', 'photo_13_2025-08-27_14-58-13.jpg', NULL, 'products/Jz9SoJ0CmfakJm1QRxiNnuli3Dzj5FGx3wHJx2MW.jpg', NULL, '2025-08-27 15:25:07', '2025-08-27 15:25:07'),
(318, 'thumbnail', 'photo_8_2025-08-27_14-56-13.jpg', NULL, 'products/umuU0OU5Di9iw38j8zJVYhWtxJ1cEdjXqKUHfDTT.jpg', NULL, '2025-08-27 15:25:26', '2025-08-27 15:25:26'),
(319, 'thumbnail', 'photo_12_2025-08-27_14-58-13.jpg', NULL, 'products/lOOJqXm34g2rCZPDF76hsiHxZ65XmrUGCp6qLKYU.jpg', NULL, '2025-08-27 15:28:04', '2025-08-27 15:28:04'),
(320, 'thumbnail', 'photo_7_2025-08-27_14-56-13.jpg', NULL, 'products/EC93Aljt3R8pDGAZFykPynTpLtDyNSUBvsFzgdOL.jpg', NULL, '2025-08-27 15:29:41', '2025-08-27 15:29:41'),
(321, 'thumbnail', 'photo_11_2025-08-27_14-58-13.jpg', NULL, 'products/D06iErq8b6ZL1qxOWWS4rHscixkE5CMezi1LlfVd.jpg', NULL, '2025-08-27 15:31:04', '2025-08-27 15:31:04'),
(322, 'thumbnail', 'photo_6_2025-08-27_14-56-13.jpg', NULL, 'products/wBGcodgU2FrwByNUJySSHiaykwFYGXaRzDPXueFk.jpg', NULL, '2025-08-27 15:34:39', '2025-08-27 15:34:39'),
(323, 'thumbnail', 'photo_10_2025-08-27_14-58-13.jpg', NULL, 'products/2wJRgTxcdD7ZqIRaJEfXcwLSIukREC6Tq44IpdbM.jpg', NULL, '2025-08-27 15:34:53', '2025-08-27 15:34:53'),
(324, 'thumbnail', 'photo_8_2025-08-27_14-58-13.jpg', NULL, 'products/mWg4noRCi3IvQ89cK09Qc6BlEu2KNCXesTf9NWM9.jpg', NULL, '2025-08-27 15:38:30', '2025-08-27 15:38:30'),
(325, 'thumbnail', 'photo_5_2025-08-27_14-56-13.jpg', NULL, 'products/8O4BKLZZgq1qycMF5XRbpn03JyoXmuEDf99gB5vC.jpg', NULL, '2025-08-27 15:41:40', '2025-08-27 15:41:40'),
(326, 'thumbnail', 'photo_9_2025-08-27_14-58-13.jpg', NULL, 'products/hA1KNCPHhweHocVvT9XXPBkyK1audmaK00GSSq7N.jpg', NULL, '2025-08-27 15:42:25', '2025-08-27 15:42:25'),
(327, 'thumbnail', 'photo_4_2025-08-27_14-56-13.jpg', NULL, 'products/aafkItMYDUtNTtZt2Lfj8Vzs07lDTrlg9HCylm4P.jpg', NULL, '2025-08-27 15:47:05', '2025-08-27 15:47:05'),
(328, 'thumbnail', 'photo_7_2025-08-27_14-58-13.jpg', NULL, 'products/SGm4q03cjn8mFnHVo1pTA4eBy4EhlorwVkI6Yo1O.jpg', NULL, '2025-08-27 15:50:10', '2025-08-27 15:50:10'),
(329, 'thumbnail', 'photo_3_2025-08-27_14-56-13.jpg', NULL, 'products/UeENyzUbtPxvaJpHOQX4MyCuTUU1ElipC5VNu641.jpg', NULL, '2025-08-27 15:50:55', '2025-08-27 15:50:55'),
(330, 'thumbnail', 'photo_2_2025-08-27_14-56-13.jpg', NULL, 'products/HOsdYKMCalbIvoscYukVBuYrAOOIE0DCwSD4z1Im.jpg', NULL, '2025-08-27 15:53:04', '2025-08-27 15:53:04'),
(331, 'thumbnail', 'photo_1_2025-08-27_14-56-13.jpg', NULL, 'products/PzlYIiVBHju7ukcm5Q2mDxOQpbuySuvmoKX9tBmb.jpg', NULL, '2025-08-27 15:56:57', '2025-08-27 15:56:57'),
(332, 'thumbnail', 'photo_6_2025-08-27_14-58-13.jpg', NULL, 'products/xQShZx3fF3w9wXKSLtxetFtpFs9zf9VoHTEdOlMy.jpg', NULL, '2025-08-27 15:59:01', '2025-08-27 15:59:01'),
(333, 'thumbnail', 'photo_17_2025-08-27_14-56-13.jpg', NULL, 'products/ZaWGO1IVuYAhkVnPlciVMJSNvHKcd77lomSHAPg9.jpg', NULL, '2025-08-27 16:00:24', '2025-08-27 16:00:24'),
(334, 'thumbnail', 'photo_5_2025-08-27_14-58-13.jpg', NULL, 'products/Ofh2Omcw80ekMPTNBz9PStj7QjZPS2Mh2caBlZMy.jpg', NULL, '2025-08-27 16:02:50', '2025-08-27 16:02:50'),
(335, 'thumbnail', 'photo_16_2025-08-27_14-56-13.jpg', NULL, 'products/06RMjZlv5QwLxRKe5cnWl2UPrtfPBSAUh5ggKJqM.jpg', NULL, '2025-08-27 16:03:15', '2025-08-27 16:03:15'),
(336, 'thumbnail', 'photo_4_2025-08-27_14-58-13.jpg', NULL, 'products/NulFrXns7XtiOjeXF9iYo92uZtYhTcEf0tNVDKkl.jpg', NULL, '2025-08-27 16:05:36', '2025-08-27 16:05:36'),
(337, 'thumbnail', 'photo_3_2025-08-27_14-58-13.jpg', NULL, 'products/5nGlCAV2mdDr9022eoYz32j3Co3F8J788UAju5Kb.jpg', NULL, '2025-08-27 16:08:18', '2025-08-27 16:08:18'),
(338, 'thumbnail', 'photo_15_2025-08-27_14-56-13.jpg', NULL, 'products/ELx0kFkY2SDZcG70T9VHnsHHmIjD8lVL1vQkRf60.jpg', NULL, '2025-08-27 16:09:42', '2025-08-27 16:09:42'),
(339, 'image', 'photo_3_2025-08-27_16-10-23.jpg', NULL, 'categories/T3pGfEChsSAb1KF6QDBzCIhmrDmXQkz6qZnlidfB.jpg', NULL, '2025-08-27 16:11:45', '2025-08-27 16:11:45'),
(340, 'thumbnail', 'photo_1_2025-08-27_14-58-13.jpg', NULL, 'products/13xlwlleiFy49FVUmbOvqRyUaZHQD4HTYe2KzXeR.jpg', NULL, '2025-08-27 16:12:45', '2025-08-27 16:12:45'),
(341, 'thumbnail', 'photo_14_2025-08-27_14-56-13.jpg', NULL, 'products/2PoGxh6kRxXF1zeUxwEKT10utJBq9142BnoFrs2o.jpg', NULL, '2025-08-27 16:13:03', '2025-08-27 16:13:03'),
(342, 'thumbnail', 'photo_3_2025-08-27_16-10-23.jpg', NULL, 'products/UKXXTpLQtoT5K6cnVHpFrW9R9y47zkG5XofzqHly.jpg', NULL, '2025-08-27 16:15:01', '2025-08-27 16:15:01'),
(343, 'thumbnail', 'photo_2_2025-08-27_14-58-13.jpg', NULL, 'products/gyAMn65J58YrBpn280bskoxZ1hZoe7LsxOLQZBkH.jpg', NULL, '2025-08-27 16:15:17', '2025-08-27 16:15:17'),
(344, 'thumbnail', 'photo_13_2025-08-27_14-56-13.jpg', NULL, 'products/cl3tnVzrrPQ0MQosay3RkOekCt3Tl6MXJteW8QFD.jpg', NULL, '2025-08-27 16:16:35', '2025-08-27 16:16:35'),
(345, 'thumbnail', 'photo_2_2025-08-27_16-10-23.jpg', NULL, 'products/YYAdk5N9FwzKx27zRVJ63pfjqXYXRSP8zJAzRY7J.jpg', NULL, '2025-08-27 16:17:45', '2025-08-27 16:17:45'),
(346, 'thumbnail', 'photo_12_2025-08-27_14-56-13.jpg', NULL, 'products/iCyp9Hl72uHZiD1cyPr8wZHxkhr7N8PSR9xsDSz8.jpg', NULL, '2025-08-27 16:18:58', '2025-08-27 16:18:58'),
(347, 'thumbnail', 'photo_4_2025-08-27_16-10-23.jpg', NULL, 'products/55rvQgHCClr5u0hT8JshNv935MzXIG46V1mknGG8.jpg', NULL, '2025-08-27 16:19:02', '2025-08-27 16:19:02'),
(348, 'thumbnail', 'photo_7_2025-08-27_16-10-23.jpg', NULL, 'products/kDmc58CvCpyCQk9uiStSsB5cM8WJvIJ9X5jebpCk.jpg', NULL, '2025-08-27 16:20:15', '2025-08-27 16:20:15'),
(349, 'thumbnail', 'photo_11_2025-08-27_14-56-13.jpg', NULL, 'products/CutoP4KLlDwAF3e42qiJN3LpTwRvdLBbBpJZHplx.jpg', NULL, '2025-08-27 16:21:00', '2025-08-27 16:21:00'),
(350, 'thumbnail', 'photo_6_2025-08-27_16-10-23.jpg', NULL, 'products/t5Q1KP1RgCHPqtPqpAgIQ9sD8PB95luYXTxwzZE4.jpg', NULL, '2025-08-27 16:23:21', '2025-08-27 16:23:21'),
(351, 'thumbnail', 'photo_20_2025-08-27_14-56-13.jpg', NULL, 'products/KHg9cK0Z6dF8atxdhVsoEZYTIN9otRyk3BIPURHh.jpg', NULL, '2025-08-27 16:23:27', '2025-08-27 16:23:27'),
(352, 'thumbnail', 'photo_5_2025-08-27_16-10-23.jpg', NULL, 'products/JxKBdwfPhwYYZ7vTkRGULOvJCrngqkpQfBiAvwI3.jpg', NULL, '2025-08-27 16:25:12', '2025-08-27 16:25:12'),
(353, 'thumbnail', 'photo_19_2025-08-27_14-56-13.jpg', NULL, 'products/yU4Wg5FN5uqbJjeQscFxdwQ9VMsVo7xZxbN2OPXA.jpg', NULL, '2025-08-27 16:25:43', '2025-08-27 16:25:43'),
(354, 'thumbnail', 'photo_1_2025-08-27_16-10-23.jpg', NULL, 'products/0GCzyoq4vllpfk46LVYHkJhucwoffrO5ezbLjcrf.jpg', NULL, '2025-08-27 16:26:31', '2025-08-27 16:26:31'),
(355, 'image', 'photo_1_2025-08-27_17-09-25.jpg', NULL, 'categories/rRdzGygEkFQN6kMP4drUlpoySuBG7WYkOdhMONti.jpg', NULL, '2025-08-27 17:16:43', '2025-08-27 17:16:43'),
(356, 'image', 'photo_1_2025-08-27_17-09-25.jpg', NULL, 'categories/oPmMxOrfqQQJErkM5mkQpzRs2QPjpT3jvZbtpZWg.jpg', NULL, '2025-08-27 17:18:39', '2025-08-27 17:18:39'),
(357, 'image', 'photo_7_2025-08-27_17-00-40.jpg', NULL, 'categories/lera2dHm3XbxFVhqSUSar13F7O3ky48r3F2vOThr.jpg', NULL, '2025-08-27 17:24:27', '2025-08-27 17:24:27'),
(358, 'thumbnail', 'photo_1_2025-08-27_17-09-25.jpg', NULL, 'products/ez6LRPROvLdvSjLUC1AV19l2k1T85Gbf7pZx2VRE.jpg', NULL, '2025-08-27 17:25:20', '2025-08-27 17:25:20'),
(359, 'thumbnail', 'photo_2_2025-08-27_17-09-25.jpg', NULL, 'products/DjixPedkcNbPi43r7UKzk8QstmgMLnvcVuu9AF2H.jpg', NULL, '2025-08-27 17:27:06', '2025-08-27 17:27:06'),
(360, 'thumbnail', 'photo_3_2025-08-27_17-09-25.jpg', NULL, 'products/FOqbqAN0PSjdtPBAvn5ogWKkObDb97qsMcjql5gG.jpg', NULL, '2025-08-27 17:29:22', '2025-08-27 17:29:22'),
(361, 'thumbnail', 'photo_5_2025-08-27_17-09-25.jpg', NULL, 'products/y9pYKMW66DRwaIE1RGSXsMK1V8vBpU2iazoofbZF.jpg', NULL, '2025-08-27 17:36:41', '2025-08-27 17:36:41'),
(362, 'image', 'photo_4_2025-08-27_17-09-25.jpg', NULL, 'categories/lN7fXako3cU1GkpcKsEZkUdvXph3rdf9IQiOlEoZ.jpg', NULL, '2025-08-27 17:38:04', '2025-08-27 17:38:04'),
(363, 'thumbnail', 'photo_4_2025-08-27_17-09-25.jpg', NULL, 'products/92j7eI2HOmCqqsXrxN35f5RtNWmAAhfCYijjd7Ql.jpg', NULL, '2025-08-27 17:41:57', '2025-08-27 17:41:57'),
(364, 'image', 'photo_10_2025-08-27_17-09-25.jpg', NULL, 'categories/kqFx0sW31U2WnADcsRpNj2wNN9zKSS4PTq1BieEJ.jpg', NULL, '2025-08-27 17:44:22', '2025-08-27 17:44:22'),
(365, 'thumbnail', 'photo_10_2025-08-27_17-09-25.jpg', NULL, 'products/9SlE6tHHi9QAPs3qjEirew9TKaBaCr14SM67CJeU.jpg', NULL, '2025-08-27 17:55:17', '2025-08-27 17:55:17'),
(366, 'thumbnail', 'photo_13_2025-08-27_17-09-25.jpg', NULL, 'products/fImImi7CkVvOFxYv8fAJYqrEkqsFFOKuMpenPaiJ.jpg', NULL, '2025-08-27 17:57:04', '2025-08-27 17:57:04'),
(367, 'thumbnail', 'photo_12_2025-08-27_17-09-25.jpg', NULL, 'products/LfkrU5dh5MVM1k3apWvSXqEZ9SnHVgHLZcbqE6ug.jpg', NULL, '2025-08-27 17:58:26', '2025-08-27 17:58:26'),
(368, 'thumbnail', 'photo_9_2025-08-27_17-09-25.jpg', NULL, 'products/A4W6e6LNMUya0Dp2mLXIMZJmfOuQtkaRBk3fOagh.jpg', NULL, '2025-08-27 17:59:51', '2025-08-27 17:59:51'),
(369, 'thumbnail', 'photo_6_2025-08-27_17-00-40.jpg', NULL, 'products/SZe8a6yCbnYcxGlHJak5ybWHYpwvYAnoYQa1snmK.jpg', NULL, '2025-08-27 19:12:11', '2025-08-27 19:12:11'),
(370, 'thumbnail', 'photo_1_2025-08-27_17-00-40.jpg', NULL, 'products/HiJvHD22BhTx9t1u27qnFLsZKRUvFTpxv0svBBSw.jpg', NULL, '2025-08-27 19:15:07', '2025-08-27 19:15:07'),
(371, 'thumbnail', 'photo_4_2025-08-27_17-00-40.jpg', NULL, 'products/76dpabfoFkJ2rnhEwnU5e7w88OwPBb1yBVcpoGSg.jpg', NULL, '2025-08-27 19:22:31', '2025-08-27 19:22:31'),
(372, 'thumbnail', 'photo_10_2025-08-27_17-00-40.jpg', NULL, 'products/k94INdbIa0qiRcsMH6end1EYhjSYX2dzNWPK9wVG.jpg', NULL, '2025-08-27 19:24:31', '2025-08-27 19:24:31'),
(373, 'thumbnail', 'photo_11_2025-08-27_17-00-40.jpg', NULL, 'products/Ex8HZIBH8QLzrTtfRHrppzDyZLcIlLB02Z0GB7lx.jpg', NULL, '2025-08-27 19:27:32', '2025-08-27 19:27:32'),
(374, 'thumbnail', 'photo_3_2025-08-27_17-00-40.jpg', NULL, 'products/2gyDEuZTbYDTytgoPSXNt7ucMhpf7sBBfqNyx8sp.jpg', NULL, '2025-08-27 19:30:02', '2025-08-27 19:30:02'),
(375, 'thumbnail', 'photo_5_2025-08-27_17-00-40.jpg', NULL, 'products/TT3A09nZvIbtCtcg8OrCfh7OAAJnFFVAXMLlhgWs.jpg', NULL, '2025-08-27 19:32:04', '2025-08-27 19:32:04'),
(376, 'thumbnail', 'photo_12_2025-08-27_17-00-40.jpg', NULL, 'products/cLeZWX5FUmYsN5GI6tcbzH7lcjGZSUlnaFtJLvVh.jpg', NULL, '2025-08-27 19:34:21', '2025-08-27 19:34:21'),
(377, 'thumbnail', 'photo_7_2025-08-27_17-00-40.jpg', NULL, 'products/aLANzB19FytMj5Z78WVtp7OKQIpbd6j7xByUeBKD.jpg', NULL, '2025-08-27 19:36:39', '2025-08-27 19:36:39'),
(378, 'thumbnail', 'photo_2_2025-08-27_17-00-40.jpg', NULL, 'products/JLvEJkqOKCzoQGPI2SFzvfhRPNGDP3BpsWnHdQaL.jpg', NULL, '2025-08-27 19:49:37', '2025-08-27 19:49:37'),
(379, 'thumbnail', 'photo_9_2025-08-27_17-00-40.jpg', NULL, 'products/AboRpq0O0ycwtcxVgUruzk9nNOFdoPsB4oR59amL.jpg', NULL, '2025-08-27 20:02:22', '2025-08-27 20:02:22'),
(380, 'thumbnail', 'photo_8_2025-08-27_17-00-40.jpg', NULL, 'products/Dip1hY19kOd1rIXqYr1s6cIEjfsPn0BewpWajtWR.jpg', NULL, '2025-08-27 20:05:24', '2025-08-27 20:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `original_url` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_external` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `title`, `original_name`, `original_url`, `order`, `target`, `is_active`, `is_default`, `is_external`, `created_at`, `updated_at`) VALUES
(1, 'الرئيسية', '/', 'الرئيسية', 'Home', '/', 1, '_self', 1, 1, 0, NULL, '2025-08-22 05:12:18'),
(2, 'المنتجات', '/products', 'المنتجات', 'Products', '/products', 2, '_self', 1, 1, 0, NULL, '2025-08-22 05:12:09'),
(3, 'المتاجر', '/shops', 'المتاجر', 'Shops', '/shops', 3, '_self', 1, 1, 0, NULL, '2025-08-22 05:13:07'),
(4, 'الرائج', '/most-popular', 'الرائج', 'Most Popular', '/most-popular', 4, '_self', 1, 1, 0, NULL, '2025-08-22 05:12:57'),
(5, 'افضل العروض', '/best-deal', 'افضل العروض', 'Best Deal', '/best-deal', 5, '_self', 1, 1, 0, NULL, '2025-08-22 05:12:44'),
(6, 'تواصل معنا', '/contact-us', 'تواصل معنا', 'Contact', '/contact-us', 6, '_self', 1, 1, 0, NULL, '2025-08-22 05:12:33'),
(7, 'Blogs', '/blogs', 'Blogs', 'Blogs', '/blogs', 7, '_self', 0, 1, 0, NULL, '2025-08-22 05:13:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_01_16_000214_create_permission_tables', 1),
(4, '2024_01_16_000324_create_media_table', 1),
(5, '2024_01_16_000454_create_users_table', 1),
(6, '2024_01_16_104638_create_customers_table', 1),
(7, '2024_01_16_105000_create_categories_table', 1),
(8, '2024_01_16_105234_create_shops_table', 1),
(9, '2024_01_16_105314_create_brands_table', 1),
(10, '2024_01_16_105346_create_products_table', 1),
(11, '2024_01_16_110908_create_banners_table', 1),
(12, '2024_01_16_111152_create_reviews_table', 1),
(13, '2024_01_16_112138_create_addresses_table', 1),
(14, '2024_01_16_112545_create_coupons_table', 1),
(15, '2024_01_16_115937_create_shop_categories_table', 1),
(16, '2024_01_17_002344_create_colors_table', 1),
(17, '2024_01_17_072702_create_product_colors_table', 1),
(18, '2024_01_17_073458_create_sizes_table', 1),
(19, '2024_01_17_073725_create_units_table', 1),
(20, '2024_01_17_074135_create_product_units_table', 1),
(21, '2024_01_17_074229_create_product_sizes_table', 1),
(22, '2024_01_17_074745_create_verify_otps_table', 1),
(23, '2024_01_17_075503_create_product_thumbnails_table', 1),
(24, '2024_01_17_080646_create_product_categories_table', 1),
(25, '2024_01_17_092300_create_favorites_table', 1),
(26, '2024_01_17_112948_create_orders_table', 1),
(27, '2024_01_17_114308_create_order_products_table', 1),
(28, '2024_01_23_045138_create_legal_pages_table', 1),
(29, '2024_01_23_045412_create_supports_table', 1),
(30, '2024_01_27_072753_create_generate_settings_table', 1),
(31, '2024_02_29_111443_add_is_approve_column_to_products_table', 1),
(32, '2024_03_05_113904_add_unit_id_to_products_table', 1),
(33, '2024_03_06_101936_add_price_column_to_product_sizes_table', 1),
(34, '2024_03_10_110137_add_currency_column_to_generale_setting_table', 1),
(35, '2024_03_12_040056_add_code_to_products_table', 1),
(36, '2024_03_16_075329_add_order_id_to_reviews_table', 1),
(37, '2024_03_17_063030_change_shop_id_to_coupons_table', 1),
(38, '2024_03_17_100252_create_coupon_collects_table', 1),
(39, '2024_03_18_082804_add_footer_column_to_generale_settings_table', 1),
(40, '2024_03_20_031250_add_column_to_coupons_table', 1),
(41, '2024_03_20_032311_create_admin_coupons_table', 1),
(42, '2024_03_23_111543_create_notifications_table', 1),
(43, '2024_03_24_094629_create_payment_gateways_table', 1),
(44, '2024_03_25_104034_create_payments_table', 1),
(45, '2024_03_25_104350_create_order_payments_table', 1),
(46, '2024_03_25_114533_create_contact_uses_table', 1),
(47, '2024_03_27_164439_add_column_to_payments_table', 1),
(48, '2024_03_28_095034_add_column_to_generate_settings_table', 1),
(49, '2024_03_30_092829_create_wallets_table', 1),
(50, '2024_03_30_093648_create_transactions_table', 1),
(51, '2024_03_30_094238_create_withdraws_table', 1),
(52, '2024_03_30_104019_add_column_to_orders_table', 1),
(53, '2024_03_31_083538_add_column_to_notifications_table', 1),
(54, '2024_04_19_173548_add_shop_type_column_to_generate_settings_table', 1),
(55, '2024_04_21_121936_create_carts_table', 1),
(56, '2024_04_28_104356_create_drivers_table', 1),
(57, '2024_04_29_104509_create_drivers_orders_table', 1),
(58, '2024_04_29_113150_add_vehicle_type_column_to_users_table', 1),
(59, '2024_04_29_164336_create_device_keys_table', 1),
(60, '2024_04_30_114459_add_cash_collect_to_driver_order_table', 1),
(61, '2024_04_30_121054_add_total_cash_collect_to_drivers_table', 1),
(62, '2024_05_14_154411_create_recent_views_table', 1),
(63, '2024_05_15_111324_create_flash_sales_table', 1),
(64, '2024_05_15_115849_create_flash_sale_products_table', 1),
(65, '2024_05_16_112807_add_column_to_supports_table', 1),
(66, '2024_05_16_116825_add_column_to_flash_sale_products_table', 1),
(67, '2024_05_18_111152_add_off_day_to_shops_table', 1),
(68, '2024_05_18_163651_add_column_to_generate_settings_table', 1),
(69, '2024_05_19_122837_add_column_to_generate_settings_table', 1),
(70, '2024_05_20_163704_create_ads_table', 1),
(71, '2024_05_21_155258_create_delivery_charges_table', 1),
(72, '2024_05_21_191749_create_social_links_table', 1),
(73, '2024_05_26_131755_create_support_tickets_table', 1),
(74, '2024_05_26_131930_create_support_ticket_messages_table', 1),
(75, '2024_05_26_135940_create_support_ticket_attachment_table', 1),
(76, '2024_05_28_103844_create_ticket_issue_types_table', 1),
(77, '2024_05_30_182019_add_column_to_generate_settings_table', 1),
(78, '2024_06_05_165137_add_column_to_media_table', 1),
(79, '2024_06_08_154510_create_galleries_table', 1),
(80, '2024_06_09_103825_create_sub_categories_table', 1),
(81, '2024_06_09_110839_create_category_subcategories_table', 1),
(82, '2024_06_09_132729_create_product_subcategorys_table', 1),
(83, '2024_06_22_095856_create_s_m_s_configs_table', 1),
(84, '2024_06_23_154709_add_column_to_generate_settings_table', 1),
(85, '2024_06_24_133734_add_column_to_carts_table', 1),
(86, '2024_06_25_110336_add_column_to_generate_settings_table', 1),
(87, '2024_06_25_114728_add_column_to_reviews_table', 1),
(88, '2024_06_27_112507_add_column_to_categories_table', 1),
(89, '2024_06_29_104005_add_column_to_categories_table', 1),
(90, '2024_06_29_104453_add_column_to_sub_categories_table', 1),
(91, '2024_06_29_114916_add_column_to_brands_table', 1),
(92, '2024_06_29_114927_add_column_to_colors_table', 1),
(93, '2024_06_29_114939_add_column_to_sizes_table', 1),
(94, '2024_06_29_115100_add_column_to_products_table', 1),
(95, '2024_07_01_103743_create_languages_table', 1),
(96, '2024_07_01_110802_add_softdelete_to_users_table', 1),
(97, '2024_07_03_092913_create_pos_carts_table', 1),
(98, '2024_07_03_101851_create_pos_cart_products_table', 1),
(99, '2024_07_03_103622_add_column_to_orders_table', 1),
(100, '2024_07_04_170256_update_customer_id_column_to_orders_table', 1),
(101, '2024_07_07_124525_add_draft_column_to_pos_carts_table', 1),
(102, '2024_07_09_142655_add_column_to_pos_carts_table', 1),
(103, '2024_09_15_093610_create_theme_colors_table', 1),
(104, '2024_09_15_113123_add_clumns_to_users_table', 1),
(105, '2024_09_17_101004_add_clumn_to_products_table', 1),
(106, '2024_09_23_115749_add_column_to_users_table', 1),
(107, '2024_09_24_101919_add_column_to_roles_table', 1),
(108, '2024_09_24_105224_create_user_non_permissions_table', 1),
(109, '2024_09_26_114754_create_verify_manages_table', 1),
(110, '2024_09_30_135048_change_column_to_flash_sales_table', 1),
(111, '2024_09_30_164906_add_column_to_flash_sale_products_table', 1),
(112, '2024_10_02_125419_add_column_to_flash_sales_table', 1),
(113, '2024_10_05_135418_add_column_to_flash_sale_products_table', 1),
(114, '2024_10_08_113905_add_column_to_order_products_table', 1),
(115, '2024_10_10_155932_create_google_re_captchas_table', 1),
(116, '2024_10_14_160335_create_social_auths_table', 1),
(117, '2024_10_14_170543_add_columns_to_users_table', 1),
(118, '2024_10_19_104732_add_columns_to_product_colors_table', 1),
(119, '2024_11_24_124258_create_vat_taxes_table', 1),
(120, '2024_11_24_165734_create_product_vat_taxes_table', 1),
(121, '2024_11_25_110112_add_column_to_orders_table', 1),
(122, '2024_11_28_170135_create_blogs_table', 1),
(123, '2024_11_28_171145_create_tags_table', 1),
(124, '2024_11_28_171247_create_blog_tags_table', 1),
(125, '2024_11_28_171333_create_blog_views_table', 1),
(126, '2025_01_06_145615_add_column_to_carts_table', 1),
(127, '2025_01_07_113201_add_column_to_products_table', 1),
(128, '2025_01_07_115807_add_column_to_languages_table', 1),
(129, '2025_01_26_100341_create_translate_utilities_table', 1),
(130, '2025_01_26_103530_create_currencies_table', 1),
(131, '2025_01_26_112926_change_password_column_to_users_table', 1),
(132, '2025_01_26_113220_create_product_translations_table', 1),
(133, '2025_01_26_155516_add_currency_id_column_to_generate_settings_table', 1),
(134, '2025_01_28_174131_add_column_to_verify_manages_table', 1),
(135, '2025_02_03_111244_change_column_to_shops_table', 1),
(136, '2025_02_13_111656_create_menus_table', 1),
(137, '2025_02_16_100246_create_pages_table', 1),
(138, '2025_02_17_101904_add_column_to_verify_manages_table', 1),
(139, '2025_02_17_102712_create_countries_table', 1),
(140, '2025_02_18_160537_create_order_vat_taxes_table', 1),
(141, '2025_02_22_111431_add_column_to_generate_settings_table', 1),
(142, '2025_02_22_152711_create_footers_table', 1),
(143, '2025_02_22_154855_create_footer_items_table', 1),
(144, '2025_04_17_105545_create_subscription_plans_table', 1),
(145, '2025_04_17_105627_create_shop_subscriptions_table', 1),
(146, '2025_05_04_111353_create_shop_user_table', 1),
(147, '2025_05_04_111844_create_shop_user_chats_table', 1),
(148, '2025_05_06_150402_add_column_to_generate_settings_table', 1),
(149, '2025_05_06_174546_add_last_online_column_to_users_table', 1),
(150, '2025_05_06_183511_add_last_online_column_to_shops_table', 1),
(151, '2025_07_02_165205_create_paypal_payments_table', 1),
(152, '2025_07_14_153807_add_column_to_social_links_table', 1),
(153, '2025_08_27_000001_create_guest_orders_tables', 2),
(154, '2025_08_27_000002_add_status_to_guest_orders', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 14);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `withdraw_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `content`, `url`, `icon`, `type`, `shop_id`, `user_id`, `is_read`, `created_at`, `updated_at`, `withdraw_id`) VALUES
(1, 'New product Created Request', 'New product Created Request from sssss', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 1, '2025-08-19 20:25:29', '2025-08-25 12:22:06', NULL),
(5, 'New product Created Request', 'New product Created Request from البراق للالكترونيات', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 1, '2025-08-24 00:19:58', '2025-08-25 12:22:06', NULL),
(6, 'Product Approved', 'Your product approved from admin', '/shop/product/3/show', 'bi-bag-check-fill', 'success', 3, NULL, 0, '2025-08-24 00:23:26', '2025-08-24 00:23:26', NULL),
(7, 'Product Updated Request', 'Product Updated Request from البراق للالكترونيات', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 1, '2025-08-24 00:45:48', '2025-08-25 12:22:06', NULL),
(8, 'Product Approved', 'Your product approved from admin', '/shop/product/3/show', 'bi-bag-check-fill', 'success', 3, NULL, 1, '2025-08-24 00:46:47', '2025-08-25 11:46:11', NULL),
(9, 'Product Updated Request', 'Product Updated Request from البراق للالكترونيات', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 1, '2025-08-24 00:48:14', '2025-08-25 12:22:06', NULL),
(10, 'Product Approved', 'Your product approved from admin', '/shop/product/3/show', 'bi-bag-check-fill', 'success', 3, NULL, 1, '2025-08-24 00:48:32', '2025-08-24 02:07:37', NULL),
(11, 'Product Updated Request', 'Product Updated Request from البراق للالكترونيات', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 1, '2025-08-24 16:22:43', '2025-08-25 12:22:06', NULL),
(12, 'Product Updated Request', 'Product Updated Request from البراق للالكترونيات', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 1, '2025-08-24 16:24:07', '2025-08-25 12:22:06', NULL),
(13, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 15:39:35', '2025-08-25 15:39:35', NULL),
(14, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 15:53:43', '2025-08-25 15:53:43', NULL),
(15, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 15:56:24', '2025-08-25 15:56:24', NULL),
(16, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 15:58:26', '2025-08-25 15:58:26', NULL),
(17, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 15:59:50', '2025-08-25 15:59:50', NULL),
(18, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 16:01:08', '2025-08-25 16:01:08', NULL),
(19, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 16:15:19', '2025-08-25 16:15:19', NULL),
(20, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:32:24', '2025-08-25 17:32:24', NULL),
(21, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:33:14', '2025-08-25 17:33:14', NULL),
(22, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:34:21', '2025-08-25 17:34:21', NULL),
(23, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:35:21', '2025-08-25 17:35:21', NULL),
(24, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:36:12', '2025-08-25 17:36:12', NULL),
(25, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:36:56', '2025-08-25 17:36:56', NULL),
(26, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:37:45', '2025-08-25 17:37:45', NULL),
(27, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:40:05', '2025-08-25 17:40:05', NULL),
(28, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:41:07', '2025-08-25 17:41:07', NULL),
(29, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:41:51', '2025-08-25 17:41:51', NULL),
(30, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:42:44', '2025-08-25 17:42:44', NULL),
(31, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:43:38', '2025-08-25 17:43:38', NULL),
(32, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:44:28', '2025-08-25 17:44:28', NULL),
(33, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:45:09', '2025-08-25 17:45:09', NULL),
(34, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:46:00', '2025-08-25 17:46:00', NULL),
(35, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 17:47:07', '2025-08-25 17:47:07', NULL),
(36, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 18:37:19', '2025-08-25 18:37:19', NULL),
(37, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 18:54:40', '2025-08-25 18:54:40', NULL),
(38, 'Product Updated Request', 'Product Updated Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 19:07:12', '2025-08-25 19:07:12', NULL),
(39, 'Product Updated Request', 'Product Updated Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 19:38:12', '2025-08-25 19:38:12', NULL),
(40, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 19:44:42', '2025-08-25 19:44:42', NULL),
(41, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 19:53:29', '2025-08-25 19:53:29', NULL),
(42, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 19:55:26', '2025-08-25 19:55:26', NULL),
(43, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 19:56:50', '2025-08-25 19:56:50', NULL),
(44, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 19:59:05', '2025-08-25 19:59:05', NULL),
(45, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:03:01', '2025-08-25 20:03:01', NULL),
(46, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:04:27', '2025-08-25 20:04:27', NULL),
(47, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:06:13', '2025-08-25 20:06:13', NULL),
(48, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:11:31', '2025-08-25 20:11:31', NULL),
(49, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:12:53', '2025-08-25 20:12:53', NULL),
(50, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:15:35', '2025-08-25 20:15:35', NULL),
(51, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:17:51', '2025-08-25 20:17:51', NULL),
(52, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:20:39', '2025-08-25 20:20:39', NULL),
(53, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:25:24', '2025-08-25 20:25:24', NULL),
(54, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:26:42', '2025-08-25 20:26:42', NULL),
(55, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:28:01', '2025-08-25 20:28:01', NULL),
(56, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:30:48', '2025-08-25 20:30:48', NULL),
(57, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:33:43', '2025-08-25 20:33:43', NULL),
(58, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:45:14', '2025-08-25 20:45:14', NULL),
(59, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:46:38', '2025-08-25 20:46:38', NULL),
(60, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-25 20:47:37', '2025-08-25 20:47:37', NULL),
(61, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 12:44:13', '2025-08-26 12:44:13', NULL),
(62, 'Product Updated Request', 'Product Updated Request from البراق للالكترونيات', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 14:11:03', '2025-08-26 14:11:03', NULL),
(63, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 15:03:39', '2025-08-26 15:03:39', NULL),
(64, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 15:18:16', '2025-08-26 15:18:16', NULL),
(65, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 15:28:52', '2025-08-26 15:28:52', NULL),
(66, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 15:38:05', '2025-08-26 15:38:05', NULL),
(67, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 15:45:29', '2025-08-26 15:45:29', NULL),
(68, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 15:50:28', '2025-08-26 15:50:28', NULL),
(69, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 15:58:41', '2025-08-26 15:58:41', NULL),
(70, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:05:16', '2025-08-26 16:05:16', NULL),
(71, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:12:59', '2025-08-26 16:12:59', NULL),
(72, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:18:46', '2025-08-26 16:18:46', NULL),
(73, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:24:27', '2025-08-26 16:24:27', NULL),
(74, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:35:47', '2025-08-26 16:35:47', NULL),
(75, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:40:45', '2025-08-26 16:40:45', NULL),
(76, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:50:51', '2025-08-26 16:50:51', NULL),
(77, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 16:56:48', '2025-08-26 16:56:48', NULL),
(78, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:03:27', '2025-08-26 18:03:27', NULL),
(79, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:07:46', '2025-08-26 18:07:46', NULL),
(80, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:11:13', '2025-08-26 18:11:13', NULL),
(81, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:12:47', '2025-08-26 18:12:47', NULL),
(82, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:30:09', '2025-08-26 18:30:09', NULL),
(83, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:31:36', '2025-08-26 18:31:36', NULL),
(84, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:33:05', '2025-08-26 18:33:05', NULL),
(85, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:35:22', '2025-08-26 18:35:22', NULL),
(86, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 18:37:04', '2025-08-26 18:37:04', NULL),
(87, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:02:47', '2025-08-26 20:02:47', NULL),
(88, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:16:26', '2025-08-26 20:16:26', NULL),
(89, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:17:59', '2025-08-26 20:17:59', NULL),
(90, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:19:23', '2025-08-26 20:19:23', NULL),
(91, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:20:52', '2025-08-26 20:20:52', NULL),
(92, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:22:17', '2025-08-26 20:22:17', NULL),
(93, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:26:22', '2025-08-26 20:26:22', NULL),
(94, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:27:58', '2025-08-26 20:27:58', NULL),
(95, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:31:50', '2025-08-26 20:31:50', NULL),
(96, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:33:49', '2025-08-26 20:33:49', NULL),
(97, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:35:46', '2025-08-26 20:35:46', NULL),
(98, 'Product Updated Request', 'Product Updated Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:36:23', '2025-08-26 20:36:23', NULL),
(99, 'Product Updated Request', 'Product Updated Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:37:09', '2025-08-26 20:37:09', NULL),
(100, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:39:02', '2025-08-26 20:39:02', NULL),
(101, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:40:05', '2025-08-26 20:40:05', NULL),
(102, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:41:45', '2025-08-26 20:41:45', NULL),
(103, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:43:07', '2025-08-26 20:43:07', NULL),
(104, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:44:25', '2025-08-26 20:44:25', NULL),
(105, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:45:18', '2025-08-26 20:45:18', NULL),
(106, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:46:35', '2025-08-26 20:46:35', NULL),
(107, 'Product Updated Request', 'Product Updated Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:51:07', '2025-08-26 20:51:07', NULL),
(108, 'Product Updated Request', 'Product Updated Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-26 20:52:04', '2025-08-26 20:52:04', NULL),
(109, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 09:49:19', '2025-08-27 09:49:19', NULL),
(110, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 09:51:22', '2025-08-27 09:51:22', NULL),
(111, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 09:54:15', '2025-08-27 09:54:15', NULL),
(112, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 09:56:21', '2025-08-27 09:56:21', NULL),
(113, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 09:58:28', '2025-08-27 09:58:28', NULL),
(114, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 09:59:58', '2025-08-27 09:59:58', NULL),
(115, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 10:01:15', '2025-08-27 10:01:15', NULL),
(116, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:03:41', '2025-08-27 11:03:41', NULL),
(117, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:07:33', '2025-08-27 11:07:33', NULL),
(118, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:13:55', '2025-08-27 11:13:55', NULL),
(119, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:16:37', '2025-08-27 11:16:37', NULL),
(120, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:20:36', '2025-08-27 11:20:36', NULL),
(121, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:21:49', '2025-08-27 11:21:49', NULL),
(122, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:23:24', '2025-08-27 11:23:24', NULL),
(123, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:26:01', '2025-08-27 11:26:01', NULL),
(124, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:27:12', '2025-08-27 11:27:12', NULL),
(125, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:27:18', '2025-08-27 11:27:18', NULL),
(126, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:29:50', '2025-08-27 11:29:50', NULL),
(127, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:30:39', '2025-08-27 11:30:39', NULL),
(128, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:32:05', '2025-08-27 11:32:05', NULL),
(129, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:33:23', '2025-08-27 11:33:23', NULL),
(130, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:34:38', '2025-08-27 11:34:38', NULL),
(131, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:37:10', '2025-08-27 11:37:10', NULL),
(132, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:39:34', '2025-08-27 11:39:34', NULL),
(133, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:40:55', '2025-08-27 11:40:55', NULL),
(134, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:41:52', '2025-08-27 11:41:52', NULL),
(135, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:43:21', '2025-08-27 11:43:21', NULL),
(136, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:45:29', '2025-08-27 11:45:29', NULL),
(137, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:45:42', '2025-08-27 11:45:42', NULL),
(138, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:47:11', '2025-08-27 11:47:11', NULL),
(139, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:49:53', '2025-08-27 11:49:53', NULL),
(140, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:51:07', '2025-08-27 11:51:07', NULL),
(141, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:52:21', '2025-08-27 11:52:21', NULL),
(142, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:52:52', '2025-08-27 11:52:52', NULL),
(143, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:53:42', '2025-08-27 11:53:42', NULL),
(144, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:55:01', '2025-08-27 11:55:01', NULL),
(145, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:56:09', '2025-08-27 11:56:09', NULL),
(146, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:57:07', '2025-08-27 11:57:07', NULL),
(147, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:58:50', '2025-08-27 11:58:50', NULL),
(148, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 11:59:32', '2025-08-27 11:59:32', NULL),
(149, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:01:02', '2025-08-27 12:01:02', NULL),
(150, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:02:48', '2025-08-27 12:02:48', NULL),
(151, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:04:00', '2025-08-27 12:04:00', NULL),
(152, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:05:31', '2025-08-27 12:05:31', NULL),
(153, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:06:43', '2025-08-27 12:06:43', NULL),
(154, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:06:58', '2025-08-27 12:06:58', NULL),
(155, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:08:04', '2025-08-27 12:08:04', NULL),
(156, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:09:16', '2025-08-27 12:09:16', NULL),
(157, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:09:46', '2025-08-27 12:09:46', NULL),
(158, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:12:52', '2025-08-27 12:12:52', NULL),
(159, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:14:10', '2025-08-27 12:14:10', NULL),
(160, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:15:32', '2025-08-27 12:15:32', NULL),
(161, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:17:55', '2025-08-27 12:17:55', NULL),
(162, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:20:35', '2025-08-27 12:20:35', NULL),
(163, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:22:18', '2025-08-27 12:22:18', NULL),
(164, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:22:32', '2025-08-27 12:22:32', NULL),
(165, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:23:53', '2025-08-27 12:23:53', NULL),
(166, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:25:06', '2025-08-27 12:25:06', NULL),
(167, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:26:25', '2025-08-27 12:26:25', NULL),
(168, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:27:34', '2025-08-27 12:27:34', NULL),
(169, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:28:55', '2025-08-27 12:28:55', NULL),
(170, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:29:21', '2025-08-27 12:29:21', NULL),
(171, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:30:48', '2025-08-27 12:30:48', NULL),
(172, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:37:01', '2025-08-27 12:37:01', NULL),
(173, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:38:12', '2025-08-27 12:38:12', NULL),
(174, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:39:23', '2025-08-27 12:39:23', NULL),
(175, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 12:41:04', '2025-08-27 12:41:04', NULL),
(176, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:04:45', '2025-08-27 15:04:45', NULL),
(177, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:08:17', '2025-08-27 15:08:17', NULL),
(178, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:11:12', '2025-08-27 15:11:12', NULL),
(179, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:13:02', '2025-08-27 15:13:02', NULL),
(180, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:13:39', '2025-08-27 15:13:39', NULL),
(181, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:17:05', '2025-08-27 15:17:05', NULL),
(182, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:19:45', '2025-08-27 15:19:45', NULL),
(183, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:22:43', '2025-08-27 15:22:43', NULL),
(184, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:25:07', '2025-08-27 15:25:07', NULL),
(185, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:25:26', '2025-08-27 15:25:26', NULL),
(186, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:28:04', '2025-08-27 15:28:04', NULL),
(187, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:29:41', '2025-08-27 15:29:41', NULL),
(188, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:31:04', '2025-08-27 15:31:04', NULL),
(189, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:34:39', '2025-08-27 15:34:39', NULL),
(190, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:34:53', '2025-08-27 15:34:53', NULL),
(191, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:38:30', '2025-08-27 15:38:30', NULL),
(192, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:41:40', '2025-08-27 15:41:40', NULL),
(193, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:42:26', '2025-08-27 15:42:26', NULL),
(194, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:47:05', '2025-08-27 15:47:05', NULL),
(195, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:50:10', '2025-08-27 15:50:10', NULL),
(196, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:50:55', '2025-08-27 15:50:55', NULL),
(197, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:53:04', '2025-08-27 15:53:04', NULL),
(198, 'Product Updated Request', 'Product Updated Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=1', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:53:18', '2025-08-27 15:53:18', NULL),
(199, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:56:57', '2025-08-27 15:56:57', NULL),
(200, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 15:59:01', '2025-08-27 15:59:01', NULL),
(201, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:00:24', '2025-08-27 16:00:24', NULL),
(202, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:02:50', '2025-08-27 16:02:50', NULL),
(203, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:03:15', '2025-08-27 16:03:15', NULL),
(204, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:05:36', '2025-08-27 16:05:36', NULL),
(205, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:08:18', '2025-08-27 16:08:18', NULL),
(206, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:09:42', '2025-08-27 16:09:42', NULL),
(207, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:12:45', '2025-08-27 16:12:45', NULL),
(208, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:13:03', '2025-08-27 16:13:03', NULL),
(209, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:15:01', '2025-08-27 16:15:01', NULL),
(210, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:15:17', '2025-08-27 16:15:17', NULL),
(211, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:16:35', '2025-08-27 16:16:35', NULL),
(212, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:17:45', '2025-08-27 16:17:45', NULL),
(213, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:18:58', '2025-08-27 16:18:58', NULL),
(214, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:19:02', '2025-08-27 16:19:02', NULL),
(215, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:20:15', '2025-08-27 16:20:15', NULL),
(216, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:21:00', '2025-08-27 16:21:00', NULL),
(217, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:23:21', '2025-08-27 16:23:21', NULL),
(218, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:23:27', '2025-08-27 16:23:27', NULL),
(219, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:25:12', '2025-08-27 16:25:12', NULL),
(220, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:25:43', '2025-08-27 16:25:43', NULL),
(221, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 16:26:31', '2025-08-27 16:26:31', NULL),
(222, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:25:20', '2025-08-27 17:25:20', NULL),
(223, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:27:06', '2025-08-27 17:27:06', NULL),
(224, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:29:22', '2025-08-27 17:29:22', NULL),
(225, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:36:41', '2025-08-27 17:36:41', NULL),
(226, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:41:57', '2025-08-27 17:41:57', NULL),
(227, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:55:17', '2025-08-27 17:55:17', NULL),
(228, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:57:04', '2025-08-27 17:57:04', NULL),
(229, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:58:26', '2025-08-27 17:58:26', NULL),
(230, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 17:59:51', '2025-08-27 17:59:51', NULL),
(231, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:12:11', '2025-08-27 19:12:11', NULL),
(232, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:15:07', '2025-08-27 19:15:07', NULL);
INSERT INTO `notifications` (`id`, `title`, `content`, `url`, `icon`, `type`, `shop_id`, `user_id`, `is_read`, `created_at`, `updated_at`, `withdraw_id`) VALUES
(233, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:22:31', '2025-08-27 19:22:31', NULL),
(234, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:24:31', '2025-08-27 19:24:31', NULL),
(235, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:27:32', '2025-08-27 19:27:32', NULL),
(236, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:30:02', '2025-08-27 19:30:02', NULL),
(237, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:32:04', '2025-08-27 19:32:04', NULL),
(238, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:34:21', '2025-08-27 19:34:21', NULL),
(239, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:36:39', '2025-08-27 19:36:39', NULL),
(240, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 19:49:37', '2025-08-27 19:49:37', NULL),
(241, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 20:02:22', '2025-08-27 20:02:22', NULL),
(242, 'New product Created Request', 'New product Created Request from متجر مكتبة النهرين الالكتروني', '/admin/products?status=0', 'bi-shop', 'success', NULL, NULL, 0, '2025-08-27 20:05:24', '2025-08-27 20:05:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `pos_order` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_code` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `pick_date` timestamp NULL DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `payable_amount` double NOT NULL,
  `total_amount` double NOT NULL,
  `tax_amount` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `delivery_charge` double NOT NULL DEFAULT 0,
  `payment_status` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `instruction` longtext DEFAULT NULL,
  `invoice_path` varchar(255) DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `admin_commission` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_vat_taxes`
--

CREATE TABLE `order_vat_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_editable` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `url`, `description`, `is_active`, `is_editable`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Products', 'products', 'products', NULL, 1, 0, 1, NULL, NULL),
(2, 'Shops', 'shops', 'shops', NULL, 1, 0, 1, NULL, NULL),
(3, 'Most Popular', 'most-popular', 'most-popular', NULL, 1, 0, 1, NULL, NULL),
(4, 'Best Deal', 'best-deal', 'best-deal', NULL, 1, 0, 1, NULL, NULL),
(5, 'Contact', 'contact-us', 'contact-us', NULL, 1, 0, 1, NULL, NULL),
(6, 'Blogs', 'blogs', 'blogs', NULL, 1, 0, 1, NULL, NULL),
(7, 'About Us', 'about-us', 'about-us', '<html><head><title>Nam quidem et est tempore.</title></head><body><form action=\"example.org\" method=\"POST\"><label for=\"username\">aut</label><input type=\"text\" id=\"username\"><label for=\"password\">qui</label><input type=\"password\" id=\"password\"></form><div id=\"88753\"><p>Fuga labore nesciunt voluptas quia.</p><h2>Sunt ea sit.</h2><i>Incidunt iure cumque qui suscipit aperiam laboriosam est esse.</i>Nemo quasi quia qui recusandae impedit.</div><div id=\"54683\"></div><div id=\"96914\"><ul><li>Repudiandae officia consectetur ut.</li><li>Quia illum et molestias inventore.</li><li>Illum debitis.</li><li>Voluptas quis sint ipsam quae.</li><li>Maxime exercitationem quia ut.</li><li>Fugiat voluptatem consequatur.</li><li>Maxime.</li><li>Vitae cumque et.</li><li>Rerum quod sed delectus.</li><li>Iusto harum dicta.</li><li>Officiis ipsam quasi molestiae.</li></ul><table><thead><tr><th>Error aut totam adipisci aut.</th><th>Porro qui id.</th><th>Vero animi mollitia voluptas dignissimos veniam.</th></tr></thead><tbody><tr><td>Molestiae dicta.</td><td>Nihil amet et consequuntur tenetur exercitationem et rem iste exercitationem molestiae velit.</td><td>Veniam.</td></tr><tr><td>Voluptate sed commodi labore.</td><td>Perferendis perferendis officia ipsum recusandae ab dolor non quaerat.</td><td>Nihil assumenda.</td></tr><tr><td>Et.</td><td>Officia voluptatem.</td><td>Neque nemo omnis dolorum.</td></tr><tr><td>Vitae corrupti est.</td><td>Dolor recusandae.</td><td>Delectus.</td></tr><tr><td>Labore doloribus.</td><td>Cumque eaque placeat maiores tempora repudiandae.</td><td>Aliquid natus quo nihil est soluta.</td></tr><tr><td>Doloremque reiciendis sit dolorem facilis architecto architecto praesentium omnis voluptatem sit id aspernatur.</td><td>Error maxime ut dolorem commodi sit nemo est omnis quia.</td><td>Sunt et et.</td></tr></tbody></table></div></body></html>\n', 1, 1, 1, NULL, NULL),
(8, 'Privacy Policy', 'privacy-policy', 'privacy-policy', '<html><head><title>Non sequi.</title></head><body><form action=\"example.net\" method=\"POST\"><label for=\"username\">sint</label><input type=\"text\" id=\"username\"><label for=\"password\">molestiae</label><input type=\"password\" id=\"password\"></form><div id=\"39684\"></div></body></html>\n', 1, 1, 1, NULL, NULL),
(9, 'Terms of Service', 'terms-and-conditions', 'terms-and-conditions', '<html><head><title>Dolore laborum dolorem quae non est delectus.</title></head><body><form action=\"example.net\" method=\"POST\"><label for=\"username\">quisquam</label><input type=\"text\" id=\"username\"><label for=\"password\">aut</label><input type=\"password\" id=\"password\"></form><div class=\"doloribus\"><div id=\"11569\"></div></div><div class=\"doloribus\"></div><div id=\"20963\"><div id=\"77410\"></div><div id=\"35807\"></div></div><div id=\"97415\"><div id=\"95083\"></div><div id=\"21686\"><b>Reprehenderit accusantium culpa dolores iusto.</b><a href=\"example.com\">Aut minus facere sunt similique ipsam incidunt.</a><span>Facere eum cumque architecto corporis aliquid.</span>Qui ut.</div></div></body></html>\n', 1, 1, 1, NULL, NULL),
(10, 'Return policy / Refund Policy', 'return-and-refund-policy', 'page/return-and-refund-policy', '<html><head><title>Quo ea.</title></head><body><form action=\"example.com\" method=\"POST\"><label for=\"username\">libero</label><input type=\"text\" id=\"username\"><label for=\"password\">voluptatem</label><input type=\"password\" id=\"password\"></form><div class=\"nam\"></div><div id=\"28235\"></div><div id=\"40425\"></div></body></html>\n', 1, 1, 0, NULL, NULL),
(11, 'Shipping & Delivery Policy', 'shipping-and-delivery-policy', 'page/shipping-and-delivery-policy', '<html><head><title>Commodi tempore hic nulla autem.</title></head><body><form action=\"example.com\" method=\"POST\"><label for=\"username\">molestiae</label><input type=\"text\" id=\"username\"><label for=\"password\">recusandae</label><input type=\"password\" id=\"password\"></form><div id=\"46453\"><a href=\"example.net\">Voluptas itaque tempora est ea.</a><p>Incidunt assumenda sint rerum deserunt.</p><a href=\"example.org\">Animi cumque ipsa sunt officiis aut nihil accusantium.</a></div><div class=\"natus\"></div><div class=\"qui\"></div></body></html>\n', 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `currency` varchar(255) DEFAULT 'USD',
  `payment_method` varchar(255) DEFAULT 'cash',
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `payment_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `currency`, `payment_method`, `is_paid`, `payment_token`, `created_at`, `updated_at`) VALUES
(1, 101, 'USD', 'cash', 0, NULL, '2025-08-14 02:36:20', '2025-08-14 02:36:20'),
(2, -10.11, 'USD', 'cash', 0, NULL, '2025-08-22 05:51:10', '2025-08-22 05:51:10'),
(3, 1100, 'USD', 'cash', 0, NULL, '2025-08-22 05:58:07', '2025-08-22 05:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `mode` varchar(255) NOT NULL DEFAULT 'test' COMMENT 'test or live',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `alias` varchar(255) DEFAULT NULL COMMENT 'controller nameSpace',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `title`, `name`, `media_id`, `config`, `mode`, `is_active`, `alias`, `created_at`, `updated_at`) VALUES
(1, 'Stripe', 'stripe', NULL, '{\"secret_key\":\"sk_test_51LQPRBI8v6B8L0HsH8JBOEoUuzy0OMkhiOeqfiei1AHEkZBUnmcf7Cv5Go6fwhi3HYayZgjeLxjDsP0DYHcR0xJ1008GRte5Vf\",\"published_key\":\"pk_test_51LQPRBI8v6B8L0HsDPqZN4PY9gpuOvAktw3bqhvqWfo3zXs7Xe6S1hntVX7hZjVIVCDQ76nroy0nHUYGpRjt0lbT00aiqqq3M7\"}', 'test', 1, 'Stripe', NULL, NULL),
(2, 'PayPal', 'paypal', NULL, '{\"client_id\":\"ASw2Ol4zJrd7UOYWz7Vjwv2ZBEZ9AXuF4aCbSXLXImOp8HaCFwGHCggJ1QBuzSoouGJ6vMncd9pMAtV9\",\"client_secret\":\"EA3d_eVh67xx4_vk1FYAsV75faeFvLVf1B6d2Rg9E4BfjXetw63k883MtSoVLi2v8P3bbW3tOJVFEKdt\"}', 'test', 1, 'PayPal', NULL, NULL),
(3, 'Razorpay', 'razorpay', NULL, '{\"key\":\"rzp_live_C7ayx7PaJJkARf\",\"secret\":\"4BdgF5N5FitWBRBA6QwZrVwi\"}', 'test', 1, 'Razorpay', NULL, NULL),
(4, 'Paystack', 'paystack', NULL, '{\"public_key\":\"pk_test_99e718f74dfbffff4a4101680c367d39d5d90c5b\",\"secret_key\":\"sk_test_12498c55ac75a902a8ebe908f4e5108790e6e93c\",\"machant_email\":\"\"}', 'test', 1, 'PayStack', NULL, NULL),
(5, 'aamarPay', 'aamarpay', NULL, '{\"store_id\":\"aamarpaytest\",\"signature_key\":\"dbb74894e82415a2f7ff0ec3a97e4183\"}', 'test', 1, 'AamarPay', NULL, NULL),
(6, 'BKash', 'bKash', NULL, '{\"username\":\"sandboxTokenizedUser02\",\"password\":\"sandboxTokenizedUser02@12345\",\"app_key\":\"4f6o0cjiki2rfm34kfdadl1eqq\",\"app_secret_key\":\"2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b\"}', 'test', 1, 'Bkash', NULL, NULL),
(7, 'PayTabs', 'paytabs', NULL, '{\"base_url\":\"https:\\/\\/secure-global.paytabs.com\",\"profile_id\":\"142160\",\"server_key\":\"S6J9R6JRLB-JJBGTHLGJK-GZWGDGZMJL\",\"currency\":\"USD\"}', 'test', 1, 'PayTabs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payments`
--

CREATE TABLE `paypal_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.shop.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(2, 'admin.shop.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(3, 'admin.shop.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(4, 'admin.shop.status.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(5, 'admin.shop.show', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(6, 'admin.shop.orders', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(7, 'admin.shop.products', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(8, 'admin.shop.reset.password', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(9, 'admin.product.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(10, 'admin.product.approve', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(11, 'admin.product.show', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(12, 'admin.product.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(13, 'admin.coupon.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(14, 'admin.coupon.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(15, 'admin.coupon.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(16, 'admin.coupon.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(17, 'admin.withdraw.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(18, 'admin.withdraw.update', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(19, 'admin.withdraw.show', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(20, 'admin.subscription-plan.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(21, 'admin.subscription-plan.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(22, 'admin.subscription-plan.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(23, 'admin.subscription-plan.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(24, 'admin.subscription-plan.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(25, 'admin.dashboard.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(26, 'admin.dashboard.notification', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(27, 'admin.banner.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(28, 'admin.banner.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(29, 'admin.banner.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(30, 'admin.banner.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(31, 'admin.banner.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(32, 'admin.ad.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(33, 'admin.ad.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(34, 'admin.ad.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(35, 'admin.ad.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(36, 'admin.ad.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(37, 'admin.order.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(38, 'admin.order.show', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(39, 'admin.order.status.change', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(40, 'admin.order.payment.status.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(41, 'admin.order.assign.rider', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(42, 'admin.review.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(43, 'admin.review.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(44, 'admin.brand.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(45, 'admin.brand.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(46, 'admin.brand.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(47, 'admin.brand.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(48, 'admin.brand.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(49, 'admin.color.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(50, 'admin.color.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(51, 'admin.color.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(52, 'admin.color.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(53, 'admin.color.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(54, 'admin.size.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(55, 'admin.size.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(56, 'admin.size.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(57, 'admin.size.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(58, 'admin.size.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(59, 'admin.unit.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(60, 'admin.unit.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(61, 'admin.unit.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(62, 'admin.unit.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(63, 'admin.unit.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(64, 'admin.category.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(65, 'admin.category.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(66, 'admin.category.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(67, 'admin.category.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(68, 'admin.category.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(69, 'admin.subcategory.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(70, 'admin.subcategory.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(71, 'admin.subcategory.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(72, 'admin.subcategory.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(73, 'admin.subcategory.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(74, 'admin.flashSale.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(75, 'admin.flashSale.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(76, 'admin.flashSale.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(77, 'admin.flashSale.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(78, 'admin.flashSale.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(79, 'admin.generale-setting.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(80, 'admin.generale-setting.update', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(81, 'admin.business-setting.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(82, 'admin.business-setting.update', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(83, 'admin.verification.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(84, 'admin.verification.update', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(85, 'admin.socialLink.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(86, 'admin.socialLink.update', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(87, 'admin.socialLink.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(88, 'admin.socialAuth.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(89, 'admin.socialAuth.update', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(90, 'admin.socialAuth.toggle', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(91, 'admin.menu.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(92, 'admin.menu.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(93, 'admin.menu.edit', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(94, 'admin.menu.remove', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(95, 'admin.menu.destroy', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(96, 'admin.page.index', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(97, 'admin.page.create', 'web', '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(98, 'admin.page.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(99, 'admin.page.show', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(100, 'admin.page.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(101, 'admin.country.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(102, 'admin.country.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(103, 'admin.country.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(104, 'admin.country.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(105, 'admin.currency.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(106, 'admin.currency.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(107, 'admin.currency.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(108, 'admin.currency.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(109, 'admin.currency.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(110, 'admin.themeColor.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(111, 'admin.themeColor.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(112, 'admin.themeColor.change', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(113, 'admin.deliveryCharge.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(114, 'admin.deliveryCharge.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(115, 'admin.deliveryCharge.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(116, 'admin.deliveryCharge.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(117, 'admin.pusher.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(118, 'admin.pusher.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(119, 'admin.mailConfig.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(120, 'admin.mailConfig.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(121, 'admin.paymentGateway.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(122, 'admin.paymentGateway.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(123, 'admin.paymentGateway.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(124, 'admin.sms-gateway.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(125, 'admin.sms-gateway.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(126, 'admin.googleReCaptcha.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(127, 'admin.googleReCaptcha.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(128, 'admin.contactUs.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(129, 'admin.contactUs.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(130, 'admin.firebase.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(131, 'admin.firebase.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(132, 'admin.profile.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(133, 'admin.profile.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(134, 'admin.profile.change-password', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(135, 'admin.rider.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(136, 'admin.rider.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(137, 'admin.rider.show', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(138, 'admin.rider.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(139, 'admin.rider.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(140, 'admin.rider.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(141, 'admin.rider.assign.order', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(142, 'admin.customer.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(143, 'admin.customer.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(144, 'admin.customer.show', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(145, 'admin.customer.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(146, 'admin.customer.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(147, 'admin.customer.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(148, 'admin.customer.reset.password', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(149, 'admin.customerNotification.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(150, 'admin.customerNotification.send', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(151, 'admin.language.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(152, 'admin.language.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(153, 'admin.language.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(154, 'admin.language.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(155, 'admin.language.export', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(156, 'admin.language.import', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(157, 'admin.employee.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(158, 'admin.employee.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(159, 'admin.employee.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(160, 'admin.employee.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(161, 'admin.employee.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(162, 'admin.employee.reset.password', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(163, 'admin.employee.permission', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(164, 'admin.employee.permission.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(165, 'admin.role.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(166, 'admin.role.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(167, 'admin.role.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(168, 'admin.role.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(169, 'admin.role.permission', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(170, 'admin.role.permission.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(171, 'admin.ticketIssueType.index', 'web', '2025-08-13 23:14:07', '2025-08-19 18:22:15'),
(172, 'admin.ticketIssueType.create', 'web', '2025-08-13 23:14:07', '2025-08-19 18:22:15'),
(173, 'admin.ticketIssueType.edit', 'web', '2025-08-13 23:14:07', '2025-08-19 18:22:15'),
(174, 'admin.ticketIssueType.toggle', 'web', '2025-08-13 23:14:07', '2025-08-19 18:22:15'),
(175, 'admin.ticketIssueType.delete', 'web', '2025-08-13 23:14:07', '2025-08-19 18:22:15'),
(176, 'admin.supportTicket.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(177, 'admin.supportTicket.show', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(178, 'admin.supportTicket.setScheduled', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(179, 'admin.supportTicket.sendMessage', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(180, 'admin.supportTicket.updateStatus', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(181, 'admin.supportTicket.pinMessage', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(182, 'admin.supportTicket.chatToggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(183, 'admin.support.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(184, 'admin.support.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(185, 'admin.vatTax.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(186, 'admin.vatTax.order.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(187, 'admin.vatTax.store', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(188, 'admin.vatTax.update', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(189, 'admin.vatTax.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(190, 'admin.vatTax.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(191, 'admin.blog.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(192, 'admin.blog.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(193, 'admin.blog.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(194, 'admin.blog.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(195, 'admin.blog.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(196, 'shop.order.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(197, 'shop.order.show', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(198, 'shop.order.status.change', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(199, 'shop.product.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(200, 'shop.product.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(201, 'shop.product.show', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(202, 'shop.product.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(203, 'shop.product.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(204, 'shop.product.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(205, 'shop.product.barcode', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(206, 'shop.flashSale.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(207, 'shop.flashSale.show', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(208, 'shop.flashSale.productStore', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(209, 'shop.flashSale.productRemove', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(210, 'shop.flashSale.product.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(211, 'shop.voucher.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(212, 'shop.voucher.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(213, 'shop.voucher.edit', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(214, 'shop.voucher.toggle', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(215, 'shop.voucher.destroy', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(216, 'shop.bulk-product-import.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(217, 'shop.bulk-product-import.store', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(218, 'shop.bulk-product-export.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(219, 'shop.bulk-product-export.demo', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(220, 'shop.bulk-product-export.export', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(221, 'shop.gallery.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(222, 'shop.gallery.store', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(223, 'shop.pos.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(224, 'shop.pos.sales', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(225, 'shop.pos.draft', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(226, 'shop.employee.index', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(227, 'shop.employee.create', 'web', '2025-08-13 23:14:07', '2025-08-13 23:14:07'),
(228, 'shop.employee.edit', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(229, 'shop.employee.destroy', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(230, 'shop.employee.toggle', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(231, 'shop.employee.reset.password', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(232, 'shop.employee.permission', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(233, 'shop.employee.permission.update', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(234, 'shop.profile.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(235, 'shop.profile.edit', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(236, 'shop.profile.change-password', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(237, 'shop.dashboard.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(238, 'shop.dashboard.notification', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(239, 'shop.subscription.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(240, 'shop.subscription.purchase', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(241, 'shop.subscription.renew', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(242, 'shop.subscription.switch', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(243, 'shop.subscription.cancel', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(244, 'shop.brand.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(245, 'shop.color.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(246, 'shop.size.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(247, 'shop.unit.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(248, 'shop.category.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(249, 'shop.subcategory.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(250, 'shop.withdraw.index', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(251, 'shop.withdraw.store', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08'),
(252, 'shop.withdraw.show', 'web', '2025-08-13 23:14:08', '2025-08-13 23:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'api_token', '768c4bcf3f47e438c7393b938d938d52050fd4c68ae091a543fe89a0fadac1fc', '[\"*\"]', '2025-08-14 20:54:10', NULL, '2025-08-14 02:35:53', '2025-08-14 20:54:10'),
(2, 'App\\Models\\User', 6, 'api_token', '985c473d8261a9a205c2b19f0d554b8d21e959519b8061d9c5dc66d6e54d1f74', '[\"*\"]', '2025-08-22 04:46:12', NULL, '2025-08-22 04:46:11', '2025-08-22 04:46:12'),
(3, 'App\\Models\\User', 6, 'api_token', 'ad73f5f17da7bb3ed5f0599d290edbd1ba59da046326e058b5879b807d28637e', '[\"*\"]', '2025-08-22 04:46:43', NULL, '2025-08-22 04:46:42', '2025-08-22 04:46:43'),
(4, 'App\\Models\\User', 7, 'api_token', '7cb079639f15a2ca99f1ec5739876109a172937b7ce87715f70d45da97d7e90b', '[\"*\"]', '2025-08-22 05:10:23', NULL, '2025-08-22 05:10:06', '2025-08-22 05:10:23'),
(5, 'App\\Models\\User', 8, 'api_token', '5d0248b16a9a694bde4ad6b62508a30930b4f41902bef434bbccc71589302d93', '[\"*\"]', '2025-08-23 04:18:03', NULL, '2025-08-22 05:10:56', '2025-08-23 04:18:03'),
(6, 'App\\Models\\User', 9, 'api_token', 'd70f41729bcea69f1cf6d6e8e36563f709f38101ee7a81387c6a271fc2251df9', '[\"*\"]', '2025-08-22 23:20:41', NULL, '2025-08-22 05:55:49', '2025-08-22 23:20:41'),
(7, 'App\\Models\\User', 10, 'api_token', 'aea1afb54b631e990dbf1b5141bee9a8b50dddcf61a6cf4a86d26e68622f7f8e', '[\"*\"]', '2025-08-22 19:49:54', NULL, '2025-08-22 06:17:33', '2025-08-22 19:49:54'),
(8, 'App\\Models\\User', 13, 'api_token', '66c49b8c7ba29e9fbe62a4e4d60ee466a189051c5afa5fbf6819603532a8e93a', '[\"*\"]', '2025-08-27 03:11:57', NULL, '2025-08-26 04:19:56', '2025-08-27 03:11:57'),
(9, 'App\\Models\\User', 14, 'api_token', '9262c74c9d649de0d11e5370cca50fbdaedc070805b3708b1bcf4033b6d523a4', '[\"*\"]', '2025-08-27 16:33:24', NULL, '2025-08-26 14:14:07', '2025-08-27 16:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `pos_carts`
--

CREATE TABLE `pos_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pos_carts`
--

INSERT INTO `pos_carts` (`id`, `name`, `ip_address`, `shop_id`, `is_draft`, `user_id`, `coupon_id`, `discount`, `subtotal`, `total`, `note`, `created_at`, `updated_at`) VALUES
(2, '8iiLzKUfPyaq', '169.224.81.207', 3, 0, NULL, NULL, 0, 95000, 95000, NULL, '2025-08-24 00:51:10', '2025-08-24 00:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `pos_cart_products`
--

CREATE TABLE `pos_cart_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pos_cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `brand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pos_cart_products`
--

INSERT INTO `pos_cart_products` (`id`, `pos_cart_id`, `product_id`, `quantity`, `brand`, `color`, `size`, `unit`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 1, NULL, '2', '1', NULL, '2025-08-24 00:51:10', '2025-08-24 00:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `buy_price` double DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `min_order_quantity` int(11) NOT NULL DEFAULT 1,
  `discount_price` double DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `short_description_ar` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `description_ar` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_new` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_approve` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `video_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `name_ar`, `slug`, `code`, `shop_id`, `media_id`, `brand_id`, `price`, `buy_price`, `quantity`, `min_order_quantity`, `discount_price`, `short_description`, `short_description_ar`, `description`, `description_ar`, `is_active`, `is_new`, `is_featured`, `is_approve`, `created_at`, `updated_at`, `unit_id`, `meta_title`, `meta_description`, `meta_keywords`, `video_id`) VALUES
(3, 'Fantech CG85', NULL, NULL, '831500', 3, 48, NULL, 95000, 95000, 1111, 1, 90000, 'حافظة ألعاب متوسطة الحجم (Mid Tower) أنيقة وعملية، مع تصميم زجاجي بانورامي 270° و6 مراوح ARGB مدمجة، مثالية للعرض والإضاءة مع تحكم سهل في الكابلات.', NULL, '<p>التصميم الخارجي</p>\n\n<ol><li><strong>زجاج بانورامي بزاوية 270°</strong>: يقدّم رؤية جذابة داخل الحافظة بشكل شبه دائري من الأمام والجانبين، ما يجذب الأنظار إلى المكونات الداخلية </li><li><strong>هيكل مقاوم وقوي</strong>: مصنوع من <strong>الفولاذ والزجاج المقسّى (Tempered Glass)</strong>، ما يمنحه متانة وأناقة في الوقت ذاته</li><li><strong>نظام تركيب مغناطيسي</strong>: لتسهيل فتح اللوحات والوصول إلى المكونات، مما يجعل الصيانة والتعديل بسرعة وسهولة </li></ol>\n\n<p>إدارة الكابلات والتوسعة</p>\n\n<ol><li><strong>تحكم مريح في الكابلات</strong>: يحتوي على فتحات متعددة خلف اللوحة الخلفية، ما يساعد على تنظيم الكابلات بفعالية ويحسّن تدفق الهواء الداخلي </li><li><strong>مساحة توسعة واسعة</strong>:</li><li>يدعم حتى <strong>7 فتحات PCI كاملة الحجم</strong> </li><li>يتسع لكروت رسومية بطول يصل إلى <strong>400 مم</strong>، ومبردات معالجة بطول يصل إلى <strong>175 مم</strong>، ومزود طاقة بطول يصل إلى <strong>240 م</strong>.</li><li><strong>أرفف داخلية</strong>: يدعم تثبيت قرص 2.5 بوصة واحد وقرص 3.5 بوصة واحد </li></ol>\n\n<p>التوافق الجماعي</p>\n\n<ol><li>متوافق مع مختلف لوحات الأم: Mini-ITX، Micro-ATX، وATX .</li><li>أبعاد الحافظة: <strong>420 × 285 × 400 مم</strong>، ووزنها حوالي <strong>5.9 كج</strong>.</li></ol>\n\n<p>المراوح والإضاءة</p>\n\n<ol><li>تأتي مجهزة بـ <strong>6 مراوح ARGB</strong> مدمجة، توفر إضاءة زاهية وتبرد فعال للمكونات الداخلية .</li></ol>\n\n<p>المنافذ الأمامية</p>\n\n<ol><li>مزودة بمنفذ <strong>USB-C (USB 3.1 Gen1)</strong>، ومنفذ <strong>USB 3.0</strong>، ومنفذ <strong>USB 2.0</strong>، بالإضافة إلى وصلة صوت <strong>HD Audio</strong>، وزرّي تشغيل وإعادة تعيين </li></ol>\n\n<p><br></p>\n\n<p><br></p>\n\n<p><br></p>\n\n<p><br></p>', NULL, 1, 0, 0, 1, '2025-08-24 00:19:58', '2025-08-26 17:22:42', NULL, NULL, NULL, NULL, NULL),
(4, 'اقلام تأشير كوش 8 لون', NULL, NULL, '642378', 4, 59, NULL, 3000, 2500, 100, 1, 0, 'هايلايتر ماركة كوش 8 لون', NULL, '<ol><li>هايلايتر ماركة كوش 8 لون </li></ol>', NULL, 1, 1, 0, 1, '2025-08-25 15:39:35', '2025-08-25 15:48:55', NULL, NULL, NULL, NULL, NULL),
(5, 'هايلايتر فيوجر 6 لون الوان باستيلية', NULL, NULL, '666071', 4, 60, NULL, 2500, 2000, 100, 1, 2000, 'هايلايتر فيوجر 6  لون الوان باستيلية', NULL, '<p>هايلايتر فيوجر 6  لون الوان باستيلية </p>', NULL, 1, 1, 0, 1, '2025-08-25 15:53:43', '2025-08-25 15:53:43', NULL, NULL, NULL, NULL, NULL),
(6, 'هايلايتر فيوجر 6  لون الوان فسفورية', NULL, NULL, '803149', 4, 61, NULL, 2500, 2000, 100, 1, 2000, 'هايلايتر فيوجر 6  لون الوان فسفورية', NULL, '<p>هايلايتر فيوجر 6  لون الوان فسفورية  </p>', NULL, 1, 1, 0, 1, '2025-08-25 15:56:24', '2025-08-25 15:56:24', NULL, NULL, NULL, NULL, NULL),
(7, 'اقلام تأشير 0.5 ملم 12 لون', NULL, NULL, '164720', 4, 62, NULL, 3000, 2500, 100, 1, 2500, 'اقلام تأشير 0.5 ملم 12 لون', NULL, '<p>اقلام تأشير 0.5 ملم 12 لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 15:58:26', '2025-08-25 15:58:26', NULL, NULL, NULL, NULL, NULL),
(8, 'اقلام تأشير وجهين', NULL, NULL, '558963', 4, 63, NULL, 3000, 2500, 100, 1, 2500, 'اقلام تأشير وجهين', NULL, '<p>اقلام تأشير وجهين </p>', NULL, 1, 1, 0, 1, '2025-08-25 15:59:50', '2025-08-25 15:59:50', NULL, NULL, NULL, NULL, NULL),
(9, 'اقلام تأشير دلي سبونج وب 6 لون', NULL, NULL, '713716', 4, 64, NULL, 3000, 3000, 20, 1, 0, 'اقلام تأشير دلي سبونج وب 6 لون', NULL, '<p>اقلام تأشير دلي سبونج وب 6 لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 16:01:08', '2025-08-25 16:01:08', NULL, NULL, NULL, NULL, NULL),
(10, 'محفظة اقلام اصلية', NULL, NULL, '531857', 4, 67, NULL, 5000, 5000, 50, 1, 0, 'محفظة اقلام اصلية', NULL, '<p>محفظة اقلام اصلية </p>', NULL, 1, 0, 0, 1, '2025-08-25 16:15:19', '2025-08-25 19:38:12', NULL, NULL, NULL, NULL, NULL),
(11, 'اقلام رصاص دلي اصلي', NULL, NULL, '389725', 4, 84, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:32:24', '2025-08-25 17:32:24', NULL, NULL, NULL, NULL, NULL),
(12, 'اقلام رصاص دلي اصلي', NULL, NULL, '267665', 4, 85, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:33:14', '2025-08-25 17:33:14', NULL, NULL, NULL, NULL, NULL),
(13, 'اقلام رصاص دلي اصلي', NULL, NULL, '580445', 4, 86, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:34:21', '2025-08-25 17:34:21', NULL, NULL, NULL, NULL, NULL),
(14, 'اقلام رصاص دلي اصلي', NULL, NULL, '585151', 4, 87, NULL, 1250, 1000, 1000, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:35:21', '2025-08-25 17:35:21', NULL, NULL, NULL, NULL, NULL),
(15, 'اقلام رصاص دلي اصلي', NULL, NULL, '776361', 4, 88, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:36:12', '2025-08-25 17:36:12', NULL, NULL, NULL, NULL, NULL),
(16, 'اقلام رصاص دلي اصلي', NULL, NULL, '353714', 4, 89, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:36:56', '2025-08-25 17:36:56', NULL, NULL, NULL, NULL, NULL),
(17, 'اقلام رصاص دلي اصلي', NULL, NULL, '326400', 4, 90, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:37:45', '2025-08-25 17:37:45', NULL, NULL, NULL, NULL, NULL),
(18, 'اقلام رصاص دلي اصلي', NULL, NULL, '169572', 4, 91, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:40:05', '2025-08-25 17:40:05', NULL, NULL, NULL, NULL, NULL),
(19, 'اقلام رصاص دلي اصلي', NULL, NULL, '276850', 4, 92, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:41:07', '2025-08-25 17:41:07', NULL, NULL, NULL, NULL, NULL),
(20, 'اقلام رصاص دلي اصلي', NULL, NULL, '835952', 4, 93, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:41:51', '2025-08-25 17:41:51', NULL, NULL, NULL, NULL, NULL),
(21, 'اقلام رصاص دلي اصلي', NULL, NULL, '751093', 4, 94, NULL, 1250, 1000, 100, 1, 1000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:42:44', '2025-08-25 17:42:44', NULL, NULL, NULL, NULL, NULL),
(22, 'اقلام رصاص دلي اصلي', NULL, NULL, '306816', 4, 95, NULL, 2500, 2000, 100, 1, 2000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:43:38', '2025-08-25 17:43:38', NULL, NULL, NULL, NULL, NULL),
(23, 'اقلام رصاص دلي اصلي', NULL, NULL, '410104', 4, 96, NULL, 2500, 2000, 100, 1, 2000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:44:28', '2025-08-25 17:44:28', NULL, NULL, NULL, NULL, NULL),
(24, 'اقلام رصاص دلي اصلي', NULL, NULL, '644554', 4, 97, NULL, 2500, 2000, 100, 1, 2000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:45:09', '2025-08-25 17:45:09', NULL, NULL, NULL, NULL, NULL),
(25, 'اقلام رصاص دلي اصلي', NULL, NULL, '720705', 4, 98, NULL, 2500, 2000, 100, 1, 2000, 'اقلام رصاص دلي اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:46:00', '2025-08-25 17:46:00', NULL, NULL, NULL, NULL, NULL),
(26, 'اقلام رصاص اصلي', NULL, NULL, '768344', 4, 99, NULL, 2500, 2000, 100, 1, 2000, 'اقلام رصاص اصلي', NULL, '<p>اقلام رصاص دلي اصلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 17:47:07', '2025-08-25 17:47:07', NULL, NULL, NULL, NULL, NULL),
(27, 'اسلامية ساجد العكيلي 2026', NULL, NULL, '414585', 4, 102, NULL, 10000, 10000, 100, 1, 0, 'اسلامية ساجد العكيلي 2026 للصف السادس الاعدادي', NULL, '<p>اسلامية ساجد العكيلي 2026 للصف السادس الاعدادي </p>', NULL, 0, 1, 0, 1, '2025-08-25 18:37:19', '2025-08-26 18:26:19', NULL, NULL, NULL, NULL, NULL),
(28, 'اسلامية علي فليح داوود 2026', NULL, NULL, '222178', 4, 104, NULL, 10000, 10000, 100, 1, 0, 'اسلامية علي فليح داوود 2026  للصف السادس الاعدادي', NULL, '<p>اسلامية علي فليح داوود 2026  للصف السادس الاعدادي </p>', NULL, 0, 0, 0, 1, '2025-08-25 18:54:40', '2025-08-26 18:26:25', NULL, NULL, NULL, NULL, NULL),
(29, 'محفظة اقلام اصلية', NULL, NULL, '931292', 4, 105, NULL, 6000, 6000, 100, 1, 6000, 'محفظة اقلام اصلية الخارج جيلاتيني والداخل مقوى', NULL, '<p>محفظة اقلام اصلية الخارج جيلاتيني والداخل مقوى </p>', NULL, 1, 1, 0, 1, '2025-08-25 19:44:41', '2025-08-25 19:44:41', NULL, NULL, NULL, NULL, NULL),
(30, 'اقلام جاف ملونة 0.5', NULL, NULL, '610320', 4, 109, NULL, 3000, 3000, 100, 1, 0, 'اقلام جاف ملونة 0.5  من ماركة كوش 8 لون', NULL, '<p>اقلام جاف ملونة 0.5  من ماركة كوش 8 لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 19:53:29', '2025-08-25 19:53:29', NULL, NULL, NULL, NULL, NULL),
(31, 'اقلام جاف ملونة 0.5 ماركة دلي', NULL, NULL, '932618', 4, 110, NULL, 3500, 3500, 100, 1, 0, 'اقلام جاف ملونة 0.5 ماركة دلي 12 لون', NULL, '<p>اقلام جاف ملونة 0.5 ماركة دلي 12 لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 19:55:26', '2025-08-25 19:55:26', NULL, NULL, NULL, NULL, NULL),
(32, 'اقلام جاف ملونة 0.5 الوان باستيلية', NULL, NULL, '426067', 4, 111, NULL, 2500, 2500, 100, 1, 0, 'اقلام جاف ملونة 0.5 الوان باستيلية 8 لون', NULL, '<p>اقلام جاف ملونة 0.5 الوان باستيلية 8 لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 19:56:50', '2025-08-25 19:56:50', NULL, NULL, NULL, NULL, NULL),
(33, 'اقلام جاف 0.5 ملم  8 لون اكرلك', NULL, NULL, '949012', 4, 112, NULL, 3500, 3500, 100, 1, 0, 'اقلام جاف 0.5 ملم  8 لون ماركة كوش', NULL, '<p>اقلام جاف 0.5 ملم  8 لون ماركة كوش </p>', NULL, 1, 1, 0, 1, '2025-08-25 19:59:05', '2025-08-25 19:59:05', NULL, NULL, NULL, NULL, NULL),
(34, 'اقلام جاف ملونة 0.5 كوش', NULL, NULL, '549233', 4, 113, NULL, 2000, 2000, 100, 1, 0, 'اقلام جاف ملونة 0.5 كوش', NULL, '<p>اقلام جاف ملونة 0.5 كوش </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:03:01', '2025-08-25 20:03:01', NULL, NULL, NULL, NULL, NULL),
(35, 'اقلام جاف لماع ماركة بنتونك', NULL, NULL, '189000', 4, 114, NULL, 3500, 3000, 100, 1, 3000, 'اقلام جاف لماع ماركة بنتونك', NULL, '<p>اقلام جاف لماع ماركة بنتونك </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:04:27', '2025-08-25 20:04:27', NULL, NULL, NULL, NULL, NULL),
(36, 'اقلام جاف بنتونك 1 ملم', NULL, NULL, '354982', 4, 115, NULL, 3500, 3000, 100, 1, 3000, 'اقلام جاف بنتونك 1 ملم 10 لون', NULL, '<p>اقلام جاف بنتونك 1 ملم 10 لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:06:13', '2025-08-25 20:06:13', NULL, NULL, NULL, NULL, NULL),
(37, 'اقلام جاف ملونة 8 لون 0.5mm', NULL, NULL, '485867', 4, 116, NULL, 3500, 3000, 100, 1, 3000, 'اقلام جاف ملونة 8 لون 0.5mm', NULL, '<p>اقلام جاف ملونة 8 لون 0.5mm </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:11:31', '2025-08-25 20:11:31', NULL, NULL, NULL, NULL, NULL),
(38, 'اقلام جاف ملونة 6 لون 0.5mm', NULL, NULL, '709919', 4, 117, NULL, 2500, 2000, 100, 1, 2000, 'اقلام جاف ملونة 6 لون 0.5mm', NULL, '<p>اقلام جاف ملونة 6 لون 0.5mm </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:12:53', '2025-08-25 20:12:53', NULL, NULL, NULL, NULL, NULL),
(39, 'اقلام جل ملونة 12  لون', NULL, NULL, '421925', 4, 118, NULL, 4500, 4500, 100, 1, 4000, 'اقلام جل ملونة 12  لون', NULL, '<p>اقلام جل ملونة 12  لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:15:35', '2025-08-25 20:15:35', NULL, NULL, NULL, NULL, NULL),
(40, 'اقلام جاف ملونة 12  لون بنتونك', NULL, NULL, '272108', 4, 119, NULL, 4500, 4000, 100, 1, 4000, 'اقلام جاف ملونة 12  لون بنتونك', NULL, '<p>اقلام جاف ملونة 12  لون بنتونك </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:17:51', '2025-08-25 20:17:51', NULL, NULL, NULL, NULL, NULL),
(41, 'اقلام جل لماع  6   ماركة بنترون', NULL, NULL, '148117', 4, 120, NULL, 3000, 3000, 100, 1, 2500, 'اقلام جل لماع  6   ماركة بنترون', NULL, '<p>اقلام جل لماع  6   ماركة بنترون </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:20:39', '2025-08-25 20:20:39', NULL, NULL, NULL, NULL, NULL),
(42, 'اقلام جاف 0.5 ملم  8 لون باستيلي', NULL, NULL, '268250', 4, 121, NULL, 3500, 3500, 100, 1, 3000, 'اقلام جاف 0.5 ملم  8 لون باستيلي كوش', NULL, '<p>اقلام جاف 0.5 ملم  8 لون باستيلي كوش </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:25:24', '2025-08-25 20:25:24', NULL, NULL, NULL, NULL, NULL),
(43, 'اقلام جاف ملونة وجهين 12 لون ماركة دلي', NULL, NULL, '544465', 4, 122, NULL, 5000, 5000, 100, 1, 5000, 'اقلام جاف ملونة وجهين 12 لون ماركة دلي', NULL, '<p>اقلام جاف ملونة وجهين 12 لون ماركة دلي </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:26:42', '2025-08-25 20:26:42', NULL, NULL, NULL, NULL, NULL),
(44, 'اقلام جاف ملونة ضغط 7 لون', NULL, NULL, '374831', 4, 123, NULL, 3500, 3500, 100, 1, 3500, 'اقلام جاف ملونة ضغط 7 لون', NULL, '<p>اقلام جاف ملونة ضغط 7 لون </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:28:01', '2025-08-25 20:28:01', NULL, NULL, NULL, NULL, NULL),
(45, 'اقلام جاف ملونة 10 لون 1.0 mm', NULL, NULL, '145439', 4, 124, NULL, 2000, 2000, 100, 1, 2000, 'اقلام جاف ملونة 10 لون 1.0 mm', NULL, '<p>اقلام جاف ملونة 10 لون 1.0 mm</p>', NULL, 1, 1, 0, 1, '2025-08-25 20:30:48', '2025-08-25 20:30:48', NULL, NULL, NULL, NULL, NULL),
(46, 'اقلام جاف ملونة 8 لون ضغط', NULL, NULL, '992470', 4, 125, NULL, 3500, 3500, 100, 1, 3500, 'اقلام جاف ملونة 8 لون ضغط  الوان باستيلية', NULL, '<p>اقلام جاف ملونة 8 لون ضغط  الوان باستيلية </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:33:43', '2025-08-25 20:33:43', NULL, NULL, NULL, NULL, NULL),
(47, 'اقلام جاف ملونة دب 12 لون', NULL, NULL, '788440', 4, 126, NULL, 3500, 3500, 100, 1, 3000, 'اقلام جاف ملونة دب 12 لون ماركة كوش', NULL, '<p>اقلام جاف ملونة دب 12 لون ماركة كوش </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:45:14', '2025-08-25 20:45:14', NULL, NULL, NULL, NULL, NULL),
(48, 'اقلام جاف ملونة دب 8 لون', NULL, NULL, '920396', 4, 127, NULL, 2500, 2500, 100, 1, 2000, 'اقلام جاف ملونة دب 8 لون ماركة كوش', NULL, '<p>اقلام جاف ملونة دب 8 لون ماركة كوش </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:46:38', '2025-08-25 20:46:38', NULL, NULL, NULL, NULL, NULL),
(49, 'اقلام جاف ملونة دب 6 لون', NULL, NULL, '974104', 4, 128, NULL, 2000, 1500, 100, 1, 1500, 'اقلام جاف ملونة دب 6 لون ماركة كوش', NULL, '<p>اقلام جاف ملونة دب 6 لون ماركة كوش </p>', NULL, 1, 1, 0, 1, '2025-08-25 20:47:37', '2025-08-25 20:47:37', NULL, NULL, NULL, NULL, NULL),
(50, 'كيمياء نور الدين سادس علمي 2026 ج1', NULL, NULL, '317708', 4, 129, NULL, 15000, 14000, 50, 1, 0, 'كيمياء نور الدين سادس علمي 2026 الجزء الاول', NULL, '<p>كيمياء نور الدين سادس علمي 2026 الجزء الاول </p>', NULL, 0, 1, 0, 1, '2025-08-26 12:44:13', '2025-08-26 18:24:51', NULL, NULL, NULL, NULL, NULL),
(51, 'سجل فئة 100 ورقة ستارلاين', NULL, NULL, '833260', 4, 136, NULL, 2000, 2500, 100, 1, NULL, 'سجل فئة 100 ورقة لون الورق تبني', NULL, '<p>سجل فئة 100 ورقة لون الورق تبني </p>', NULL, 1, 1, 0, 1, '2025-08-26 15:03:39', '2025-08-26 15:03:39', NULL, NULL, NULL, NULL, NULL),
(52, 'سجل فيوجر فئة 100 ورقة غلاف بلاستك', NULL, NULL, '877115', 4, 140, NULL, 2500, 2500, 100, 1, 0, 'سجل فيوجر فئة 100 ورقة غلاف بلاستك', NULL, '<p>سجل فيوجر فئة 100 ورقة غلاف بلاستك</p>', NULL, 1, 1, 0, 1, '2025-08-26 15:18:16', '2025-08-26 15:18:16', NULL, NULL, NULL, NULL, NULL),
(53, 'سجل فئة 100 ورقة  ماركة idea', NULL, NULL, '527361', 4, 146, NULL, 2500, 2500, 100, 1, 1500, 'سجل فئة 100 ورقة  ماركة idea', NULL, '<p>سجل فئة 100 ورقة  ماركة idea</p>', NULL, 1, 1, 0, 1, '2025-08-26 15:28:52', '2025-08-26 15:28:52', NULL, NULL, NULL, NULL, NULL),
(54, 'سجل فئة 100 ورقة فيوجر لاين', NULL, NULL, '343851', 4, 152, NULL, 3500, 3000, 200, 1, 3000, 'سجل فئة 100 ورقة فيوجر لاين', NULL, '<p>سجل فئة 100 ورقة فيوجر لاين</p>', NULL, 1, 1, 0, 1, '2025-08-26 15:38:05', '2025-08-26 15:38:05', NULL, NULL, NULL, NULL, NULL),
(55, 'دفتر فئة 120 ورقة فيوجر لاين', NULL, NULL, '912144', 4, 157, NULL, 2500, 2500, 100, 1, 0, 'دفتر فئة 120 ورقة فيوجر لاين غلاف بلاستك نيون', NULL, '<p>دفتر فئة 120 ورقة فيوجر لاين غلاف بلاستك نيون </p>', NULL, 1, 1, 0, 1, '2025-08-26 15:45:29', '2025-08-26 15:45:29', NULL, NULL, NULL, NULL, NULL),
(56, 'سجل فئة 100 ورقة  ماركة سيما', NULL, NULL, '155181', 4, 159, NULL, 3000, 3000, 200, 1, 2500, 'سجل فئة 100 ورقة  ماركة سيما', NULL, '<p>سجل فئة 100 ورقة  ماركة سيما</p>', NULL, 1, 1, 0, 1, '2025-08-26 15:50:28', '2025-08-26 15:50:28', NULL, NULL, NULL, NULL, NULL),
(57, 'سجل فئة 150 ورقة فيوجر لاين', NULL, NULL, '235884', 4, 164, NULL, 4000, 4000, 1000, 1, 0, 'سجل فئة 150 ورقة فيوجر لاين غلاف بلاستك نيون', NULL, '<p>سجل فئة 150 ورقة فيوجر لاين غلاف بلاستك نيون</p>', NULL, 1, 1, 0, 1, '2025-08-26 15:58:41', '2025-08-26 15:58:41', NULL, NULL, NULL, NULL, NULL),
(58, 'دفتر فئة 100 ورقة Deli', NULL, NULL, '138089', 4, 166, NULL, 2500, 2500, 200, 1, 2000, 'دفتر فئة 100 ورقة  ماركة Deli', NULL, '<p>دفتر فئة 100 ورقة  ماركة Deli </p>', NULL, 1, 1, 0, 1, '2025-08-26 16:05:16', '2025-08-26 16:05:16', NULL, NULL, NULL, NULL, NULL),
(59, 'دفتر فئة 90 ورقة فيوجر لاين', NULL, NULL, '172285', 4, 171, NULL, 2000, 1500, 100, 1, 1500, 'دفتر فئة 90 ورقة فيوجر لاين مربع الشكل', NULL, '<p>دفتر فئة 90 ورقة فيوجر لاين مربع الشكل </p>', NULL, 1, 1, 0, 1, '2025-08-26 16:12:59', '2025-08-26 16:12:59', NULL, NULL, NULL, NULL, NULL),
(60, 'دفتر فئة 90 ورقة فيوجر لاين', NULL, NULL, '859520', 4, 175, NULL, 2000, 2000, 100, 1, 0, 'دفتر فئة 90 ورقة فيوجر لاين بغلاف شفاف ورسوم مميزة', NULL, '<p>دفتر فئة 90 ورقة فيوجر لاين بغلاف شفاف ورسوم مميزة </p>', NULL, 1, 1, 0, 1, '2025-08-26 16:18:46', '2025-08-26 16:18:46', NULL, NULL, NULL, NULL, NULL),
(61, 'دفتر فئة 180 ورقة فيوجر لاين', NULL, NULL, '211912', 4, 181, NULL, 3000, 3000, 100, 1, 0, 'دفتر فئة 180 ورقة فيوجر لاين بغلاف شفاف ورسوم مميزة', NULL, '<p>دفتر فئة 180 ورقة فيوجر لاين بغلاف شفاف ورسوم مميزة</p>', NULL, 1, 1, 0, 1, '2025-08-26 16:24:27', '2025-08-26 16:24:27', NULL, NULL, NULL, NULL, NULL),
(62, 'دفتر فئة 80 ورقة فيوجر لاين غلاف جيلاتين', NULL, NULL, '251863', 4, 187, NULL, 1500, 1250, 200, 1, 1250, 'دفتر فئة 80 ورقة فيوجر لاين غلاف جيلاتين ملون', NULL, '<p>دفتر فئة 80 ورقة فيوجر لاين غلاف جيلاتين ملون </p>', NULL, 1, 1, 0, 1, '2025-08-26 16:35:47', '2025-08-26 16:35:47', NULL, NULL, NULL, NULL, NULL),
(63, 'دفتر حجم كبير فئة 100 ورقة فيوجر لاين', NULL, NULL, '749132', 4, 194, NULL, 2000, 2000, 200, 1, 1500, 'دفتر حجم كبير فئة 100 ورقة فيوجر لاين', NULL, '<p>دفتر حجم كبير فئة 100 ورقة فيوجر لاين</p>', NULL, 1, 1, 0, 1, '2025-08-26 16:40:45', '2025-08-26 16:40:45', NULL, NULL, NULL, NULL, NULL),
(64, 'سجل فئة 200 ورقة فيوجر لاين', NULL, NULL, '703894', 4, 199, NULL, 4000, 3000, 200, 1, 3000, 'سجل فئة 200 ورقة فيوجر لاين  غلاف بلاستك', NULL, '<p>سجل فئة 200 ورقة فيوجر لاين  غلاف بلاستك </p>', NULL, 1, 1, 0, 1, '2025-08-26 16:50:51', '2025-08-26 16:50:51', NULL, NULL, NULL, NULL, NULL),
(65, 'سجل فئة 200 ورقة فيوجر لاين حجم A4', NULL, NULL, '717605', 4, 205, NULL, 5000, 4500, 300, 1, 0, 'سجل فئة 200 ورقة فيوجر لاين حجم A4', NULL, '<p>سجل فئة 200 ورقة فيوجر لاين حجم A4</p>', NULL, 1, 1, 0, 1, '2025-08-26 16:56:48', '2025-08-26 16:56:48', NULL, NULL, NULL, NULL, NULL),
(66, 'ملزمة الاسلامية للاستاذ ساجد العكيلي 2026', NULL, NULL, '768931', 4, 212, NULL, 10000, 10000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ ساجد العكيلي 2026', NULL, '<p> ملزمة الاسلامية للاستاذ ساجد العكيلي 2026 </p>', NULL, 1, 1, 0, 1, '2025-08-26 18:03:27', '2025-08-26 18:03:27', NULL, NULL, NULL, NULL, NULL),
(67, 'ملزمة الاسلامية للاستاذ عمار فاضل 2026', NULL, NULL, '210762', 4, 213, NULL, 9000, 9000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ عمار فاضل 2026', NULL, '<p>ملزمة الاسلامية للاستاذ عمار فاضل 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:07:46', '2025-08-26 18:07:46', NULL, NULL, NULL, NULL, NULL),
(68, 'ملزمة الاسلامية للاستاذ عدنان البياتي 2026', NULL, NULL, '155307', 4, 214, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ عدنان البياتي 2026', NULL, '<p>ملزمة الاسلامية للاستاذ عدنان البياتي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:11:13', '2025-08-26 18:11:13', NULL, NULL, NULL, NULL, NULL),
(69, 'ملزمة الاسلامية للاستاذ خالد الحيالي 2026', NULL, NULL, '720927', 4, 215, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ خالد الحيالي للسادس اعدادي 2026', NULL, '<p>ملزمة الاسلامية للاستاذ خالد الحيالي للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:12:47', '2025-08-26 18:12:47', NULL, NULL, NULL, NULL, NULL),
(70, 'ملزمة الاسلامية للاستاذ محمد الجنائي 2026', NULL, NULL, '619124', 4, 216, NULL, 10000, 10000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ محمد الجنائي للسادس اعدادي 2026', NULL, '<p>ملزمة الاسلامية للاستاذ محمد الجنائي للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:30:09', '2025-08-26 18:30:09', NULL, NULL, NULL, NULL, NULL),
(71, 'ملزمة الاسلامية للاستاذ كرار محمود 2026', NULL, NULL, '138137', 4, 217, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ كرار محمود للسادس اعدادي 2026', NULL, '<p>ملزمة الاسلامية للاستاذ كرار محمود للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:31:36', '2025-08-26 18:31:36', NULL, NULL, NULL, NULL, NULL),
(72, 'ملزمة الاسلامية للاستاذ علي فليح داود 2026', NULL, NULL, '800485', 4, 218, NULL, 10000, 10000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ علي فليح داود للسادس اعدادي 2026', NULL, '<p>ملزمة الاسلامية للاستاذ علي فليح داود للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:33:05', '2025-08-26 18:33:05', NULL, NULL, NULL, NULL, NULL),
(73, 'ملزمة الاسلامية للاستاذ هشام المعموري 2026', NULL, NULL, '852509', 4, 219, NULL, 10000, 10000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ هشام المعموري للسادس اعدادي 2026', NULL, '<p>ملزمة الاسلامية للاستاذ هشام المعموري للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:35:22', '2025-08-26 18:35:22', NULL, NULL, NULL, NULL, NULL),
(74, 'ملزمة الاسلامية للاستاذ محمد قاسم 2026', NULL, NULL, '588727', 4, 220, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاسلامية للاستاذ محمد قاسم للسادس اعدادي 2026', NULL, '<p>ملزمة الاسلامية للاستاذ محمد قاسم للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 18:37:04', '2025-08-26 18:37:04', NULL, NULL, NULL, NULL, NULL),
(75, 'ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ محمد العبيدي الجزء الاول 2026', NULL, NULL, '590428', 4, 221, NULL, 11000, 11000, 150, 1, 0, 'ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ محمد العبيدي الجزء الاول 2026', NULL, '<p>ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ محمد العبيدي  الجزء الاول2026</p>', NULL, 1, 0, 0, 1, '2025-08-26 20:02:47', '2025-08-26 20:51:07', NULL, NULL, NULL, NULL, NULL),
(76, 'مسائل الفيزياء استاذ حسين محمد 2026', NULL, NULL, '262403', 4, 222, NULL, 10000, 10000, 100, 1, 0, 'مسائل الفيزياء استاذ حسين محمد  2026 المنهج كامل', NULL, '<p>مسائل الفيزياء استاذ حسين محمد  2026 المنهج كامل </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:16:26', '2025-08-26 20:16:26', NULL, NULL, NULL, NULL, NULL),
(77, 'كلاميات الفيزياء استاذ حسين محمد  2026', NULL, NULL, '780725', 4, 223, NULL, 14000, 14000, 100, 1, 0, 'كلاميات الفيزياء استاذ حسين محمد  2026 المنهج كامل', NULL, '<p>كلاميات الفيزياء استاذ حسين محمد  2026 المنهج كامل </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:17:59', '2025-08-26 20:17:59', NULL, NULL, NULL, NULL, NULL),
(78, 'حلول وزاريات المسائل للاستاذ حسين محمد 2026', NULL, NULL, '593488', 4, 224, NULL, 9000, 9000, 100, 1, 0, 'حلول وزاريات المسائل للاستاذ حسين محمد 2026  للمنهج كامل', NULL, '<p>حلول وزاريات المسائل للاستاذ حسين محمد 2026  للمنهج كامل </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:19:23', '2025-08-26 20:19:23', NULL, NULL, NULL, NULL, NULL),
(79, 'الفيزياء مؤيد سليم ج1 طبعة 2026', NULL, NULL, '160803', 4, 225, NULL, 14000, 14000, 100, 1, 0, 'الفيزياء مؤيد سليم الجزء الاول 3 فصول  طبعة 2026', NULL, '<p>الفيزياء مؤيد سليم الجزء الاول 3 فصول  طبعة 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 20:20:52', '2025-08-26 20:20:52', NULL, NULL, NULL, NULL, NULL),
(80, 'دفتر واجبات الفيزياء مؤيد سليم ج1  طبعة 2026', NULL, NULL, '633199', 4, 226, NULL, 11000, 11000, 100, 1, 0, 'دفتر واجبات الفيزياء مؤيد سليم الجزء الاول  طبعة 2026', NULL, '<p>دفتر واجبات الفيزياء مؤيد سليم الجزء الاول  طبعة 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 20:22:17', '2025-08-26 20:22:17', NULL, NULL, NULL, NULL, NULL),
(81, 'الفيزياء للاستاذ علي السوداني ج1 للصف السادس العلمي', NULL, NULL, '895774', 4, 227, NULL, 15000, 15000, 50, 1, 0, 'الفيزياء للاستاذ علي السوداني ج1 4 فصول  للصف السادس العلمي', NULL, '<p>الفيزياء للاستاذ علي السوداني ج1 4 فصول للصف السادس العلمي</p>', NULL, 1, 0, 0, 1, '2025-08-26 20:26:22', '2025-08-26 20:36:23', NULL, NULL, NULL, NULL, NULL),
(82, 'الفيزياء للاستاذ علي الذهبي ج1  للصف السادس العلمي', NULL, NULL, '544607', 4, 228, NULL, 13000, 13000, 50, 1, 0, 'الفيزياء للاستاذ علي الذهبي ج1  3 فصول للصف السادس العلمي', NULL, '<p> الفيزياء للاستاذ علي الذهبي ج1  للصف السادس العلمي </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:27:58', '2025-08-26 20:27:58', NULL, NULL, NULL, NULL, NULL),
(83, 'واجبات الفيزياء للاستاذ علي الذهبي ج1  للصف السادس العلمي', NULL, NULL, '636519', 4, 229, NULL, 13000, 13000, 50, 1, 0, 'واجبات الفيزياء للاستاذ علي الذهبي ج1  للصف السادس العلمي  3 فصول', NULL, '<p> واجبات الفيزياء للاستاذ علي الذهبي ج1  للصف السادس العلمي  3 فصول </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:31:50', '2025-08-26 20:31:50', NULL, NULL, NULL, NULL, NULL),
(84, 'الفيزياء استاذ منتظر الخفاجي ج1 للصف السادس العلمي', NULL, NULL, '733954', 4, 230, NULL, 13000, 13000, 50, 1, 0, 'الفيزياء استاذ منتظر الخفاجي ج1 للصف السادس العلمي', NULL, '<p>الفيزياء استاذ منتظر الخفاجي ج1 للصف السادس العلمي </p>', NULL, 1, 0, 0, 1, '2025-08-26 20:33:49', '2025-08-26 20:37:09', NULL, NULL, NULL, NULL, NULL),
(85, 'واجبات الفيزياء استاذ منتظر الخفاجي ج1 للصف السادس العلمي', NULL, NULL, '714650', 4, 231, NULL, 10000, 10000, 20, 1, 0, 'واجبات الفيزياء استاذ منتظر الخفاجي ج1 للصف السادس العلمي 3 فصول', NULL, '<p>واجبات الفيزياء استاذ منتظر الخفاجي ج1 للصف السادس العلمي 3 فصول </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:35:46', '2025-08-26 20:35:46', NULL, NULL, NULL, NULL, NULL),
(86, 'الفيزياء استاذ حسن عبد الكاظم الربيعي 2026 ج1', NULL, NULL, '330182', 4, 232, NULL, 10000, 10000, 100, 1, 0, 'الفيزياء استاذ حسن عبد الكاظم الربيعي 2026 ج1 3 فصول', NULL, '<p>الفيزياء استاذ حسن عبد الكاظم الربيعي 2026 ج1 3 فصول </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:39:02', '2025-08-26 20:39:02', NULL, NULL, NULL, NULL, NULL),
(87, 'واجبات الفيزياء استاذ حسن عبد الكاظم الربيعي 2026 ج1', NULL, NULL, '228851', 4, 233, NULL, 9000, 9000, 50, 1, 0, 'واجبات الفيزياء استاذ حسن عبد الكاظم الربيعي 2026 ج1 3 فصول', NULL, '<p>واجبات الفيزياء استاذ حسن عبد الكاظم الربيعي 2026 ج1 3 فصول </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:40:05', '2025-08-26 20:40:05', NULL, NULL, NULL, NULL, NULL),
(88, 'الفيزياء استاذ باقر القره غولي ج1 2026 للصف السادس العلمي', NULL, NULL, '819004', 4, 234, NULL, 12000, 12000, 10, 1, 0, 'الفيزياء استاذ باقر القره غولي ج1 2026 للصف السادس العلمي', NULL, '<p>الفيزياء استاذ باقر القره غولي ج1 2026 للصف السادس العلمي </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:41:45', '2025-08-26 20:41:45', NULL, NULL, NULL, NULL, NULL),
(89, 'الفيزياء استاذ عصام الشمري ج1 2026 للصف السادس العلمي', NULL, NULL, '549850', 4, 235, NULL, 14000, 14000, 10, 1, 0, 'الفيزياء استاذ عصام الشمري ج1 2026 للصف السادس العلمي 4 فصول', NULL, '<p>الفيزياء استاذ عصام الشمري ج1 2026 للصف السادس العلمي 4 فصول </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:43:07', '2025-08-26 20:43:07', NULL, NULL, NULL, NULL, NULL),
(90, 'ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ سجاد العبيدي الجزء الاول 2026', NULL, NULL, '679695', 4, 236, NULL, 11000, 11000, 100, 1, 0, 'ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ سجاد العبيدي الجزء الغاول 2026', NULL, '<p>ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ سجاد العبيدي الجزء الاول 2026</p>', NULL, 1, 0, 0, 1, '2025-08-26 20:44:25', '2025-08-26 20:52:04', NULL, NULL, NULL, NULL, NULL),
(91, 'الفيزياء استاذ همام التميمي ج1 2026 للصف السادس العلمي', NULL, NULL, '114630', 4, 237, NULL, 10000, 10000, 10, 1, 0, 'الفيزياء استاذ همام التميمي ج1 2026 للصف السادس العلمي فصلين', NULL, '<p>الفيزياء استاذ همام التميمي ج1 2026 للصف السادس العلمي فصلين </p>', NULL, 1, 1, 0, 1, '2025-08-26 20:45:18', '2025-08-26 20:45:18', NULL, NULL, NULL, NULL, NULL),
(92, 'ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ علاء السعداوي الجزء الاول 2026', NULL, NULL, '313765', 4, 238, NULL, 10000, 10000, 100, 1, 0, 'ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ علاء السعداوي الجزء الاول 2026', NULL, '<p>ملزمة اللغة الانكليزية للسادس الاعدادي للاستاذ علاء السعداوي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-26 20:46:35', '2025-08-26 20:46:35', NULL, NULL, NULL, NULL, NULL),
(93, 'ملزمة اللغة الانكليزية للسادس الاعدادي الجزء الاول للاستاذ احمد فوزي 2026', NULL, NULL, '214463', 4, 240, NULL, 11000, 11000, 100, 1, 0, 'ملزمة اللغة الانكليزية للسادس الاعدادي الجزء الاول للاستاذ احمد فوزي 2026', NULL, '<p>ملزمة اللغة الانكليزية للسادس الاعدادي الجزء الاول للاستاذ احمد فوزي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 09:49:19', '2025-08-27 09:49:19', NULL, NULL, NULL, NULL, NULL),
(94, 'واجبات اللغة الانكليزية للاستاذ احمد فوزي للسادس اعدادي 2026', NULL, NULL, '847505', 4, 241, NULL, 5000, 5000, 100, 1, 0, 'واجبات اللغة الانكليزية للاستاذ احمد فوزي للسادس اعدادي 2026', NULL, '<p>واجبات اللغة الانكليزية للاستاذ احمد فوزي للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 09:51:22', '2025-08-27 09:51:22', NULL, NULL, NULL, NULL, NULL),
(95, 'ملزمة اللغة الانكليزية للسادس اعدادي الجزء الاول للاستاذ ياسر الربيعي 2026', NULL, NULL, '704811', 4, 242, NULL, 11000, 11000, 100, 1, 0, 'ملزمة اللغة الانكليزية للسادس اعدادي الجزء الاول للاستاذ ياسر الربيعي 2026', NULL, '<p>ملزمة اللغة الانكليزية للسادس اعدادي الجزء الاول للاستاذ ياسر الربيعي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 09:54:15', '2025-08-27 09:54:15', NULL, NULL, NULL, NULL, NULL),
(96, 'ملزمة اللغة الانكليزية للاستاذ محمد حسين للسادس اعدادي الجزء الاول 2026', NULL, NULL, '591373', 4, 243, NULL, 14000, 14000, 100, 1, 0, 'ملزمة اللغة الانكليزية للاستاذ محمد حسين للسادس اعدادي الجزء الاول 2026', NULL, '<p><u><span>﻿</span>ملزمة اللغة الانكليزية للاستاذ محمد حسين للسادس اعدادي الجزء الاول 2026</u></p>', NULL, 1, 1, 0, 1, '2025-08-27 09:56:21', '2025-08-27 09:56:21', NULL, NULL, NULL, NULL, NULL),
(97, 'ملزمة اللغة الانكليزية للاستاذ هارون احمد للسادس اعدادي الجزء الاول 2026', NULL, NULL, '616342', 4, 244, NULL, 13000, 13000, 100, 1, 0, 'ملزمة اللغة الانكليزية للاستاذ هارون احمد للسادس اعدادي الجزء الاول 2026', NULL, '<p>ملزمة اللغة الانكليزية للاستاذ هارون احمد للسادس اعدادي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 09:58:28', '2025-08-27 09:58:28', NULL, NULL, NULL, NULL, NULL),
(98, 'ملزمة اللغة الانكليزية للاستاذ حسين السعيدي للسادس اعدادي الجزء الاول 2026', NULL, NULL, '476356', 4, 245, NULL, 11000, 11000, 100, 1, 0, 'ملزمة اللغة الانكليزية للاستاذ حسين السعيدي للسادس اعدادي الجزء الاول 2026', NULL, '<p>ملزمة اللغة الانكليزية للاستاذ حسين السعيدي للسادس اعدادي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 09:59:58', '2025-08-27 09:59:58', NULL, NULL, NULL, NULL, NULL),
(99, 'ملزمة اللغة الانكليزية للاستاذة ازل سلوان للسادس اعدادي الجزء الاول 2026', NULL, NULL, '224542', 4, 246, NULL, 10000, 10000, 100, 1, 0, 'ملزمة اللغة الانكليزية للاستاذة ازل سلوان للسادس اعدادي الجزء الاول 2026', NULL, '<p>ملزمة اللغة الانكليزية للاستاذة ازل سلوان للسادس اعدادي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 10:01:15', '2025-08-27 10:01:15', NULL, NULL, NULL, NULL, NULL),
(100, 'الكيمياء للاستاذ نور الدين عبد الرزاق ج1 2026 للصف السادس العلمي', NULL, NULL, '130196', 4, 247, NULL, 15000, 15000, 100, 1, 0, 'ملزمة الكيمياء للاستاذ نور الدين عبد الرزاق الجزء الاول 2026 ثلاث فصول', NULL, '<p>ملزمة الكيمياء للاستاذ نور الدين عبد الرزاق الجزء الاول 2026 ثلاث فصول </p>', NULL, 1, 1, 0, 1, '2025-08-27 11:03:41', '2025-08-27 11:03:41', NULL, NULL, NULL, NULL, NULL),
(101, 'الكيمياء للاستاذ منجد جبار ج1 للسادس العلمي2026', NULL, NULL, '106159', 4, 248, NULL, 14000, 14000, 100, 1, 0, 'ملزمة الاستاذ منجد جبار الجزء الاول ( ثلاث فصول ) للصف السادس العلمي 2026', NULL, '<p>ملزمة الاستاذ منجد جبار الجزء الاول ( ثلاث فصول ) للصف السادس العلمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:07:33', '2025-08-27 11:07:33', NULL, NULL, NULL, NULL, NULL),
(102, 'الكيمياء للاستاذ حسين حمزة ( الفصل الثاني ) للساس العلمي2026', NULL, NULL, '769125', 4, 249, NULL, 10, 10, 100, 1, 0, 'ملزمة الكيمياء للاستاذ حسين حمزة ( الفصل الثاني ) للصف السادس العلمي 2026', NULL, '<p>ملزمة الكيمياء للاستاذ حسين حمزة ( الفصل الثاني ) للصف السادس العلمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:13:55', '2025-08-27 11:13:55', NULL, NULL, NULL, NULL, NULL),
(103, 'الكيمياء للاستاذ حسين حمزة ( الفصل الاول ) للسادس العلمي 2026', NULL, NULL, '877406', 4, 250, NULL, 5000, 5000, 100, 1, 0, 'ملزمة الكيمياء للصف السادس العلمي للاستاذ حسين حمزة ( الفصل الاول ) 2026', NULL, '<p>ملزمة الكيمياء للصف السادس العلمي للاستاذ حسين حمزة ( الفصل الاول ) 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:16:37', '2025-08-27 11:16:37', NULL, NULL, NULL, NULL, NULL),
(104, 'الكيمياء للاستاذ حسين الهاشمي ( الفصل الثاني ) للسادس العلمي 2026', NULL, NULL, '117075', 4, 251, NULL, 6500, 6500, 100, 1, 0, 'ملزمة الكيمياء للاستاذ حسين قيس الهاشمي ( الفصل الثاني ) للصف السادس العلمي 2026', NULL, '<p>ملزمة الكيمياء للاستاذ حسين قيس الهاشمي ( الفصل الثاني ) للصف السادس العلمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:20:36', '2025-08-27 11:20:36', NULL, NULL, NULL, NULL, NULL),
(105, 'ملزمة اللغة العربية للسادس اعدادي الجزء الاول للاستاذ عقييل الزبيدي 2026', NULL, NULL, '881609', 4, 252, NULL, 13000, 13000, 150, 1, 0, 'ملزمة اللغة العربية للسادس اعدادي الجزء الاول للاستاذ عقييل الزبيدي 2026', NULL, '<p>ملزمة اللغة العربية للسادس اعدادي الجزء الاول للاستاذ عقييل الزبيدي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:21:49', '2025-08-27 11:21:49', NULL, NULL, NULL, NULL, NULL),
(106, 'الكيمياء للاستاذ حسين الهاشمي (الفصل الاول)للسادس العلمي 2026', NULL, NULL, '223299', 4, 253, NULL, 6500, 6500, 100, 1, 0, 'ملزمة الاستاذ حسين قيس الهاشمي ( الفصل الاول) للصف السادس العلمي 2026', NULL, '<p>ملزمة الاستاذ حسين قيس الهاشمي ( الفصل الاول) للصف السادس العلمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:23:24', '2025-08-27 11:23:24', NULL, NULL, NULL, NULL, NULL),
(107, 'ملزمة الادب للسادس الاعدادي للاستاذ عقيل الزبيدي 2026', NULL, NULL, '387760', 4, 254, NULL, 9000, 9000, 200, 1, 0, 'ملزمة الادب للسادس الاعدادي للاستاذ عقيل الزبيدي الواضح والمضمون 2026', NULL, '<p>ملزمة الادب للسادس الاعدادي للاستاذ عقيل الزبيدي الواضح والمضمون 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:26:01', '2025-08-27 11:26:01', NULL, NULL, NULL, NULL, NULL),
(108, 'كلاميات الاستاذ هاشم الغرباوي للسادس العلمي 2026', NULL, NULL, '278620', 4, 255, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الكلاميات للاستاذ هاشم الغرباوي منهج كامل للصف السادس العلمي 2026', NULL, '<p>ملزمة الكلاميات للاستاذ هاشم الغرباوي منهج كامل للصف السادس العلمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:27:12', '2025-08-27 11:27:12', NULL, NULL, NULL, NULL, NULL),
(109, 'ملزمة الالفية في وزاريات القواعد للاستاذ عقيل الزبيدي الجزء الاول 2026', NULL, NULL, '380417', 4, 256, NULL, 12000, 12000, 200, 1, 0, 'ملزمة الالفية في وزاريات القواعد للاستاذ عقيل الزبيدي الجزء الاول 2026', NULL, '<p>ملزمة الالفية في وزاريات القواعد للاستاذ عقيل الزبيدي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:27:18', '2025-08-27 11:27:18', NULL, NULL, NULL, NULL, NULL),
(110, 'واجبات الكيمياء للاستاذ هاشم الغرباوي للسادس العلمي 2026', NULL, NULL, '673705', 4, 257, NULL, 10, 10, 100, 1, 0, 'ملزمة الواجبات للاستاذ هاشم الغرباوي للصف السادس العلمي 2026 ( منهج كامل )', NULL, '<p>ملزمة الواجبات للاستاذ هاشم الغرباوي للصف السادس العلمي 2026 ( منهج كامل )</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:29:50', '2025-08-27 11:29:50', NULL, NULL, NULL, NULL, NULL),
(111, 'ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ هشام المعموري 2026', NULL, NULL, '432802', 4, 258, NULL, 12500, 12500, 150, 1, 0, 'ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ هشام المعموري 2026', NULL, '<p>ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ هشام المعموري 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:30:39', '2025-08-27 11:30:39', NULL, NULL, NULL, NULL, NULL),
(112, 'ملزمة الادب للسادس اعدادي للاستاذ هشام المعموري 2026', NULL, NULL, '539442', 4, 259, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الادب للسادس اعدادي للاستاذ هشام المعموري 2026', NULL, '<p>ملزمة الادب للسادس اعدادي للاستاذ هشام المعموري 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:32:05', '2025-08-27 11:32:05', NULL, NULL, NULL, NULL, NULL),
(113, 'المجلة الادبية للاستاذ خضر الضاهر للسادس اعدادي 2026', NULL, NULL, '332362', 4, 260, NULL, 10000, 10000, 100, 1, 0, 'المجلة الادبية للاستاذ خضر الضاهر للسادس اعدادي 2026', NULL, '<p>المجلة الادبية للاستاذ خضر الضاهر للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:33:23', '2025-08-27 11:33:23', NULL, NULL, NULL, NULL, NULL),
(114, 'الكيمياء للاستاذ هاشم الغرباوي ج1للسادس العلمي 2026', NULL, NULL, '325904', 4, 261, NULL, 14000, 14000, 100, 1, 0, 'ملزمة الكيمياء للاستاذ هاشم الغرباوي للصف السادس العلمي 2026 الجزء الاول يحتوي علي اربع افصل', NULL, '<p>ملزمة الكيمياء للاستاذ هاشم الغرباوي للصف السادس العلمي 2026 الجزء الاول يحتوي علي اربع افصل</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:34:38', '2025-08-27 11:34:38', NULL, NULL, NULL, NULL, NULL),
(115, 'الكيمياء للاستاذ يوسف الربيعي ج1 للسادس العلمي 2026', NULL, NULL, '876937', 4, 262, NULL, 13000, 13000, 100, 1, 0, 'ملزمة الكيمياء للاستاذ يوسف الربيعي للصف السادس العلمي 2026 الجزء الاول ( ثلاث افصل )', NULL, '<p>ملزمة الكيمياء للاستاذ يوسف الربيعي للصف السادس العلمي 2026 الجزء الاول ( ثلاث افصل )</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:37:10', '2025-08-27 11:37:10', NULL, NULL, NULL, NULL, NULL),
(116, 'ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ خضر الضاهر 2026', NULL, NULL, '887264', 4, 263, NULL, 13000, 13000, 100, 1, 0, 'ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ خضر الضاهر 2026', NULL, '<p>ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ خضر الضاهر 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:39:34', '2025-08-27 11:39:34', NULL, NULL, NULL, NULL, NULL),
(117, 'كلاميات الكيمياء للاستاذ مهند السوداني للسادس العلمي 2026', NULL, NULL, '270855', 4, 264, NULL, 6000, 6000, 100, 1, 0, 'ملزمة الكلاميات للاستاذ مهند السوداني 2026 للصف السادس العلمي ( منهج كامل )', NULL, '<p>ملزمة الكلاميات للاستاذ مهند السوداني 2026 للصف السادس العلمي ( منهج كامل )</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:40:55', '2025-08-27 11:40:55', NULL, NULL, NULL, NULL, NULL),
(118, 'ملزمة الادب للسادس اعدادي للاستاذ حمزة الجابري 2026', NULL, NULL, '901693', 4, 265, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الادب للسادس اعدادي للاستاذ حمزة الجابري 2026', NULL, '<p>ملزمة الادب للسادس اعدادي للاستاذ حمزة الجابري 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:41:52', '2025-08-27 11:41:52', NULL, NULL, NULL, NULL, NULL),
(119, 'ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ حمزة الجابري 2026', NULL, NULL, '309727', 4, 266, NULL, 13000, 13000, 100, 1, 0, 'ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ حمزة الجابري 2026', NULL, '<p>ملزمة القواعد للسادس اعدادي الجزء الاول للاستاذ حمزة الجابري 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:43:21', '2025-08-27 11:43:21', NULL, NULL, NULL, NULL, NULL),
(120, 'الكيمياء للاستاذ مهند السوداني ج1 للسادس العلمي 2026', NULL, NULL, '549439', 4, 267, NULL, 10, 10, 100, 1, 0, 'ملزمة الكيمياء للاستاذ مهند السوداني  الجزء الاول ( ثلاث افصل ) للصف السادس العلملي 2026', NULL, '<p>ملزمة الكيمياء للاستاذ مهند السوداني  الجزء الاول ( ثلاث افصل ) للصف السادس العلملي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:45:29', '2025-08-27 11:45:29', NULL, NULL, NULL, NULL, NULL),
(121, 'ملزمة القواعد للسادس اعدادي الجزء الاول للست رفل الزبيدي 2026', NULL, NULL, '478436', 4, 268, NULL, 12500, 12500, 100, 1, 0, 'ملزمة القواعد للسادس اعدادي الجزء الاول للست رفل الزبيدي 2026', NULL, '<p>ملزمة القواعد للسادس اعدادي الجزء الاول للست رفل الزبيدي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:45:42', '2025-08-27 11:45:42', NULL, NULL, NULL, NULL, NULL),
(122, 'ملزمة الادب للسادس اعدادي للست رفل الزبيدي 2026', NULL, NULL, '208802', 4, 269, NULL, 10000, 10000, 100, 1, 0, 'ملزمة الادب للسادس اعدادي للست رفل الزبيدي 2026', NULL, '<p>ملزمة الادب للسادس اعدادي للست رفل الزبيدي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:47:11', '2025-08-27 11:47:11', NULL, NULL, NULL, NULL, NULL),
(123, 'واجبات النفي خضر الضاهر سادس اعدادي 2026', NULL, NULL, '354333', 4, 270, NULL, 8000, 8000, 100, 1, 0, 'واجبات النفي خضر الضاهر سادس اعدادي 2026', NULL, '<p>واجبات النفي خضر الضاهر سادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:49:53', '2025-08-27 11:49:53', NULL, NULL, NULL, NULL, NULL),
(124, 'واجبات الاستفهام خضر الضاهر سادس اعدادي 2026', NULL, NULL, '238427', 4, 271, NULL, 8000, 8000, 100, 1, 0, 'واجبات الاستفهام خضر الضاهر سادس اعدادي 2026', NULL, '<p><br></p>\n\n<p><br></p>', NULL, 1, 1, 0, 1, '2025-08-27 11:51:07', '2025-08-27 11:51:07', NULL, NULL, NULL, NULL, NULL),
(125, 'واجبات القواعد الجزء الاول للست رفل الزبيدي للسادس اعدادي 2026', NULL, NULL, '940030', 4, 272, NULL, 10000, 10000, 50, 1, 0, 'واجبات القواعد الجزء الاول للست رفل الزبيدي للسادس اعدادي 2026', NULL, '<p>واجبات القواعد الجزء الاول للست رفل الزبيدي للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:52:21', '2025-08-27 11:52:21', NULL, NULL, NULL, NULL, NULL),
(126, 'الاحياء للاستاذ مصطفى الحافظ ج1 للسادس العلمي 2026', NULL, NULL, '745880', 4, 273, NULL, 13000, 13000, 100, 1, 0, 'ملزمة لاحياء للاستاذ مصطفى الحافظ الجزء الاول للسادس العلمي 2026 تحتوي على فصلين', NULL, '<p>ملزمة لاحياء للاستاذ مصطفى الحافظ الجزء الاول للسادس العلمي 2026 تحتوي على فصلين ( الخلية + الانسجة )</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:52:52', '2025-08-27 11:52:52', NULL, NULL, NULL, NULL, NULL),
(127, 'ملزمة القواعد الجزء الاول للاستاذ محمود سهيل العبيدي للسادس اعدادي 2026', NULL, NULL, '815665', 4, 274, NULL, 13000, 13000, 100, 1, 0, 'ملزمة القواعد الجزء الاول للاستاذ محمود سهيل العبيدي للسادس اعدادي 2026', NULL, '<p>ملزمة القواعد الجزء الاول للاستاذ محمود سهيل العبيدي للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:53:42', '2025-08-27 11:53:42', NULL, NULL, NULL, NULL, NULL),
(128, 'ملزمة القواعد الجزء الاول للسادس اعدادي للاستاذ عمار السلامي 2026', NULL, NULL, '462244', 4, 275, NULL, 11000, 11000, 100, 1, 0, 'ملزمة القواعد الجزء الاول للسادس اعدادي للاستاذ عمار السلامي 2026', NULL, '<p>ملزمة القواعد الجزء الاول للسادس اعدادي للاستاذ عمار السلامي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:55:01', '2025-08-27 11:55:01', NULL, NULL, NULL, NULL, NULL),
(129, 'ملزمة الادب للاستاذ محمود سهيل العبيدي سادس اعدادي 2026', NULL, NULL, '767996', 4, 276, NULL, 13000, 13000, 100, 1, 0, 'ملزمة الادب للاستاذ محمود سهيل العبيدي سادس اعدادي 2026', NULL, '<p>ملزمة الادب للاستاذ محمود سهيل العبيدي سادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:56:09', '2025-08-27 11:56:09', NULL, NULL, NULL, NULL, NULL),
(130, 'الاحياء للاستاذ يالم ال منصور ج1 للسادس العلمي 2026', NULL, NULL, '395657', 4, 277, NULL, 12000, 12000, 100, 1, 0, 'ملزمة الاستاذ سالم ال منصور لمادة الاحياء للصف السادس العلمي 2026 الجزء الاول ( فصل اول + فصل ثاني )', NULL, '<p>ملزمة الاستاذ سالم ال منصور لمادة الاحياء للصف السادس العلمي 2026 الجزء الاول ( فصل اول + فصل ثاني )</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:57:07', '2025-08-27 11:57:07', NULL, NULL, NULL, NULL, NULL),
(131, 'ملزمة القواعد للاستاذ علاء الرماحي الجزء الاول سادس اعدادي 2026', NULL, NULL, '763050', 4, 278, NULL, 11000, 11000, 100, 1, 0, 'ملزمة القواعد للاستاذ علاء الرماحي الجزء الاول سادس اعدادي 2026', NULL, '<p>ملزمة القواعد للاستاذ علاء الرماحي الجزء الاول سادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 11:58:50', '2025-08-27 11:58:50', NULL, NULL, NULL, NULL, NULL),
(132, 'الاحياء للاستاذ احمد الجاف للسادس العلمي 2026 منهج كامل', NULL, NULL, '636004', 4, 279, NULL, 14000, 14000, 100, 1, 0, 'ملزمة الاحياء للاستاذ احمد الجاف للصف السادس العلمي 2026 منهج كامل ( خمس افصل )', NULL, '<p>ملزمة الاحياء للاستاذ احمد الجاف للصف السادس العلمي 2026 منهج كامل ( خمس افصل ) </p>', NULL, 1, 1, 0, 1, '2025-08-27 11:59:32', '2025-08-27 11:59:32', NULL, NULL, NULL, NULL, NULL),
(133, 'ملزمة القواعد للاستاذ احمد النعيمي الجزء الاول للسادس اعدادي 2026', NULL, NULL, '429545', 4, 280, NULL, 12500, 12500, 100, 1, 0, 'ملزمة القواعد للاستاذ احمد النعيمي الجزء الاول للسادس اعدادي 2026', NULL, '<p>ملزمة القواعد للاستاذ احمد النعيمي الجزء الاول للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:01:02', '2025-08-27 12:01:02', NULL, NULL, NULL, NULL, NULL),
(134, 'ملزمة شمس الادب للست شمس للسادس اعدادي مع دفتر واجبات مجاني 2026', NULL, NULL, '536922', 4, 281, NULL, 13000, 13000, 100, 1, 0, 'ملزمة شمس الادب للست شمس للسادس اعدادي مع دفتر واجبات مجاني 2026', NULL, '<p>ملزمة شمس الادب للست شمس للسادس اعدادي مع دفتر واجبات مجاني 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:02:48', '2025-08-27 12:02:48', NULL, NULL, NULL, NULL, NULL),
(135, 'ملزمة القواعد للاستاذ احمد كاظم الجبوري الجزء الاول للسادس اعدادي 2026', NULL, NULL, '764701', 4, 283, NULL, 12000, 12000, 100, 1, 0, 'ملزمة القواعد للاستاذ احمد كاظم الجبوري الجزء الاول للسادس اعدادي 2026', NULL, '<p>ملزمة القواعد للاستاذ احمد كاظم الجبوري الجزء الاول للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:04:00', '2025-08-27 12:04:00', NULL, NULL, NULL, NULL, NULL),
(136, 'ملزمة الادب للاستاذ حسين عبيدة  للسادس اعدادي 2026', NULL, NULL, '760485', 4, 284, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الادب للاستاذ حسين عبيدة  للسادس اعدادي 2026', NULL, '<p>ملزمة الادب للاستاذ حسين عبيدة  للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:05:31', '2025-08-27 12:05:31', NULL, NULL, NULL, NULL, NULL),
(137, 'ملزمة القواعد  اسلوب الاستفهام للاستاذ حسين عبيدة سادس اعدادي 2026', NULL, NULL, '434840', 4, 285, NULL, 8000, 8000, 100, 1, 0, 'ملزمة القواعد  اسلوب الاستفهام للاستاذ حسين عبيدة سادس اعدادي 2026', NULL, '<p>ملزمة القواعد  اسلوب الاستفهام للاستاذ حسين عبيدة سادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:06:43', '2025-08-27 12:06:43', NULL, NULL, NULL, NULL, NULL),
(138, 'الاحياء للاستاذ جعفر الحسني ج1 للسادس العلمي 2026', NULL, NULL, '458287', 4, 286, NULL, 12000, 12000, 100, 1, 0, 'ملزمة الاحياء للاستاذ جعفر الحسني الجزء الاول  للصف السادس العلمي 2026 تحتوي على فصلين ( الخلية + الانسجة )', NULL, '<p>ملزمة الاحياء للاستاذ جعفر الحسني الجزء الاول  للصف السادس العلمي 2026 تحتوي على فصلين ( الخلية + الانسجة )</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:06:57', '2025-08-27 12:06:57', NULL, NULL, NULL, NULL, NULL),
(139, 'ملزمة الادب للست سمر علي احمد للسادس اعدادي  2026', NULL, NULL, '997359', 4, 287, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الادب للست سمر علي احمد للسادس اعدادي  2026', NULL, '<p>ملزمة الادب للست سمر علي احمد للسادس اعدادي  2026 </p>', NULL, 1, 1, 0, 1, '2025-08-27 12:08:04', '2025-08-27 12:08:04', NULL, NULL, NULL, NULL, NULL),
(140, 'ملزمة الادب للست سمر علي احمد للسادس اعدادي  2026', NULL, NULL, '460892', 4, 288, NULL, 10000, 10000, 50, 1, 0, 'ملزمة الادب للست سمر علي احمد للسادس اعدادي  2026', NULL, '<p>ملزمة الادب للست سمر علي احمد للسادس اعدادي  2026 </p>', NULL, 1, 1, 0, 1, '2025-08-27 12:09:16', '2025-08-27 12:09:16', NULL, NULL, NULL, NULL, NULL),
(141, 'واجبات الاستاذ جعفر الحسني ج1 للسادس العلمي 2026', NULL, NULL, '568675', 4, 289, NULL, 10, 10, 100, 1, 0, 'ملزمة الواجبات للاستاذ جعفر الحسني للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة )', NULL, '<p>ملزمة الواجبات للاستاذ جعفر الحسني للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة ) </p>', NULL, 1, 1, 0, 1, '2025-08-27 12:09:46', '2025-08-27 12:09:46', NULL, NULL, NULL, NULL, NULL),
(142, 'ملزمة الادب للاستاذ احمد النعيمي سادس اعدادي 2026', NULL, NULL, '718324', 4, 290, NULL, 10000, 10000, 50, 1, 0, 'ملزمة الادب للاستاذ احمد النعيمي سادس اعدادي 2026', NULL, '<p>ملزمة الادب للاستاذ احمد النعيمي سادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:12:52', '2025-08-27 12:12:52', NULL, NULL, NULL, NULL, NULL),
(143, 'الاحياء للدكتور ابو الفضل الساعدي ج1 2026 للسادس العلمي', NULL, NULL, '874762', 4, 291, NULL, 12000, 12000, 100, 1, 0, 'ملزمة الاحياء للدكتور ابو الفضل الساعدي للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة )', NULL, '<p>ملزمة الاحياء للدكتور ابو الفضل الساعدي للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة )</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:14:10', '2025-08-27 12:14:10', NULL, NULL, NULL, NULL, NULL),
(144, 'اساسيات القواعد  للسادس اعدادي للاستاذ احمد النعيمي 2026', NULL, NULL, '394114', 4, 292, NULL, 4000, 4000, 20, 1, 0, 'اساسيات القواعد  للسادس اعدادي للاستاذ احمد النعيمي 2026', NULL, '<p>اساسيات القواعد  للسادس اعدادي للاستاذ احمد النعيمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:15:32', '2025-08-27 12:15:32', NULL, NULL, NULL, NULL, NULL),
(145, 'الاحياء للدكتور محمد العنزي ج1 للسادس العلمي 2026', NULL, NULL, '606935', 4, 293, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الاحياء للدكتور محمد العنزي للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة )', NULL, '<p>ملزمة الاحياء للدكتور محمد العنزي للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة ) </p>', NULL, 1, 1, 0, 1, '2025-08-27 12:17:55', '2025-08-27 12:17:55', NULL, NULL, NULL, NULL, NULL),
(146, 'ملزمة الرياضيات للاستاذ يحيى العبيدي الجزء الاول للسادس اعدادي 2026', NULL, NULL, '372753', 4, 294, NULL, 12000, 12000, 100, 1, 0, 'ملزمة الرياضيات للاستاذ يحيى العبيدي الجزء الاول للسادس اعدادي 2026', NULL, '<p>ملزمة الرياضيات للاستاذ يحيى العبيدي الجزء الاول للسادس اعدادي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:20:35', '2025-08-27 12:20:35', NULL, NULL, NULL, NULL, NULL),
(147, 'ملزمة الرياضيات للسادس علمي الجزء الاول للاستاذ عباس الدراجي 2026', NULL, NULL, '162019', 4, 295, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الرياضيات للسادس علمي الجزء الاول للاستاذ عباس الدراجي 2026', NULL, '<p>ملزمة الرياضيات للسادس علمي الجزء الاول للاستاذ عباس الدراجي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:22:18', '2025-08-27 12:22:18', NULL, NULL, NULL, NULL, NULL),
(148, 'مجلة الابداع للاستاذ نورس الموسوي ج1 للسادس العلمي 2026', NULL, NULL, '322196', 4, 296, NULL, 10, 10, 100, 1, 0, 'مجلة الابداع للاستاذ نورس الموسوي 2026 تحتوي على اسئلة وزارية + شرح لكل موضوع + رسومات + ملخصات + ملاحظات', NULL, '<p>مجلة الابداع للاستاذ نورس الموسوي 2026 تحتوي على اسئلة وزارية + شرح لكل موضوع + رسومات + ملخصات + ملاحظات</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:22:32', '2025-08-27 12:22:32', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` (`id`, `name`, `name_ar`, `slug`, `code`, `shop_id`, `media_id`, `brand_id`, `price`, `buy_price`, `quantity`, `min_order_quantity`, `discount_price`, `short_description`, `short_description_ar`, `description`, `description_ar`, `is_active`, `is_new`, `is_featured`, `is_approve`, `created_at`, `updated_at`, `unit_id`, `meta_title`, `meta_description`, `meta_keywords`, `video_id`) VALUES
(149, 'ملزمة الرياضيات للسادس اعدادي المتميزين الجزء الاول 2026', NULL, NULL, '501910', 4, 297, NULL, 10000, 10000, 50, 1, 0, 'ملزمة الرياضيات للسادس اعدادي المتميزين الجزء الاول 2026', NULL, '<p>ملزمة الرياضيات للسادس اعدادي المتميزين الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:23:53', '2025-08-27 12:23:53', NULL, NULL, NULL, NULL, NULL),
(150, 'ملزمة الرياضيات للسادس علمي الجزء الاول للاستاذ محمد قاسم 2026', NULL, NULL, '113131', 4, 298, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الرياضيات للسادس علمي الجزء الاول للاستاذ محمد قاسم 2026', NULL, '<p>ملزمة الرياضيات للسادس علمي الجزء الاول للاستاذ محمد قاسم 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:25:06', '2025-08-27 12:25:06', NULL, NULL, NULL, NULL, NULL),
(151, 'ملزمة الرياضيات للاستاذ حيدر عبد الائمة للسادس علمي الجزء الاول 2026', NULL, NULL, '798030', 4, 299, NULL, 7000, 7000, 100, 1, 0, 'ملزمة الرياضيات للاستاذ حيدر عبد الائمة للسادس علمي الجزء الاول 2026', NULL, '<p>ملزمة الرياضيات للاستاذ حيدر عبد الائمة للسادس علمي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:26:25', '2025-08-27 12:26:25', NULL, NULL, NULL, NULL, NULL),
(152, 'ملزمة الرياضيات للاستاذ مؤمل مهدي الجزء الاول سادس علمي 2026', NULL, NULL, '973153', 4, 300, NULL, 13000, 13000, 100, 1, 0, 'ملزمة الرياضيات للاستاذ مؤمل مهدي الجزء الاول سادس علمي 2026', NULL, '<p>ملزمة الرياضيات للاستاذ مؤمل مهدي الجزء الاول سادس علمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:27:34', '2025-08-27 12:27:34', NULL, NULL, NULL, NULL, NULL),
(153, 'ملزمة الرياضيات للاستاذ باسل الزبيدي للسادس الادبي منهج كامل 2026', NULL, NULL, '691181', 4, 301, NULL, 10000, 10000, 50, 1, 0, 'ملزمة الرياضيات للاستاذ باسل الزبيدي للسادس الادبي منهج كامل 2026', NULL, '<p>ملزمة الرياضيات للاستاذ باسل الزبيدي للسادس الادبي منهج كامل 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:28:55', '2025-08-27 12:28:55', NULL, NULL, NULL, NULL, NULL),
(154, 'مجلة الابداع للاستاذ نورس الموسوي ج2 للسادس العلمي 2026', NULL, NULL, '177692', 4, 302, NULL, 9000, 9000, 100, 1, 0, 'مجلة الابداع للاستاذ نورس الموسوي للصف السادس العلمي 2026 الجزء الثاني ( التكاثر + التكوين الجنيني )', NULL, '<p>مجلة الابداع للاستاذ نورس الموسوي للصف السادس العلمي 2026 الجزء الثاني ( التكاثر + التكوين الجنيني )</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:29:21', '2025-08-27 12:29:21', NULL, NULL, NULL, NULL, NULL),
(155, 'ملزمة الرياضيات للسادس ادبي للاستاذ علي صادق منهج كامل 2026', NULL, NULL, '451302', 4, 303, NULL, 10000, 10000, 100, 1, 0, 'ملزمة الرياضيات للسادس ادبي للاستاذ علي صادق منهج كامل 2026', NULL, '<p>ملزمة الرياضيات للسادس ادبي للاستاذ علي صادق منهج كامل 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:30:48', '2025-08-27 12:30:48', NULL, NULL, NULL, NULL, NULL),
(156, 'واجبات الاستاذ نورس الموسوي ج1 للسادس العلمي 2026', NULL, NULL, '887807', 4, 304, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الواجبات + الرسومات للاستاذ نورس الموسوي للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة )', NULL, '<p>ملزمة الواجبات + الرسومات للاستاذ نورس الموسوي للصف السادس العلمي 2026 الجزء الاول ( الخلية + الانسجة ) </p>', NULL, 1, 1, 0, 1, '2025-08-27 12:37:01', '2025-08-27 12:37:01', NULL, NULL, NULL, NULL, NULL),
(157, 'واجبات الرياضيات حبدر وليدي سادس علمي 2026', NULL, NULL, '728950', 4, 305, NULL, 6000, 6000, 100, 1, 0, 'واجبات الرياضيات حبدر وليدي سادس علمي 2026', NULL, '<p>واجبات الرياضيات حبدر وليدي سادس علمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:38:12', '2025-08-27 12:38:12', NULL, NULL, NULL, NULL, NULL),
(158, 'ملزمة الرياضيات الجزء الاول حيدر وليد سادس علمي 2026', NULL, NULL, '432187', 4, 306, NULL, 13000, 13000, 200, 1, 0, 'ملزمة الرياضيات الجزء الاول حيدر وليد سادس علمي 2026', NULL, '<p>ملزمة الرياضيات الجزء الاول حيدر وليد سادس علمي 2026 </p>', NULL, 1, 1, 0, 1, '2025-08-27 12:39:23', '2025-08-27 12:39:23', NULL, NULL, NULL, NULL, NULL),
(159, 'وزاريات الرياضيات للاستاذ حيدر وليد سادس علمي 2026', NULL, NULL, '390677', 4, 307, NULL, 13000, 13000, 200, 1, 0, 'وزاريات الرياضيات للاستاذ حيدر وليد سادس علمي 2026', NULL, '<p>وزاريات الرياضيات للاستاذ حيدر وليد سادس علمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 12:41:04', '2025-08-27 12:41:04', NULL, NULL, NULL, NULL, NULL),
(160, 'مساحة ماركة deli', NULL, NULL, '972876', 4, 309, NULL, 500, 200, 2000, 1, 0, 'مساحة ماركة deli', NULL, '<p>مساحة ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:04:45', '2025-08-27 15:04:45', NULL, NULL, NULL, NULL, NULL),
(161, 'اجتماعيات الاستاذة ايمان الصالحي للصف الثالث 2026', NULL, NULL, '109245', 4, 310, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاجتماعيات للاستاذة ايمان الصالحي للصف الثالث المتوسط 2026', NULL, '<p>ملزمة الاجتماعيات للاستاذة ايمان الصالحي للصف الثالث المتوسط 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:08:17', '2025-08-27 15:08:17', NULL, NULL, NULL, NULL, NULL),
(162, 'مساحة قوس قزح ماركة Amigo', NULL, NULL, '985418', 4, 311, NULL, 250, 200, 50, 1, 0, 'مساحة قوس قزح ماركة Amigo', NULL, '<p>مساحة قوس قزح ماركة Amigo</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:11:12', '2025-08-27 15:11:12', NULL, NULL, NULL, NULL, NULL),
(163, 'اجتماعيات  الاستاذة هبة الشمري للصف الثالث 2026', NULL, NULL, '616796', 4, 312, NULL, 9000, 9000, 100, 1, 0, 'ملزمة الاجتماعيات للاستاذة هبة الشمري للصف الثالث المتوسط 2026', NULL, '<p>ملزمة الاجتماعيات للاستاذة هبة الشمري للصف الثالث المتوسط 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:13:02', '2025-08-27 15:13:02', NULL, NULL, NULL, NULL, NULL),
(164, 'مساحة ماركة deli', NULL, NULL, '211268', 4, 313, NULL, 250, 200, 200, 1, 0, 'مساحة ماركة deli', NULL, '<p>مساحة ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:13:39', '2025-08-27 15:13:39', NULL, NULL, NULL, NULL, NULL),
(165, 'مساحة ماركة deli', NULL, NULL, '619449', 4, 314, NULL, 250, 200, 200, 1, 0, 'مساحة ماركة deli', NULL, '<p>مساحة ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:17:05', '2025-08-27 15:17:05', NULL, NULL, NULL, NULL, NULL),
(166, 'مساحة ماركة deli', NULL, NULL, '105811', 4, 315, NULL, 500, 200, 200, 1, 0, 'مساحة ماركة deli', NULL, '<p>مساحة ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:19:45', '2025-08-27 15:19:45', NULL, NULL, NULL, NULL, NULL),
(167, 'مساحة ماركة deli', NULL, NULL, '651013', 4, 316, NULL, 500, 200, 300, 1, 0, 'مساحة ماركة deli', NULL, '<p>مساحة ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:22:43', '2025-08-27 15:22:43', NULL, NULL, NULL, NULL, NULL),
(168, 'مساحة  سوداء ماركة deli', NULL, NULL, '809829', 4, 317, NULL, 250, 200, 1000, 1, 0, 'مساحة  سوداء ماركة deli', NULL, '<p>مساحة  سوداء ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:25:07', '2025-08-27 15:25:07', NULL, NULL, NULL, NULL, NULL),
(169, 'اجتماعيات الاستاذ خليل الخفاجي للثالث متوسط 2026', NULL, NULL, '853281', 4, 318, NULL, 10, 10, 100, 1, 0, 'ملزمة الاجتماعيات للاستاذ خليل الخفاجي للصف الثالث المتوسط 2026', NULL, '<p>ملزمة الاجتماعيات للاستاذ خليل الخفاجي للصف الثالث المتوسط 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:25:26', '2025-08-27 15:25:26', NULL, NULL, NULL, NULL, NULL),
(170, 'مساحة  ماركة deli', NULL, NULL, '417206', 4, 319, NULL, 250, 200, 300, 1, 0, 'مساحة ماركة deli', NULL, '<p>مساحة  ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:28:04', '2025-08-27 15:28:04', NULL, NULL, NULL, NULL, NULL),
(171, 'اجتماعيات الاستاذ حسين عبد الحسين اللامي للصف الثالث 2026', NULL, NULL, '643604', 4, 320, NULL, 7000, 7000, 100, 1, 0, 'ملزمة الاجتماعيات للصف الثالث المتوسط للاستاذ حسين عبد الحسين اللامي 2026', NULL, '<p>ملزمة الاجتماعيات للصف الثالث المتوسط للاستاذ حسين عبد الحسين اللامي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:29:41', '2025-08-27 15:29:41', NULL, NULL, NULL, NULL, NULL),
(172, 'مساحة ماركة deli', NULL, NULL, '784234', 4, 321, NULL, 250, 200, 200, 1, 0, 'مساحة ماركة deli', NULL, '<p>مساحة ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:31:04', '2025-08-27 15:31:04', NULL, NULL, NULL, NULL, NULL),
(173, 'الرياضيات للاستاذ حيدر وليد ج1 للثالث متوسط 2026', NULL, NULL, '433765', 4, 322, NULL, 10, 10, 100, 1, 0, 'ملزمة الرياضيات للاستاذ حيدر وليد للصف الثالث المتوسط  الجزء الاول (ثلاث فصول ) 2026', NULL, '<p>ملزمة الرياضيات للاستاذ حيدر وليد للصف الثالث المتوسط  الجزء الاول (ثلاث فصول ) 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:34:39', '2025-08-27 15:34:39', NULL, NULL, NULL, NULL, NULL),
(174, 'مساحة ماركة deli', NULL, NULL, '284798', 4, 323, NULL, 250, 200, 200, 1, 0, 'مساحة فواكه ماركة deli', NULL, '<p>مساحة فواكه ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:34:53', '2025-08-27 15:34:53', NULL, NULL, NULL, NULL, NULL),
(175, 'مساحة ماركة deli', NULL, NULL, '481199', 4, 324, NULL, 500, 300, 1000, 1, 0, 'مساحة كيس 3 قطع ماركة deli', NULL, '<p>مساحة كيس 3 قطع ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:38:30', '2025-08-27 15:38:30', NULL, NULL, NULL, NULL, NULL),
(176, 'رياضيات الاستاذ عباس الدراجي ج1 للثالث المتوسط 2026', NULL, NULL, '329778', 4, 325, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الاستاذ عباس الدراجي للصف الثالث المتوسط 2026 الجزء الاول', NULL, '<p>ملزمة الاستاذ عباس الدراجي للصف الثالث المتوسط 2026 الجزء الاول </p>', NULL, 1, 1, 0, 1, '2025-08-27 15:41:40', '2025-08-27 15:41:40', NULL, NULL, NULL, NULL, NULL),
(177, 'مقطة معدنية ماركة deli', NULL, NULL, '121846', 4, 326, NULL, 750, 500, 200, 1, 0, 'مقطة معدنية ماركة deli', NULL, '<p>مقطة معدنية ماركة deli</p>', NULL, 1, 0, 0, 1, '2025-08-27 15:42:25', '2025-08-27 15:53:18', NULL, NULL, NULL, NULL, NULL),
(178, 'الفيزياء للاستاذ دانيار الجاف للثالث المتوسط 2026', NULL, NULL, '854008', 4, 327, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاستاذ دانيار الجاف لمادة الفيزياء للصف الثالث المتوسط ( منهج كامل ) 2026', NULL, '<p>ملزمة الاستاذ دانيار الجاف لمادة الفيزياء للصف الثالث المتوسط ( منهج كامل ) 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:47:05', '2025-08-27 15:47:05', NULL, NULL, NULL, NULL, NULL),
(179, 'مقطة معدنية كارت  ماركة deli', NULL, NULL, '183333', 4, 328, NULL, 1000, 800, 100, 1, 0, 'مقطة معدنية كارت  ماركة deli', NULL, '<p>مقطة حديد كارت  ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:50:10', '2025-08-27 15:50:10', NULL, NULL, NULL, NULL, NULL),
(180, 'فيزياء الاستاذ مؤيد سليم للثالث المتوسط 2026', NULL, NULL, '308195', 4, 329, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاستاذ مؤيد سليم لمادة الفيزياء للصف الثالث المتوسط 2026 ( منهج كامل )', NULL, '<p>ملزمة الاستاذ مؤيد سليم لمادة الفيزياء للصف الثالث المتوسط 2026 ( منهج كامل )</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:50:55', '2025-08-27 15:50:55', NULL, NULL, NULL, NULL, NULL),
(181, 'الكيمياء للاستاذ دانيار الجاف للثالث المتوسط 2026', NULL, NULL, '839133', 4, 330, NULL, 10, 10, 100, 1, 0, 'ملزمة الكيمياء للصف الثالث المتوسط للاستاذ دانيار الجاف 2026', NULL, '<p>ملزمة الكيمياء للصف الثالث المتوسط للاستاذ دانيار الجاف 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:53:04', '2025-08-27 15:53:04', NULL, NULL, NULL, NULL, NULL),
(182, 'الكيمياء للاستاذ سجاد البخاتي للثالث المتوسط 2026', NULL, NULL, '892695', 4, 331, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاستاذ سجاد البخاتي لمادة الكيمياء للصف الثالث المتوسط ( منهج كامل ) 2026', NULL, '<p>ملزمة الاستاذ سجاد البخاتي لمادة الكيمياء للصف الثالث المتوسط ( منهج كامل ) 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:56:57', '2025-08-27 15:56:57', NULL, NULL, NULL, NULL, NULL),
(183, 'مقطة ماركة   deli', NULL, NULL, '384292', 4, 332, NULL, 1000, 800, 100, 1, 0, 'مقطة مع ثكاله ورق ماركة deli', NULL, '<p>مقطة مع ثكاله ورق ماركة deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 15:59:01', '2025-08-27 15:59:01', NULL, NULL, NULL, NULL, NULL),
(184, 'الانكليزي للاستاذ حسين احمد طعين للثالث المتوسط 2026', NULL, NULL, '270538', 4, 333, NULL, 8000, 8000, 100, 1, 0, 'ملزمة اللغة الانكليزية للاستاذ حسين احمد طعين 2026 للصف الثالث المتوسط', NULL, '<p>ملزمة اللغة الانكليزية للاستاذ حسين احمد طعين 2026 للصف الثالث المتوسط </p>', NULL, 1, 1, 0, 1, '2025-08-27 16:00:24', '2025-08-27 16:00:24', NULL, NULL, NULL, NULL, NULL),
(185, 'مقطة ماركة  deli', NULL, NULL, '306240', 4, 334, NULL, 500, 300, 100, 1, 0, 'مقطة ماركة deli', NULL, '<p> مقطة ماركة  deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:02:50', '2025-08-27 16:02:50', NULL, NULL, NULL, NULL, NULL),
(186, 'اللغة العربية للاستاذة سمر علي ج1 للثالث المتوسط 2026', NULL, NULL, '692268', 4, 335, NULL, 11000, 11000, 100, 1, 0, 'ملزمة اللغة العربية للاستاذة سمر علي الجزء الاول 2026', NULL, '<p>ملزمة اللغة العربية للاستاذة سمر علي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:03:15', '2025-08-27 16:03:15', NULL, NULL, NULL, NULL, NULL),
(187, 'مقطة ماركة  deli', NULL, NULL, '380492', 4, 336, NULL, 750, 500, 200, 1, 0, 'مقطة  موس مزدوج ماركة  deli', NULL, '<p> مقطة  موس مزدوج  ماركة  deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:05:36', '2025-08-27 16:05:36', NULL, NULL, NULL, NULL, NULL),
(188, 'مقطة ماركة  deli', NULL, NULL, '770141', 4, 337, NULL, 750, 500, 200, 1, 0, 'مقطة ماركة  deli', NULL, '<p>مقطة ماركة  deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:08:18', '2025-08-27 16:08:18', NULL, NULL, NULL, NULL, NULL),
(189, 'اللغة العربية للاستاذ مازن الهلالي ج1 للثالث المتوسط 2026', NULL, NULL, '338214', 4, 338, NULL, 9000, 9000, 100, 1, 0, 'ملزمة اللغة العربية للصف الثالث المتوسط للاستاذ مازن الهلالي الجزء الاول 2026', NULL, '<p>ملزمة اللغة العربية للصف الثالث المتوسط للاستاذ مازن الهلالي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:09:42', '2025-08-27 16:09:42', NULL, NULL, NULL, NULL, NULL),
(190, 'مقطة ماركة  deli', NULL, NULL, '793698', 4, 340, NULL, 750, 500, 200, 1, 0, 'مقطة موس مزودج ماركة  deli', NULL, '<p>مقطة موس مزودج ماركة  deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:12:45', '2025-08-27 16:12:45', NULL, NULL, NULL, NULL, NULL),
(191, 'اللغة العربية للاستاذ هشام المعموري ج1 للثالث المتوسط 2026', NULL, NULL, '994971', 4, 341, NULL, 8000, 8000, 100, 1, 0, 'ملزمة اللغة العربية للاستاذ هشام المعموري الجزء الاول للصف الثالث المتوسط 2026', NULL, '<p><strong>ملزمة اللغة العربية للاستاذ هشام المعموري الجزء الاول للصف الثالث المتوسط 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 16:13:03', '2025-08-27 16:13:03', NULL, NULL, NULL, NULL, NULL),
(192, 'ملزمة الكيمياء للثاني متوسط للاستاذ حسين حمزة 2026', NULL, NULL, '199386', 4, 342, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الكيمياء للثاني متوسط للاستاذ حسين حمزة 2026', NULL, '<p>ملزمة الكيمياء للثاني متوسط للاستاذ حسين حمزة 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:15:01', '2025-08-27 16:15:01', NULL, NULL, NULL, NULL, NULL),
(193, 'مقطة ماركة  deli', NULL, NULL, '480451', 4, 343, NULL, 250, 200, 200, 1, 0, 'مقطة ماركة  deli', NULL, '<p>مقطة ماركة  deli</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:15:17', '2025-08-27 16:15:17', NULL, NULL, NULL, NULL, NULL),
(194, 'الاحياء للاستاذ قاسم منتصر 2026 للثالث المتوسط', NULL, NULL, '892069', 4, 344, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاحياء للصف الثالث المتوسط للاستاذ قاسم منتصر ( منهج كامل ) 2026', NULL, '<p><strong>ملزمة الاحياء للصف الثالث المتوسط للاستاذ قاسم منتصر ( منهج كامل ) 2026<span>﻿</span></strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 16:16:35', '2025-08-27 16:16:35', NULL, NULL, NULL, NULL, NULL),
(195, 'الاجتماعيات للثاني متوسط للاستاذ حامد ياسين 2026', NULL, NULL, '428954', 4, 345, NULL, 8000, 8000, 100, 1, 0, 'الاجتماعيات للثاني متوسط للاستاذ حامد ياسين 2026', NULL, '<p>الاجتماعيات للثاني متوسط للاستاذ حامد ياسين 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:17:45', '2025-08-27 16:17:45', NULL, NULL, NULL, NULL, NULL),
(196, 'احياء الاستاذ احمد الجاف للثالث المتوسط 2026', NULL, NULL, '949745', 4, 346, NULL, 11000, 11000, 100, 1, 0, 'ملزمة الاحياء للاستاذ احمد الجاف للصف الثالث المتوسط 2026', NULL, '<p><strong>ملزمة الاحياء للاستاذ احمد الجاف للصف الثالث المتوسط 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 16:18:58', '2025-08-27 16:18:58', NULL, NULL, NULL, NULL, NULL),
(197, 'الاحياء للثاني متوسط للاستاذ احمد الجاف 2026', NULL, NULL, '797915', 4, 347, NULL, 8000, 8000, 100, 1, 0, 'الاحياء للثاني متوسط للاستاذ احمد الجاف 2026', NULL, '<p>الاحياء للثاني متوسط للاستاذ احمد الجاف 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:19:02', '2025-08-27 16:19:02', NULL, NULL, NULL, NULL, NULL),
(198, 'اللغة الانكليزية للاستاذ محمد النوفلي للثاني متوسط 2026', NULL, NULL, '682744', 4, 348, NULL, 10000, 10000, 100, 1, 0, 'اللغة الانكليزية للاستاذ محمد النوفلي للثاني متوسط 2026', NULL, '<p>اللغة الانكليزية للاستاذ محمد النوفلي للثاني متوسط 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:20:15', '2025-08-27 16:20:15', NULL, NULL, NULL, NULL, NULL),
(199, 'الاسلامية للاستاذة سمري علي للثالث المتوسط 2026', NULL, NULL, '353463', 4, 349, NULL, 7000, 7000, 100, 1, 0, 'ملزمة الاسلامية للصف الثالث المتوسط للاستاذة سمر علي 2026', NULL, '<p><strong>ملزمة الاسلامية للصف الثالث المتوسط للاستاذة سمر علي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 16:21:00', '2025-08-27 16:21:00', NULL, NULL, NULL, NULL, NULL),
(200, 'اللغة الانكليزية للثاني متوسط للاستاذ حسين احمد طعين 2026', NULL, NULL, '267912', 4, 350, NULL, 10000, 10000, 100, 1, 0, 'اللغة الانكليزية للثاني متوسط للاستاذ حسين احمد طعين 2026', NULL, '<p>اللغة الانكليزية للثاني متوسط للاستاذ حسين احمد طعين 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:23:21', '2025-08-27 16:23:21', NULL, NULL, NULL, NULL, NULL),
(201, 'اللغة الانكليزية للاستاذ احمد فوزي للثالث المتوسط 2026', NULL, NULL, '162367', 4, 351, NULL, 10, 10, 100, 1, 0, 'ملزمة اللغة الانكليزية للصف الثالث المتوسط للاستاذ احمد فوزي 2026', NULL, '<p><strong>ملزمة اللغة الانكليزية للصف الثالث المتوسط للاستاذ احمد فوزي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 16:23:27', '2025-08-27 16:23:27', NULL, NULL, NULL, NULL, NULL),
(202, 'اللغة العربية ست سمر علي احمد ثاني متوسط الجزء الاول 2026', NULL, NULL, '852461', 4, 352, NULL, 7000, 7000, 100, 1, 0, 'اللغة العربية ست سمر علي احمد ثاني متوسط الجزء الاول 2026', NULL, '<p>اللغة العربية ست سمر علي احمد ثاني متوسط الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:25:12', '2025-08-27 16:25:12', NULL, NULL, NULL, NULL, NULL),
(203, 'اللغة الانكليزية للاستاذ محمد النوفلي للثالث المتوسط 2026', NULL, NULL, '250922', 4, 353, NULL, 10, 10, 100, 1, 0, 'ملزمة اللغة الانكليزية للاستاذ محمد النوفلي للصف الثالث المتوسط 2026', NULL, '<p><strong>ملزمة اللغة الانكليزية للاستاذ محمد النوفلي للصف الثالث المتوسط 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 16:25:43', '2025-08-27 16:25:43', NULL, NULL, NULL, NULL, NULL),
(204, 'الاسلامية للاستاذ فيصل عبد الودود للثاني متوسط 2026', NULL, NULL, '362210', 4, 354, NULL, 6000, 6000, 100, 1, 0, 'الاسلامية للاستاذ فيصل عبد الودود للثاني متوسط 2026', NULL, '<p>الاسلامية للاستاذ فيصل عبد الودود للثاني متوسط 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 16:26:31', '2025-08-27 16:26:31', NULL, NULL, NULL, NULL, NULL),
(205, 'ملزمة اللغة الانكليزية للخامس اعدادي للاستاذ احمد  فوزي الجزء الاول 2026', NULL, NULL, '406629', 4, 358, NULL, 9000, 9000, 50, 1, 0, 'ملزمة اللغة الانكليزية للخامس اعدادي للاستاذ احمد  فوزي الجزء الاول 2026', NULL, '<p>ملزمة اللغة الانكليزية للخامس اعدادي للاستاذ احمد  فوزي الجزء الاول 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:25:20', '2025-08-27 17:25:20', NULL, NULL, NULL, NULL, NULL),
(206, 'اللغة الفرنسية للاستاذ محمد علي الكناني للخامس العلمي 2026', NULL, NULL, '483645', 4, 359, NULL, 7000, 7000, 30, 1, 0, 'اللغة الفرنسية للاستاذ محمد علي الكناني للخامس العلمي 2026', NULL, '<p>اللغة الفرنسية للاستاذ محمد علي الكناني للخامس العلمي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:27:06', '2025-08-27 17:27:06', NULL, NULL, NULL, NULL, NULL),
(207, 'اللغة الانكليزية للخامس الاعدادي للاستاذ محمد النوفلي 2026', NULL, NULL, '945551', 4, 360, NULL, 11000, 11000, 20, 1, 0, 'اللغة الانكليزية للخامس الاعدادي للاستاذ محمد النوفلي 2026', NULL, '<p>اللغة الانكليزية للخامس الاعدادي للاستاذ محمد النوفلي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:29:22', '2025-08-27 17:29:22', NULL, NULL, NULL, NULL, NULL),
(208, 'اللغة العربية للثالث متوسط للاستاذ مازن الهلالي للثالث متوسط 2026', NULL, NULL, '940408', 4, 361, NULL, 11000, 11000, 50, 1, 0, 'اللغة العربية للثالث متوسط للاستاذ مازن الهلالي للثالث متوسط 2026', NULL, '<p>اللغة العربية للثالث متوسط للاستاذ مازن الهلالي للثالث متوسط 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:36:41', '2025-08-27 17:36:41', NULL, NULL, NULL, NULL, NULL),
(209, 'اللغة الانكيزية للرابع اعدادي للاستاذ علي الغرابي 2026', NULL, NULL, '223056', 4, 363, NULL, 10000, 10000, 150, 1, 0, 'اللغة الانكيزية للرابع اعدادي للاستاذ علي الغرابي 2026', NULL, '<p>اللغة الانكيزية للرابع اعدادي للاستاذ علي الغرابي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:41:57', '2025-08-27 17:41:57', NULL, NULL, NULL, NULL, NULL),
(210, 'الاجتماعيات للسادس الابتدائي للاستاذ خليل الخفاجي 2026', NULL, NULL, '369320', 4, 365, NULL, 8000, 8000, 100, 1, 0, 'الاجتماعيات للسادس الابتدائي للاستاذ خليل الخفاجي 2026', NULL, '<p>الاجتماعيات للسادس الابتدائي للاستاذ خليل الخفاجي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:55:17', '2025-08-27 17:55:17', NULL, NULL, NULL, NULL, NULL),
(211, 'اللغة العربية للسادس الابتدائي للست مريم 2026', NULL, NULL, '380427', 4, 366, NULL, 6000, 6000, 100, 1, 0, 'اللغة العربية للسادس الابتدائي للست مريم 2026', NULL, '<p>اللغة العربية للسادس الابتدائي للست مريم 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:57:04', '2025-08-27 17:57:04', NULL, NULL, NULL, NULL, NULL),
(212, 'الاسلامية للسادس الابتدائي للست مريم 2026', NULL, NULL, '636604', 4, 367, NULL, 5000, 5000, 100, 1, 0, 'الاسلامية للسادس الابتدائي للست مريم 2026', NULL, '<p>الاسلامية للسادس الابتدائي للست مريم 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:58:26', '2025-08-27 17:58:26', NULL, NULL, NULL, NULL, NULL),
(213, 'العلوم للسادس الابتدائي للاستاذ مصطفى ظافر الكعبي 2026', NULL, NULL, '138394', 4, 368, NULL, 8000, 8000, 100, 1, 0, 'العلوم للسادس الابتدائي للاستاذ مصطفى ظافر الكعبي 2026', NULL, '<p>العلوم للسادس الابتدائي للاستاذ مصطفى ظافر الكعبي 2026</p>', NULL, 1, 1, 0, 1, '2025-08-27 17:59:51', '2025-08-27 17:59:51', NULL, NULL, NULL, NULL, NULL),
(214, 'الاقتصاد للاستاذ حسين عبد الحسين اللامي 2026', NULL, NULL, '606695', 4, 369, NULL, 7000, 7000, 100, 1, 0, 'ملزمة الاقتصاد للاستاذ حسين عبد الحسين اللامي للصف السادس الادبي2026', NULL, '<p><strong>ملزمة الاقتصاد للاستاذ حسين عبد الحسين اللامي للصف السادس الادبي2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:12:11', '2025-08-27 19:12:11', NULL, NULL, NULL, NULL, NULL),
(215, 'الجغرافية للاستاذ حسين عبد الحسين اللامي 2026', NULL, NULL, '826729', 4, 370, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الجغرافية للاستاذ حسين عبد الحسين اللامي للصف السادص الادبي 2026', NULL, '<p><strong>ملزمة الجغرافية للاستاذ حسين عبد الحسين اللامي للصف السادص الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:15:07', '2025-08-27 19:15:07', NULL, NULL, NULL, NULL, NULL),
(216, 'الجغرافية للاستاذة هبة الشمري 2026', NULL, NULL, '825306', 4, 371, NULL, 10, 10, 100, 1, 0, 'ملزمة الجغرافية للاستاذة هبة الشمري للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة الجغرافية للاستاذة هبة الشمري للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:22:31', '2025-08-27 19:22:31', NULL, NULL, NULL, NULL, NULL),
(217, 'الاقتصاد للاستاذة هبة الشمري 2026', NULL, NULL, '674671', 4, 372, NULL, 10, 10, 100, 1, 0, 'ملزمة الاقتصاد للاستاذة هبة الشمري للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة الاقتصاد للاستاذة هبة الشمري للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:24:31', '2025-08-27 19:24:31', NULL, NULL, NULL, NULL, NULL),
(218, 'التاريخ للاستاذ مضر الجبوري 2026', NULL, NULL, '269783', 4, 373, NULL, 9000, 9000, 100, 1, 0, 'ملزمة التاريخ للاستاذ مضر الجبوري للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة التاريخ للاستاذ مضر الجبوري للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:27:32', '2025-08-27 19:27:32', NULL, NULL, NULL, NULL, NULL),
(219, 'الجغرافية للاستاذ مضر الجبوري 2026', NULL, NULL, '946412', 4, 374, NULL, 9000, 9000, 100, 1, 0, 'ملزمة الجغرافية للاستاذ مضر الجبوري للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة الجغرافية للاستاذ مضر الجبوري للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:30:02', '2025-08-27 19:30:02', NULL, NULL, NULL, NULL, NULL),
(220, 'الاقتصاد للاستاذ مضر الجبوري 2026', NULL, NULL, '896885', 4, 375, NULL, 8000, 8000, 100, 1, 0, 'ملزمة الاقتصاد للاستاذ مضر الجبوري للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة الاقتصاد للاستاذ مضر الجبوري للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:32:04', '2025-08-27 19:32:04', NULL, NULL, NULL, NULL, NULL),
(221, 'التاريخ للاستاذ احمد جبار الدايني سادس ادبي 2026', NULL, NULL, '285602', 4, 376, NULL, 9000, 9000, 100, 1, 0, 'ملزمة التاريخ للاستاذ احمد جبار الدايني للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة التاريخ للاستاذ احمد جبار الدايني للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:34:21', '2025-08-27 19:34:21', NULL, NULL, NULL, NULL, NULL),
(222, 'اقتصاد الاستاذ احمد جبار الدايني للسادس الادبي 2026', NULL, NULL, '268127', 4, 377, NULL, 8000, 8, 100, 1, 0, 'ملزمة الاقتصاد للصف السادس الادبي للاستاذ احمد جبار الدايني للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة الاقتصاد للصف السادس الادبي للاستاذ احمد جبار الدايني للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 19:36:39', '2025-08-27 19:36:39', NULL, NULL, NULL, NULL, NULL),
(223, 'جغرافية الدكتور عباس العامري للسادس الادبي 2026', NULL, NULL, '275412', 4, 378, NULL, 9000, 9000, 100, 1, 0, 'ملزمة الجغرافية للدكتور عباس العامري للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة الجغرافية للدكتور عباس العامري للصف السادس الادبي 2026 </strong>  </p>', NULL, 1, 1, 0, 1, '2025-08-27 19:49:37', '2025-08-27 19:49:37', NULL, NULL, NULL, NULL, NULL),
(224, 'الاقتصاد للدكتور عباس العامري للسادس الادبي 2026', NULL, NULL, '112730', 4, 379, NULL, 9000, 9000, 100, 1, 0, 'ملزمة الاقتصاد للصف السادس الادبي للدكتور عباس العامري للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة الاقتصاد للصف السادس الادبي للدكتور عباس العامري للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 20:02:22', '2025-08-27 20:02:22', NULL, NULL, NULL, NULL, NULL),
(225, 'التاريخ للاستاذ حسين عبد الحسين اللامي للسادس الادبي 2026', NULL, NULL, '114764', 4, 380, NULL, 8000, 8000, 100, 1, 0, 'ملزمة التاريخ للاستاذ حسين عبد الحسين اللامي للصف السادس الادبي 2026', NULL, '<p><strong>ملزمة التاريخ للاستاذ حسين عبد الحسين اللامي للصف السادس الادبي 2026</strong></p>', NULL, 1, 1, 0, 1, '2025-08-27 20:05:24', '2025-08-27 20:05:24', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(4, 7),
(5, 7),
(6, 7),
(7, 7),
(8, 7),
(9, 7),
(10, 7),
(11, 7),
(12, 7),
(13, 7),
(14, 7),
(15, 7),
(16, 7),
(17, 7),
(18, 7),
(19, 7),
(20, 7),
(21, 7),
(22, 7),
(23, 7),
(24, 7),
(25, 7),
(26, 7),
(27, 9),
(28, 9),
(29, 7),
(30, 7),
(31, 7),
(32, 7),
(33, 7),
(34, 7),
(35, 7),
(36, 7),
(37, 7),
(38, 7),
(39, 7),
(40, 7),
(41, 7),
(42, 7),
(43, 7),
(44, 7),
(45, 7),
(46, 7),
(47, 7),
(48, 7),
(49, 7),
(50, 9),
(3, 6),
(51, 7),
(52, 7),
(53, 7),
(54, 7),
(55, 7),
(56, 7),
(57, 7),
(58, 7),
(59, 7),
(60, 7),
(61, 7),
(62, 7),
(63, 7),
(64, 7),
(65, 7),
(66, 9),
(67, 9),
(68, 9),
(69, 9),
(70, 9),
(71, 9),
(72, 9),
(73, 9),
(74, 9),
(75, 9),
(76, 9),
(77, 9),
(78, 9),
(79, 9),
(80, 9),
(81, 9),
(82, 9),
(83, 9),
(84, 9),
(85, 9),
(86, 9),
(87, 9),
(88, 9),
(89, 9),
(90, 9),
(91, 9),
(92, 9),
(93, 9),
(94, 9),
(95, 9),
(96, 9),
(97, 9),
(98, 9),
(99, 9),
(100, 9),
(101, 9),
(102, 9),
(103, 9),
(104, 9),
(105, 9),
(106, 9),
(107, 9),
(108, 9),
(109, 9),
(110, 9),
(111, 9),
(112, 9),
(113, 9),
(114, 9),
(115, 9),
(116, 9),
(117, 9),
(118, 9),
(119, 9),
(120, 9),
(121, 9),
(122, 9),
(123, 9),
(124, 9),
(125, 9),
(126, 9),
(127, 9),
(128, 9),
(129, 9),
(130, 9),
(131, 9),
(132, 9),
(133, 9),
(134, 9),
(135, 9),
(136, 9),
(137, 9),
(138, 9),
(139, 9),
(140, 9),
(141, 9),
(142, 9),
(143, 9),
(144, 9),
(145, 9),
(146, 9),
(147, 9),
(148, 9),
(149, 9),
(150, 9),
(151, 9),
(152, 9),
(153, 9),
(154, 9),
(155, 9),
(156, 9),
(157, 9),
(158, 9),
(159, 9),
(160, 7),
(161, 9),
(162, 7),
(163, 9),
(164, 7),
(165, 7),
(166, 7),
(167, 7),
(168, 7),
(169, 9),
(170, 7),
(171, 9),
(172, 7),
(173, 9),
(174, 7),
(175, 7),
(176, 9),
(177, 7),
(178, 9),
(179, 7),
(180, 9),
(181, 9),
(182, 9),
(183, 7),
(184, 9),
(185, 7),
(186, 9),
(187, 7),
(188, 7),
(189, 9),
(190, 7),
(191, 9),
(192, 9),
(193, 7),
(194, 9),
(195, 9),
(196, 9),
(197, 9),
(198, 9),
(199, 9),
(200, 9),
(201, 9),
(202, 9),
(203, 9),
(204, 9),
(205, 9),
(206, 9),
(207, 9),
(208, 9),
(209, 9),
(210, 9),
(211, 9),
(212, 9),
(213, 9),
(214, 9),
(215, 9),
(216, 9),
(217, 9),
(218, 9),
(219, 9),
(220, 9),
(221, 9),
(222, 9),
(223, 9),
(224, 9),
(225, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`product_id`, `color_id`, `price`) VALUES
(10, 36, 0),
(10, 17, 0),
(10, 18, 0),
(10, 31, 0),
(10, 29, 0),
(29, 14, 0),
(29, 10, 0),
(29, 36, 0),
(29, 33, 0),
(51, 21, 0),
(51, 38, 0),
(51, 13, 0),
(51, 25, 0),
(52, 25, 0),
(52, 31, 0),
(52, 21, 0),
(52, 38, 0),
(52, 36, 0),
(52, 23, 0),
(52, 37, 0),
(55, 10, 0),
(55, 19, 0),
(55, 36, 0),
(55, 11, 0),
(57, 11, 0),
(57, 10, 0),
(57, 19, 0),
(57, 36, 0),
(59, 10, 0),
(59, 19, 0),
(59, 40, 0),
(59, 31, 0),
(59, 33, 0),
(62, 10, 0),
(62, 31, 0),
(62, 36, 0),
(62, 18, 0),
(62, 19, 0),
(64, 17, 0),
(64, 14, 0),
(64, 18, 0),
(64, 19, 0),
(64, 31, 0),
(64, 35, 0),
(64, 34, 0),
(64, 33, 0),
(64, 40, 0),
(65, 13, 0),
(65, 17, 0),
(65, 18, 0),
(65, 31, 0),
(65, 21, 0),
(65, 22, 0),
(65, 38, 0),
(160, 17, 0),
(160, 18, 0),
(160, 35, 0),
(162, 36, 0),
(162, 18, 0),
(162, 34, 0),
(164, 18, 0),
(164, 36, 0),
(164, 21, 0),
(165, 18, 0),
(165, 36, 0),
(165, 17, 0),
(166, 17, 0),
(166, 18, 0),
(166, 10, 0),
(166, 38, 0),
(167, 15, 0),
(167, 31, 0),
(167, 35, 0),
(170, 13, 0),
(170, 18, 0),
(170, 35, 0),
(170, 36, 0),
(172, 15, 0),
(172, 31, 0),
(172, 35, 0),
(174, 14, 0),
(174, 35, 0),
(174, 36, 0),
(175, 15, 0),
(175, 31, 0),
(175, 36, 0),
(179, 12, 0),
(177, 11, 0),
(177, 12, 0),
(177, 24, 0),
(183, 14, 0),
(183, 18, 0),
(183, 35, 0),
(185, 18, 0),
(185, 34, 0),
(185, 36, 0),
(187, 18, 0),
(187, 38, 0),
(187, 33, 0),
(188, 34, 0),
(188, 36, 0),
(188, 10, 0),
(190, 41, 0),
(190, 26, 0),
(190, 16, 0),
(193, 10, 0),
(193, 14, 0),
(193, 15, 0),
(193, 36, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_subcategories`
--

CREATE TABLE `product_subcategories` (
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_subcategories`
--

INSERT INTO `product_subcategories` (`sub_category_id`, `product_id`) VALUES
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(13, 10),
(16, 11),
(16, 12),
(16, 13),
(16, 14),
(16, 15),
(16, 16),
(16, 17),
(16, 18),
(16, 19),
(16, 20),
(16, 21),
(16, 22),
(16, 23),
(16, 24),
(16, 25),
(16, 26),
(18, 27),
(18, 28),
(13, 29),
(20, 30),
(20, 31),
(20, 32),
(20, 33),
(20, 34),
(20, 35),
(20, 36),
(20, 37),
(20, 38),
(20, 39),
(20, 40),
(20, 41),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(18, 50),
(21, 51),
(21, 52),
(21, 53),
(21, 54),
(21, 55),
(21, 56),
(21, 57),
(21, 58),
(21, 59),
(21, 60),
(21, 61),
(21, 62),
(21, 63),
(21, 64),
(21, 65),
(18, 66),
(18, 67),
(18, 68),
(18, 69),
(18, 70),
(18, 71),
(18, 72),
(18, 73),
(18, 74),
(18, 75),
(18, 76),
(18, 77),
(18, 78),
(18, 79),
(18, 80),
(18, 81),
(18, 82),
(18, 83),
(18, 84),
(18, 85),
(18, 86),
(18, 87),
(18, 88),
(18, 89),
(18, 90),
(18, 91),
(18, 92),
(18, 93),
(18, 94),
(18, 95),
(18, 96),
(18, 97),
(18, 98),
(18, 99),
(18, 100),
(18, 101),
(18, 102),
(18, 103),
(18, 104),
(18, 105),
(18, 106),
(18, 107),
(18, 108),
(18, 109),
(18, 110),
(18, 111),
(18, 112),
(18, 113),
(18, 114),
(18, 115),
(18, 116),
(18, 117),
(18, 118),
(18, 119),
(18, 120),
(18, 121),
(18, 122),
(18, 123),
(18, 124),
(18, 125),
(18, 126),
(18, 127),
(18, 128),
(18, 129),
(18, 130),
(18, 131),
(18, 132),
(18, 133),
(18, 134),
(18, 135),
(18, 136),
(18, 137),
(18, 138),
(18, 139),
(18, 140),
(18, 141),
(18, 142),
(18, 143),
(18, 144),
(18, 145),
(18, 146),
(18, 147),
(18, 148),
(18, 149),
(18, 150),
(18, 151),
(18, 152),
(18, 153),
(18, 154),
(18, 155),
(18, 156),
(18, 157),
(18, 158),
(18, 159),
(22, 160),
(23, 161),
(22, 162),
(23, 163),
(22, 164),
(22, 165),
(22, 166),
(22, 167),
(22, 168),
(23, 169),
(22, 170),
(23, 171),
(22, 172),
(23, 173),
(22, 174),
(22, 175),
(23, 176),
(22, 177),
(23, 178),
(22, 179),
(23, 180),
(23, 181),
(23, 182),
(22, 183),
(23, 184),
(22, 185),
(23, 186),
(22, 187),
(22, 188),
(23, 189),
(22, 190),
(23, 191),
(24, 192),
(22, 193),
(23, 194),
(24, 195),
(23, 196),
(24, 197),
(24, 198),
(23, 199),
(24, 200),
(23, 201),
(24, 202),
(23, 203),
(24, 204),
(25, 205),
(25, 206),
(25, 207),
(25, 208),
(28, 209),
(29, 210),
(29, 211),
(29, 212),
(29, 213),
(27, 214),
(27, 215),
(27, 216),
(27, 217),
(27, 218),
(27, 219),
(27, 220),
(27, 221),
(27, 222),
(27, 223),
(27, 224),
(27, 225);

-- --------------------------------------------------------

--
-- Table structure for table `product_thumbnails`
--

CREATE TABLE `product_thumbnails` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_thumbnails`
--

INSERT INTO `product_thumbnails` (`product_id`, `media_id`) VALUES
(3, 49),
(10, 68),
(10, 69),
(29, 106),
(29, 107),
(51, 137),
(51, 138),
(51, 139),
(52, 141),
(52, 142),
(52, 143),
(52, 144),
(52, 145),
(53, 147),
(53, 148),
(53, 149),
(53, 150),
(53, 151),
(54, 153),
(54, 154),
(54, 155),
(54, 156),
(55, 158),
(56, 160),
(56, 161),
(56, 162),
(56, 163),
(57, 165),
(58, 167),
(58, 168),
(58, 169),
(58, 170),
(59, 172),
(59, 173),
(59, 174),
(60, 176),
(60, 177),
(60, 178),
(60, 179),
(60, 180),
(61, 182),
(61, 183),
(61, 184),
(61, 185),
(61, 186),
(62, 188),
(62, 189),
(62, 190),
(62, 191),
(62, 192),
(62, 193),
(63, 195),
(63, 196),
(63, 197),
(63, 198),
(64, 200),
(64, 201),
(64, 202),
(64, 203),
(64, 204),
(65, 206),
(65, 207),
(65, 208),
(65, 209),
(65, 210),
(65, 211),
(134, 282);

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_vat_taxes`
--

CREATE TABLE `product_vat_taxes` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vat_tax_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recent_views`
--

CREATE TABLE `recent_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recent_views`
--

INSERT INTO `recent_views` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 6, 14, '2025-08-26 14:15:31', '2025-08-26 14:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` double NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `is_shop` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `is_shop`, `created_at`, `updated_at`) VALUES
(1, 'root', 'web', 0, '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(2, 'admin', 'web', 0, '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(3, 'shop', 'web', 0, '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(4, 'customer', 'web', 0, '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(5, 'visitor', 'web', 0, '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(6, 'driver', 'web', 0, '2025-08-13 23:14:06', '2025-08-13 23:14:06'),
(7, 'storeadmin', 'web', 1, '2025-08-24 01:00:36', '2025-08-24 01:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(196, 7),
(197, 7),
(198, 7),
(199, 7),
(200, 7),
(201, 7),
(202, 7),
(203, 7),
(204, 7),
(205, 7),
(206, 7),
(207, 7),
(208, 7),
(209, 7),
(210, 7),
(211, 7),
(212, 7),
(213, 7),
(214, 7),
(215, 7),
(216, 7),
(217, 7),
(218, 7),
(219, 7),
(220, 7),
(221, 7),
(222, 7),
(223, 7),
(224, 7),
(225, 7),
(226, 7),
(227, 7),
(228, 7),
(229, 7),
(230, 7),
(231, 7),
(232, 7),
(233, 7),
(234, 7),
(235, 7),
(236, 7);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `logo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `banner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_charge` double DEFAULT 0,
  `min_order_amount` double NOT NULL DEFAULT 0,
  `prefix` varchar(255) NOT NULL DEFAULT 'RC',
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `off_day` varchar(255) DEFAULT NULL,
  `estimated_delivery_time` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_online` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `user_id`, `logo_id`, `banner_id`, `delivery_charge`, `min_order_amount`, `prefix`, `address`, `latitude`, `longitude`, `opening_time`, `closing_time`, `off_day`, `estimated_delivery_time`, `status`, `description`, `created_at`, `updated_at`, `last_online`) VALUES
(1, 'واصل', 1, 3, 4, 0, 1, 'Wa', 'العراق - بغداد', '-54.038402', '-116.821693', '13:03:00', '23:30:00', NULL, '1', 1, 'متجر شامل', '2025-08-14 02:15:35', '2025-08-28 03:28:34', '2025-08-28 03:38:34'),
(2, 'متجر مكتبة النهرين الالكتروني', 5, 10, 11, 0, 1, 'Na', 'الديوانية - شارع المصورين', NULL, NULL, '00:00:00', '23:30:00', NULL, '1', 1, 'متجر خاص باللوازم المكتبية والمدرسية', '2025-08-19 17:24:08', '2025-08-25 14:38:54', '2025-08-25 14:48:54'),
(3, 'البراق للالكترونيات', 11, 28, 29, 0, 0, 'RC', 'العراق - الديوانية - شارع المصورين', NULL, NULL, '08:30:00', '19:00:00', NULL, '1', 1, 'متجر مختص بالالكترونيات  و الحاسبات والطابعات وكامرات المراقبة و الحلول الرقمية وتكلنوجيا المعلومات', '2025-08-23 17:32:52', '2025-08-26 19:52:52', '2025-08-26 20:02:52'),
(4, 'متجر مكتبة النهرين الالكتروني', 12, 54, 55, 0, 0, 'RC', 'الديوانية - شارع المصورين', NULL, NULL, '08:00:00', '20:30:00', NULL, '5', 1, 'كل مايخص المستلزمات المكتبية والمدرسية', '2025-08-25 13:31:24', '2025-08-27 21:10:01', '2025-08-27 21:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--

CREATE TABLE `shop_categories` (
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_subscriptions`
--

CREATE TABLE `shop_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `sale_limit` int(11) DEFAULT NULL,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `remaining_sales` int(11) DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_user`
--

CREATE TABLE `shop_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shop_user`
--

INSERT INTO `shop_user` (`id`, `shop_id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 4, 13, NULL, '2025-08-26 04:23:19', '2025-08-26 04:23:19'),
(4, 3, 13, NULL, '2025-08-26 04:23:24', '2025-08-26 04:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `shop_user_chats`
--

CREATE TABLE `shop_user_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `name_ar`, `shop_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'XS', 'صغير جدًا', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(2, 'S', 'صغير', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(3, 'M', 'متوسط', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(4, 'L', 'كبير', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(5, 'XL', 'كبير جدًا', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(6, 'XXL', 'ضخم', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(7, 'XXXL', 'ضخم جدًا', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(8, '4XL', 'أكبر من XXXL', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(9, '5XL', 'ضخم جدًا جدًا', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(10, 'One Size', 'مقاس واحد للجميع', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(11, '0-3M', '0 - 3 شهور', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(12, '3-6M', '3 - 6 شهور', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(13, '6-9M', '6 - 9 شهور', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(14, '9-12M', '9 - 12 شهر', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(15, '12-18M', '12 - 18 شهر', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(16, '18-24M', '18 - 24 شهر', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(17, '2Y', 'سنتين', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(18, '3Y', '3 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(19, '4Y', '4 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(20, '5Y', '5 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(21, '6Y', '6 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(22, '7Y', '7 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(23, '8Y', '8 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(24, '9Y', '9 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(25, '10Y', '10 سنوات', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(26, '12Y', '12 سنة', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(27, '14Y', '14 سنة', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(28, '36', 'مقاس 36', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(29, '37', 'مقاس 37', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(30, '38', 'مقاس 38', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(31, '39', 'مقاس 39', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(32, '40', 'مقاس 40', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(33, '41', 'مقاس 41', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(34, '42', 'مقاس 42', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(35, '43', 'مقاس 43', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(36, '44', 'مقاس 44', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(37, '45', 'مقاس 45', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(38, '46', 'مقاس 46', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(39, '47', 'مقاس 47', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(40, '48', 'مقاس 48', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(41, '28', 'بنطلون مقاس 28', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(42, '29', 'بنطلون مقاس 29', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(43, '30', 'بنطلون مقاس 30', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(44, '31', 'بنطلون مقاس 31', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(45, '32', 'بنطلون مقاس 32', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(46, '33', 'بنطلون مقاس 33', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(47, '34', 'بنطلون مقاس 34', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(48, '36', 'بنطلون مقاس 36', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(49, '38', 'بنطلون مقاس 38', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(50, '40', 'بنطلون مقاس 40', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(51, 'S-M', 'صغير - متوسط', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(52, 'M-L', 'متوسط - كبير', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(53, 'L-XL', 'كبير - كبير جدًا', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(54, '6', 'مقاس خاتم 6', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(55, '7', 'مقاس خاتم 7', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(56, '8', 'مقاس خاتم 8', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(57, '9', 'مقاس خاتم 9', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(58, '10', 'مقاس خاتم 10', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(59, '80 cm', 'حزام 80 سم', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(60, '90 cm', 'حزام 90 سم', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(61, '100 cm', 'حزام 100 سم', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(62, '110 cm', 'حزام 110 سم', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43'),
(63, '120 cm', 'حزام 120 سم', 1, 1, '2025-08-25 15:06:43', '2025-08-25 15:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `social_auths`
--

CREATE TABLE `social_auths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `redirect` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_auths`
--

INSERT INTO `social_auths` (`id`, `name`, `client_id`, `client_secret`, `redirect`, `provider`, `logo`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Google', NULL, NULL, 'postmessage', 'google', 'assets/social/google.svg', 0, NULL, NULL),
(2, 'Facebook', '', '', '', 'facebook', 'assets/social/facebook.svg', 0, NULL, NULL),
(3, 'Apple', NULL, '', NULL, 'apple', 'assets/social/apple.svg', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `name`, `logo`, `link`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', '/assets/social/facebook.png', NULL, 1, NULL, NULL),
(2, 'LinkedIn', '/assets/social/linkedin.png', 'https://www.linkedin.com/company/razinsoft', 1, NULL, NULL),
(3, 'Instagram', '/assets/social/instagram.png', NULL, 1, NULL, NULL),
(4, 'YouTube', '/assets/social/youtube.png', 'https://www.youtube.com/@razinsoft', 1, NULL, NULL),
(5, 'WhatsApp', '/assets/social/whatsapp.png', NULL, 1, NULL, NULL),
(6, 'Twitter', '/assets/social/twitter.png', NULL, 1, NULL, NULL),
(7, 'Telegram', '/assets/social/telegram.png', NULL, 1, NULL, NULL),
(8, 'Google Plus', '/assets/social/google-plus.png', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `sale_limit` int(11) DEFAULT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `name`, `short_description`, `description`, `price`, `duration`, `sale_limit`, `is_popular`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'السنوية', 'الخطة السنوية', NULL, 500000.00, 360, NULL, 1, 1, '2025-08-23 00:19:41', '2025-08-23 00:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `media_id`, `shop_id`, `name`, `name_ar`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 35, NULL, 'طابعات', NULL, 'tabaaat', 1, '2025-08-23 23:47:54', '2025-08-23 23:47:54'),
(2, 36, NULL, 'الكيمينك', NULL, 'alkymynk', 1, '2025-08-23 23:48:16', '2025-08-23 23:48:16'),
(3, 37, NULL, 'اللابتوب', NULL, 'allabtob', 1, '2025-08-23 23:48:52', '2025-08-23 23:48:52'),
(4, 38, NULL, 'UPS و العاكسات', NULL, 'ups-o-alaaaksat', 1, '2025-08-23 23:49:14', '2025-08-23 23:49:14'),
(5, 39, NULL, 'الشاشات', NULL, 'alshashat', 1, '2025-08-23 23:49:30', '2025-08-23 23:49:30'),
(6, 40, NULL, 'كامرات المراقبة وملحقاتها', NULL, 'kamrat-almrakb-omlhkatha', 1, '2025-08-23 23:49:53', '2025-08-23 23:49:53'),
(7, 41, NULL, 'الانترنت', NULL, 'alantrnt', 1, '2025-08-23 23:51:42', '2025-08-23 23:51:42'),
(8, 42, NULL, 'الحاسبات المكتبية', NULL, 'alhasbat-almktby', 1, '2025-08-23 23:52:05', '2025-08-23 23:52:05'),
(9, 43, NULL, 'الاكسسوارات', NULL, 'alakssoarat', 1, '2025-08-23 23:52:55', '2025-08-23 23:52:55'),
(10, 45, NULL, 'اللوازم المدرسية', NULL, 'alloazm-almdrsy', 1, '2025-08-24 00:07:24', '2025-08-24 00:07:24'),
(11, 46, NULL, 'اللوازم المكتبية', NULL, 'alloazm-almktby', 1, '2025-08-24 00:07:49', '2025-08-24 00:07:49'),
(12, 58, 4, 'اقلام تأشير', NULL, 'aklam-tashyr', 1, '2025-08-25 15:09:54', '2025-08-25 15:09:54'),
(13, 65, 4, 'محفظات اقلام', NULL, 'mhfthat-aklam', 1, '2025-08-25 16:04:11', '2025-08-25 16:04:11'),
(16, 83, 4, 'اقلام رصاص', NULL, 'aklam-rsas', 1, '2025-08-25 17:20:35', '2025-08-25 17:20:35'),
(18, 101, 4, 'ملازم السادس العلمي', NULL, 'mlazm-alsads-alaalmy', 1, '2025-08-25 18:30:09', '2025-08-25 18:30:09'),
(19, 103, 3, 'كانون', NULL, 'kanon', 1, '2025-08-25 18:39:43', '2025-08-25 18:39:43'),
(20, 108, 4, 'اقلام جاف ملونة', NULL, 'aklam-gaf-mlon', 1, '2025-08-25 19:50:31', '2025-08-25 19:50:31'),
(21, 135, 4, 'سجلات ودفاتر', NULL, 'sglat-odfatr', 1, '2025-08-26 14:59:24', '2025-08-26 14:59:24'),
(22, 239, 4, 'مساحة ومقطة', NULL, 'msah-omkt', 1, '2025-08-26 20:52:38', '2025-08-26 20:52:38'),
(23, 308, 4, 'ملازم الثالث المتوسط', NULL, 'mlazm-althalth-almtost', 1, '2025-08-27 15:01:35', '2025-08-27 15:01:35'),
(24, 339, 4, 'ملازم الثاني متوسط', NULL, 'mlazm-althany-mtost', 1, '2025-08-27 16:11:45', '2025-08-27 16:11:45'),
(25, 355, 4, 'ملازم الخامس اعدادي 2026', NULL, 'mlazm-alkhams-aaadady-2026', 1, '2025-08-27 17:16:43', '2025-08-27 17:16:43'),
(26, 356, 4, 'ملازم الخامس اعدادي 2026', NULL, 'mlazm-alkhams-aaadady-2026', 0, '2025-08-27 17:18:39', '2025-08-27 17:19:46'),
(27, 357, 4, 'ملازم السادس الادبي', NULL, 'mlazm-alsads-aladby', 1, '2025-08-27 17:24:27', '2025-08-27 17:24:27'),
(28, 362, 4, 'ملازم الرابع اعدادي 2026', NULL, 'mlazm-alrabaa-aaadady-2026', 1, '2025-08-27 17:38:04', '2025-08-27 17:38:04'),
(29, 364, 4, 'ملازم السادس ابتدائي 2026', NULL, 'mlazm-alsads-abtdayy-2026', 1, '2025-08-27 17:44:22', '2025-08-27 17:44:22');

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_number` varchar(255) NOT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `issue_type` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `ticket_start` timestamp NULL DEFAULT NULL,
  `ticket_end` timestamp NULL DEFAULT NULL,
  `user_chat` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_attachments`
--

CREATE TABLE `support_ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_highlighted` tinyint(1) NOT NULL DEFAULT 0,
  `message` longtext NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `s_m_s_configs`
--

CREATE TABLE `s_m_s_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `provider` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_colors`
--

CREATE TABLE `theme_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `primary` varchar(255) NOT NULL,
  `secondary` varchar(255) NOT NULL,
  `variant_50` varchar(255) DEFAULT NULL,
  `variant_100` varchar(255) DEFAULT NULL,
  `variant_200` varchar(255) DEFAULT NULL,
  `variant_300` varchar(255) DEFAULT NULL,
  `variant_400` varchar(255) DEFAULT NULL,
  `variant_500` varchar(255) DEFAULT NULL,
  `variant_600` varchar(255) DEFAULT NULL,
  `variant_700` varchar(255) DEFAULT NULL,
  `variant_800` varchar(255) DEFAULT NULL,
  `variant_900` varchar(255) DEFAULT NULL,
  `variant_950` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theme_colors`
--

INSERT INTO `theme_colors` (`id`, `primary`, `secondary`, `variant_50`, `variant_100`, `variant_200`, `variant_300`, `variant_400`, `variant_500`, `variant_600`, `variant_700`, `variant_800`, `variant_900`, `variant_950`, `is_default`, `created_at`, `updated_at`) VALUES
(1, '#8044ee', '#e6dafc', '#f2ecfd', '#e6dafc', '#ccb4f8', '#b38ff5', '#9969f1', '#8044ee', '#733dd6', '#6636be', '#5a30a7', '#4d298f', '#402277', 1, '2025-08-19 18:22:15', '2025-08-20 01:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_issue_types`
--

CREATE TABLE `ticket_issue_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `is_commission` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL DEFAULT 'credit',
  `transaction_id` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translate_utilities`
--

CREATE TABLE `translate_utilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lang` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `shop_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'قطعة', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(2, 'كرتونة', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(3, 'كيلوغرام', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(4, 'غرام', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(5, 'لتر', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(6, 'مل', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(7, 'متر', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(8, 'سم', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(9, 'ملم', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(10, 'علبة', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(11, 'باكيت', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(12, 'دزينة', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(13, 'زوج', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(14, 'مجموعة', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(15, 'كيس', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(16, 'صندوق', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(17, 'رطل', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(18, 'أوقية', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(19, 'جالون', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35'),
(20, 'برميل', 1, 1, '2025-08-25 15:07:35', '2025-08-25 15:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `driving_lience` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `auth_type` varchar(255) DEFAULT NULL,
  `auth_id` varchar(255) DEFAULT NULL,
  `last_online` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `phone`, `email`, `media_id`, `password`, `gender`, `date_of_birth`, `is_active`, `email_verified_at`, `phone_verified_at`, `remember_token`, `driving_lience`, `vehicle_type`, `created_at`, `updated_at`, `deleted_at`, `country`, `phone_code`, `shop_id`, `auth_type`, `auth_id`, `last_online`) VALUES
(1, 'عمار', 'الاصفر', '7830200031', 'admin@gmail.com', 1, '$2y$12$O2YpN0yUJBos.Y3M6SWqluShXaAZw7yMTVStRpuXBtPURelzqWU7a', 'male', '1992-05-26', 1, '2025-08-14 02:15:35', '2025-08-14 02:15:35', 'Ck4C0QBnI5d0OFlXMINIyMguADeHTOWjA3pZuaSXtIqOabscufcRs46uTazI', NULL, NULL, '2025-08-14 02:15:35', '2025-08-23 02:52:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Ammar', NULL, '07830200030', 'pro.int3rnet@gmail.com', 8, '$2y$12$KjavjSqgvxuPxorrHBurOOsFB0uO65evOYHrP9lnu8FmPhDJlb7q6', 'male', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-14 20:57:08', '2025-08-20 05:09:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'ميثم', 'النهرين', '7823228494', 'maithemaaaa1989@gmail.com', 9, '$2y$12$kzyW93wpp4l0WqJ/wbp33.lQF58A4yLmzuz98Z2yOUWdRhH5xmHXW', 'male', NULL, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-19 17:24:08', '2025-08-25 13:31:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'عباس', 'البراق', '07803731337', 'abas8987@gmail.com', 27, '$2y$12$kt2Ce7lDNfsqKkgGlqnVnO.zkirjHsNhXbJNea3rub7dAH8z63.ea', 'male', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-23 17:32:52', '2025-08-23 17:32:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'ميثم', 'النهرين', '07803311088', 'maythem@mail.com', 53, '$2y$12$WRTaUKoXisG16gc.G5oto.6djMTYh8l7XIRrUP/r2Xm2g1vnAb6Cq', 'male', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-25 13:31:24', '2025-08-27 15:00:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'عمار رشاد جبار', NULL, '07831200032', NULL, NULL, '$2y$12$6H3hEj40bIkOrsibVQAkUOlQI19VysksMBUIQz9lHyIk..tM5P.Mu', 'male', '2025-08-27', 1, NULL, NULL, NULL, NULL, NULL, '2025-08-26 04:19:56', '2025-08-27 03:10:24', NULL, 'Iraq', '964', NULL, NULL, NULL, '2025-08-27 03:18:28'),
(14, 'عمار رشاد جبار', NULL, '07840400040', NULL, NULL, '$2y$12$G7lkYKXa89NIs09c2/wC/ejP3jDxbQPkX9wcgXgyj7idYeNWbQjBa', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-08-26 14:14:07', '2025-08-27 16:33:24', NULL, 'Iraq', '964', NULL, NULL, NULL, '2025-08-27 16:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `user_non_permissions`
--

CREATE TABLE `user_non_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vat_taxes`
--

CREATE TABLE `vat_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT 'order_base',
  `name` varchar(255) DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `deduction` varchar(255) DEFAULT 'exclusive',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verify_manages`
--

CREATE TABLE `verify_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `register_otp` tinyint(1) NOT NULL DEFAULT 0,
  `register_otp_type` varchar(255) DEFAULT NULL,
  `forgot_otp` tinyint(1) NOT NULL DEFAULT 1,
  `forgot_otp_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone_required` tinyint(1) NOT NULL DEFAULT 1,
  `email_required` tinyint(1) NOT NULL DEFAULT 0,
  `phone_min_length` varchar(255) DEFAULT NULL,
  `phone_max_length` varchar(255) DEFAULT NULL,
  `order_place_account_verify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `verify_manages`
--

INSERT INTO `verify_manages` (`id`, `register_otp`, `register_otp_type`, `forgot_otp`, `forgot_otp_type`, `created_at`, `updated_at`, `phone_required`, `email_required`, `phone_min_length`, `phone_max_length`, `order_place_account_verify`) VALUES
(1, 0, 'email', 1, 'email', NULL, NULL, 0, 1, '9', '16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `verify_otps`
--

CREATE TABLE `verify_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `created_at`, `updated_at`) VALUES
(2, 4, 0, '2025-08-14 20:57:08', '2025-08-14 20:57:08'),
(4, 1, 0, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(7, 4, 0, '2025-08-19 18:22:15', '2025-08-19 18:22:15'),
(14, 11, 0, '2025-08-23 17:32:52', '2025-08-23 17:32:52'),
(15, 12, 0, '2025-08-25 13:31:24', '2025-08-25 13:31:24'),
(16, 13, 0, '2025-08-26 04:19:56', '2025-08-26 04:19:56'),
(17, 14, 0, '2025-08-26 14:14:07', '2025-08-26 14:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `contact_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `withdraw_method` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `admin_coupons`
--
ALTER TABLE `admin_coupons`
  ADD KEY `admin_coupons_coupon_id_foreign` (`coupon_id`),
  ADD KEY `admin_coupons_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_media_id_foreign` (`media_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_media_id_foreign` (`media_id`),
  ADD KEY `banners_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_foreign` (`user_id`),
  ADD KEY `blogs_media_id_foreign` (`media_id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD KEY `blog_tags_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_views_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_media_id_foreign` (`media_id`),
  ADD KEY `brands_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_customer_id_foreign` (`customer_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_media_id_foreign` (`media_id`);

--
-- Indexes for table `category_subcategories`
--
ALTER TABLE `category_subcategories`
  ADD KEY `category_subcategories_category_id_foreign` (`category_id`),
  ADD KEY `category_subcategories_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `colors_shop_id_foreign` (`shop_id`);

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `coupon_collects`
--
ALTER TABLE `coupon_collects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_collects_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_collects_user_id_foreign` (`user_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_keys`
--
ALTER TABLE `device_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_user_id_foreign` (`user_id`);

--
-- Indexes for table `driver_orders`
--
ALTER TABLE `driver_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_orders_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_customer_id_foreign` (`customer_id`),
  ADD KEY `favorites_product_id_foreign` (`product_id`);

--
-- Indexes for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sales_media_id_foreign` (`media_id`);

--
-- Indexes for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  ADD KEY `flash_sale_products_flash_sale_id_foreign` (`flash_sale_id`),
  ADD KEY `flash_sale_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_items`
--
ALTER TABLE `footer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_items_footer_id_foreign` (`footer_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `generate_settings`
--
ALTER TABLE `generate_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `generate_settings_logo_id_foreign` (`logo_id`),
  ADD KEY `generate_settings_favicon_id_foreign` (`favicon_id`),
  ADD KEY `generate_settings_footer_logo_id_foreign` (`footer_logo_id`),
  ADD KEY `generate_settings_footer_qrcode_id_foreign` (`footer_qrcode_id`),
  ADD KEY `generate_settings_app_logo_id_foreign` (`app_logo_id`),
  ADD KEY `generate_settings_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `google_re_captchas`
--
ALTER TABLE `google_re_captchas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_orders`
--
ALTER TABLE `guest_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_order_items`
--
ALTER TABLE `guest_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_order_items_guest_order_id_foreign` (`guest_order_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legal_pages`
--
ALTER TABLE `legal_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_shop_id_foreign` (`shop_id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_withdraw_id_foreign` (`withdraw_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_shop_id_foreign` (`shop_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD KEY `order_payments_order_id_foreign` (`order_id`),
  ADD KEY `order_payments_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_vat_taxes`
--
ALTER TABLE `order_vat_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_vat_taxes_order_id_foreign` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateways_media_id_foreign` (`media_id`);

--
-- Indexes for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_payments_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos_carts`
--
ALTER TABLE `pos_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_carts_shop_id_foreign` (`shop_id`),
  ADD KEY `pos_carts_user_id_foreign` (`user_id`),
  ADD KEY `pos_carts_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `pos_cart_products`
--
ALTER TABLE `pos_cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_cart_products_pos_cart_id_foreign` (`pos_cart_id`),
  ADD KEY `pos_cart_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_shop_id_foreign` (`shop_id`),
  ADD KEY `products_media_id_foreign` (`media_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`),
  ADD KEY `products_video_id_foreign` (`video_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD KEY `product_colors_product_id_foreign` (`product_id`),
  ADD KEY `product_colors_color_id_foreign` (`color_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD KEY `product_sizes_product_id_foreign` (`product_id`),
  ADD KEY `product_sizes_size_id_foreign` (`size_id`);

--
-- Indexes for table `product_subcategories`
--
ALTER TABLE `product_subcategories`
  ADD KEY `product_subcategories_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `product_subcategories_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_thumbnails`
--
ALTER TABLE `product_thumbnails`
  ADD KEY `product_thumbnails_product_id_foreign` (`product_id`),
  ADD KEY `product_thumbnails_media_id_foreign` (`media_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_translations_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD KEY `product_units_product_id_foreign` (`product_id`),
  ADD KEY `product_units_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `product_vat_taxes`
--
ALTER TABLE `product_vat_taxes`
  ADD KEY `product_vat_taxes_product_id_foreign` (`product_id`),
  ADD KEY `product_vat_taxes_vat_tax_id_foreign` (`vat_tax_id`);

--
-- Indexes for table `recent_views`
--
ALTER TABLE `recent_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recent_views_product_id_foreign` (`product_id`),
  ADD KEY `recent_views_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_customer_id_foreign` (`customer_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_shop_id_foreign` (`shop_id`),
  ADD KEY `reviews_order_id_foreign` (`order_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_user_id_foreign` (`user_id`),
  ADD KEY `shops_logo_id_foreign` (`logo_id`),
  ADD KEY `shops_banner_id_foreign` (`banner_id`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD KEY `shop_categories_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `shop_subscriptions`
--
ALTER TABLE `shop_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_subscriptions_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_subscriptions_plan_id_foreign` (`plan_id`),
  ADD KEY `shop_subscriptions_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_user_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_user_user_id_foreign` (`user_id`),
  ADD KEY `shop_user_product_id_foreign` (`product_id`);

--
-- Indexes for table `shop_user_chats`
--
ALTER TABLE `shop_user_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_user_chats_shop_user_id_foreign` (`shop_user_id`),
  ADD KEY `shop_user_chats_product_id_foreign` (`product_id`),
  ADD KEY `shop_user_chats_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_user_chats_user_id_foreign` (`user_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sizes_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `social_auths`
--
ALTER TABLE `social_auths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_media_id_foreign` (`media_id`),
  ADD KEY `sub_categories_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supports_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_attachments_support_ticket_id_foreign` (`support_ticket_id`),
  ADD KEY `support_ticket_attachments_media_id_foreign` (`media_id`);

--
-- Indexes for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_messages_support_ticket_id_foreign` (`support_ticket_id`),
  ADD KEY `support_ticket_messages_sender_id_foreign` (`sender_id`);

--
-- Indexes for table `s_m_s_configs`
--
ALTER TABLE `s_m_s_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_colors`
--
ALTER TABLE `theme_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_issue_types`
--
ALTER TABLE `ticket_issue_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `translate_utilities`
--
ALTER TABLE `translate_utilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translate_utilities_category_id_foreign` (`category_id`),
  ADD KEY `translate_utilities_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `translate_utilities_brand_id_foreign` (`brand_id`),
  ADD KEY `translate_utilities_color_id_foreign` (`color_id`),
  ADD KEY `translate_utilities_size_id_foreign` (`size_id`),
  ADD KEY `translate_utilities_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_media_id_foreign` (`media_id`),
  ADD KEY `users_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `user_non_permissions`
--
ALTER TABLE `user_non_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_non_permissions_user_id_foreign` (`user_id`);

--
-- Indexes for table `vat_taxes`
--
ALTER TABLE `vat_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_manages`
--
ALTER TABLE `verify_manages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_otps`
--
ALTER TABLE `verify_otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_user_id_foreign` (`user_id`),
  ADD KEY `withdraws_shop_id_foreign` (`shop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_views`
--
ALTER TABLE `blog_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon_collects`
--
ALTER TABLE `coupon_collects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_keys`
--
ALTER TABLE `device_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_orders`
--
ALTER TABLE `driver_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `footer_items`
--
ALTER TABLE `footer_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generate_settings`
--
ALTER TABLE `generate_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `google_re_captchas`
--
ALTER TABLE `google_re_captchas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest_orders`
--
ALTER TABLE `guest_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest_order_items`
--
ALTER TABLE `guest_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `legal_pages`
--
ALTER TABLE `legal_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_vat_taxes`
--
ALTER TABLE `order_vat_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pos_carts`
--
ALTER TABLE `pos_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pos_cart_products`
--
ALTER TABLE `pos_cart_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recent_views`
--
ALTER TABLE `recent_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_subscriptions`
--
ALTER TABLE `shop_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_user_chats`
--
ALTER TABLE `shop_user_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `social_auths`
--
ALTER TABLE `social_auths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `s_m_s_configs`
--
ALTER TABLE `s_m_s_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_colors`
--
ALTER TABLE `theme_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_issue_types`
--
ALTER TABLE `ticket_issue_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translate_utilities`
--
ALTER TABLE `translate_utilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_non_permissions`
--
ALTER TABLE `user_non_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vat_taxes`
--
ALTER TABLE `vat_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verify_manages`
--
ALTER TABLE `verify_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `verify_otps`
--
ALTER TABLE `verify_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_coupons`
--
ALTER TABLE `admin_coupons`
  ADD CONSTRAINT `admin_coupons_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_coupons_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `blogs_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_views`
--
ALTER TABLE `blog_views`
  ADD CONSTRAINT `blog_views_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `brands_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `category_subcategories`
--
ALTER TABLE `category_subcategories`
  ADD CONSTRAINT `category_subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_subcategories_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `colors_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_collects`
--
ALTER TABLE `coupon_collects`
  ADD CONSTRAINT `coupon_collects_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_collects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `device_keys`
--
ALTER TABLE `device_keys`
  ADD CONSTRAINT `device_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_orders`
--
ALTER TABLE `driver_orders`
  ADD CONSTRAINT `driver_orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD CONSTRAINT `flash_sales_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `flash_sale_products`
--
ALTER TABLE `flash_sale_products`
  ADD CONSTRAINT `flash_sale_products_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flash_sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `footer_items`
--
ALTER TABLE `footer_items`
  ADD CONSTRAINT `footer_items_footer_id_foreign` FOREIGN KEY (`footer_id`) REFERENCES `footers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `generate_settings`
--
ALTER TABLE `generate_settings`
  ADD CONSTRAINT `generate_settings_app_logo_id_foreign` FOREIGN KEY (`app_logo_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `generate_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `generate_settings_favicon_id_foreign` FOREIGN KEY (`favicon_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `generate_settings_footer_logo_id_foreign` FOREIGN KEY (`footer_logo_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `generate_settings_footer_qrcode_id_foreign` FOREIGN KEY (`footer_qrcode_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `generate_settings_logo_id_foreign` FOREIGN KEY (`logo_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `guest_order_items`
--
ALTER TABLE `guest_order_items`
  ADD CONSTRAINT `guest_order_items_guest_order_id_foreign` FOREIGN KEY (`guest_order_id`) REFERENCES `guest_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `withdraws` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD CONSTRAINT `order_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_payments_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_vat_taxes`
--
ALTER TABLE `order_vat_taxes`
  ADD CONSTRAINT `order_vat_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD CONSTRAINT `payment_gateways_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD CONSTRAINT `paypal_payments_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_carts`
--
ALTER TABLE `pos_carts`
  ADD CONSTRAINT `pos_carts_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_carts_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pos_cart_products`
--
ALTER TABLE `pos_cart_products`
  ADD CONSTRAINT `pos_cart_products_pos_cart_id_foreign` FOREIGN KEY (`pos_cart_id`) REFERENCES `pos_carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_cart_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_sizes_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_subcategories`
--
ALTER TABLE `product_subcategories`
  ADD CONSTRAINT `product_subcategories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_subcategories_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_thumbnails`
--
ALTER TABLE `product_thumbnails`
  ADD CONSTRAINT `product_thumbnails_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_thumbnails_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_units`
--
ALTER TABLE `product_units`
  ADD CONSTRAINT `product_units_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_units_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_vat_taxes`
--
ALTER TABLE `product_vat_taxes`
  ADD CONSTRAINT `product_vat_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_vat_taxes_vat_tax_id_foreign` FOREIGN KEY (`vat_tax_id`) REFERENCES `vat_taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recent_views`
--
ALTER TABLE `recent_views`
  ADD CONSTRAINT `recent_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recent_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shops_logo_id_foreign` FOREIGN KEY (`logo_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD CONSTRAINT `shop_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_categories_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_subscriptions`
--
ALTER TABLE `shop_subscriptions`
  ADD CONSTRAINT `shop_subscriptions_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `shop_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shop_subscriptions_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD CONSTRAINT `shop_user_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_user_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_user_chats`
--
ALTER TABLE `shop_user_chats`
  ADD CONSTRAINT `shop_user_chats_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_user_chats_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_user_chats_shop_user_id_foreign` FOREIGN KEY (`shop_user_id`) REFERENCES `shop_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_user_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sub_categories_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `supports_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  ADD CONSTRAINT `support_ticket_attachments_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_ticket_attachments_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD CONSTRAINT `support_ticket_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_ticket_messages_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `translate_utilities`
--
ALTER TABLE `translate_utilities`
  ADD CONSTRAINT `translate_utilities_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `translate_utilities_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `translate_utilities_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `translate_utilities_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `translate_utilities_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `translate_utilities_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_non_permissions`
--
ALTER TABLE `user_non_permissions`
  ADD CONSTRAINT `user_non_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `withdraws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
