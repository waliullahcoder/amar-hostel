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


-- Dumping database structure for busines2_amar_hostel
USE `busines2_amar_hostel`;

-- Dumping structure for table amar_hostel.account_transactions
DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE IF NOT EXISTS `account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_transaction_auto_id` bigint unsigned NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` date NOT NULL,
  `coa_setup_id` bigint unsigned NOT NULL,
  `coa_head_code` bigint NOT NULL,
  `narration` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `credit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `approve` tinyint(1) NOT NULL DEFAULT '0',
  `approve_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_transaction_auto_id_foreign` (`account_transaction_auto_id`),
  CONSTRAINT `account_transactions_account_transaction_auto_id_foreign` FOREIGN KEY (`account_transaction_auto_id`) REFERENCES `account_transaction_autos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.account_transactions: ~0 rows (approximately)
DELETE FROM `account_transactions`;

-- Dumping structure for table amar_hostel.account_transaction_autos
DROP TABLE IF EXISTS `account_transaction_autos`;
CREATE TABLE IF NOT EXISTS `account_transaction_autos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` date NOT NULL,
  `coa_setup_id` bigint unsigned NOT NULL,
  `coa_head_code` bigint NOT NULL,
  `narration` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `credit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `approve` tinyint(1) NOT NULL DEFAULT '0',
  `approve_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.account_transaction_autos: ~2 rows (approximately)
DELETE FROM `account_transaction_autos`;
INSERT INTO `account_transaction_autos` (`id`, `voucher_no`, `voucher_type`, `voucher_date`, `coa_setup_id`, `coa_head_code`, `narration`, `debit_amount`, `credit_amount`, `document`, `posted`, `approve`, `approve_by`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(3, 'FDI2602000001', 'Invest', '2026-02-10', 163, 1010201, 'Invest against Invest No - FDI2602000001', 20000.00, 0.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-09 22:43:05', '2026-02-09 22:43:05'),
	(4, 'FDI2602000001', 'Invest', '2026-02-10', 241, 20236, 'Invest against Invest No - FDI2602000001', 0.00, 20000.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-09 22:43:05', '2026-02-09 22:43:05');

-- Dumping structure for table amar_hostel.admin_menus
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_deletable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menus_permission_id_foreign` (`permission_id`),
  KEY `admin_menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `admin_menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menus_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.admin_menus: ~55 rows (approximately)
DELETE FROM `admin_menus`;
INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `is_deletable`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<span class="material-symbols-outlined fs-22"> home_app_logo </span>', 1, 1, 1, '2025-06-17 05:07:50', '2025-06-17 05:31:46'),
	(2, 2, NULL, 'System Settings', NULL, '<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>', 2, 1, 1, '2025-06-17 05:10:14', '2025-06-17 05:10:14'),
	(3, 3, 2, 'Roles', 'admin.role.index', NULL, 1, 1, 1, '2025-06-17 05:10:36', '2025-06-17 05:10:36'),
	(4, 4, 2, 'Users', 'admin.user.index', NULL, 2, 1, 1, '2025-06-17 05:11:10', '2025-06-17 05:11:10'),
	(5, 5, 2, 'Menu', 'admin.admin-menu.index', NULL, 3, 1, 1, '2025-06-17 05:11:51', '2025-06-17 05:11:51'),
	(6, 6, 2, 'Admin Settings', 'admin.admin-settings.index', NULL, 4, 1, 1, '2025-06-17 05:12:59', '2025-06-17 05:12:59'),
	(7, 7, 2, 'Investors', 'admin.investor.index', NULL, 5, 1, 1, '2025-06-17 05:13:38', '2025-06-17 05:13:38'),
	(8, 27, NULL, 'Invest Process', 'admin.invest.index', '<span class="material-symbols-outlined fs-24"> finance_mode </span>', 6, 1, 1, '2025-06-17 05:37:47', '2025-07-19 04:48:45'),
	(9, 32, NULL, 'Sattlement', 'admin.invest-sattlement.index', '<span class="material-symbols-outlined fs-24"> inventory </span>', 9, 1, 1, '2025-06-17 05:40:52', '2025-07-22 06:49:30'),
	(10, 37, NULL, 'General Accounting', NULL, '<span class="material-symbols-outlined fs-24"> calculate </span>', 11, 1, 1, '2025-06-17 05:42:20', '2025-07-03 03:56:00'),
	(11, 38, 10, 'Transaction', NULL, NULL, 1, 1, 1, '2025-06-17 05:42:51', '2025-06-17 05:42:51'),
	(12, 39, 10, 'Reports', NULL, NULL, 2, 1, 1, '2025-06-17 05:43:04', '2025-06-17 05:43:04'),
	(13, 40, 11, 'Chart of Accounts', 'admin.coa-setup.index', NULL, 1, 1, 1, '2025-06-17 05:43:37', '2026-02-09 22:50:52'),
	(14, 44, 11, 'Debit Voucher', 'admin.debit-voucher.index', NULL, 2, 1, 1, '2025-06-17 05:45:02', '2025-06-17 05:45:02'),
	(15, 49, 11, 'Credit Voucher', 'admin.credit-voucher.index', NULL, 3, 1, 1, '2025-06-17 05:46:11', '2025-06-17 05:46:11'),
	(16, 54, 11, 'Journal Voucher', 'admin.journal-voucher.index', NULL, 4, 1, 1, '2025-06-17 05:46:57', '2025-06-17 05:46:57'),
	(17, 59, 11, 'Voucher Approve', 'admin.voucher-approve.index', NULL, 5, 1, 1, '2025-06-17 05:48:10', '2025-06-17 05:56:08'),
	(18, 62, 11, 'Voucher Refuse', 'admin.voucher-refuse.index', NULL, 6, 1, 1, '2025-06-17 05:50:19', '2025-06-17 05:56:21'),
	(19, 65, 11, 'Automation Approve', 'admin.automation-approve.index', NULL, 7, 1, 1, '2025-06-17 05:51:28', '2025-06-17 05:56:39'),
	(20, 68, 11, 'Automation Refuse', 'admin.automation-refuse.index', NULL, 8, 1, 1, '2025-06-17 05:52:56', '2025-06-17 05:56:47'),
	(21, 71, 12, 'Chart of Accounts', 'admin.coa-list.index', NULL, 1, 1, 1, '2025-06-17 06:02:09', '2025-06-17 06:02:09'),
	(22, 72, 12, 'Daily Voucher List', 'admin.voucher-list.index', NULL, 2, 1, 1, '2025-06-17 06:02:32', '2025-06-17 06:02:32'),
	(23, 73, 12, 'Daily Cash Book', 'admin.cash-book.index', NULL, 3, 1, 1, '2025-06-17 06:03:05', '2025-06-17 06:03:05'),
	(24, 74, 12, 'Bank Book', 'admin.bank-book.index', NULL, 4, 1, 1, '2025-06-17 06:03:16', '2025-06-17 06:03:16'),
	(25, 75, 12, 'Transaction Ledger', 'admin.transaction-ledger.index', NULL, 5, 1, 1, '2025-06-17 06:03:37', '2025-06-17 06:03:37'),
	(26, 76, 12, 'General Ledger', 'admin.general-ledger.index', NULL, 6, 1, 1, '2025-06-17 06:03:52', '2025-06-17 06:03:52'),
	(27, 77, 12, 'Cash Flow Statement', 'admin.cash-flow-statement.index', NULL, 7, 1, 1, '2025-06-17 06:04:23', '2025-06-17 06:04:23'),
	(28, 78, 12, 'Trial Balance', 'admin.trial-balance.index', NULL, 8, 1, 1, '2025-06-17 06:04:35', '2025-06-17 06:04:35'),
	(29, 79, 12, 'Income Statement', 'admin.income-statement.index', NULL, 9, 1, 1, '2025-06-17 06:04:58', '2025-06-17 06:04:58'),
	(30, 80, 12, 'Balance Sheet', 'admin.balance-sheet.index', NULL, 10, 1, 1, '2025-06-17 06:05:13', '2025-06-17 06:05:13'),
	(32, 100, 45, 'Books', 'admin.product.index', '<span class="material-symbols-outlined fs-24"> menu_book </span>', 5, 1, 1, '2025-06-22 08:35:45', '2025-07-19 06:13:58'),
	(39, 138, NULL, 'Inventory', NULL, '<span class="material-symbols-outlined fs-24"> inventory </span>', 4, 1, 1, '2025-07-17 04:00:10', '2025-07-19 05:13:34'),
	(40, 139, 39, 'Productions', 'admin.production.index', NULL, 1, 1, 1, '2025-07-17 04:01:15', '2025-07-17 04:01:15'),
	(41, 155, NULL, 'Sales Management', NULL, '<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>', 4, 1, 1, '2025-07-19 04:47:23', '2025-07-19 04:47:23'),
	(42, 156, 41, 'Dealers', 'admin.client.index', NULL, 1, 1, 1, '2025-07-19 04:49:14', '2025-07-19 04:49:14'),
	(43, 157, 41, 'Sales', 'admin.sales.index', NULL, 2, 1, 1, '2025-07-19 04:49:37', '2025-07-19 04:49:37'),
	(44, 166, 39, 'Stock', 'admin.stock-status.index', NULL, 2, 1, 1, '2025-07-19 04:51:17', '2025-07-25 22:53:04'),
	(45, 167, NULL, 'System Setup', NULL, '<span class="material-symbols-outlined fs-24"> api </span>', 3, 1, 1, '2025-07-19 05:13:16', '2025-07-19 05:13:16'),
	(46, 168, 45, 'Regions', 'admin.region.index', NULL, 1, 1, 1, '2025-07-19 05:14:11', '2025-07-19 06:37:03'),
	(47, 169, 45, 'Area', 'admin.area.index', NULL, 2, 1, 1, '2025-07-19 05:14:30', '2025-07-19 05:14:30'),
	(48, 170, 45, 'Territory', 'admin.territory.index', NULL, 3, 1, 1, '2025-07-19 05:14:48', '2025-07-19 05:14:48'),
	(49, 183, 45, 'Stores', 'admin.store.index', NULL, 4, 1, 1, '2025-07-19 06:14:16', '2025-07-19 06:14:22'),
	(50, 190, 41, 'Collections', 'admin.collection.index', NULL, 3, 1, 1, '2025-07-20 07:50:25', '2025-07-20 07:50:25'),
	(51, 196, 41, 'Sales Returns', 'admin.sales-return.index', NULL, 4, 1, 1, '2025-07-21 05:38:18', '2025-07-21 05:38:18'),
	(53, 208, NULL, 'Profit Distribution', 'admin.profit-distribution.index', '<span class="material-symbols-outlined fs-24"> event_repeat </span>', 7, 1, 1, '2025-07-22 02:47:36', '2025-07-22 02:47:49'),
	(54, 214, NULL, 'Investor Payment', 'admin.investor-payment.index', '<span class="material-symbols-outlined fs-24"> add_card </span>', 8, 1, 1, '2025-07-22 06:50:16', '2025-07-22 06:50:16'),
	(55, 220, NULL, 'Investor Statement', 'admin.investor-statement.index', '<span class="material-symbols-outlined fs-24"> contract </span>', 10, 1, 1, '2025-07-22 22:46:53', '2025-07-22 22:46:53'),
	(57, 230, NULL, 'Rooms Management', NULL, '<span class="material-symbols-outlined fs-22">bed</span>', 12, 1, 1, '2026-02-09 01:27:40', '2026-02-09 01:37:25'),
	(58, 231, 57, 'Room Manage', 'admin.rooms', NULL, 1, 1, 1, '2026-02-09 01:29:44', '2026-02-09 01:29:44'),
	(59, 232, NULL, 'Room Type Management', NULL, '<span class="material-symbols-outlined fs-22">category</span>', 12, 1, 1, '2026-02-09 01:39:17', '2026-02-09 01:39:17'),
	(60, 233, 59, 'Room Type', 'admin.categories.index', NULL, 12, 1, 1, '2026-02-09 01:41:19', '2026-02-09 01:41:59'),
	(61, 234, NULL, 'Booking Management', NULL, '<span class="material-symbols-outlined fs-22 text-primary">     event_note </span>', 13, 1, 1, '2026-02-09 05:31:56', '2026-02-09 05:31:56'),
	(62, 235, 61, 'Booking Manage', 'admin.bookings.index', NULL, 1, 1, 1, '2026-02-09 05:33:01', '2026-02-09 05:33:01'),
	(63, 236, NULL, 'Services Manage', NULL, '<span class="material-symbols-outlined fs-22"> room_service </span>', 14, 1, 1, '2026-02-09 22:13:18', '2026-02-09 22:13:18'),
	(64, 237, NULL, 'Gallery Manage', NULL, '<span class="material-symbols-outlined fs-22"> photo_library </span>', 15, 1, 1, '2026-02-09 22:14:03', '2026-02-09 22:14:03'),
	(65, 238, NULL, 'Testimonial Manage', NULL, '<span class="material-symbols-outlined fs-22"> reviews </span>', 16, 1, 1, '2026-02-09 22:14:36', '2026-02-09 22:14:36'),
	(66, 239, NULL, 'About Manage', NULL, '<span class="material-symbols-outlined fs-22"> info </span>', 17, 1, 1, '2026-02-09 22:15:15', '2026-02-09 22:15:15');

-- Dumping structure for table amar_hostel.admin_menu_actions
DROP TABLE IF EXISTS `admin_menu_actions`;
CREATE TABLE IF NOT EXISTS `admin_menu_actions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `admin_menu_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_actions_permission_id_foreign` (`permission_id`),
  KEY `admin_menu_actions_admin_menu_id_foreign` (`admin_menu_id`),
  CONSTRAINT `admin_menu_actions_admin_menu_id_foreign` FOREIGN KEY (`admin_menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menu_actions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.admin_menu_actions: ~121 rows (approximately)
DELETE FROM `admin_menu_actions`;
INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
	(1, 8, 5, 'create', 'admin.admin-menu.create', 1, '2025-06-17 05:30:00', '2025-06-17 05:30:00'),
	(2, 9, 5, 'edit', 'admin.admin-menu.edit', 1, '2025-06-17 05:30:15', '2025-06-17 05:30:15'),
	(3, 10, 5, 'delete', 'admin.admin-menu.destroy', 1, '2025-06-17 05:30:19', '2025-06-17 05:30:19'),
	(4, 11, 5, 'view actions', 'admin.admin-menu-action.index', 1, '2025-06-17 05:30:59', '2025-06-17 05:30:59'),
	(5, 12, 5, 'create action', 'admin.admin-menu-action.create', 1, '2025-06-17 05:31:06', '2025-06-17 05:31:06'),
	(6, 13, 5, 'edit action', 'admin.admin-menu-action.edit', 1, '2025-06-17 05:31:15', '2025-06-17 05:31:15'),
	(7, 14, 5, 'delete action', 'admin.admin-menu-action.destroy', 1, '2025-06-17 05:31:21', '2025-06-17 05:31:21'),
	(8, 15, 3, 'create', 'admin.role.create', 1, '2025-06-17 05:32:05', '2025-06-17 05:32:05'),
	(9, 16, 3, 'edit', 'admin.role.edit', 1, '2025-06-17 05:32:09', '2025-06-17 05:32:09'),
	(10, 17, 3, 'delete', 'admin.role.destroy', 1, '2025-06-17 05:32:15', '2025-06-17 05:32:15'),
	(11, 18, 3, 'edit permission', 'admin.role-permission.edit', 1, '2025-06-17 05:32:50', '2025-06-17 05:32:50'),
	(12, 19, 4, 'create', 'admin.user.create', 1, '2025-06-17 05:33:17', '2025-06-17 05:33:17'),
	(13, 20, 4, 'edit', 'admin.user.edit', 1, '2025-06-17 05:33:20', '2025-06-17 05:33:20'),
	(16, 23, 7, 'create', 'admin.investor.create', 1, '2025-06-17 05:34:17', '2025-06-17 05:34:17'),
	(17, 24, 7, 'edit', 'admin.investor.edit', 1, '2025-06-17 05:34:20', '2025-06-17 05:34:20'),
	(18, 25, 7, 'delete', 'admin.investor.destroy', 1, '2025-06-17 05:34:27', '2025-06-17 05:34:27'),
	(19, 26, 7, 'trash', 'admin.investor.trash', 1, '2025-06-17 05:34:33', '2025-06-17 05:34:33'),
	(20, 28, 8, 'create', 'admin.invest.create', 1, '2025-06-17 05:38:48', '2025-06-17 05:38:48'),
	(21, 29, 8, 'edit', 'admin.invest.edit', 1, '2025-06-17 05:38:52', '2025-06-17 05:38:52'),
	(24, 33, 9, 'create', 'admin.invest-sattlement.create', 1, '2025-06-17 05:41:09', '2025-06-23 04:19:25'),
	(25, 34, 9, 'edit', 'admin.invest-sattlement.edit', 1, '2025-06-17 05:41:13', '2025-06-23 04:19:31'),
	(28, 41, 13, 'create', 'admin.coa.create', 1, '2025-06-17 05:44:10', '2025-06-17 05:44:10'),
	(29, 42, 13, 'edit', 'admin.coa.edit', 1, '2025-06-17 05:44:15', '2025-06-17 05:44:15'),
	(30, 43, 13, 'delete', 'admin.coa.destroy', 1, '2025-06-17 05:44:20', '2025-06-17 05:44:20'),
	(31, 45, 14, 'create', 'admin.debit-voucher.create', 1, '2025-06-17 05:45:12', '2025-06-17 05:45:12'),
	(32, 46, 14, 'edit', 'admin.debit-voucher.edit', 1, '2025-06-17 05:45:17', '2025-06-17 05:45:17'),
	(35, 50, 15, 'create', 'admin.credit-voucher.create', 1, '2025-06-17 05:46:23', '2025-06-17 05:46:23'),
	(36, 51, 15, 'edit', 'admin.credit-voucher.edit', 1, '2025-06-17 05:46:27', '2025-06-17 05:46:27'),
	(39, 55, 16, 'create', 'admin.journal-voucher.create', 1, '2025-06-17 05:47:08', '2025-06-17 05:47:08'),
	(40, 56, 16, 'edit', 'admin.journal-voucher.edit', 1, '2025-06-17 05:47:13', '2025-06-17 05:47:13'),
	(43, 60, 17, 'view', 'admin.voucher-approve.show', 1, '2025-06-17 05:48:51', '2025-06-17 05:48:51'),
	(44, 61, 17, 'approve', 'admin.voucher-approve.edit', 1, '2025-06-17 05:49:08', '2025-06-17 05:49:08'),
	(45, 63, 18, 'view', 'admin.voucher-refuse.show', 1, '2025-06-17 05:50:44', '2025-06-17 05:50:44'),
	(46, 64, 18, 'approve', 'admin.voucher-refuse.edit', 1, '2025-06-17 05:50:49', '2025-06-17 05:50:49'),
	(47, 66, 19, 'view', 'admin.automation-approve.show', 1, '2025-06-17 05:51:41', '2025-06-17 05:51:41'),
	(48, 67, 19, 'approve', 'admin.automation-approve.edit', 1, '2025-06-17 05:51:52', '2025-06-17 05:51:52'),
	(49, 69, 20, 'view', 'admin.automation-refuse.show', 1, '2025-06-17 05:53:09', '2025-06-17 05:53:09'),
	(50, 70, 20, 'refuse', 'admin.automation-refuse.edit', 1, '2025-06-17 05:53:17', '2025-06-17 05:53:17'),
	(51, 81, 14, 'view', 'admin.debit-voucher.show', 1, '2025-06-18 04:03:34', '2025-06-18 04:03:34'),
	(52, 82, 14, 'print', 'admin.debit-voucher.print', 1, '2025-06-18 04:03:38', '2025-06-18 04:03:38'),
	(53, 83, 14, 'delete', 'admin.debit-voucher.destroy', 1, '2025-06-18 04:03:43', '2025-06-18 04:03:43'),
	(54, 84, 14, 'trash', 'admin.debit-voucher.trash', 1, '2025-06-18 04:03:47', '2025-06-18 04:03:47'),
	(55, 85, 15, 'view', 'admin.credit-voucher.show', 1, '2025-06-18 22:26:47', '2025-06-18 22:26:47'),
	(56, 86, 15, 'print', 'admin.credit-voucher.print', 1, '2025-06-18 22:26:51', '2025-06-18 22:26:51'),
	(57, 87, 15, 'delete', 'admin.credit-voucher.destroy', 1, '2025-06-18 22:26:59', '2025-06-18 22:26:59'),
	(58, 88, 15, 'trash', 'admin.credit-voucher.trash', 1, '2025-06-18 22:27:03', '2025-06-18 22:27:03'),
	(60, 90, 8, 'delete', 'admin.invest.destroy', 1, '2025-06-19 08:47:54', '2025-06-19 08:47:54'),
	(61, 91, 8, 'trash', 'admin.invest.trash', 1, '2025-06-19 08:47:58', '2025-06-19 08:47:58'),
	(69, 101, 32, 'create', 'admin.product.create', 1, '2025-06-22 08:36:30', '2025-07-13 02:14:48'),
	(70, 102, 32, 'edit', 'admin.product.edit', 1, '2025-06-22 08:36:33', '2025-07-13 02:14:53'),
	(91, 127, 9, 'view', 'admin.invest-sattlement.show', 1, '2025-06-23 04:19:48', '2025-06-23 04:19:48'),
	(92, 128, 9, 'delete', 'admin.invest-sattlement.destroy', 1, '2025-06-23 04:19:56', '2025-06-23 04:19:56'),
	(93, 129, 9, 'trash', 'admin.invest-sattlement.trash', 1, '2025-06-23 04:20:01', '2025-06-23 04:20:01'),
	(94, 130, 4, 'change password', 'admin.user.password', 1, '2025-06-23 22:35:11', '2025-06-23 22:35:11'),
	(95, 131, 4, 'delete', 'admin.user.destroy', 1, '2025-06-23 22:35:16', '2025-06-23 22:35:16'),
	(96, 132, 4, 'trash', 'admin.user.trash', 1, '2025-06-23 22:35:21', '2025-06-23 22:35:21'),
	(97, 135, 32, 'view editions', 'admin.product-edition.index', 1, '2025-07-16 22:24:15', '2025-07-17 06:25:16'),
	(102, 142, 32, 'create edition', 'admin.product-edition.store', 1, '2025-07-17 06:27:56', '2025-07-17 06:29:13'),
	(103, 143, 32, 'edit edition', 'admin.product-edition.edit', 1, '2025-07-17 06:28:06', '2025-07-17 06:28:06'),
	(104, 144, 32, 'delete edition', 'admin.product-edition.destroy', 1, '2025-07-17 06:28:19', '2025-07-17 06:28:19'),
	(105, 145, 32, 'delete', 'admin.product.destroy', 1, '2025-07-17 06:28:23', '2025-07-17 06:28:23'),
	(106, 146, 32, 'trash', 'admin.product.trash', 1, '2025-07-17 06:28:28', '2025-07-17 06:28:28'),
	(107, 147, 40, 'create', 'admin.production.create', 1, '2025-07-18 22:28:23', '2025-07-18 22:28:23'),
	(108, 148, 40, 'edit', 'admin.production.edit', 1, '2025-07-18 22:28:27', '2025-07-18 22:28:27'),
	(109, 149, 40, 'view', 'admin.production.show', 1, '2025-07-18 22:28:33', '2025-07-18 22:28:33'),
	(112, 152, 40, 'print', 'admin.production.print', 1, '2025-07-19 04:38:54', '2025-07-19 04:38:54'),
	(113, 153, 40, 'delete', 'admin.production.destroy', 1, '2025-07-19 04:38:59', '2025-07-19 04:38:59'),
	(114, 154, 40, 'trash', 'admin.production.trash', 1, '2025-07-19 04:39:06', '2025-07-19 04:39:06'),
	(115, 158, 42, 'create', 'admin.client.create', 1, '2025-07-19 04:49:55', '2025-07-19 04:49:55'),
	(116, 159, 42, 'edit', 'admin.client.edit', 1, '2025-07-19 04:50:00', '2025-07-19 04:50:00'),
	(117, 160, 42, 'delete', 'admin.client.destroy', 1, '2025-07-19 04:50:07', '2025-07-19 04:50:07'),
	(118, 161, 42, 'trash', 'admin.client.trash', 1, '2025-07-19 04:50:11', '2025-07-19 04:50:11'),
	(119, 162, 43, 'create', 'admin.sales.create', 1, '2025-07-19 04:50:26', '2025-07-19 04:50:26'),
	(120, 163, 43, 'edit', 'admin.sales.edit', 1, '2025-07-19 04:50:29', '2025-07-19 04:50:29'),
	(121, 164, 43, 'print', 'admin.sales.show', 1, '2025-07-19 04:50:33', '2025-07-20 07:51:18'),
	(123, 171, 46, 'create', 'admin.region.create', 1, '2025-07-19 06:11:34', '2025-07-19 06:11:34'),
	(124, 172, 46, 'edit', 'admin.region.edit', 1, '2025-07-19 06:11:40', '2025-07-19 06:11:40'),
	(125, 173, 46, 'delete', 'admin.region.destroy', 1, '2025-07-19 06:11:45', '2025-07-19 06:11:45'),
	(126, 174, 46, 'trash', 'admin.region.trash', 1, '2025-07-19 06:11:50', '2025-07-19 06:11:50'),
	(127, 175, 47, 'create', 'admin.area.create', 1, '2025-07-19 06:12:18', '2025-07-19 06:12:18'),
	(128, 176, 47, 'edit', 'admin.area.edit', 1, '2025-07-19 06:12:21', '2025-07-19 06:12:21'),
	(129, 177, 47, 'delete', 'admin.area.destroy', 1, '2025-07-19 06:12:33', '2025-07-19 06:12:33'),
	(130, 178, 47, 'trash', 'admin.area.trash', 1, '2025-07-19 06:12:40', '2025-07-19 06:12:40'),
	(131, 179, 48, 'create', 'admin.territory.create', 1, '2025-07-19 06:12:53', '2025-07-19 06:12:53'),
	(132, 180, 48, 'edit', 'admin.territory.edit', 1, '2025-07-19 06:12:56', '2025-07-19 06:12:56'),
	(133, 181, 48, 'delete', 'admin.territory.destroy', 1, '2025-07-19 06:13:00', '2025-07-19 06:13:00'),
	(134, 182, 48, 'trash', 'admin.territory.trash', 1, '2025-07-19 06:13:06', '2025-07-19 06:13:06'),
	(135, 184, 49, 'create', 'admin.store.create', 1, '2025-07-19 06:14:31', '2025-07-19 06:14:31'),
	(136, 185, 49, 'edit', 'admin.store.edit', 1, '2025-07-19 06:14:34', '2025-07-19 06:14:34'),
	(137, 186, 49, 'delete', 'admin.store.destroy', 1, '2025-07-19 06:14:39', '2025-07-19 06:14:39'),
	(138, 187, 49, 'trash', 'admin.store.trash', 1, '2025-07-19 06:14:45', '2025-07-19 06:14:45'),
	(139, 188, 43, 'delete', 'admin.sales.destroy', 1, '2025-07-20 07:36:18', '2025-07-20 07:36:18'),
	(140, 189, 43, 'trash', 'admin.sales.trash', 1, '2025-07-20 07:36:23', '2025-07-20 07:36:23'),
	(141, 191, 50, 'create', 'admin.collection.create', 1, '2025-07-20 07:50:36', '2025-07-20 07:50:36'),
	(142, 192, 50, 'edit', 'admin.collection.edit', 1, '2025-07-20 07:50:41', '2025-07-20 07:50:41'),
	(143, 193, 50, 'print', 'admin.collection.show', 1, '2025-07-20 07:50:45', '2025-07-20 07:50:45'),
	(144, 194, 50, 'delete', 'admin.collection.destroy', 1, '2025-07-20 07:50:52', '2025-07-20 07:50:52'),
	(145, 195, 50, 'trash', 'admin.collection.trash', 1, '2025-07-20 07:50:56', '2025-07-20 07:50:56'),
	(146, 197, 51, 'create', 'admin.sales-return.create', 1, '2025-07-21 05:38:34', '2025-07-21 05:38:34'),
	(147, 198, 51, 'edit', 'admin.sales-return.edit', 1, '2025-07-21 05:38:45', '2025-07-21 05:38:45'),
	(148, 199, 51, 'print', 'admin.sales-return.show', 1, '2025-07-21 05:38:49', '2025-07-21 05:38:49'),
	(149, 200, 51, 'delete', 'admin.sales-return.destroy', 1, '2025-07-21 05:38:55', '2025-07-21 05:38:55'),
	(150, 201, 51, 'trash', 'admin.sales-return.trash', 1, '2025-07-21 05:39:07', '2025-07-21 05:39:07'),
	(156, 209, 53, 'create', 'admin.profit-distribution.create', 1, '2025-07-22 02:47:59', '2025-07-22 02:47:59'),
	(157, 210, 53, 'edit', 'admin.profit-distribution.edit', 1, '2025-07-22 02:48:05', '2025-07-22 02:48:05'),
	(158, 211, 53, 'view', 'admin.profit-distribution.show', 1, '2025-07-22 02:48:09', '2025-07-22 02:48:09'),
	(159, 212, 53, 'delete', 'admin.profit-distribution.destroy', 1, '2025-07-22 02:48:16', '2025-07-22 02:48:16'),
	(160, 213, 53, 'trash', 'admin.profit-distribution.trash', 1, '2025-07-22 02:48:22', '2025-07-22 02:48:22'),
	(161, 215, 54, 'create', 'admin.investor-payment.create', 1, '2025-07-22 06:50:27', '2025-07-22 06:50:27'),
	(162, 216, 54, 'edit', 'admin.investor-payment.edit', 1, '2025-07-22 06:50:31', '2025-07-22 06:50:31'),
	(163, 217, 54, 'view', 'admin.investor-payment.show', 1, '2025-07-22 06:50:38', '2025-07-22 06:50:38'),
	(164, 218, 54, 'delete', 'admin.investor-payment.destroy', 1, '2025-07-22 06:50:44', '2025-07-22 06:50:44'),
	(165, 219, 54, 'trash', 'admin.investor-payment.trash', 1, '2025-07-22 06:50:50', '2025-07-22 06:50:50'),
	(166, 221, 16, 'show', 'admin.journal-voucher.show', 1, '2025-08-31 23:33:11', '2025-08-31 23:33:11'),
	(167, 222, 16, 'print', 'admin.journal-voucher.print', 1, '2025-08-31 23:33:17', '2025-08-31 23:33:17'),
	(168, 223, 16, 'delete', 'admin.journal-voucher.destroy', 1, '2025-08-31 23:33:21', '2025-08-31 23:33:21'),
	(169, 224, 16, 'trash', 'admin.journal-voucher.trash', 1, '2025-08-31 23:34:07', '2025-08-31 23:34:07');

-- Dumping structure for table amar_hostel.admin_settings
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE IF NOT EXISTS `admin_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_value` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.admin_settings: ~1 rows (approximately)
DELETE FROM `admin_settings`;
INSERT INTO `admin_settings` (`id`, `logo`, `small_logo`, `favicon`, `share_value`, `title`, `footer_text`, `primary_color`, `secondary_color`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
	(1, 'storage/admin-setting//2026-02-10-quLl7x6LIpOewvLbubTsJtU9vDBuvRatfjvBTaAY.webp', 'storage/admin-setting//2026-02-10-npcVYQ5HMBIhcqH4DAsj5jOFLAkekKGIRl2ZzRSx.webp', 'storage/admin-setting//2026-02-10-uKHdiBUMHBaK5EWxiGoTNqLRKYfMBFDHxrbvwVlu.webp', 10000, 'Amar Hostel', '© 2023 Developed by <a target="_blank" href="http://www.technoparkbd.com/">Techno Park Bangladesh</a>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09 22:38:23', '2026-02-09 22:38:23');

-- Dumping structure for table amar_hostel.bookings
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `guests` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','checked_in','checked_out','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_room_id_foreign` (`room_id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.bookings: ~11 rows (approximately)
DELETE FROM `bookings`;
INSERT INTO `bookings` (`id`, `room_id`, `user_id`, `duration`, `check_in`, `check_out`, `guests`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
	(1, 8, 3, '', '2026-02-08', '2026-02-26', 4, 176.00, 'confirmed', '2026-02-08 04:41:05', '2026-02-09 23:42:24'),
	(2, 6, 3, '', '2026-02-08', '2026-02-09', 2, 44.00, 'checked_out', '2026-02-08 05:01:46', '2026-02-09 23:42:38'),
	(3, 6, 3, '', '2026-02-08', '2026-02-09', 3, 66.00, 'confirmed', '2026-02-08 05:04:37', '2026-02-08 05:04:37'),
	(4, 8, 3, '', '2026-02-08', '2026-02-11', 2, 88.00, 'confirmed', '2026-02-08 05:07:06', '2026-02-08 05:07:06'),
	(5, 6, 3, '', '2026-02-08', '2026-02-10', 2, 44.00, 'checked_out', '2026-02-08 05:09:29', '2026-02-09 04:55:47'),
	(6, 2, 3, '', '2026-02-08', '2026-02-09', 2, 44.00, 'cancelled', '2026-02-08 05:10:38', '2026-02-09 04:55:26'),
	(7, 6, 3, '', '2026-02-08', '2026-02-12', 1, 22.00, 'confirmed', '2026-02-08 05:11:52', '2026-02-08 05:11:52'),
	(8, 6, 3, '', '2026-02-08', '2026-02-19', 2, 44.00, 'confirmed', '2026-02-08 05:18:18', '2026-02-08 05:18:18'),
	(9, 9, 3, '', '2026-02-08', '2026-02-20', 2, 90.00, 'confirmed', '2026-02-08 05:52:44', '2026-02-09 05:28:09'),
	(10, 6, 3, '', '2026-02-08', '2026-02-10', 12, 264.00, 'checked_out', '2026-02-08 05:53:34', '2026-02-09 23:52:46'),
	(11, 8, 3, '', '2026-02-08', '2026-02-09', 1, 44.00, 'pending', '2026-02-08 05:55:54', '2026-02-08 05:55:54'),
	(12, 2, 1, '', '2026-02-09', '2026-02-10', 2, 44.00, 'pending', '2026-02-09 03:15:51', '2026-02-09 03:15:51'),
	(13, 2, 3, '', '2026-02-09', '2026-02-10', 1, 22.00, 'pending', '2026-02-09 04:00:29', '2026-02-09 04:00:29'),
	(14, 2, 1, '', '2026-02-09', '2026-02-11', 3, 66.00, 'pending', '2026-02-09 05:45:01', '2026-02-09 05:45:01'),
	(15, 2, 3, '', '2026-02-09', '2026-02-11', 3, 66.00, 'pending', '2026-02-09 06:21:13', '2026-02-09 06:21:13'),
	(16, 6, 1, '', '2026-02-10', '2026-02-14', 4, 88.00, 'confirmed', '2026-02-09 23:37:59', '2026-02-09 23:40:27'),
	(17, 11, 1, '', '2026-02-10', '2026-02-11', 2, 66.00, 'pending', '2026-02-10 01:53:34', '2026-02-10 01:53:34'),
	(18, 2, 1, '', '2026-02-10', '2026-02-11', 5, 110.00, 'checked_out', '2026-02-10 03:19:32', '2026-02-10 03:24:12'),
	(19, 11, 1, '', '2026-02-10', '2026-02-11', 1, 33.00, 'checked_out', '2026-02-10 03:46:45', '2026-02-10 03:47:54'),
	(20, 9, 1, '', '2026-02-10', '2026-02-11', 1, 45.00, 'pending', '2026-02-10 04:13:10', '2026-02-10 04:13:10');

-- Dumping structure for table amar_hostel.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.cache: ~4 rows (approximately)
DELETE FROM `cache`;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('books_books_cache_admin_menus', 'O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:18:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:07:50";s:10:"updated_at";s:19:"2025-06-17 11:31:46";}s:11:"\0*\0original";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:07:50";s:10:"updated_at";s:19:"2025-06-17 11:31:46";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:14";s:10:"updated_at";s:19:"2025-06-17 11:10:14";}s:11:"\0*\0original";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:14";s:10:"updated_at";s:19:"2025-06-17 11:10:14";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:36";s:10:"updated_at";s:19:"2025-06-17 11:10:36";}s:11:"\0*\0original";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:36";s:10:"updated_at";s:19:"2025-06-17 11:10:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:10";s:10:"updated_at";s:19:"2025-06-17 11:11:10";}s:11:"\0*\0original";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:10";s:10:"updated_at";s:19:"2025-06-17 11:11:10";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";i:2;s:4:"name";s:4:"Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:51";s:10:"updated_at";s:19:"2025-06-17 11:11:51";}s:11:"\0*\0original";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";i:2;s:4:"name";s:4:"Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:51";s:10:"updated_at";s:19:"2025-06-17 11:11:51";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:12:59";s:10:"updated_at";s:19:"2025-06-17 11:12:59";}s:11:"\0*\0original";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:12:59";s:10:"updated_at";s:19:"2025-06-17 11:12:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:7;s:13:"permission_id";i:7;s:9:"parent_id";i:2;s:4:"name";s:9:"Investors";s:5:"route";s:20:"admin.investor.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:13:38";s:10:"updated_at";s:19:"2025-06-17 11:13:38";}s:11:"\0*\0original";a:11:{s:2:"id";i:7;s:13:"permission_id";i:7;s:9:"parent_id";i:2;s:4:"name";s:9:"Investors";s:5:"route";s:20:"admin.investor.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:13:38";s:10:"updated_at";s:19:"2025-06-17 11:13:38";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:45;s:13:"permission_id";i:167;s:9:"parent_id";N;s:4:"name";s:12:"System Setup";s:5:"route";N;s:4:"icon";s:58:"<span class="material-symbols-outlined fs-24"> api </span>";s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:13:16";s:10:"updated_at";s:19:"2025-07-19 11:13:16";}s:11:"\0*\0original";a:11:{s:2:"id";i:45;s:13:"permission_id";i:167;s:9:"parent_id";N;s:4:"name";s:12:"System Setup";s:5:"route";N;s:4:"icon";s:58:"<span class="material-symbols-outlined fs-24"> api </span>";s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:13:16";s:10:"updated_at";s:19:"2025-07-19 11:13:16";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:46;s:13:"permission_id";i:168;s:9:"parent_id";i:45;s:4:"name";s:7:"Regions";s:5:"route";s:18:"admin.region.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:11";s:10:"updated_at";s:19:"2025-07-19 12:37:03";}s:11:"\0*\0original";a:11:{s:2:"id";i:46;s:13:"permission_id";i:168;s:9:"parent_id";i:45;s:4:"name";s:7:"Regions";s:5:"route";s:18:"admin.region.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:11";s:10:"updated_at";s:19:"2025-07-19 12:37:03";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:47;s:13:"permission_id";i:169;s:9:"parent_id";i:45;s:4:"name";s:4:"Area";s:5:"route";s:16:"admin.area.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:30";s:10:"updated_at";s:19:"2025-07-19 11:14:30";}s:11:"\0*\0original";a:11:{s:2:"id";i:47;s:13:"permission_id";i:169;s:9:"parent_id";i:45;s:4:"name";s:4:"Area";s:5:"route";s:16:"admin.area.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:30";s:10:"updated_at";s:19:"2025-07-19 11:14:30";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:48;s:13:"permission_id";i:170;s:9:"parent_id";i:45;s:4:"name";s:9:"Territory";s:5:"route";s:21:"admin.territory.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:48";s:10:"updated_at";s:19:"2025-07-19 11:14:48";}s:11:"\0*\0original";a:11:{s:2:"id";i:48;s:13:"permission_id";i:170;s:9:"parent_id";i:45;s:4:"name";s:9:"Territory";s:5:"route";s:21:"admin.territory.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:48";s:10:"updated_at";s:19:"2025-07-19 11:14:48";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:49;s:13:"permission_id";i:183;s:9:"parent_id";i:45;s:4:"name";s:6:"Stores";s:5:"route";s:17:"admin.store.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 12:14:16";s:10:"updated_at";s:19:"2025-07-19 12:14:22";}s:11:"\0*\0original";a:11:{s:2:"id";i:49;s:13:"permission_id";i:183;s:9:"parent_id";i:45;s:4:"name";s:6:"Stores";s:5:"route";s:17:"admin.store.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 12:14:16";s:10:"updated_at";s:19:"2025-07-19 12:14:22";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:32;s:13:"permission_id";i:100;s:9:"parent_id";i:45;s:4:"name";s:5:"Books";s:5:"route";s:19:"admin.product.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> menu_book </span>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-22 14:35:45";s:10:"updated_at";s:19:"2025-07-19 12:13:58";}s:11:"\0*\0original";a:11:{s:2:"id";i:32;s:13:"permission_id";i:100;s:9:"parent_id";i:45;s:4:"name";s:5:"Books";s:5:"route";s:19:"admin.product.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> menu_book </span>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-22 14:35:45";s:10:"updated_at";s:19:"2025-07-19 12:13:58";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:39;s:13:"permission_id";i:138;s:9:"parent_id";N;s:4:"name";s:9:"Inventory";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:00:10";s:10:"updated_at";s:19:"2025-07-19 11:13:34";}s:11:"\0*\0original";a:11:{s:2:"id";i:39;s:13:"permission_id";i:138;s:9:"parent_id";N;s:4:"name";s:9:"Inventory";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:00:10";s:10:"updated_at";s:19:"2025-07-19 11:13:34";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:2:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:40;s:13:"permission_id";i:139;s:9:"parent_id";i:39;s:4:"name";s:11:"Productions";s:5:"route";s:22:"admin.production.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:01:15";s:10:"updated_at";s:19:"2025-07-17 10:01:15";}s:11:"\0*\0original";a:11:{s:2:"id";i:40;s:13:"permission_id";i:139;s:9:"parent_id";i:39;s:4:"name";s:11:"Productions";s:5:"route";s:22:"admin.production.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:01:15";s:10:"updated_at";s:19:"2025-07-17 10:01:15";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:44;s:13:"permission_id";i:166;s:9:"parent_id";i:39;s:4:"name";s:5:"Stock";s:5:"route";s:24:"admin.stock-status.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:51:17";s:10:"updated_at";s:19:"2025-07-26 04:53:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:44;s:13:"permission_id";i:166;s:9:"parent_id";i:39;s:4:"name";s:5:"Stock";s:5:"route";s:24:"admin.stock-status.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:51:17";s:10:"updated_at";s:19:"2025-07-26 04:53:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:41;s:13:"permission_id";i:155;s:9:"parent_id";N;s:4:"name";s:16:"Sales Management";s:5:"route";N;s:4:"icon";s:71:"<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:47:23";s:10:"updated_at";s:19:"2025-07-19 10:47:23";}s:11:"\0*\0original";a:11:{s:2:"id";i:41;s:13:"permission_id";i:155;s:9:"parent_id";N;s:4:"name";s:16:"Sales Management";s:5:"route";N;s:4:"icon";s:71:"<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:47:23";s:10:"updated_at";s:19:"2025-07-19 10:47:23";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:4:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:42;s:13:"permission_id";i:156;s:9:"parent_id";i:41;s:4:"name";s:7:"Dealers";s:5:"route";s:18:"admin.client.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:14";s:10:"updated_at";s:19:"2025-07-19 10:49:14";}s:11:"\0*\0original";a:11:{s:2:"id";i:42;s:13:"permission_id";i:156;s:9:"parent_id";i:41;s:4:"name";s:7:"Dealers";s:5:"route";s:18:"admin.client.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:14";s:10:"updated_at";s:19:"2025-07-19 10:49:14";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:43;s:13:"permission_id";i:157;s:9:"parent_id";i:41;s:4:"name";s:5:"Sales";s:5:"route";s:17:"admin.sales.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:37";s:10:"updated_at";s:19:"2025-07-19 10:49:37";}s:11:"\0*\0original";a:11:{s:2:"id";i:43;s:13:"permission_id";i:157;s:9:"parent_id";i:41;s:4:"name";s:5:"Sales";s:5:"route";s:17:"admin.sales.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:37";s:10:"updated_at";s:19:"2025-07-19 10:49:37";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:50;s:13:"permission_id";i:190;s:9:"parent_id";i:41;s:4:"name";s:11:"Collections";s:5:"route";s:22:"admin.collection.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-20 13:50:25";s:10:"updated_at";s:19:"2025-07-20 13:50:25";}s:11:"\0*\0original";a:11:{s:2:"id";i:50;s:13:"permission_id";i:190;s:9:"parent_id";i:41;s:4:"name";s:11:"Collections";s:5:"route";s:22:"admin.collection.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-20 13:50:25";s:10:"updated_at";s:19:"2025-07-20 13:50:25";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:51;s:13:"permission_id";i:196;s:9:"parent_id";i:41;s:4:"name";s:13:"Sales Returns";s:5:"route";s:24:"admin.sales-return.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-21 11:38:18";s:10:"updated_at";s:19:"2025-07-21 11:38:18";}s:11:"\0*\0original";a:11:{s:2:"id";i:51;s:13:"permission_id";i:196;s:9:"parent_id";i:41;s:4:"name";s:13:"Sales Returns";s:5:"route";s:24:"admin.sales-return.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-21 11:38:18";s:10:"updated_at";s:19:"2025-07-21 11:38:18";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:8;s:13:"permission_id";i:27;s:9:"parent_id";N;s:4:"name";s:14:"Invest Process";s:5:"route";s:18:"admin.invest.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> finance_mode </span>";s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:37:47";s:10:"updated_at";s:19:"2025-07-19 10:48:45";}s:11:"\0*\0original";a:11:{s:2:"id";i:8;s:13:"permission_id";i:27;s:9:"parent_id";N;s:4:"name";s:14:"Invest Process";s:5:"route";s:18:"admin.invest.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> finance_mode </span>";s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:37:47";s:10:"updated_at";s:19:"2025-07-19 10:48:45";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:4:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:20;s:13:"permission_id";i:28;s:13:"admin_menu_id";i:8;s:4:"name";s:6:"create";s:5:"route";s:19:"admin.invest.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:38:48";s:10:"updated_at";s:19:"2025-06-17 11:38:48";}s:11:"\0*\0original";a:8:{s:2:"id";i:20;s:13:"permission_id";i:28;s:13:"admin_menu_id";i:8;s:4:"name";s:6:"create";s:5:"route";s:19:"admin.invest.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:38:48";s:10:"updated_at";s:19:"2025-06-17 11:38:48";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:21;s:13:"permission_id";i:29;s:13:"admin_menu_id";i:8;s:4:"name";s:4:"edit";s:5:"route";s:17:"admin.invest.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:38:52";s:10:"updated_at";s:19:"2025-06-17 11:38:52";}s:11:"\0*\0original";a:8:{s:2:"id";i:21;s:13:"permission_id";i:29;s:13:"admin_menu_id";i:8;s:4:"name";s:4:"edit";s:5:"route";s:17:"admin.invest.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:38:52";s:10:"updated_at";s:19:"2025-06-17 11:38:52";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:60;s:13:"permission_id";i:90;s:13:"admin_menu_id";i:8;s:4:"name";s:6:"delete";s:5:"route";s:20:"admin.invest.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-19 14:47:54";s:10:"updated_at";s:19:"2025-06-19 14:47:54";}s:11:"\0*\0original";a:8:{s:2:"id";i:60;s:13:"permission_id";i:90;s:13:"admin_menu_id";i:8;s:4:"name";s:6:"delete";s:5:"route";s:20:"admin.invest.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-19 14:47:54";s:10:"updated_at";s:19:"2025-06-19 14:47:54";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:61;s:13:"permission_id";i:91;s:13:"admin_menu_id";i:8;s:4:"name";s:5:"trash";s:5:"route";s:18:"admin.invest.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-19 14:47:58";s:10:"updated_at";s:19:"2025-06-19 14:47:58";}s:11:"\0*\0original";a:8:{s:2:"id";i:61;s:13:"permission_id";i:91;s:13:"admin_menu_id";i:8;s:4:"name";s:5:"trash";s:5:"route";s:18:"admin.invest.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-19 14:47:58";s:10:"updated_at";s:19:"2025-06-19 14:47:58";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:53;s:13:"permission_id";i:208;s:9:"parent_id";N;s:4:"name";s:19:"Profit Distribution";s:5:"route";s:31:"admin.profit-distribution.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> event_repeat </span>";s:5:"order";i:7;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:36";s:10:"updated_at";s:19:"2025-07-22 08:47:49";}s:11:"\0*\0original";a:11:{s:2:"id";i:53;s:13:"permission_id";i:208;s:9:"parent_id";N;s:4:"name";s:19:"Profit Distribution";s:5:"route";s:31:"admin.profit-distribution.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> event_repeat </span>";s:5:"order";i:7;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:36";s:10:"updated_at";s:19:"2025-07-22 08:47:49";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:156;s:13:"permission_id";i:209;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"create";s:5:"route";s:32:"admin.profit-distribution.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:59";s:10:"updated_at";s:19:"2025-07-22 08:47:59";}s:11:"\0*\0original";a:8:{s:2:"id";i:156;s:13:"permission_id";i:209;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"create";s:5:"route";s:32:"admin.profit-distribution.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:59";s:10:"updated_at";s:19:"2025-07-22 08:47:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:157;s:13:"permission_id";i:210;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"edit";s:5:"route";s:30:"admin.profit-distribution.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:05";s:10:"updated_at";s:19:"2025-07-22 08:48:05";}s:11:"\0*\0original";a:8:{s:2:"id";i:157;s:13:"permission_id";i:210;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"edit";s:5:"route";s:30:"admin.profit-distribution.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:05";s:10:"updated_at";s:19:"2025-07-22 08:48:05";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:158;s:13:"permission_id";i:211;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"view";s:5:"route";s:30:"admin.profit-distribution.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:09";s:10:"updated_at";s:19:"2025-07-22 08:48:09";}s:11:"\0*\0original";a:8:{s:2:"id";i:158;s:13:"permission_id";i:211;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"view";s:5:"route";s:30:"admin.profit-distribution.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:09";s:10:"updated_at";s:19:"2025-07-22 08:48:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:159;s:13:"permission_id";i:212;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"delete";s:5:"route";s:33:"admin.profit-distribution.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:16";s:10:"updated_at";s:19:"2025-07-22 08:48:16";}s:11:"\0*\0original";a:8:{s:2:"id";i:159;s:13:"permission_id";i:212;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"delete";s:5:"route";s:33:"admin.profit-distribution.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:16";s:10:"updated_at";s:19:"2025-07-22 08:48:16";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:160;s:13:"permission_id";i:213;s:13:"admin_menu_id";i:53;s:4:"name";s:5:"trash";s:5:"route";s:31:"admin.profit-distribution.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:22";s:10:"updated_at";s:19:"2025-07-22 08:48:22";}s:11:"\0*\0original";a:8:{s:2:"id";i:160;s:13:"permission_id";i:213;s:13:"admin_menu_id";i:53;s:4:"name";s:5:"trash";s:5:"route";s:31:"admin.profit-distribution.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:22";s:10:"updated_at";s:19:"2025-07-22 08:48:22";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:7;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:54;s:13:"permission_id";i:214;s:9:"parent_id";N;s:4:"name";s:16:"Investor Payment";s:5:"route";s:28:"admin.investor-payment.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> add_card </span>";s:5:"order";i:8;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:16";s:10:"updated_at";s:19:"2025-07-22 12:50:16";}s:11:"\0*\0original";a:11:{s:2:"id";i:54;s:13:"permission_id";i:214;s:9:"parent_id";N;s:4:"name";s:16:"Investor Payment";s:5:"route";s:28:"admin.investor-payment.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> add_card </span>";s:5:"order";i:8;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:16";s:10:"updated_at";s:19:"2025-07-22 12:50:16";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:161;s:13:"permission_id";i:215;s:13:"admin_menu_id";i:54;s:4:"name";s:6:"create";s:5:"route";s:29:"admin.investor-payment.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:27";s:10:"updated_at";s:19:"2025-07-22 12:50:27";}s:11:"\0*\0original";a:8:{s:2:"id";i:161;s:13:"permission_id";i:215;s:13:"admin_menu_id";i:54;s:4:"name";s:6:"create";s:5:"route";s:29:"admin.investor-payment.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:27";s:10:"updated_at";s:19:"2025-07-22 12:50:27";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:162;s:13:"permission_id";i:216;s:13:"admin_menu_id";i:54;s:4:"name";s:4:"edit";s:5:"route";s:27:"admin.investor-payment.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:31";s:10:"updated_at";s:19:"2025-07-22 12:50:31";}s:11:"\0*\0original";a:8:{s:2:"id";i:162;s:13:"permission_id";i:216;s:13:"admin_menu_id";i:54;s:4:"name";s:4:"edit";s:5:"route";s:27:"admin.investor-payment.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:31";s:10:"updated_at";s:19:"2025-07-22 12:50:31";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:163;s:13:"permission_id";i:217;s:13:"admin_menu_id";i:54;s:4:"name";s:4:"view";s:5:"route";s:27:"admin.investor-payment.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:38";s:10:"updated_at";s:19:"2025-07-22 12:50:38";}s:11:"\0*\0original";a:8:{s:2:"id";i:163;s:13:"permission_id";i:217;s:13:"admin_menu_id";i:54;s:4:"name";s:4:"view";s:5:"route";s:27:"admin.investor-payment.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:38";s:10:"updated_at";s:19:"2025-07-22 12:50:38";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:164;s:13:"permission_id";i:218;s:13:"admin_menu_id";i:54;s:4:"name";s:6:"delete";s:5:"route";s:30:"admin.investor-payment.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:44";s:10:"updated_at";s:19:"2025-07-22 12:50:44";}s:11:"\0*\0original";a:8:{s:2:"id";i:164;s:13:"permission_id";i:218;s:13:"admin_menu_id";i:54;s:4:"name";s:6:"delete";s:5:"route";s:30:"admin.investor-payment.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:44";s:10:"updated_at";s:19:"2025-07-22 12:50:44";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:165;s:13:"permission_id";i:219;s:13:"admin_menu_id";i:54;s:4:"name";s:5:"trash";s:5:"route";s:28:"admin.investor-payment.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:50";s:10:"updated_at";s:19:"2025-07-22 12:50:50";}s:11:"\0*\0original";a:8:{s:2:"id";i:165;s:13:"permission_id";i:219;s:13:"admin_menu_id";i:54;s:4:"name";s:5:"trash";s:5:"route";s:28:"admin.investor-payment.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:50";s:10:"updated_at";s:19:"2025-07-22 12:50:50";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:8;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:9;s:13:"permission_id";i:32;s:9:"parent_id";N;s:4:"name";s:10:"Sattlement";s:5:"route";s:29:"admin.invest-sattlement.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:9;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:40:52";s:10:"updated_at";s:19:"2025-07-22 12:49:30";}s:11:"\0*\0original";a:11:{s:2:"id";i:9;s:13:"permission_id";i:32;s:9:"parent_id";N;s:4:"name";s:10:"Sattlement";s:5:"route";s:29:"admin.invest-sattlement.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:9;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:40:52";s:10:"updated_at";s:19:"2025-07-22 12:49:30";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:24;s:13:"permission_id";i:33;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:30:"admin.invest-sattlement.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:09";s:10:"updated_at";s:19:"2025-06-23 10:19:25";}s:11:"\0*\0original";a:8:{s:2:"id";i:24;s:13:"permission_id";i:33;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:30:"admin.invest-sattlement.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:09";s:10:"updated_at";s:19:"2025-06-23 10:19:25";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:25;s:13:"permission_id";i:34;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:28:"admin.invest-sattlement.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:13";s:10:"updated_at";s:19:"2025-06-23 10:19:31";}s:11:"\0*\0original";a:8:{s:2:"id";i:25;s:13:"permission_id";i:34;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:28:"admin.invest-sattlement.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:13";s:10:"updated_at";s:19:"2025-06-23 10:19:31";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:91;s:13:"permission_id";i:127;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"view";s:5:"route";s:28:"admin.invest-sattlement.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:48";s:10:"updated_at";s:19:"2025-06-23 10:19:48";}s:11:"\0*\0original";a:8:{s:2:"id";i:91;s:13:"permission_id";i:127;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"view";s:5:"route";s:28:"admin.invest-sattlement.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:48";s:10:"updated_at";s:19:"2025-06-23 10:19:48";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:92;s:13:"permission_id";i:128;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:31:"admin.invest-sattlement.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:56";s:10:"updated_at";s:19:"2025-06-23 10:19:56";}s:11:"\0*\0original";a:8:{s:2:"id";i:92;s:13:"permission_id";i:128;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:31:"admin.invest-sattlement.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:56";s:10:"updated_at";s:19:"2025-06-23 10:19:56";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:93;s:13:"permission_id";i:129;s:13:"admin_menu_id";i:9;s:4:"name";s:5:"trash";s:5:"route";s:29:"admin.invest-sattlement.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:20:01";s:10:"updated_at";s:19:"2025-06-23 10:20:01";}s:11:"\0*\0original";a:8:{s:2:"id";i:93;s:13:"permission_id";i:129;s:13:"admin_menu_id";i:9;s:4:"name";s:5:"trash";s:5:"route";s:29:"admin.invest-sattlement.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:20:01";s:10:"updated_at";s:19:"2025-06-23 10:20:01";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:9;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:55;s:13:"permission_id";i:220;s:9:"parent_id";N;s:4:"name";s:18:"Investor Statement";s:5:"route";s:30:"admin.investor-statement.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> contract </span>";s:5:"order";i:10;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-23 04:46:53";s:10:"updated_at";s:19:"2025-07-23 04:46:53";}s:11:"\0*\0original";a:11:{s:2:"id";i:55;s:13:"permission_id";i:220;s:9:"parent_id";N;s:4:"name";s:18:"Investor Statement";s:5:"route";s:30:"admin.investor-statement.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> contract </span>";s:5:"order";i:10;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-23 04:46:53";s:10:"updated_at";s:19:"2025-07-23 04:46:53";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:10;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:10;s:13:"permission_id";i:37;s:9:"parent_id";N;s:4:"name";s:18:"General Accounting";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> calculate </span>";s:5:"order";i:11;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:20";s:10:"updated_at";s:19:"2025-07-03 09:56:00";}s:11:"\0*\0original";a:11:{s:2:"id";i:10;s:13:"permission_id";i:37;s:9:"parent_id";N;s:4:"name";s:18:"General Accounting";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> calculate </span>";s:5:"order";i:11;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:20";s:10:"updated_at";s:19:"2025-07-03 09:56:00";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:2:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:11;s:13:"permission_id";i:38;s:9:"parent_id";i:10;s:4:"name";s:11:"Transaction";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:51";s:10:"updated_at";s:19:"2025-06-17 11:42:51";}s:11:"\0*\0original";a:11:{s:2:"id";i:11;s:13:"permission_id";i:38;s:9:"parent_id";i:10;s:4:"name";s:11:"Transaction";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:51";s:10:"updated_at";s:19:"2025-06-17 11:42:51";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:12;s:13:"permission_id";i:39;s:9:"parent_id";i:10;s:4:"name";s:7:"Reports";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:43:04";s:10:"updated_at";s:19:"2025-06-17 11:43:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:12;s:13:"permission_id";i:39;s:9:"parent_id";i:10;s:4:"name";s:7:"Reports";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:43:04";s:10:"updated_at";s:19:"2025-06-17 11:43:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:11;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:57;s:13:"permission_id";i:230;s:9:"parent_id";N;s:4:"name";s:16:"Rooms Management";s:5:"route";N;s:4:"icon";s:56:"<span class="material-symbols-outlined fs-22">bed</span>";s:5:"order";i:12;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:27:40";s:10:"updated_at";s:19:"2026-02-09 07:37:25";}s:11:"\0*\0original";a:11:{s:2:"id";i:57;s:13:"permission_id";i:230;s:9:"parent_id";N;s:4:"name";s:16:"Rooms Management";s:5:"route";N;s:4:"icon";s:56:"<span class="material-symbols-outlined fs-22">bed</span>";s:5:"order";i:12;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:27:40";s:10:"updated_at";s:19:"2026-02-09 07:37:25";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:1:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:58;s:13:"permission_id";i:231;s:9:"parent_id";i:57;s:4:"name";s:11:"Room Manage";s:5:"route";s:11:"admin.rooms";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:29:44";s:10:"updated_at";s:19:"2026-02-09 07:29:44";}s:11:"\0*\0original";a:11:{s:2:"id";i:58;s:13:"permission_id";i:231;s:9:"parent_id";i:57;s:4:"name";s:11:"Room Manage";s:5:"route";s:11:"admin.rooms";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:29:44";s:10:"updated_at";s:19:"2026-02-09 07:29:44";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:12;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:59;s:13:"permission_id";i:232;s:9:"parent_id";N;s:4:"name";s:20:"Room Type Management";s:5:"route";N;s:4:"icon";s:61:"<span class="material-symbols-outlined fs-22">category</span>";s:5:"order";i:12;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:39:17";s:10:"updated_at";s:19:"2026-02-09 07:39:17";}s:11:"\0*\0original";a:11:{s:2:"id";i:59;s:13:"permission_id";i:232;s:9:"parent_id";N;s:4:"name";s:20:"Room Type Management";s:5:"route";N;s:4:"icon";s:61:"<span class="material-symbols-outlined fs-22">category</span>";s:5:"order";i:12;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:39:17";s:10:"updated_at";s:19:"2026-02-09 07:39:17";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:1:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:60;s:13:"permission_id";i:233;s:9:"parent_id";i:59;s:4:"name";s:9:"Room Type";s:5:"route";s:22:"admin.categories.index";s:4:"icon";N;s:5:"order";i:12;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:41:19";s:10:"updated_at";s:19:"2026-02-09 07:41:59";}s:11:"\0*\0original";a:11:{s:2:"id";i:60;s:13:"permission_id";i:233;s:9:"parent_id";i:59;s:4:"name";s:9:"Room Type";s:5:"route";s:22:"admin.categories.index";s:4:"icon";N;s:5:"order";i:12;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 07:41:19";s:10:"updated_at";s:19:"2026-02-09 07:41:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:13;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:61;s:13:"permission_id";i:234;s:9:"parent_id";N;s:4:"name";s:18:"Booking Management";s:5:"route";N;s:4:"icon";s:82:"<span class="material-symbols-outlined fs-22 text-primary">     event_note </span>";s:5:"order";i:13;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 11:31:56";s:10:"updated_at";s:19:"2026-02-09 11:31:56";}s:11:"\0*\0original";a:11:{s:2:"id";i:61;s:13:"permission_id";i:234;s:9:"parent_id";N;s:4:"name";s:18:"Booking Management";s:5:"route";N;s:4:"icon";s:82:"<span class="material-symbols-outlined fs-22 text-primary">     event_note </span>";s:5:"order";i:13;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 11:31:56";s:10:"updated_at";s:19:"2026-02-09 11:31:56";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:1:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:62;s:13:"permission_id";i:235;s:9:"parent_id";i:61;s:4:"name";s:14:"Booking Manage";s:5:"route";s:20:"admin.bookings.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 11:33:01";s:10:"updated_at";s:19:"2026-02-09 11:33:01";}s:11:"\0*\0original";a:11:{s:2:"id";i:62;s:13:"permission_id";i:235;s:9:"parent_id";i:61;s:4:"name";s:14:"Booking Manage";s:5:"route";s:20:"admin.bookings.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-09 11:33:01";s:10:"updated_at";s:19:"2026-02-09 11:33:01";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:14;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:63;s:13:"permission_id";i:236;s:9:"parent_id";N;s:4:"name";s:15:"Services Manage";s:5:"route";N;s:4:"icon";s:67:"<span class="material-symbols-outlined fs-22"> room_service </span>";s:5:"order";i:14;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:13:18";s:10:"updated_at";s:19:"2026-02-10 04:13:18";}s:11:"\0*\0original";a:11:{s:2:"id";i:63;s:13:"permission_id";i:236;s:9:"parent_id";N;s:4:"name";s:15:"Services Manage";s:5:"route";N;s:4:"icon";s:67:"<span class="material-symbols-outlined fs-22"> room_service </span>";s:5:"order";i:14;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:13:18";s:10:"updated_at";s:19:"2026-02-10 04:13:18";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:15;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:64;s:13:"permission_id";i:237;s:9:"parent_id";N;s:4:"name";s:14:"Gallery Manage";s:5:"route";N;s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> photo_library </span>";s:5:"order";i:15;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:03";s:10:"updated_at";s:19:"2026-02-10 04:14:03";}s:11:"\0*\0original";a:11:{s:2:"id";i:64;s:13:"permission_id";i:237;s:9:"parent_id";N;s:4:"name";s:14:"Gallery Manage";s:5:"route";N;s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> photo_library </span>";s:5:"order";i:15;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:03";s:10:"updated_at";s:19:"2026-02-10 04:14:03";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:16;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:65;s:13:"permission_id";i:238;s:9:"parent_id";N;s:4:"name";s:18:"Testimonial Manage";s:5:"route";N;s:4:"icon";s:62:"<span class="material-symbols-outlined fs-22"> reviews </span>";s:5:"order";i:16;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:36";s:10:"updated_at";s:19:"2026-02-10 04:14:36";}s:11:"\0*\0original";a:11:{s:2:"id";i:65;s:13:"permission_id";i:238;s:9:"parent_id";N;s:4:"name";s:18:"Testimonial Manage";s:5:"route";N;s:4:"icon";s:62:"<span class="material-symbols-outlined fs-22"> reviews </span>";s:5:"order";i:16;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:36";s:10:"updated_at";s:19:"2026-02-10 04:14:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:17;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:66;s:13:"permission_id";i:239;s:9:"parent_id";N;s:4:"name";s:12:"About Manage";s:5:"route";N;s:4:"icon";s:59:"<span class="material-symbols-outlined fs-22"> info </span>";s:5:"order";i:17;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:15:15";s:10:"updated_at";s:19:"2026-02-10 04:15:15";}s:11:"\0*\0original";a:11:{s:2:"id";i:66;s:13:"permission_id";i:239;s:9:"parent_id";N;s:4:"name";s:12:"About Manage";s:5:"route";N;s:4:"icon";s:59:"<span class="material-symbols-outlined fs-22"> info </span>";s:5:"order";i:17;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:15:15";s:10:"updated_at";s:19:"2026-02-10 04:15:15";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}', 1770720876),
	('books_books_cache_admin_setting', 'O:23:"App\\Models\\AdminSetting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:14:"admin_settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:16:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-02-10-quLl7x6LIpOewvLbubTsJtU9vDBuvRatfjvBTaAY.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-02-10-npcVYQ5HMBIhcqH4DAsj5jOFLAkekKGIRl2ZzRSx.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-02-10-uKHdiBUMHBaK5EWxiGoTNqLRKYfMBFDHxrbvwVlu.webp";s:11:"share_value";i:10000;s:5:"title";s:11:"Amar Hostel";s:11:"footer_text";s:102:"© 2023 Developed by <a target="_blank" href="http://www.technoparkbd.com/">Techno Park Bangladesh</a>";s:13:"primary_color";N;s:15:"secondary_color";N;s:8:"facebook";N;s:7:"twitter";N;s:8:"linkedin";N;s:8:"whatsapp";N;s:6:"google";N;s:10:"created_at";s:19:"2026-02-10 04:38:23";s:10:"updated_at";s:19:"2026-02-10 04:38:23";}s:11:"\0*\0original";a:16:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-02-10-quLl7x6LIpOewvLbubTsJtU9vDBuvRatfjvBTaAY.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-02-10-npcVYQ5HMBIhcqH4DAsj5jOFLAkekKGIRl2ZzRSx.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-02-10-uKHdiBUMHBaK5EWxiGoTNqLRKYfMBFDHxrbvwVlu.webp";s:11:"share_value";i:10000;s:5:"title";s:11:"Amar Hostel";s:11:"footer_text";s:102:"© 2023 Developed by <a target="_blank" href="http://www.technoparkbd.com/">Techno Park Bangladesh</a>";s:13:"primary_color";N;s:15:"secondary_color";N;s:8:"facebook";N;s:7:"twitter";N;s:8:"linkedin";N;s:8:"whatsapp";N;s:6:"google";N;s:10:"created_at";s:19:"2026-02-10 04:38:23";s:10:"updated_at";s:19:"2026-02-10 04:38:23";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:13:{i:0;s:4:"logo";i:1;s:10:"small_logo";i:2;s:7:"favicon";i:3;s:5:"title";i:4;s:11:"footer_text";i:5;s:13:"primary_color";i:6;s:15:"secondary_color";i:7;s:11:"share_value";i:8;s:8:"facebook";i:9;s:7:"twitter";i:10;s:8:"linkedin";i:11;s:8:"whatsapp";i:12;s:6:"google";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1770720877),
	('books_books_cache_setting', 'O:18:"App\\Models\\Setting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:8:"settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:42:{s:2:"id";i:1;s:8:"app_name";s:11:"Amar Hostel";s:5:"title";s:11:"Amar Hostel";s:13:"primary_phone";s:5:"33333";s:15:"secondary_phone";s:5:"33333";s:13:"primary_email";s:15:"amar@hostel.com";s:15:"secondary_email";s:15:"amar@hostel.com";s:11:"office_time";N;s:7:"address";s:4:"dsad";s:11:"description";s:7:"dsaddas";s:10:"banner_one";N;s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";N;s:10:"meta_title";s:4:"dasd";s:12:"meta_keyword";s:4:"sads";s:16:"meta_description";s:4:"dsad";s:10:"meta_image";N;s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-02-09-wkH0tkT84jkJmtu0033kjVvSl3rAcpimAEPbgCC0.webp";s:4:"logo";s:73:"storage/settings/2026-02-09-WXI1ydTdwGPz6e9NiIub10XzXUuCNiFVTLdvgubk.webp";s:11:"footer_logo";N;s:11:"placeholder";N;s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-02-09 08:27:22";s:10:"updated_at";s:19:"2026-02-09 08:27:22";}s:11:"\0*\0original";a:42:{s:2:"id";i:1;s:8:"app_name";s:11:"Amar Hostel";s:5:"title";s:11:"Amar Hostel";s:13:"primary_phone";s:5:"33333";s:15:"secondary_phone";s:5:"33333";s:13:"primary_email";s:15:"amar@hostel.com";s:15:"secondary_email";s:15:"amar@hostel.com";s:11:"office_time";N;s:7:"address";s:4:"dsad";s:11:"description";s:7:"dsaddas";s:10:"banner_one";N;s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";N;s:10:"meta_title";s:4:"dasd";s:12:"meta_keyword";s:4:"sads";s:16:"meta_description";s:4:"dsad";s:10:"meta_image";N;s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-02-09-wkH0tkT84jkJmtu0033kjVvSl3rAcpimAEPbgCC0.webp";s:4:"logo";s:73:"storage/settings/2026-02-09-WXI1ydTdwGPz6e9NiIub10XzXUuCNiFVTLdvgubk.webp";s:11:"footer_logo";N;s:11:"placeholder";N;s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-02-09 08:27:22";s:10:"updated_at";s:19:"2026-02-09 08:27:22";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:39:{i:0;s:8:"app_name";i:1;s:5:"title";i:2;s:13:"primary_phone";i:3;s:15:"secondary_phone";i:4;s:13:"primary_email";i:5;s:15:"secondary_email";i:6;s:11:"office_time";i:7;s:7:"address";i:8;s:11:"description";i:9;s:10:"banner_one";i:10;s:15:"banner_one_link";i:11;s:17:"banner_one_status";i:12;s:10:"banner_two";i:13;s:15:"banner_two_link";i:14;s:17:"banner_two_status";i:15;s:15:"page_heading_bg";i:16;s:10:"meta_title";i:17;s:12:"meta_keyword";i:18;s:16:"meta_description";i:19;s:10:"meta_image";i:20;s:10:"google_map";i:21;s:7:"favicon";i:22;s:4:"logo";i:23;s:11:"footer_logo";i:24;s:11:"placeholder";i:25;s:13:"facebook_page";i:26;s:14:"facebook_group";i:27;s:7:"youtube";i:28;s:7:"twitter";i:29;s:8:"linkedin";i:30;s:6:"google";i:31;s:8:"whatsapp";i:32;s:9:"instagram";i:33;s:9:"pinterest";i:34;s:11:"sms_api_url";i:35;s:11:"sms_api_key";i:36;s:10:"sms_api_id";i:37;s:12:"bkash_status";i:38;s:12:"nagad_status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1770720877),
	('books_books_cache_spatie.permission.cache', 'a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:174:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"Dashboard";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:15:"System Settings";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:5:"Roles";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:5:"Users";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:4:"Menu";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:14:"Admin Settings";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:9:"Investors";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:23:"admin.admin-menu.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:21:"admin.admin-menu.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:24:"admin.admin-menu.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:29:"admin.admin-menu-action.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:30:"admin.admin-menu-action.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:28:"admin.admin-menu-action.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:31:"admin.admin-menu-action.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:17:"admin.role.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:15:"admin.role.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:18:"admin.role.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:26:"admin.role-permission.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:17:"admin.user.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:15:"admin.user.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:"a";i:23;s:1:"b";s:21:"admin.investor.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:"a";i:24;s:1:"b";s:19:"admin.investor.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:"a";i:25;s:1:"b";s:22:"admin.investor.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:"a";i:26;s:1:"b";s:20:"admin.investor.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:"a";i:27;s:1:"b";s:14:"Invest Process";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:"a";i:28;s:1:"b";s:19:"admin.invest.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:26;a:4:{s:1:"a";i:29;s:1:"b";s:17:"admin.invest.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:27;a:4:{s:1:"a";i:32;s:1:"b";s:10:"Sattlement";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:28;a:4:{s:1:"a";i:33;s:1:"b";s:30:"admin.invest-sattlement.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:"a";i:34;s:1:"b";s:28:"admin.invest-sattlement.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:30;a:4:{s:1:"a";i:37;s:1:"b";s:18:"General Accounting";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:31;a:4:{s:1:"a";i:38;s:1:"b";s:11:"Transaction";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:32;a:4:{s:1:"a";i:39;s:1:"b";s:7:"Reports";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:33;a:4:{s:1:"a";i:40;s:1:"b";s:17:"Chart of Accounts";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:34;a:4:{s:1:"a";i:41;s:1:"b";s:16:"admin.coa.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:35;a:4:{s:1:"a";i:42;s:1:"b";s:14:"admin.coa.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:36;a:4:{s:1:"a";i:43;s:1:"b";s:17:"admin.coa.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:37;a:4:{s:1:"a";i:44;s:1:"b";s:13:"Debit Voucher";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:38;a:4:{s:1:"a";i:45;s:1:"b";s:26:"admin.debit-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:39;a:4:{s:1:"a";i:46;s:1:"b";s:24:"admin.debit-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:40;a:4:{s:1:"a";i:49;s:1:"b";s:14:"Credit Voucher";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:41;a:4:{s:1:"a";i:50;s:1:"b";s:27:"admin.credit-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:42;a:4:{s:1:"a";i:51;s:1:"b";s:25:"admin.credit-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:43;a:4:{s:1:"a";i:54;s:1:"b";s:15:"Journal Voucher";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:44;a:4:{s:1:"a";i:55;s:1:"b";s:28:"admin.journal-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:45;a:4:{s:1:"a";i:56;s:1:"b";s:26:"admin.journal-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:46;a:4:{s:1:"a";i:59;s:1:"b";s:27:"admin.voucher-approve.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:47;a:4:{s:1:"a";i:60;s:1:"b";s:26:"admin.voucher-approve.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:48;a:4:{s:1:"a";i:61;s:1:"b";s:26:"admin.voucher-approve.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:49;a:4:{s:1:"a";i:62;s:1:"b";s:26:"admin.voucher-refuse.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:50;a:4:{s:1:"a";i:63;s:1:"b";s:25:"admin.voucher-refuse.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:51;a:4:{s:1:"a";i:64;s:1:"b";s:25:"admin.voucher-refuse.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:52;a:4:{s:1:"a";i:65;s:1:"b";s:30:"admin.automation-approve.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:53;a:4:{s:1:"a";i:66;s:1:"b";s:29:"admin.automation-approve.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:54;a:4:{s:1:"a";i:67;s:1:"b";s:29:"admin.automation-approve.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:55;a:4:{s:1:"a";i:68;s:1:"b";s:29:"admin.automation-refuse.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:56;a:4:{s:1:"a";i:69;s:1:"b";s:28:"admin.automation-refuse.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:57;a:4:{s:1:"a";i:70;s:1:"b";s:28:"admin.automation-refuse.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:58;a:4:{s:1:"a";i:71;s:1:"b";s:19:"Chart of Accounts 1";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:59;a:4:{s:1:"a";i:72;s:1:"b";s:18:"Daily Voucher List";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:60;a:4:{s:1:"a";i:73;s:1:"b";s:15:"Daily Cash Book";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:61;a:4:{s:1:"a";i:74;s:1:"b";s:9:"Bank Book";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:62;a:4:{s:1:"a";i:75;s:1:"b";s:18:"Transaction Ledger";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:63;a:4:{s:1:"a";i:76;s:1:"b";s:14:"General Ledger";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:64;a:4:{s:1:"a";i:77;s:1:"b";s:19:"Cash Flow Statement";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:65;a:4:{s:1:"a";i:78;s:1:"b";s:13:"Trial Balance";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:66;a:4:{s:1:"a";i:79;s:1:"b";s:16:"Income Statement";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:67;a:4:{s:1:"a";i:80;s:1:"b";s:13:"Balance Sheet";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:68;a:4:{s:1:"a";i:81;s:1:"b";s:24:"admin.debit-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:69;a:4:{s:1:"a";i:82;s:1:"b";s:25:"admin.debit-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:70;a:4:{s:1:"a";i:83;s:1:"b";s:27:"admin.debit-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:71;a:4:{s:1:"a";i:84;s:1:"b";s:25:"admin.debit-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:72;a:4:{s:1:"a";i:85;s:1:"b";s:25:"admin.credit-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:73;a:4:{s:1:"a";i:86;s:1:"b";s:26:"admin.credit-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:74;a:4:{s:1:"a";i:87;s:1:"b";s:28:"admin.credit-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:75;a:4:{s:1:"a";i:88;s:1:"b";s:26:"admin.credit-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:76;a:4:{s:1:"a";i:90;s:1:"b";s:20:"admin.invest.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:77;a:4:{s:1:"a";i:91;s:1:"b";s:18:"admin.invest.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:78;a:4:{s:1:"a";i:100;s:1:"b";s:19:"admin.product.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:79;a:4:{s:1:"a";i:101;s:1:"b";s:20:"admin.product.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:80;a:4:{s:1:"a";i:102;s:1:"b";s:18:"admin.product.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:81;a:4:{s:1:"a";i:127;s:1:"b";s:28:"admin.invest-sattlement.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:82;a:4:{s:1:"a";i:128;s:1:"b";s:31:"admin.invest-sattlement.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:83;a:4:{s:1:"a";i:129;s:1:"b";s:29:"admin.invest-sattlement.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:84;a:4:{s:1:"a";i:130;s:1:"b";s:19:"admin.user.password";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:85;a:4:{s:1:"a";i:131;s:1:"b";s:18:"admin.user.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:86;a:4:{s:1:"a";i:132;s:1:"b";s:16:"admin.user.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:87;a:4:{s:1:"a";i:135;s:1:"b";s:27:"admin.product-edition.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:88;a:4:{s:1:"a";i:138;s:1:"b";s:9:"Inventory";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:89;a:4:{s:1:"a";i:139;s:1:"b";s:11:"Productions";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:90;a:4:{s:1:"a";i:142;s:1:"b";s:27:"admin.product-edition.store";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:91;a:4:{s:1:"a";i:143;s:1:"b";s:26:"admin.product-edition.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:92;a:4:{s:1:"a";i:144;s:1:"b";s:29:"admin.product-edition.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:93;a:4:{s:1:"a";i:145;s:1:"b";s:21:"admin.product.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:94;a:4:{s:1:"a";i:146;s:1:"b";s:19:"admin.product.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:95;a:4:{s:1:"a";i:147;s:1:"b";s:23:"admin.production.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:96;a:4:{s:1:"a";i:148;s:1:"b";s:21:"admin.production.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:97;a:4:{s:1:"a";i:149;s:1:"b";s:21:"admin.production.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:98;a:4:{s:1:"a";i:152;s:1:"b";s:22:"admin.production.print";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:99;a:4:{s:1:"a";i:153;s:1:"b";s:24:"admin.production.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:100;a:4:{s:1:"a";i:154;s:1:"b";s:22:"admin.production.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:101;a:4:{s:1:"a";i:155;s:1:"b";s:16:"Sales Management";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:102;a:4:{s:1:"a";i:156;s:1:"b";s:7:"Dealers";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:103;a:4:{s:1:"a";i:157;s:1:"b";s:7:"Sales 1";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:104;a:4:{s:1:"a";i:158;s:1:"b";s:19:"admin.client.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:105;a:4:{s:1:"a";i:159;s:1:"b";s:17:"admin.client.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:106;a:4:{s:1:"a";i:160;s:1:"b";s:20:"admin.client.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:107;a:4:{s:1:"a";i:161;s:1:"b";s:18:"admin.client.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:108;a:4:{s:1:"a";i:162;s:1:"b";s:18:"admin.sales.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:109;a:4:{s:1:"a";i:163;s:1:"b";s:16:"admin.sales.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:110;a:4:{s:1:"a";i:164;s:1:"b";s:16:"admin.sales.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:111;a:4:{s:1:"a";i:166;s:1:"b";s:5:"Stock";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:112;a:4:{s:1:"a";i:167;s:1:"b";s:12:"System Setup";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:113;a:4:{s:1:"a";i:168;s:1:"b";s:7:"Regions";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:114;a:4:{s:1:"a";i:169;s:1:"b";s:4:"Area";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:115;a:4:{s:1:"a";i:170;s:1:"b";s:9:"Territory";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:116;a:4:{s:1:"a";i:171;s:1:"b";s:19:"admin.region.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:117;a:4:{s:1:"a";i:172;s:1:"b";s:17:"admin.region.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:118;a:4:{s:1:"a";i:173;s:1:"b";s:20:"admin.region.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:119;a:4:{s:1:"a";i:174;s:1:"b";s:18:"admin.region.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:120;a:4:{s:1:"a";i:175;s:1:"b";s:17:"admin.area.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:121;a:4:{s:1:"a";i:176;s:1:"b";s:15:"admin.area.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:122;a:4:{s:1:"a";i:177;s:1:"b";s:18:"admin.area.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:123;a:4:{s:1:"a";i:178;s:1:"b";s:16:"admin.area.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:124;a:4:{s:1:"a";i:179;s:1:"b";s:22:"admin.territory.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:125;a:4:{s:1:"a";i:180;s:1:"b";s:20:"admin.territory.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:126;a:4:{s:1:"a";i:181;s:1:"b";s:23:"admin.territory.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:127;a:4:{s:1:"a";i:182;s:1:"b";s:21:"admin.territory.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:128;a:4:{s:1:"a";i:183;s:1:"b";s:6:"Stores";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:129;a:4:{s:1:"a";i:184;s:1:"b";s:18:"admin.store.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:130;a:4:{s:1:"a";i:185;s:1:"b";s:16:"admin.store.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:131;a:4:{s:1:"a";i:186;s:1:"b";s:19:"admin.store.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:132;a:4:{s:1:"a";i:187;s:1:"b";s:17:"admin.store.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:133;a:4:{s:1:"a";i:188;s:1:"b";s:19:"admin.sales.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:134;a:4:{s:1:"a";i:189;s:1:"b";s:17:"admin.sales.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:135;a:4:{s:1:"a";i:190;s:1:"b";s:11:"Collections";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:136;a:4:{s:1:"a";i:191;s:1:"b";s:23:"admin.collection.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:137;a:4:{s:1:"a";i:192;s:1:"b";s:21:"admin.collection.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:138;a:4:{s:1:"a";i:193;s:1:"b";s:21:"admin.collection.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:139;a:4:{s:1:"a";i:194;s:1:"b";s:24:"admin.collection.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:140;a:4:{s:1:"a";i:195;s:1:"b";s:22:"admin.collection.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:141;a:4:{s:1:"a";i:196;s:1:"b";s:13:"Sales Returns";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:142;a:4:{s:1:"a";i:197;s:1:"b";s:25:"admin.sales-return.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:143;a:4:{s:1:"a";i:198;s:1:"b";s:23:"admin.sales-return.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:144;a:4:{s:1:"a";i:199;s:1:"b";s:23:"admin.sales-return.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:145;a:4:{s:1:"a";i:200;s:1:"b";s:26:"admin.sales-return.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:146;a:4:{s:1:"a";i:201;s:1:"b";s:24:"admin.sales-return.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:147;a:4:{s:1:"a";i:208;s:1:"b";s:19:"Profit Distribution";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:148;a:4:{s:1:"a";i:209;s:1:"b";s:32:"admin.profit-distribution.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:149;a:4:{s:1:"a";i:210;s:1:"b";s:30:"admin.profit-distribution.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:150;a:4:{s:1:"a";i:211;s:1:"b";s:30:"admin.profit-distribution.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:151;a:4:{s:1:"a";i:212;s:1:"b";s:33:"admin.profit-distribution.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:152;a:4:{s:1:"a";i:213;s:1:"b";s:31:"admin.profit-distribution.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:153;a:4:{s:1:"a";i:214;s:1:"b";s:16:"Investor Payment";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:154;a:4:{s:1:"a";i:215;s:1:"b";s:29:"admin.investor-payment.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:155;a:4:{s:1:"a";i:216;s:1:"b";s:27:"admin.investor-payment.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:156;a:4:{s:1:"a";i:217;s:1:"b";s:27:"admin.investor-payment.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:157;a:4:{s:1:"a";i:218;s:1:"b";s:30:"admin.investor-payment.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:158;a:4:{s:1:"a";i:219;s:1:"b";s:28:"admin.investor-payment.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:159;a:4:{s:1:"a";i:220;s:1:"b";s:18:"Investor Statement";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:160;a:4:{s:1:"a";i:221;s:1:"b";s:26:"admin.journal-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:161;a:4:{s:1:"a";i:222;s:1:"b";s:27:"admin.journal-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:162;a:4:{s:1:"a";i:223;s:1:"b";s:29:"admin.journal-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:163;a:4:{s:1:"a";i:224;s:1:"b";s:27:"admin.journal-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:164;a:4:{s:1:"a";i:230;s:1:"b";s:16:"Rooms Management";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:165;a:4:{s:1:"a";i:231;s:1:"b";s:11:"Room Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:166;a:4:{s:1:"a";i:232;s:1:"b";s:20:"Room Type Management";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:167;a:4:{s:1:"a";i:233;s:1:"b";s:11:"Room Type 1";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:168;a:4:{s:1:"a";i:234;s:1:"b";s:18:"Booking Management";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:169;a:4:{s:1:"a";i:235;s:1:"b";s:16:"Booking Manage 1";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:170;a:4:{s:1:"a";i:236;s:1:"b";s:15:"Services Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:171;a:4:{s:1:"a";i:237;s:1:"b";s:14:"Gallery Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:172;a:4:{s:1:"a";i:238;s:1:"b";s:18:"Testimonial Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:173;a:4:{s:1:"a";i:239;s:1:"b";s:12:"About Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:3:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:14:"Software Admin";s:1:"c";s:3:"web";}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:12:"System Admin";s:1:"c";s:3:"web";}i:2;a:3:{s:1:"a";i:3;s:1:"b";s:8:"Investor";s:1:"c";s:3:"web";}}}', 1770785459);

-- Dumping structure for table amar_hostel.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table amar_hostel.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.categories: ~4 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Single', '2026-02-08 03:21:14', '2026-02-08 03:23:49'),
	(2, 'Double', '2026-02-08 03:23:00', '2026-02-08 03:23:00'),
	(3, 'Deluxe Twin', '2026-02-08 03:23:42', '2026-02-08 03:23:42'),
	(4, 'Dormitory', '2026-02-08 03:24:07', '2026-02-08 03:24:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.coa_setups: ~111 rows (approximately)
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
	(244, 24, 1010301, 'UCBL', 1, 0, 'A', 1, 1, 1, NULL, NULL, NULL, '2026-02-09 22:53:31', '2026-02-09 22:53:31');

-- Dumping structure for table amar_hostel.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table amar_hostel.investors
DROP TABLE IF EXISTS `investors`;
CREATE TABLE IF NOT EXISTS `investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `coa_setup_id` bigint unsigned DEFAULT NULL,
  `profit_head` bigint(20) unsigned zerofill DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bkash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investors_user_id_foreign` (`user_id`),
  CONSTRAINT `investors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.investors: ~1 rows (approximately)
DELETE FROM `investors`;
INSERT INTO `investors` (`id`, `user_id`, `coa_setup_id`, `profit_head`, `name`, `image`, `email`, `phone`, `address`, `nid`, `document`, `bkash`, `rocket`, `nagad`, `bank`, `branch`, `account_name`, `account_no`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 6, 241, 00000000000000000242, 'Investor 1', NULL, NULL, '01997316189', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-02-09 22:23:41', '2026-02-09 22:23:41');

-- Dumping structure for table amar_hostel.investor_payments
DROP TABLE IF EXISTS `investor_payments`;
CREATE TABLE IF NOT EXISTS `investor_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(16,0) NOT NULL,
  `deposit_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bkash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investor_payments_investor_id_foreign` (`investor_id`),
  CONSTRAINT `investor_payments_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.investor_payments: ~0 rows (approximately)
DELETE FROM `investor_payments`;

-- Dumping structure for table amar_hostel.investor_profits
DROP TABLE IF EXISTS `investor_profits`;
CREATE TABLE IF NOT EXISTS `investor_profits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `total_profit` decimal(16,0) NOT NULL,
  `investor_percentage` decimal(16,0) NOT NULL,
  `total_share` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `investor_profits_serial_no_unique` (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.investor_profits: ~0 rows (approximately)
DELETE FROM `investor_profits`;

-- Dumping structure for table amar_hostel.investor_profit_lists
DROP TABLE IF EXISTS `investor_profit_lists`;
CREATE TABLE IF NOT EXISTS `investor_profit_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_profit_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `share_qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `deposited_amount` decimal(16,0) NOT NULL DEFAULT '0',
  `deposited` tinyint NOT NULL DEFAULT '0',
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investor_profit_lists_investor_profit_id_foreign` (`investor_profit_id`),
  KEY `investor_profit_lists_investor_id_foreign` (`investor_id`),
  CONSTRAINT `investor_profit_lists_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `investor_profit_lists_investor_profit_id_foreign` FOREIGN KEY (`investor_profit_id`) REFERENCES `investor_profits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.investor_profit_lists: ~0 rows (approximately)
DELETE FROM `investor_profit_lists`;

-- Dumping structure for table amar_hostel.invests
DROP TABLE IF EXISTS `invests`;
CREATE TABLE IF NOT EXISTS `invests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `invest_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `deposit_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bkash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `calculate` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `sattled` tinyint NOT NULL DEFAULT '0',
  `coa_setup_id` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invests_investor_id_foreign` (`investor_id`),
  CONSTRAINT `invests_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.invests: ~1 rows (approximately)
DELETE FROM `invests`;
INSERT INTO `invests` (`id`, `company_id`, `investor_id`, `invest_no`, `date`, `qty`, `amount`, `deposit_type`, `bkash`, `rocket`, `nagad`, `bank_account`, `remarks`, `calculate`, `approved`, `status`, `sattled`, `coa_setup_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 0, 1, 'FDI2602000001', '2026-02-10', 2, 20000, '', NULL, NULL, NULL, NULL, NULL, 1, 1, 'Approved', 0, 163, 1, NULL, NULL, NULL, '2026-02-09 22:42:48', '2026-02-09 22:42:48');

-- Dumping structure for table amar_hostel.invest_months
DROP TABLE IF EXISTS `invest_months`;
CREATE TABLE IF NOT EXISTS `invest_months` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_id` bigint unsigned DEFAULT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'renew',
  `date` date DEFAULT NULL,
  `invest_month` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `distributed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_months_invest_id_foreign` (`invest_id`),
  KEY `invest_months_investor_id_foreign` (`investor_id`),
  CONSTRAINT `invest_months_invest_id_foreign` FOREIGN KEY (`invest_id`) REFERENCES `invests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_months_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.invest_months: ~0 rows (approximately)
DELETE FROM `invest_months`;
INSERT INTO `invest_months` (`id`, `invest_id`, `investor_id`, `type`, `date`, `invest_month`, `month`, `year`, `qty`, `amount`, `distributed`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'Invest', '2026-02-10', '2026-02-01', 'February', '2026', 2, 20000, 0, '2026-02-09 22:42:48', '2026-02-09 22:42:48');

-- Dumping structure for table amar_hostel.invest_renews
DROP TABLE IF EXISTS `invest_renews`;
CREATE TABLE IF NOT EXISTS `invest_renews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `serial_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.invest_renews: ~0 rows (approximately)
DELETE FROM `invest_renews`;

-- Dumping structure for table amar_hostel.invest_renew_lists
DROP TABLE IF EXISTS `invest_renew_lists`;
CREATE TABLE IF NOT EXISTS `invest_renew_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_renew_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `invest_month_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `invest_month` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_renew_lists_invest_renew_id_foreign` (`invest_renew_id`),
  KEY `invest_renew_lists_investor_id_foreign` (`investor_id`),
  CONSTRAINT `invest_renew_lists_invest_renew_id_foreign` FOREIGN KEY (`invest_renew_id`) REFERENCES `invest_renews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_renew_lists_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.invest_renew_lists: ~0 rows (approximately)
DELETE FROM `invest_renew_lists`;

-- Dumping structure for table amar_hostel.invest_sattlements
DROP TABLE IF EXISTS `invest_sattlements`;
CREATE TABLE IF NOT EXISTS `invest_sattlements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `sattlement_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `coa_setup_id` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_sattlements_investor_id_foreign` (`investor_id`),
  CONSTRAINT `invest_sattlements_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.invest_sattlements: ~0 rows (approximately)
DELETE FROM `invest_sattlements`;

-- Dumping structure for table amar_hostel.invest_sattlement_lists
DROP TABLE IF EXISTS `invest_sattlement_lists`;
CREATE TABLE IF NOT EXISTS `invest_sattlement_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_sattlement_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_sattlement_lists_invest_sattlement_id_foreign` (`invest_sattlement_id`),
  KEY `invest_sattlement_lists_invest_id_foreign` (`invest_id`),
  CONSTRAINT `invest_sattlement_lists_invest_id_foreign` FOREIGN KEY (`invest_id`) REFERENCES `invests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invest_sattlement_lists_invest_sattlement_id_foreign` FOREIGN KEY (`invest_sattlement_id`) REFERENCES `invest_sattlements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.invest_sattlement_lists: ~0 rows (approximately)
DELETE FROM `invest_sattlement_lists`;

-- Dumping structure for table amar_hostel.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table amar_hostel.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table amar_hostel.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.migrations: ~28 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(7, '2026_02_03_114908_create_testimonials_table', 2),
	(8, '2026_02_03_114145_create_rooms_table', 3),
	(9, '2026_02_03_114748_create_bookings_table', 4),
	(11, '2026_02_08_084842_create_categories_table', 5),
	(12, '2023_12_07_101641_create_coa_setups_table', 6),
	(13, '2023_12_10_095150_create_account_transaction_autos_table', 6),
	(14, '2023_12_10_095155_create_account_transactions_table', 6),
	(15, '2024_09_22_145154_create_investors_table', 6),
	(16, '2024_09_22_145251_create_invests_table', 6),
	(17, '2024_09_22_155251_create_invest_months_table', 6),
	(18, '2024_09_22_162233_create_wallets_table', 6),
	(19, '2024_09_22_175429_create_investor_profits_table', 6),
	(20, '2024_09_22_175614_create_investor_profit_lists_table', 6),
	(21, '2024_09_23_095148_create_investor_payments_table', 6),
	(22, '2024_11_06_122025_create_invest_renews_table', 6),
	(23, '2024_11_06_122030_create_invest_renew_lists_table', 6),
	(24, '2024_11_06_190458_create_invest_sattlements_table', 6),
	(25, '2024_11_06_190508_create_invest_sattlement_lists_table', 6),
	(26, '2025_05_07_083259_create_permission_tables', 7),
	(27, '2025_05_07_083431_create_admin_menus_table', 7),
	(28, '2025_05_07_083444_create_admin_menu_actions_table', 7),
	(29, '2025_05_07_084137_create_admin_settings_table', 7),
	(30, '2025_05_07_084409_create_settings_table', 8),
	(31, '2026_02_03_114623_create_services_table', 9);

-- Dumping structure for table amar_hostel.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table amar_hostel.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.model_has_roles: ~21 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(3, 'App\\Models\\User', 4),
	(3, 'App\\Models\\User', 5),
	(3, 'App\\Models\\User', 6),
	(3, 'App\\Models\\User', 7),
	(3, 'App\\Models\\User', 8),
	(3, 'App\\Models\\User', 9),
	(2, 'App\\Models\\User', 10),
	(3, 'App\\Models\\User', 13),
	(3, 'App\\Models\\User', 14),
	(3, 'App\\Models\\User', 15),
	(3, 'App\\Models\\User', 16),
	(3, 'App\\Models\\User', 17),
	(3, 'App\\Models\\User', 18),
	(3, 'App\\Models\\User', 19),
	(3, 'App\\Models\\User', 20),
	(3, 'App\\Models\\User', 21),
	(3, 'App\\Models\\User', 22),
	(3, 'App\\Models\\User', 23),
	(3, 'App\\Models\\User', 24),
	(3, 'App\\Models\\User', 25);

-- Dumping structure for table amar_hostel.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table amar_hostel.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.permissions: ~173 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard', 'web', '2025-06-17 05:07:50', '2025-06-17 05:07:50'),
	(2, 'System Settings', 'web', '2025-06-17 05:10:14', '2025-06-17 05:10:14'),
	(3, 'Roles', 'web', '2025-06-17 05:10:36', '2025-06-17 05:10:36'),
	(4, 'Users', 'web', '2025-06-17 05:11:10', '2025-06-17 05:11:10'),
	(5, 'Menu', 'web', '2025-06-17 05:11:51', '2025-06-17 05:11:51'),
	(6, 'Admin Settings', 'web', '2025-06-17 05:12:59', '2025-06-17 05:12:59'),
	(7, 'Investors', 'web', '2025-06-17 05:13:38', '2025-06-17 05:13:38'),
	(8, 'admin.admin-menu.create', 'web', '2025-06-17 05:30:00', '2025-06-17 05:30:00'),
	(9, 'admin.admin-menu.edit', 'web', '2025-06-17 05:30:15', '2025-06-17 05:30:15'),
	(10, 'admin.admin-menu.destroy', 'web', '2025-06-17 05:30:19', '2025-06-17 05:30:19'),
	(11, 'admin.admin-menu-action.index', 'web', '2025-06-17 05:30:59', '2025-06-17 05:30:59'),
	(12, 'admin.admin-menu-action.create', 'web', '2025-06-17 05:31:06', '2025-06-17 05:31:06'),
	(13, 'admin.admin-menu-action.edit', 'web', '2025-06-17 05:31:15', '2025-06-17 05:31:15'),
	(14, 'admin.admin-menu-action.destroy', 'web', '2025-06-17 05:31:21', '2025-06-17 05:31:21'),
	(15, 'admin.role.create', 'web', '2025-06-17 05:32:05', '2025-06-17 05:32:05'),
	(16, 'admin.role.edit', 'web', '2025-06-17 05:32:09', '2025-06-17 05:32:09'),
	(17, 'admin.role.destroy', 'web', '2025-06-17 05:32:15', '2025-06-17 05:32:15'),
	(18, 'admin.role-permission.edit', 'web', '2025-06-17 05:32:50', '2025-06-17 05:32:50'),
	(19, 'admin.user.create', 'web', '2025-06-17 05:33:17', '2025-06-17 05:33:17'),
	(20, 'admin.user.edit', 'web', '2025-06-17 05:33:20', '2025-06-17 05:33:20'),
	(23, 'admin.investor.create', 'web', '2025-06-17 05:34:17', '2025-06-17 05:34:17'),
	(24, 'admin.investor.edit', 'web', '2025-06-17 05:34:20', '2025-06-17 05:34:20'),
	(25, 'admin.investor.destroy', 'web', '2025-06-17 05:34:27', '2025-06-17 05:34:27'),
	(26, 'admin.investor.trash', 'web', '2025-06-17 05:34:33', '2025-06-17 05:34:33'),
	(27, 'Invest Process', 'web', '2025-06-17 05:37:47', '2025-06-17 05:37:47'),
	(28, 'admin.invest.create', 'web', '2025-06-17 05:38:48', '2025-06-17 05:38:48'),
	(29, 'admin.invest.edit', 'web', '2025-06-17 05:38:52', '2025-06-17 05:38:52'),
	(32, 'Sattlement', 'web', '2025-06-17 05:40:52', '2025-06-17 05:40:52'),
	(33, 'admin.invest-sattlement.create', 'web', '2025-06-17 05:41:09', '2025-06-23 04:19:25'),
	(34, 'admin.invest-sattlement.edit', 'web', '2025-06-17 05:41:13', '2025-06-23 04:19:31'),
	(37, 'General Accounting', 'web', '2025-06-17 05:42:20', '2025-06-17 05:42:20'),
	(38, 'Transaction', 'web', '2025-06-17 05:42:51', '2025-06-17 05:42:51'),
	(39, 'Reports', 'web', '2025-06-17 05:43:04', '2025-06-17 05:43:04'),
	(40, 'Chart of Accounts', 'web', '2025-06-17 05:43:37', '2025-06-17 05:43:37'),
	(41, 'admin.coa.create', 'web', '2025-06-17 05:44:10', '2025-06-17 05:44:10'),
	(42, 'admin.coa.edit', 'web', '2025-06-17 05:44:15', '2025-06-17 05:44:15'),
	(43, 'admin.coa.destroy', 'web', '2025-06-17 05:44:20', '2025-06-17 05:44:20'),
	(44, 'Debit Voucher', 'web', '2025-06-17 05:45:02', '2025-06-17 05:45:02'),
	(45, 'admin.debit-voucher.create', 'web', '2025-06-17 05:45:12', '2025-06-17 05:45:12'),
	(46, 'admin.debit-voucher.edit', 'web', '2025-06-17 05:45:17', '2025-06-17 05:45:17'),
	(49, 'Credit Voucher', 'web', '2025-06-17 05:46:11', '2025-06-17 05:46:11'),
	(50, 'admin.credit-voucher.create', 'web', '2025-06-17 05:46:23', '2025-06-17 05:46:23'),
	(51, 'admin.credit-voucher.edit', 'web', '2025-06-17 05:46:27', '2025-06-17 05:46:27'),
	(54, 'Journal Voucher', 'web', '2025-06-17 05:46:57', '2025-06-17 05:46:57'),
	(55, 'admin.journal-voucher.create', 'web', '2025-06-17 05:47:08', '2025-06-17 05:47:08'),
	(56, 'admin.journal-voucher.edit', 'web', '2025-06-17 05:47:13', '2025-06-17 05:47:13'),
	(59, 'admin.voucher-approve.index', 'web', '2025-06-17 05:48:10', '2025-06-17 05:56:08'),
	(60, 'admin.voucher-approve.show', 'web', '2025-06-17 05:48:51', '2025-06-17 05:48:51'),
	(61, 'admin.voucher-approve.edit', 'web', '2025-06-17 05:49:08', '2025-06-17 05:49:08'),
	(62, 'admin.voucher-refuse.index', 'web', '2025-06-17 05:50:19', '2025-06-17 05:56:21'),
	(63, 'admin.voucher-refuse.show', 'web', '2025-06-17 05:50:44', '2025-06-17 05:50:44'),
	(64, 'admin.voucher-refuse.edit', 'web', '2025-06-17 05:50:49', '2025-06-17 05:50:49'),
	(65, 'admin.automation-approve.index', 'web', '2025-06-17 05:51:28', '2025-06-17 05:56:39'),
	(66, 'admin.automation-approve.show', 'web', '2025-06-17 05:51:41', '2025-06-17 05:51:41'),
	(67, 'admin.automation-approve.edit', 'web', '2025-06-17 05:51:52', '2025-06-17 05:51:52'),
	(68, 'admin.automation-refuse.index', 'web', '2025-06-17 05:52:56', '2025-06-17 05:56:47'),
	(69, 'admin.automation-refuse.show', 'web', '2025-06-17 05:53:09', '2025-06-17 05:53:09'),
	(70, 'admin.automation-refuse.edit', 'web', '2025-06-17 05:53:17', '2025-06-17 05:53:17'),
	(71, 'Chart of Accounts 1', 'web', '2025-06-17 06:02:09', '2025-06-17 06:02:09'),
	(72, 'Daily Voucher List', 'web', '2025-06-17 06:02:32', '2025-06-17 06:02:32'),
	(73, 'Daily Cash Book', 'web', '2025-06-17 06:03:05', '2025-06-17 06:03:05'),
	(74, 'Bank Book', 'web', '2025-06-17 06:03:16', '2025-06-17 06:03:16'),
	(75, 'Transaction Ledger', 'web', '2025-06-17 06:03:36', '2025-06-17 06:03:36'),
	(76, 'General Ledger', 'web', '2025-06-17 06:03:52', '2025-06-17 06:03:52'),
	(77, 'Cash Flow Statement', 'web', '2025-06-17 06:04:23', '2025-06-17 06:04:23'),
	(78, 'Trial Balance', 'web', '2025-06-17 06:04:35', '2025-06-17 06:04:35'),
	(79, 'Income Statement', 'web', '2025-06-17 06:04:58', '2025-06-17 06:04:58'),
	(80, 'Balance Sheet', 'web', '2025-06-17 06:05:13', '2025-06-17 06:05:13'),
	(81, 'admin.debit-voucher.show', 'web', '2025-06-18 04:03:34', '2025-06-18 04:03:34'),
	(82, 'admin.debit-voucher.print', 'web', '2025-06-18 04:03:38', '2025-06-18 04:03:38'),
	(83, 'admin.debit-voucher.destroy', 'web', '2025-06-18 04:03:43', '2025-06-18 04:03:43'),
	(84, 'admin.debit-voucher.trash', 'web', '2025-06-18 04:03:47', '2025-06-18 04:03:47'),
	(85, 'admin.credit-voucher.show', 'web', '2025-06-18 22:26:47', '2025-06-18 22:26:47'),
	(86, 'admin.credit-voucher.print', 'web', '2025-06-18 22:26:51', '2025-06-18 22:26:51'),
	(87, 'admin.credit-voucher.destroy', 'web', '2025-06-18 22:26:59', '2025-06-18 22:26:59'),
	(88, 'admin.credit-voucher.trash', 'web', '2025-06-18 22:27:02', '2025-06-18 22:27:02'),
	(90, 'admin.invest.destroy', 'web', '2025-06-19 08:47:54', '2025-06-19 08:47:54'),
	(91, 'admin.invest.trash', 'web', '2025-06-19 08:47:58', '2025-06-19 08:47:58'),
	(100, 'admin.product.index', 'web', '2025-06-22 08:35:45', '2025-07-13 02:14:18'),
	(101, 'admin.product.create', 'web', '2025-06-22 08:36:30', '2025-07-13 02:14:48'),
	(102, 'admin.product.edit', 'web', '2025-06-22 08:36:33', '2025-07-13 02:14:53'),
	(127, 'admin.invest-sattlement.show', 'web', '2025-06-23 04:19:47', '2025-06-23 04:19:47'),
	(128, 'admin.invest-sattlement.destroy', 'web', '2025-06-23 04:19:56', '2025-06-23 04:19:56'),
	(129, 'admin.invest-sattlement.trash', 'web', '2025-06-23 04:20:01', '2025-06-23 04:20:01'),
	(130, 'admin.user.password', 'web', '2025-06-23 22:35:11', '2025-06-23 22:35:11'),
	(131, 'admin.user.destroy', 'web', '2025-06-23 22:35:16', '2025-06-23 22:35:16'),
	(132, 'admin.user.trash', 'web', '2025-06-23 22:35:21', '2025-06-23 22:35:21'),
	(135, 'admin.product-edition.index', 'web', '2025-07-16 22:24:15', '2025-07-17 06:25:16'),
	(138, 'Inventory', 'web', '2025-07-17 04:00:10', '2025-07-17 04:00:10'),
	(139, 'Productions', 'web', '2025-07-17 04:01:15', '2025-07-17 04:01:15'),
	(142, 'admin.product-edition.store', 'web', '2025-07-17 06:27:56', '2025-07-17 06:29:13'),
	(143, 'admin.product-edition.edit', 'web', '2025-07-17 06:28:06', '2025-07-17 06:28:06'),
	(144, 'admin.product-edition.destroy', 'web', '2025-07-17 06:28:19', '2025-07-17 06:28:19'),
	(145, 'admin.product.destroy', 'web', '2025-07-17 06:28:23', '2025-07-17 06:28:23'),
	(146, 'admin.product.trash', 'web', '2025-07-17 06:28:28', '2025-07-17 06:28:28'),
	(147, 'admin.production.create', 'web', '2025-07-18 22:28:23', '2025-07-18 22:28:23'),
	(148, 'admin.production.edit', 'web', '2025-07-18 22:28:27', '2025-07-18 22:28:27'),
	(149, 'admin.production.show', 'web', '2025-07-18 22:28:33', '2025-07-18 22:28:33'),
	(152, 'admin.production.print', 'web', '2025-07-19 04:38:54', '2025-07-19 04:38:54'),
	(153, 'admin.production.destroy', 'web', '2025-07-19 04:38:59', '2025-07-19 04:38:59'),
	(154, 'admin.production.trash', 'web', '2025-07-19 04:39:06', '2025-07-19 04:39:06'),
	(155, 'Sales Management', 'web', '2025-07-19 04:47:23', '2025-07-19 04:47:23'),
	(156, 'Dealers', 'web', '2025-07-19 04:49:14', '2025-07-19 04:49:14'),
	(157, 'Sales 1', 'web', '2025-07-19 04:49:37', '2025-07-19 04:49:37'),
	(158, 'admin.client.create', 'web', '2025-07-19 04:49:55', '2025-07-19 04:49:55'),
	(159, 'admin.client.edit', 'web', '2025-07-19 04:50:00', '2025-07-19 04:50:00'),
	(160, 'admin.client.destroy', 'web', '2025-07-19 04:50:07', '2025-07-19 04:50:07'),
	(161, 'admin.client.trash', 'web', '2025-07-19 04:50:11', '2025-07-19 04:50:11'),
	(162, 'admin.sales.create', 'web', '2025-07-19 04:50:26', '2025-07-19 04:50:26'),
	(163, 'admin.sales.edit', 'web', '2025-07-19 04:50:29', '2025-07-19 04:50:29'),
	(164, 'admin.sales.show', 'web', '2025-07-19 04:50:33', '2025-07-20 07:51:18'),
	(166, 'Stock', 'web', '2025-07-19 04:51:17', '2025-07-19 04:51:17'),
	(167, 'System Setup', 'web', '2025-07-19 05:13:16', '2025-07-19 05:13:16'),
	(168, 'Regions', 'web', '2025-07-19 05:14:11', '2025-07-19 05:14:11'),
	(169, 'Area', 'web', '2025-07-19 05:14:30', '2025-07-19 05:14:30'),
	(170, 'Territory', 'web', '2025-07-19 05:14:48', '2025-07-19 05:14:48'),
	(171, 'admin.region.create', 'web', '2025-07-19 06:11:34', '2025-07-19 06:11:34'),
	(172, 'admin.region.edit', 'web', '2025-07-19 06:11:40', '2025-07-19 06:11:40'),
	(173, 'admin.region.destroy', 'web', '2025-07-19 06:11:45', '2025-07-19 06:11:45'),
	(174, 'admin.region.trash', 'web', '2025-07-19 06:11:50', '2025-07-19 06:11:50'),
	(175, 'admin.area.create', 'web', '2025-07-19 06:12:18', '2025-07-19 06:12:18'),
	(176, 'admin.area.edit', 'web', '2025-07-19 06:12:21', '2025-07-19 06:12:21'),
	(177, 'admin.area.destroy', 'web', '2025-07-19 06:12:33', '2025-07-19 06:12:33'),
	(178, 'admin.area.trash', 'web', '2025-07-19 06:12:40', '2025-07-19 06:12:40'),
	(179, 'admin.territory.create', 'web', '2025-07-19 06:12:53', '2025-07-19 06:12:53'),
	(180, 'admin.territory.edit', 'web', '2025-07-19 06:12:56', '2025-07-19 06:12:56'),
	(181, 'admin.territory.destroy', 'web', '2025-07-19 06:13:00', '2025-07-19 06:13:00'),
	(182, 'admin.territory.trash', 'web', '2025-07-19 06:13:06', '2025-07-19 06:13:06'),
	(183, 'Stores', 'web', '2025-07-19 06:14:16', '2025-07-19 06:14:16'),
	(184, 'admin.store.create', 'web', '2025-07-19 06:14:31', '2025-07-19 06:14:31'),
	(185, 'admin.store.edit', 'web', '2025-07-19 06:14:34', '2025-07-19 06:14:34'),
	(186, 'admin.store.destroy', 'web', '2025-07-19 06:14:39', '2025-07-19 06:14:39'),
	(187, 'admin.store.trash', 'web', '2025-07-19 06:14:45', '2025-07-19 06:14:45'),
	(188, 'admin.sales.destroy', 'web', '2025-07-20 07:36:18', '2025-07-20 07:36:18'),
	(189, 'admin.sales.trash', 'web', '2025-07-20 07:36:23', '2025-07-20 07:36:23'),
	(190, 'Collections', 'web', '2025-07-20 07:50:25', '2025-07-20 07:50:25'),
	(191, 'admin.collection.create', 'web', '2025-07-20 07:50:36', '2025-07-20 07:50:36'),
	(192, 'admin.collection.edit', 'web', '2025-07-20 07:50:41', '2025-07-20 07:50:41'),
	(193, 'admin.collection.show', 'web', '2025-07-20 07:50:45', '2025-07-20 07:50:45'),
	(194, 'admin.collection.destroy', 'web', '2025-07-20 07:50:52', '2025-07-20 07:50:52'),
	(195, 'admin.collection.trash', 'web', '2025-07-20 07:50:56', '2025-07-20 07:50:56'),
	(196, 'Sales Returns', 'web', '2025-07-21 05:38:18', '2025-07-21 05:38:18'),
	(197, 'admin.sales-return.create', 'web', '2025-07-21 05:38:34', '2025-07-21 05:38:34'),
	(198, 'admin.sales-return.edit', 'web', '2025-07-21 05:38:45', '2025-07-21 05:38:45'),
	(199, 'admin.sales-return.show', 'web', '2025-07-21 05:38:49', '2025-07-21 05:38:49'),
	(200, 'admin.sales-return.destroy', 'web', '2025-07-21 05:38:55', '2025-07-21 05:38:55'),
	(201, 'admin.sales-return.trash', 'web', '2025-07-21 05:39:07', '2025-07-21 05:39:07'),
	(208, 'Profit Distribution', 'web', '2025-07-22 02:47:36', '2025-07-22 02:47:36'),
	(209, 'admin.profit-distribution.create', 'web', '2025-07-22 02:47:59', '2025-07-22 02:47:59'),
	(210, 'admin.profit-distribution.edit', 'web', '2025-07-22 02:48:05', '2025-07-22 02:48:05'),
	(211, 'admin.profit-distribution.show', 'web', '2025-07-22 02:48:09', '2025-07-22 02:48:09'),
	(212, 'admin.profit-distribution.destroy', 'web', '2025-07-22 02:48:16', '2025-07-22 02:48:16'),
	(213, 'admin.profit-distribution.trash', 'web', '2025-07-22 02:48:22', '2025-07-22 02:48:22'),
	(214, 'Investor Payment', 'web', '2025-07-22 06:50:16', '2025-07-22 06:50:16'),
	(215, 'admin.investor-payment.create', 'web', '2025-07-22 06:50:27', '2025-07-22 06:50:27'),
	(216, 'admin.investor-payment.edit', 'web', '2025-07-22 06:50:31', '2025-07-22 06:50:31'),
	(217, 'admin.investor-payment.show', 'web', '2025-07-22 06:50:38', '2025-07-22 06:50:38'),
	(218, 'admin.investor-payment.destroy', 'web', '2025-07-22 06:50:44', '2025-07-22 06:50:44'),
	(219, 'admin.investor-payment.trash', 'web', '2025-07-22 06:50:50', '2025-07-22 06:50:50'),
	(220, 'Investor Statement', 'web', '2025-07-22 22:46:53', '2025-07-22 22:46:53'),
	(221, 'admin.journal-voucher.show', 'web', '2025-08-31 23:33:11', '2025-08-31 23:33:11'),
	(222, 'admin.journal-voucher.print', 'web', '2025-08-31 23:33:17', '2025-08-31 23:33:17'),
	(223, 'admin.journal-voucher.destroy', 'web', '2025-08-31 23:33:21', '2025-08-31 23:33:21'),
	(224, 'admin.journal-voucher.trash', 'web', '2025-08-31 23:34:07', '2025-08-31 23:34:07'),
	(230, 'Rooms Management', 'web', '2026-02-09 01:27:40', '2026-02-09 01:27:40'),
	(231, 'Room Manage', 'web', '2026-02-09 01:29:43', '2026-02-09 01:29:43'),
	(232, 'Room Type Management', 'web', '2026-02-09 01:39:17', '2026-02-09 01:39:17'),
	(233, 'Room Type 1', 'web', '2026-02-09 01:41:19', '2026-02-09 01:41:19'),
	(234, 'Booking Management', 'web', '2026-02-09 05:31:56', '2026-02-09 05:31:56'),
	(235, 'Booking Manage 1', 'web', '2026-02-09 05:33:01', '2026-02-09 05:33:01'),
	(236, 'Services Manage', 'web', '2026-02-09 22:13:17', '2026-02-09 22:13:17'),
	(237, 'Gallery Manage', 'web', '2026-02-09 22:14:03', '2026-02-09 22:14:03'),
	(238, 'Testimonial Manage', 'web', '2026-02-09 22:14:36', '2026-02-09 22:14:36'),
	(239, 'About Manage', 'web', '2026-02-09 22:15:15', '2026-02-09 22:15:15');

-- Dumping structure for table amar_hostel.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.roles: ~3 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Software Admin', 'web', '2025-06-17 05:01:01', '2025-06-17 05:01:01'),
	(2, 'System Admin', 'web', '2025-06-17 06:06:58', '2025-06-17 06:06:58'),
	(3, 'Investor', 'web', '2025-06-19 05:43:06', '2025-06-19 05:43:06');

-- Dumping structure for table amar_hostel.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.role_has_permissions: ~336 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(90, 1),
	(91, 1),
	(100, 1),
	(101, 1),
	(102, 1),
	(127, 1),
	(128, 1),
	(129, 1),
	(130, 1),
	(131, 1),
	(132, 1),
	(135, 1),
	(138, 1),
	(139, 1),
	(142, 1),
	(143, 1),
	(144, 1),
	(145, 1),
	(146, 1),
	(147, 1),
	(148, 1),
	(149, 1),
	(152, 1),
	(153, 1),
	(154, 1),
	(155, 1),
	(156, 1),
	(157, 1),
	(158, 1),
	(159, 1),
	(160, 1),
	(161, 1),
	(162, 1),
	(163, 1),
	(164, 1),
	(166, 1),
	(167, 1),
	(168, 1),
	(169, 1),
	(170, 1),
	(171, 1),
	(172, 1),
	(173, 1),
	(174, 1),
	(175, 1),
	(176, 1),
	(177, 1),
	(178, 1),
	(179, 1),
	(180, 1),
	(181, 1),
	(182, 1),
	(183, 1),
	(184, 1),
	(185, 1),
	(186, 1),
	(187, 1),
	(188, 1),
	(189, 1),
	(190, 1),
	(191, 1),
	(192, 1),
	(193, 1),
	(194, 1),
	(195, 1),
	(196, 1),
	(197, 1),
	(198, 1),
	(199, 1),
	(200, 1),
	(201, 1),
	(208, 1),
	(209, 1),
	(210, 1),
	(211, 1),
	(212, 1),
	(213, 1),
	(214, 1),
	(215, 1),
	(216, 1),
	(217, 1),
	(218, 1),
	(219, 1),
	(220, 1),
	(221, 1),
	(222, 1),
	(223, 1),
	(224, 1),
	(230, 1),
	(231, 1),
	(232, 1),
	(233, 1),
	(234, 1),
	(235, 1),
	(236, 1),
	(237, 1),
	(238, 1),
	(239, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(6, 2),
	(7, 2),
	(15, 2),
	(16, 2),
	(17, 2),
	(18, 2),
	(19, 2),
	(20, 2),
	(23, 2),
	(24, 2),
	(25, 2),
	(26, 2),
	(27, 2),
	(28, 2),
	(29, 2),
	(32, 2),
	(33, 2),
	(34, 2),
	(37, 2),
	(38, 2),
	(39, 2),
	(40, 2),
	(41, 2),
	(42, 2),
	(43, 2),
	(44, 2),
	(45, 2),
	(46, 2),
	(49, 2),
	(50, 2),
	(51, 2),
	(54, 2),
	(55, 2),
	(56, 2),
	(59, 2),
	(60, 2),
	(61, 2),
	(62, 2),
	(63, 2),
	(64, 2),
	(65, 2),
	(66, 2),
	(67, 2),
	(68, 2),
	(69, 2),
	(70, 2),
	(71, 2),
	(72, 2),
	(73, 2),
	(74, 2),
	(75, 2),
	(76, 2),
	(77, 2),
	(78, 2),
	(79, 2),
	(80, 2),
	(81, 2),
	(82, 2),
	(83, 2),
	(84, 2),
	(85, 2),
	(86, 2),
	(87, 2),
	(88, 2),
	(90, 2),
	(91, 2),
	(100, 2),
	(101, 2),
	(102, 2),
	(127, 2),
	(128, 2),
	(129, 2),
	(130, 2),
	(131, 2),
	(132, 2),
	(135, 2),
	(138, 2),
	(139, 2),
	(142, 2),
	(143, 2),
	(144, 2),
	(145, 2),
	(146, 2),
	(147, 2),
	(148, 2),
	(149, 2),
	(152, 2),
	(153, 2),
	(154, 2),
	(155, 2),
	(156, 2),
	(157, 2),
	(158, 2),
	(159, 2),
	(160, 2),
	(161, 2),
	(162, 2),
	(163, 2),
	(164, 2),
	(166, 2),
	(167, 2),
	(168, 2),
	(169, 2),
	(170, 2),
	(171, 2),
	(172, 2),
	(173, 2),
	(174, 2),
	(175, 2),
	(176, 2),
	(177, 2),
	(178, 2),
	(179, 2),
	(180, 2),
	(181, 2),
	(182, 2),
	(183, 2),
	(184, 2),
	(185, 2),
	(186, 2),
	(187, 2),
	(188, 2),
	(189, 2),
	(190, 2),
	(191, 2),
	(192, 2),
	(193, 2),
	(194, 2),
	(195, 2),
	(196, 2),
	(197, 2),
	(198, 2),
	(199, 2),
	(200, 2),
	(201, 2),
	(208, 2),
	(209, 2),
	(210, 2),
	(211, 2),
	(212, 2),
	(213, 2),
	(214, 2),
	(215, 2),
	(216, 2),
	(217, 2),
	(218, 2),
	(219, 2),
	(220, 2),
	(221, 2),
	(222, 2),
	(223, 2),
	(224, 2),
	(1, 3),
	(220, 3);

-- Dumping structure for table amar_hostel.rooms
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `status` int DEFAULT '1',
  `capacity` int NOT NULL,
  `available` int NOT NULL DEFAULT '8',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rooms_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.rooms: ~8 rows (approximately)
DELETE FROM `rooms`;
INSERT INTO `rooms` (`id`, `name`, `category_id`, `description`, `price`, `status`, `capacity`, `available`, `image`, `image2`, `image3`, `image4`, `meta_title`, `meta_description`, `meta_keywords`, `meta_image`, `slug`, `created_at`, `updated_at`) VALUES
	(2, 'Double Deluxe Room SingleTest', 1, 'Double Deluxe Room', 22.00, 1, 8, 7, 'rooms/gKQZ9ERAkiJBua6520o88AgSJrTPvCwZfnYHCKk6.jpg', 'rooms/VryKQgMJ4d3dqJCwyND3wn5rZ8C2uGAgSlFOGhAG.jpg', 'rooms/eZ2bj1wfI9C7jYOUtLe9vLwWKs5F8MtjwL9Pl2XN.jpg', 'rooms/zK4XnNRRz65cuHZEPHcALdgtdakEm66orYj9P7iV.jpg', 'Double Deluxe Room', 'Double Deluxe Room', 'Double Deluxe Room', 'rooms/seo/xlzCxMZis93zTeaqXatfgSi692N3Ex8t4YTUrn3b.jpg', 'double-deluxe-room-singletest', '2026-02-04 23:55:23', '2026-02-10 03:24:12'),
	(6, 'AM-01-02', 3, 'Single Deluxe Room', 22.00, 1, 4, 1, 'rooms/jQGC8Up2uQcdsQ485hBHMkwsoFyOR39UkVDE6w7m.jpg', 'rooms/krenxliAQiLbzNdcV6UumxYxqiBOMpSWWOknmxq6.jpg', 'rooms/oGuw0H6HvzCur4VbL3VE2v7mBMcWQLbE14qz4dmU.jpg', 'rooms/brsXiCzeWmd3loFgcAmGG0ArOw7cGVHhsUem4Lvp.jpg', 'Single Deluxe Room', 'Single Deluxe Room', 'Single Deluxe Room', 'rooms/seo/TK8eBehnfFPqOyHtdVbt8XtKfgt5CSJmP9llaX1L.jpg', 'am-01-02', '2026-02-05 00:35:14', '2026-02-10 00:45:41'),
	(8, 'Honeymoon Suit', 2, 'Honeymoon Suit', 44.00, 1, 4, 2, 'rooms/qJzeXPi69vZw9FmhXtQuMScHPbowl0t03SP12qin.jpg', NULL, NULL, NULL, 'Honeymoon Suit', 'Honeymoon Suit', 'Honeymoon Suit', 'rooms/seo/UR956rfk7fScdUPPuoLHdAB5Qw15asy3kGuPQtwu.jpg', 'honeymoon-suit', '2026-02-05 05:59:41', '2026-02-09 05:37:39'),
	(9, 'Economy Double', 4, 'Economy Double', 45.00, 1, 4, 0, 'rooms/3KWBC1gjw6q4QEdBYiplMhRynxBVrUpley90z050.jpg', NULL, NULL, NULL, 'Economy Double', 'Economy Double', 'Economy Double', 'rooms/seo/sqSsbp08Msx83HSBx2colnxug0tKawEsdQpLhWMw.jpg', 'economy-double', '2026-02-05 06:00:59', '2026-02-10 04:13:10'),
	(10, 'Economy Double Classic', 2, 'Economy Double Classic', 44.00, 1, 8, 2, 'rooms/pKEohB8fOkFqhl9n0ubdGVYNSYPH2xqQYNIMIuuK.jpg', NULL, NULL, NULL, 'Economy Double Classic', 'Economy Double Classic', NULL, 'rooms/seo/6XXxiC1a9l3UrstTjRxPyCm8gyCFTAvi9212o8q2.jpg', 'economy-double-classic', '2026-02-05 06:01:57', '2026-02-08 03:43:19'),
	(11, 'Economy Double Classic2', 2, 'Economy Double Classic', 33.00, 1, 8, 3, 'rooms/K1RVpYBMz2jCCudYVxFg5g3fAJWp7xN1fVJNmueR.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'economy-double-classic2', '2026-02-05 06:02:32', '2026-02-10 03:47:54'),
	(12, 'tes', 2, 'asdsa', 22.00, 1, 8, 3, 'rooms/paLEZRVGbv84UIJTcWRh7xBrjuCWxcGQvDOr644I.jpg', 'rooms/HB3wxWuY4uqS8zGp21FB8TA9fwxmC78bp090i2DP.jpg', 'rooms/qDNH5X6YSTT1jAfwR9Gcnpn1kJSryt5FPBUmsmaV.jpg', 'rooms/e69trXFTaxhrezIeJlfvCmwSeYnjaBFVD4IIXkIo.jpg', NULL, NULL, NULL, NULL, 'tes', '2026-02-10 00:36:07', '2026-02-10 00:36:07'),
	(13, 'Test2', 3, 'asdsasdad', 333.00, 1, 4, 1, 'rooms/B91NxjsI4oJNZgQNPPTKaeydUZD2kBVM9vGo6TXQ.jpg', 'rooms/lYR3hlMuqA6AwweoiAQ6jVWXzAijPqulRpJpHIXR.jpg', 'rooms/8tMlYvi6n1iuzdwF2mweMQo9o7czr8u29WG1ORvN.jpg', 'rooms/TSr0a7pNltHQNEsu3bcEWRI8LjW4g85SvJadWxwQ.jpg', NULL, NULL, NULL, NULL, 'test2', '2026-02-10 00:41:56', '2026-02-10 00:41:56');

-- Dumping structure for table amar_hostel.services
DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_room_id_foreign` (`room_id`),
  CONSTRAINT `services_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.services: ~0 rows (approximately)
DELETE FROM `services`;

-- Dumping structure for table amar_hostel.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.sessions: ~3 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('3CHShAyab8EjC4g2rP59JA0P41bmwV9Jmp3nGGaT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMWJaeHJreFlQTHEwaHZRcFlHMkFqeUJlb1h6RUVmNzJQTDR1TEZReSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yb29tL2RldGFpbHMvOSI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1770718407),
	('AoqkOEwdRuF2Vk4O0PSGl4RBhQOiUJ7VbPeP3jJ3', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieTVjVlVLSHNneVVJSjVla052aU9HRUFFZ0V3TktPSkhNY1ZvdzRocyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9ib29raW5ncyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1770639851),
	('smeAg50etwEPAuzuloft7JKRGHvQ9O1DISVkej5V', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQXE3TnJZV0RYNW1IRVRUU2RIVTVUNU1jQjNkc3EzZ0NzNFJDNnlrSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vaW52ZXN0b3Itc3RhdGVtZW50P2RhdGVfcmFuZ2U9MDEtMDItMjAyNiUyMHRvJTIwMjgtMDItMjAyNiZmaWx0ZXI9MSZpbnZlc3Rvcl9pZD0xJnByaW50PSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7fQ==', 1770698594);

-- Dumping structure for table amar_hostel.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `banner_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_status` tinyint(1) NOT NULL DEFAULT '1',
  `banner_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_status` tinyint(1) NOT NULL DEFAULT '1',
  `page_heading_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_image` text COLLATE utf8mb4_unicode_ci,
  `google_map` text COLLATE utf8mb4_unicode_ci,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_url` json DEFAULT NULL,
  `sms_api_key` json DEFAULT NULL,
  `sms_api_id` json DEFAULT NULL,
  `bkash_status` tinyint(1) NOT NULL DEFAULT '1',
  `nagad_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.settings: ~0 rows (approximately)
DELETE FROM `settings`;
INSERT INTO `settings` (`id`, `app_name`, `title`, `primary_phone`, `secondary_phone`, `primary_email`, `secondary_email`, `office_time`, `address`, `description`, `banner_one`, `banner_one_link`, `banner_one_status`, `banner_two`, `banner_two_link`, `banner_two_status`, `page_heading_bg`, `meta_title`, `meta_keyword`, `meta_description`, `meta_image`, `google_map`, `favicon`, `logo`, `footer_logo`, `placeholder`, `facebook_page`, `facebook_group`, `youtube`, `twitter`, `linkedin`, `google`, `whatsapp`, `instagram`, `pinterest`, `sms_api_url`, `sms_api_key`, `sms_api_id`, `bkash_status`, `nagad_status`, `created_at`, `updated_at`) VALUES
	(1, 'Amar Hostel', 'Amar Hostel', '33333', '33333', 'amar@hostel.com', 'amar@hostel.com', NULL, 'dsad', 'dsaddas', NULL, NULL, 1, NULL, NULL, 1, NULL, 'dasd', 'sads', 'dsad', NULL, NULL, 'storage/settings/2026-02-09-wkH0tkT84jkJmtu0033kjVvSl3rAcpimAEPbgCC0.webp', 'storage/settings/2026-02-09-WXI1ydTdwGPz6e9NiIub10XzXUuCNiFVTLdvgubk.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2026-02-09 02:27:22', '2026-02-09 02:27:22');

-- Dumping structure for table amar_hostel.testimonials
DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.testimonials: ~0 rows (approximately)
DELETE FROM `testimonials`;

-- Dumping structure for table amar_hostel.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_status` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expire` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  KEY `users_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `phone`, `address`, `image`, `cover_image`, `role_status`, `status`, `email_verified_at`, `otp`, `otp_expire`, `password`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 'wali@gmail.com', '01711111111', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '$2y$12$ZUsjvxfb7txNaFEKaCvFeeMrlJVbVM0Fdmf2c7kOzUeLMkAQJgJ56', NULL, NULL, NULL, NULL, NULL, '2026-02-03 03:19:59', '2026-02-03 03:19:59'),
	(3, 'ww', 'ww', 'wasi@gmail.com', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$iONyaTWlMDUGzmhgZXQ1Cu4vNkUSlqxVA9YuGlBhrrpXjqo3eUh4m', NULL, NULL, NULL, NULL, NULL, '2026-02-07 23:51:00', '2026-02-07 23:51:00'),
	(6, 'Investor 1', '01997316189', NULL, '01997316189', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$66yI.icak6oOYd/xksn9pOFuzWgmCx3ZhvCqBEfSg5cqePk6gJCcW', 'e38ihUpeZHFrwepitUgTsnTFftyuLdWZRHJJ2Wu4DAGpyVIHVa3VKcvCOlSP', 1, NULL, NULL, NULL, '2026-02-09 22:23:41', '2026-02-09 22:23:41');

-- Dumping structure for table amar_hostel.wallets
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned DEFAULT NULL,
  `investor_profit_id` bigint unsigned DEFAULT NULL,
  `investor_payment_id` bigint unsigned DEFAULT NULL,
  `sattlement_id` bigint unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount_in` decimal(16,0) NOT NULL DEFAULT '0',
  `amount_out` decimal(16,0) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint NOT NULL DEFAULT '0',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_investor_id_foreign` (`investor_id`),
  CONSTRAINT `wallets_investor_id_foreign` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table amar_hostel.wallets: ~1 rows (approximately)
DELETE FROM `wallets`;
INSERT INTO `wallets` (`id`, `investor_id`, `invest_id`, `investor_profit_id`, `investor_payment_id`, `sattlement_id`, `date`, `amount_in`, `amount_out`, `type`, `approved`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, NULL, NULL, NULL, '2026-02-10', 20000, 0, 'Invest', 1, 1, 1, NULL, NULL, '2026-02-09 22:42:48', '2026-02-09 22:43:05');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
