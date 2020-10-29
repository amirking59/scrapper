-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2020 at 02:32 PM
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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `english_characters` int(11) NOT NULL,
  `persian_characters` int(11) NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_question` tinyint(1) NOT NULL,
  `related_model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_phrase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `accuracy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `correct_id` int(11) DEFAULT NULL,
  `bot_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `data`, `created_at`, `updated_at`, `english_characters`, `persian_characters`, `language`, `is_question`, `related_model`, `related_phrase`, `enterprise_token`, `unique_token`, `driver`, `response`, `accuracy`, `is_encrypted`, `correct_id`, `bot_id`) VALUES
(1, 'سلام', '2020-01-02 14:12:30', '2020-01-02 14:12:30', 0, 4, 'Farsi', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(2, 'دانلود فیلم a separation', '2020-01-02 18:00:19', '2020-01-02 18:00:19', 11, 10, 'Farsi', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(3, 'من یک فرد از Angola هستم', '2020-01-02 18:00:57', '2020-01-02 18:00:57', 5, 14, 'Farsi', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(4, 'I am from ایران', '2020-01-02 18:01:02', '2020-01-02 18:01:02', 6, 6, 'English', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(5, 'دنیای پیچیده ی یک Theoretician', '2020-01-02 18:02:46', '2020-01-02 18:02:46', 11, 14, 'Farsi', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(6, 'Rotic چیست؟', '2020-01-02 18:02:59', '2020-05-08 10:14:45', 4, 6, 'Farsi', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(7, 'What is روتیک؟', '2020-01-02 18:03:13', '2020-05-08 10:18:16', 5, 6, 'English', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(8, 'وب سایت Tiny Movies', '2020-01-02 18:04:06', '2020-01-02 18:04:06', 8, 7, 'Farsi', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(9, 'hi', '2020-01-02 18:14:48', '2020-05-08 10:16:57', 2, 0, 'English', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0),
(10, 'Hello', '2020-01-02 18:15:10', '2020-05-08 10:16:27', 4, 0, 'English', 0, '15', 'public conversation', '0', NULL, NULL, NULL, NULL, 0, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15697;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
