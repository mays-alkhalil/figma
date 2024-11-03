-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2024 at 07:59 PM
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
-- Database: `gameshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_description` varchar(200) NOT NULL,
  `category_picture` varchar(250) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `category_picture`, `is_deleted`, `created_at`, `updated_at`) VALUES
(102, 'Gaming Headset', 'Experience Immersive Sound with the Ultimate Gaming Headset! Step into the game like never before with this high-quality gaming headset, designed to deliver an unmatched audio experience. Equipped wit', 'HEADSET3-removebg-preview.png', 0, '2024-11-02 16:16:29', '2024-11-02 16:16:29'),
(103, 'Gaming Keyboard ', 'Elevate your gaming experience with this premium gaming keyboard, designed for professional gamers. It features customizable RGB lighting, ultra-fast response times, and mechanical switches for a comf', 'FANTECH_MK876V2_ATOM87_RGB_MECHANICAL_KEYBOARD_SUMI_EDITION_-_BLACK-removebg-preview.png', 0, '2024-11-02 17:39:20', '2024-11-02 17:39:20'),
(104, 'Gaming Mouse ', 'Take your gaming performance to the next level with this advanced gaming mouse, designed for precision, speed, and comfort. It features high DPI sensitivity with customizable settings, allowing you to', 'FANTECH_WG12RS_RAIGOR_III_WIRELESS_GAMING_MOUSE_-_BLACK_-removebg-preview.png', 0, '2024-11-02 17:49:53', '2024-11-02 17:49:53'),
(105, 'Gaming Chair ', 'Experience ultimate comfort and support during long gaming sessions with this high-quality gaming chair. Designed with ergonomic features, it offers adjustable armrests, reclining backrest, and a head', 'FANTECH_ALPHA_GC-283_GAMING_CHAIR___ORANGE_-removebg-preview.png', 0, '2024-11-02 18:24:44', '2024-11-02 18:24:44'),
(106, 'Gaming Desk', 'Upgrade your gaming setup with this sleek, functional gaming desk designed for performance and style. With a spacious surface to accommodate multiple monitors, a dedicated cable management system, and', 'FANTECH_WORKSTATION_WS311_ADJUSTABLE_RISING_DESK__-_BLACK-removebg-preview.png', 0, '2024-11-02 18:32:19', '2024-11-02 18:32:19'),
(107, 'Gaming Microphone', 'Achieve crystal-clear communication with this professional-grade gaming microphone, perfect for streaming, team chat, and content creation. It features high-definition sound capture, background noise ', 'Fantech-LEVIOSA-MCX01-Mic-Condenser-1-1-removebg-preview.png', 0, '2024-11-02 18:38:33', '2024-11-02 18:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_us_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(20) NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `coupon_expiry_date` date NOT NULL,
  `coupon_status` enum('valid','invalid') NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_total` float NOT NULL,
  `order_status` enum('pending','cancelled','delivered') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_picture` varchar(200) NOT NULL,
  `product_price` float NOT NULL,
  `product_rate` enum('1','2','3','4','5') NOT NULL,
  `product_discount` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_state` enum('inStock','outOfStock') NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `category_id`, `product_picture`, `product_price`, `product_rate`, `product_discount`, `product_quantity`, `product_state`, `is_deleted`, `created_at`, `updated_at`) VALUES
(36, 'Headset', 'AURORA HG29 7.1 SURROUND SOUND GAMING HEADSET', 102, 'HEADSET3-removebg-preview.png', 15, '1', 0, 20, 'inStock', 0, '2024-11-02 16:17:37', '2024-11-02 16:17:37'),
(37, 'Headset', 'MARS II HQ54 WIRED GAMING HEADSET', 102, 'HEADSET2-removebg-preview.png', 8, '1', 0, 16, 'inStock', 0, '2024-11-02 16:18:31', '2024-11-02 16:18:31'),
(38, 'Headset', 'PORTAL HQ55 GAMING HEADSET', 102, 'HEADSET3-removebg-preview.png', 11, '1', 0, 3, 'inStock', 0, '2024-11-02 16:19:01', '2024-11-02 16:19:01'),
(39, 'Headset', 'HARMONY WHG02 WIRELESS &amp; BLUETOOTH HEADPHONE â€“ TRI MODE CONNECTION â€“ WHITE', 102, 'HEADPHONE4-Photoroom.png', 37, '1', 0, 4, 'inStock', 0, '2024-11-02 16:19:47', '2024-11-02 16:19:47'),
(40, 'Headset', 'VALOR MH86 Multi-Platform Gaming Headset - Mint Edition', 102, 'Headset5-removebg-preview.png', 22, '1', 0, 33, 'inStock', 0, '2024-11-02 16:20:16', '2024-11-02 16:20:16'),
(41, 'Headset', 'BLITZ MH87 Space Edition MULTI PLATFORM GAMING HEADSET', 102, 'HEADSET6-removebg-preview.png', 20, '1', 0, 7, 'inStock', 0, '2024-11-02 16:20:46', '2024-11-02 16:20:46'),
(42, 'Headset', 'JADE MH84 MULTI PLATFORM RGB Gaming Headset', 102, 'HEADSET7-removebg-preview.png', 10, '1', 0, 33, 'inStock', 0, '2024-11-02 16:21:15', '2024-11-02 16:21:15'),
(43, 'Headset', 'HG11 CAPTAIN 7.1 SPACE EDITION GAMING HEADSET', 102, 'headset9-removebg-preview.png', 19, '1', 0, 9, 'inStock', 0, '2024-11-02 16:21:50', '2024-11-02 16:21:50'),
(44, 'Headset', 'VIBE MH85 Multi-Platform Gaming Headset', 102, 'HEADSET2-removebg-preview.png', 13, '1', 0, 3, 'inStock', 1, '2024-11-02 16:22:15', '2024-11-02 16:22:15'),
(45, 'Gaming Keyboard ', 'ATOM104 MK886V2 GAMING MECHANICAL KEYBOARD - SUMI EDITION BLACK', 103, 'FANTECH_MK876V2_ATOM87_RGB_MECHANICAL_KEYBOARD_SUMI_EDITION_-_BLACK-removebg-preview.png', 19, '1', 0, 12, 'inStock', 0, '2024-11-02 17:40:53', '2024-11-02 17:40:53'),
(46, 'Gaming Keyboard ', 'ATOM104 MK886V2 GAMING MECHANICAL KEYBOARD - SUMI EDITION GREY', 103, 'FANTECH_MK876V2_ATOM87_KEYBOARD_SUMI_EDITION_-_GREY-removebg-preview.png', 19, '1', 0, 23, 'inStock', 0, '2024-11-02 17:41:14', '2024-11-02 17:41:14'),
(47, 'Gaming Keyboard ', 'MK876V2 ATOM87 RGB MECHANICAL KEYBOARD SUMI EDITION - GREY', 103, 'FANTECH_ATOM104_MK886V2_GAMING_MECHANICAL_KEYBOARD_-_SUMI_EDITION_GREY-removebg-preview.png', 17, '1', 0, 6, 'inStock', 0, '2024-11-02 17:41:39', '2024-11-02 17:41:39'),
(48, 'Gaming Keyboard ', 'MK876V2 ATOM87 RGB MECHANICAL KEYBOARD SUMI EDITION - BLACK', 103, 'FANTECH_ATOM104_MK886V2_GAMING_MECHANICAL_KEYBOARD_-_SUMI_EDITION_BLACK-removebg-preview.png', 17, '1', 0, 8, 'inStock', 0, '2024-11-02 17:41:57', '2024-11-02 17:41:57'),
(49, 'Gaming Keyboard ', ' MAXFIT81 MK910 VIBE EDITION MILKY MATCHA RGB Tri-mode Connections Modular Mechanical Gaming Keyboard (PBT KEYCAPS)', 103, 'FANTECH_MAXFIT81_MK910_VIBE_EDITION_MILKY_MATCHA__Mechanical_Gaming_Keyboard-removebg-preview.png', 69, '1', 0, 2, 'inStock', 0, '2024-11-02 17:42:27', '2024-11-02 17:42:27'),
(50, 'Gaming Keyboard ', 'ATOM PRO83 MK913 WIRELESS MECHANICAL GAMING KEYBOARD â€“ TRI-MODE CONNECTION â€“ STELLAR EDITION MERCURY', 103, 'FANTECH_ATOM_PRO83_MK913_WIRELESS_MECHANICAL_GAMING_KEYBOARD____STELLAR_EDITION_MERCURY_-removebg-preview.png', 37, '1', 0, 6, 'inStock', 0, '2024-11-02 17:42:59', '2024-11-02 17:42:59'),
(51, 'Gaming Keyboard ', 'ATOM PRO63 MK912 MECHANICAL GAMING KEYBOARD - STELLAR EDITION SATURN', 103, 'FANTECH_ATOM_PRO63_MK912_KEYBOARD_-_STELLAR_EDITION_SATURN-removebg-preview.png', 33, '1', 0, 100, 'inStock', 0, '2024-11-02 17:43:22', '2024-11-02 17:43:22'),
(52, 'Gaming Keyboard ', 'MAXFIT108 MK855 RGB MECHANICAL KEYBOARD - SPACE EDITION', 103, 'FANTECH_MAXFIT108_MK855_RGB_MECHANICAL_KEYBOARD_-_SPACE_EDITION_-removebg-preview.png', 40, '1', 0, 3, 'inStock', 0, '2024-11-02 17:43:54', '2024-11-02 17:43:54'),
(53, 'Gaming Mouse ', 'WG12RS RAIGOR III WIRELESS GAMING MOUSE - BLACK', 104, 'FANTECH_WG12RS_RAIGOR_III_WIRELESS_GAMING_MOUSE_-_BLACK_-removebg-preview.png', 12, '1', 0, 1, 'inStock', 0, '2024-11-02 17:57:41', '2024-11-02 17:57:41'),
(54, 'Gaming Mouse ', ' WG12RS RAIGOR III WIRELESS GAMING MOUSE - WHITE', 104, 'FANTECH_WG12RS_RAIGOR_III_WIRELESS_MOUSE_-_WHITE-removebg-preview.png', 12, '1', 0, 6, 'inStock', 0, '2024-11-02 17:58:14', '2024-11-02 17:58:14'),
(55, 'Gaming Mouse ', 'WGC5S BLAKE S DUAL MODE WIRELESS GAMING MOUSE - WHITE', 102, 'FANTECH_WGC5S_BLAKE_S_GAMING_MOUSE_-_WHITE-removebg-preview.png', 23, '1', 0, 9, 'inStock', 1, '2024-11-02 17:59:55', '2024-11-02 17:59:55'),
(56, 'Gaming Mouse ', 'WGC5S BLAKE S DUAL MODE WIRELESS GAMING MOUSE - BLACK', 104, 'FANTECH_WGC5S_BLAKE_S_GAMING_MOUSE_-_BLACK-removebg-preview.png', 23, '1', 0, 12, 'inStock', 0, '2024-11-02 18:00:19', '2024-11-02 18:00:19'),
(57, 'Gaming Mouse ', 'WGC5S BLAKE S DUAL MODE WIRELESS GAMING MOUSE - WHITE', 104, 'FANTECH_WGC5S_BLAKE_S_GAMING_MOUSE_-_WHITE-removebg-preview.png', 23, '1', 0, 66, 'inStock', 0, '2024-11-02 18:02:38', '2024-11-02 18:02:38'),
(58, 'Gaming Mouse ', 'RAIGOR III WG12R RECHARGEABLE WIRELESS GAMING MOUSE - BEIGE', 104, 'FANTECH_RAIGOR_III_WG12R__GAMING_MOUSE__-_BEIGE-removebg-preview.png', 10, '1', 0, 21, 'inStock', 0, '2024-11-02 18:03:00', '2024-11-02 18:03:00'),
(59, 'Gaming Mouse ', 'RAIGOR III WG12R RECHARGEABLE WIRELESS GAMING MOUSE - BLACK', 104, 'FANTECH_RAIGOR_III_WG12R__GAMING_MOUSE__-_BLACK-removebg-preview.png', 10, '1', 0, 4, 'inStock', 0, '2024-11-02 18:03:22', '2024-11-02 18:03:22'),
(60, 'Gaming Mouse ', 'RAIGOR III WG12R RECHARGEABLE WIRELESS GAMING MOUSE â€“ GREY', 104, 'FANTECH_RAIGOR_III_WG12R__GAMING_MOUSE__-_GREY-removebg-preview.png', 10, '1', 0, 12, 'inStock', 0, '2024-11-02 18:03:41', '2024-11-02 18:03:41'),
(61, 'Gaming Mouse ', 'HELIOS II XD3V3 4K PRO WIRELESS ULTRA LIGHTWEIGHT GAMING MOUSE â€“ GREY', 104, 'FANTECH_HELIOS_II_XD3V3_4K_PRO_WIRELESS_GAMING_MOUSE-removebg-preview.png', 12, '1', 0, 5, 'inStock', 0, '2024-11-02 18:04:03', '2024-11-02 18:04:03'),
(62, 'Gaming Chair ', 'OC3 ERGONOMIC OFFICE CHAIR - Grey', 105, 'FANTECH_OC3_OFFICE_CHAIR_-_GREY-removebg-preview.png', 199, '1', 0, 5, 'inStock', 0, '2024-11-02 18:25:14', '2024-11-02 18:25:14'),
(63, 'Gaming Chair ', 'KORSI GC191 GAMING CHAIR â€“ RED', 105, 'FANTECH_KORSI_GC191_GAMING_CHAIR___RED__1-removebg-preview.png', 109, '1', 0, 9, 'inStock', 0, '2024-11-02 18:25:46', '2024-11-02 18:25:46'),
(64, 'Gaming Chair ', 'LEDARE GC192 GAMING CHAIR â€“ GREY', 105, 'FANTECH_LEDARE_GC192_GAMING_CHAIR___GREY-removebg-preview.png', 139, '1', 0, 6, 'inStock', 0, '2024-11-02 18:26:17', '2024-11-02 18:26:17'),
(65, 'Gaming Chair ', 'ALPHA GC-283 GAMING CHAIR â€“ ORANGE ', 105, 'FANTECH_ALPHA_GC-283_GAMING_CHAIR___ORANGE_-removebg-preview.png', 159, '1', 0, 23, 'inStock', 0, '2024-11-02 18:26:58', '2024-11-02 18:26:58'),
(66, 'Gaming Chair ', 'ALPHA GC-283 GAMING CHAIR â€“ RED', 105, 'FANTECH_ALPHA_GC-283_GAMING_CHAIR___RED-removebg-preview.png', 159, '1', 0, 12, 'inStock', 0, '2024-11-02 18:27:20', '2024-11-02 18:27:20'),
(67, 'Gaming Chair ', 'ALPHA GC-283 GAMING CHAIR - BLUE', 105, 'FANTECH_ALPHA_GC-283_GAMING_CHAIR_-_BLUE-removebg-preview.png', 159, '1', 0, 11, 'inStock', 0, '2024-11-02 18:27:44', '2024-11-02 18:27:44'),
(68, 'Gaming Chair ', 'ALPHA GC-283 GAMING CHAIR', 105, 'FANTECH-ALPHA-GC-283-GAMING-CHAIR-7-removebg-preview.png', 155, '1', 0, 3, 'inStock', 0, '2024-11-02 18:28:04', '2024-11-02 18:28:04'),
(69, 'Gaming Chair ', 'OC2 ERGONOMIC OFFICE CHAIR - BLACK', 105, 'FANTECH_OC2_OFFICE_CHAIR_-_BLACK-removebg-preview.png', 255, '1', 0, 22, 'inStock', 0, '2024-11-02 18:28:32', '2024-11-02 18:28:32'),
(70, 'Gaming Desk', 'WORKSTATION WS311 ADJUSTABLE RISING DESK â€“ BLACK', 106, 'FANTECH_WORKSTATION_WS311_ADJUSTABLE_RISING_DESK__-_BLACK-removebg-preview.png', 122, '1', 0, 3, 'inStock', 0, '2024-11-02 18:33:12', '2024-11-02 18:33:12'),
(71, 'Gaming Desk', 'WORKSTATION WS311 ADJUSTABLE RISING DESK â€“ WHITE', 106, 'FANTECH_WORKSTATION_WS311_ADJUSTABLE_RISING_DESK__-_WHITE-removebg-preview.png', 111, '1', 0, 3, 'inStock', 0, '2024-11-02 18:33:36', '2024-11-02 18:33:36'),
(72, 'Gaming Desk', 'WORKSTATION WS414 ADJUSTABLE RISING DESK â€“ Black', 106, 'FANTECH_WORKSTATION_WS414_ADJUSTABLE_RISING_DESK_-_Black-removebg-preview.png', 166, '1', 0, 6, 'inStock', 0, '2024-11-02 18:33:57', '2024-11-02 18:33:57'),
(73, 'Gaming Desk', 'TIGRIS GD214 RGB GAMING DESK', 106, 'FANTECH_TIGRIS_GD214_GAMING_DESK-removebg-preview.png', 99, '1', 0, 12, 'inStock', 0, '2024-11-02 18:34:27', '2024-11-02 18:34:27'),
(74, 'Gaming Desk', 'TIGRIS GD210 RGB GAMING DESK', 106, 'FANTECH_TIGRIS_GD210_RGB_GAMING_DESK-removebg-preview.png', 88, '1', 0, 6, 'inStock', 0, '2024-11-02 18:34:53', '2024-11-02 18:34:53'),
(75, 'Gaming Desk', 'ACGD171 MONITOR STAND 19 JOD', 106, 'FANTECH_ACGD171_MONITOR_STAND-removebg-preview.png', 19, '1', 0, 3, 'inStock', 0, '2024-11-02 18:35:38', '2024-11-02 18:35:38'),
(76, 'Gaming Desk', 'GD914 ADJUSTABLE RISING DESK â€“ Black', 106, 'FANTECH_GD914_ADJUSTABLE_RISING_DESK_-_Black__1-removebg-preview.png', 155, '1', 0, 12, 'inStock', 0, '2024-11-02 18:35:58', '2024-11-02 18:35:58'),
(77, 'Gaming Desk', ' GD914 ADJUSTABLE RISING DESK â€“ White', 106, 'FANTECH_GD914_ADJUSTABLE_RISING_DESK_-_White__1-removebg-preview.png', 176, '1', 0, 11, 'inStock', 0, '2024-11-02 18:36:17', '2024-11-02 18:36:17'),
(78, 'Gaming Microphone', 'AC902s ADJUSTABLE MICROPHONE STAND', 107, 'FANTECH_AC902_ADJUSTABLE_MICROPHONE_STAND-removebg-preview.png', 12, '1', 0, 33, 'inStock', 0, '2024-11-02 18:38:58', '2024-11-02 18:38:58'),
(79, 'Gaming Microphone', 'MC20 Professional Condenser Microphone', 107, 'Fantech-MC20-Professional-Condenser-Microphone-2-removebg-preview.png', 19, '1', 0, 11, 'inStock', 0, '2024-11-02 18:39:22', '2024-11-02 18:39:22'),
(80, 'Gaming Microphone', 'LEVIOSA LIVE MCX02 PROFESSIONAL SMART MICROPHONE', 107, 'FANTECH_LEVIOSA_LIVE_MCX02_PROFESSIONAL_SMART_MICROPHONE-removebg-preview.png', 44, '1', 0, 11, 'inStock', 0, '2024-11-02 18:39:54', '2024-11-02 18:39:54'),
(81, 'Gaming Microphone', 'LEVIOSA MCX01 Professional Condenser Microphone', 107, 'Fantech-LEVIOSA-MCX01-Mic-Condenser-1-1-removebg-preview.png', 22, '1', 0, 11, 'inStock', 0, '2024-11-02 18:41:07', '2024-11-02 18:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `user_last_name` varchar(50) NOT NULL,
  `user_gender` enum('male','female') NOT NULL,
  `user_birth_date` date NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone_number` varchar(20) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_status` enum('active','deactivated') NOT NULL,
  `user_role` enum('superAdmin','admin','customer') NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_first_name`, `user_last_name`, `user_gender`, `user_birth_date`, `user_address`, `user_email`, `user_phone_number`, `user_password`, `user_status`, `user_role`, `is_deleted`, `created_at`, `updated_at`) VALUES
(20, 'Esra', 'Eid', 'female', '2002-10-20', 'amman', 'esraa.eid@gmail.com', '1234567890', '', 'active', 'customer', 0, '2024-11-02 16:03:41', '2024-11-02 16:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_us_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_us_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
