-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.42 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table laravel_foodblog.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel_foodblog.categories: ~11 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `icon`, `created_at`, `updated_at`) VALUES
	(1, 'Breakfast', 'categories/breakfast.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(2, 'Lunch', 'categories/lunch.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(3, 'Dinner', 'categories/dessert.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(4, 'Dessert', 'categories/chocolate.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(5, 'Appetizer', 'categories/dessert.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(6, 'Soup', 'categories/lunch.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(7, 'Salad', 'categories/meat.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(8, 'Chocolate', 'categories/chocolate.png', '2025-06-23 10:44:37', '2025-06-24 07:55:13'),
	(9, 'Vegetarian', 'categories/vegan.png', '2025-06-23 10:44:37', '2025-06-23 10:44:37'),
	(10, 'Meat', 'categories/meat.png', '2025-06-23 10:44:37', '2025-06-24 07:55:25');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
