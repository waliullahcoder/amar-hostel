-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for amar_hostel
DROP DATABASE IF EXISTS `amar_hostel`;
CREATE DATABASE IF NOT EXISTS `amar_hostel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `amar_hostel`;

-- Dumping structure for table amar_hostel.coa_setups
DROP TABLE IF EXISTS `coa_setups`;
CREATE TABLE IF NOT EXISTS `coa_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `head_code` bigint NOT NULL,
  `head_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction` tinyint NOT NULL DEFAULT '0',
  `general` tinyint NOT NULL DEFAULT '0',
  `head_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `updateable` tinyint NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.coa_setups: ~114 rows (approximately)
DELETE FROM `coa_setups`;
INSERT INTO `coa_setups` (`id`, `parent_id`, `head_code`, `head_name`, `transaction`, `general`, `head_type`, `status`, `updateable`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Assets', 0, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2023-12-07 07:14:30', '2023-12-07 07:14:30'),
	(2, NULL, 2, 'Liabilities', 0, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2023-12-07 07:14:59', '2023-12-07 10:24:11'),
	(3, NULL, 3, 'Income', 0, 0, 'I', 1, 0, 1, NULL, NULL, NULL, '2023-12-07 07:17:15', '2023-12-07 07:17:15'),
	(4, NULL, 4, 'Expense', 0, 0, 'E', 1, 0, 1, 2, NULL, NULL, '2023-12-07 07:17:44', '2024-02-29 13:56:50'),
	(18, 1, 101, 'Current Asset', 0, 0, 'A', 1, 0, 1, 2, NULL, NULL, '2023-12-12 14:10:35', '2024-02-28 15:15:38'),
	(19, 18, 10101, 'Cash Receivable', 0, 1, 'A', 1, 0, 1, 1, NULL, NULL, '2023-12-12 14:12:01', '2026-02-09 22:52:05'),
	(23, 18, 10102, 'Cash In Hand', 0, 1, 'A', 1, 0, 1, 4, NULL, NULL, '2023-12-13 03:34:03', '2024-10-07 20:28:30'),
	(24, 18, 10103, 'Cash at Bank', 0, 1, 'A', 1, 0, 1, 1, NULL, NULL, '2023-12-13 12:55:18', '2026-02-09 22:53:18'),
	(36, 1, 102, 'Fixed Asset', 0, 0, 'A', 1, 0, 2, NULL, NULL, NULL, '2023-12-30 06:44:47', '2023-12-30 06:44:47'),
	(128, 4, 401, 'Food Expense', 0, 1, 'E', 1, 1, 4, 4, NULL, NULL, '2024-09-29 06:32:17', '2024-10-05 13:58:46'),
	(129, 4, 402, 'Operational Expense', 0, 1, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-09-29 06:38:57', '2024-09-29 06:38:57'),
	(130, 4, 403, 'Fixed Expense', 0, 1, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-09-29 06:39:53', '2024-09-29 06:39:53'),
	(131, 4, 404, 'Marketing Expense', 0, 1, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-09-29 06:40:09', '2024-09-29 06:40:09'),
	(136, 3, 301, 'CASH BY INVESTMENT', 1, 1, 'I', 1, 1, 4, 4, NULL, NULL, '2024-10-04 15:52:58', '2024-10-05 01:22:55'),
	(137, 128, 40101, 'CHAL, DAL, TEL, MUDI MAL', 1, 0, 'E', 1, 1, 4, 4, NULL, NULL, '2024-10-05 13:59:06', '2024-10-06 17:44:12'),
	(138, 128, 40102, 'MACH, MANGSO, DIM', 1, 0, 'E', 1, 1, 4, 4, NULL, NULL, '2024-10-05 13:59:26', '2024-10-06 17:44:25'),
	(139, 2, 201, 'Cash Payable', 0, 1, 'L', 1, 1, 1, NULL, NULL, NULL, '2024-10-06 16:07:48', '2024-10-06 16:07:48'),
	(140, 2, 202, 'Investor Capital', 0, 1, 'L', 1, 1, 1, 4, NULL, NULL, '2024-10-06 16:08:12', '2024-10-06 18:54:34'),
	(141, 140, 20201, 'Abu Faysal', 0, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2024-10-06 16:08:27', '2025-07-01 18:05:17'),
	(142, 140, 20202, 'Mostafizur Rahman', 0, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2024-10-06 16:09:39', '2025-07-01 18:05:16'),
	(143, 140, 20203, 'Islam Zahirul', 0, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2024-10-06 16:10:30', '2025-07-01 18:05:08'),
	(144, 128, 40103, 'ADHA KACHA MAL', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:44:42', '2024-10-06 17:44:42'),
	(145, 128, 40104, 'KACHA MAL', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:44:53', '2024-10-06 17:44:53'),
	(146, 128, 40105, 'OTHERS DAILY BAZAR', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:45:30', '2024-10-06 17:45:30'),
	(153, 131, 40401, 'BOOSTING COST', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:49:36', '2024-10-06 17:49:36'),
	(155, 130, 40301, 'OFFICE RENT', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:50:09', '2024-10-06 17:50:09'),
	(156, 130, 40302, 'KITCHEN RENT', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:50:23', '2024-10-06 17:50:23'),
	(157, 130, 40303, 'RADHUNI SALARY', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:50:54', '2024-10-06 17:50:54'),
	(158, 130, 40304, 'DELIVERYMAN SALARY', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:51:04', '2024-10-06 17:51:04'),
	(159, 130, 40305, 'STAFF SALARY', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-06 17:51:14', '2024-10-06 17:51:14'),
	(160, 140, 20204, 'Md Nazmul Hossen Sumon', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2024-10-06 18:55:20', '2025-07-01 18:05:10'),
	(161, 140, 20205, 'Syedul Alam Chowdhury', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2024-10-06 18:55:39', '2025-07-01 18:05:04'),
	(162, 140, 20206, 'Khandokar Jewel', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2024-10-07 20:20:55', '2025-07-01 18:05:14'),
	(163, 23, 1010201, 'Cash at Niloy', 1, 0, 'A', 1, 1, 4, 4, NULL, NULL, '2024-10-07 20:28:50', '2025-09-28 09:53:34'),
	(164, 131, 40402, 'AGENCY FEE', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-07 20:58:34', '2024-10-07 20:58:34'),
	(165, 129, 40201, 'DAILY TRANSPORTATION', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-07 20:59:05', '2024-10-07 20:59:05'),
	(166, 128, 40106, 'GAS', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-20 14:43:20', '2024-10-20 14:43:20'),
	(167, 128, 40107, 'DESSERT', 1, 0, 'E', 1, 1, 4, 4, NULL, NULL, '2024-10-22 21:16:28', '2024-10-22 21:16:53'),
	(168, 129, 40202, 'OTHERS OPERATIONAL COST', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-10-23 00:05:00', '2024-10-23 00:05:00'),
	(169, 140, 20207, 'Md Nazmur Rahim Raza', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2024-11-02 16:02:16', '2025-07-01 18:05:12'),
	(170, 140, 20208, 'Moshiur Rahman', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2024-11-12 10:35:30', '2025-07-01 18:04:59'),
	(171, 140, 20209, 'Saddam Rupali', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2024-11-12 10:37:30', '2025-07-01 18:04:37'),
	(172, 129, 40203, 'ONE-TIME BOX', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2024-12-18 15:09:33', '2024-12-18 15:09:33'),
	(173, 140, 20210, 'Sajedul Islam Sumon', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2025-01-12 18:49:10', '2025-07-01 18:04:33'),
	(174, 3, 302, 'Bill Collection', 0, 1, 'I', 1, 1, 4, 3, NULL, NULL, '2025-01-28 11:32:14', '2026-02-09 00:18:36'),
	(175, 140, 20211, 'Riadul Bijoy', 0, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2025-02-02 17:27:52', '2025-07-01 18:03:53'),
	(176, 140, 20212, 'Tanvir', 1, 0, 'L', 1, 1, 4, 1, NULL, NULL, '2025-06-04 08:36:26', '2025-07-01 18:03:48'),
	(177, 140, 20213, 'Razia Sultana', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-07-01 13:09:14', '2025-07-03 14:57:50'),
	(178, 140, 20214, 'Symoon Maruf', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-07-01 13:12:15', '2025-07-01 18:03:42'),
	(179, 140, 20215, 'SK Turag', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-07-01 13:13:13', '2025-07-03 14:57:29'),
	(180, 140, 20216, 'Shaiful Islam', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-07-01 13:14:59', '2025-07-01 18:03:36'),
	(181, 140, 20217, 'Moshiujjaman Sumon', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-07-01 13:16:22', '2025-07-01 18:03:32'),
	(182, 140, 20218, 'Moonmoon Gulshan', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-07-01 14:45:16', '2025-07-01 18:03:27'),
	(183, 140, 20219, 'Mohabbat Ullah', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-07-01 14:53:38', '2025-07-01 18:03:20'),
	(184, 140, 20220, 'Sayid Ahmed', 0, 0, 'L', 1, 1, 1, 4, NULL, NULL, '2025-07-01 14:54:59', '2025-07-30 14:48:16'),
	(185, 4, 405, 'Investor Profit', 0, 1, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-07-01 18:02:35', '2025-07-01 18:02:35'),
	(186, 185, 40501, 'Sayid Ahmed - Profit', 0, 0, 'E', 1, 1, 1, 4, NULL, NULL, '2025-07-01 18:03:16', '2025-07-17 17:11:10'),
	(187, 185, 40502, 'Mohabbat Ullah - Profit', 0, 0, 'E', 1, 1, 1, 4, NULL, NULL, '2025-07-01 18:03:20', '2025-07-17 17:11:20'),
	(188, 185, 40503, 'Moonmoon Gulshan - Profit', 0, 0, 'E', 1, 1, 1, 4, NULL, NULL, '2025-07-01 18:03:27', '2025-07-17 17:11:33'),
	(189, 185, 40504, 'Moshiujjaman Sumon - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:03:32', '2025-07-02 23:28:37'),
	(190, 185, 40505, 'Shaiful Islam - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:03:36', '2025-07-02 23:28:39'),
	(191, 185, 40506, 'SK Turag - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:03:39', '2025-07-03 14:57:29'),
	(192, 185, 40507, 'Symoon Maruf - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:03:42', '2025-07-02 23:28:43'),
	(193, 185, 40508, 'Razia Sultana - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:03:45', '2025-07-03 14:57:50'),
	(194, 185, 40509, 'Tanvir - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:03:48', '2025-07-02 23:28:48'),
	(195, 185, 40510, 'Riadul Bijoy - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:03:53', '2025-07-02 23:28:50'),
	(196, 185, 40511, 'Sajedul Islam Sumon - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:04:33', '2025-07-02 23:28:54'),
	(197, 185, 40512, 'Saddam Rupali - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:04:37', '2025-07-02 23:28:55'),
	(198, 185, 40513, 'Moshiur Rahman - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:04:59', '2025-07-02 23:28:57'),
	(199, 185, 40514, 'Syedul Alam Chowdhury - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:05:04', '2025-07-02 23:28:58'),
	(200, 185, 40515, 'Islam Zahirul - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:05:08', '2025-07-02 23:29:01'),
	(201, 185, 40516, 'Md Nazmul Hossen Sumon - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:05:10', '2025-07-02 23:29:03'),
	(202, 185, 40517, 'Md Nazmur Rahim Raza - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:05:12', '2025-07-02 23:29:04'),
	(203, 185, 40518, 'Khandokar Jewel - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:05:14', '2025-07-02 23:29:05'),
	(204, 185, 40519, 'Mostafizur Rahman - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:05:16', '2025-07-02 23:29:07'),
	(205, 185, 40520, 'Abu Faysal - Profit', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-07-01 18:05:17', '2025-07-02 23:28:52'),
	(206, 140, 20221, 'Md Tofajjel Hossain', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:05:43', '2025-09-18 07:05:43'),
	(207, 185, 40521, 'Md Tofajjel Hossain - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:05:43', '2025-09-18 07:05:43'),
	(210, 140, 20223, 'Al Emran', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:06:16', '2025-09-18 07:06:16'),
	(211, 185, 40523, 'Al Emran - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:06:16', '2025-09-18 07:06:16'),
	(212, 140, 20224, 'Sayid Ahmed', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:06:29', '2025-09-18 07:06:29'),
	(213, 185, 40524, 'Sayid Ahmed - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:06:29', '2025-09-18 07:06:29'),
	(214, 140, 20225, 'Rana Ibrahim', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:06:47', '2025-09-18 07:06:47'),
	(215, 185, 40525, 'Rana Ibrahim - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:06:47', '2025-09-18 07:06:47'),
	(216, 140, 20226, 'Md Ariful Islam', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:07:15', '2025-09-18 07:07:15'),
	(217, 185, 40526, 'Md Ariful Islam - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:07:15', '2025-09-18 07:07:15'),
	(218, 140, 20227, 'MD ATIQUZZAMAN', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:07:31', '2025-09-18 07:07:31'),
	(219, 185, 40527, 'MD ATIQUZZAMAN - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:07:31', '2025-09-18 07:07:31'),
	(220, 140, 20228, 'Mahir Wasif', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:07:46', '2025-09-18 07:07:46'),
	(221, 185, 40528, 'Mahir Wasif - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:07:46', '2025-09-18 07:07:46'),
	(222, 140, 20229, 'Mamunur Rashid', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:08:00', '2025-09-18 07:08:00'),
	(223, 185, 40529, 'Mamunur Rashid - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-18 07:08:00', '2025-09-18 07:08:00'),
	(224, 140, 20230, 'Shaiful Islam', 1, 0, 'L', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:03:52', '2025-09-28 10:03:52'),
	(225, 185, 40530, 'Shaiful Islam - Profit', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:03:52', '2025-09-28 10:03:52'),
	(226, 140, 20231, 'Miraj Habib', 1, 0, 'L', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:10:11', '2025-09-28 10:10:11'),
	(227, 185, 40531, 'Miraj Habib - Profit', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:10:11', '2025-09-28 10:10:11'),
	(228, 140, 20232, 'Mahbub Alam', 1, 0, 'L', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:19:07', '2025-09-28 10:19:07'),
	(229, 185, 40532, 'Mahbub Alam - Profit', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:19:07', '2025-09-28 10:19:07'),
	(230, 140, 20233, 'Tanvir', 1, 0, 'L', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:19:51', '2025-09-28 10:19:51'),
	(231, 185, 40533, 'Tanvir - Profit', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:19:51', '2025-09-28 10:19:51'),
	(232, 140, 20234, 'Md saymon(vr-298)', 1, 0, 'L', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:20:59', '2025-09-28 10:20:59'),
	(233, 185, 40534, 'Md saymon(vr-298) - Profit', 1, 0, 'E', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:20:59', '2025-09-28 10:20:59'),
	(234, 23, 1010202, 'Cash at Fattah', 1, 0, 'A', 1, 1, 4, NULL, NULL, NULL, '2025-09-28 10:21:38', '2025-09-28 10:21:38'),
	(235, 140, 20235, 'Islam Zohirul', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-09-29 05:20:44', '2025-09-29 05:20:44'),
	(236, 185, 40535, 'Islam Zohirul - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-09-29 05:20:44', '2025-09-29 05:20:44'),
	(241, 140, 20236, 'Investor 1', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2026-02-09 22:23:41', '2026-02-09 22:23:41'),
	(242, 185, 40536, 'Investor 1 - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2026-02-09 22:23:41', '2026-02-09 22:23:41'),
	(243, 19, 1010101, 'Seat Booking', 1, 0, 'A', 1, 1, 1, NULL, NULL, NULL, '2026-02-09 22:52:47', '2026-02-09 22:52:47'),
	(244, 24, 1010301, 'UCBL', 1, 0, 'A', 1, 1, 1, NULL, NULL, NULL, '2026-02-09 22:53:31', '2026-02-09 22:53:31'),
	(245, 140, 20237, 'Wali', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2026-02-15 04:26:31', '2026-02-15 04:26:31'),
	(246, 185, 40537, 'Wali - Profit', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2026-02-15 04:26:31', '2026-02-15 04:26:31'),
	(247, 4, 406, 'Room Cost', 0, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2026-02-18 04:43:16', '2026-02-18 04:43:16'),
	(250, 4, 407, 'testw', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2026-02-18 21:32:45', '2026-02-18 21:32:45'),
	(252, 4, 408, 'testw', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2026-02-18 21:37:53', '2026-02-18 21:37:53');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
