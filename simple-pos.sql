/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `history_products`;
CREATE TABLE `history_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `qty` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyChange` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `permission_user_permission_id_foreign` (`permission_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_transation`;
CREATE TABLE `product_transation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `invoices_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` bigint(20) unsigned NOT NULL,
  `sub_total` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `transcations`;
CREATE TABLE `transcations` (
  `invoices_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `pay` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `sub_total` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `customers` (`id`, `nama`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(2, 'sofi', 'sd', NULL, '2022-02-09 03:33:09', '2022-02-09 03:33:09');
INSERT INTO `customers` (`id`, `nama`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(3, 'melati', 'sdsd', 'adsasd', '2022-02-09 03:33:25', '2022-02-09 03:43:32');




INSERT INTO `history_products` (`id`, `product_id`, `user_id`, `qty`, `qtyChange`, `tipe`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '10000', '0', 'created product', '2022-01-19 02:37:10', '2022-01-19 02:37:10');
INSERT INTO `history_products` (`id`, `product_id`, `user_id`, `qty`, `qtyChange`, `tipe`, `created_at`, `updated_at`) VALUES
(2, 5, 1, '100', '0', 'created product', '2022-01-19 02:37:47', '2022-01-19 02:37:47');
INSERT INTO `history_products` (`id`, `product_id`, `user_id`, `qty`, `qtyChange`, `tipe`, `created_at`, `updated_at`) VALUES
(3, 5, 1, '100', '-1', 'decrease from transaction', '2022-01-19 02:48:15', '2022-01-19 02:48:15');
INSERT INTO `history_products` (`id`, `product_id`, `user_id`, `qty`, `qtyChange`, `tipe`, `created_at`, `updated_at`) VALUES
(4, 4, 1, '10000', '-3', 'decrease from transaction', '2022-01-19 02:48:15', '2022-01-19 02:48:15'),
(5, 4, 1, '9997', '-1', 'decrease from transaction', '2022-01-19 04:12:20', '2022-01-19 04:12:20'),
(6, 4, 1, '9996', '-1', 'decrease from transaction', '2022-01-19 04:13:52', '2022-01-19 04:13:52'),
(7, 4, 1, '9995', '-1', 'decrease from transaction', '2022-01-19 04:15:51', '2022-01-19 04:15:51'),
(8, 4, 1, '9994', '-1', 'decrease from transaction', '2022-01-19 04:16:12', '2022-01-19 04:16:12'),
(9, 4, 1, '9993', '-1', 'decrease from transaction', '2022-01-19 04:28:38', '2022-01-19 04:28:38'),
(10, 4, 1, '9992', '-1', 'decrease from transaction', '2022-01-19 04:29:05', '2022-01-19 04:29:05'),
(11, 4, 1, '9991', '-1', 'decrease from transaction', '2022-01-19 04:30:04', '2022-01-19 04:30:04'),
(12, 4, 1, '9990', '-1', 'decrease from transaction', '2022-01-19 04:30:54', '2022-01-19 04:30:54'),
(13, 4, 1, '9989', '-1', 'decrease from transaction', '2022-01-19 04:31:25', '2022-01-19 04:31:25'),
(14, 4, 1, '9988', '-1', 'decrease from transaction', '2022-01-19 04:34:57', '2022-01-19 04:34:57'),
(15, 4, 1, '9987', '-1', 'decrease from transaction', '2022-01-19 04:36:59', '2022-01-19 04:36:59'),
(16, 4, 1, '9986', '-1', 'decrease from transaction', '2022-01-19 04:37:51', '2022-01-19 04:37:51'),
(17, 5, 1, '99', '-1', 'decrease from transaction', '2022-01-19 04:48:19', '2022-01-19 04:48:19'),
(18, 4, 1, '9985', '-2', 'decrease from transaction', '2022-01-19 04:48:19', '2022-01-19 04:48:19'),
(19, 4, 1, '9983', '-1', 'decrease from transaction', '2022-01-19 04:49:04', '2022-01-19 04:49:04'),
(20, 5, 1, '98', '-1', 'decrease from transaction', '2022-01-19 04:49:04', '2022-01-19 04:49:04'),
(21, 4, 1, '9982', '-1', 'decrease from transaction', '2022-01-19 04:52:16', '2022-01-19 04:52:16'),
(22, 4, 1, '9981', '-1', 'decrease from transaction', '2022-01-19 04:53:00', '2022-01-19 04:53:00'),
(23, 4, 1, '9980', '-1', 'decrease from transaction', '2022-01-19 04:53:37', '2022-01-19 04:53:37'),
(24, 5, 1, '97', '-1', 'decrease from transaction', '2022-01-19 04:53:37', '2022-01-19 04:53:37'),
(25, 4, 1, '9979', '-1', 'decrease from transaction', '2022-01-19 04:57:28', '2022-01-19 04:57:28'),
(26, 4, 1, '9978', '-1', 'decrease from transaction', '2022-01-19 05:03:20', '2022-01-19 05:03:20'),
(27, 4, 1, '9977', '-1', 'decrease from transaction', '2022-01-19 05:04:11', '2022-01-19 05:04:11'),
(28, 4, 1, '9976', '-1', 'decrease from transaction', '2022-01-19 05:07:59', '2022-01-19 05:07:59'),
(29, 5, 1, '96', '-1', 'decrease from transaction', '2022-01-19 05:07:59', '2022-01-19 05:07:59'),
(30, 6, 1, '123', '0', 'created product', '2022-01-20 01:30:21', '2022-01-20 01:30:21'),
(31, 7, 1, '123', '0', 'created product', '2022-01-20 01:44:52', '2022-01-20 01:44:52'),
(32, 130, 1, '10000', '-1', 'decrease from transaction', '2022-01-20 02:11:13', '2022-01-20 02:11:13'),
(33, 131, 1, '10000', '-2', 'decrease from transaction', '2022-01-20 02:11:13', '2022-01-20 02:11:13'),
(34, 88, 1, '10000', '-3', 'decrease from transaction', '2022-01-20 04:48:15', '2022-01-20 04:48:15'),
(35, 74, 1, '10000', '-1', 'decrease from transaction', '2022-01-20 04:58:36', '2022-01-20 04:58:36'),
(36, 88, 1, '9997', '-2', 'decrease from transaction', '2022-01-20 04:58:36', '2022-01-20 04:58:36'),
(37, 109, 1, '10000', '-1', 'decrease from transaction', '2022-01-20 05:05:13', '2022-01-20 05:05:13'),
(38, 109, 1, '9999', '-2', 'decrease from transaction', '2022-01-27 05:06:20', '2022-01-27 05:06:20'),
(39, 129, 1, '10000', '-3', 'decrease from transaction', '2022-01-27 05:09:41', '2022-01-27 05:09:41'),
(41, 109, 1, '9997', '-1', 'decrease from transaction', '2022-02-09 03:57:09', '2022-02-09 03:57:09'),
(42, 75, 1, '10000', '-1', 'decrease from transaction', '2022-02-09 04:19:06', '2022-02-09 04:19:06'),
(43, 74, 2, '9999', '-1', 'decrease from transaction', '2022-02-10 08:01:58', '2022-02-10 08:01:58'),
(44, 88, 2, '9995', '-1', 'decrease from transaction', '2022-02-10 08:01:58', '2022-02-10 08:01:58'),
(45, 88, 3, '9994', '-1', 'decrease from transaction', '2022-02-21 04:19:23', '2022-02-21 04:19:23'),
(46, 74, 3, '9998', '-1', 'decrease from transaction', '2022-02-21 04:19:23', '2022-02-21 04:19:23'),
(47, 132, 1, '3', '0', 'created product', '2022-02-21 04:34:21', '2022-02-21 04:34:21'),
(48, 62, 1, '10000', '100', 'change product qty from admin', '2022-02-21 07:03:20', '2022-02-21 07:03:20'),
(49, 133, 1, '99999', '0', 'created product', '2022-02-21 07:10:57', '2022-02-21 07:10:57'),
(50, 62, 1, '10100', '-100', 'change product qty from admin', '2022-02-22 02:33:22', '2022-02-22 02:33:22');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2020_05_16_070107_create_products_table', 1),
(5, '2020_05_16_072227_create_transcations_table', 1),
(6, '2020_05_16_072533_create_product_transation_table', 1),
(7, '2020_05_16_120622_create_history_products_table', 1),
(8, '2022_02_09_021110_create_customers_table', 2),
(9, '2022_02_10_072624_laratrust_setup_tables', 3);



INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1);
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(2, 1);
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(3, 1);
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2);



INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'users-index', 'Index Users', 'Index Users', '2022-02-10 07:41:55', '2022-02-10 07:41:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'users-create', 'Create Users', 'Create Users', '2022-02-10 07:41:55', '2022-02-10 07:41:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(3, 'users-read', 'Read Users', 'Read Users', '2022-02-10 07:41:55', '2022-02-10 07:41:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(4, 'users-update', 'Update Users', 'Update Users', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(5, 'users-delete', 'Delete Users', 'Delete Users', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(6, 'products-index', 'Index Products', 'Index Products', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(7, 'products-create', 'Create Products', 'Create Products', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(8, 'products-read', 'Read Products', 'Read Products', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(9, 'products-update', 'Update Products', 'Update Products', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(10, 'products-delete', 'Delete Products', 'Delete Products', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(11, 'pos-index', 'Index Pos', 'Index Pos', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(12, 'pos-create', 'Create Pos', 'Create Pos', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(13, 'pos-read', 'Read Pos', 'Read Pos', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(14, 'pos-update', 'Update Pos', 'Update Pos', '2022-02-10 07:41:55', '2022-02-10 07:41:55'),
(15, 'pos-delete', 'Delete Pos', 'Delete Pos', '2022-02-10 07:41:55', '2022-02-10 07:41:55');

INSERT INTO `product_transation` (`id`, `product_id`, `invoices_number`, `qty`, `sub_total`, `price`, `created_at`, `updated_at`) VALUES
(1, 5, 'INV-000001', 1, NULL, NULL, '2022-01-19 02:48:15', '2022-01-19 02:48:15');
INSERT INTO `product_transation` (`id`, `product_id`, `invoices_number`, `qty`, `sub_total`, `price`, `created_at`, `updated_at`) VALUES
(2, 4, 'INV-000001', 3, NULL, NULL, '2022-01-19 02:48:15', '2022-01-19 02:48:15');
INSERT INTO `product_transation` (`id`, `product_id`, `invoices_number`, `qty`, `sub_total`, `price`, `created_at`, `updated_at`) VALUES
(3, 4, 'INV-000002', 1, NULL, NULL, '2022-01-19 04:12:20', '2022-01-19 04:12:20');
INSERT INTO `product_transation` (`id`, `product_id`, `invoices_number`, `qty`, `sub_total`, `price`, `created_at`, `updated_at`) VALUES
(4, 4, 'INV-000003', 1, NULL, NULL, '2022-01-19 04:13:52', '2022-01-19 04:13:52'),
(5, 4, 'INV-000004', 1, NULL, NULL, '2022-01-19 04:15:51', '2022-01-19 04:15:51'),
(6, 4, 'INV-000005', 1, NULL, NULL, '2022-01-19 04:16:12', '2022-01-19 04:16:12'),
(7, 4, 'INV-000006', 1, NULL, NULL, '2022-01-19 04:28:38', '2022-01-19 04:28:38'),
(8, 4, 'INV-000007', 1, NULL, NULL, '2022-01-19 04:29:05', '2022-01-19 04:29:05'),
(9, 4, 'INV-000008', 1, NULL, NULL, '2022-01-19 04:30:04', '2022-01-19 04:30:04'),
(10, 4, 'INV-000009', 1, NULL, NULL, '2022-01-19 04:30:54', '2022-01-19 04:30:54'),
(11, 4, 'INV-000010', 1, NULL, NULL, '2022-01-19 04:31:25', '2022-01-19 04:31:25'),
(12, 4, 'INV-000011', 1, NULL, NULL, '2022-01-19 04:34:57', '2022-01-19 04:34:57'),
(13, 4, 'INV-000013', 1, NULL, NULL, '2022-01-19 04:36:59', '2022-01-19 04:36:59'),
(14, 4, 'INV-000014', 1, NULL, NULL, '2022-01-19 04:37:51', '2022-01-19 04:37:51'),
(15, 5, 'INV-000015', 1, NULL, NULL, '2022-01-19 04:48:19', '2022-01-19 04:48:19'),
(16, 4, 'INV-000015', 2, NULL, NULL, '2022-01-19 04:48:19', '2022-01-19 04:48:19'),
(17, 4, 'INV-000016', 1, NULL, NULL, '2022-01-19 04:49:04', '2022-01-19 04:49:04'),
(18, 5, 'INV-000016', 1, NULL, NULL, '2022-01-19 04:49:04', '2022-01-19 04:49:04'),
(19, 4, 'INV-000017', 1, NULL, NULL, '2022-01-19 04:52:16', '2022-01-19 04:52:16'),
(20, 4, 'INV-000018', 1, NULL, NULL, '2022-01-19 04:53:00', '2022-01-19 04:53:00'),
(21, 4, 'INV-000020', 1, NULL, NULL, '2022-01-19 04:53:37', '2022-01-19 04:53:37'),
(22, 5, 'INV-000020', 1, NULL, NULL, '2022-01-19 04:53:37', '2022-01-19 04:53:37'),
(23, 4, 'INV-000021', 1, NULL, NULL, '2022-01-19 04:57:28', '2022-01-19 04:57:28'),
(24, 4, 'INV-000022', 1, NULL, NULL, '2022-01-19 05:03:20', '2022-01-19 05:03:20'),
(25, 4, 'INV-000025', 1, NULL, NULL, '2022-01-19 05:04:11', '2022-01-19 05:04:11'),
(26, 4, 'INV-000026', 1, NULL, NULL, '2022-01-19 05:07:59', '2022-01-19 05:07:59'),
(27, 5, 'INV-000026', 1, NULL, NULL, '2022-01-19 05:07:59', '2022-01-19 05:07:59'),
(28, 130, 'INV-000027', 1, 51000, 51000, '2022-01-20 02:11:13', '2022-01-20 02:11:13'),
(29, 131, 'INV-000027', 2, 136000, 68000, '2022-01-20 02:11:13', '2022-01-20 02:11:13'),
(30, 88, 'INV-000028', 3, 30000, 10000, '2022-01-20 04:48:15', '2022-01-20 04:48:15'),
(31, 74, 'INV-000029', 1, 35000, 35000, '2022-01-20 04:58:36', '2022-01-20 04:58:36'),
(32, 88, 'INV-000029', 2, 20000, 10000, '2022-01-20 04:58:36', '2022-01-20 04:58:36'),
(33, 109, 'INV-000030', 1, 275000, 275000, '2022-01-20 05:05:13', '2022-01-20 05:05:13'),
(34, 109, 'INV-000031', 2, 550000, 275000, '2022-01-27 05:06:20', '2022-01-27 05:06:20'),
(35, 129, 'INV-000032', 3, 102000, 34000, '2022-01-27 05:09:41', '2022-01-27 05:09:41'),
(36, 109, 'INV-000033', 1, 275000, 275000, '2022-02-09 03:57:09', '2022-02-09 03:57:09'),
(37, 75, 'INV-000033', 1, 350000, 350000, '2022-02-09 04:19:06', '2022-02-09 04:19:06'),
(38, 74, 'INV-000034', 1, 35000, 35000, '2022-02-10 08:01:58', '2022-02-10 08:01:58'),
(39, 88, 'INV-000034', 1, 10000, 10000, '2022-02-10 08:01:58', '2022-02-10 08:01:58'),
(40, 88, 'INV-000035', 1, 10000, 10000, '2022-02-21 04:19:23', '2022-02-21 04:19:23'),
(41, 74, 'INV-000035', 1, 35000, 35000, '2022-02-21 04:19:23', '2022-02-21 04:19:23');

INSERT INTO `products` (`id`, `name`, `price`, `image`, `qty`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(62, 'Flexy 280 grm - Glossy', 18000, 'uploads/images/1642643092photo4.jpg', 10000, NULL, 1, NULL, '2022-02-22 02:33:22');
INSERT INTO `products` (`id`, `name`, `price`, `image`, `qty`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(63, 'Flexy 300 grm - Doff', 20000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL);
INSERT INTO `products` (`id`, `name`, `price`, `image`, `qty`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(64, 'Flexy 280 grm - Cetak Kilat', 25000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL);
INSERT INTO `products` (`id`, `name`, `price`, `image`, `qty`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(65, 'Flexy 280 grm + Desain ', 25000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(66, 'Flexy 260 grm + Desain ', 24000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(67, 'Flexy 320 grm + Desain ', 29000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(68, 'Flexy 240 grm + Desain ', 23700, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(69, 'X Banner - flexy 280 grm', 60000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(70, 'X Banner - flexy 300 grm', 85000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(71, 'Roll Banner - flexy 280 grm', 225000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(72, 'Roll Banner - flexy 300 grm', 250000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(73, 'Roll Banner - photopaper', 300000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(74, 'Banner Cloth / kain Sintetis', 35000, 'uploads/images/1642643092photo4.jpg', 9997, '', 1, NULL, '2022-02-21 04:19:23'),
(75, 'Print Canvas', 350000, 'uploads/images/1642643092photo4.jpg', 9999, '', 1, NULL, '2022-02-09 04:19:06'),
(76, 'Print Satin umbul umbul', 70000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(77, 'Print Stiker Vinyl Putih', 75000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(78, 'Paper Bag - Satuan', 20000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(79, 'Jasa Finishing umbul2', 10000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(80, 'Jasa Editing', 10000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(81, 'Stiker Bontak', 6000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(82, 'Stiker Vinyl Putih', 10000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(83, 'Stiker Vinyl Transparan', 10000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(84, 'Stiker One Way Vision', 70000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(85, 'AP 150 grm - 1 Sisi', 5000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(86, 'AP 150 grm - 2 Sisi', 8000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(87, 'AP 260 grm - 1 Sisi', 6000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(88, 'AP 260 grm - 2 Sisi', 10000, 'uploads/images/1642643092photo4.jpg', 9993, '', 1, NULL, '2022-02-21 04:19:23'),
(89, 'Pin 4,4 mm', 6000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(90, 'Pin 5,8 mm', 8000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(91, 'Gantungan Kunci Pin', 10000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(92, 'Mug ', 20000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(93, 'Mug + Pembungkus', 25000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(94, 'Buku Yasin 1 warna', 5000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(95, 'Buku Yasin 1 warna + laminasi', 6000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(96, 'Buku Yasin 2 warna', 8000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(97, 'Buku Yasin 2 warna + laminasi', 9000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(98, 'Buku Yasin 2 warna + Hardcover', 15000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(99, 'Sertifikat Linen A4', 5000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(100, 'Jasa Laminasi Doff / Glossy', 3000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(101, 'Jasa Hard Cover', 35000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(102, 'Jasa Soft Cover', 15000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(103, 'Jasa Lem Binding', 5000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(104, 'MAP 360 Grm - 2 sisi laminasi - Hotprint', 8500, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(105, 'MAP 360 Grm - 1 sisi laminasi - Hotprint', 7800, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(106, 'MAP 360 Grm - 1 sisi laminasi', 7300, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(107, 'MAP 280 Grm - 1 sisi laminasi - Hotprint', 7500, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(108, 'MAP 280 Grm - 1 sisi laminasi', 7000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(109, 'Blanko SK + Hotprint + Emboss - Rim', 275000, 'uploads/images/1642643092photo4.jpg', 9996, '', 1, NULL, '2022-02-09 03:57:09'),
(110, 'Buku Saku ', 5000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(111, 'MAP KODIM - SATUAN', 20000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(112, 'MAP POLRES', 7000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(113, 'Majalah SMA', 11000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(114, 'Kaos Sablon Cotton Combed - Panjang', 68000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(115, 'Kaos Sablon Cotton Combed - Pendek', 58000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(116, 'Kaos Krah Cotton Combed - Panjang', 75000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(117, 'Kaos Krah Cotton Combed - Pendek', 65000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(118, 'Kaos Krah Lacoste Bordir - Panjang', 98000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(119, 'Kaos Krah Lacoste Bordir - Pendek', 88000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(120, 'Kaos Jersey Full Printing Pdk- Satuan', 150000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(121, 'Kaos Jersey Full Printing Pjg- Satuan', 125000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(122, 'Nambah Panjang Baju', 10000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(123, 'Rompi Bordir', 125000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(124, 'Sablon Kaos', 5000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(125, 'Sablon Plastik', 500, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(126, 'Sablon Kertas', 500, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(127, 'Tas Kain Sponbon', 6000, 'uploads/images/1642643092photo4.jpg', 10000, '', 1, NULL, NULL),
(128, 'Flexy 280 grm - Doff  1x1', 17000, 'uploads/images/1642643092photo4.jpg', 10000, NULL, 1, NULL, '2022-01-20 01:55:28'),
(129, 'Flexy 280 grm - Doff  1x2', 34000, 'uploads/images/1642643092photo4.jpg', 9997, NULL, 1, NULL, '2022-01-27 05:09:41'),
(130, 'Flexy 280 grm - Doff  1x3', 51000, 'uploads/images/1642643092photo4.jpg', 9999, NULL, 1, NULL, '2022-01-20 02:11:13'),
(131, 'Flexy 280 grm - Doff  1x4', 68000, 'uploads/images/1642643092photo4.jpg', 9998, NULL, 1, NULL, '2022-01-20 02:11:13');

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\User');
INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(2, 3, 'App\\User');


INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Superadmin', 'Superadmin', '2022-02-10 07:41:55', '2022-02-10 07:41:55');
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'kasir', 'Kasir', 'Kasir', '2022-02-10 07:41:55', '2022-02-10 07:41:55');


INSERT INTO `transcations` (`invoices_number`, `user_id`, `pay`, `discount`, `sub_total`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES
('INV-000027', 1, 200000, NULL, 0, 187000, '2022-01-20 02:11:13', '2022-01-20 02:11:13', 0);
INSERT INTO `transcations` (`invoices_number`, `user_id`, `pay`, `discount`, `sub_total`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES
('INV-000028', 1, 30000, -2000, 0, 28000, '2022-01-20 04:48:15', '2022-01-20 04:48:15', 0);
INSERT INTO `transcations` (`invoices_number`, `user_id`, `pay`, `discount`, `sub_total`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES
('INV-000029', 1, 55000, -3000, 55000, 52000, '2022-01-20 04:58:36', '2022-01-20 04:58:36', 0);
INSERT INTO `transcations` (`invoices_number`, `user_id`, `pay`, `discount`, `sub_total`, `total`, `created_at`, `updated_at`, `customer_id`) VALUES
('INV-000030', 1, 225000, -50000, 275000, 225000, '2022-01-20 05:05:13', '2022-01-20 05:05:13', 0),
('INV-000031', 1, 500000, -50000, 550000, 500000, '2022-01-27 05:06:20', '2022-01-27 05:06:20', 0),
('INV-000032', 1, 100000, -2000, 102000, 100000, '2022-01-27 05:09:41', '2022-01-27 05:09:41', 0),
('INV-000033', 1, 540000, 0, 350000, 350000, '2022-02-15 00:00:00', '2022-02-21 04:17:10', 3),
('INV-000034', 2, 45000, 0, 45000, 45000, '2022-02-10 08:01:58', '2022-02-10 08:01:58', 2),
('INV-000035', 3, 40000, -5000, 45000, 40000, '2022-02-21 04:19:23', '2022-02-21 04:19:23', 3);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'superadmin@app.com', NULL, '$2y$10$g2Ul.iZvjkEAz9rLOKQ8s.rNAtzFy.K/KjClLygmLkp5A9YKmMjGa', NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'kasir', 'kasir@app.com', NULL, '$2y$10$np6MaVX1DZeupmRCDNkPMeXRtoaMqEVYFXoXY7jO/Atq0AhpmtDeC', NULL, '2022-02-11 07:50:39', '2022-02-11 07:50:39');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;