-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: alivianate
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
-- Table structure for table `apoyos_asignados`
--

DROP TABLE IF EXISTS `apoyos_asignados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apoyos_asignados` (
  `id_remesa` int(10) unsigned NOT NULL,
  `id_ciclo` int(11) NOT NULL,
  `id_estudiante` bigint(20) unsigned NOT NULL,
  `monto` bigint(20) NOT NULL,
  `entregado` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `apoyos_asignados_pk` (`id_remesa`,`id_ciclo`,`id_estudiante`),
  KEY `apoyos_asignados_id_ciclo_foreign` (`id_ciclo`),
  KEY `apoyos_asignados_id_estudiante_foreign` (`id_estudiante`),
  CONSTRAINT `apoyos_asignados_id_ciclo_foreign` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apoyos_asignados_id_estudiante_foreign` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apoyos_asignados_id_remesa_foreign` FOREIGN KEY (`id_remesa`) REFERENCES `boletos_remesas` (`id_remesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apoyos_asignados`
--

LOCK TABLES `apoyos_asignados` WRITE;
/*!40000 ALTER TABLE `apoyos_asignados` DISABLE KEYS */;
INSERT INTO `apoyos_asignados` VALUES (6,2223,8,600,0,'2023-02-20 17:10:02','2023-02-20 17:10:02');
/*!40000 ALTER TABLE `apoyos_asignados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apoyos_montos`
--

DROP TABLE IF EXISTS `apoyos_montos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apoyos_montos` (
  `id_remesa` int(10) unsigned NOT NULL,
  `id_ciclo` int(11) NOT NULL,
  `cve_ciudad_escuela` int(10) unsigned NOT NULL,
  `cve_escuela` int(10) unsigned NOT NULL,
  `monto` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `apoyos_montos_pk` (`id_remesa`,`id_ciclo`,`cve_ciudad_escuela`,`cve_escuela`),
  KEY `apoyos_montos_id_ciclo_foreign` (`id_ciclo`),
  KEY `apoyos_montos_cve_ciudad_escuela_foreign` (`cve_ciudad_escuela`),
  KEY `apoyos_montos_cve_escuela_foreign` (`cve_escuela`),
  CONSTRAINT `apoyos_montos_cve_ciudad_escuela_foreign` FOREIGN KEY (`cve_ciudad_escuela`) REFERENCES `ciudades` (`cve_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apoyos_montos_cve_escuela_foreign` FOREIGN KEY (`cve_escuela`) REFERENCES `escuelas` (`cve_escuela`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apoyos_montos_id_ciclo_foreign` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apoyos_montos_id_remesa_foreign` FOREIGN KEY (`id_remesa`) REFERENCES `boletos_remesas` (`id_remesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apoyos_montos`
--

LOCK TABLES `apoyos_montos` WRITE;
/*!40000 ALTER TABLE `apoyos_montos` DISABLE KEYS */;
INSERT INTO `apoyos_montos` VALUES (3,2223,1,1,649,'2022-12-02 00:13:26','2022-12-02 00:33:37'),(3,2223,1,3,640,'2022-12-02 00:13:26','2022-12-02 00:13:26'),(3,2223,1,4,640,'2022-12-02 00:13:26','2022-12-02 00:13:26'),(6,2223,1,1,300,'2022-12-19 21:07:22','2022-12-19 21:07:22'),(6,2223,1,3,300,'2022-12-19 21:07:22','2022-12-19 21:07:22'),(6,2223,1,4,300,'2022-12-19 21:07:22','2022-12-19 21:07:22'),(6,2223,2,1,400,'2022-12-19 21:38:34','2022-12-19 21:38:34');
/*!40000 ALTER TABLE `apoyos_montos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletos_asignados`
--

DROP TABLE IF EXISTS `boletos_asignados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boletos_asignados` (
  `id_remesa` int(10) unsigned NOT NULL,
  `id_paquete` int(10) unsigned NOT NULL,
  `id_ciclo` int(11) NOT NULL,
  `id_estudiante` bigint(20) unsigned NOT NULL,
  `folio_inicial` bigint(20) NOT NULL,
  `folio_final` bigint(20) NOT NULL,
  `entregados` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `boletos_asignados_pk` (`id_remesa`,`id_paquete`,`id_ciclo`,`id_estudiante`),
  KEY `boletos_asignados_id_ciclo_foreign` (`id_ciclo`),
  KEY `boletos_asignados_id_paquete_foreign` (`id_paquete`),
  KEY `boletos_asignados_id_estudiante_foreign` (`id_estudiante`),
  CONSTRAINT `boletos_asignados_id_ciclo_foreign` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boletos_asignados_id_estudiante_foreign` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boletos_asignados_id_paquete_foreign` FOREIGN KEY (`id_paquete`) REFERENCES `boletos_paquetes` (`id_paquete`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boletos_asignados_id_remesa_foreign` FOREIGN KEY (`id_remesa`) REFERENCES `boletos_remesas` (`id_remesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletos_asignados`
--

LOCK TABLES `boletos_asignados` WRITE;
/*!40000 ALTER TABLE `boletos_asignados` DISABLE KEYS */;
INSERT INTO `boletos_asignados` VALUES (3,5,2223,1,4907,4922,0,'2022-11-29 00:36:25','2022-11-29 00:36:25'),(3,5,2223,2,4939,4954,0,'2022-11-29 00:36:25','2022-11-29 00:36:25'),(3,5,2223,5,4859,4874,0,'2022-11-29 00:36:25','2022-11-29 00:36:25'),(3,5,2223,6,4923,4938,0,'2022-11-29 00:36:25','2022-11-29 00:36:25'),(3,5,2223,10,4891,4906,0,'2022-11-29 00:36:25','2022-11-29 00:36:25'),(3,5,2223,12,4875,4890,0,'2022-11-29 00:36:25','2022-11-29 00:36:25');
/*!40000 ALTER TABLE `boletos_asignados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletos_paquetes`
--

DROP TABLE IF EXISTS `boletos_paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boletos_paquetes` (
  `id_paquete` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_ciclo` int(11) NOT NULL,
  `folio_inicial` bigint(20) NOT NULL,
  `folio_final` bigint(20) NOT NULL,
  `ult_folio_asignado` int(11) NOT NULL,
  `folios_disponibles` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `boletos_paquetes_id_paquete_id_ciclo_unique` (`id_paquete`,`id_ciclo`),
  KEY `boletos_paquetes_id_ciclo_foreign` (`id_ciclo`),
  CONSTRAINT `boletos_paquetes_id_ciclo_foreign` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletos_paquetes`
--

LOCK TABLES `boletos_paquetes` WRITE;
/*!40000 ALTER TABLE `boletos_paquetes` DISABLE KEYS */;
INSERT INTO `boletos_paquetes` VALUES (1,2223,1,10,10,0,'2022-11-11 23:35:22','2022-11-19 02:00:47'),(2,2223,1001,3000,3000,0,'2022-11-12 00:46:50','2022-11-23 17:57:44'),(4,2223,3001,3500,3500,0,'2022-11-12 14:19:45','2022-11-23 18:01:35'),(5,2223,3501,5000,4954,46,'2022-11-14 17:04:08','2022-11-29 00:36:25'),(6,2223,5001,9000,9000,0,'2022-11-14 17:09:40','2022-11-18 18:48:19'),(7,2223,3490,3500,3500,0,'2022-11-24 18:08:30','2022-11-24 20:55:25'),(8,2223,3501,3504,3504,0,'2022-11-24 18:08:30','2022-11-24 20:55:25'),(9,2223,3000,3000,3000,0,'2022-11-24 21:14:56','2022-11-24 21:15:36'),(10,2223,3001,3014,3014,0,'2022-11-24 21:14:56','2022-11-24 21:15:36');
/*!40000 ALTER TABLE `boletos_paquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletos_remesas`
--

DROP TABLE IF EXISTS `boletos_remesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boletos_remesas` (
  `id_remesa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_ciclo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_apoyos` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realizada` tinyint(1) NOT NULL DEFAULT 0,
  `con_tantos` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `boletos_remesas_id_remesa_id_ciclo_unique` (`id_remesa`,`id_ciclo`),
  KEY `boletos_remesas_id_ciclo_foreign` (`id_ciclo`),
  CONSTRAINT `boletos_remesas_id_ciclo_foreign` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletos_remesas`
--

LOCK TABLES `boletos_remesas` WRITE;
/*!40000 ALTER TABLE `boletos_remesas` DISABLE KEYS */;
INSERT INTO `boletos_remesas` VALUES (3,2223,'2022-12-03','DIC. 2022','NOVIEMBRE 2022',1,1,'2022-11-22 18:47:39','2023-02-10 17:37:37'),(6,2223,'2022-12-23','DIC. 2022 PT. 2',NULL,0,0,'2022-12-19 21:06:45','2023-02-07 20:20:46');
/*!40000 ALTER TABLE `boletos_remesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletos_tantos`
--

DROP TABLE IF EXISTS `boletos_tantos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boletos_tantos` (
  `id_remesa` int(10) unsigned NOT NULL,
  `id_ciclo` int(11) NOT NULL,
  `cve_escuela` int(10) unsigned NOT NULL,
  `cantidad_folios` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `boletos_tantos_id_remesa_id_ciclo_cve_escuela_unique` (`id_remesa`,`id_ciclo`,`cve_escuela`),
  KEY `boletos_tantos_id_ciclo_foreign` (`id_ciclo`),
  KEY `boletos_tantos_cve_escuela_foreign` (`cve_escuela`),
  CONSTRAINT `boletos_tantos_cve_escuela_foreign` FOREIGN KEY (`cve_escuela`) REFERENCES `escuelas` (`cve_escuela`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boletos_tantos_id_ciclo_foreign` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boletos_tantos_id_remesa_foreign` FOREIGN KEY (`id_remesa`) REFERENCES `boletos_remesas` (`id_remesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletos_tantos`
--

LOCK TABLES `boletos_tantos` WRITE;
/*!40000 ALTER TABLE `boletos_tantos` DISABLE KEYS */;
INSERT INTO `boletos_tantos` VALUES (3,2223,1,16,'2022-11-25 20:06:01','2022-11-25 20:06:01'),(3,2223,3,16,'2022-11-25 20:06:01','2022-11-25 20:06:01'),(3,2223,4,16,'2022-11-25 20:06:02','2022-11-25 20:06:02'),(3,2223,5,16,'2022-11-25 20:06:01','2022-11-25 20:06:01');
/*!40000 ALTER TABLE `boletos_tantos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclos`
--

DROP TABLE IF EXISTS `ciclos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclos` (
  `id_ciclo` int(11) NOT NULL,
  `descripcion` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ciclo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclos`
--

LOCK TABLES `ciclos` WRITE;
/*!40000 ALTER TABLE `ciclos` DISABLE KEYS */;
INSERT INTO `ciclos` VALUES (2223,'2022-2023'),(2324,'2023-2024');
/*!40000 ALTER TABLE `ciclos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `cve_ciudad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cve_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'MAZATLÁN'),(2,'CULIACÁN');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_socioeconomicos`
--

DROP TABLE IF EXISTS `datos_socioeconomicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_socioeconomicos` (
  `id_estudiante` int(11) NOT NULL,
  `cve_techo_vivienda` int(10) unsigned NOT NULL,
  `cuartos_vivienda` int(11) NOT NULL,
  `personas_vivienda` int(11) NOT NULL,
  `cve_monto_mensual` int(10) unsigned NOT NULL,
  `beca_estudios` tinyint(1) NOT NULL,
  `apoyo_gobierno` tinyint(1) NOT NULL,
  `empleo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'NO',
  `gasto_transporte` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `datos_socioeconomicos_cve_techo_vivienda_foreign` (`cve_techo_vivienda`),
  KEY `datos_socioeconomicos_cve_monto_mensual_foreign` (`cve_monto_mensual`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_socioeconomicos`
--

LOCK TABLES `datos_socioeconomicos` WRITE;
/*!40000 ALTER TABLE `datos_socioeconomicos` DISABLE KEYS */;
INSERT INTO `datos_socioeconomicos` VALUES (1,1,3,6,1,0,0,'',80.00,'2022-07-25 11:58:07','2022-07-25 11:58:07',NULL),(2,1,6,6,1,0,0,'AYUDANTE DE COCINA',100.00,'2022-07-25 12:36:57','2022-07-25 12:36:57',NULL),(3,1,3,6,1,0,0,'',200.00,'2022-07-25 16:21:18','2022-07-25 16:21:18',NULL),(4,1,1,4,1,0,0,'',120.00,'2022-07-25 16:33:19','2022-07-25 16:33:19',NULL),(5,3,3,6,1,0,0,'',120.00,'2022-07-25 16:45:52','2022-07-25 16:45:52',NULL),(6,1,4,3,1,1,0,'',100.00,'2022-07-25 17:44:37','2022-07-25 17:44:37',NULL),(7,1,4,9,2,0,0,'NIÑERA',75.00,'2022-07-25 18:03:47','2022-07-25 18:03:47',NULL),(8,1,4,5,1,0,0,'',250.00,'2022-07-25 19:25:31','2022-07-25 19:25:31',NULL),(9,1,4,3,1,0,0,'',90.00,'2022-07-25 19:50:01','2022-07-25 19:50:01',NULL),(10,4,2,6,1,0,0,'',100.00,'2022-07-25 20:15:45','2022-07-25 20:15:45',NULL),(11,1,2,5,1,0,0,'REPARTIENDO',200.00,'2022-07-25 20:50:45','2022-07-25 20:50:45',NULL),(12,1,1,4,1,0,0,'REPARTIDOR',100.00,'2022-07-25 20:52:26','2022-07-25 20:52:26',NULL),(13,4,2,5,1,0,0,'',80.00,'2022-07-25 21:29:53','2022-07-25 21:29:53',NULL),(14,1,4,4,2,0,0,'',30.00,'2022-07-25 21:41:48','2022-07-25 21:41:48',NULL),(15,1,2,3,1,1,0,'',100.00,'2022-07-25 21:57:29','2022-07-25 21:57:29',NULL),(16,1,3,5,1,0,0,'',100.00,'2022-07-25 21:57:51','2022-07-25 21:57:51',NULL),(17,1,3,4,1,0,0,'',100.00,'2022-07-25 22:05:58','2022-07-25 22:05:58',NULL),(18,3,2,3,1,0,0,'',100.00,'2022-07-25 22:10:22','2022-07-25 22:10:22',NULL),(19,1,4,4,1,0,0,'',100.00,'2022-07-25 22:17:46','2022-07-25 22:17:46',NULL),(20,1,4,5,2,0,0,'',350.00,'2022-07-25 23:20:25','2022-07-25 23:20:25',NULL),(21,1,2,4,1,0,0,'',200.00,'2022-07-25 23:25:33','2022-07-25 23:25:33',NULL),(22,1,1,5,1,0,0,'',100.00,'2022-07-25 23:55:23','2022-07-25 23:55:23',NULL),(23,1,5,5,1,0,0,'AUXILIAR ADMINISTRATIVO',100.00,'2022-07-26 01:38:09','2022-07-26 01:38:09',NULL),(24,1,2,2,2,0,0,'',100.00,'2022-07-26 01:47:47','2022-07-26 01:47:47',NULL),(25,1,3,3,1,0,0,'',100.00,'2022-07-26 02:24:32','2022-07-26 02:24:32',NULL),(26,1,3,5,1,0,0,'',70.00,'2022-07-26 04:47:07','2022-07-26 04:47:07',NULL),(27,1,3,3,3,0,0,'CARPINTERÍA',100.00,'2022-07-26 05:13:01','2022-07-26 05:13:01',NULL),(28,1,3,5,2,0,0,'',100.00,'2022-07-26 05:25:59','2022-07-26 05:25:59',NULL),(29,1,1,5,1,0,0,'',100.00,'2022-07-26 16:08:33','2022-07-26 16:08:33',NULL),(30,1,2,4,1,0,0,'',100.00,'2022-07-26 17:13:19','2022-07-26 17:13:19',NULL),(31,1,3,2,1,0,0,'',90.00,'2022-07-26 17:31:51','2022-07-26 17:31:51',NULL),(32,1,4,5,2,0,0,'',90.00,'2022-07-26 17:57:02','2022-07-26 17:57:02',NULL),(33,1,4,4,3,0,0,'ASADOR EN LOS TACOS',500.00,'2022-07-26 18:22:19','2022-07-26 18:22:19',NULL),(34,4,1,4,1,0,0,'',80.00,'2022-07-26 18:36:54','2022-07-26 18:36:54',NULL),(35,3,2,6,1,0,0,'',120.00,'2022-07-26 18:51:41','2022-07-26 18:51:41',NULL),(36,1,1,4,1,0,0,'',100.00,'2022-07-26 19:44:52','2022-07-26 19:44:52',NULL),(37,1,2,3,1,0,0,'',130.00,'2022-07-26 20:46:00','2022-07-26 20:46:00',NULL),(38,3,3,6,1,0,0,'',95.00,'2022-07-26 21:04:30','2022-07-26 21:04:30',NULL),(39,1,2,7,2,0,0,'',150.00,'2022-07-26 21:10:09','2022-07-26 21:10:09',NULL),(40,3,1,3,1,0,0,'',80.00,'2022-07-26 21:19:15','2022-07-26 21:19:15',NULL),(41,1,2,7,3,0,0,'',150.00,'2022-07-26 21:38:41','2022-07-26 21:38:41',NULL),(42,1,1,1,1,0,0,'PELUQUERO',80.00,'2022-07-26 22:17:58','2022-07-26 22:17:58',NULL),(43,1,3,4,1,0,0,'',100.00,'2022-07-26 22:19:37','2022-07-26 22:19:37',NULL),(44,1,3,4,1,0,0,'',100.00,'2022-07-26 23:16:13','2022-07-26 23:16:13',NULL),(45,1,3,2,1,0,0,'',100.00,'2022-07-26 23:50:41','2022-07-26 23:50:41',NULL),(46,1,8,6,3,0,0,'',130.00,'2022-07-27 02:02:26','2022-07-27 02:02:26',NULL),(47,3,3,5,1,0,0,'',200.00,'2022-07-27 14:36:25','2022-07-27 14:36:25',NULL),(48,1,2,6,1,0,0,'',100.00,'2022-07-27 17:48:21','2022-07-27 17:48:21',NULL),(49,1,2,4,3,0,0,'',80.00,'2022-07-27 18:14:59','2022-07-27 18:14:59',NULL),(50,4,2,5,1,0,0,'',100.00,'2022-07-27 18:18:34','2022-07-27 18:18:34',NULL),(51,1,4,5,2,1,0,'',400.00,'2022-07-27 18:39:30','2022-07-27 18:39:30',NULL),(52,1,3,3,1,0,0,'',150.00,'2022-07-27 19:13:35','2022-07-27 19:13:35',NULL),(53,1,3,5,1,0,0,'',100.00,'2022-07-27 19:23:41','2022-07-27 19:23:41',NULL),(54,1,3,4,1,0,0,'',100.00,'2022-07-27 20:34:32','2022-07-27 20:34:32',NULL),(55,1,4,9,3,0,0,'',100.00,'2022-07-27 20:58:42','2022-07-27 20:58:42',NULL),(56,1,3,4,1,0,0,'',100.00,'2022-07-27 21:40:44','2022-07-27 21:40:44',NULL),(57,1,2,4,3,0,0,'',80.00,'2022-07-27 21:45:49','2022-07-27 21:45:49',NULL),(58,1,4,3,1,0,0,'',150.00,'2022-07-27 22:52:47','2022-07-27 22:52:47',NULL),(59,1,3,5,1,0,0,'',100.00,'2022-07-28 01:07:36','2022-07-28 01:07:36',NULL),(60,4,5,5,1,0,0,'',100.00,'2022-07-28 03:27:57','2022-07-28 03:27:57',NULL),(61,1,4,7,1,0,1,'',100.00,'2022-07-28 04:04:50','2022-07-28 04:04:50',NULL),(62,1,6,5,3,0,0,'',80.00,'2022-07-28 05:17:07','2022-07-28 05:17:07',NULL),(63,1,3,7,1,0,0,'',100.00,'2022-07-28 17:44:09','2022-07-28 17:44:09',NULL),(64,1,3,5,3,0,0,'',90.00,'2022-07-28 18:57:13','2022-07-28 18:57:13',NULL),(65,1,4,5,1,0,0,'',200.00,'2022-07-28 19:08:09','2022-07-28 19:08:09',NULL),(66,1,3,5,3,0,0,'',90.00,'2022-07-28 19:11:23','2022-07-28 19:11:23',NULL),(67,1,1,5,1,0,0,'',125.00,'2022-07-28 19:27:37','2022-07-28 19:27:37',NULL),(68,1,5,4,5,0,0,'',380.00,'2022-07-28 19:39:58','2022-07-28 19:39:58',NULL),(69,1,2,4,3,0,0,'',1000.00,'2022-07-28 21:43:41','2022-07-28 21:43:41',NULL),(70,1,6,6,1,0,0,'',50.00,'2022-07-28 21:43:56','2022-07-28 21:43:56',NULL),(71,1,4,5,4,0,0,'',120.00,'2022-07-28 22:00:40','2022-07-28 22:00:40',NULL),(72,1,3,7,1,0,0,'',80.00,'2022-07-28 23:59:42','2022-07-28 23:59:42',NULL),(73,1,5,5,2,0,0,'MESERA',400.00,'2022-07-29 18:09:50','2022-07-29 18:09:50',NULL),(74,1,3,4,2,0,0,'',80.00,'2022-07-29 18:21:59','2022-07-29 18:21:59',NULL),(75,1,4,5,2,0,0,'',100.00,'2022-07-29 19:31:13','2022-07-29 19:31:13',NULL),(76,1,2,5,1,0,0,'',500.00,'2022-07-29 19:44:34','2022-07-29 19:44:34',NULL),(77,1,4,4,1,0,0,'',100.00,'2022-07-29 19:52:07','2022-07-29 19:52:07',NULL),(78,1,3,3,1,0,0,'',100.00,'2022-07-29 21:06:56','2022-07-29 21:06:56',NULL),(79,3,3,3,1,0,0,'',150.00,'2022-07-29 23:02:26','2022-07-29 23:02:26',NULL),(80,1,2,5,1,0,0,'',200.00,'2022-07-30 00:07:27','2022-07-30 00:07:27',NULL),(81,1,2,5,2,0,0,'',200.00,'2022-07-30 01:23:32','2022-07-30 01:23:32',NULL),(82,1,3,5,2,1,0,'',50.00,'2022-07-31 01:03:10','2022-07-31 01:03:10',NULL),(83,1,4,5,1,0,0,'',80.00,'2022-07-31 01:35:06','2022-07-31 01:35:06',NULL),(84,1,3,5,1,0,0,'',130.00,'2022-07-31 05:13:20','2022-07-31 05:13:20',NULL),(85,1,3,4,1,0,0,'',80.00,'2022-08-01 01:17:34','2022-08-01 01:17:34',NULL),(86,4,1,4,1,0,0,'',400.00,'2022-08-01 17:34:20','2022-08-01 17:34:20',NULL),(87,1,3,7,2,0,0,'MESERO',100.00,'2022-08-01 18:10:59','2022-08-01 18:10:59',NULL),(88,1,3,5,2,0,0,'',120.00,'2022-08-01 18:35:17','2022-08-01 18:35:17',NULL),(89,1,4,4,2,0,0,'',130.00,'2022-08-01 18:58:02','2022-08-01 18:58:02',NULL),(90,1,3,6,1,0,0,'',90.00,'2022-08-01 21:16:40','2022-08-01 21:16:40',NULL),(91,3,1,5,1,0,0,'',500.00,'2022-08-02 00:45:27','2022-08-02 00:45:27',NULL),(92,1,5,4,2,0,0,'',100.00,'2022-08-02 02:53:31','2022-08-02 02:53:31',NULL),(93,1,3,4,1,0,0,'',120.00,'2022-08-02 03:02:55','2022-08-02 03:02:55',NULL),(94,1,3,6,1,0,0,'SOY MESERA',150.00,'2022-08-02 04:04:07','2022-08-02 04:04:07',NULL),(95,4,1,4,1,0,0,'',80.00,'2022-08-02 04:46:17','2022-08-02 04:46:17',NULL),(96,4,3,3,1,0,0,'',90.00,'2022-08-02 16:00:39','2022-08-02 16:00:39',NULL),(97,1,2,3,1,0,0,'',100.00,'2022-08-02 17:24:11','2022-08-02 17:24:11',NULL),(98,1,3,2,1,0,0,'',95.00,'2022-08-02 17:26:05','2022-08-02 17:26:05',NULL),(99,4,5,8,1,0,0,'',200.00,'2022-08-02 18:00:59','2022-08-02 18:00:59',NULL),(100,1,5,4,2,0,0,'',100.00,'2022-08-02 21:47:57','2022-08-02 21:47:57',NULL),(101,4,2,3,1,0,0,'AYUDANTE DE CARPINTERO',100.00,'2022-08-02 21:53:27','2022-08-02 21:53:27',NULL),(102,1,2,6,1,0,0,'',80.00,'2022-08-02 22:21:05','2022-08-02 22:21:05',NULL),(103,1,4,6,1,0,0,'SUSHERO',80.00,'2022-08-02 22:49:52','2022-08-02 22:49:52',NULL),(104,1,1,5,1,0,0,'',150.00,'2022-08-02 23:09:16','2022-08-02 23:09:16',NULL),(105,3,2,8,1,0,0,'',150.00,'2022-08-03 00:25:06','2022-08-03 00:25:06',NULL),(106,1,4,4,2,0,0,'',120.00,'2022-08-03 00:51:21','2022-08-03 00:51:21',NULL),(107,1,3,4,1,0,0,'',150.00,'2022-08-03 17:06:15','2022-08-03 17:06:15',NULL);
/*!40000 ALTER TABLE `datos_socioeconomicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuelas`
--

DROP TABLE IF EXISTS `escuelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escuelas` (
  `cve_escuela` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `escuela` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `escuela_abreviatura` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cve_escuela`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuelas`
--

LOCK TABLES `escuelas` WRITE;
/*!40000 ALTER TABLE `escuelas` DISABLE KEYS */;
INSERT INTO `escuelas` VALUES (1,'UNIVERSIDAD AUTÓNOMA DE SINALOA','UAS'),(2,'UNIVERSIDAD AUTÓNOMA DE OCCIDENTE','UAdeO'),(3,'UNIVERSIDAD POLITÉCNICA DE SINALOA','UPSIN'),(4,'INSTITUTO TECNOLÓGICO DE MAZATLÁN','ITMAZ'),(5,'UNIVERSIDAD PEDAGÓGICA DEL ESTADO DE SINALOA','UPES'),(6,'ESC. NORMAL EXP. DE EL FUERTE EXT. MAZ.','ENEF'),(7,'UNIVERSIDAD AUTÓNOMA DE DURANGO','UAD'),(8,'ESCUELA SUPERIOR DE LAS BELLAS ARTES CHAYITO GARZÓN','ESBA'),(9,'ISIMA UNIVERSIDAD','ISIMA'),(10,'INSTITUTO TECNOLÓGICO SUPERIOR DE SINALOA','ITESUS'),(11,'UNIVERSIDAD DEL PACÍFICO NORTE','UNIP'),(12,'CENTRO DE ACTUALIZACIÓN DEL MAGISTERIO','CAM'),(13,'CENTRO UNIVERSITARIO MAZATLÁN','CUM'),(14,'ESCUELA NÁUTICA MERCANTE CAP. ALT. ANTONIO GÓMEZ MAQUEO','NÁUTICA'),(15,'INSTITUTO TECNOLÓGICO DE LA CONSTRUCCIÓN','ITCONST'),(16,'UNIVERSIDAD TECMILENIO','TECMILENIO'),(17,'ESCUELA NORMAL DEL PACÍFICO','ENP'),(18,'UNIVERSIDAD TECNOLÓGICA DE CULIACÁN','UTC'),(19,'UNIVERSIDAD UNIVER','UNIVER'),(20,'ESCUELA LIBRE DE DERECHO DE SINALOA','LIBRE DERECHO'),(21,'ESCUELA NORMAL DE SINALOA','ENS'),(22,'ESCUELA NORMAL DE ESPECIALIZACIÓN DEL ESTADO DE SINALOA','ENEES'),(23,'INSTITUTO ESTATAL DE CIENCIAS PENALES Y SEGURIDAD PÚBLICA','INECIPE'),(24,'UNIVERSIDAD DEL DESARROLLO PROFESIONAL','UNIDEP'),(25,'INSTITUTO TECNOLÓGICO DE CULIACÁN','TEC CULIACÁN'),(26,'UNIVERSIDAD CASA BLANCA','CASA BLANCA'),(999,'OTRA','OTRA');
/*!40000 ALTER TABLE `escuelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_ciclo` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primer_apellido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `segundo_apellido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `curp` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfc` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `celular` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cve_localidad_origen` int(10) unsigned NOT NULL,
  `cve_localidad_actual` int(10) unsigned NOT NULL,
  `cve_ciudad_escuela` int(10) unsigned NOT NULL,
  `cve_escuela` int(10) unsigned NOT NULL,
  `cve_turno_escuela` int(10) unsigned NOT NULL,
  `carrera` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ano_escolar` int(11) NOT NULL,
  `promedio` double(8,2) NOT NULL,
  `img_curp` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_acta_nac` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_comprobante_dom` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_identificacion` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_kardex` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_constancia` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `id_hex` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cve_status` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudiantes_cve_localidad_origen_foreign` (`cve_localidad_origen`),
  KEY `estudiantes_cve_localidad_actual_foreign` (`cve_localidad_actual`),
  KEY `estudiantes_cve_escuela_foreign` (`cve_escuela`),
  KEY `estudiantes_cve_ciudad_escuela_foreign` (`cve_ciudad_escuela`),
  KEY `estudiantes_cve_turno_escuela_foreign` (`cve_turno_escuela`),
  KEY `estudiantes_id_hex_index` (`id_hex`),
  KEY `estudiantes_cve_status_foreign` (`cve_status`),
  KEY `estudiantes_id_ciclo_foreign` (`id_ciclo`),
  CONSTRAINT `estudiantes_id_ciclo_foreign` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclos` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,2223,'LUIS ANGEL','MANCINAS','RUEDA','MARL021123HSLNDSA6','MARL021123','2002-11-23','6691493065','elplaka@hotmail.com',1,1,1,1,1,'ING. CIVIL',3,8.80,'CU_MARL021123.pdf','AC_MARL021123.pdf','CO_MARL021123.pdf','ID_MARL021123.pdf','KX_MARL021123.pdf','CN_MARL021123.PDF','181d25a3749',6,'2022-07-25 11:58:07','2023-02-03 20:04:09'),(2,2223,'CARLOS ALBERTO','MANCINAS','RUEDA','MARC031115HSLNDRA3','MARC031115','2003-11-15','6941158314','elplaka@hotmail.com',1,1,1,1,1,'LIC. ARQUITECTURA',1,8.00,'CU_MARC031115.pdf','AC_MARC031115.pdf','CO_MARC031115.pdf','ID_MARC031115.pdf','KX_MARC031115.pdf','CN_MARC031115.PDF','181d27dbbbf',7,'2022-07-25 12:36:57','2023-02-03 20:09:47'),(3,2223,'DIEGO RAFAEL','ROJO','IBARRA','ROID010125HSLJBGA7','ROID010125','2001-01-25','6941167269','elplaka@hotmail.com',16,16,1,3,1,'ING. TECNOLOGÍA AMBIENTAL',3,8.10,'CU_ROID010125.pdf','AC_ROID010125.pdf','CO_ROID010125.pdf','ID_ROID010125.pdf','KX_ROID010125.pdf','PENDIENTE','181d34aed32',6,'2022-07-25 16:21:18','2022-11-15 15:44:08'),(4,2223,'AYLIN','GARCIA','LIZARRAGA','GALA041205MSLRZYA1','GALA041205','2004-12-05','6941195079','elplaka@hotmail.com',1,3,1,1,2,'LIC. ENFERMERÍA',1,9.50,'CU_GALA041205.pdf','AC_GALA041205.pdf','CO_GALA041205.pdf','ID_GALA041205.pdf','KX_GALA041205.pdf','PENDIENTE','181d355eac9',4,'2022-07-25 16:33:19','2022-11-24 21:19:43'),(5,2223,'ADAN','ARCE','GANDAR','AEGA030704HSLRNDA8','AEGA030704','2003-07-04','6691983380','elplaka@hotmail.com',1,16,1,3,1,'ING. MECATRONICA',1,8.00,'CU_AEGA030704.pdf','AC_AEGA030704.pdf','CO_AEGA030704.pdf','ID_AEGA030704.pdf','KX_AEGA030704.pdf','PENDIENTE','181d3616540',7,'2022-07-25 16:45:52','2022-11-30 00:06:29'),(6,2223,'NANCY ABIGAIL','RODRIGUEZ','ONTIVEROS','ROON040122MSLDNNA4','ROON040122','2004-01-22','6731431154','elplaka@hotmail.com',1,1,1,1,1,'LIC. CONTADURIA PUBLICA',1,9.70,'CU_ROON040122.pdf','AC_ROON040122.pdf','CO_ROON040122.pdf','ID_ROON040122.pdf','KX_ROON040122.pdf','PENDIENTE','181d3972103',6,'2022-07-25 17:44:37','2022-11-15 15:44:01'),(7,2223,'RUMERI MONSERRAT','VALDEZ','CORONA','VACR000326MSLLRMA7','VACR000326','2000-03-26','6941179966','rumerivaldez6@gmail.com',3,1,2,1,1,'QUIMICO FARMACEUTICO BIOLOGO',5,9.40,'CU_VACR000326.pdf','AC_VACR000326.pdf','CO_VACR000326.pdf','ID_VACR000326.pdf','KX_VACR000326.pdf','PENDIENTE','181d3a8a8b5',2,'2022-07-25 18:03:47','2022-07-27 17:37:39'),(8,2223,'ITZEL','VIZCARRA','OSUNA','VIOI010701MSLZSTA8','VIOI010701','2001-07-01','6692465400','itzelvizcarra77@gmail.com',1,1,2,1,1,'ING. AGRONOMÍA',4,9.30,'CU_VIOI010701.pdf','AC_VIOI010701.pdf','CO_VIOI010701.pdf','ID_VIOI010701.pdf','ID_VIOI010701.pdf','PENDIENTE','181d3f369cd',6,'2022-07-25 19:25:31','2022-11-15 15:44:37'),(9,2223,'JOSE JORGE','TIRADO','VALDES','TIVJ041112HSLRLRA1','TIVJ041112','2004-11-12','6692695174','jorge.tirado722@gmail.com',4,4,1,3,1,'ING. EN ENERGÍA',1,8.70,'CU_TIVJ041112.pdf','AC_TIVJ041112.pdf','CO_TIVJ041112.pdf','ID_TIVJ041112.pdf','KX_TIVJ041112.pdf','PENDIENTE','181d409d23f',2,'2022-07-25 19:50:01','2022-07-27 17:44:10'),(10,2223,'CARMEN GUADALUPE','IBARRA','ELIZONDO','IAEC020316MSLBLRA1','IAEC020316','2002-03-16','6941381508','carmengpeibarraelizondo@gmail.com',1,16,1,5,2,'LIC. EN EDUCACIÓN',3,9.00,'CU_IAEC020316.pdf','AC_IAEC020316.pdf','CO_IAEC020316.pdf','ID_IAEC020316.pdf','KX_IAEC020316.PDF','CN_IAEC020316.PDF','181d4215b77',6,'2022-07-25 20:15:45','2022-11-19 17:45:06'),(11,2223,'JULIO CÉSAR','VIZCARRA','BERUMEN','VIBJ030917HSLZRLA6','VIBJ030917','2003-09-17','6949569291','vizcarrajuliocesar12@gmail.com',1,1,1,1,3,'ING. CIVIL',2,7.50,'CU_VIBJ030917.pdf','AC_VIBJ030917.PDF','CO_VIBJ030917.PDF','ID_VIBJ030917.PDF','ID_VIBJ030917.PDF','CN_VIBJ030917.PDF','181d4415e63',5,'2022-07-25 20:50:45','2022-08-09 16:52:47'),(12,2223,'JAVIER ERNESTO','FLORES','BRITO','FOBJ000908HSLLRVA5','FOBJ000908','2000-09-08','6691531844','jajajavier008@gmail.com',1,1,1,4,1,'ING. MECANICA',4,8.10,'CU_FOBJ000908.pdf','AC_FOBJ000908.pdf','CO_FOBJ000908.pdf','ID_FOBJ000908.pdf','ID_FOBJ000908.pdf','PENDIENTE','181d442e886',7,'2022-07-25 20:52:26','2022-11-30 00:06:41'),(13,2223,'BRAYAN ANTONIO','AMILLANO','CISNEROS','AICB981102HSLMSR01','AICB981102','1998-11-02','6691012751','amillanobrayan5@gmail.com',4,4,1,1,3,'LIC. CONTADURIA PUBLICA',5,9.00,'CU_AICB981102.pdf','AC_AICB981102.pdf','CO_AICB981102.pdf','ID_AICB981102.pdf','KX_AICB981102.pdf','PENDIENTE','181d4652917',2,'2022-07-25 21:29:53','2022-07-27 17:55:50'),(14,2223,'AMAIRANI LIZETH','RAYGOZA','ALCARAZ','RAAA041117MSLYLMA8','RAAA041117','2004-11-17','6691063134','raygozaamairani62@gmail.com',2,2,1,1,2,'LIC. ENFERMERÍA',1,8.20,'CU_RAAA041117.pdf','AC_RAAA041117.pdf','CO_RAAA041117.pdf','ID_RAAA041117.pdf','KX_RAAA041117.pdf','PENDIENTE','181d4700f44',2,'2022-07-25 21:41:48','2022-07-27 17:57:31'),(15,2223,'LEIDY NATALI','SANCHEZ','VELAZQUEZ','SAVL040613MSLNLDA3','SAVL040613','2004-06-13','6949518293','sanchezvelasquezleidynatali@gmail.com',1,1,1,1,1,'LIC. CONTADURIA PÚBLICA.',1,9.40,'CU_SAVL040613.pdf','AC_SAVL040613.pdf','CO_SAVL040613.pdf','ID_SAVL040613.pdf','KX_SAVL040613.pdf','PENDIENTE','181d47e675f',2,'2022-07-25 21:57:29','2022-07-27 17:59:09'),(16,2223,'YESENIA','RIOS','RODRIGUEZ','RIRY020209MSLSDSA9','RIRY020209','2002-02-09','6941187154','yesyrios0209@gmail.com',1,1,1,1,3,'LIC. DERECHO',3,8.00,'CU_RIRY020209.pdf','AC_RIRY020209.pdf','CO_RIRY020209.pdf','ID_RIRY020209.pdf','KX_RIRY020209.pdf','PENDIENTE','181d47ebd39',5,'2022-07-25 21:57:51','2022-07-27 18:30:50'),(17,2223,'CARLOS ALBERTO','BELTRAN','IBARGUEN','BEIC020412HSLLBRA0','BEIC020412','2002-04-12','6941104517','beltranibarguenc100@gmail.com',1,1,1,1,1,'ADMINISTRACION DE EMPRESAS',3,9.90,'CU_BEIC020412.pdf','AC_BEIC020412.pdf','CO_BEIC020412.pdf','ID_BEIC020412.pdf','KX_BEIC020412.pdf','PENDIENTE','181d48629aa',2,'2022-07-25 22:05:58','2022-07-27 18:01:41'),(18,2223,'EDIZAMA','ROSAS','LANGARICA','ROLE000511MSLSNDA0','ROLE000511','2000-05-11','8116994114','edizamarosas18@gmail.com',1,1,1,1,1,'LIC. BIOLOGÍA PESQUERA',5,7.70,'CU_ROLE000511.pdf','AC_ROLE000511.pdf','CO_ROLE000511.pdf','ID_ROLE000511.pdf','KX_ROLE000511.pdf','PENDIENTE','181d48a2fe2',2,'2022-07-25 22:10:22','2022-07-29 19:08:13'),(19,2223,'JOSE ROBERTO','SALAZAR','OSUNA','SAOR000927HBCLSBA7','SAOR000927','2000-09-27','6949566139','jose_osuna14@outlook.com',1,1,1,1,1,'LIC. EDUCACION FISICA',4,8.80,'CU_SAOR000927.pdf','AC_SAOR000927.pdf','CO_SAOR000927.pdf','ID_SAOR000927.pdf','KX_SAOR000927.pdf','PENDIENTE','181d490f486',2,'2022-07-25 22:17:46','2022-07-27 18:05:59'),(20,2223,'LUIS ENRIQUE','OSUNA','ARELLANO','OUAL030512HMNSRSA4','OUAL030512','2003-05-12','6692768483','kike.osuna012@gmail.com',1,1,1,1,1,'LIC. CONTADURIA PUBLICA',2,7.70,'CU_OUAL030512.pdf','AC_OUAL030512.pdf','CO_OUAL030512.pdf','ID_OUAL030512.pdf','KX_OUAL030512.pdf','PENDIENTE','181d4ca416f',2,'2022-07-25 23:20:25','2022-07-27 18:07:40'),(21,2223,'JOSUE MANUEL','REYES','ZATARAIN','REZJ040117HSLYTSA4','REZJ040117','2004-01-17','6692755595','jmrz5678@gmail.com',1,1,1,1,1,'LIC. MEDICINA GENERAL',1,10.00,'CU_REZJ040117.pdf','AC_REZJ040117.pdf','CO_REZJ040117.pdf','ID_REZJ040117.pdf','KX_REZJ040117.pdf','PENDIENTE','181d4cef35b',2,'2022-07-25 23:25:33','2022-07-27 18:10:25'),(22,2223,'CARMEN ROCIO','MENDEZ','VELARDE','MEVC010513MSLNLRA1','MEVC010513','2001-05-13','6941086991','rociomv667@gmail.com',1,1,1,1,1,'ING. CIVIL',3,9.20,'CU_MEVC010513.pdf','AC_MEVC010513.pdf','CO_MEVC010513.pdf','ID_MEVC010513.pdf','KX_MEVC010513.pdf','PENDIENTE','181d4ea3c8d',2,'2022-07-25 23:55:23','2022-07-27 18:11:30'),(23,2223,'JOAHN ENRIQUE','CASTRO','LIZARRAGA','CALJ990104HSLSZH08','CALJ990104','1999-01-04','6692720582','joahncastrolga@gmail.com',1,1,1,1,1,'LIC. DERECHO',1,9.80,'CU_CALJ990104.pdf','AC_CALJ990104.pdf','CO_CALJ990104.pdf','ID_CALJ990104.pdf','KX_CALJ990104.pdf','PENDIENTE','181d5483a67',2,'2022-07-26 01:38:09','2022-07-27 18:29:04'),(24,2223,'EVELYN YARETZI','LOPEZ','-','LOXE020629MSLPXVA3','LOXE020629','2002-06-29','6692674697','evelynyaretzi9@gmail.com',1,1,1,1,1,'LIC. TURISMO',3,9.70,'CU_LOXE020629.pdf','AC_LOXE020629.pdf','CO_LOXE020629.pdf','ID_LOXE020629.pdf','KX_LOXE020629.pdf','PENDIENTE','181d55109f5',2,'2022-07-26 01:47:47','2022-07-27 18:13:33'),(25,2223,'JOEL ALBERTO','SIMENTAL','BELTRAN','SIBJ040403HSLMLLA6','SIBJ040403','2004-04-03','6692359218','beltranjoel428@gmail.com',1,1,1,1,1,'LIC. ENFERMERÍA',1,9.40,'CU_SIBJ040403.pdf','AC_SIBJ040403.pdf','CO_SIBJ040403.pdf','ID_SIBJ040403.pdf','KX_SIBJ040403.pdf','PENDIENTE','181d572a6a0',2,'2022-07-26 02:24:32','2022-07-27 18:30:38'),(26,2223,'LIZBETH','SERNA','MEDRANO','SEML030530MSLRDZA4','SEML030530','2003-05-30','6693328442','lizbethsernamedrano@gmail.com',1,5,1,1,2,'LIC. DERECHO',2,8.50,'CU_SEML030530.pdf','AC_SEML030530.pdf','CO_SEML030530.pdf','ID_SEML030530.pdf','KX_SEML030530.pdf','PENDIENTE','181d5f50f2d',2,'2022-07-26 04:47:07','2022-07-27 18:16:48'),(27,2223,'JUAN PABLO','VALDEZ','NIEBLAS','VANJ040102HSLLBNA7','VANJ040102','2004-01-02','6949569437','judavaor632@gmail.com',3,3,1,3,1,'ING. MECATRÓNICA',1,9.90,'CU_VANJ040102.pdf','AC_VANJ040102.pdf','CO_VANJ040102.pdf','ID_VANJ040102.pdf','KX_VANJ040102.pdf','PENDIENTE','181d60cbf6b',2,'2022-07-26 05:13:01','2022-07-27 18:18:15'),(28,2223,'VALERIA GUADALUPE','LIZARRAGA','OSUNA','LIOV990914MSLZSL04','LIOV990914','1999-09-14','6692189465','valerializarraga113@gmail.com',1,1,1,1,2,'LIC. CONTADURÍA PÚBLICA',4,9.40,'CU_LIOV990914.pdf','AC_LIOV990914.pdf','CO_LIOV990914.pdf','ID_LIOV990914.pdf','KX_LIOV990914.pdf','PENDIENTE','181d6189b71',2,'2022-07-26 05:25:59','2022-07-27 18:19:10'),(29,2223,'EMILIANO','LOPEZ','OSUNA','LOOE041216HSLPSMA0','LOOE041216','2004-12-16','6691003334','emilianoosuna735@gmail.com',13,1,1,1,1,'LIC. INFORMÁTICA',1,9.80,'CU__MtAq7k01t.pdf','AC__MtAq7k01t.pdf','CO__MtAq7k01t.pdf','ID__MtAq7k01t.pdf','KX__MtAq7k01t.pdf','PENDIENTE','181d8644e67',2,'2022-07-26 16:08:33','2022-07-27 18:31:39'),(30,2223,'JULIANA','VALDEZ','AGUIAR','VAAJ010720MSLLGLA2','VAAJ010720','2001-07-20','6693281081','julivalagui197@gmail.com',1,3,1,1,2,'LIC. GASTRONOMÍA',4,9.50,'CU_VAAJ010720.pdf','AC_VAAJ010720.pdf','CO_VAAJ010720.pdf','ID_VAAJ010720.pdf','KX_VAAJ010720.pdf','PENDIENTE','181d89f8ae9',2,'2022-07-26 17:13:19','2022-07-27 18:32:31'),(31,2223,'EVELYN','JIMENEZ','ZAMUDIO','JIZE010920MSLMMVA5','JIZE010920','2001-09-20','6941643382','jimenezzamudioevelyn7@gmail.com',1,1,1,1,1,'ING. CIVIL',4,9.70,'CU_JIZE010920.pdf','AC_JIZE010920.pdf','CO_JIZE010920.pdf','ID_JIZE010920.pdf','KX_JIZE010920.pdf','PENDIENTE','181d8b07e51',2,'2022-07-26 17:31:51','2022-07-27 18:24:07'),(32,2223,'JESUS FABIAN','ORTEGA','MONTOYA','OEMJ021204HSLRNSA5','OEMJ021204','2002-12-04','6691887881','jesusfabianqw@gmail.com',1,1,1,1,1,'ING. CIVIL',3,7.60,'CU_OEMJ021204.pdf','AC_OEMJ021204.pdf','CO_OEMJ021204.pdf','ID_OEMJ021204.pdf','KX_OEMJ021204.pdf','PENDIENTE','181d8c786c2',2,'2022-07-26 17:57:02','2022-07-27 18:24:14'),(33,2223,'JESUS ARMANDO','RAMIREZ','OCHOA','RAOJ010903HSLMCSB0','RAOJ010903','2001-09-03','6691087133','jaro03090@gmail.com',1,1,1,1,1,'ING. CIVIL',4,9.40,'CU_RAOJ010903.pdf','AC_RAOJ010903.pdf','CO_RAOJ010903.pdf','ID_RAOJ010903.pdf','KX_RAOJ010903.pdf','PENDIENTE','181d8dea69d',2,'2022-07-26 18:22:19','2022-07-27 18:24:44'),(34,2223,'LUIS ANTONIO','VELARDE','ZATARAIN','VEZL030218HSLLTSA5','VEZL030218','2003-02-18','6941150885','luis.veza03@gmail.com',1,1,2,1,2,'ING. AGRONOMIA',2,9.50,'CU_VEZL030218.pdf','AC_VEZL030218.pdf','CO_VEZL030218.pdf','ID_VEZL030218.pdf','KX_VEZL030218.pdf','PENDIENTE','181d8ebfd2a',2,'2022-07-26 18:36:54','2022-07-27 18:26:09'),(35,2223,'AMERICA ABDIGAIL','AGUIAR','RIOS','AURA001114MSLGSMA9','AURA001114','2000-11-14','6692768947','abdigailrios@gmail.com',5,1,1,1,2,'LIC. ENFERMERIA',4,9.00,'CU_AURA001114.pdf','AC_AURA001114.pdf','CO_AURA001114.pdf','ID_AURA001114.pdf','KX_AURA001114.pdf','PENDIENTE','181d8f97ea4',5,'2022-07-26 18:51:41','2022-08-02 19:45:01'),(36,2223,'MARIO','OSUNA','LIZARRAGA','OULM991027HSLSZR01','OULM991027','1999-10-27','6941173763','mariolizarraga1999@gmail.com',1,1,1,1,1,'LIC. DERECHO',3,8.50,'CU_OULM991027.pdf','AC_OULM991027.pdf','CO_OULM991027.pdf','ID_OULM991027.pdf','KX_OULM991027.pdf','PENDIENTE','181d92a26ec',2,'2022-07-26 19:44:52','2022-07-27 18:28:42'),(37,2223,'MIRNA LUCERO','GONZÁLEZ','GARCÍA','GOGM961013MDGNRR04','GOGM961013','1996-10-13','6692291135','gonlucero972@gmail.com',9,1,1,1,1,'LIC. PSICOLOGÍA',1,8.40,'CU__42OQM9Bnl.pdf','AC__42OQM9Bnl.pdf','CO__42OQM9Bnl.pdf','ID__42OQM9Bnl.pdf','KX__42OQM9Bnl.pdf','PENDIENTE','181d96210b8',2,'2022-07-26 20:46:00','2022-07-27 18:34:10'),(38,2223,'KORELY','TIRADO','OSUNA','TIOK001101MSLRSRA7','TIOK001101','2000-11-01','6691494007','korelyt@gmail.com',3,3,1,5,1,'LIC. EN EDUCACIÓN',6,9.20,'CU__7WkvPGKqE.pdf','AC__7WkvPGKqE.pdf','CO__7WkvPGKqE.pdf','ID__7WkvPGKqE.pdf','KX__7WkvPGKqE.pdf','PENDIENTE','181d972fc52',2,'2022-07-26 21:04:30','2022-07-27 18:35:31'),(39,2223,'SILVIA ELIZABETH','DIAZ','NORIEGA','DINS030103MSLZRLA0','DINS030103','2003-01-03','6692282118','silvia.dino030103@gmail.com',1,1,1,1,2,'LIC. ENFERMERIA',2,8.70,'CU_DINS030103.pdf','AC_DINS030103.pdf','CO_DINS030103.pdf','ID_DINS030103.pdf','KX_DINS030103.pdf','PENDIENTE','181d9782737',2,'2022-07-26 21:10:09','2022-07-27 18:36:41'),(40,2223,'PAULINA','DELGADO','VELARDE','DEVP020411MSLLLLA0','DEVP020411','2002-04-11','6692272287','paulinadelgadovelarde@gmail.com',1,1,1,1,3,'LIC. COMERCIO INTERNACIONAL',5,8.00,'CU__JjmubJLBm.pdf','AC__JjmubJLBm.pdf','CO__JjmubJLBm.pdf','ID__JjmubJLBm.pdf','KX__JjmubJLBm.pdf','PENDIENTE','181d98079e5',2,'2022-07-26 21:19:15','2022-07-27 18:37:58'),(41,2223,'LILIAN MARIA','DIAZ','NORIEGA','DINL030103MSLZRLA0','DINL030103','2003-01-03','6692282190','lilian.dino0301@gmail.com',1,1,1,1,2,'LIC. ENFERMERIA',2,8.90,'CU_DINL030103.pdf','AC_DINL030103.pdf','CO_DINL030103.pdf','ID_DINL030103.pdf','KX_DINL030103.pdf','PENDIENTE','181d9924007',2,'2022-07-26 21:38:41','2022-07-27 18:38:21'),(42,2223,'JOSE LUIS','SILVA','REYES','SIRL650226HSLLYS07','SIRL650226','1965-02-26','6941100764','silvajoseluis953@gmail.com',1,1,1,1,1,'LIC. SOCIOLOGIA',3,9.70,'CU_SIRL650226.pdf','AC_SIRL650226.pdf','CO_SIRL650226.pdf','ID_SIRL650226.pdf','KX_SIRL650226.pdf','PENDIENTE','181d9b62dda',5,'2022-07-26 22:17:58','2022-07-29 18:20:56'),(43,2223,'DANIELA GUADALUPE','FLORES','CANIZALES','FOCD021217MSLLNNA4','FOCD021217','2002-12-17','6691170140','danielaflorescanizales@gmail.com',1,1,1,1,1,'LIC. MERCADOTECNIA',3,9.20,'CU__QgF3Xi7VQ.pdf','AC__QgF3Xi7VQ.pdf','CO__QgF3Xi7VQ.pdf','ID__QgF3Xi7VQ.pdf','KX__QgF3Xi7VQ.pdf','PENDIENTE','181d9b7b02f',2,'2022-07-26 22:19:37','2022-07-27 18:39:46'),(44,2223,'LINDSAY GUADALUPE','OCHOA','DIAZ','OODL001210MSLCZNA0','OODL001210','2000-12-10','6693309630','lindsay.ochoa16@gmail.com',1,1,1,1,1,'LIC. COMERCIO INTERNACIONAL',4,9.20,'CU_OODL001210.pdf','AC_OODL001210.pdf','CO_OODL001210.pdf','ID_OODL001210.pdf','KX_OODL001210.pdf','PENDIENTE','181d9eb748b',2,'2022-07-26 23:16:13','2022-07-27 18:40:42'),(45,2223,'ARCELIA','HERNANDEZ','PERAZA','HEPA991221MSLRRR03','HEPA991221','1999-12-21','6949512801','arceliahernandezperaza@gmail.com',1,1,1,1,1,'ING. CIVIL',5,9.30,'CU_HEPA991221.pdf','AC_HEPA991221.pdf','CO_HEPA991221.pdf','ID_HEPA991221.pdf','KX_HEPA991221.pdf','PENDIENTE','181da0afa97',2,'2022-07-26 23:50:41','2022-07-27 18:41:43'),(46,2223,'MARIA FERNANDA','NIEBLA','GARZON','NIGF040918MSLBRRA0','NIGF040918','2004-09-18','6941192368','fernanda.gzon@gmail.com',1,1,1,1,1,'LIC. MEDICINA GENERAL',1,9.60,'CU_NIGF040918.pdf','AC_NIGF040918.pdf','CO_NIGF040918.pdf','ID_NIGF040918.pdf','KX_NIGF040918.pdf','PENDIENTE','181da837a9e',2,'2022-07-27 02:02:26','2022-07-27 18:43:08'),(47,2223,'LUCIA ANAHÍ','RUEDA','AVILA','RUAL040926MSLDVCA5','RUAL040926','2004-09-26','6699941117','anahiruedaavila@gmail.com',12,12,1,3,1,'LIC. TERAPIA FÍSICA',1,9.40,'CU__hwViFekDP.pdf','AC__hwViFekDP.pdf','CO__hwViFekDP.pdf','ID__hwViFekDP.pdf','KX__hwViFekDP.pdf','PENDIENTE','181dd3514bf',2,'2022-07-27 14:36:25','2022-07-27 18:43:50'),(48,2223,'CARMEN DANIELA','PAEZ','MARTINEZ','PAMC011027MSLZRRA1','PAMC011027','2001-10-27','6941160068','carmendpaezm@gmail.com',15,15,1,1,2,'LIC. EN ENFERMERÍA',4,9.50,'CU_PAMC011027.pdf','AC_PAMC011027.pdf','CO_PAMC011027.pdf','ID_PAMC011027.pdf','KX_PAMC011027.pdf','PENDIENTE','181dde4a023',2,'2022-07-27 17:48:21','2022-07-27 18:44:43'),(49,2223,'VALERIA','MARTINEZ','LOPEZ','MALV040320MSLRPLA1','MALV040320','2004-03-20','6692513477','valeriaaa2025@gmail.com',1,1,1,1,1,'LIC. ENSEÑANZA DEL INGLÉS',1,10.00,'CU_MALV040320.pdf','AC_MALV040320.pdf','CO_MALV040320.pdf','ID_MALV040320.pdf','KX_MALV040320.pdf','PENDIENTE','181ddfcfc15',2,'2022-07-27 18:14:59','2022-07-27 18:46:12'),(50,2223,'PEDRO','TORRES','LIMÓN','TOLP020410HSLRMDA7','TOLP020410','2002-04-04','6692455618','pt257232@gmail.com',7,7,1,1,1,'ING. CIVIL',3,9.70,'CU__10vckHAxp.pdf','AC__10vckHAxp.pdf','CO__10vckHAxp.pdf','ID__10vckHAxp.pdf','KX__10vckHAxp.pdf','PENDIENTE','181de004316',2,'2022-07-27 18:18:34','2022-07-27 18:47:06'),(51,2223,'XIMENA GUADALUPE','LOPEZ','DIAZ','LODX040106MSLPZMA7','LODX040106','2004-01-06','6941166171','xigpelo6@gmail.com',1,1,2,21,2,'LIC. EDUCACIÓN PREESCOLAR',1,9.90,'CU_LODX040106.pdf','AC_LODX040106.pdf','CO_LODX040106.pdf','ID_LODX040106.pdf','KX_LODX040106.pdf','PENDIENTE','181de13686e',2,'2022-07-27 18:39:30','2022-07-27 18:48:33'),(52,2223,'JULIO CESAR','ZAMUDIO','DIAZ','ZADJ040929HSLMZLA5','ZADJ040929','2004-09-29','6699324832','juliozamudio222@gmail.com',1,1,1,1,1,'LIC. BIOLOGO ACUACULTOR',1,8.80,'CU_ZADJ040929.pdf','AC_ZADJ040929.pdf','CO_ZADJ040929.pdf','ID_ZADJ040929.pdf','KX_ZADJ040929.pdf','PENDIENTE','181de3294b9',2,'2022-07-27 19:13:35','2022-07-28 17:08:05'),(53,2223,'BRAYAN','BRITO','LIZARRAGA','BILB011207HSLRZRA2','BILB011207','2001-12-07','6941163029','brayanlga07@gmail.com',1,1,1,1,3,'LIC. DERECHO',3,6.70,'CU_BILB011207.pdf','AC_BILB011207.pdf','CO_BILB011207.pdf','ID_BILB011207.pdf','KX_BILB011207.pdf','PENDIENTE','181de3bd18b',5,'2022-07-27 19:23:41','2022-07-28 17:38:00'),(54,2223,'YULIANA DAYANARA','OCHOA','DIAZ','OODY041108MSLCZLA3','OODY041108','2004-11-08','6941101862','ochoadiazyuliana@gmail.com',1,1,1,1,1,'LIC. COMERCIO INTERNACIONAL',1,9.40,'CU_OODY041108.pdf','AC_OODY041108.pdf','CO_OODY041108.pdf','ID_OODY041108.pdf','KX_OODY041108.pdf','PENDIENTE','181de7c9e68',2,'2022-07-27 20:34:32','2022-07-28 17:32:42'),(55,2223,'GISELA BERENICE','VALLE','JARA','VAJG040514MSLLRSA8','VAJG040514','2004-05-14','6941193135','giselavalle273@gmail.com',24,1,1,1,1,'LIC. DERECHO',1,9.90,'CU_VAJG040514.pdf','AC_VAJG040514.pdf','CO_VAJG040514.pdf','ID_VAJG040514.pdf','KX_VAJG040514.pdf','PENDIENTE','181de92b8ce',2,'2022-07-27 20:58:42','2022-07-28 17:38:20'),(56,2223,'JESUS DAVID','TIRADO','RAMOS','TIRJ030822HSLRMSA6','TIRJ030822','2003-08-22','6941189115','tiradodavid049@gmail.com',1,1,1,1,1,'LIC.EDUCACIÓN FÍSICA Y DEPORTE',2,8.40,'CU_TIRJ030822.pdf','AC_TIRJ030822.pdf','CO_TIRJ030822.pdf','ID_TIRJ030822.pdf','KX_TIRJ030822.pdf','PENDIENTE','181deb92a84',2,'2022-07-27 21:40:44','2022-07-28 17:34:38'),(57,2223,'KARLA GUADALUPE','MARTINEZ','LOPEZ','MALK021227MSLRPRA2','MALK021227','2002-12-27','6692725637','karlitamtnz37@gmail.com',1,1,1,1,1,'LIC. DERECHO',3,9.40,'CU_MALK021227.pdf','AC_MALK021227.pdf','CO_MALK021227.pdf','ID_MALK021227.pdf','KX_MALK021227.pdf','PENDIENTE','181debdd0bb',2,'2022-07-27 21:45:49','2022-07-28 17:35:24'),(58,2223,'JESUS MIGUEL','CABANILLAS','LOPEZ','CALJ040327HSLBPSA4','CALJ040327','2004-03-27','6941196140','miguelcabanillaslopez23@gmail.com',1,1,1,1,1,'LIC. MEDICINA GENERAL',1,9.90,'CU_CALJ040327.pdf','AC_CALJ040327.pdf','CO_CALJ040327.pdf','ID_CALJ040327.pdf','KX_CALJ040327.pdf','PENDIENTE','181defb1059',2,'2022-07-27 22:52:47','2022-07-28 17:36:10'),(59,2223,'MARIANA KARIME','MONROY','MORAN','MOMM040306MSLNRRA2','MOMM040306','2004-03-06','6941100026','marianakarime@gmail.com',1,1,1,1,1,'LIC. NUTRICIÓN',1,9.90,'CU_MOMM040306.pdf','AC_MOMM040306.pdf','CO_MOMM040306.pdf','ID_MOMM040306.pdf','KX_MOMM040306.pdf','PENDIENTE','181df765e68',2,'2022-07-28 01:07:36','2022-07-28 17:38:43'),(60,2223,'MARIA GUADALUPE','SANCHEZ','TORRES','SATG010912MSLNRDA7','SATG010912','2001-09-12','6692664018','lupita.torres9393@gmail.com',7,7,1,1,1,'ADMINISTRACION DE EMPRESAS',4,9.80,'CU_SATG010912.pdf','AC_SATG010912.pdf','CO_SATG010912.pdf','ID_SATG010912.pdf','KX_SATG010912.pdf','PENDIENTE','181dff6bc0b',2,'2022-07-28 03:27:57','2022-07-28 17:39:32'),(61,2223,'KAREN KIMBERLY','PICOS','DE LA ROSA','PIRK020625MSLCSRA6','PIRK020625','2002-06-25','6691298227','picoskimberly156@gmail.com',1,1,1,1,2,'LIC. DERECHO',3,9.20,'CU_PIRK020625.pdf','AC_PIRK020625.pdf','CO_PIRK020625.pdf','ID_PIRK020625.pdf','KX_PIRK020625.pdf','PENDIENTE','181e01877ee',2,'2022-07-28 04:04:50','2022-07-28 17:40:13'),(62,2223,'DIANA LAURA','OSUNA','LOPEZ','OULD000330MSLSPNA6','OULD000330','2000-03-30','6699931167','dianaosunalopez.30@gmail.com',1,1,1,1,2,'LIC. CRIMINALÍSTICA',5,9.90,'CU_OULD000330.pdf','AC_OULD000330.pdf','CO_OULD000330.pdf','ID_OULD000330.pdf','KX_OULD000330.pdf','PENDIENTE','181e05a9465',2,'2022-07-28 05:17:07','2022-07-28 17:41:04'),(63,2223,'ARIAM VALERIA','PARDO','TERAN','PATA021227MSLRRRA8','PATA021227','2002-12-27','6941643733','pardovaleria30@gmail.com',1,1,1,1,1,'LIC. ENFERMERÍA',2,8.00,'CU__hu3uLQf8e.pdf','AC__hu3uLQf8e.pdf','CO__hu3uLQf8e.pdf','ID__hu3uLQf8e.pdf','KX__hu3uLQf8e.pdf','PENDIENTE','181e305cf58',2,'2022-07-28 17:44:09','2022-07-28 18:00:18'),(64,2223,'IVAN ALEJANDRO','BRITO','LIZARRAGA','BILI000804HSLRZVA1','BILI000804','2000-08-04','6941175951','britolizarragaivanalejandro@gmail.com',1,1,1,1,1,'ING. CIVIL',3,6.00,'CU__Cvoalu4jj.pdf','AC__Cvoalu4jj.pdf','CO__Cvoalu4jj.pdf','ID__Cvoalu4jj.pdf','KX__Cvoalu4jj.pdf','PENDIENTE','181e348a71f',5,'2022-07-28 18:57:13','2022-07-28 19:15:23'),(65,2223,'GEORGINA AZAREEL','PORTILLO','PORTILLO','POPG041003MSLRRRB7','POPG041003','2004-10-03','6693295710','georgi0310@hotmail.com',16,1,1,5,2,'LIC. EDUCACIÓN',1,9.80,'CU_POPG041003.pdf','AC_POPG041003.pdf','CO_POPG041003.pdf','ID_POPG041003.pdf','KX_POPG041003.pdf','PENDIENTE','181e352a70f',2,'2022-07-28 19:08:09','2022-07-28 19:13:08'),(66,2223,'WENDY MICHELL','BRITO','LIZARRAGA','BILW030110MSLRZNA7','BILW030110','2003-01-10','6941169954','michelbritoarg@gmail.com',1,1,1,1,1,'LIC ENFERMERIA',1,7.60,'CU_BILW030110.pdf','AC_BILW030110.pdf','CO_BILW030110.pdf','ID_BILW030110.pdf','KX_BILW030110.pdf','PENDIENTE','181e3559c1d',2,'2022-07-28 19:11:23','2022-07-28 19:11:57'),(67,2223,'RODOLFO','HERNANDEZ','SALAZAR','HESR031104HSLRLDA6','HESR031104','2003-11-04','6941161257','thebinsxd@outlook.com',1,1,1,1,1,'LIC. DERECHO',2,8.90,'CU_HESR031104.pdf','AC_HESR031104.pdf','CO_HESR031104.pdf','ID_HESR031104.pdf','KX_HESR031104.pdf','PENDIENTE','181e36474ff',2,'2022-07-28 19:27:37','2022-07-28 19:42:33'),(68,2223,'LUISA FERNANDA','OSUNA','GARZON','OUGL031106MSLSRSA7','OUGL031106','2003-11-06','6692557361','luisafer6113@gmail.com',1,1,2,1,2,'QUÍMICO FARMACÉUTICO BIÓLOGO',2,9.00,'CU_OUGL031106.pdf','AC_OUGL031106.pdf','CO_OUGL031106.pdf','ID_OUGL031106.pdf','KX_OUGL031106.pdf','PENDIENTE','181e36fc0a2',2,'2022-07-28 19:39:58','2022-07-28 19:41:07'),(69,2223,'VICTOR ALEJANDRO','BELTRAN','NIEBLA','BENV040516HSLLBCA5','BENV040516','2004-05-16','6951133030','venadomatado16@gmail.com',1,1,2,1,1,'ING. AGRONOMIA',1,8.00,'CU_BENV040516.pdf','AC_BENV040516.pdf','CO_BENV040516.pdf','ID_BENV040516.pdf','KX_BENV040516.pdf','PENDIENTE','181e3e0e3d4',2,'2022-07-28 21:43:41','2022-07-29 16:59:30'),(70,2223,'CESAR','MARIN','PEREZ','MAPC040210HSLRRSA0','MAPC040210','2004-02-10','6692766573','cesar.marin1090@gmail.com',12,12,1,1,1,'LIC. BIÓLOGO ACUACULTOR',1,9.10,'CU_MAPC040210.pdf','AC_MAPC040210.pdf','CO_MAPC040210.pdf','ID_MAPC040210.pdf','KX_MAPC040210.pdf','PENDIENTE','181e3e12244',2,'2022-07-28 21:43:56','2022-07-29 17:00:12'),(71,2223,'OMAR ULISES','LIZÁRRAGA','AVILA','LIAO030604HSLZVMA1','LIAO030604','2003-06-04','6949518013','omar.lizavi04@gmail.com',1,1,1,4,1,'ING. ELECTRÓNICA',1,9.00,'CU__6IRfYXQ6i.pdf','AC__6IRfYXQ6i.pdf','CO__6IRfYXQ6i.pdf','ID__6IRfYXQ6i.pdf','KX__6IRfYXQ6i.pdf','PENDIENTE','181e3f07038',2,'2022-07-28 22:00:40','2022-07-29 17:00:51'),(72,2223,'NADIA HAYLEY','LIZARRAGA','ZAMUDIO','LIZN020104MSLZMDA0','LIZN020104','2002-01-04','6691023670','hayleylz@hotmail.com',1,1,1,1,1,'ING. PROCESOS INDUSTRIALES',3,7.90,'CU_LIZN020104.pdf','AC_LIZN020104.pdf','CO_LIZN020104.pdf','ID_LIZN020104.pdf','KX_LIZN020104.pdf','PENDIENTE','181e45d4ec2',2,'2022-07-28 23:59:42','2022-07-29 17:01:42'),(73,2223,'BRIANDA LIZBETH','PERAZA','LOPEZ','PELB011110MSLRPRB2','PELB011110','2001-11-10','6941192424','lizbethperaza10@gmail.com',1,1,1,1,1,'ING. CIVIL',3,8.30,'CU__SyEviv9ir.pdf','AC__SyEviv9ir.pdf','CO__SyEviv9ir.pdf','ID__SyEviv9ir.pdf','KX__SyEviv9ir.pdf','PENDIENTE','181e842575b',2,'2022-07-29 18:09:49','2022-07-29 18:27:39'),(74,2223,'ROBERT DUWA','ALCARAZ','PEINADO','AAPR040407HSLLNBA0','AAPR040407','2004-04-07','6949517136','alcarazpeinadorobertduwa@gmail.com',2,2,1,4,1,'ING. MECÁNICA',1,9.00,'CU__3gpKZLRyC.pdf','AC__3gpKZLRyC.pdf','CO__3gpKZLRyC.pdf','ID__3gpKZLRyC.pdf','ID_AAPR040407.PDF','PENDIENTE','181e84d7811',2,'2022-07-29 18:21:59','2022-07-29 18:54:42'),(75,2223,'ANGELICA DEL CARMEN','CUEVAS','BELTRAN','CUBA011117MSLVLNA4','CUBA011117','2001-11-17','6693289456','angy.carmen17@gmail.com',1,1,1,1,1,'ING. CIVIL',3,9.40,'CU__7Nk00SKTD.pdf','AC__7Nk00SKTD.pdf','CO__7Nk00SKTD.pdf','ID__7Nk00SKTD.pdf','KX__7Nk00SKTD.pdf','PENDIENTE','181e88cc680',2,'2022-07-29 19:31:13','2022-08-01 16:06:13'),(76,2223,'ANDRES MANUEL','MEDINA','MONROY','MEMA040607HNTDNNA0','MEMA040607','2004-06-07','6941103134','andmanuel07med@gmail.com',1,1,1,1,2,'LIC. INFORMATICA',1,9.20,'CU_MEMA040607.pdf','AC_MEMA040607.pdf','CO_MEMA040607.pdf','ID_MEMA040607.pdf','KX_MEMA040607.pdf','PENDIENTE','181e899002e',2,'2022-07-29 19:44:34','2022-08-01 16:05:48'),(77,2223,'JARED ALEJANDRO','MUÑOZ','GALINDO','MUGJ020321HSLXLRA5','MUGJ020321','2002-03-21','6949518912','jaredalex406@gmail.com',1,1,1,1,2,'LIC. COMERCIO INTERNACIONAL',3,8.70,'CU__iXvY1jnWm.pdf','AC__iXvY1jnWm.pdf','CO__iXvY1jnWm.pdf','ID__iXvY1jnWm.pdf','KX__iXvY1jnWm.pdf','PENDIENTE','181e89fe7f1',2,'2022-07-29 19:52:07','2022-08-01 16:07:35'),(78,2223,'JESÚS FRANCISCO','OCHOA','FIGUEROA','OOFJ030704HSLCGSA2','OOFJ030704','2003-07-04','6941382007','jesus.ocfi@gmail.com',3,3,1,1,1,'ING. CIVIL',2,8.00,'CU__JOBIVPASr.pdf','AC__JOBIVPASr.pdf','CO__JOBIVPASr.pdf','ID__JOBIVPASr.pdf','KX__JOBIVPASr.pdf','PENDIENTE','181e8e45590',2,'2022-07-29 21:06:56','2022-08-01 16:08:38'),(79,2223,'DALIA ALEJANDRA','DELGADO','LIZARRAGA','DELD030717MSLLZLA1','DELD030717','2003-07-17','6691178204','obdulializ12@gmail.com',5,5,2,1,1,'ING. AGRONOMICA',2,9.80,'CU_DELD030717.pdf','AC_DELD030717.pdf','CO_DELD030717.pdf','ID_DELD030717.pdf','KX_DELD030717.pdf','PENDIENTE','181e94df8ce',2,'2022-07-29 23:02:26','2022-08-01 16:09:37'),(80,2223,'YEHIMY ROCHELLY','AGÜERO','BERGEZ','AUBY031019MSLGRHA2','AUBY031019','2003-10-19','6691551222','yehimy.agber@gmail.com',1,1,1,1,2,'LIC. ENSEÑANZA DEL INGLÉS',1,9.30,'CU_AUBY031019.pdf','AC_AUBY031019.pdf','CO_AUBY031019.pdf','ID_AUBY031019.pdf','KX_AUBY031019.pdf','PENDIENTE','181e9896fd9',2,'2022-07-30 00:07:27','2022-08-01 16:12:51'),(81,2223,'ARIANA MAYLETH','GARAY','PERAZA','GAPA031025MSLRRRA9','GAPA031025','2003-10-25','6941150506','garayperazaa@gmail.com',1,1,1,1,1,'LIC. CIENCIAS DE LA EDUCACIÓN',2,9.90,'CU_GAPA031025.pdf','AC_GAPA031025.pdf','CO_GAPA031025.pdf','ID_GAPA031025.pdf','KX_GAPA031025.pdf','PENDIENTE','181e9cf060c',2,'2022-07-30 01:23:32','2022-08-01 16:10:29'),(82,2223,'PEDRO PAUL','ZAMUDIO','SANCHEZ','ZASP030120HSLMNDA2','ZASP030120','2003-01-20','6691462935','zamudiospedro@gmail.com',1,1,1,3,1,'ING. BIOTECNOLOGÍA.',1,8.80,'CU_ZASP030120.pdf','AC_ZASP030120.pdf','CO_ZASP030120.pdf','ID_ZASP030120.pdf','KX_ZASP030120.pdf','PENDIENTE','181eee16fe2',2,'2022-07-31 01:03:10','2022-08-01 16:14:39'),(83,2223,'RUBI AZUCENA','LEYVA','LOPEZ','LELR021013MSLYPBA6','LELR021013','2002-10-13','6692903277','rubiazucenaleyva@gmail.com',1,1,1,1,1,'LIC. NUTRICION',2,8.80,'CU__a9TnaRunU.pdf','AC__a9TnaRunU.pdf','CO__a9TnaRunU.pdf','ID__a9TnaRunU.pdf','KX__a9TnaRunU.pdf','PENDIENTE','181eefea4c6',2,'2022-07-31 01:35:06','2022-08-01 16:15:58'),(84,2223,'MIGUEL ANGEL','MONROY','MORAN','MOMM020221HSLNRGA0','MOMM020221','2002-02-21','6692206309','raze9292@gmail.com',1,1,1,1,1,'LIC. TURISMO',1,9.20,'CU_MOMM020221.pdf','AC_MOMM020221.pdf','CO_MOMM020221.pdf','ID_MOMM020221.pdf','KX_MOMM020221.pdf','PENDIENTE','181efc63e10',2,'2022-07-31 05:13:20','2022-08-01 16:17:03'),(85,2223,'JOANNA YAMILET','OSUNA','GARAY','OUGJ040912MSLSRNA2','OUGJ040912','2004-09-12','6691602806','yamiletosuna29@gmail.com',1,1,1,13,1,'LIC. ENFERMERÍA',1,7.50,'CU_OUGJ040912.pdf','AC_OUGJ040912.pdf','CO_OUGJ040912.pdf','ID_OUGJ040912.pdf','KX_OUGJ040912.pdf','PENDIENTE','181f413a602',5,'2022-08-01 01:17:34','2022-08-01 16:18:08'),(86,2223,'JUAN ANTONIO','OCHOA','OSUNA','OOOJ030602HSLCSNA7','OOOJ030602','2003-06-02','6691636070','ochoaosunajuanantonio@gmail.com',1,1,1,1,1,'ING. CIVIL',2,8.50,'CU__BQdWTdnUB.pdf','AC__BQdWTdnUB.pdf','CO__BQdWTdnUB.pdf','ID__BQdWTdnUB.pdf','KX__BQdWTdnUB.pdf','PENDIENTE','181f79102c4',2,'2022-08-01 17:34:20','2022-08-01 19:11:20'),(87,2223,'KEVIN','FITCH','ROJAS','FIRK020405HSLTJVA4','FIRK020405','2002-04-05','6941198282','raflesfitch@gmail.com',1,1,1,1,1,'LIC. SOCIOLOGIA',3,9.40,'CU__mGlf0tp5Y.pdf','AC__mGlf0tp5Y.pdf','CO__mGlf0tp5Y.pdf','ID__mGlf0tp5Y.pdf','KX__mGlf0tp5Y.pdf','PENDIENTE','181f7b28805',2,'2022-08-01 18:10:59','2022-08-01 19:12:14'),(88,2223,'BRIANA JAEL','SALAZAR','OSUNA','SAOB010515MSLLSRA0','SAOB010515','2001-05-15','6692233865','brianajael1505@gmail.com',1,1,1,6,2,'LIC. EDUCACIÓN PRIMARIA',4,9.80,'CU__eS7E8RlhE.pdf','AC__eS7E8RlhE.pdf','CO__eS7E8RlhE.pdf','ID__eS7E8RlhE.pdf','KX__eS7E8RlhE.pdf','PENDIENTE','181f7c8c1a3',2,'2022-08-01 18:35:17','2022-08-01 19:13:26'),(89,2223,'MARIA ELENA','COLIO','LIZARRAGA','COLE040430MSLLZLA0','_xkHNV9H8b','2004-04-30','6692535754','hyuniehwang@gmail.com',13,1,1,3,1,'ÍNG. INFORMATICA',1,9.80,'CU__xkHNV9H8b.pdf','AC__xkHNV9H8b.pdf','CO__xkHNV9H8b.pdf','ID__xkHNV9H8b.pdf','KX__xkHNV9H8b.pdf','PENDIENTE','181f7dd9056',2,'2022-08-01 18:58:02','2022-08-01 18:59:24'),(90,2223,'DAYANA MARLENNE','GALINDO','RODRIGUEZ','GARD040203MSLLDYA1','GARD040203','2004-02-03','6941087210','dayanaglindo@gmail.com',1,1,1,1,1,'LIC. RECURSOS HUMANOS',1,7.30,'CU__AsnvzEmjT.pdf','AC__AsnvzEmjT.pdf','CO__AsnvzEmjT.pdf','ID_GARD040203.PDF','KX__AsnvzEmjT.pdf','PENDIENTE','181f85c5c08',2,'2022-08-01 21:16:40','2022-08-02 21:39:55'),(91,2223,'LUCERO BERENICE','LOPEZ','DELGADO','LODL021114MSLPLCA4','LODL021114','2002-11-14','6691061984','luceritoberenaiz@2009gmail.com',1,1,1,1,1,'LIC. TURISMO',1,9.10,'CU_LODL021114.pdf','AC_LODL021114.pdf','CO_LODL021114.pdf','ID_LODL021114.PDF','KX_LODL021114.pdf','PENDIENTE','181f91b50b1',5,'2022-08-02 00:45:27','2022-08-02 22:27:48'),(92,2223,'MARIA DE LOS ANGELES','URIZA','GONZALEZ','UIGA040112MSLRNNA3','UIGA040112','2004-01-12','6941642714','madelosangelesuriza@gmail.com',1,1,1,1,1,'LIC. DERECHO',1,9.80,'CU_UIGA040112.pdf','AC_UIGA040112.pdf','CO_UIGA040112.pdf','ID_UIGA040112.pdf','KX_UIGA040112.pdf','PENDIENTE','181f990724d',2,'2022-08-02 02:53:31','2022-08-02 16:35:45'),(93,2223,'EVELYN XIMENA','LOPEZ','SILVA','LOSE031112MSLPLVA8','LOSE031112','2003-11-12','6941138860','evelyn.losi03@gmail.com',1,1,1,3,1,'ING. TECNOLOGÍA DE LA INF.',2,9.70,'CU_LOSE031112.pdf','AC_LOSE031112.pdf','CO_LOSE031112.pdf','ID_LOSE031112.pdf','KX_LOSE031112.pdf','PENDIENTE','181f9990b39',2,'2022-08-02 03:02:55','2022-08-02 16:36:27'),(94,2223,'DANIELA','CAMACHO','BARRON','CABD040204MSLMRNA7','CABD040204','2004-02-04','6941154962','dcamachobarron@gmail.com',2,1,1,1,1,'ING. CIVIL',1,9.70,'CU_CABD040204.pdf','AC_CABD040204.pdf','CO_CABD040204.pdf','ID_CABD040204.pdf','KX_CABD040204.pdf','PENDIENTE','181f9d104a1',2,'2022-08-02 04:04:07','2022-08-02 16:37:18'),(95,2223,'DAVID ALFREDO','VALDEZ','CAMACHO','VACD041109HSLLMVA7','VACD041109','2004-11-09','6691463492','camachoalfredo537@gmail.com',2,1,1,1,1,'ADMINISTRACION DE EMPRESAS',1,8.00,'CU_VACD041109.pdf','AC_VACD041109.pdf','CO_VACD041109.pdf','ID_VACD041109.pdf','KX_VACD041109.pdf','PENDIENTE','181f9f7958f',2,'2022-08-02 04:46:17','2022-08-02 16:38:06'),(96,2223,'SANDRA LETICIA','GARZON','BAYONA','GABS011029MSLRYNB9','GABS011029','2001-10-29','6692228745','garzonbayonas@gmail.com',1,1,1,1,1,'ING. CIVIL',4,9.90,'CU_GABS011029.pdf','AC_GABS011029.pdf','CO_GABS011029.pdf','ID_GABS011029.pdf','KX_GABS011029.pdf','PENDIENTE','181fc605e31',2,'2022-08-02 16:00:39','2022-08-02 16:39:28'),(97,2223,'BETSAIDA NOEMI','MORENO','RIOS','MORB020807MSLRSTA8','MORB020807','2002-08-07','6941194610','betsaidamorenor@gmail.com',1,1,1,1,1,'ADMINISTRACIÓN DE EMPRESAS',2,9.10,'CU_MORB020807.pdf','AC_MORB020807.pdf','CO_MORB020807.pdf','ID_MORB020807.pdf','KX_MORB020807.pdf','PENDIENTE','181fcacc0d6',2,'2022-08-02 17:24:11','2022-08-02 17:52:30'),(98,2223,'LUISA GUADALUPE','SALAZAR','CORONADO','SACL981207MSLLRS05','SACL981207','1998-12-07','6673233725','lupita.15salazar@hotmail.com',1,1,2,25,4,'INGENIERÍA INDUSTRIAL',6,8.60,'CU_SACL981207.pdf','AC_SACL981207.pdf','CO_SACL981207.pdf','ID_SACL981207.pdf','KX_SACL981207.pdf','PENDIENTE','181fcae819b',2,'2022-08-02 17:26:05','2022-08-02 17:53:28'),(99,2223,'BRANDON GILBERTO','MADRIGAL','RAMIREZ','MARB031029HSLDMRA7','MARB031029','2003-10-29','6692721848','brandongilbertom@gmail.com',1,1,2,1,2,'ING. AGRONÓMIA',1,9.00,'CU_MARB031029.pdf','AC_MARB031029.pdf','CO_MARB031029.pdf','ID_MARB031029.pdf','KX_MARB031029.pdf','PENDIENTE','181fcce6d1d',2,'2022-08-02 18:00:59','2022-08-02 21:00:59'),(100,2223,'VIVIANA','OSUNA','ALCARAZ','OUAV000505MSLSLVA3','OUAV000505','2000-05-05','6692745234','vivianaosuna32@gmail.com',2,1,1,1,1,'ING. EN PROCESOS INDUSTRIALES',4,9.60,'CU__CPPb3pgR9.pdf','AC__CPPb3pgR9.pdf','CO__CPPb3pgR9.pdf','ID__CPPb3pgR9.pdf','KX__CPPb3pgR9.pdf','PENDIENTE','181fd9e033b',2,'2022-08-02 21:47:57','2022-08-02 22:30:00'),(101,2223,'JULIO CESAR','SALAZAR','FLORES','SAFJ010902HSLLLLA6','SAFJ010902','2001-09-02','6941179918','juliocesarsalazarflores.jcsf@gmail.com',1,1,1,1,1,'LIC. ARQUITECTURA',4,7.90,'CU_SAFJ010902.pdf','AC_SAFJ010902.pdf','CO_SAFJ010902.pdf','ID_SAFJ010902.pdf','KX_SAFJ010902.pdf','PENDIENTE','181fda30b01',2,'2022-08-02 21:53:27','2022-08-02 22:28:44'),(102,2223,'JAVIER ANTONIO','LOPEZ','TORRES','LOTJ021115HSLPRVA5','LOTJ021115','2002-11-15','6692152864','javierantonioloto@gmail.com',1,1,1,1,1,'ING. CIVIL',3,8.00,'CU_LOTJ021115.pdf','AC_LOTJ021115.pdf','CO_LOTJ021115.pdf','ID_LOTJ021115.pdf','KX_LOTJ021115.pdf','PENDIENTE','181fdbc5117',2,'2022-08-02 22:21:05','2022-08-02 22:31:10'),(103,2223,'LUIS MANUEL','VELARDE','DIAZ','VEDL000821HSLLZSA5','_SQbffMMD8','2000-08-21','6691525861','luismanuelvelardediaz@gmail.com',1,1,1,1,2,'LICEN CONTADURÍA PÚBLICA',3,8.60,'CU__SQbffMMD8.pdf','AC__SQbffMMD8.pdf','CO__SQbffMMD8.pdf','ID__SQbffMMD8.pdf','KX__SQbffMMD8.pdf','PENDIENTE','181fdd6a470',1,'2022-08-02 22:49:52','2022-08-02 22:49:52'),(104,2223,'LIDIA YADIRA','BARRAZA','CAZARES','BACL040824MSLRZDA1','BACL040824','2004-08-24','6692746756','lidiabarraza89@gmail.com',3,3,1,1,1,'MERCADOTECNIA',1,9.30,'CU_BACL040824.pdf','AC_BACL040824.pdf','CO_BACL040824.pdf','ID_BACL040824.pdf','KX_BACL040824.pdf','PENDIENTE','181fde862c4',1,'2022-08-02 23:09:16','2022-08-02 23:09:16'),(105,2223,'KARLA','HERNANDEZ','VIZCARRA','HEVK030604MSLRZRA0','HEVK030604','2003-06-04','6692762838','karla.hevi03@gmail.com',1,1,1,6,2,'LIC. EN EDUCACIÓN PRIMARIA',2,9.50,'CU_HEVK030604.pdf','AC_HEVK030604.pdf','CO_HEVK030604.pdf','ID_HEVK030604.pdf','KX_HEVK030604.pdf','PENDIENTE','181fe2dbe6e',1,'2022-08-03 00:25:06','2022-08-03 00:25:06'),(106,2223,'MARIA GUADALUPE','MARQUEZ','LIZARRAGA','MALG000918MSLRZDA9','MALG000918','2000-09-18','6692654527','m.g.m.l.18.09.00@gmail.com',3,1,1,1,3,'LICENCIATURA EN DERECHO',5,9.30,'CU_MALG000918.pdf','AC_MALG000918.pdf','CO_MALG000918.pdf','ID_MALG000918.pdf','KX_MALG000918.pdf','PENDIENTE','181fe45c09f',1,'2022-08-03 00:51:21','2022-08-03 00:51:21'),(107,2223,'LUCILA JAQUELINE','MORALES','CRUZ','MOCL991114MSLRRC07','MOCL991114','1999-11-14','6692235450','lyaque99@hotmail.com',13,13,1,5,1,'LICENCIATURA EN PEDAGOGÍA',4,8.10,'CU_MOCL991114.pdf','AC_MOCL991114.pdf','CO_MOCL991114.pdf','ID_MOCL991114.pdf','KX_MOCL991114.pdf','PENDIENTE','18201c16851',1,'2022-08-03 17:06:15','2022-08-03 17:06:15');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
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
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `cve_localidad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `localidad` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cve_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'CONCORDIA'),(2,'MALPICA'),(3,'MESILLAS'),(4,'AGUACALIENTE GÁRATE'),(5,'EL HUAJOTE'),(6,'LA EMBOCADA'),(7,'COPALA'),(8,'CHUPADEROS'),(9,'EL PALMITO'),(10,'POTRERILLOS'),(11,'SANTA LUCÍA'),(12,'LA PETACA'),(13,'EL VERDE'),(14,'ZAVALA'),(15,'LA CONCEPCIÓN'),(16,'TEPUXTA'),(17,'CERRITOS'),(18,'SANTA CATARINA'),(19,'LOS NARANJOS'),(20,'SAN JUAN DE JACOBO'),(21,'AGUACALIENTE JACOBO'),(22,'LOS CIRUELOS'),(23,'SAN LORENZO'),(24,'EL MAGISTRAL'),(25,'LA GUÁSIMA'),(26,'PÁNUCO'),(27,'LA GUAYANERA'),(28,'EL HABAL DE COPALA'),(29,'MEZA DEL CARRIZAL'),(30,'CAPILLA DEL TAXTE'),(31,'LOBERAS'),(32,'EL BATEL'),(33,'LA PASTORÍA'),(34,'LAS GUACAMAYAS'),(35,'EL COCO'),(36,'LAS IGUANAS'),(37,'PALMILLAS'),(38,'CHIRIMOYOS PETACA'),(39,'SANTA RITA'),(40,'EL CUATANTAL');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(14,'2019_12_14_000001_create_personal_access_tokens_table',2),(18,'2022_06_23_173112_create_estudiantes_table',3),(57,'2022_06_27_191115_create_localidades_table',4),(58,'2022_06_27_191535_create_escuelas_table',4),(59,'2022_06_27_191759_create_ciudades_table',4),(60,'2022_06_27_191820_create_turnos_table',4),(62,'2022_07_04_202357_add_lugar_nac_estudiantes',5),(90,'2022_06_28_191612_create_estudiantes_table',6),(91,'2022_07_05_224901_create_techos_table',6),(92,'2022_07_05_225117_create_montos_mensuales_table',6),(94,'2022_07_05_233414_create_datos_socioeconomicos_table',7),(95,'2022_07_13_130104_add_id_hex_estudiantes',8),(96,'2022_07_13_132025_create_status_estudiantes_table',9),(98,'2022_07_13_132729_add_status_estudiantes',10),(111,'2022_09_13_095555_create_boletos_table',12),(130,'2022_11_10_104353_create_boletos_remesas',14),(131,'2022_11_10_110830_create_boletos_tantos',15),(142,'2022_07_25_122638_add_observaciones_datos_socioeconomicos',16),(150,'2022_11_09_151944_create_ciclos_table',17),(162,'2022_11_09_160244_create_boletos_paquetes_table',18),(169,'2022_11_10_104353_create_boletos_remesas_table',19),(170,'2022_11_10_110830_create_boletos_tantos_table',19),(171,'2022_11_10_194428_create_boletos_asignados_table',19),(172,'2022_11_22_113321_add_con_tantos_boletos_remesas',20),(174,'2022_11_29_062245_create_apoyos_montos_table',21),(177,'2022_12_01_081848_create_apoyos_asignados_table',22),(178,'2022_12_02_060342_add_descripcion_apoyos_boletos_remesas',23);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `montos_mensuales`
--

DROP TABLE IF EXISTS `montos_mensuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `montos_mensuales` (
  `cve_monto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monto` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cve_monto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montos_mensuales`
--

LOCK TABLES `montos_mensuales` WRITE;
/*!40000 ALTER TABLE `montos_mensuales` DISABLE KEYS */;
INSERT INTO `montos_mensuales` VALUES (1,'Menos de $6,000'),(2,'$6,000 - $8,000'),(3,'$8,000 - $10,000'),(4,'$10,000 - $12,000'),(5,'$12,000 - $14,000'),(6,'Más de $14,000');
/*!40000 ALTER TABLE `montos_mensuales` ENABLE KEYS */;
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
-- Table structure for table `status_estudiantes`
--

DROP TABLE IF EXISTS `status_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_estudiantes` (
  `cve_status` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cve_status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_estudiantes`
--

LOCK TABLES `status_estudiantes` WRITE;
/*!40000 ALTER TABLE `status_estudiantes` DISABLE KEYS */;
INSERT INTO `status_estudiantes` VALUES (1,'RECIBIDO'),(2,'REVISADO'),(3,'CENSADO'),(4,'RECHAZADO'),(5,'PENDIENTE'),(6,'ACEPTADO'),(7,'ESPECIAL'),(8,'ACEPTADO 2.0'),(9,'ESPECIAL 2.0');
/*!40000 ALTER TABLE `status_estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techos`
--

DROP TABLE IF EXISTS `techos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techos` (
  `cve_techo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `techo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cve_techo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techos`
--

LOCK TABLES `techos` WRITE;
/*!40000 ALTER TABLE `techos` DISABLE KEYS */;
INSERT INTO `techos` VALUES (1,'CEMENTO'),(3,'LÁMINA'),(4,'TEJAS'),(5,'OTRO');
/*!40000 ALTER TABLE `techos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnos` (
  `cve_turno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `turno` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cve_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'MATUTINO'),(2,'VESPERTINO'),(3,'NOCTURNO'),(4,'MIXTO');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
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
  `usertype` int(11) NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ANGEL','asd@gmail.com',NULL,1,'$2y$10$O0CTqw1fieyRuTSsYKOB0.fGOXT6mAloJryHj2zU5Zk5db5mVggIy',NULL,'2022-06-23 21:26:11','2022-06-23 21:26:11'),(2,'ALIVIANATE','alivianate@concordia.gob.mx',NULL,2,'$2y$10$tU7TU2KjLLM.k0wYrp2zCuizUvBNPcI0T9NODBhA7uyfRc3tFJ7g2',NULL,'2022-07-25 20:41:17','2023-01-17 16:31:40'),(3,'REBECA','rvelarde@concordia.gob.mx',NULL,3,'$2y$10$l2F947ZhM7WtyuDLNsgMvOLLZixxH8QjLjKCY3cJHimBAg5eYj/EC',NULL,'2022-07-26 01:02:48','2022-11-24 21:36:10'),(4,'hacker','hacker@webmail.com',NULL,0,'$2y$10$W63nI2GHbzqm.8fwEbkaWulgr51PoRIahvahnFk3quLiYHrqiNSsm',NULL,'2022-12-02 18:44:23','2022-12-02 18:44:23');
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

-- Dump completed on 2023-05-06 16:19:23
