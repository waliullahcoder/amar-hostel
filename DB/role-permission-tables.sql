-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2026 at 08:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `is_deletable`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<span class=\"material-symbols-outlined fs-22\"> home_app_logo </span>', 1, 1, 1, '2025-06-17 05:07:50', '2025-06-17 05:31:46'),
(2, 2, NULL, 'System Settings', NULL, '<span class=\"material-symbols-outlined fs-22\"> settings_cinematic_blur </span>', 2, 1, 1, '2025-06-17 05:10:14', '2025-06-17 05:10:14'),
(3, 3, 2, 'Roles', 'admin.role.index', NULL, 1, 1, 1, '2025-06-17 05:10:36', '2025-06-17 05:10:36'),
(4, 4, 2, 'Users', 'admin.user.index', NULL, 2, 1, 1, '2025-06-17 05:11:10', '2025-06-17 05:11:10'),
(5, 5, 2, 'Menu', 'admin.admin-menu.index', NULL, 3, 1, 1, '2025-06-17 05:11:51', '2025-06-17 05:11:51'),
(6, 6, 2, 'Admin Settings', 'admin.admin-settings.index', NULL, 4, 1, 1, '2025-06-17 05:12:59', '2025-06-17 05:12:59'),
(7, 7, 2, 'Investors', 'admin.investor.index', NULL, 5, 1, 1, '2025-06-17 05:13:38', '2025-06-17 05:13:38'),
(8, 27, NULL, 'Invest Process', 'admin.invest.index', '<span class=\"material-symbols-outlined fs-24\"> finance_mode </span>', 6, 1, 1, '2025-06-17 05:37:47', '2025-07-19 04:48:45'),
(9, 32, NULL, 'Sattlement', 'admin.invest-sattlement.index', '<span class=\"material-symbols-outlined fs-24\"> inventory </span>', 9, 1, 1, '2025-06-17 05:40:52', '2025-07-22 06:49:30'),
(10, 37, NULL, 'General Accounting', NULL, '<span class=\"material-symbols-outlined fs-24\"> calculate </span>', 11, 1, 1, '2025-06-17 05:42:20', '2025-07-03 03:56:00'),
(11, 38, 10, 'Transaction', NULL, NULL, 1, 1, 1, '2025-06-17 05:42:51', '2025-06-17 05:42:51'),
(12, 39, 10, 'Reports', NULL, NULL, 2, 1, 1, '2025-06-17 05:43:04', '2025-06-17 05:43:04'),
(13, 40, 11, 'Chart of Accounts', 'admin.coa.index', NULL, 1, 1, 1, '2025-06-17 05:43:37', '2025-06-17 05:43:37'),
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
(32, 100, 45, 'Books', 'admin.product.index', '<span class=\"material-symbols-outlined fs-24\"> menu_book </span>', 5, 1, 1, '2025-06-22 08:35:45', '2025-07-19 06:13:58'),
(39, 138, NULL, 'Inventory', NULL, '<span class=\"material-symbols-outlined fs-24\"> inventory </span>', 4, 1, 1, '2025-07-17 04:00:10', '2025-07-19 05:13:34'),
(40, 139, 39, 'Productions', 'admin.production.index', NULL, 1, 1, 1, '2025-07-17 04:01:15', '2025-07-17 04:01:15'),
(41, 155, NULL, 'Sales Management', NULL, '<span class=\"material-symbols-outlined fs-24\"> bar_chart_4_bars </span>', 4, 1, 1, '2025-07-19 04:47:23', '2025-07-19 04:47:23'),
(42, 156, 41, 'Dealers', 'admin.client.index', NULL, 1, 1, 1, '2025-07-19 04:49:14', '2025-07-19 04:49:14'),
(43, 157, 41, 'Sales', 'admin.sales.index', NULL, 2, 1, 1, '2025-07-19 04:49:37', '2025-07-19 04:49:37'),
(44, 166, 39, 'Stock', 'admin.stock-status.index', NULL, 2, 1, 1, '2025-07-19 04:51:17', '2025-07-25 22:53:04'),
(45, 167, NULL, 'System Setup', NULL, '<span class=\"material-symbols-outlined fs-24\"> api </span>', 3, 1, 1, '2025-07-19 05:13:16', '2025-07-19 05:13:16'),
(46, 168, 45, 'Regions', 'admin.region.index', NULL, 1, 1, 1, '2025-07-19 05:14:11', '2025-07-19 06:37:03'),
(47, 169, 45, 'Area', 'admin.area.index', NULL, 2, 1, 1, '2025-07-19 05:14:30', '2025-07-19 05:14:30'),
(48, 170, 45, 'Territory', 'admin.territory.index', NULL, 3, 1, 1, '2025-07-19 05:14:48', '2025-07-19 05:14:48'),
(49, 183, 45, 'Stores', 'admin.store.index', NULL, 4, 1, 1, '2025-07-19 06:14:16', '2025-07-19 06:14:22'),
(50, 190, 41, 'Collections', 'admin.collection.index', NULL, 3, 1, 1, '2025-07-20 07:50:25', '2025-07-20 07:50:25'),
(51, 196, 41, 'Sales Returns', 'admin.sales-return.index', NULL, 4, 1, 1, '2025-07-21 05:38:18', '2025-07-21 05:38:18'),
(53, 208, NULL, 'Profit Distribution', 'admin.profit-distribution.index', '<span class=\"material-symbols-outlined fs-24\"> event_repeat </span>', 7, 1, 1, '2025-07-22 02:47:36', '2025-07-22 02:47:49'),
(54, 214, NULL, 'Investor Payment', 'admin.investor-payment.index', '<span class=\"material-symbols-outlined fs-24\"> add_card </span>', 8, 1, 1, '2025-07-22 06:50:16', '2025-07-22 06:50:16'),
(55, 220, NULL, 'Investor Statement', 'admin.investor-statement.index', '<span class=\"material-symbols-outlined fs-24\"> contract </span>', 10, 1, 1, '2025-07-22 22:46:53', '2025-07-22 22:46:53'),
(56, 225, 45, 'Sales Officer', 'admin.sales-officer.index', NULL, 6, 1, 1, '2025-11-01 22:30:38', '2025-11-01 22:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_actions`
--

CREATE TABLE `admin_menu_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `admin_menu_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `route` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_actions`
--

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
(169, 224, 16, 'trash', 'admin.journal-voucher.trash', 1, '2025-08-31 23:34:07', '2025-08-31 23:34:07'),
(170, 226, 56, 'create', 'admin.sales-officer.create', 1, '2025-11-01 22:30:52', '2025-11-01 22:30:52'),
(171, 227, 56, 'edit', 'admin.sales-officer.edit', 1, '2025-11-01 22:30:56', '2025-11-01 22:30:56'),
(172, 228, 56, 'delete', 'admin.sales-officer.destroy', 1, '2025-11-01 22:31:02', '2025-11-01 22:31:02'),
(173, 229, 56, 'trash', 'admin.sales-officer.trash', 1, '2025-11-01 22:31:08', '2025-11-01 22:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

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
(225, 'Sales Officer', 'web', '2025-11-01 22:30:38', '2025-11-01 22:30:38'),
(226, 'admin.sales-officer.create', 'web', '2025-11-01 22:30:52', '2025-11-01 22:30:52'),
(227, 'admin.sales-officer.edit', 'web', '2025-11-01 22:30:56', '2025-11-01 22:30:56'),
(228, 'admin.sales-officer.destroy', 'web', '2025-11-01 22:31:02', '2025-11-01 22:31:02'),
(229, 'admin.sales-officer.trash', 'web', '2025-11-01 22:31:08', '2025-11-01 22:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Software Admin', 'web', '2025-06-17 05:01:01', '2025-06-17 05:01:01'),
(2, 'System Admin', 'web', '2025-06-17 06:06:58', '2025-06-17 06:06:58'),
(3, 'Investor', 'web', '2025-06-19 05:43:06', '2025-06-19 05:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(102, 1),
(102, 2),
(127, 1),
(127, 2),
(128, 1),
(128, 2),
(129, 1),
(129, 2),
(130, 1),
(130, 2),
(131, 1),
(131, 2),
(132, 1),
(132, 2),
(135, 1),
(135, 2),
(138, 1),
(138, 2),
(139, 1),
(139, 2),
(142, 1),
(142, 2),
(143, 1),
(143, 2),
(144, 1),
(144, 2),
(145, 1),
(145, 2),
(146, 1),
(146, 2),
(147, 1),
(147, 2),
(148, 1),
(148, 2),
(149, 1),
(149, 2),
(152, 1),
(152, 2),
(153, 1),
(153, 2),
(154, 1),
(154, 2),
(155, 1),
(155, 2),
(156, 1),
(156, 2),
(157, 1),
(157, 2),
(158, 1),
(158, 2),
(159, 1),
(159, 2),
(160, 1),
(160, 2),
(161, 1),
(161, 2),
(162, 1),
(162, 2),
(163, 1),
(163, 2),
(164, 1),
(164, 2),
(166, 1),
(166, 2),
(167, 1),
(167, 2),
(168, 1),
(168, 2),
(169, 1),
(169, 2),
(170, 1),
(170, 2),
(171, 1),
(171, 2),
(172, 1),
(172, 2),
(173, 1),
(173, 2),
(174, 1),
(174, 2),
(175, 1),
(175, 2),
(176, 1),
(176, 2),
(177, 1),
(177, 2),
(178, 1),
(178, 2),
(179, 1),
(179, 2),
(180, 1),
(180, 2),
(181, 1),
(181, 2),
(182, 1),
(182, 2),
(183, 1),
(183, 2),
(184, 1),
(184, 2),
(185, 1),
(185, 2),
(186, 1),
(186, 2),
(187, 1),
(187, 2),
(188, 1),
(188, 2),
(189, 1),
(189, 2),
(190, 1),
(190, 2),
(191, 1),
(191, 2),
(192, 1),
(192, 2),
(193, 1),
(193, 2),
(194, 1),
(194, 2),
(195, 1),
(195, 2),
(196, 1),
(196, 2),
(197, 1),
(197, 2),
(198, 1),
(198, 2),
(199, 1),
(199, 2),
(200, 1),
(200, 2),
(201, 1),
(201, 2),
(208, 1),
(208, 2),
(209, 1),
(209, 2),
(210, 1),
(210, 2),
(211, 1),
(211, 2),
(212, 1),
(212, 2),
(213, 1),
(213, 2),
(214, 1),
(214, 2),
(215, 1),
(215, 2),
(216, 1),
(216, 2),
(217, 1),
(217, 2),
(218, 1),
(218, 2),
(219, 1),
(219, 2),
(220, 1),
(220, 2),
(220, 3),
(221, 1),
(221, 2),
(222, 1),
(222, 2),
(223, 1),
(223, 2),
(224, 1),
(224, 2),
(225, 1),
(225, 2),
(226, 1),
(226, 2),
(227, 1),
(227, 2),
(228, 1),
(228, 2),
(229, 1),
(229, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menus_permission_id_foreign` (`permission_id`),
  ADD KEY `admin_menus_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menu_actions_permission_id_foreign` (`permission_id`),
  ADD KEY `admin_menu_actions_admin_menu_id_foreign` (`admin_menu_id`);

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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD CONSTRAINT `admin_menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_menus_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  ADD CONSTRAINT `admin_menu_actions_admin_menu_id_foreign` FOREIGN KEY (`admin_menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_menu_actions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
