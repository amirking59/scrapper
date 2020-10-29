-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2020 at 02:29 PM
-- Server version: 5.5.65-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neuralion_dbserver`
--

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paid` int(11) NOT NULL,
  `plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  `expire_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `paid`, `plan`, `duration`, `tracking_code`, `enterprise_id`, `expire_at`, `start_at`, `created_at`, `updated_at`, `status`) VALUES
(2, 0, 'enterprise', '48', 'bFVG5DXYHs-3088-YFxezBkjUP', 4, '2024-03-19 11:48:25', '2020-03-18 20:30:00', '2020-03-19 11:48:25', '2020-03-19 11:48:25', 1),
(3, 0, 'pro', '1', 'pOS5pjYkLY-4802-7EfSOC4rXY', 4, '2022-05-19 10:48:25', '2022-04-19 10:48:25', '2020-03-21 05:20:45', '2020-03-21 05:20:45', 1),
(4, 0, 'enterprise', '24', 'OqcyShAnmc-3844-trVZ1ZB5RN', 2, '2022-03-27 15:23:09', '2020-03-27 15:23:09', '2020-03-27 15:23:09', '2020-03-27 15:23:09', 1),
(5, 0, 'free', '1', '5cDSWurEOx-9757-rr5g04okhj', 10, '2020-06-04 09:23:26', '2020-05-04 09:23:26', '2020-05-04 09:23:26', '2020-05-04 09:23:26', 1),
(6, 290000, 'pro', '1', 'nlVI7mTVJd-3572-DYhJUGLGTR', 14, '2020-06-10 09:13:41', '2020-05-10 09:13:41', '2020-05-10 09:13:41', '2020-05-10 09:13:41', 1),
(7, 0, 'free', '1', 'VIQTJNJWVp-2356-0CJeoPIlCS', 16, '2020-06-20 09:37:40', '2020-05-20 09:37:40', '2020-05-20 09:37:40', '2020-05-20 09:37:40', 1),
(8, 0, 'free', '1', '73lV7McYox-9733-lM41KjDGYa', 7, '2020-06-24 22:51:44', '2020-05-24 22:51:44', '2020-05-24 22:51:44', '2020-05-24 22:51:44', 1),
(9, 0, 'enterprise', '1', 'ucBfODNzgw-1723-f5TjRRekNT', 17, '2020-07-02 10:26:56', '2020-06-02 10:26:56', '2020-06-02 10:26:56', '2020-06-02 10:26:56', 1),
(11, 290000, 'pro', '1', 'QzZzNCIrRb-4701-XdchNj96qQ', 24, '2020-10-06 08:51:07', '2020-09-06 07:51:07', '2020-09-06 07:51:07', '2020-09-06 07:51:07', 1),
(12, 580000, 'enterprise', '1', 'Nb2FWXifSi-5373-ghZVgFYWtC', 1, '2020-10-12 06:40:28', '2020-09-12 05:40:28', '2020-09-12 05:40:28', '2020-09-12 05:40:28', 1),
(13, 580000, 'enterprise', '1', 'IC7UjEe1pH-6293-dhdE25lTu0', 21, '2020-10-20 14:12:22', '2020-09-20 13:12:22', '2020-09-20 13:12:22', '2020-09-20 13:12:22', 1),
(14, 580000, 'enterprise', '1', 'oUFcpTHvbs-5367-N0CUB0TPSS', 27, '2020-11-01 18:18:25', '2020-10-01 18:18:25', '2020-10-01 18:18:25', '2020-10-01 18:18:25', 1),
(15, 580000, 'enterprise', '1', 'APIZa5FftO-8635-ICRKFGm1e9', 1, '2020-11-12 06:40:28', '2020-10-12 06:40:28', '2020-10-13 01:44:46', '2020-10-13 01:44:46', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_tracking_code_unique` (`tracking_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
