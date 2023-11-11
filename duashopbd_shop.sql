-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2023 at 08:37 AM
-- Server version: 10.6.15-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duashopbd_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'admin', '01571118839', 1, 'def.png', 'admin@gmail.com', NULL, '$2y$10$qpK9P.ZDLs73UnKq2IHqVepurl7B6AvM7rQd0Ijg9KxtPs5EdNfC.', 'XwNLFmHiRxGwrZrH97pGQka0rpCh5CruWtmfHd5UG5sZeVtGOP8Shz69CL2a', '2022-09-03 19:41:55', '2022-09-03 19:41:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00),
(2, 1, 0, 0, '2022-09-03 19:41:55', '2022-09-03 19:41:55', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(1, '2022-09-04-63141fc519336.png', 'Main Banner', 1, '2022-09-04 03:47:17', '2022-09-04 03:48:20', 'http://localhost/multi/product/quartz-wrist-watch-waterproof-watch-for-men-and-women-Ge68V6', 'product', 1),
(2, '2022-09-04-63141fd96af4d.png', 'Main Banner', 1, '2022-09-04 03:47:37', '2022-09-04 03:48:19', 'http://localhost/multi/product/quartz-wrist-watch-waterproof-watch-for-men-and-women-Ge68V6', 'product', 1),
(3, '2022-09-28-63348746a3795.png', 'Top Banner', 1, '2022-09-28 11:41:26', '2022-09-28 11:41:37', 'http://localhost/shahin_6vally/', 'product', 2),
(4, '2022-09-28-63348772a1f3a.png', 'Top Banner', 1, '2022-09-28 11:42:10', '2022-09-28 11:42:10', 'aaa', 'product', 2),
(5, '2022-10-11-63454d1c4d0ce.png', 'Main Banner', 1, '2022-10-11 05:01:48', '2022-10-11 05:01:54', 'http://blog.appllys.com/product/odette-harrison-wl8jn4', 'product', 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Casio', '2022-09-04-63141dd935923.png', 1, '2022-09-04 03:39:05', '2022-09-04 03:39:05'),
(2, 'Smartphone', '2022-09-04-63141f42ee50a.png', 1, '2022-09-04 03:45:06', '2022-09-04 03:45:06'),
(3, 'Laptop', '2022-09-04-63141f571aba7.png', 1, '2022-09-04 03:45:27', '2022-09-04 03:45:27'),
(4, 'পথিক প্রকাশন', '2022-12-29-63ad8ee6ad478.png', 1, '2022-09-04 03:46:12', '2022-12-29 13:00:21'),
(5, 'Khan publisher', '2022-09-04-631467347f26e.png', 1, '2022-09-04 02:52:04', '2022-09-04 02:52:04'),
(6, 'Ruhama Publication', '2022-12-29-63adbb54e0e1d.png', 1, '2022-12-29 16:07:48', '2022-12-29 16:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '2', '2020-10-11 07:43:44', '2022-09-03 22:51:14'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true},{\"id\":2,\"name\":\"Bengali\",\"direction\":\"ltr\",\"code\":\"bd\",\"status\":1,\"default\":false}]', '2020-10-11 07:53:02', '2022-09-04 04:39:02'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2022-08-03 06:14:35'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2022-08-03 06:14:35'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '000000000', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Dua Shop', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-10-11-63454cd14013d.png', NULL, '2022-10-11 05:00:33'),
(13, 'company_mobile_logo', '2022-10-11-63454cd1586ef.png', NULL, '2022-10-11 05:00:33'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<h1><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; We are coming soon</strong></h1>', NULL, '2022-09-03 23:34:34'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'Copy@6amtech.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#1b7fed\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2022-10-11 06:03:33'),
(19, 'company_footer_logo', '2022-09-04-63142bd32aa8b.png', NULL, '2022-09-04 04:38:43'),
(20, 'company_copyright_text', 'DuaShop@2022', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"0\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2022-09-04 04:46:34'),
(22, 'download_app_google_stroe', '{\"status\":\"0\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2022-09-04 04:46:40'),
(23, 'company_fav_icon', '2021-03-02-603df1634614f.png', '2020-10-11 13:53:02', '2021-03-02 14:03:48'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"bd\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"847723391212-fuh9urtcrdu7esb26ingq05nesfc4imk.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":\"1\"},{\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":\"1\"}]', NULL, '2022-09-05 09:35:14'),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'BD', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-08-03 06:14:35'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#000000\",\"text_color\":\"#000000\",\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-08-03 06:14:35'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'Dhaka', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '0', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'timezone', 'UTC', NULL, NULL),
(84, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(5, 2, '2-0xZHe-1668680742', 2, NULL, '[]', '[]', '', 1, 400, 0, 20, 'dz-iuth-rfsOuF', 'দ্য ইউথ', '2022-09-04-631468200e218.png', 1, 'admin', '2022-11-17 04:25:42', '2022-11-17 04:25:42', 'Dua Shop', 0.00, 'order_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(2, 'Bag & Shoes', 'bag-shoes', '2022-09-04-6314204aa12bf.png', 0, 0, '2022-09-04 03:49:30', '2022-09-04 03:50:11', 1, 0),
(3, 'Men Fashion', 'men-fashion', '2022-09-04-6314206ddcada.png', 0, 0, '2022-09-04 03:50:05', '2022-09-04 02:57:31', 1, 0),
(4, 'সকল বই', 'skl-bi', '2022-09-04-6314669156e8b.png', 0, 0, '2022-09-04 02:47:47', '2022-09-04 02:57:12', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(1, 'Nicolassar', 'yasen.krasen.13+79757@mail.ru', '87328859133', 'Moodwihfieokdwji jiwkdowjfeiufgijdowfjweu hifejfiwqjhfoedjakdijeoif hiwjd', 'Ufieuhdidhefh wjdwdjqwidjwefhwfakj oijofqwfbvsdfjfwej ijwqiofjewuhfwedjawdhewh ouhwidwjpouweiofeiouqwruio ioqwiwuifewifjfifhw jiwfjiewhfewgiewufewio duashopbd.com', 0, '0', '2023-06-09 19:23:54', '2023-06-09 19:23:54', NULL),
(2, 'Larrybow', 'cathy@totalprojectgroup.com.au', '86456875943', 'Experience a New Level of Financial Success: $1000 a Day on Google', 'Your Shortcut to Financial Success: $1000 a Day on Google, No Experience http://startuphustle.lottovip888.xyz/onlineincome', 0, '0', '2023-07-12 12:06:54', '2023-07-12 12:06:54', NULL),
(3, 'Larrybow', 'cathy@totalprojectgroup.com.au', '88851717813', 'Experience a New Level of Financial Success: $1000 a Day on Google', 'Your Shortcut to Financial Success: $1000 a Day on Google, No Experience http://startuphustle.lottovip888.xyz/onlineincome', 0, '0', '2023-07-12 12:06:56', '2023-07-12 12:06:56', NULL),
(4, 'Larrybow', 'cathy@totalprojectgroup.com.au', '88245918717', 'Experience a New Level of Financial Success: $1000 a Day on Google', 'Your Shortcut to Financial Success: $1000 a Day on Google, No Experience http://startuphustle.lottovip888.xyz/onlineincome', 0, '0', '2023-07-12 12:06:58', '2023-07-12 12:06:58', NULL),
(5, 'WilbertNug', 'chadzilla7929@yahoo.com', '81527476552', 'SALE. HURRY UP TO BUY A BITCOIN WALLET WITH 12600 BTC ON YOUR BALANCE - 3 DAYS LEFT', 'BUY BITCOIN WALLET WITH 12600 BTC IN YOUR ACCOUNT - 3 DAYS LEFT http://hunt12600BTCnow.plaqadiip.com/quick12600BTC', 0, '0', '2023-07-22 16:06:44', '2023-07-22 16:06:44', NULL),
(6, 'WilbertNug', 'chadzilla7929@yahoo.com', '85571437582', 'SALE. HURRY UP TO BUY A BITCOIN WALLET WITH 12600 BTC ON YOUR BALANCE - 3 DAYS LEFT', 'BUY BITCOIN WALLET WITH 12600 BTC IN YOUR ACCOUNT - 3 DAYS LEFT http://hunt12600BTCnow.plaqadiip.com/quick12600BTC', 0, '0', '2023-07-22 16:06:46', '2023-07-22 16:06:46', NULL),
(7, 'WilbertNug', 'chadzilla7929@yahoo.com', '89723387293', 'SALE. HURRY UP TO BUY A BITCOIN WALLET WITH 12600 BTC ON YOUR BALANCE - 3 DAYS LEFT', 'BUY BITCOIN WALLET WITH 12600 BTC IN YOUR ACCOUNT - 3 DAYS LEFT http://hunt12600BTCnow.plaqadiip.com/quick12600BTC', 0, '0', '2023-07-22 16:06:48', '2023-07-22 16:06:48', NULL),
(8, 'WilbertNug', 'chadzilla7929@yahoo.com', '83656565731', 'SALE. HURRY UP TO BUY A BITCOIN WALLET WITH 12600 BTC ON YOUR BALANCE - 3 DAYS LEFT', 'BUY BITCOIN WALLET WITH 12600 BTC IN YOUR ACCOUNT - 3 DAYS LEFT http://hunt12600BTCnow.plaqadiip.com/quick12600BTC', 0, '0', '2023-07-22 16:06:51', '2023-07-22 16:06:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 0, NULL, '2022-09-03 22:52:02'),
(2, 'BDT', '৳', 'BDT', '84', 1, NULL, '2021-07-06 11:52:58'),
(3, 'Indian Rupi', '₹', 'INR', '60', 0, '2020-10-15 17:23:04', '2022-09-03 22:51:56'),
(4, 'Euro', '€', 'EUR', '100', 0, '2021-05-25 21:00:23', '2022-09-03 22:52:03'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 22:08:31', '2022-09-03 22:52:10'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 0, '2021-07-03 11:08:33', '2022-09-03 22:52:15'),
(7, 'Rand', 'R', 'ZAR', '14.26', 0, '2021-07-03 11:12:38', '2022-09-03 22:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'Month End', '2022-09-04', '2023-09-05', 1, 0, NULL, NULL, 'def.png', 'month-end', '2022-09-04 04:12:34', '2022-09-04 04:13:07', NULL, 'flash_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0.00, NULL, '2022-09-04 04:12:51', '2022-09-04 04:12:51'),
(2, 1, 1, 0.00, NULL, '2022-09-04 04:12:56', '2022-09-04 04:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `customer_delivery_date` date DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `customer_delivery_date`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1525, '1', '2022-11-17 04:12:56', '2022-12-29 11:04:50', 0, NULL, '0', 2, 5.00, '1785-miG2g-1668679975', '191575', 1, 'admin', '{\"id\":1,\"customer_id\":0,\"contact_person_name\":\"Yael Pickett\",\"address_type\":\"permanent\",\"address\":\"Quis tempora corrupt\",\"city\":\"Sunt dolore dolore m\",\"zip\":\"46291\",\"phone\":\"+1 (799) 851-2069\",\"created_at\":\"2022-11-17T10:06:13.000000Z\",\"updated_at\":\"2022-11-17T10:06:13.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 'dsfasdf', NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 405, '2', '2022-11-17 04:18:36', '2022-12-29 11:04:50', 0, NULL, '0', 2, 5.00, '9111-rO0yD-1668680316', '203032', 1, 'admin', '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Nola Middleton\",\"address_type\":\"home\",\"address\":\"Hic vel ex occaecat \",\"city\":\"Sunt omnis nostrum m\",\"zip\":\"68117\",\"phone\":\"+1 (139) 616-5565\",\"created_at\":\"2022-11-17T10:18:27.000000Z\",\"updated_at\":\"2022-11-17T10:18:27.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, '2022-11-17', NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 2, 1, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u09a6\\u09cd\\u09af \\u0987\\u0989\\u09a5\",\"slug\":\"dz-iuth-rfsOuF\",\"file\":null,\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":5,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-09-04-631468200aa5f.png\\\",\\\"2022-09-04-631468200dbc4.png\\\"]\",\"thumbnail\":\"2022-09-04-631468200e218.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":400,\"purchase_price\":380,\"tax\":0,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"flat\",\"current_stock\":11,\"minimum_order_qty\":1,\"details\":\"<p>\\u09b2\\u09c7\\u0996\\u0995 :&nbsp;<a href=\\\"https:\\/\\/www.wafilife.com\\/cat\\/books\\/author\\/%e0%a6%b8%e0%a7%8d%e0%a6%ac%e0%a6%aa%e0%a7%8d%e0%a6%a8%e0%a6%9a%e0%a6%be%e0%a6%b0%e0%a7%80-%e0%a6%9f%e0%a6%bf%e0%a6%ae\\/\\\">\\u09b8\\u09cd\\u09ac\\u09aa\\u09cd\\u09a8\\u099a\\u09be\\u09b0\\u09c0 \\u099f\\u09bf\\u09ae<\\/a><\\/p>\\r\\n\\r\\n<p>\\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6\\u09a8\\u09c0 :&nbsp;<a href=\\\"https:\\/\\/www.wafilife.com\\/cat\\/books\\/publisher\\/%e0%a6%a8%e0%a6%bf%e0%a7%9f%e0%a6%a8-%e0%a6%aa%e0%a6%be%e0%a6%ac%e0%a6%b2%e0%a6%bf%e0%a6%95%e0%a7%87%e0%a6%b6%e0%a6%a8\\/\\\">\\u09a8\\u09bf\\u09df\\u09a8 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995\\u09c7\\u09b6\\u09a8<\\/a><\\/p>\\r\\n\\r\\n<p>\\u09ac\\u09bf\\u09b7\\u09af\\u09bc :&nbsp;<a href=\\\"https:\\/\\/www.wafilife.com\\/cat\\/books\\/subject\\/ibadat-attoshuddhi-o-onuprerona\\/\\\">\\u0986\\u09a4\\u09cd\\u09ae\\u09b6\\u09c1\\u09a6\\u09cd\\u09a7\\u09bf \\u0993 \\u0985\\u09a8\\u09c1\\u09aa\\u09cd\\u09b0\\u09c7\\u09b0\\u09a3\\u09be<\\/a><\\/p>\\r\\n\\r\\n<p>\\u0995\\u09ad\\u09be\\u09b0 : \\u09aa\\u09c7\\u09aa\\u09be\\u09b0 \\u09ac\\u09cd\\u09af\\u09be\\u0995, \\u09b8\\u0982\\u09b8\\u09cd\\u0995\\u09b0\\u09a3 : 1st Published, 2022<\\/p>\\r\\n\\r\\n<p>\\u09af\\u09c1\\u09ac \\u09b8\\u09ae\\u09be\\u099c\\u09c7\\u09b0 \\u09af\\u09a4 \\u0995\\u09cd\\u09b7\\u09df \\u0986\\u09b0 \\u09a4\\u09be \\u09aa\\u09c2\\u09b0\\u09a8\\u09c7\\u09b0 \\u09af\\u09a4 \\u0989\\u09aa\\u09be\\u09df&mdash;\\u09a4\\u09be \\u09a8\\u09bf\\u09df\\u09c7\\u0987 \\u09a6\\u09cd\\u09af \\u0987\\u0989\\u09a5\\u0964 \\u098f\\u0995\\u099d\\u09be\\u0981\\u0995 \\u09a4\\u09b0\\u09c1\\u09a3 \\u09b2\\u09c7\\u0996\\u0995 \\u09b0\\u09df\\u09c7\\u099b\\u09c7\\u09a8 \\u098f\\u0996\\u09be\\u09a8\\u09c7\\u0964 \\u09b0\\u09df\\u09c7\\u099b\\u09c7\\u09a8 \\u09aa\\u09b0\\u09bf\\u099a\\u09bf\\u09a4 \\u09ae\\u09c1\\u0996 \\u09ae\\u09c1\\u09b9\\u09a4\\u09be\\u09b0\\u09be\\u09ae \\u09a8\\u09be\\u099c\\u09ae\\u09c1\\u09b2 \\u0987\\u09b8\\u09b2\\u09be\\u09ae \\u0995\\u09be\\u09b8\\u09c7\\u09ae\\u09c0\\u0993! \\u09af\\u09be\\u09b0\\u09be \\u09af\\u09c1\\u09ac\\u09b8\\u09ae\\u09be\\u099c\\u09c7\\u09b0 \\u0995\\u09cd\\u09b0\\u09ae\\u09ac\\u09b0\\u09cd\\u09a7\\u09ae\\u09be\\u09a8 \\u0985\\u09ac\\u0995\\u09cd\\u09b7\\u09df<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-04T08:56:00.000000Z\",\"updated_at\":\"2022-09-04T08:56:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"\\u09a6\\u09cd\\u09af \\u0987\\u0989\\u09a5\",\"meta_description\":\"\\u09b2\\u09c7\\u0996\\u0995 : \\u09b8\\u09cd\\u09ac\\u09aa\\u09cd\\u09a8\\u099a\\u09be\\u09b0\\u09c0 \\u099f\\u09bf\\u09ae\\r\\n\\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6\\u09a8\\u09c0 : \\u09a8\\u09bf\\u09df\\u09a8 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995\\u09c7\\u09b6\\u09a8\\r\\n\\u09ac\\u09bf\\u09b7\\u09af\\u09bc : \\u0986\\u09a4\\u09cd\\u09ae\\u09b6\\u09c1\\u09a6\\u09cd\\u09a7\\u09bf \\u0993 \\u0985\\u09a8\\u09c1\\u09aa\\u09cd\\u09b0\\u09c7\\u09b0\\u09a3\\u09be\\r\\n\\u0995\\u09ad\\u09be\\u09b0 : \\u09aa\\u09c7\\u09aa\\u09be\\u09b0 \\u09ac\\u09cd\\u09af\\u09be\\u0995, \\u09b8\\u0982\\u09b8\\u09cd\\u0995\\u09b0\\u09a3 : 1st Published, 2022\\r\\n\\u09af\\u09c1\\u09ac \\u09b8\\u09ae\\u09be\\u099c\\u09c7\\u09b0 \\u09af\\u09a4 \\u0995\\u09cd\\u09b7\\u09df \\u0986\\u09b0 \\u09a4\\u09be \\u09aa\\u09c2\\u09b0\\u09a8\\u09c7\\u09b0 \\u09af\\u09a4 \\u0989\\u09aa\\u09be\\u09df\\u2014\\u09a4\\u09be \\u09a8\\u09bf\\u09df\\u09c7\\u0987 \\u09a6\\u09cd\\u09af \\u0987\\u0989\\u09a5\\u0964\",\"meta_image\":\"2022-09-04-631468200e8e2.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":120,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"465789\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 4, 400, 0, 80, 'pending', 'unpaid', '2022-11-17 04:12:56', '2022-11-17 04:12:56', NULL, '', '[]', 'discount_on_product', 1, 0),
(2, 100002, 1, 1, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Quartz wrist watch waterproof watch for Men and Women\",\"slug\":\"quartz-wrist-watch-waterproof-watch-for-men-and-women-Ge68V6\",\"file\":null,\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-09-04-63141ec8cc5d9.png\\\",\\\"2022-09-04-63141ec8ce95d.png\\\"]\",\"thumbnail\":\"2022-09-04-63141ec8cf9eb.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":400,\"purchase_price\":350,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<h3>Specifications of OLEVS 5563 Quartz wrist watch waterproof watch for Men and Women<\\/h3>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Brand - OLEVS<\\/li>\\r\\n\\t<li>SKU - 183922704_BD-1128752672<\\/li>\\r\\n\\t<li>Strap Material - Alloy<\\/li>\\r\\n\\t<li>Model - 5563<\\/li>\\r\\n\\t<li>Dial Size -40mm<\\/li>\\r\\n\\t<li>Watch Type - Analouge<\\/li>\\r\\n\\t<li>Movement - Japanese Quartz<\\/li>\\r\\n\\t<li>Watch Movement Country - China<\\/li>\\r\\n\\t<li>Watch&#39;s Water Resistance - 300m<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p>85% Polyester and 15% Spandex Fabric<\\/p>\\r\\n\\r\\n<p>&radic;\\u3010Size\\u3011our sofa slipcovers have 3 sizes. Chair slipcover measures up to 32in-47in wide (80-120cm), Loveseat slipcover measures up to 57in-70in wide (145-180cm), Sofia slipcover measures up to 72in-92in (185-235cm). PLEASE measure your sofa before choosing our sofa slipcovers.<\\/p>\\r\\n\\r\\n<p>&radic;\\u3010Fabric\\u3011: Our Stretchable Sofa Slipcovers Which Are Made of 85% Polyester and 15% Spandex Fabric, Are Suitable for 90% Sofas.the Great Elasticity Could Fit Your Sofa More Perfect and Cover Sofa in Ever Edge. and Unique Dyeing Technolog Keeps Your Sofa Slipcovers Not Fade. Please Note : Our Sofa Slipcovers Are Not Water-proof.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-09-04T09:43:04.000000Z\",\"updated_at\":\"2022-09-04T09:43:21.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Quartz wrist watch waterproof watch for Men and Women\",\"meta_description\":\"Specifications of OLEVS 5563 Quartz wrist watch waterproof watch for Men and Women\\r\\nBrand - OLEVS\\r\\nSKU - 183922704_BD-1128752672\\r\\nStrap Material - Alloy\\r\\nModel - 5563\\r\\nDial Size -40mm\\r\\nWatch \",\"meta_image\":\"2022-09-04-63141ec8d07ed.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":10,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"4347566\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 400, 0, 0, 'pending', 'unpaid', '2022-11-17 04:18:37', '2022-11-17 04:18:37', NULL, '', '[]', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `images` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `file`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(1, 'admin', 1, 'Quartz wrist watch waterproof watch for Men and Women', 'quartz-wrist-watch-waterproof-watch-for-men-and-women-Ge68V6', NULL, '[{\"id\":\"1\",\"position\":1}]', 1, 'pc', 1, 1, '[\"2022-09-04-63141ec8cc5d9.png\",\"2022-09-04-63141ec8ce95d.png\"]', '2022-09-04-63141ec8cf9eb.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 400, 350, '0', 'percent', '0', 'flat', 9, 1, '<h3>Specifications of OLEVS 5563 Quartz wrist watch waterproof watch for Men and Women</h3>\r\n\r\n<ul>\r\n	<li>Brand - OLEVS</li>\r\n	<li>SKU - 183922704_BD-1128752672</li>\r\n	<li>Strap Material - Alloy</li>\r\n	<li>Model - 5563</li>\r\n	<li>Dial Size -40mm</li>\r\n	<li>Watch Type - Analouge</li>\r\n	<li>Movement - Japanese Quartz</li>\r\n	<li>Watch Movement Country - China</li>\r\n	<li>Watch&#39;s Water Resistance - 300m</li>\r\n</ul>\r\n\r\n<p>85% Polyester and 15% Spandex Fabric</p>\r\n\r\n<p>&radic;【Size】our sofa slipcovers have 3 sizes. Chair slipcover measures up to 32in-47in wide (80-120cm), Loveseat slipcover measures up to 57in-70in wide (145-180cm), Sofia slipcover measures up to 72in-92in (185-235cm). PLEASE measure your sofa before choosing our sofa slipcovers.</p>\r\n\r\n<p>&radic;【Fabric】: Our Stretchable Sofa Slipcovers Which Are Made of 85% Polyester and 15% Spandex Fabric, Are Suitable for 90% Sofas.the Great Elasticity Could Fit Your Sofa More Perfect and Cover Sofa in Ever Edge. and Unique Dyeing Technolog Keeps Your Sofa Slipcovers Not Fade. Please Note : Our Sofa Slipcovers Are Not Water-proof.</p>', 0, NULL, '2022-09-04 03:43:04', '2022-11-17 04:18:37', 1, 1, 'Quartz wrist watch waterproof watch for Men and Women', 'Specifications of OLEVS 5563 Quartz wrist watch waterproof watch for Men and Women\r\nBrand - OLEVS\r\nSKU - 183922704_BD-1128752672\r\nStrap Material - Alloy\r\nModel - 5563\r\nDial Size -40mm\r\nWatch ', '2022-09-04-63141ec8d07ed.png', 1, NULL, 10.00, 0, NULL, NULL, '4347566'),
(2, 'admin', 1, 'দ্য ইউথ', 'dz-iuth-rfsOuF', NULL, '[{\"id\":\"4\",\"position\":1}]', 5, 'pc', 1, 1, '[\"2022-09-04-631468200aa5f.png\",\"2022-09-04-631468200dbc4.png\"]', '2022-09-04-631468200e218.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 400, 380, '0', 'percent', '20', 'flat', 7, 1, '<p>লেখক :&nbsp;<a href=\"https://www.wafilife.com/cat/books/author/%e0%a6%b8%e0%a7%8d%e0%a6%ac%e0%a6%aa%e0%a7%8d%e0%a6%a8%e0%a6%9a%e0%a6%be%e0%a6%b0%e0%a7%80-%e0%a6%9f%e0%a6%bf%e0%a6%ae/\">স্বপ্নচারী টিম</a></p>\r\n\r\n<p>প্রকাশনী :&nbsp;<a href=\"https://www.wafilife.com/cat/books/publisher/%e0%a6%a8%e0%a6%bf%e0%a7%9f%e0%a6%a8-%e0%a6%aa%e0%a6%be%e0%a6%ac%e0%a6%b2%e0%a6%bf%e0%a6%95%e0%a7%87%e0%a6%b6%e0%a6%a8/\">নিয়ন পাবলিকেশন</a></p>\r\n\r\n<p>বিষয় :&nbsp;<a href=\"https://www.wafilife.com/cat/books/subject/ibadat-attoshuddhi-o-onuprerona/\">আত্মশুদ্ধি ও অনুপ্রেরণা</a></p>\r\n\r\n<p>কভার : পেপার ব্যাক, সংস্করণ : 1st Published, 2022</p>\r\n\r\n<p>যুব সমাজের যত ক্ষয় আর তা পূরনের যত উপায়&mdash;তা নিয়েই দ্য ইউথ। একঝাঁক তরুণ লেখক রয়েছেন এখানে। রয়েছেন পরিচিত মুখ মুহতারাম নাজমুল ইসলাম কাসেমীও! যারা যুবসমাজের ক্রমবর্ধমান অবক্ষয়</p>', 0, NULL, '2022-09-04 02:56:00', '2022-11-17 04:12:56', 1, 1, 'দ্য ইউথ', 'লেখক : স্বপ্নচারী টিম\r\nপ্রকাশনী : নিয়ন পাবলিকেশন\r\nবিষয় : আত্মশুদ্ধি ও অনুপ্রেরণা\r\nকভার : পেপার ব্যাক, সংস্করণ : 1st Published, 2022\r\nযুব সমাজের যত ক্ষয় আর তা পূরনের যত উপায়—তা নিয়েই দ্য ইউথ।', '2022-09-04-631468200e8e2.png', 1, NULL, 120.00, 0, NULL, NULL, '465789'),
(3, 'admin', 1, 'Odette Harrison', 'odette-harrison-wl8jn4', '633a2707699e1.pdf', '[{\"id\":\"3\",\"position\":1}]', 1, 'gms', 1, 1, '[\"2022-10-02-633a2429acea8.png\"]', '2022-10-11-63454b67ec45b.png', '1', NULL, 'youtube', 'Ex qui voluptatibus', '[]', 0, 'null', '[]', '[]', 0, 527, 514, '29', 'percent', '14', 'percent', 28, 276, NULL, 0, NULL, '2022-10-02 17:52:10', '2022-10-11 05:02:19', 1, 1, 'Recusandae Magna ne', 'Quo corporis aperiam', 'def.png', 1, NULL, 7.00, 0, NULL, NULL, '160557'),
(4, 'admin', 1, 'শামায়েলে তিরমিজি [নবিজি এমন ছিলেন] (দুই খণ্ড)', 'samayele-tirmiji-nbiji-emn-chilen-dui-khnd-qSUOuF', '63ad9bfa73e5b.pdf', '[{\"id\":\"4\",\"position\":1}]', 4, 'pc', 1, 1, '[\"2022-12-29-63ad961b1cb16.png\"]', '2022-12-29-63ad961b21475.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1100, 440, '0', 'percent', '50', 'percent', 10, 1, '<p>প্রকাশনী :&nbsp;<a href=\"https://duashopbd.com/products?id=4&amp;data_from=brand&amp;page=1\" target=\"_blank\">পথিক প্রকাশন</a></p>\r\n\r\n<p><strong>ব্যাখ্যাগ্রন্থটির বৈশিষ্ট্য</strong></p>\r\n\r\n<p>* সহজ সাবলীল ভাষায় এবং চমৎকার ঢঙে সাজানো হয়েছে।<br />\r\n* প্রতিটি আলোচনায় রেফারেন্স যুক্ত করা হয়েছে।<br />\r\n* ব্যাখ্যার ক্ষেত্রে ইমামগণের অভিমত উল্লেখ করা হয়েছে।<br />\r\n* পরস্পর বিপরীতমুখী বর্ণনাগুলোর নিরসনে ইমামগণের অভিমত ব্যক্ত করা হয়েছে এবং পরস্পর বৈপরীত্যের চমৎকার সমন্বয় ও সমাধান দেওয়া হয়েছে।<br />\r\n* হাদিসের শিক্ষা,&nbsp;সূক্ষ্মদর্শন ও আহকাম বর্ণনা করা হয়েছে।<br />\r\n* শব্দের আভিধানিক অর্থ উল্লেখ করা হয়েছে,&nbsp;ইমামগণ কী অর্থ বর্ণনা করেছেন সেটা ব্যক্ত করা হয়েছে,&nbsp;পাশাপাশি এখানে কী উদ্দেশ্য সেটা বর্ণনা করা হয়েছে।<br />\r\n* কোনো কোনো জায়গায় রাবিদের পরিচয় তুলে ধরা হয়েছে।<br />\r\n* প্রয়োজন অনুসারে হাদিসের শাস্ত্রীয় বিষয়ে আলোচনা করা হয়েছে।<br />\r\n* হাদিসের তাখরিজ উল্লেখ করা হয়েছে।<br />\r\n* প্রয়োজনবোধে ইরাব নিয়ে আলোচনা করা হয়েছে।<br />\r\n* ব্যাখ্যার ক্ষেত্রে মধ্যম পন্থা অবলম্বন করা হয়েছে। এ ছাড়াও বহু চমৎকার ও আকর্ষণীয় বিষয় গ্রন্থটিতে রয়েছে।</p>', 0, NULL, '2022-12-29 13:28:59', '2022-12-29 13:54:02', 1, 1, 'Samaele tirmizi, pothik prokason, pothik prokasoni, পথিক প্রকাশনী ,শামায়েলে তিরমিজি, শামায়েলে তিরমিযি, শামায়েলে তিরমিজি, মুহাম্মাদ সালেহ আল মুনাজ্জিদ,  ইমাম আবু ঈসা আত তিরমিযী (রহঃ) আবু ঈসা আ', 'Samaele tirmizi \r\npothik publication\r\npothik prokasoni\r\npothik prokason\r\nপথিক প্রকাশনী\r\nশামায়েলে তিরমিজি\r\nশামায়েলে তিরমিযি,\r\nশামায়েলে তিরমিজি', '2022-12-29-63ad961b226ee.png', 1, NULL, 50.00, 0, NULL, NULL, '172641'),
(5, 'admin', 1, 'যেভাবে স্ত্রীর হৃদয় জয় করবেন', 'zevabe-streer-hrridy-jy-krben-z6bbQl', NULL, '[{\"id\":\"4\",\"position\":1}]', 4, 'pc', 1, 1, '[\"2022-12-29-63adb93ff1a05.png\"]', '2022-12-29-63adb93ff3a78.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 200, 80, '0', 'percent', '42', 'percent', 15, 1, '<p>লেখক :&nbsp;<a href=\"https://www.wafilife.com/cat/books/author/%e0%a6%b6%e0%a6%be%e0%a6%87%e0%a6%96-%e0%a6%87%e0%a6%ac%e0%a6%b0%e0%a6%be%e0%a6%b9%e0%a6%bf%e0%a6%ae-%e0%a6%87%e0%a6%ac%e0%a6%a8%e0%a7%81-%e0%a6%b8%e0%a6%be%e0%a6%b2%e0%a7%87%e0%a6%b9-%e0%a6%86/\">শাইখ ইবরাহিম ইবনু সালেহ আল মাহমুদ</a></p>\r\n\r\n<p>প্রকাশনী :&nbsp;<a href=\"https://duashopbd.com/products?id=4&amp;data_from=brand&amp;page=1\">পথিক প্রকাশন</a></p>\r\n\r\n<p>বিষয় :&nbsp;<a href=\"https://www.wafilife.com/cat/books/subject/families/\">পরিবার ও সামাজিক জীবন</a>,&nbsp;<a href=\"https://www.wafilife.com/cat/books/subject/biye/\">বিয়ে</a></p>\r\n\r\n<p>অনুবাদ :&nbsp;<strong>কায়সার আহমাদ</strong><br />\r\nশরঈ সম্পাদনা :&nbsp;<strong>সাইফুল্লাহ আল মাহমুদ</strong><br />\r\nপৃষ্ঠা সংখ্যা:&nbsp;<strong>৮০</strong><br />\r\nবইয়ের ধরণ :&nbsp;<strong>হার্ডকভার</strong></p>\r\n\r\n<p>ব্যক্তি থেকে শুরু করে রাষ্ট্র, আর্থ-সামাজিক, সব বিষয়ে ইসলামের রয়েছে সুনিপুণ দিকনির্দেশনা। তেমনি পরিবার বিষয়ে ইসলাম দিকনির্দেশনা দিয়েছে। একটি মজবুত, আন্তরিক এবং পরস্পর বোঝাপড়া ও সহানুভূতিশীল মুসলিম পরিবার নির্মাণ করার তাগিদ দেয় ইসলাম। এমন মুসলিম পরিবার&mdash;যা পরিচালিত হয়- শ্রদ্ধা, ভালবাসা, সম্মান, অঙ্গীকার, সুখ, মানসিক প্রশান্তির মাধ্যমে। যার স্লোগান হবে&mdash;ধর্ম হল আন্তরিকতা। যার লক্ষ্য হল&mdash;সন্তানদের সঠিক শিক্ষা দেয়া। যার ভিত্তি হল&mdash;কুর&rsquo;আন, সুন্নাহ এবং সালাফদের নাসিহা। যার প্রেরণা হল&mdash;তাদেরকে বিচার দিবসে আহ্বান করে বলা হবে-<br />\r\n&ldquo;তোমরা এবং তোমাদের সহধর্মিনীগণ সানন্দে জান্নাতে প্রবেশ কর। স্বর্ণের থালা ও পানপাত্র নিয়ে তাদেরকে প্রদক্ষিণ করা হবে; সেখানে রয়েছে সবকিছু, অন্তর যাচায় এবং নয়ন যাতে তৃপ্ত হয়। সেখানে তোমরা স্থায়ী হবে।&rdquo; (সুরা যুখরূপ : ৭০-৭১)<br />\r\nযার আদর্শ হবে&mdash;রাসুল সাল্লাল্লাহু আলাইহি ওয়াসাল্লাম, তাঁর সাহাবাগণ এবং তাঁর অনুসারীগণ।</p>\r\n\r\n<p>এ ক্ষেত্রে স্বামীর করণীয় কী, কীভাবে সে তার পরিবারকে ইসলামের আলোয় আলোকিত করবে? কীভাবে স্ত্রীর সাথে সম্পর্ক আরও নিবিড় করবে, ভালোবাসা সদা জাগুরুক রাখবে, সন্তানদের ইসলামের শিক্ষায় দীক্ষিত করবে, ইত্যাদি বিষয়ে আলোচিত বইটি।</p>', 0, NULL, '2022-12-29 15:58:55', '2022-12-29 15:58:55', 1, 1, 'pothik prokason, pothik prokasoni, পথিক প্রকাশনী , যেভাবে স্ত্রীর হৃদয় জয় করবেন, যেভাবে স্বামীর হৃদয় জয় করবেন', 'pothik prokason,\r\npothik prokasoni,\r\nপথিক প্রকাশনী,\r\nযেভাবে স্ত্রীর হৃদয় জয় করবেন,\r\nযেভাবে স্বামীর হৃদয় জয় করবেন', '2022-12-29-63adb93ff3b72.png', 1, NULL, 50.00, 0, NULL, NULL, '106396'),
(6, 'admin', 1, 'মুহাম্মাদ সাঃ একজন আদর্শ স্বামী', 'muhammad-sa-ekjn-adrs-swamee-Bq2JUj', NULL, '[{\"id\":\"4\",\"position\":1}]', 6, 'pc', 1, 1, '[\"2022-12-29-63adc255cefc6.png\"]', '2022-12-29-63adc255cf380.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 88, 51, '0', 'percent', '27', 'percent', 2, 1, '<p>&nbsp;</p>\r\n\r\n<p>জানতে</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Title</td>\r\n			<td>মুহাম্মাদ (সা.) একজন আদর্শ স্বামী</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Author</td>\r\n			<td><a href=\"https://www.rokomari.com/book/author/63822\">আব্দুল্লাহ ইউসুফ</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Publisher</td>\r\n			<td><a href=\"https://duashopbd.com/products?id=6&amp;data_from=brand&amp;page=1\">রুহামা পাবলিকেশন</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>চান আদর্শ স্বামীর প্রকৃত বৈশিষ্ট্য কেমন হওয়া উচিত? &nbsp;এসব বিষয়ে সর্বোত্তম জীবণ আদর্শই অনুসরন করা উচিত নয় কি? আমরা জানি হযরত মুহাম্মাদ সাল্লাল্লাহু আলাইহি ওয়া সাল্লাম ছিলেন সর্বোকালের সর্বোশ্রেষ্ঠ পুরুষ। কিন্তু কেমন ছিলে তিনি স্বমী হিসেবে? এ বিষয়ে আলোকপাত করা হয়েছে &quot;মুহাম্মাদ সাঃ একজন আদর্শ স্বামী&quot; বইটিতে।</p>', 0, NULL, '2022-12-29 16:37:41', '2022-12-29 16:37:41', 1, 1, 'Samaele tirmizi, pothik prokason, pothik prokasoni, পথিক প্রকাশনী , মুহাম্মাদ সাঃ একজন আদর্শ স্বামী, আবদুল্লাহ ইউসুফ,  হাসান মাসরুর শবয়ী', 'pothik prokason, \r\npothik prokasoni, \r\nপথিক প্রকাশনী , \r\nমুহাম্মাদ সাঃ একজন আদর্শ স্বামী, \r\nআবদুল্লাহ ইউসুফ,  \r\nহাসান মাসরুর শবয়ী', '2022-12-29-63adc255cf465.png', 1, NULL, 50.00, 0, NULL, NULL, '103369'),
(7, 'admin', 1, 'Jadur Basobota', 'jadur-basobota-0ZxVYO', NULL, '[{\"id\":\"4\",\"position\":1}]', 6, 'kg', 1, 1, '[\"2022-12-31-63afbb771a3f6.png\"]', '2022-12-31-63afbb771e0cb.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 87, '0', 'percent', '27', 'percent', 11, 1, '<p>প্রকাশনী :&nbsp;<a href=\"https://duashopbd.com/products?id=6&amp;data_from=brand&amp;page=1\">রুহামা পাবলিকেশন</a></p>\r\n\r\n<p>ক্যাটাগরী :&nbsp;ইসলামী জ্ঞান চর্চা,&nbsp;ফিকাহ ও ফতওয়া,&nbsp;বিবিধ বই</p>\r\n\r\n<p>সংকলন : শোআইব আহমাদ</p>\r\n\r\n<p>ভাষা সম্পাদনা : হাসান মাসরুর শরয়ী সম্পাদনা : মুফতী তারেকুজ্জামান</p>\r\n\r\n<p>পৃষ্ঠা সংখ্যাঃ ১১২</p>\r\n\r\n<p>জ্বীন - যাদু এসবের অস্তিত্ব আছে কি নেই তা নিয়ে অনেকেই তর্কে লিপ্ত হন। অনেকে মনে করেন এসব শ্রেফ অলীক কল্পনা, ভিত্তিহীন বিষয়। কিন্তু কুরআন হাদীসেই প্রমান আছে এসবের অস্তিত্ব সম্পর্কে। তাইই নয় জ্বীন -যাদু মারফত মানুষের ক্ষতিই করা হয় । যাদুর অস্ত্বিত্ব এবং এর থেকে পরিত্রানের উপায় সম্পর্কে প্রামাণ্য দলিল সহ পড়ুন....</p>', 0, NULL, '2022-12-31 04:32:55', '2022-12-31 04:32:55', 1, 1, 'Ruhama Publication, রুহামা পাবলিকেশন, Jadur Basobota, জাদুর বাস্তবতা, jadu, জাদু, জ্বীন ও জাদু,  ইসলামী জ্ঞান চর্চা, ফিকাহ ও ফতওয়া, শোআইব আহমাদ, হাসান মাসরুর শরয়ী', 'Ruhama Publication, \r\nরুহামা পাবলিকেশন, \r\nJadur Basobota, \r\nজাদুর বাস্তবতা, \r\n jadu,\r\nজাদু, \r\nজ্বীন ও জাদু, \r\nইসলামী জ্ঞান চর্চা, \r\nফিকাহ ও ফতওয়া, \r\nশোআইব আহমাদ, \r\nহাসান মাসরুর শরয়ী,', 'def.png', 1, NULL, 50.00, 0, NULL, NULL, '164092');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '0', 'Yael Pickett', 'permanent', 'Quis tempora corrupt', 'Sunt dolore dolore m', '46291', '+1 (799) 851-2069', '2022-11-17 04:06:13', '2022-11-17 04:06:13', NULL, NULL, '', '', 0),
(2, '2', 'Nola Middleton', 'home', 'Hic vel ex occaecat ', 'Sunt omnis nostrum m', '68117', '+1 (139) 616-5565', '2022-11-17 04:18:27', '2022-11-17 04:18:27', NULL, NULL, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', 5.00, '2 Week', 1, '2021-05-25 20:57:04', '2021-05-25 20:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2020-12-31 21:18:25'),
(2, 'linkedin', 'https://dev.6amtech.com/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2021-02-27 16:23:05'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2021-02-27 16:23:33'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2021-02-27 16:24:26'),
(5, 'instagram', 'https://dev.6amtech.com/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2021-02-27 16:24:41'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2021-06-11 17:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'fIm1_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-02-27 02:19:11', '2023-02-27 02:19:11'),
(2, '29MX_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-03-05 11:34:50', '2023-03-05 11:34:50'),
(3, '5XgY_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-04-11 21:40:03', '2023-04-11 21:40:03'),
(4, 'VeJ1_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-04-16 18:15:39', '2023-04-16 18:15:39'),
(5, 'G5jt_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-05-03 15:20:06', '2023-05-03 15:20:06'),
(6, 'p5Vy_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-05-14 10:19:26', '2023-05-14 10:19:26'),
(7, 'nTAm_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-06-10 23:34:52', '2023-06-10 23:34:52'),
(8, 'ZYLD_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-06-22 05:54:16', '2023-06-22 05:54:16'),
(9, 'G3Ye_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-07-12 12:29:19', '2023-07-12 12:29:19'),
(10, 'BtSL_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-07-26 21:12:24', '2023-07-26 21:12:24'),
(11, 'um4Z_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-08-02 14:04:01', '2023-08-02 14:04:01'),
(12, '0AlC_generic_9bfe2ba4_duashopbd.com@data-backup-store.com', '2023-09-14 12:11:07', '2023-09-14 12:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 3, 'bd', 'name', 'Odette Harrison', 1),
('App\\Model\\Brand', 4, 'bd', 'name', 'পথিক প্রকাশন', 2),
('App\\Model\\Product', 4, 'bd', 'name', 'শামায়েলে তিরমিজি [নবিজি এমন ছিলেন] (দুই খণ্ড)', 3),
('App\\Model\\Product', 4, 'bd', 'description', '<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://duashopbd.com/products?id=4&amp;data_from=brand&amp;page=1\">https://duashopbd.com/products?id=4&amp;data_from=brand&amp;page=1</a></p>\r\n\r\n<p>প্রকাশনী :&nbsp;<a href=\"https://www.wafilife.com/cat/books/publisher/pothik-prokashon/\">পথিক প্রকাশন</a></p>\r\n\r\n<p><strong>ব্যাখ্যাগ্রন্থটির বৈশিষ্ট্য</strong></p>\r\n\r\n<p>* সহজ সাবলীল ভাষায় এবং চমৎকার ঢঙে সাজানো হয়েছে।<br />\r\n* প্রতিটি আলোচনায় রেফারেন্স যুক্ত করা হয়েছে।<br />\r\n* ব্যাখ্যার ক্ষেত্রে ইমামগণের অভিমত উল্লেখ করা হয়েছে।<br />\r\n* পরস্পর বিপরীতমুখী বর্ণনাগুলোর নিরসনে ইমামগণের অভিমত ব্যক্ত করা হয়েছে এবং পরস্পর বৈপরীত্যের চমৎকার সমন্বয় ও সমাধান দেওয়া হয়েছে।<br />\r\n* হাদিসের শিক্ষা,&nbsp;সূক্ষ্মদর্শন ও আহকাম বর্ণনা করা হয়েছে।<br />\r\n* শব্দের আভিধানিক অর্থ উল্লেখ করা হয়েছে,&nbsp;ইমামগণ কী অর্থ বর্ণনা করেছেন সেটা ব্যক্ত করা হয়েছে,&nbsp;পাশাপাশি এখানে কী উদ্দেশ্য সেটা বর্ণনা করা হয়েছে।<br />\r\n* কোনো কোনো জায়গায় রাবিদের পরিচয় তুলে ধরা হয়েছে।<br />\r\n* প্রয়োজন অনুসারে হাদিসের শাস্ত্রীয় বিষয়ে আলোচনা করা হয়েছে।<br />\r\n* হাদিসের তাখরিজ উল্লেখ করা হয়েছে।<br />\r\n* প্রয়োজনবোধে ইরাব নিয়ে আলোচনা করা হয়েছে।<br />\r\n* ব্যাখ্যার ক্ষেত্রে মধ্যম পন্থা অবলম্বন করা হয়েছে। এ ছাড়াও বহু চমৎকার ও আকর্ষণীয় বিষয় গ্রন্থটিতে রয়েছে।</p>', 4),
('App\\Model\\Brand', 6, 'bd', 'name', 'রুহামা পাবলিকেশন', 5),
('App\\Model\\Product', 6, 'bd', 'name', 'মুহাম্মাদ সাঃ একজন আদর্শ স্বামী', 6),
('App\\Model\\Product', 6, 'bd', 'description', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Title</td>\r\n			<td>মুহাম্মাদ (সা.) একজন আদর্শ স্বামী</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Author</td>\r\n			<td><a href=\"https://www.rokomari.com/book/author/63822\">আব্দুল্লাহ ইউসুফ</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Publisher</td>\r\n			<td><a href=\"https://duashopbd.com/products?id=6&amp;data_from=brand&amp;page=1\">রুহামা পাবলিকেশন</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>জানতে চান আদর্শ স্বামীর প্রকৃত বৈশিষ্ট্য কেমন হওয়া উচিত? &nbsp;এসব বিষয়ে সর্বোত্তম জীবণ আদর্শই অনুসরন করা উচিত নয় কি? আমরা জানি হযরত মুহাম্মাদ সাল্লাল্লাহু আলাইহি ওয়া সাল্লাম ছিলেন সর্বোকালের সর্বোশ্রেষ্ঠ পুরুষ। কিন্তু কেমন ছিলে তিনি স্বমী হিসেবে? এ বিষয়ে আলোকপাত করা হয়েছে &quot;মুহাম্মাদ সাঃ একজন আদর্শ স্বামী&quot; বইটিতে।</p>', 7),
('App\\Model\\Product', 7, 'bd', 'name', 'জাদুর বাস্তবতা', 8),
('App\\Model\\Product', 7, 'bd', 'description', '<p>প্রকাশনী :&nbsp;রুহামা পাবলিকেশন</p>\r\n\r\n<p>ক্যাটাগরী :&nbsp;ইসলামী জ্ঞান চর্চা,&nbsp;ফিকাহ ও ফতওয়া,&nbsp;বিবিধ বই</p>\r\n\r\n<p>সংকলন : শোআইব আহমাদ</p>\r\n\r\n<p>ভাষা সম্পাদনা : হাসান মাসরুর শরয়ী সম্পাদনা : মুফতী তারেকুজ্জামান</p>\r\n\r\n<p>পৃষ্ঠা সংখ্যাঃ ১১২</p>\r\n\r\n<p>জ্বীন - যাদু এসবের অস্তিত্ব আছে কি নেই তা নিয়ে অনেকেই তর্কে লিপ্ত হন। অনেকে মনে করেন এসব শ্রেফ অলীক কল্পনা, ভিত্তিহীন বিষয়। কিন্তু কুরআন হাদীসেই প্রমান আছে এসবের অস্তিত্ব সম্পর্কে। তাইই নয় জ্বীন -যাদু মারফত মানুষের ক্ষতিই করা হয় । যাদুর অস্ত্বিত্ব এবং এর থেকে পরিত্রানের উপায় সম্পর্কে প্রামাণ্য দলিল সহ পড়ুন....</p>', 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '$2y$10$R4GAT0Pqr7jlwLibb2Pqtu.0DHu7phwstoT71s9XDJO...', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(2, NULL, 'Fahad', 'shad', '01756908426', 'def.png', 'mdshahinreza2041@gmail.com', NULL, '$2y$10$R4GAT0Pqr7jlwLibb2Pqtu.0DHu7phwstoT71s9XDJOwismBC5GK2', NULL, '2022-09-03 22:59:47', '2022-09-03 22:59:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100003;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
