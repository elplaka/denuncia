-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: buzon
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `denuncias`
--

DROP TABLE IF EXISTS `denuncias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denuncias` (
  `folio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_denunciante` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_denunciante` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domicilio_denunciante` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad_denunciante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_denunciante` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_denunciado` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cve_dependencia` int(10) unsigned NOT NULL,
  `cargo_denunciado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hechos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hechos` date DEFAULT NULL,
  `lugar_hechos` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pruebas` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archivo_pruebas` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`folio`),
  KEY `foreign_key_dependencias` (`cve_dependencia`),
  CONSTRAINT `foreign_key_dependencias` FOREIGN KEY (`cve_dependencia`) REFERENCES `dependencias` (`cve_dependencia`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncias`
--

LOCK TABLES `denuncias` WRITE;
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
INSERT INTO `denuncias` VALUES (34,'COSME FULANITO ROSAS','6941257368','CALLE PRINCIPAL','LA GUASIMA','elplaka@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 15:18:51','2023-05-06 15:18:51'),(35,'COSME FULANITO ROSAS','6941257368','CALLE PRINCIPAL','LA GUASIMA','elplaka@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','1683383324rd.PDF','1','2023-05-06 15:28:44','2023-05-06 15:28:44'),(36,'COSME FULANITO ROSAS','6941257368','CALLE PRINCIPAL','LA GUASIMA','elplaka@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','1683383588HA.pdf','1','2023-05-06 15:33:09','2023-05-06 15:33:09'),(37,'-','6941257368','CALLE PRINCIPAL','LA GUASIMA','elplaka@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 19:10:06','2023-05-06 19:10:06'),(38,'-','----------','-','LA GUASIMA','anonimo@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 19:18:02','2023-05-06 19:18:02'),(39,'-','----------','-','LA GUASIMA','anonimo@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 19:18:45','2023-05-06 19:18:45'),(40,'-','----------','-','-','anonimo@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 19:19:14','2023-05-06 19:19:14'),(41,'-','----------','-','-','anonimo@concordia.gob.mx','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 19:19:58','2023-05-06 19:19:58'),(42,'COSME FULANITO ROSAS','6941257368','CALLE PRINCIPAL','LA GUASIMA','elplaka@hotmail.com','EL DE OBRAS PÚBLICAS',5,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA FGDF  DFGFD GF DFG DFGFDGFDG DFGDFGFDGDFGF','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 23:06:28','2023-05-06 23:06:28'),(43,'COSME FULANITO ROSAS','6941257368','CALLE PRINCIPAL','LA GUASIMA','elplaka@hotmail.com','EL DE OBRAS PÚBLICAS',0,'DIRECTOR','EL SUSODICHO TRAÍA LA CAMIONETA TACOMA DE OBRAS PÚBLICAS EL SÁBADO EN LA NOCHE COMO A LAS 12 Y SE PARÓ EN EL MALECÓN A ECHARSE UNAS CERVEZAS','2023-04-22','EN EL MALECÓN DE CONCORDIA','TENGO UNAS IMÁGENES QUE PRUEBAN LO QUE ESTOY AFIRMANDO AQUÍ','N/A','1','2023-05-06 23:10:55','2023-05-06 23:10:55');
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencias`
--

DROP TABLE IF EXISTS `dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencias` (
  `cve_dependencia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dependencia` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cve_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencias`
--

LOCK TABLES `dependencias` WRITE;
/*!40000 ALTER TABLE `dependencias` DISABLE KEYS */;
INSERT INTO `dependencias` VALUES (0,'NINGUNA','2022-05-05 19:23:32','2022-05-05 19:23:32'),(1,'CENTRO DE ARTES Y OFICIOS','2022-04-14 17:02:34','2022-04-14 17:02:34'),(2,'DESARROLLO SOCIAL','2022-04-14 17:02:50','2022-04-14 17:02:50'),(3,'DEPORTES','2022-04-14 17:03:03','2022-04-14 17:03:03'),(4,'PRESIDENCIA','2022-04-14 17:03:15','2022-04-14 17:03:15'),(5,'OBRAS PÚBLICAS','2022-04-14 17:03:26','2022-04-14 17:03:26'),(6,'SERVICIOS PÚBLICOS','2022-04-14 17:01:52','2022-04-14 17:01:52'),(7,'SEGURIDAD PÚBLICA','2022-04-26 01:17:09','2022-04-26 01:17:09'),(8,'SECRETARÍA DEL AYUNTAMIENTO','2022-04-26 01:16:11','2022-04-26 01:16:11'),(9,'OFICIALÍA MAYOR','2022-04-26 01:17:53','2022-04-26 01:17:53'),(10,'DESARROLLO RURAL','2022-04-26 01:18:29','2022-04-26 01:18:29'),(11,'TRANSPARENCIA Y ACCESO A LA INF.','2022-04-26 01:19:06','2022-04-26 01:19:06'),(12,'ECOLOGÍA','2022-04-26 01:20:16','2022-04-26 01:20:16'),(13,'EDUCACIÓN','2022-04-26 01:21:06','2022-04-26 01:21:06'),(14,'COMMUJER','2022-04-26 01:21:29','2022-04-26 01:21:29'),(15,'SÍNDICO PROCURADOR','2022-04-26 01:22:29','2022-04-26 01:22:29'),(16,'ÓRGANO INTERNO DE CONTROL','2022-04-26 01:22:44','2022-04-26 01:22:44'),(17,'TESORERÍA','2022-04-26 01:23:09','2022-04-26 01:23:09'),(18,'ARCHIVO Y CRÓNICA','2022-04-26 01:24:09','2022-04-26 01:24:09'),(19,'DESARROLLO ECONÓMICO','2022-04-26 01:24:54','2022-04-26 01:24:54'),(20,'REGIDORES','2022-04-26 01:25:54','2022-04-26 01:25:54'),(21,'COMUNICACIÓN SOCIAL','2022-04-26 01:26:19','2022-04-26 01:26:19'),(22,'TURISMO','2022-04-26 01:27:32','2022-04-26 01:27:32'),(23,'RECURSOS HUMANOS','2022-04-26 01:28:28','2022-04-26 01:28:28'),(24,'JUVENTUD','2022-04-26 01:29:33','2022-04-26 01:29:33'),(25,'TECNOLOGÍAS DE LA INFORMACIÓN','2022-04-26 01:29:47','2022-04-26 01:29:47'),(27,'JUMAPAC','2022-05-05 19:24:41','2022-05-05 19:24:41');
/*!40000 ALTER TABLE `dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_05_04_141130_create_denuncias_table',1),(6,'2022_05_04_151843_agrega_localidad_denuncias',2),(7,'2022_05_04_221400_create_dependencias_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ángel','asd@gmail.com',NULL,'$2y$10$A7B/tM33TYDQarfWyahgrOhxsrrUnZMkBSXSuHUjidS6UUoS6Fyo6',1,NULL,'2022-05-05 06:46:34','2022-05-05 19:31:08'),(2,'Emmanuel','emmanuel@concordia.gob.mx',NULL,'$2y$10$B8V2EOxFbPLsqu1WysM2NO2nn6MFkj9bYzFIztHra8216l7yykgRq',0,NULL,'2022-05-05 07:43:44','2022-05-05 07:44:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-06 16:16:24
