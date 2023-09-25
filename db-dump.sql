-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: test_task_app
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_09_15_164351_create_users_details_table',2),(8,'2023_09_15_164753_create_sectors_table',3),(9,'2023_09_15_165107_create_users_sectors_table',3),(10,'2023_09_19_150058_modify_sectors_add_unique_constraint',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sector_id` bigint unsigned NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `tree_path` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sectors_sector_id_unique` (`sector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (11,1,'Manufacturing',0,'.0.1.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(12,19,'Construction materials',1,'.0.1.19.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(13,18,'Electronics and Optics',1,'.0.1.18.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(14,6,'Food and Beverage',1,'.0.1.6.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(15,342,'Bakery & confectionery products',6,'.0.1.6.342.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(16,43,'Beverages',6,'.0.1.6.43.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(17,42,'Fish & fish products',6,'.0.1.6.42.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(18,40,'Meat & meat products',6,'.0.1.6.40.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(19,39,'Milk & dairy products',6,'.0.1.6.39.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(20,437,'Other',6,'.0.1.6.437.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(21,378,'Sweets & snack food',6,'.0.1.6.378.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(22,13,'Furniture',1,'.0.1.13.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(23,389,'Bathroom/sauna',13,'.0.1.13.389.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(24,385,'Bedroom',13,'.0.1.13.385.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(25,390,'Children\'s room',13,'.0.1.13.390.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(26,98,'Kitchen',13,'.0.1.13.98.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(27,101,'Living room',13,'.0.1.13.101.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(28,392,'Office',13,'.0.1.13.392.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(29,394,'Other (Furniture)',13,'.0.1.13.394.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(30,341,'Outdoor',13,'.0.1.13.341.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(31,99,'Project furniture',13,'.0.1.13.99.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(32,12,'Machinery',1,'.0.1.12.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(33,94,'Machinery components',12,'.0.1.12.94.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(34,91,'Machinery equipment/tools',12,'.0.1.12.91.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(35,224,'Manufacture of machinery',12,'.0.1.12.224.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(36,97,'Maritime',12,'.0.1.12.97.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(37,271,'Aluminium and steel workboats',97,'.0.1.12.97.271.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(38,269,'Boat/Yacht building',97,'.0.1.12.97.269.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(39,230,'Ship repair and conversion',97,'.0.1.12.97.230.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(40,93,'Metal structures',12,'.0.1.12.93.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(41,508,'Other',12,'.0.1.12.508.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(42,227,'Repair and maintenance service',12,'.0.1.12.227.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(43,11,'Metalworking',1,'.0.1.11.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(44,67,'Construction of metal structures',11,'.0.1.11.67.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(45,263,'Houses and buildings',11,'.0.1.11.263.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(46,267,'Metal products',11,'.0.1.11.267.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(47,542,'Metal works',11,'.0.1.11.542.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(48,75,'CNC-machining',542,'.0.1.11.542.75.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(49,62,'Forgings, Fasteners',542,'.0.1.11.542.62.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(50,69,'Gas, Plasma, Laser cutting',542,'.0.1.11.542.69.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(51,66,'MIG, TIG, Aluminum welding',542,'.0.1.11.542.66.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(52,9,'Plastic and Rubber',1,'.0.1.9.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(53,54,'Packaging',9,'.0.1.9.54.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(54,556,'Plastic goods',9,'.0.1.9.556.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(55,559,'Plastic processing technology',9,'.0.1.9.559.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(56,55,'Blowing',559,'.0.1.9.559.55.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(57,57,'Moulding',559,'.0.1.9.559.57.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(58,53,'Plastics welding and processing',559,'.0.1.9.559.53.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(59,560,'Plastic profiles',9,'.0.1.9.560.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(60,5,'Printing',1,'.0.1.5.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(61,148,'Advertising',5,'.0.1.5.148.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(62,150,'Book/Periodicals printing',5,'.0.1.5.150.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(63,145,'Labelling and packaging printing',5,'.0.1.5.145.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(64,7,'Textile and Clothing',1,'.0.1.7.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(65,44,'Clothing',7,'.0.1.7.44.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(66,45,'Textile',7,'.0.1.7.45.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(67,8,'Wood',1,'.0.1.8.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(68,337,'Other (Wood)',8,'.0.1.8.337.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(69,51,'Wooden building materials',8,'.0.1.8.51.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(70,47,'Wooden houses',8,'.0.1.8.47.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(71,3,'Other',0,'.0.3.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(72,37,'Creative industries',3,'.0.3.37.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(73,29,'Energy technology',3,'.0.3.29.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(74,33,'Environment',3,'.0.3.33.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(75,2,'Service',0,'.0.2.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(76,25,'Business services',2,'.0.2.25.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(77,35,'Engineering',2,'.0.2.35.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(78,28,'Information Technology and Telecommunications',2,'.0.2.28.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(79,581,'Data processing, Web portals, E-marketing',28,'.0.2.28.581.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(80,576,'Programming, Consultancy',28,'.0.2.28.576.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(81,121,'Software, Hardware',28,'.0.2.28.121.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(82,122,'Telecommunications',28,'.0.2.28.122.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(83,22,'Tourism',2,'.0.2.22.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(84,141,'Translation services',2,'.0.2.141.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(85,21,'Transport and Logistics',2,'.0.2.21.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(86,111,'Air',21,'.0.2.21.111.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(87,114,'Rail',21,'.0.2.21.114.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(88,112,'Road',21,'.0.2.21.112.','2023-09-19 15:19:40','2023-09-19 15:19:40'),(89,113,'Water',21,'.0.2.21.113.','2023-09-19 15:19:40','2023-09-19 15:19:40');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_details`
--

DROP TABLE IF EXISTS `users_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agree_to_terms` tinyint(1) NOT NULL DEFAULT '0',
  `user_session_id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_details`
--

LOCK TABLES `users_details` WRITE;
/*!40000 ALTER TABLE `users_details` DISABLE KEYS */;
INSERT INTO `users_details` VALUES (15,'triin',1,'PAkmh3oeMpT3jVjInNw99mFPnWsvcH8yEM29A9Im','2023-09-23 17:43:56','2023-09-23 17:43:56'),(16,'Liisa',1,'7JPj9Y8SsSRZgjp9NscO5med3DvoK4zeXbYfWzI6','2023-09-23 21:06:11','2023-09-23 21:12:01'),(17,'Toomas',1,'eIrcyMfZgGQXsAMX3zJ3jrqB2VFOGSkRfqAG60XU','2023-09-23 22:24:25','2023-09-23 22:24:25'),(18,'test',1,'NKqqrx7J0p9Zn6evECVNLtC61V1qRSyvxY7mjoqX','2023-09-23 22:35:55','2023-09-23 22:54:38'),(19,'Sophie',1,'nhjB3YKqTrcOMoxCSzgLzi4cGUf4iwHKQ59zc0jE','2023-09-24 10:45:04','2023-09-24 14:15:45'),(20,'Mati Mati',1,'0uBotopFd2DC6NFZxueouI3iXsqmxUvWzSTUfH1M','2023-09-24 14:22:43','2023-09-24 14:22:43');
/*!40000 ALTER TABLE `users_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_sectors`
--

DROP TABLE IF EXISTS `users_sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_sectors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `sector_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_sectors`
--

LOCK TABLES `users_sectors` WRITE;
/*!40000 ALTER TABLE `users_sectors` DISABLE KEYS */;
INSERT INTO `users_sectors` VALUES (21,15,40,'2023-09-23 17:43:56','2023-09-23 17:43:56'),(22,15,29,'2023-09-23 17:43:56','2023-09-23 17:43:56'),(28,16,378,'2023-09-23 21:12:26','2023-09-23 21:12:26'),(29,16,91,'2023-09-23 21:12:26','2023-09-23 21:12:26'),(30,16,263,'2023-09-23 21:12:26','2023-09-23 21:12:26'),(33,17,19,'2023-09-23 22:24:41','2023-09-23 22:24:41'),(34,17,18,'2023-09-23 22:24:41','2023-09-23 22:24:41'),(35,17,6,'2023-09-23 22:24:41','2023-09-23 22:24:41'),(38,18,1,'2023-09-23 22:54:38','2023-09-23 22:54:38'),(39,18,19,'2023-09-23 22:54:38','2023-09-23 22:54:38'),(92,19,1,'2023-09-24 14:15:45','2023-09-24 14:15:45'),(93,19,19,'2023-09-24 14:15:45','2023-09-24 14:15:45'),(103,20,1,'2023-09-24 14:43:15','2023-09-24 14:43:15'),(104,20,19,'2023-09-24 14:43:15','2023-09-24 14:43:15'),(105,20,18,'2023-09-24 14:43:15','2023-09-24 14:43:15'),(106,20,342,'2023-09-24 14:43:15','2023-09-24 14:43:15'),(107,20,33,'2023-09-24 14:43:15','2023-09-24 14:43:15');
/*!40000 ALTER TABLE `users_sectors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25 17:09:36
