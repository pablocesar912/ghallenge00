-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mov
-- ------------------------------------------------------
-- Server version	5.7.36-0ubuntu0.18.04.1

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
-- Table structure for table `abono`
--

DROP TABLE IF EXISTS `abono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abono` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `monto` double NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdekl0kyw5g6q4hyqfpmw1nrx1` (`pais_id`),
  CONSTRAINT `FKdekl0kyw5g6q4hyqfpmw1nrx1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abono`
--

LOCK TABLES `abono` WRITE;
/*!40000 ALTER TABLE `abono` DISABLE KEYS */;
/*!40000 ALTER TABLE `abono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accesorio`
--

DROP TABLE IF EXISTS `accesorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesorio` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt6m2q9v4ixupobmdei8bslh5a` (`pais_id`),
  CONSTRAINT `FKt6m2q9v4ixupobmdei8bslh5a` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesorio`
--

LOCK TABLES `accesorio` WRITE;
/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
INSERT INTO `accesorio` VALUES ('d8acf1ea-b014-463a-b80c-26c70f7f2f4b',NULL,'2021-05-30 23:30:32','Lona','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `accesorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activo`
--

DROP TABLE IF EXISTS `activo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activo` (
  `id` varchar(255) NOT NULL,
  `anio` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `identificador` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `patente` varchar(255) DEFAULT NULL,
  `tipo_de_activo` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `dominio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh1yw4wv8a9hpxmdi0j61dnt6d` (`empresa_id`),
  CONSTRAINT `FKh1yw4wv8a9hpxmdi0j61dnt6d` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activo`
--

LOCK TABLES `activo` WRITE;
/*!40000 ALTER TABLE `activo` DISABLE KEYS */;
INSERT INTO `activo` VALUES ('6a84330b-bd76-4c42-96f7-eb7abac156e9','2020','Prueba activo',NULL,'2342sfd3','Ford','Ranger','2021-08-26 02:32:12','Prueba',NULL,'Vehiculo','1',NULL,'AC845Lw');
/*!40000 ALTER TABLE `activo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `area_visible` bit(1) NOT NULL,
  `baja` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `modelo_formulario_id` varchar(255) DEFAULT NULL,
  `modelo_encuesta_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3bywnkbjacgjucjm5oo9oeble` (`modelo_formulario_id`),
  KEY `FK5b6q3n639v6t5xdch2vh5iwd7` (`modelo_encuesta_id`),
  CONSTRAINT `FK3bywnkbjacgjucjm5oo9oeble` FOREIGN KEY (`modelo_formulario_id`) REFERENCES `modelo_encuesta` (`id`),
  CONSTRAINT `FK5b6q3n639v6t5xdch2vh5iwd7` FOREIGN KEY (`modelo_encuesta_id`) REFERENCES `modelo_encuesta` (`id`),
  CONSTRAINT `FKiwatlv831qg3fr01ix3um432g` FOREIGN KEY (`modelo_formulario_id`) REFERENCES `modelo_formulario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristica`
--

DROP TABLE IF EXISTS `caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristica` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKptdbv5ffjvyy006daelaxwljo` (`pais_id`),
  CONSTRAINT `FKptdbv5ffjvyy006daelaxwljo` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica`
--

LOCK TABLES `caracteristica` WRITE;
/*!40000 ALTER TABLE `caracteristica` DISABLE KEYS */;
INSERT INTO `caracteristica` VALUES ('6830d16b-2ff3-4679-acc5-f0253c1e197c',NULL,'2021-05-30 23:30:48','Cierre centalizado','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga`
--

DROP TABLE IF EXISTS `carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carga` (
  `id` varchar(255) NOT NULL,
  `cantidad_camiones` int(11) DEFAULT NULL,
  `carga_completa` bit(1) DEFAULT NULL,
  `con_custodia` bit(1) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `indivisible` bit(1) DEFAULT NULL,
  `metros_cubicos` double DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `seguro_carga` bit(1) DEFAULT NULL,
  `tipo_peso` int(11) DEFAULT NULL,
  `cliente_id` varchar(255) DEFAULT NULL,
  `destino_id` varchar(255) DEFAULT NULL,
  `origen_id` varchar(255) DEFAULT NULL,
  `producto_id` varchar(255) DEFAULT NULL,
  `tipo_embalaje_id` varchar(255) DEFAULT NULL,
  `tipo_remolque_id` varchar(255) DEFAULT NULL,
  `tipo_vehiculo_id` varchar(255) DEFAULT NULL,
  `tipo_peso_id` varchar(255) DEFAULT NULL,
  `unidad_medida_id` varchar(255) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl5rnvbo2s44amgijd7soobb1k` (`cliente_id`),
  KEY `FKc9do6jn1q38gogb36ycjqsxfu` (`destino_id`),
  KEY `FKeqq91w3m4l4m38cgdshwq6l3p` (`origen_id`),
  KEY `FK2xnqkfiyom7ohs3jny3lyex9x` (`producto_id`),
  KEY `FK2us76quq46dx4y25y75524npo` (`tipo_embalaje_id`),
  KEY `FKhc638w31slkj4d1qrdrgx2o4s` (`tipo_remolque_id`),
  KEY `FK8wqrhbxv1yf517x54y8onhfij` (`tipo_vehiculo_id`),
  KEY `FKc2nr4djnmadi51bcr159na9pq` (`tipo_peso_id`),
  KEY `FKnqhk2cdqe946jg4ncosb33y0f` (`unidad_medida_id`),
  CONSTRAINT `FK2us76quq46dx4y25y75524npo` FOREIGN KEY (`tipo_embalaje_id`) REFERENCES `tipo_embalaje` (`id`),
  CONSTRAINT `FK2xnqkfiyom7ohs3jny3lyex9x` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `FK8wqrhbxv1yf517x54y8onhfij` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`),
  CONSTRAINT `FKc2nr4djnmadi51bcr159na9pq` FOREIGN KEY (`tipo_peso_id`) REFERENCES `unidad_medida` (`id`),
  CONSTRAINT `FKc9do6jn1q38gogb36ycjqsxfu` FOREIGN KEY (`destino_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKeqq91w3m4l4m38cgdshwq6l3p` FOREIGN KEY (`origen_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKhc638w31slkj4d1qrdrgx2o4s` FOREIGN KEY (`tipo_remolque_id`) REFERENCES `tipo_remolque` (`id`),
  CONSTRAINT `FKl5rnvbo2s44amgijd7soobb1k` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FKnqhk2cdqe946jg4ncosb33y0f` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga`
--

LOCK TABLES `carga` WRITE;
/*!40000 ALTER TABLE `carga` DISABLE KEYS */;
INSERT INTO `carga` VALUES ('12d90388-89e5-49b9-a257-e23aa3bb322f',1,NULL,NULL,'Prueba 5 refactor',NULL,NULL,NULL,NULL,'2021-05-31 00:31:12',7,NULL,1,NULL,NULL,NULL,'f7d63d02-3520-4725-8b8e-62e3b58bc7ef','db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,NULL,NULL),('2eb6840a-3ac0-46f0-9d73-4761a0f8f900',1,NULL,NULL,'Prueba viaje con distancia 3',NULL,NULL,NULL,NULL,'2021-07-19 00:30:01',2,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('3a641685-0d04-4d26-9cee-2e3803298055',1,NULL,NULL,'',NULL,NULL,NULL,NULL,'2021-06-03 03:07:20',5000,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,'f7d63d02-3520-4725-8b8e-62e3b58bc7ef','db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926575',NULL),('5af28562-afa6-4a99-a8a3-ec1b231c1d4f',1,NULL,NULL,'sadsad',NULL,NULL,NULL,NULL,'2021-06-29 13:10:08',4,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('b5aab713-3466-462b-983a-3f6f0885c906',1,NULL,NULL,'OS',NULL,NULL,NULL,NULL,'2021-11-10 12:19:44',5,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('b71d5f7a-c614-4b73-9e6e-6fbd12ef2513',1,NULL,NULL,'Prueba flota 1',NULL,NULL,NULL,NULL,'2021-07-16 15:14:22',8,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('bd4720f4-3585-4ab2-bdf3-de927373a773',1,NULL,NULL,'asdweqrdsf',NULL,NULL,NULL,NULL,'2021-06-29 13:32:28',7,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('c002ec58-b370-4646-9040-40a72eb66f12',1,NULL,NULL,'Prueba de carga número N',NULL,NULL,NULL,NULL,'2021-10-29 15:22:54',4,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('e3d6e582-3a3c-43ce-bc37-74a48315c6cf',1,NULL,NULL,'Prueba carga 2',NULL,NULL,NULL,NULL,'2021-06-07 13:37:12',88000,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926575','Granos molidos'),('e9f5409e-a58d-485c-9def-94484ebe9998',1,NULL,NULL,'Prueba distancia 1',NULL,NULL,NULL,NULL,'2021-07-18 23:56:15',1,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('f5b4204d-645a-4fc9-b5cc-1fc492b9e64c',1,NULL,NULL,'Prueba de carga 1 12/06',NULL,NULL,NULL,NULL,'2021-06-12 14:36:30',7,NULL,NULL,NULL,NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b',NULL,'fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos'),('fc99a612-d33f-429f-8cca-62f6c35d797c',1,NULL,NULL,'sadsad',NULL,NULL,NULL,NULL,'2021-06-29 13:12:38',4,NULL,NULL,'ba223898-256d-416c-96a6-7b94997f7929',NULL,NULL,NULL,'db519441-c4a4-4a96-8981-b8679510f18b','c1275089-db5d-47a5-936c-2c3eea9085ff','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',NULL,'b3abbafb-91ab-4ef0-9c3a-3c5b3d926574','Granos molidos');
/*!40000 ALTER TABLE `carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga_accesorios`
--

DROP TABLE IF EXISTS `carga_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carga_accesorios` (
  `carga_id` varchar(255) NOT NULL,
  `accesorios_id` varchar(255) NOT NULL,
  KEY `FKn5sfsaoxaqkugj2936uflwot8` (`accesorios_id`),
  KEY `FK4rl7kmhu73my58dr7fvbjqs7e` (`carga_id`),
  CONSTRAINT `FK4rl7kmhu73my58dr7fvbjqs7e` FOREIGN KEY (`carga_id`) REFERENCES `carga` (`id`),
  CONSTRAINT `FKn5sfsaoxaqkugj2936uflwot8` FOREIGN KEY (`accesorios_id`) REFERENCES `accesorio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga_accesorios`
--

LOCK TABLES `carga_accesorios` WRITE;
/*!40000 ALTER TABLE `carga_accesorios` DISABLE KEYS */;
INSERT INTO `carga_accesorios` VALUES ('12d90388-89e5-49b9-a257-e23aa3bb322f','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('3a641685-0d04-4d26-9cee-2e3803298055','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('e3d6e582-3a3c-43ce-bc37-74a48315c6cf','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('5af28562-afa6-4a99-a8a3-ec1b231c1d4f','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('fc99a612-d33f-429f-8cca-62f6c35d797c','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('bd4720f4-3585-4ab2-bdf3-de927373a773','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('b71d5f7a-c614-4b73-9e6e-6fbd12ef2513','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('e9f5409e-a58d-485c-9def-94484ebe9998','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('2eb6840a-3ac0-46f0-9d73-4761a0f8f900','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('b5aab713-3466-462b-983a-3f6f0885c906','d8acf1ea-b014-463a-b80c-26c70f7f2f4b');
/*!40000 ALTER TABLE `carga_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga_caracteristicas`
--

DROP TABLE IF EXISTS `carga_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carga_caracteristicas` (
  `carga_id` varchar(255) NOT NULL,
  `caracteristicas_id` varchar(255) NOT NULL,
  KEY `FK5ptubeegj8l0c6tl9nkuwnt8m` (`caracteristicas_id`),
  KEY `FKnwm3j8bnuw9jg5lh22j3xiqwi` (`carga_id`),
  CONSTRAINT `FK5ptubeegj8l0c6tl9nkuwnt8m` FOREIGN KEY (`caracteristicas_id`) REFERENCES `caracteristica` (`id`),
  CONSTRAINT `FKnwm3j8bnuw9jg5lh22j3xiqwi` FOREIGN KEY (`carga_id`) REFERENCES `carga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga_caracteristicas`
--

LOCK TABLES `carga_caracteristicas` WRITE;
/*!40000 ALTER TABLE `carga_caracteristicas` DISABLE KEYS */;
INSERT INTO `carga_caracteristicas` VALUES ('12d90388-89e5-49b9-a257-e23aa3bb322f','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('3a641685-0d04-4d26-9cee-2e3803298055','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('e3d6e582-3a3c-43ce-bc37-74a48315c6cf','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('5af28562-afa6-4a99-a8a3-ec1b231c1d4f','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('fc99a612-d33f-429f-8cca-62f6c35d797c','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('bd4720f4-3585-4ab2-bdf3-de927373a773','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('b71d5f7a-c614-4b73-9e6e-6fbd12ef2513','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('e9f5409e-a58d-485c-9def-94484ebe9998','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('2eb6840a-3ac0-46f0-9d73-4761a0f8f900','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('c002ec58-b370-4646-9040-40a72eb66f12','6830d16b-2ff3-4679-acc5-f0253c1e197c'),('b5aab713-3466-462b-983a-3f6f0885c906','6830d16b-2ff3-4679-acc5-f0253c1e197c');
/*!40000 ALTER TABLE `carga_caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga_tipo_cargas`
--

DROP TABLE IF EXISTS `carga_tipo_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carga_tipo_cargas` (
  `carga_id` varchar(255) NOT NULL,
  `tipo_cargas_id` varchar(255) NOT NULL,
  KEY `FKi9ta5epkinw5cm87rk17y83ja` (`tipo_cargas_id`),
  KEY `FK15h8ptaj1sbh1cvwu39opidwt` (`carga_id`),
  CONSTRAINT `FK15h8ptaj1sbh1cvwu39opidwt` FOREIGN KEY (`carga_id`) REFERENCES `carga` (`id`),
  CONSTRAINT `FKi9ta5epkinw5cm87rk17y83ja` FOREIGN KEY (`tipo_cargas_id`) REFERENCES `tipo_carga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga_tipo_cargas`
--

LOCK TABLES `carga_tipo_cargas` WRITE;
/*!40000 ALTER TABLE `carga_tipo_cargas` DISABLE KEYS */;
INSERT INTO `carga_tipo_cargas` VALUES ('12d90388-89e5-49b9-a257-e23aa3bb322f','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('3a641685-0d04-4d26-9cee-2e3803298055','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('e3d6e582-3a3c-43ce-bc37-74a48315c6cf','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('f5b4204d-645a-4fc9-b5cc-1fc492b9e64c','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('5af28562-afa6-4a99-a8a3-ec1b231c1d4f','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('fc99a612-d33f-429f-8cca-62f6c35d797c','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('bd4720f4-3585-4ab2-bdf3-de927373a773','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('b71d5f7a-c614-4b73-9e6e-6fbd12ef2513','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('e9f5409e-a58d-485c-9def-94484ebe9998','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('2eb6840a-3ac0-46f0-9d73-4761a0f8f900','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('c002ec58-b370-4646-9040-40a72eb66f12','566ccdb2-ffc3-4465-b931-6e26a64d3140'),('b5aab713-3466-462b-983a-3f6f0885c906','566ccdb2-ffc3-4465-b931-6e26a64d3140');
/*!40000 ALTER TABLE `carga_tipo_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `emisor_id` varchar(255) DEFAULT NULL,
  `receptor_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcnfx4tcx0mjdwqfolg0ajypu3` (`emisor_id`),
  KEY `FKomcfygas78eyx4j5hyxv1kf2u` (`receptor_id`),
  CONSTRAINT `FKcnfx4tcx0mjdwqfolg0ajypu3` FOREIGN KEY (`emisor_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKomcfygas78eyx4j5hyxv1kf2u` FOREIGN KEY (`receptor_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_mensaje`
--

DROP TABLE IF EXISTS `chat_mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_mensaje` (
  `id` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `chat_id` varchar(255) DEFAULT NULL,
  `emisor_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbhg9fq8kbmcmc2acm43n0y6sa` (`chat_id`),
  KEY `FKmlyb3x1n5a9c0qqu2y8d4xdhi` (`emisor_id`),
  CONSTRAINT `FKbhg9fq8kbmcmc2acm43n0y6sa` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`id`),
  CONSTRAINT `FKmlyb3x1n5a9c0qqu2y8d4xdhi` FOREIGN KEY (`emisor_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_mensaje`
--

LOCK TABLES `chat_mensaje` WRITE;
/*!40000 ALTER TABLE `chat_mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `realizado` bit(1) NOT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `modelo_checklist_id` varchar(255) DEFAULT NULL,
  `responsable_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88ndbllt0c1fca5xay1h23nrw` (`empresa_id`),
  KEY `FKnk5ymku2wkppojqtkrpnke2ta` (`modelo_checklist_id`),
  KEY `FKm6ytyggy3eolwu84vaeaw1cjr` (`responsable_id`),
  CONSTRAINT `FK88ndbllt0c1fca5xay1h23nrw` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKm6ytyggy3eolwu84vaeaw1cjr` FOREIGN KEY (`responsable_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKnk5ymku2wkppojqtkrpnke2ta` FOREIGN KEY (`modelo_checklist_id`) REFERENCES `modelo_checklist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer`
--

DROP TABLE IF EXISTS `chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chofer` (
  `id` varchar(255) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_adicional` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `telefono_adicional` varchar(255) DEFAULT NULL,
  `tipo_documento` int(11) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `estado_chofer` varchar(255) DEFAULT NULL,
  `ultima_id` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8j4v4cb3bjtpp04lucu43aqi3` (`empresa_id`),
  KEY `FK4upgenhtkt86xbnrjt93oitx6` (`usuario_id`),
  KEY `FKdq92haql8ayy5fwtyfnyvngjc` (`ultima_id`),
  CONSTRAINT `FK4upgenhtkt86xbnrjt93oitx6` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK8j4v4cb3bjtpp04lucu43aqi3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKdq92haql8ayy5fwtyfnyvngjc` FOREIGN KEY (`ultima_id`) REFERENCES `tracking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer`
--

LOCK TABLES `chofer` WRITE;
/*!40000 ALTER TABLE `chofer` DISABLE KEYS */;
INSERT INTO `chofer` VALUES ('0683629e-1a58-487b-8cec-cffd8e828845','Morco','25487548',NULL,'c@m.com','','2021-06-10 02:10:37','Carlos ','2615447875','',0,'1','747b81fb-112a-4f29-adbd-bec9f0946069',NULL,NULL,NULL,NULL),('3865fff8-207e-44eb-ad5d-aed48e450f2d','Cp','5424333',NULL,'martin@followhub.tech','','2021-09-21 16:04:35','Juan Carlos','2614222555','',0,'1','cf3956f0-337c-4e93-80bc-104f990722da',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer_tipo_carga`
--

DROP TABLE IF EXISTS `chofer_tipo_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chofer_tipo_carga` (
  `chofer_id` varchar(255) NOT NULL,
  `tipo_carga_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_nypguvrmyn9tnb8ji9f1i716m` (`tipo_carga_id`),
  KEY `FKsexkp9p8rxjgkbscmpjiuxqg8` (`chofer_id`),
  CONSTRAINT `FKa5ndhuhf62w3tt8qb76dhd3l1` FOREIGN KEY (`tipo_carga_id`) REFERENCES `tipo_carga` (`id`),
  CONSTRAINT `FKsexkp9p8rxjgkbscmpjiuxqg8` FOREIGN KEY (`chofer_id`) REFERENCES `chofer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer_tipo_carga`
--

LOCK TABLES `chofer_tipo_carga` WRITE;
/*!40000 ALTER TABLE `chofer_tipo_carga` DISABLE KEYS */;
/*!40000 ALTER TABLE `chofer_tipo_carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `ciudad` tinyblob,
  `codigo` varchar(255) DEFAULT NULL,
  `identificador` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` tinyblob,
  `razon_social` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `ubicacion_id` varchar(255) DEFAULT NULL,
  `identificador_fiscal` varchar(255) DEFAULT NULL,
  `apelldio` varchar(255) DEFAULT NULL,
  `provincia` tinyblob,
  `apellido` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2icb4ojg57cpbd6koay8tj0k5` (`ubicacion_id`),
  CONSTRAINT `FK2icb4ojg57cpbd6koay8tj0k5` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('ba223898-256d-416c-96a6-7b94997f7929','2021-10-29 15:01:03',NULL,NULL,NULL,NULL,'info@bodegaslopez.com',NULL,'Fernando',NULL,'Bodegas Lopez S.A.','261565415',NULL,NULL,NULL,NULL,'Lopez');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_ubicacion`
--

DROP TABLE IF EXISTS `cliente_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_ubicacion` (
  `cliente_id` varchar(255) NOT NULL,
  `ubicacion_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_fi3umidy8o7rqayceuf698fc5` (`ubicacion_id`),
  KEY `FKeelk9iup3iq8ig0nltbi97a0k` (`cliente_id`),
  CONSTRAINT `FKbofqr8p2j63gw4yqbf3nrq3yn` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKeelk9iup3iq8ig0nltbi97a0k` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_ubicacion`
--

LOCK TABLES `cliente_ubicacion` WRITE;
/*!40000 ALTER TABLE `cliente_ubicacion` DISABLE KEYS */;
INSERT INTO `cliente_ubicacion` VALUES ('ba223898-256d-416c-96a6-7b94997f7929','08e978cd-30bd-4a95-9003-eec44c33e363'),('ba223898-256d-416c-96a6-7b94997f7929','5fcd0e3d-e7d3-46af-aba5-a89925db6272'),('ba223898-256d-416c-96a6-7b94997f7929','89a5b813-ee87-4423-82eb-c68472d8f74e');
/*!40000 ALTER TABLE `cliente_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coincidencia`
--

DROP TABLE IF EXISTS `coincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coincidencia` (
  `id` varchar(255) NOT NULL,
  `aprobado` bit(1) NOT NULL,
  `costo` double DEFAULT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `comision_id` varchar(255) DEFAULT NULL,
  `pedido_id` bigint(20) DEFAULT NULL,
  `transporte_id` varchar(255) DEFAULT NULL,
  `viaje_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbpro0qt7you2nuq870cc4fjna` (`comision_id`),
  KEY `FKe3p6o7n6c5fj36d5ep0q4cq89` (`pedido_id`),
  KEY `FKlsrh25nx2t005l7x4a3l562wj` (`transporte_id`),
  KEY `FKi9al3w4akvevm4ixqwef1osp7` (`viaje_id`),
  CONSTRAINT `FKbpro0qt7you2nuq870cc4fjna` FOREIGN KEY (`comision_id`) REFERENCES `comision` (`id`),
  CONSTRAINT `FKe3p6o7n6c5fj36d5ep0q4cq89` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FKi9al3w4akvevm4ixqwef1osp7` FOREIGN KEY (`viaje_id`) REFERENCES `viaje` (`id`),
  CONSTRAINT `FKlsrh25nx2t005l7x4a3l562wj` FOREIGN KEY (`transporte_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coincidencia`
--

LOCK TABLES `coincidencia` WRITE;
/*!40000 ALTER TABLE `coincidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `coincidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comision`
--

DROP TABLE IF EXISTS `comision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comision` (
  `id` varchar(255) NOT NULL,
  `porcentaje` double DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9b68akmuj0woggv5yqvfg1htb` (`pais_id`),
  CONSTRAINT `FK9b68akmuj0woggv5yqvfg1htb` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comision`
--

LOCK TABLES `comision` WRITE;
/*!40000 ALTER TABLE `comision` DISABLE KEYS */;
/*!40000 ALTER TABLE `comision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_pago`
--

DROP TABLE IF EXISTS `condicion_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicion_pago` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt32l3ti4kjbprocpl59iskp9i` (`pais_id`),
  CONSTRAINT `FKt32l3ti4kjbprocpl59iskp9i` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_pago`
--

LOCK TABLES `condicion_pago` WRITE;
/*!40000 ALTER TABLE `condicion_pago` DISABLE KEYS */;
INSERT INTO `condicion_pago` VALUES ('fc4d4ffc-d635-44c7-afc5-3c54fade304e',NULL,'2021-06-07 14:19:32','Transferencia','2021-06-07 14:19:32',NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `condicion_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion` (
  `id` varchar(255) NOT NULL,
  `activo` bit(1) NOT NULL,
  `grupo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `nombre_amigable` varchar(255) DEFAULT NULL,
  `plantilla` bit(1) NOT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn83887ts9hn02wky3bla4y50l` (`empresa_id`),
  KEY `FKnrm96wka6kktcmv3t8d8ywk17` (`usuario_id`),
  CONSTRAINT `FKn83887ts9hn02wky3bla4y50l` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKnrm96wka6kktcmv3t8d8ywk17` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenedor`
--

DROP TABLE IF EXISTS `contenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenedor` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `ubicacion_entrega_id` varchar(255) DEFAULT NULL,
  `ubicacion_retiro_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhjd4e0pvpwk2532853lh8has8` (`ubicacion_entrega_id`),
  KEY `FKbkwn5ddmvxota7uaaewsxlos9` (`ubicacion_retiro_id`),
  CONSTRAINT `FKbkwn5ddmvxota7uaaewsxlos9` FOREIGN KEY (`ubicacion_retiro_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKhjd4e0pvpwk2532853lh8has8` FOREIGN KEY (`ubicacion_entrega_id`) REFERENCES `ubicacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenedor`
--

LOCK TABLES `contenedor` WRITE;
/*!40000 ALTER TABLE `contenedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenedor_documentacion`
--

DROP TABLE IF EXISTS `contenedor_documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenedor_documentacion` (
  `contenedor_id` varchar(255) NOT NULL,
  `documentacion_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_n206dlko117carhe9nvcis748` (`documentacion_id`),
  KEY `FKee2poswcocdojcokt55wxynb6` (`contenedor_id`),
  CONSTRAINT `FKee2poswcocdojcokt55wxynb6` FOREIGN KEY (`contenedor_id`) REFERENCES `contenedor` (`id`),
  CONSTRAINT `FKmc9ad18c4nopua5pn99825str` FOREIGN KEY (`documentacion_id`) REFERENCES `documentacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenedor_documentacion`
--

LOCK TABLES `contenedor_documentacion` WRITE;
/*!40000 ALTER TABLE `contenedor_documentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenedor_documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contra_oferta`
--

DROP TABLE IF EXISTS `contra_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contra_oferta` (
  `id` varchar(255) NOT NULL,
  `aduana` bit(1) DEFAULT NULL,
  `carteleria_carga_peligrosa` bit(1) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `dias_libres` int(11) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `incluye_bajadaapiso` bit(1) DEFAULT NULL,
  `incluye_iva` bit(1) DEFAULT NULL,
  `is_final` bit(1) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `notificacion` int(11) DEFAULT NULL,
  `seguro_carga` bit(1) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `creador_id` varchar(255) DEFAULT NULL,
  `dador_id` varchar(255) DEFAULT NULL,
  `pedido_id` bigint(20) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `transporte_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkjafqrsxrslsdtiic4ktl7tky` (`creador_id`),
  KEY `FKlqqx5ihiheg0jb4do4b2t7jwr` (`dador_id`),
  KEY `FKafut8w4k57elgrspjj8uydppi` (`pedido_id`),
  KEY `FK17q9p4b30cu4svauj6wbjlykb` (`remolque_id`),
  KEY `FKpame8msdvf4rxnk54679oyhxw` (`transporte_id`),
  KEY `FKhsq6burv7908x94tdij7jsgqo` (`vehiculo_id`),
  CONSTRAINT `FK17q9p4b30cu4svauj6wbjlykb` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FKafut8w4k57elgrspjj8uydppi` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FKhsq6burv7908x94tdij7jsgqo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`),
  CONSTRAINT `FKkjafqrsxrslsdtiic4ktl7tky` FOREIGN KEY (`creador_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKlqqx5ihiheg0jb4do4b2t7jwr` FOREIGN KEY (`dador_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKpame8msdvf4rxnk54679oyhxw` FOREIGN KEY (`transporte_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contra_oferta`
--

LOCK TABLES `contra_oferta` WRITE;
/*!40000 ALTER TABLE `contra_oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `contra_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contra_oferta_requisitos_de_oferta`
--

DROP TABLE IF EXISTS `contra_oferta_requisitos_de_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contra_oferta_requisitos_de_oferta` (
  `contra_oferta_id` varchar(255) NOT NULL,
  `requisitos_de_oferta_id` varchar(255) NOT NULL,
  KEY `FKk72t6rk75w2fpwnjs3s3a57d6` (`requisitos_de_oferta_id`),
  KEY `FKm1iil2buqyhckd0jv8wyrejiy` (`contra_oferta_id`),
  CONSTRAINT `FKk72t6rk75w2fpwnjs3s3a57d6` FOREIGN KEY (`requisitos_de_oferta_id`) REFERENCES `tipo_requisito_oferta` (`id`),
  CONSTRAINT `FKm1iil2buqyhckd0jv8wyrejiy` FOREIGN KEY (`contra_oferta_id`) REFERENCES `contra_oferta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contra_oferta_requisitos_de_oferta`
--

LOCK TABLES `contra_oferta_requisitos_de_oferta` WRITE;
/*!40000 ALTER TABLE `contra_oferta_requisitos_de_oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `contra_oferta_requisitos_de_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentacion`
--

DROP TABLE IF EXISTS `documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentacion` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `vencimiento` datetime DEFAULT NULL,
  `chofer_id` varchar(255) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `tipo_documentacion_id` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  `viaje_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkuceujb618nb68o318lokhuir` (`chofer_id`),
  KEY `FKmlebcliprp5gyy0e6bnduldl5` (`remolque_id`),
  KEY `FKedut1yufdy0kgcq6tqy5gvqhp` (`tipo_documentacion_id`),
  KEY `FKrsl1b706wjogp0pgnbyvslg43` (`usuario_id`),
  KEY `FKlo97rgq1weovp4u7dpnyax9qe` (`vehiculo_id`),
  KEY `FKkjemelbsiiadna6ja1xw5t12g` (`viaje_id`),
  CONSTRAINT `FKedut1yufdy0kgcq6tqy5gvqhp` FOREIGN KEY (`tipo_documentacion_id`) REFERENCES `tipo_documentacion` (`id`),
  CONSTRAINT `FKkjemelbsiiadna6ja1xw5t12g` FOREIGN KEY (`viaje_id`) REFERENCES `viaje` (`id`),
  CONSTRAINT `FKkuceujb618nb68o318lokhuir` FOREIGN KEY (`chofer_id`) REFERENCES `chofer` (`id`),
  CONSTRAINT `FKlo97rgq1weovp4u7dpnyax9qe` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`),
  CONSTRAINT `FKmlebcliprp5gyy0e6bnduldl5` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FKrsl1b706wjogp0pgnbyvslg43` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentacion`
--

LOCK TABLES `documentacion` WRITE;
/*!40000 ALTER TABLE `documentacion` DISABLE KEYS */;
INSERT INTO `documentacion` VALUES ('02f21467-53b2-4b49-bdc6-545ec488e600',NULL,NULL,'2021-07-21 15:13:52','Documentación de Viaje',NULL,NULL,NULL,'3','3',NULL,'02f21467-53b2-4b49-bdc6-545ec488e600'),('0683629e-1a58-487b-8cec-cffd8e828845','Carpeta de Documentos de Carlos  Morco',NULL,'2021-06-10 02:10:37','Chofer Carlos  Morco',NULL,NULL,NULL,NULL,'747b81fb-112a-4f29-adbd-bec9f0946069',NULL,NULL),('095695e4-fced-459f-8215-fcf1815f6632','Carpeta de documentos del vehiculo: Volvo F123 - 2341234',NULL,'2021-09-21 15:49:20','Volvo F123 - 2341234',NULL,NULL,NULL,'1','3',NULL,NULL),('09f1b0cd-5d58-4fd5-ace5-163a4d4489b6','Carpeta de documentos del remolque: AC845LO',NULL,'2021-06-10 02:07:04','AC845LO',NULL,NULL,NULL,'2','3',NULL,NULL),('3865fff8-207e-44eb-ad5d-aed48e450f2d','Carpeta de Documentos de Juan Carlos Cp',NULL,'2021-09-21 16:04:35','Chofer Juan Carlos Cp',NULL,NULL,NULL,NULL,'cf3956f0-337c-4e93-80bc-104f990722da',NULL,NULL),('7e9992bd-96f5-45d2-9050-ce3dba6e9a2e','Carpeta de documentos del vehiculo: Volvo F123 - AF845LL',NULL,'2021-07-12 15:17:10','Volvo F123 - AF845LL',NULL,NULL,NULL,'1','3',NULL,NULL),('8c05b13e-4cd5-45d4-8f0d-bc0858fa6ade','Carpeta de documentos del vehiculo: Volvo F123 - AC845LO',NULL,'2021-06-10 12:54:20','Volvo F123 - AC845LO',NULL,NULL,NULL,'1','3',NULL,NULL),('9b61c423-14da-427f-936d-67ec83bc94b2','Carpeta de documentos del remolque: AC845LM',NULL,'2021-06-10 02:00:34','AC845LM',NULL,NULL,NULL,'2','3',NULL,NULL),('bea493d5-5d0f-4f93-a762-db035e01694a',NULL,NULL,'2021-07-21 14:28:55','Documentación de Viaje',NULL,NULL,NULL,'3','3',NULL,'bea493d5-5d0f-4f93-a762-db035e01694a'),('c5cbdaf0-8c91-4ae1-828d-da97a2ab1958','Carpeta de documentos del vehiculo: Volvo F123 - AC845LL',NULL,'2021-06-10 02:35:51','Volvo F123 - AC845LL',NULL,NULL,NULL,'1','3',NULL,NULL),('c6646cf0-e4d8-445e-a58f-9f7760d99abb','Carpeta de documentos del vehiculo: Volvo F123 - AC845LL',NULL,'2021-06-10 00:28:56','Volvo F123 - AC845LL',NULL,NULL,NULL,'1','3',NULL,NULL),('db898b9f-c13a-4d06-9a23-6a5ab8f4f4ea','Carpeta de documentos del remolque: AAA1122',NULL,'2021-09-21 15:53:35','AAA1122',NULL,NULL,NULL,'2','3',NULL,NULL),('dc1971ea-a75e-4eaf-b2c5-30c7d00eb15c','Carpeta de documentos del vehiculo: Volvo F123 - AC845LL',NULL,'2021-06-10 00:34:05','Volvo F123 - AC845LL',NULL,NULL,NULL,'1','3',NULL,NULL),('e8472dbd-1220-459d-b980-fc59b5993c2f',NULL,NULL,'2021-11-05 12:48:49','Documentación de Viaje',NULL,NULL,NULL,'3','3',NULL,'e8472dbd-1220-459d-b980-fc59b5993c2f');
/*!40000 ALTER TABLE `documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentacion_archivos`
--

DROP TABLE IF EXISTS `documentacion_archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentacion_archivos` (
  `documentacion_id` varchar(255) NOT NULL,
  `archivos` varchar(255) DEFAULT NULL,
  KEY `FKr0kyt4uouiar6rc8w2gd73mxm` (`documentacion_id`),
  CONSTRAINT `FKr0kyt4uouiar6rc8w2gd73mxm` FOREIGN KEY (`documentacion_id`) REFERENCES `documentacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentacion_archivos`
--

LOCK TABLES `documentacion_archivos` WRITE;
/*!40000 ALTER TABLE `documentacion_archivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentacion_archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id` varchar(255) NOT NULL,
  `actividad_principal` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `identificador_fiscal` varchar(255) DEFAULT NULL,
  `identificador_fiscal_verificado` bit(1) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  `ubicacion_id` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `foto` bit(1) NOT NULL,
  `sitio_web` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5u6y4ytpn574g6p4608c9g85i` (`pais_id`),
  KEY `FK5t0tdt455qee1cjkmctb3nds9` (`ubicacion_id`),
  CONSTRAINT `FK5t0tdt455qee1cjkmctb3nds9` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FK5u6y4ytpn574g6p4608c9g85i` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('1',NULL,NULL,NULL,_binary '\0','empresa@gmail','2021-10-22 16:19:36','Empresa45','Empresa S.A.','Empresario','2615442587','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL,NULL,_binary '\0',''),('2','TRANSPORTADOR',NULL,'20123456782',_binary '\0','empresa2@gmail','2021-05-30 00:00:00','Empresa2','Empresa2 S.A.','Empresario2','26154425827','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL,NULL,_binary '\0',NULL),('23c2a2f1-aede-4afc-b61c-a4ffaef73490','AUTONOMO',NULL,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084',NULL,'2021-06-12 14:13:10',_binary '\0',NULL),('3','TRANSPORTADOR',NULL,'201234567894',_binary '\0','empresa2@gmail','2021-05-30 00:00:00','Empresa6','Empresa6 S.A.','Empresario6','26154425827','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL,NULL,_binary '\0',NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_clientes`
--

DROP TABLE IF EXISTS `empresa_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_clientes` (
  `empresa_id` varchar(255) NOT NULL,
  `clientes_id` varchar(255) NOT NULL,
  KEY `FKrf9drq1a8uvqkm73s71tyi8o1` (`clientes_id`),
  KEY `FKbnbxeeho3hc7cja0twiq3ewji` (`empresa_id`),
  CONSTRAINT `FKbnbxeeho3hc7cja0twiq3ewji` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKrf9drq1a8uvqkm73s71tyi8o1` FOREIGN KEY (`clientes_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_clientes`
--

LOCK TABLES `empresa_clientes` WRITE;
/*!40000 ALTER TABLE `empresa_clientes` DISABLE KEYS */;
INSERT INTO `empresa_clientes` VALUES ('1','ba223898-256d-416c-96a6-7b94997f7929');
/*!40000 ALTER TABLE `empresa_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_coincidencias`
--

DROP TABLE IF EXISTS `empresa_coincidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_coincidencias` (
  `empresa_id` varchar(255) NOT NULL,
  `coincidencias_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_68w0vkoca3yrew8k893w37nep` (`coincidencias_id`),
  KEY `FKf9q8v9ficw8q8lt8v6mxuggnv` (`empresa_id`),
  CONSTRAINT `FK98ppdkx8srgyi2ob20bok4g2h` FOREIGN KEY (`coincidencias_id`) REFERENCES `coincidencia` (`id`),
  CONSTRAINT `FKf9q8v9ficw8q8lt8v6mxuggnv` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_coincidencias`
--

LOCK TABLES `empresa_coincidencias` WRITE;
/*!40000 ALTER TABLE `empresa_coincidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_coincidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_favoritos`
--

DROP TABLE IF EXISTS `empresa_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_favoritos` (
  `empresa_id` varchar(255) NOT NULL,
  `favoritos_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_5870onwrf4t95ykmn7rmsu0t` (`favoritos_id`),
  KEY `FK3aqy2nuysskkch7y0057vo8en` (`empresa_id`),
  CONSTRAINT `FK3aqy2nuysskkch7y0057vo8en` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK8t6qp3j7ia5fpf3xdmd2j5hbh` FOREIGN KEY (`favoritos_id`) REFERENCES `favorito` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_favoritos`
--

LOCK TABLES `empresa_favoritos` WRITE;
/*!40000 ALTER TABLE `empresa_favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `aprobado` bit(1) NOT NULL,
  `baja` datetime DEFAULT NULL,
  `completada` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `finalizada` datetime DEFAULT NULL,
  `formulario_id` varchar(255) DEFAULT NULL,
  `producto_id` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  `id_revision` int(11) NOT NULL,
  `modelo_formulario_id` varchar(255) DEFAULT NULL,
  `modelo_encuesta_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93w0kukuq5r8vn0dsiwn35gud` (`formulario_id`),
  KEY `FKt8trjlt5712owagukt4h5yce7` (`producto_id`),
  KEY `FKg069ov8ivy2ovjn70xs8qyvl6` (`usuario_id`),
  KEY `FKb9pp63e8tu9g703g27h252x3f` (`modelo_formulario_id`),
  KEY `FKalaalg6ahhpjr4igudak9bh8i` (`modelo_encuesta_id`),
  CONSTRAINT `FK93w0kukuq5r8vn0dsiwn35gud` FOREIGN KEY (`formulario_id`) REFERENCES `formulario` (`id`),
  CONSTRAINT `FKalaalg6ahhpjr4igudak9bh8i` FOREIGN KEY (`modelo_encuesta_id`) REFERENCES `modelo_encuesta` (`id`),
  CONSTRAINT `FKb9pp63e8tu9g703g27h252x3f` FOREIGN KEY (`modelo_formulario_id`) REFERENCES `modelo_formulario` (`id`),
  CONSTRAINT `FKg069ov8ivy2ovjn70xs8qyvl6` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKt8trjlt5712owagukt4h5yce7` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `iniciado` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `invitado_id` varchar(255) DEFAULT NULL,
  `originario_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1p9g9kjp1sbj2n5xwe09ic97l` (`invitado_id`),
  KEY `FK4x3dcu5q0qg5gqpp7mn47kfe6` (`originario_id`),
  CONSTRAINT `FK1p9g9kjp1sbj2n5xwe09ic97l` FOREIGN KEY (`invitado_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK4x3dcu5q0qg5gqpp7mn47kfe6` FOREIGN KEY (`originario_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hito`
--

DROP TABLE IF EXISTS `hito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hito` (
  `id` varchar(255) NOT NULL,
  `accion` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `km_inicio` int(11) NOT NULL,
  `modificacion` datetime DEFAULT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hito`
--

LOCK TABLES `hito` WRITE;
/*!40000 ALTER TABLE `hito` DISABLE KEYS */;
/*!40000 ALTER TABLE `hito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidente`
--

DROP TABLE IF EXISTS `incidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidente` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `identificador` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `prioridad` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `activo_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqvob0575k1qg37cyh89pue437` (`activo_id`),
  KEY `FKmkoio01bjkp4rcktsasvvpbnb` (`empresa_id`),
  KEY `FKq57joes0veryvb0upm8266n2u` (`remolque_id`),
  KEY `FKee4px6ud237h5ts1hklfh79x1` (`vehiculo_id`),
  CONSTRAINT `FKee4px6ud237h5ts1hklfh79x1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`),
  CONSTRAINT `FKmkoio01bjkp4rcktsasvvpbnb` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKq57joes0veryvb0upm8266n2u` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FKqvob0575k1qg37cyh89pue437` FOREIGN KEY (`activo_id`) REFERENCES `activo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidente`
--

LOCK TABLES `incidente` WRITE;
/*!40000 ALTER TABLE `incidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `creador_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk1es24f3eiwccd7ro798mvbhf` (`creador_id`),
  KEY `FKfggvr14h3x8g1b1w8440hxdi3` (`empresa_id`),
  CONSTRAINT `FKfggvr14h3x8g1b1w8440hxdi3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKk1es24f3eiwccd7ro798mvbhf` FOREIGN KEY (`creador_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('2dff0376-c147-40b6-b131-a40280d82ec4','2021-10-28 23:05:57',NULL,NULL,'Buscar documentación','3','1'),('840406b6-1b0a-4987-aaff-5990bf8f0179','2021-10-28 23:05:57',NULL,NULL,'Cerrar','3','1'),('ecd4b236-319d-4ea7-91a4-58724c46a061','2021-10-28 23:05:57',NULL,NULL,'Controlar palet','3','1');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `id` varchar(255) NOT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `provincia_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK37mbpxuicwnbo878s9djjgr39` (`provincia_id`),
  CONSTRAINT `FK37mbpxuicwnbo878s9djjgr39` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbgmpkdpk9a8lc9w1e05qjte51` (`pais_id`),
  CONSTRAINT `FKbgmpkdpk9a8lc9w1e05qjte51` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES ('c4f90351-2dde-4b27-89e5-a22eee47cc09',NULL,'2021-05-30 23:22:22','Volvo','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `contra_oferta_id` varchar(255) DEFAULT NULL,
  `destinatario_id` varchar(255) DEFAULT NULL,
  `remitente_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9p5y5cd0rkmpgibdd4vo2yow9` (`contra_oferta_id`),
  KEY `FKfi1dp7psgd7wi7n4x7aberitn` (`destinatario_id`),
  KEY `FKdvdwp5crky4couuh3eocowubd` (`remitente_id`),
  CONSTRAINT `FK9p5y5cd0rkmpgibdd4vo2yow9` FOREIGN KEY (`contra_oferta_id`) REFERENCES `contra_oferta` (`id`),
  CONSTRAINT `FKdvdwp5crky4couuh3eocowubd` FOREIGN KEY (`remitente_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKfi1dp7psgd7wi7n4x7aberitn` FOREIGN KEY (`destinatario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `marca_id` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKllxq2dldvhxvb5q9csar7vdfy` (`marca_id`),
  KEY `FK3kkmuslf8k5b7j68yo806501n` (`pais_id`),
  CONSTRAINT `FK3kkmuslf8k5b7j68yo806501n` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  CONSTRAINT `FKllxq2dldvhxvb5q9csar7vdfy` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES ('eb45a3da-f921-4a69-b8e0-e104804a9998','',NULL,'2021-05-30 23:22:59','F123','c4f90351-2dde-4b27-89e5-a22eee47cc09',NULL);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_checklist`
--

DROP TABLE IF EXISTS `modelo_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_checklist` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `creador_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1yuclq8wy7j93dpjajhia7iq6` (`creador_id`),
  KEY `FKhluwsh6mrhhd6843robs8bng0` (`empresa_id`),
  CONSTRAINT `FK1yuclq8wy7j93dpjajhia7iq6` FOREIGN KEY (`creador_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKhluwsh6mrhhd6843robs8bng0` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_checklist`
--

LOCK TABLES `modelo_checklist` WRITE;
/*!40000 ALTER TABLE `modelo_checklist` DISABLE KEYS */;
INSERT INTO `modelo_checklist` VALUES ('effa8205-782b-471b-9731-a75a07527868','2021-10-28 23:05:56',NULL,NULL,'Enviar carga','3','1');
/*!40000 ALTER TABLE `modelo_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_encuesta`
--

DROP TABLE IF EXISTS `modelo_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_encuesta` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_encuesta`
--

LOCK TABLES `modelo_encuesta` WRITE;
/*!40000 ALTER TABLE `modelo_encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_formulario`
--

DROP TABLE IF EXISTS `modelo_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_formulario` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `formulario_id` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKewbo38qw11savwa4904icb30a` (`formulario_id`),
  CONSTRAINT `FKewbo38qw11savwa4904icb30a` FOREIGN KEY (`formulario_id`) REFERENCES `formulario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_formulario`
--

LOCK TABLES `modelo_formulario` WRITE;
/*!40000 ALTER TABLE `modelo_formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo_formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_item`
--

DROP TABLE IF EXISTS `modelo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_item` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `modelo_checklist_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhwgkc0m2xd1uwda0vj0ltxymk` (`item_id`),
  KEY `FKjjijcfnewfkcqovl58w98j97g` (`modelo_checklist_id`),
  CONSTRAINT `FKhwgkc0m2xd1uwda0vj0ltxymk` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FKjjijcfnewfkcqovl58w98j97g` FOREIGN KEY (`modelo_checklist_id`) REFERENCES `modelo_checklist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_item`
--

LOCK TABLES `modelo_item` WRITE;
/*!40000 ALTER TABLE `modelo_item` DISABLE KEYS */;
INSERT INTO `modelo_item` VALUES ('3c98e612-d62e-48c0-877d-8772c38a7c4f','2021-10-28 23:05:57',NULL,NULL,3,'2dff0376-c147-40b6-b131-a40280d82ec4','effa8205-782b-471b-9731-a75a07527868'),('6426deb2-abcc-42c9-995b-e3afb65acb25','2021-10-28 23:05:57',NULL,NULL,1,'ecd4b236-319d-4ea7-91a4-58724c46a061','effa8205-782b-471b-9731-a75a07527868'),('b7e29bb9-5e35-43ac-bcba-5f770288dc21','2021-10-28 23:05:57',NULL,NULL,2,'840406b6-1b0a-4987-aaff-5990bf8f0179','effa8205-782b-471b-9731-a75a07527868');
/*!40000 ALTER TABLE `modelo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moneda` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `simbolo` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbsbnq9da6ek9rucufrmm9v25` (`pais_id`),
  CONSTRAINT `FKbsbnq9da6ek9rucufrmm9v25` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES ('bdb9dd01-49e0-4e33-aa07-a8915cd0db10',NULL,'2021-06-02 18:59:18','Pesos Argentinos','$AR',NULL,NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084'),('bdb9dd01-49e0-4e33-aa07-a8915cd0db11',NULL,'2021-06-02 18:59:18','Pesos Chilenos','CL',NULL,NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084'),('e1b9c7f5-908f-400b-b896-090da2e6ccb9',NULL,'2021-06-02 18:59:02','Pesos Argentinos','$',NULL,'2021-06-02 18:59:07','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `vista` bit(1) NOT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3mk15mys6l07ro6meun3f2tu5` (`empresa_id`),
  KEY `FK5hnclv9lmmc1w4335x04warbm` (`usuario_id`),
  CONSTRAINT `FK3mk15mys6l07ro6meun3f2tu5` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK5hnclv9lmmc1w4335x04warbm` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
INSERT INTO `notificacion` VALUES ('1','2021-06-29 13:32:30',NULL,'Se generó una nueva carga.','NUEVA_COTIZACION','pedido/formularioCarga?accion=actualizar&id=9',_binary '','1','3'),('14','2021-06-29 13:32:30',NULL,'Se generó una nueva carga.','NUEVA_CARGA','pedido/formularioCarga?accion=actualizar&id=9',_binary '','1','3'),('18','2021-06-29 13:32:30',NULL,'Se rechazó la carga.','RECHAZO_CARGA','pedido/formularioCarga?accion=actualizar&id=9',_binary '','1','3'),('195f1ce6-9106-48ce-92db-94199b5be82d','2021-11-10 12:19:44',NULL,'Se generó una nueva carga.',NULL,'pedido/formularioCarga?accion=actualizar&id=14',_binary '\0','1','3'),('271c8a69-c866-4089-8908-2e3aec965cb6','2021-06-29 13:32:30',NULL,'Se generó una nueva carga.','NUEVA_CARGA','pedido/formularioCarga?accion=actualizar&id=9',_binary '\0','1','3'),('2ec836f5-50c5-4fb4-9dc4-92bf40be321a','2021-10-29 15:22:54',NULL,'Se generó una nueva carga.',NULL,'pedido/formularioCarga?accion=actualizar&id=6',_binary '\0','1','3'),('4','2021-06-29 13:32:30',NULL,'Se generó una nueva carga.','NUEVA_CARGA','pedido/formularioCarga?accion=actualizar&id=9',_binary '','1','3'),('45','2021-06-29 13:32:30',NULL,'Se generó una nueva carga.','NUEVA_CARGA','pedido/formularioCarga?accion=actualizar&id=9',_binary '','1','3'),('9','2021-06-29 13:32:30',NULL,'Se generó una nueva carga.','NUEVA_CARGA','pedido/formularioCarga?accion=actualizar&id=9',_binary '','1','3');
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_de_mantenimiento`
--

DROP TABLE IF EXISTS `orden_de_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_mantenimiento` (
  `id` varchar(255) NOT NULL,
  `aprobado_por` varchar(255) DEFAULT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fecha_fin_estimada` datetime DEFAULT NULL,
  `fecha_fin_real` datetime DEFAULT NULL,
  `fecha_inicio_estimada` datetime DEFAULT NULL,
  `fecha_inicio_real` datetime DEFAULT NULL,
  `km_ingreso` int(11) NOT NULL,
  `km_registrados` int(11) NOT NULL,
  `modificacion` datetime DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `nro_orden` varchar(255) DEFAULT NULL,
  `pedida_por` varchar(255) DEFAULT NULL,
  `pedido` varchar(255) DEFAULT NULL,
  `plazo` int(11) NOT NULL,
  `tipoom` varchar(255) DEFAULT NULL,
  `eliminador_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5w4seup92pokgqiie0xiypxo3` (`eliminador_id`),
  KEY `FK8d3pb6w84leqpvdbp9tffm98d` (`empresa_id`),
  KEY `FK6l86cxfxhq59uv5q4edvd48c6` (`remolque_id`),
  KEY `FKo16gqw161wb65emqhm4p0p95i` (`vehiculo_id`),
  CONSTRAINT `FK5w4seup92pokgqiie0xiypxo3` FOREIGN KEY (`eliminador_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK6l86cxfxhq59uv5q4edvd48c6` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FK8d3pb6w84leqpvdbp9tffm98d` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKo16gqw161wb65emqhm4p0p95i` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_mantenimiento`
--

LOCK TABLES `orden_de_mantenimiento` WRITE;
/*!40000 ALTER TABLE `orden_de_mantenimiento` DISABLE KEYS */;
INSERT INTO `orden_de_mantenimiento` VALUES ('7202bf9b-95d2-40cd-8177-988bb5bd7a1a','Federico','Cambio de correa',NULL,'planificada','2021-08-06 13:48:15','0187-05-08 03:00:00',NULL,'0186-05-08 03:00:00',NULL,0,34567,'2021-08-06 14:01:55',NULL,'20214806104815','Carlos',NULL,0,'Interna',NULL,'1',NULL,'7e9992bd-96f5-45d2-9050-ce3dba6e9a2e'),('862445e9-1219-42e3-ae80-43e82da3ace4',NULL,'Cambio de aceiite',NULL,'pendiente','2021-08-04 13:10:45',NULL,NULL,NULL,NULL,0,25000,NULL,NULL,'20211004101045','Carlos',NULL,0,'Interna',NULL,'1',NULL,'7e9992bd-96f5-45d2-9050-ce3dba6e9a2e');
/*!40000 ALTER TABLE `orden_de_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('40686370-15e4-4fd7-b1f7-8b89eddf766d',NULL,'2021-05-30 15:49:31','Brasil'),('9495fb18-bf45-4850-89c1-4aebc461bf15',NULL,'2021-05-30 15:53:03','Perú'),('e3239019-9080-4b50-a49f-5c5c0ebf1331',NULL,'2021-05-30 15:49:17','Chile'),('f37db1b0-d238-446c-9dd0-d8022fd70084',NULL,'2021-05-30 15:49:53','Argentina'),('ff907fcb-f604-42c4-ab9b-d9543dc81da4','2021-05-30 15:49:46','2021-05-30 15:49:37','Perú');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asignadoatransportador` bit(1) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `estado_pedido` varchar(255) DEFAULT NULL,
  `finalizado` bit(1) DEFAULT NULL,
  `is_grupo` bit(1) DEFAULT NULL,
  `km_totales` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nro_interno` varchar(255) DEFAULT NULL,
  `paga_al_transportista` bit(1) DEFAULT NULL,
  `recibir_ofertas` bit(1) DEFAULT NULL,
  `tipo_de_viaje` varchar(255) DEFAULT NULL,
  `tipo_internacional` varchar(255) DEFAULT NULL,
  `tipo_moneda` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `carga_id` varchar(255) DEFAULT NULL,
  `contenedor_id` varchar(255) DEFAULT NULL,
  `dador_id` varchar(255) DEFAULT NULL,
  `dador_usuario_id` varchar(255) DEFAULT NULL,
  `periodo_de_carga_id` varchar(255) DEFAULT NULL,
  `periodo_de_descarga_id` varchar(255) DEFAULT NULL,
  `ubicacion_desde_id` varchar(255) DEFAULT NULL,
  `ubicacion_hasta_id` varchar(255) DEFAULT NULL,
  `moneda_id` varchar(255) DEFAULT NULL,
  `condicion_pago_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1b1qxnrclwv3wkuqxwx52g65j` (`carga_id`),
  KEY `FKbyxnupwjuqbk05lfjfp67lqkc` (`contenedor_id`),
  KEY `FK20mm4fw9sqynksyubvoq3m6y5` (`dador_id`),
  KEY `FKtf65pnntmeppp5cv6ui8co5am` (`dador_usuario_id`),
  KEY `FKfm4e8153yv1lq2dwdfw0idfwt` (`periodo_de_carga_id`),
  KEY `FKtipt0sws7j7q7vlyj950fo2id` (`periodo_de_descarga_id`),
  KEY `FKjpj3fm381e90tbk908m6ctupg` (`ubicacion_desde_id`),
  KEY `FKehk16pmih897upqytjpiw2old` (`ubicacion_hasta_id`),
  KEY `FKhgtqp9c4cpdx50n3m7lgpo3tu` (`moneda_id`),
  KEY `FK12e5el18n0x92hxjd7jgtxoio` (`condicion_pago_id`),
  CONSTRAINT `FK12e5el18n0x92hxjd7jgtxoio` FOREIGN KEY (`condicion_pago_id`) REFERENCES `condicion_pago` (`id`),
  CONSTRAINT `FK1b1qxnrclwv3wkuqxwx52g65j` FOREIGN KEY (`carga_id`) REFERENCES `carga` (`id`),
  CONSTRAINT `FK20mm4fw9sqynksyubvoq3m6y5` FOREIGN KEY (`dador_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKbyxnupwjuqbk05lfjfp67lqkc` FOREIGN KEY (`contenedor_id`) REFERENCES `contenedor` (`id`),
  CONSTRAINT `FKehk16pmih897upqytjpiw2old` FOREIGN KEY (`ubicacion_hasta_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKfm4e8153yv1lq2dwdfw0idfwt` FOREIGN KEY (`periodo_de_carga_id`) REFERENCES `periodo_de_carga` (`id`),
  CONSTRAINT `FKhgtqp9c4cpdx50n3m7lgpo3tu` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`),
  CONSTRAINT `FKjpj3fm381e90tbk908m6ctupg` FOREIGN KEY (`ubicacion_desde_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKtf65pnntmeppp5cv6ui8co5am` FOREIGN KEY (`dador_usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKtipt0sws7j7q7vlyj950fo2id` FOREIGN KEY (`periodo_de_descarga_id`) REFERENCES `periodo_de_carga` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,NULL,'Prueba',NULL,'PUBLICADA',_binary '\0',_binary '\0',NULL,'2021-05-31 00:31:12','656gasd78',NULL,_binary '\0',NULL,NULL,'PESOS_ARG',75000,'12d90388-89e5-49b9-a257-e23aa3bb322f',NULL,'1',NULL,'a878a337-4f54-4871-8544-2f6ceb808592','d1f7f7bd-8972-43f2-a287-21a1146a9d4c','23c654a6-6404-4d29-a669-d19452793e48','8afd540a-9738-42e3-9611-ab61ef081d93',NULL,NULL),(3,NULL,'',NULL,'PUBLICADA',_binary '\0',_binary '\0',NULL,'2021-06-03 03:07:20','asdasd',NULL,NULL,NULL,NULL,NULL,79000,'3a641685-0d04-4d26-9cee-2e3803298055',NULL,'1',NULL,'f0433560-01e3-4cd8-8f40-0c30af4b8aab','4df8f94e-ec8b-499b-a716-a9591f4c126b','8ab0dd22-d3af-4043-a7d9-4b5bc8f689f3','ea650f53-684c-4bd5-bcfb-aa527aaecd6d','bdb9dd01-49e0-4e33-aa07-a8915cd0db11',NULL),(4,NULL,'Prueba 1',NULL,'PUBLICADA',_binary '\0',_binary '\0',NULL,'2021-06-07 13:37:12','123-ac',NULL,NULL,NULL,NULL,NULL,587580,'e3d6e582-3a3c-43ce-bc37-74a48315c6cf',NULL,'1',NULL,'65c58da9-fa9a-4713-b572-a335c09723cd','13e1be95-cba5-47b7-8a70-e89b71ed8ece','c205b6af-105b-4e30-aac2-d98aec56f770','da92358e-d423-4946-859a-f35426126b77','bdb9dd01-49e0-4e33-aa07-a8915cd0db10',NULL),(5,NULL,'Prueba',NULL,'PUBLICADA',_binary '\0',_binary '\0',NULL,'2021-06-12 14:36:30','2514-ac',NULL,NULL,NULL,NULL,NULL,85000,'f5b4204d-645a-4fc9-b5cc-1fc492b9e64c',NULL,'23c2a2f1-aede-4afc-b61c-a4ffaef73490',NULL,'8ee10504-16ff-45d8-ba40-fe4e473521e2','ec5001d5-df7e-4916-b2c9-1a37f8f92cec','6b5435e8-f883-410d-9085-79c94be76574','b7cde4c9-0253-4fe1-bf40-916a67c496cd','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(6,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1485','2021-10-29 15:22:54','2514-ac',NULL,NULL,NULL,NULL,NULL,85000,'c002ec58-b370-4646-9040-40a72eb66f12',NULL,'1',NULL,'a014dd90-ee2a-488c-891d-af9a95cf437c','38bc6609-92d1-4d72-bafa-cd04057b95a3','9e199bca-2680-42e2-8bff-751b18cb46d9','0f41f7b7-bc46-4c10-a089-527d5c29e15a','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(7,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0',NULL,'2021-06-29 13:10:08','2514-ac',NULL,NULL,NULL,NULL,NULL,85000,'5af28562-afa6-4a99-a8a3-ec1b231c1d4f',NULL,'1',NULL,'29a9605a-f810-4305-b94a-5ee9cac0c751','23118475-fc03-4fbf-85c0-70a260876b94','64b81a78-060e-4f0b-8770-08a776d62a61','432eecc7-e908-43d7-9b13-0938b1edef41','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(8,NULL,'',NULL,'PUBLICADA',_binary '\0',_binary '\0',NULL,'2021-06-29 13:12:38','2514-ac',NULL,NULL,NULL,NULL,NULL,85000,'fc99a612-d33f-429f-8cca-62f6c35d797c',NULL,'1',NULL,'92dddc10-a5ca-4177-a4c2-7d99e360a18d','5d7b9ec6-639f-43a7-860c-137e92d3d8bd','2e8b2d80-7a5a-4a26-a2e5-940a4daec35f','758da999-7267-4565-b75a-b06cd369f80e','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(9,NULL,'',NULL,'PUBLICADA',_binary '\0',_binary '\0',NULL,'2021-06-29 13:32:28','2514-acc',NULL,NULL,NULL,NULL,NULL,250000,'bd4720f4-3585-4ab2-bdf3-de927373a773',NULL,'1',NULL,'0d4cb56b-44ee-4981-b6cd-67a9f994366e','32796d53-f4c0-4bff-9ca5-60d00f7bf3bf','4cfef5eb-48fe-4236-9236-8266fc531b74','4bf43f7e-ff19-46f8-b92f-f277e9722177','bdb9dd01-49e0-4e33-aa07-a8915cd0db11','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(10,NULL,'Prueba 1 flota',NULL,'ACORDADA',_binary '\0',_binary '\0',NULL,'2021-07-16 15:14:22','25458',NULL,NULL,NULL,NULL,NULL,85000,'b71d5f7a-c614-4b73-9e6e-6fbd12ef2513',NULL,'1',NULL,'bc42ce0c-912f-4fb4-8cdb-7748f8cf5f3c','43096840-d47f-42f7-be4f-fab49ea121a3','331c22ed-1d5f-46b7-9a66-edcb0447d937','3afcce2f-b2da-47b4-a7d2-9ae4ace946c4','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(11,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0',NULL,'2021-07-18 23:56:15','895748',NULL,NULL,NULL,NULL,NULL,85000,'e9f5409e-a58d-485c-9def-94484ebe9998',NULL,'1',NULL,'0560e921-4d85-4ca6-b230-06ef60dfc269','a680d8bf-7410-4771-b318-e0dfebcdb236','3a01e38b-f18a-40f2-8ea9-f5f36c5ee19e','a0f68db5-eb58-4922-9005-5dd7eca54f66','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(12,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','240','2021-07-19 00:30:01','875dfe',NULL,NULL,NULL,NULL,NULL,54875,'2eb6840a-3ac0-46f0-9d73-4761a0f8f900',NULL,'1',NULL,'26946b70-857e-4553-8299-1a10e6f74fde','6886439e-3af9-4f3e-bf49-b2e8f42fb5f5','cf80225f-17c4-4482-95ad-265941a48a81','d2ff6cc0-f7ff-4c0b-9274-b2a80258d86b','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(13,NULL,'Prueba 1 flota',NULL,'EN_PREPARACION',_binary '\0',_binary '\0',NULL,'2021-07-16 15:14:22','25458',NULL,NULL,NULL,NULL,NULL,85000,'b71d5f7a-c614-4b73-9e6e-6fbd12ef2513',NULL,'1',NULL,'bc42ce0c-912f-4fb4-8cdb-7748f8cf5f3c','43096840-d47f-42f7-be4f-fab49ea121a3','331c22ed-1d5f-46b7-9a66-edcb0447d937','3afcce2f-b2da-47b4-a7d2-9ae4ace946c4','bdb9dd01-49e0-4e33-aa07-a8915cd0db10','fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(14,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','568',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(15,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','1',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(16,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','2',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(17,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','3',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(18,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','4',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(19,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','5',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(20,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','6',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(21,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','7',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(22,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','8',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(23,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','9',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(24,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','10',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(25,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','11',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(26,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','12',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(27,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','13',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(28,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','14',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(29,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','15',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(30,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','16',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(31,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','17',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(32,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','18',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(33,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','19',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e'),(34,NULL,'',NULL,'SIN_ASIGNAR',_binary '\0',_binary '\0','1047','2021-11-10 12:19:44','20',NULL,_binary '',NULL,NULL,NULL,NULL,'b5aab713-3466-462b-983a-3f6f0885c906',NULL,'1',NULL,'6c2ef0c4-57fb-49d7-ae2f-00d783f024be','bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4','a890598d-b520-4848-9b04-8364ae59ec6d','7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,'fc4d4ffc-d635-44c7-afc5-3c54fade304e');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_requisitos`
--

DROP TABLE IF EXISTS `pedido_requisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_requisitos` (
  `pedido_id` bigint(20) NOT NULL,
  `requisitos_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_o40bgvxp7frp1gstfhr183ov5` (`requisitos_id`),
  KEY `FKtfxyqkqu6r3b131mbqm1t14en` (`pedido_id`),
  CONSTRAINT `FKoebpvfxcqd3hklnpu4gbfmhm1` FOREIGN KEY (`requisitos_id`) REFERENCES `requisito` (`id`),
  CONSTRAINT `FKtfxyqkqu6r3b131mbqm1t14en` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_requisitos`
--

LOCK TABLES `pedido_requisitos` WRITE;
/*!40000 ALTER TABLE `pedido_requisitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_requisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo_de_carga`
--

DROP TABLE IF EXISTS `periodo_de_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo_de_carga` (
  `id` varchar(255) NOT NULL,
  `carga_nocturna` bit(1) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `finalizacion` varchar(255) DEFAULT NULL,
  `hora_finalizacion` varchar(255) DEFAULT NULL,
  `hora_inicio` varchar(255) DEFAULT NULL,
  `inicio` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo_de_carga`
--

LOCK TABLES `periodo_de_carga` WRITE;
/*!40000 ALTER TABLE `periodo_de_carga` DISABLE KEYS */;
INSERT INTO `periodo_de_carga` VALUES ('0560e921-4d85-4ca6-b230-06ef60dfc269',NULL,'',NULL,'2021-07-19','12:00','10:00','2021-07-19','2021-07-18 23:56:15'),('0d4cb56b-44ee-4981-b6cd-67a9f994366e',NULL,'',NULL,'2021-07-05','12:00','10:00','2021-07-05','2021-06-29 13:32:28'),('13e1be95-cba5-47b7-8a70-e89b71ed8ece',NULL,'',NULL,'2021-06-17','16:00','12:00','2021-06-17','2021-06-07 13:37:12'),('23118475-fc03-4fbf-85c0-70a260876b94',NULL,'',NULL,'2021-07-04','12:00','08:00','2021-07-04','2021-06-29 13:10:08'),('26946b70-857e-4553-8299-1a10e6f74fde',NULL,'',NULL,'2021-07-20','10:00','08:00','2021-07-20','2021-07-19 00:30:01'),('29a9605a-f810-4305-b94a-5ee9cac0c751',NULL,'',NULL,'2021-07-01','12:00','08:00','2021-07-01','2021-06-29 13:10:08'),('32796d53-f4c0-4bff-9ca5-60d00f7bf3bf',NULL,'',NULL,'2021-07-10','20:00','16:00','2021-07-10','2021-06-29 13:32:28'),('38bc6609-92d1-4d72-bafa-cd04057b95a3',NULL,'',NULL,'2021-07-04','12:00','08:00','2021-07-04','2021-10-29 15:22:54'),('43096840-d47f-42f7-be4f-fab49ea121a3',NULL,'',NULL,'2021-07-21','10:00','08:00','2021-07-21','2021-07-16 15:14:22'),('4df8f94e-ec8b-499b-a716-a9591f4c126b',NULL,'',NULL,'2021-06-11','12:00','08:00','2021-06-11','2021-06-03 03:07:20'),('5d7b9ec6-639f-43a7-860c-137e92d3d8bd',NULL,'',NULL,'2021-07-04','12:00','08:00','2021-07-04','2021-06-29 13:12:38'),('65c58da9-fa9a-4713-b572-a335c09723cd',NULL,'',NULL,'2021-06-14','12:00','08:00','2021-06-14','2021-06-07 13:37:12'),('6886439e-3af9-4f3e-bf49-b2e8f42fb5f5',NULL,'',NULL,'2021-07-20','20:00','18:00','2021-07-20','2021-07-19 00:30:01'),('6c2ef0c4-57fb-49d7-ae2f-00d783f024be',NULL,'',NULL,'2021-11-15','10:00','08:00','2021-11-15','2021-11-10 12:19:44'),('8ee10504-16ff-45d8-ba40-fe4e473521e2',NULL,'',NULL,'2021-06-26','12:00','08:00','2021-06-26','2021-06-12 14:36:30'),('92dddc10-a5ca-4177-a4c2-7d99e360a18d',NULL,'',NULL,'2021-07-01','12:00','08:00','2021-07-01','2021-06-29 13:12:38'),('a014dd90-ee2a-488c-891d-af9a95cf437c',NULL,'',NULL,'2021-07-01','12:00','08:00','2021-07-01','2021-10-29 15:22:54'),('a680d8bf-7410-4771-b318-e0dfebcdb236',NULL,'',NULL,'2021-07-21','10:00','08:00','2021-07-21','2021-07-18 23:56:15'),('a878a337-4f54-4871-8544-2f6ceb808592',NULL,'',NULL,'2021-06-06','12:00','08:00','2021-06-06','2021-05-31 00:31:12'),('bc42ce0c-912f-4fb4-8cdb-7748f8cf5f3c',NULL,'',NULL,'2021-07-19','10:00','08:00','2021-07-19','2021-07-16 15:14:22'),('bf87bbaf-7f1b-4e34-9d1e-4cea7f1d55d4',NULL,'',NULL,'2021-11-17','14:00','12:00','2021-11-17','2021-11-10 12:19:44'),('d1f7f7bd-8972-43f2-a287-21a1146a9d4c',NULL,'',NULL,'2021-06-09','20:00','10:00','2021-06-09','2021-05-31 00:31:12'),('ec5001d5-df7e-4916-b2c9-1a37f8f92cec',NULL,'',NULL,'2021-06-29','16:00','12:00','2021-06-29','2021-06-12 14:36:30'),('f0433560-01e3-4cd8-8f40-0c30af4b8aab',NULL,'',NULL,'2021-06-09','12:00','08:00','2021-06-09','2021-06-03 03:07:20');
/*!40000 ALTER TABLE `periodo_de_carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `id` varchar(255) NOT NULL,
  `administrador` bit(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `nombre_amigable` varchar(255) DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES ('0001',_binary '\0','Ver cargas activas','VER_CAR_ACT',NULL),('0002',_binary '\0','Ver historial','VER_CAR_HIST',NULL),('0003',_binary '\0','Ver mapa','VER_CAR_MAPA',NULL),('0004',_binary '\0','Notificaciones','VER_CAR_NOTIF',NULL),('1',_binary '','Prueba','PRU',NULL);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id` varchar(255) NOT NULL,
  `accion` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `condicion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `hito` varchar(255) DEFAULT NULL,
  `identificador` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `activo_id` varchar(255) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  `plantilla` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5m206jh3nkuj6clhmeb29d75h` (`empresa_id`),
  KEY `FK1f4cydb2k32q8v24cp8vw77sy` (`activo_id`),
  KEY `FK17hndeeyn0ndlo63y1o10jqdg` (`remolque_id`),
  KEY `FK88tmry3ajslysypoqm7bc5bb` (`vehiculo_id`),
  CONSTRAINT `FK17hndeeyn0ndlo63y1o10jqdg` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FK1f4cydb2k32q8v24cp8vw77sy` FOREIGN KEY (`activo_id`) REFERENCES `activo` (`id`),
  CONSTRAINT `FK5m206jh3nkuj6clhmeb29d75h` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FK88tmry3ajslysypoqm7bc5bb` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_hito`
--

DROP TABLE IF EXISTS `plan_hito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_hito` (
  `plan_id` varchar(255) NOT NULL,
  `hito_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_7lnvttcvodclmn4yssvfyhvd5` (`hito_id`),
  KEY `FKfg4nyt0a1ha98l9jss3ch0guw` (`plan_id`),
  CONSTRAINT `FKfg4nyt0a1ha98l9jss3ch0guw` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`),
  CONSTRAINT `FKl2tt3cmnnwuq3ulep7uqwuej7` FOREIGN KEY (`hito_id`) REFERENCES `hito` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_hito`
--

LOCK TABLES `plan_hito` WRITE;
/*!40000 ALTER TABLE `plan_hito` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_hito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_hitos`
--

DROP TABLE IF EXISTS `plan_hitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_hitos` (
  `plan_id` varchar(255) NOT NULL,
  `hitos_id` varchar(255) NOT NULL,
  KEY `FK5kmc9qijljxppl0rxtgw7u3rl` (`hitos_id`),
  KEY `FKexj719devsfeifu39pn4de16r` (`plan_id`),
  CONSTRAINT `FK5kmc9qijljxppl0rxtgw7u3rl` FOREIGN KEY (`hitos_id`) REFERENCES `hito` (`id`),
  CONSTRAINT `FKexj719devsfeifu39pn4de16r` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_hitos`
--

LOCK TABLES `plan_hitos` WRITE;
/*!40000 ALTER TABLE `plan_hitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_hitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `id` varchar(255) NOT NULL,
  `acepta_archivos` bit(1) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `file` longblob,
  `modificacion` datetime DEFAULT NULL,
  `obligatoria` bit(1) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `respuestas` varchar(5000) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `modelo_formulario_id` varchar(255) DEFAULT NULL,
  `area_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6w6oy3xq1cl69lmtlkwaadbxr` (`modelo_formulario_id`),
  KEY `FKmoa5tbv9f5fj64vddh5x2pr2s` (`area_id`),
  CONSTRAINT `FK6w6oy3xq1cl69lmtlkwaadbxr` FOREIGN KEY (`modelo_formulario_id`) REFERENCES `modelo_formulario` (`id`),
  CONSTRAINT `FKmoa5tbv9f5fj64vddh5x2pr2s` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKchmdwqmuycpu094qohx5n90a` (`pais_id`),
  CONSTRAINT `FKchmdwqmuycpu094qohx5n90a` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('f7d63d02-3520-4725-8b8e-62e3b58bc7ef','',NULL,'2021-05-31 00:28:50','Granos','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm4s599988w0v1q1nw6dyo5t2m` (`pais_id`),
  CONSTRAINT `FKm4s599988w0v1q1nw6dyo5t2m` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punto_ubicacion`
--

DROP TABLE IF EXISTS `punto_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `punto_ubicacion` (
  `id` varchar(255) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `viaje_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKppnxfikxijjpvcm295evjj2q1` (`viaje_id`),
  CONSTRAINT `FKppnxfikxijjpvcm295evjj2q1` FOREIGN KEY (`viaje_id`) REFERENCES `viaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_ubicacion`
--

LOCK TABLES `punto_ubicacion` WRITE;
/*!40000 ALTER TABLE `punto_ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `punto_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remolque`
--

DROP TABLE IF EXISTS `remolque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remolque` (
  `id` varchar(255) NOT NULL,
  `anio_fabricacion` varchar(255) DEFAULT NULL,
  `dominio` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `tipo_remolque_id` varchar(255) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `estado_remolque` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcvs0c0sm66djej9l46jmggmm8` (`empresa_id`),
  KEY `FK123it0mwkbypc08dcc5wvb5bm` (`tipo_remolque_id`),
  CONSTRAINT `FK123it0mwkbypc08dcc5wvb5bm` FOREIGN KEY (`tipo_remolque_id`) REFERENCES `tipo_remolque` (`id`),
  CONSTRAINT `FKcvs0c0sm66djej9l46jmggmm8` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remolque`
--

LOCK TABLES `remolque` WRITE;
/*!40000 ALTER TABLE `remolque` DISABLE KEYS */;
INSERT INTO `remolque` VALUES ('09f1b0cd-5d58-4fd5-ace5-163a4d4489b6','2020','AC845LO',NULL,'2021-08-06 14:11:19','1','c1275089-db5d-47a5-936c-2c3eea9085ff',_binary '',NULL,NULL),('9b61c423-14da-427f-936d-67ec83bc94b2','2018','AC845LM',NULL,'2021-08-06 14:11:21','1','c1275089-db5d-47a5-936c-2c3eea9085ff',_binary '',NULL,NULL),('db898b9f-c13a-4d06-9a23-6a5ab8f4f4ea','1992','AAA1122',NULL,'2021-09-21 15:53:35','1','c1275089-db5d-47a5-936c-2c3eea9085ff',_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `remolque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_vehiculo`
--

DROP TABLE IF EXISTS `reporte_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte_vehiculo` (
  `id` varchar(255) NOT NULL,
  `documentacion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `kilometros` int(11) NOT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKre2gxcw0hla4s6asyuc5acv68` (`vehiculo_id`),
  CONSTRAINT `FKre2gxcw0hla4s6asyuc5acv68` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_vehiculo`
--

LOCK TABLES `reporte_vehiculo` WRITE;
/*!40000 ALTER TABLE `reporte_vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisito`
--

DROP TABLE IF EXISTS `requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisito` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisito`
--

LOCK TABLES `requisito` WRITE;
/*!40000 ALTER TABLE `requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `id` varchar(255) NOT NULL,
  `aclaracion` varchar(255) DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `detalle` bit(1) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `file` longblob,
  `texto` varchar(255) DEFAULT NULL,
  `encuesta_id` varchar(255) DEFAULT NULL,
  `pregunta_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcv5goto7n0engg6a3ex7obyng` (`encuesta_id`),
  KEY `FKd9oyrwyjw1otr38btjeevanif` (`pregunta_id`),
  CONSTRAINT `FKcv5goto7n0engg6a3ex7obyng` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`),
  CONSTRAINT `FKd9oyrwyjw1otr38btjeevanif` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_item`
--

DROP TABLE IF EXISTS `respuesta_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta_item` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `checked` bit(1) NOT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `checklist_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgn50oesughd2avmnmlygcxn7h` (`checklist_id`),
  KEY `FK5avo8nafy3so3rfal6rqh9cth` (`empresa_id`),
  KEY `FKe74ms0mogs7d30da1pbtqvg8d` (`item_id`),
  CONSTRAINT `FK5avo8nafy3so3rfal6rqh9cth` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKe74ms0mogs7d30da1pbtqvg8d` FOREIGN KEY (`item_id`) REFERENCES `modelo_item` (`id`),
  CONSTRAINT `FKgn50oesughd2avmnmlygcxn7h` FOREIGN KEY (`checklist_id`) REFERENCES `checklist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_item`
--

LOCK TABLES `respuesta_item` WRITE;
/*!40000 ALTER TABLE `respuesta_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` varchar(255) NOT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `is_admin` bit(1) NOT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `creador_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmd6tsieisxwnhe66k147ics5w` (`creador_id`),
  KEY `FKhqf7i4x8hnad5gfbsgdw6wp33` (`empresa_id`),
  CONSTRAINT `FKhqf7i4x8hnad5gfbsgdw6wp33` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKmd6tsieisxwnhe66k147ics5w` FOREIGN KEY (`creador_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES ('1','2021-05-30 00:00:00',NULL,_binary '',NULL,'Administrador',NULL,NULL),('2','2021-05-30 00:00:00',NULL,_binary '',NULL,'Administrador Local',NULL,NULL),('3','2021-05-30 00:00:00',NULL,_binary '',NULL,'Sin rol',NULL,NULL),('4','2021-05-30 00:00:00',NULL,_binary '',NULL,'Invitado',NULL,NULL),('5','2021-05-30 00:00:00',NULL,_binary '',NULL,'Chofer',NULL,NULL),('6','2021-05-30 00:00:00',NULL,_binary '',NULL,'Administrador Pais',NULL,NULL);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permisos`
--

DROP TABLE IF EXISTS `rol_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permisos` (
  `rol_id` varchar(255) NOT NULL,
  `permisos_id` varchar(255) NOT NULL,
  KEY `FK6yitn3asyxpc4f2ad3108ttqd` (`permisos_id`),
  KEY `FKsm8nhys123yjn6ky9hsyxg4jq` (`rol_id`),
  CONSTRAINT `FK6yitn3asyxpc4f2ad3108ttqd` FOREIGN KEY (`permisos_id`) REFERENCES `permiso` (`id`),
  CONSTRAINT `FKsm8nhys123yjn6ky9hsyxg4jq` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permisos`
--

LOCK TABLES `rol_permisos` WRITE;
/*!40000 ALTER TABLE `rol_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripcion` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `abono_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKey1ogwy8o5p8fxfq33hhsfpn0` (`abono_id`),
  KEY `FKl55ndqndfmixt5i08d1utlnce` (`empresa_id`),
  CONSTRAINT `FKey1ogwy8o5p8fxfq33hhsfpn0` FOREIGN KEY (`abono_id`) REFERENCES `abono` (`id`),
  CONSTRAINT `FKl55ndqndfmixt5i08d1utlnce` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripcion`
--

LOCK TABLES `suscripcion` WRITE;
/*!40000 ALTER TABLE `suscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_carga`
--

DROP TABLE IF EXISTS `tipo_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_carga` (
  `id` varchar(255) NOT NULL,
  `caracteristicas` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcfrysfpm9j8mm4pasda3yx8qc` (`pais_id`),
  CONSTRAINT `FKcfrysfpm9j8mm4pasda3yx8qc` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_carga`
--

LOCK TABLES `tipo_carga` WRITE;
/*!40000 ALTER TABLE `tipo_carga` DISABLE KEYS */;
INSERT INTO `tipo_carga` VALUES ('566ccdb2-ffc3-4465-b931-6e26a64d3140','Sólida','',NULL,'2021-05-30 23:47:11','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `tipo_carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contenedor`
--

DROP TABLE IF EXISTS `tipo_contenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_contenedor` (
  `id` varchar(255) NOT NULL,
  `caracteristicas` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4pcq70mhviitnu5tejgxc78jg` (`pais_id`),
  CONSTRAINT `FK4pcq70mhviitnu5tejgxc78jg` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contenedor`
--

LOCK TABLES `tipo_contenedor` WRITE;
/*!40000 ALTER TABLE `tipo_contenedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_contenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documentacion`
--

DROP TABLE IF EXISTS `tipo_documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documentacion` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `obligatorio_chofer` bit(1) DEFAULT NULL,
  `obligatorio_remolque` bit(1) DEFAULT NULL,
  `obligatorio_vehiculo` bit(1) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrrgesmyxholmuyfjmia54bh0p` (`pais_id`),
  KEY `FK8c6uq8bf8lpnlhfjuu2k9rsm` (`empresa_id`),
  CONSTRAINT `FK8c6uq8bf8lpnlhfjuu2k9rsm` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKrrgesmyxholmuyfjmia54bh0p` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documentacion`
--

LOCK TABLES `tipo_documentacion` WRITE;
/*!40000 ALTER TABLE `tipo_documentacion` DISABLE KEYS */;
INSERT INTO `tipo_documentacion` VALUES ('0','',NULL,'2021-05-16 22:17:03','Chofer',_binary '',_binary '\0',_binary '\0','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL),('1','',NULL,'2021-05-16 22:17:03','Vehículo',_binary '\0',_binary '\0',_binary '','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL),('2','',NULL,'2021-05-16 22:17:03','Remolque',_binary '\0',_binary '',_binary '\0','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL),('20cf94cc-b8a5-4d27-85c5-b6337f41cd7f','',NULL,'2021-05-30 22:48:18','Seguro',_binary '\0',_binary '',_binary '','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL),('3','',NULL,'2021-05-16 22:17:03','Viaje',_binary '\0',_binary '',_binary '\0','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL),('f406d1fa-42e5-4458-8a64-188e2cf75589','',NULL,'2021-05-30 17:02:20','Carnet de conducir',_binary '',_binary '\0',_binary '\0','f37db1b0-d238-446c-9dd0-d8022fd70084',NULL);
/*!40000 ALTER TABLE `tipo_documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2gut6cga93an3f576rp7ot3h1` (`pais_id`),
  CONSTRAINT `FK2gut6cga93an3f576rp7ot3h1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_embalaje`
--

DROP TABLE IF EXISTS `tipo_embalaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_embalaje` (
  `id` varchar(255) NOT NULL,
  `caracteristicas` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKggdsnp24o3cej1uebh1ws7hpp` (`pais_id`),
  CONSTRAINT `FKggdsnp24o3cej1uebh1ws7hpp` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_embalaje`
--

LOCK TABLES `tipo_embalaje` WRITE;
/*!40000 ALTER TABLE `tipo_embalaje` DISABLE KEYS */;
INSERT INTO `tipo_embalaje` VALUES ('db519441-c4a4-4a96-8981-b8679510f18b','Palet doble','',NULL,'2021-05-31 00:21:44','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `tipo_embalaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_remolque`
--

DROP TABLE IF EXISTS `tipo_remolque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_remolque` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnk4lx3trkjigyr0pkn0ohosg` (`pais_id`),
  CONSTRAINT `FKbnk4lx3trkjigyr0pkn0ohosg` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_remolque`
--

LOCK TABLES `tipo_remolque` WRITE;
/*!40000 ALTER TABLE `tipo_remolque` DISABLE KEYS */;
INSERT INTO `tipo_remolque` VALUES ('c1275089-db5d-47a5-936c-2c3eea9085ff',NULL,'2021-05-30 23:40:42','Encarpado','f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `tipo_remolque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_requisito_oferta`
--

DROP TABLE IF EXISTS `tipo_requisito_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_requisito_oferta` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `obligatorio_oferta` bit(1) DEFAULT NULL,
  `obligatorio_pedido` bit(1) DEFAULT NULL,
  `tipo_de_viaje` int(11) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcp50frjeg5rdguu5abocgqmdh` (`pais_id`),
  CONSTRAINT `FKcp50frjeg5rdguu5abocgqmdh` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_requisito_oferta`
--

LOCK TABLES `tipo_requisito_oferta` WRITE;
/*!40000 ALTER TABLE `tipo_requisito_oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_requisito_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vehiculo` (
  `id` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo`
--

LOCK TABLES `tipo_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo` VALUES ('aaa66f01-73a2-4bd9-ae64-de07530a8381','Carguero',NULL,'2021-06-12 14:49:59','Carguero'),('fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92','Tipo1',NULL,'2021-06-12 14:51:11','Tipo1');
/*!40000 ALTER TABLE `tipo_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo_accesorios`
--

DROP TABLE IF EXISTS `tipo_vehiculo_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vehiculo_accesorios` (
  `tipo_vehiculo_id` varchar(255) NOT NULL,
  `accesorios_id` varchar(255) NOT NULL,
  KEY `FKqychhwmokja39cr4xmx3h061y` (`accesorios_id`),
  KEY `FKfwbpcg7q5d6xts88hlv64v0by` (`tipo_vehiculo_id`),
  CONSTRAINT `FKfwbpcg7q5d6xts88hlv64v0by` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`),
  CONSTRAINT `FKqychhwmokja39cr4xmx3h061y` FOREIGN KEY (`accesorios_id`) REFERENCES `accesorio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo_accesorios`
--

LOCK TABLES `tipo_vehiculo_accesorios` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo_accesorios` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo_accesorios` VALUES ('aaa66f01-73a2-4bd9-ae64-de07530a8381','d8acf1ea-b014-463a-b80c-26c70f7f2f4b'),('fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92','d8acf1ea-b014-463a-b80c-26c70f7f2f4b');
/*!40000 ALTER TABLE `tipo_vehiculo_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo_caracteristicas`
--

DROP TABLE IF EXISTS `tipo_vehiculo_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vehiculo_caracteristicas` (
  `tipo_vehiculo_id` varchar(255) NOT NULL,
  `caracteristicas_id` varchar(255) NOT NULL,
  KEY `FKfsooerp4nedc9vc56evkiiq6m` (`caracteristicas_id`),
  KEY `FKcvdfr28fuf9va7tchfcenum1h` (`tipo_vehiculo_id`),
  CONSTRAINT `FKcvdfr28fuf9va7tchfcenum1h` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`),
  CONSTRAINT `FKfsooerp4nedc9vc56evkiiq6m` FOREIGN KEY (`caracteristicas_id`) REFERENCES `caracteristica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo_caracteristicas`
--

LOCK TABLES `tipo_vehiculo_caracteristicas` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo_caracteristicas` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo_caracteristicas` VALUES ('fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92','6830d16b-2ff3-4679-acc5-f0253c1e197c');
/*!40000 ALTER TABLE `tipo_vehiculo_caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo_remolques`
--

DROP TABLE IF EXISTS `tipo_vehiculo_remolques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vehiculo_remolques` (
  `tipo_vehiculo_id` varchar(255) NOT NULL,
  `remolques_id` varchar(255) NOT NULL,
  KEY `FKldierckogvdexiqxkvdwetv32` (`remolques_id`),
  KEY `FKdro5f8ssxrfaufpanrkjg81pi` (`tipo_vehiculo_id`),
  CONSTRAINT `FKdro5f8ssxrfaufpanrkjg81pi` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`),
  CONSTRAINT `FKldierckogvdexiqxkvdwetv32` FOREIGN KEY (`remolques_id`) REFERENCES `tipo_remolque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo_remolques`
--

LOCK TABLES `tipo_vehiculo_remolques` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo_remolques` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo_remolques` VALUES ('fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92','c1275089-db5d-47a5-936c-2c3eea9085ff');
/*!40000 ALTER TABLE `tipo_vehiculo_remolques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `id` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe1kkvg74q08qk5dwrcmpa12kv` (`usuario_id`),
  CONSTRAINT `FKe1kkvg74q08qk5dwrcmpa12kv` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `id` varchar(255) NOT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `is_master_point` bit(1) DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd1yu93rd5g1xnu636mqwol755` (`pais_id`),
  CONSTRAINT `FKd1yu93rd5g1xnu636mqwol755` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES ('08e978cd-30bd-4a95-9003-eec44c33e363',NULL,NULL,'Salta 500',NULL,NULL,NULL,NULL,NULL,NULL,'Galpón'),('0f41f7b7-bc46-4c10-a089-527d5c29e15a',NULL,NULL,'Salta 564, Corrientes, Argentina',NULL,NULL,-27.4635521,-58.83893789999999,'2021-06-29 13:08:23',NULL,NULL),('23c654a6-6404-4d29-a669-d19452793e48',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-05-31 00:31:12',NULL,NULL),('2e8b2d80-7a5a-4a26-a2e5-940a4daec35f',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-06-29 13:12:38',NULL,NULL),('331c22ed-1d5f-46b7-9a66-edcb0447d937',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-07-16 15:14:22',NULL,NULL),('3a01e38b-f18a-40f2-8ea9-f5f36c5ee19e',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-07-18 23:56:15',NULL,NULL),('3afcce2f-b2da-47b4-a7d2-9ae4ace946c4',NULL,NULL,'San Martín 500, Córdoba, Argentina',NULL,NULL,-31.4102857,-64.1815183,'2021-07-16 15:14:22',NULL,NULL),('432eecc7-e908-43d7-9b13-0938b1edef41',NULL,NULL,'Corrientes 654, Salta, Argentina',NULL,NULL,-24.8009631,-65.4127888,'2021-06-29 13:10:09',NULL,NULL),('4bf43f7e-ff19-46f8-b92f-f277e9722177',NULL,NULL,'Avenida San Martín 500, Ushuaia, Tierra del Fuego, Argentina',NULL,NULL,-54.8064584,-68.3050651,'2021-06-29 13:32:28',NULL,NULL),('4cfef5eb-48fe-4236-9236-8266fc531b74',NULL,NULL,'Islas Orcadas 59, Mendoza, Argentina',NULL,NULL,-32.8690052,-68.84546569999999,'2021-06-29 13:32:28',NULL,NULL),('5fcd0e3d-e7d3-46af-aba5-a89925db6272',NULL,NULL,'Ruta SN, Altamira',NULL,NULL,NULL,NULL,NULL,NULL,'Finca Valle de Uco'),('64b81a78-060e-4f0b-8770-08a776d62a61',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-06-29 13:10:09',NULL,NULL),('6b5435e8-f883-410d-9085-79c94be76574',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-06-12 14:36:30',NULL,NULL),('758da999-7267-4565-b75a-b06cd369f80e',NULL,NULL,'Corrientes 543, Salta, Argentina',NULL,NULL,-24.8014705,-65.411273,'2021-06-29 13:12:38',NULL,NULL),('7d40e5a2-47da-488d-b78f-75d42d27eb4b',NULL,NULL,'Salta 500, Buenos Aires, Argentina',NULL,NULL,-34.6143238,-58.38298609999999,'2021-11-10 12:19:44',NULL,NULL),('89a5b813-ee87-4423-82eb-c68472d8f74e',NULL,NULL,'290 san martin st','2021-10-29 15:19:58',NULL,NULL,NULL,NULL,NULL,'Finca Valle de Uco'),('8ab0dd22-d3af-4043-a7d9-4b5bc8f689f3',NULL,NULL,'Catamarca 456, GMI, Mendoza, Argentina',NULL,NULL,-32.88998059999999,-68.83209959999999,'2021-06-03 02:58:07',NULL,NULL),('8afd540a-9738-42e3-9611-ab61ef081d93',NULL,NULL,'San Luis 675, Resistencia, Chaco, Argentina',NULL,NULL,-27.4549483,-59.01866319999999,'2021-05-31 00:31:12',NULL,NULL),('9e199bca-2680-42e2-8bff-751b18cb46d9',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-06-29 13:08:23',NULL,NULL),('a0f68db5-eb58-4922-9005-5dd7eca54f66',NULL,NULL,'Islas Orcadas 50, Río Cuarto, Córdoba, Argentina',NULL,NULL,-33.1054994,-64.3851048,'2021-07-18 23:56:15',NULL,NULL),('a890598d-b520-4848-9b04-8364ae59ec6d',NULL,NULL,'Salta 500, Mendoza, Argentina',NULL,NULL,-32.8978849,-68.83540649999999,'2021-11-10 12:19:44',NULL,NULL),('b7cde4c9-0253-4fe1-bf40-916a67c496cd',NULL,NULL,'Islas Orcadas 50, General Roca, Río Negro, Argentina',NULL,NULL,-39.0087453,-67.5885578,'2021-06-12 14:36:30',NULL,NULL),('c205b6af-105b-4e30-aac2-d98aec56f770',NULL,NULL,'San Luis 5642, Rosario, Santa Fe, Argentina',NULL,NULL,-32.9395061,-60.7004591,'2021-06-07 13:34:18',NULL,NULL),('cf80225f-17c4-4482-95ad-265941a48a81',NULL,NULL,'Islas Orcadas 50, Mendoza, Argentina',NULL,NULL,-32.8693112,-68.845507,'2021-07-19 00:30:01',NULL,NULL),('d2ff6cc0-f7ff-4c0b-9274-b2a80258d86b',NULL,NULL,'Islas Orcadas 50, San Rafael, Mendoza, Argentina',NULL,NULL,-34.6337018,-68.33781739999999,'2021-07-19 00:30:01',NULL,NULL),('da92358e-d423-4946-859a-f35426126b77',NULL,NULL,'San Luis 5642, Mendoza, Argentina',NULL,NULL,-32.88487,-68.83259,'2021-06-07 13:34:18',NULL,NULL),('ea650f53-684c-4bd5-bcfb-aa527aaecd6d',NULL,NULL,'Catamarca 456, Córdoba, Argentina',NULL,NULL,-31.4133727,-64.1755167,'2021-06-03 02:58:07',NULL,NULL);
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7qrwbm3gx1hncqtjt2oup17ep` (`pais_id`),
  CONSTRAINT `FK7qrwbm3gx1hncqtjt2oup17ep` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES ('78ba7326-d561-4165-8fbc-7808436ff7c7',NULL,'2021-06-02 19:02:59','Tonelada',NULL,'2021-06-02 19:03:19','f37db1b0-d238-446c-9dd0-d8022fd70084'),('b3abbafb-91ab-4ef0-9c3a-3c5b3d926574',NULL,'2021-06-02 19:03:29','Tonelada',NULL,NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084'),('b3abbafb-91ab-4ef0-9c3a-3c5b3d926575',NULL,'2021-06-02 19:03:29','Kg',NULL,NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` varchar(255) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `foto` bit(1) NOT NULL,
  `identificador` varchar(255) DEFAULT NULL,
  `identificador_verificado` bit(1) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `ultimo_recuperar_clave` datetime DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `pais_id` varchar(255) DEFAULT NULL,
  `rol_id` varchar(255) DEFAULT NULL,
  `ubicacion_id` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK87ckfs30l64gnivnfk7ywp8l6` (`empresa_id`),
  KEY `FKh0bn1twwge5vlrrmmi3uc0sce` (`pais_id`),
  KEY `FKshkwj12wg6vkm6iuwhvcfpct8` (`rol_id`),
  KEY `FKe4m36dhsdi5xrrfbj42qssteq` (`ubicacion_id`),
  CONSTRAINT `FK87ckfs30l64gnivnfk7ywp8l6` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKe4m36dhsdi5xrrfbj42qssteq` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKh0bn1twwge5vlrrmmi3uc0sce` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  CONSTRAINT `FKshkwj12wg6vkm6iuwhvcfpct8` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('044baa2a-41f9-4e8a-aac0-993174543025','7','$2a$10$WhBTH3tKn4y1Llgc0ps2b.xxG8w8CPkqLxc8hpDvr3yaYZTZO6u82',NULL,_binary '\0',NULL,_binary '\0','admin@empresa7','2021-06-12 14:13:03','Empresa 7','56589858',NULL,NULL,'23c2a2f1-aede-4afc-b61c-a4ffaef73490','f37db1b0-d238-446c-9dd0-d8022fd70084','2',NULL,NULL),('09b5e011-2c19-4d5e-a273-36deff3bb839','5','$2a$10$IWmXdzDvr1UVv/8iwpFn2edXMibjjq62YZUqLyC8RdJPvoxlntgxi',NULL,_binary '\0','20331667568',_binary '\0','fedeacevedo166@gmail.com','2021-06-11 14:04:58','Empresa','5316531658',NULL,NULL,'3','f37db1b0-d238-446c-9dd0-d8022fd70084','2',NULL,NULL),('1',NULL,'$2a$10$bbWxrc4XjLY0bToq.SVQSO8JpAU8f28hhEIDYy6OeiUSYFRlSk.H2',NULL,_binary '\0',NULL,_binary '\0','admin@admin','2021-05-30 00:00:00','admin',NULL,NULL,'admin',NULL,NULL,'1',NULL,NULL),('2',NULL,'$2a$10$bbWxrc4XjLY0bToq.SVQSO8JpAU8f28hhEIDYy6OeiUSYFRlSk.H2',NULL,_binary '\0',NULL,_binary '\0','admin@pais','2021-05-30 00:00:00','admin_pais',NULL,NULL,'admin_pais',NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084','6',NULL,NULL),('3',NULL,'$2a$10$bbWxrc4XjLY0bToq.SVQSO8JpAU8f28hhEIDYy6OeiUSYFRlSk.H2',NULL,_binary '\0',NULL,_binary '\0','admin@empresa','2021-05-30 00:00:00','empresa',NULL,NULL,'empresa','1','f37db1b0-d238-446c-9dd0-d8022fd70084','2',NULL,NULL),('4',NULL,'$2a$10$bbWxrc4XjLY0bToq.SVQSO8JpAU8f28hhEIDYy6OeiUSYFRlSk.H2',NULL,_binary '\0',NULL,_binary '\0','admin@empresa1','2021-05-30 00:00:00','empresa',NULL,NULL,'empresa','2','f37db1b0-d238-446c-9dd0-d8022fd70084','2',NULL,NULL),('747b81fb-112a-4f29-adbd-bec9f0946069',NULL,'$2a$10$BlTeiJgt8BYgxp9ljY.QkOaJCV6zF3LXns5ENd2sGG/dKEjGtM5vK',NULL,_binary '\0',NULL,_binary '\0','c@m.com','2021-06-10 02:10:37','Carlos  Morco','2615447875',NULL,'25487548',NULL,NULL,'5',NULL,NULL),('cb844094-55d2-468d-95c4-c50e4e622639','6','$2a$10$JSLlmw6pQ.Fln3bOdQXsheskiMUFoFwMllNEsm99.hUflrYdB7WCq',NULL,_binary '\0',NULL,_binary '\0','admin@empresa6','2021-06-11 14:31:58','Empresa','65498645',NULL,NULL,NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084','3',NULL,NULL),('cc73b01c-d73b-4527-a3ec-7f580b519f90','4','$2a$10$x3Yggv4nlux3/S5aAyvGC.fH59EAp9rRq7H4NH0AOIDtKFIPgnZ1q',NULL,_binary '\0',NULL,_binary '\0','admin@empresa4','2021-06-11 13:20:28','Empresa','525485965',NULL,NULL,NULL,'f37db1b0-d238-446c-9dd0-d8022fd70084','3',NULL,NULL),('cf3956f0-337c-4e93-80bc-104f990722da',NULL,'$2a$10$.2YQfOqHKMPDejwWrdk/GeirNBKQIe/Kd8iqUz/./dS.7/NI.Ey2m',NULL,_binary '\0',NULL,_binary '\0','martin@followhub.tech','2021-09-21 16:04:35','Juan Carlos Cp','2614222555',NULL,NULL,NULL,NULL,'5',NULL,'5424333');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `id` varchar(255) NOT NULL,
  `anio_fabricacion` varchar(255) DEFAULT NULL,
  `dominio` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `rastreo_satelital` bit(1) NOT NULL,
  `sensores` bit(1) NOT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `modelo_id` varchar(255) DEFAULT NULL,
  `tipo_vehiculo_id` varchar(255) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `estado_vehiculo` varchar(255) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj707dfg7rfoa8ucsno3s83tqv` (`empresa_id`),
  KEY `FKp9hj7g6ceqe80ix17a435q7o0` (`modelo_id`),
  KEY `FK8si429jg12xpnu65gsn2a1r44` (`tipo_vehiculo_id`),
  CONSTRAINT `FK8si429jg12xpnu65gsn2a1r44` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`),
  CONSTRAINT `FKj707dfg7rfoa8ucsno3s83tqv` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKp9hj7g6ceqe80ix17a435q7o0` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('095695e4-fced-459f-8215-fcf1815f6632','92','2341234',NULL,'2021-09-21 15:51:25',_binary '',_binary '','1','eb45a3da-f921-4a69-b8e0-e104804a9998','aaa66f01-73a2-4bd9-ae64-de07530a8381',_binary '\0',NULL,NULL),('7e9992bd-96f5-45d2-9050-ce3dba6e9a2e','2021','AF845LL',NULL,'2021-08-06 14:11:04',_binary '',_binary '','1','eb45a3da-f921-4a69-b8e0-e104804a9998','aaa66f01-73a2-4bd9-ae64-de07530a8381',_binary '','DISPONIBLE',NULL),('8c05b13e-4cd5-45d4-8f0d-bc0858fa6ade','2016','AC845LO2',NULL,'2021-08-06 14:11:13',_binary '\0',_binary '\0','1','eb45a3da-f921-4a69-b8e0-e104804a9998','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',_binary '','DISPONIBLE',NULL),('c5cbdaf0-8c91-4ae1-828d-da97a2ab1958','2018','AC845LL',NULL,'2021-06-10 02:35:51',_binary '',_binary '\0','1','eb45a3da-f921-4a69-b8e0-e104804a9998','aaa66f01-73a2-4bd9-ae64-de07530a8381',_binary '','REPARACION',NULL),('dc1971ea-a75e-4eaf-b2c5-30c7d00eb15c','2017','AC845LL','2021-06-10 02:33:03','2021-06-10 02:30:02',_binary '',_binary '','1','eb45a3da-f921-4a69-b8e0-e104804a9998','fb5ee4a0-a4a8-4b08-b1d2-3ac20fc94c92',_binary '\0','DISPONIBLE',NULL);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo_remolque`
--

DROP TABLE IF EXISTS `vehiculo_remolque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo_remolque` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `empresa_id` varchar(255) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKser8t7qhv1l202g6lj1lonm7u` (`empresa_id`),
  KEY `FKnvkuqg1qe1ag6n5wp0s7ogiic` (`remolque_id`),
  KEY `FKs38unuhfsjb0srs6hmw1bggfw` (`vehiculo_id`),
  CONSTRAINT `FKnvkuqg1qe1ag6n5wp0s7ogiic` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FKs38unuhfsjb0srs6hmw1bggfw` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`),
  CONSTRAINT `FKser8t7qhv1l202g6lj1lonm7u` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo_remolque`
--

LOCK TABLES `vehiculo_remolque` WRITE;
/*!40000 ALTER TABLE `vehiculo_remolque` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo_remolque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `id` varchar(255) NOT NULL,
  `eliminado` datetime DEFAULT NULL,
  `estado_viaje` varchar(255) DEFAULT NULL,
  `internacional` bit(1) NOT NULL,
  `is_carga_negativa` bit(1) DEFAULT NULL,
  `kms` varchar(255) DEFAULT NULL,
  `llegada` datetime DEFAULT NULL,
  `llegada_carga_negativa` datetime DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `partida` datetime DEFAULT NULL,
  `partida_carga_negativa` datetime DEFAULT NULL,
  `presupuesto` int(11) DEFAULT NULL,
  `chofer_id` varchar(255) DEFAULT NULL,
  `pedido_id` bigint(20) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `transporte_id` varchar(255) DEFAULT NULL,
  `ubicacion_final_id` varchar(255) DEFAULT NULL,
  `ubicacion_inicial_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK34e3r4ak38sa952qtwpebphro` (`chofer_id`),
  KEY `FKbhkbnapgihuhhe76x6krumxq5` (`pedido_id`),
  KEY `FK1kgaanst957p6b77bhwu0n2lq` (`remolque_id`),
  KEY `FK4vx3ehpqqdjmp41fwftolf028` (`transporte_id`),
  KEY `FK1ah2orcybm960n624hkad267w` (`ubicacion_final_id`),
  KEY `FKlqj4ad51krsv7n6hblvinsacd` (`ubicacion_inicial_id`),
  KEY `FKrs4s6kehmvpb9q908nt93w3yx` (`vehiculo_id`),
  CONSTRAINT `FK1ah2orcybm960n624hkad267w` FOREIGN KEY (`ubicacion_final_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FK1kgaanst957p6b77bhwu0n2lq` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FK34e3r4ak38sa952qtwpebphro` FOREIGN KEY (`chofer_id`) REFERENCES `chofer` (`id`),
  CONSTRAINT `FK4vx3ehpqqdjmp41fwftolf028` FOREIGN KEY (`transporte_id`) REFERENCES `empresa` (`id`),
  CONSTRAINT `FKbhkbnapgihuhhe76x6krumxq5` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FKlqj4ad51krsv7n6hblvinsacd` FOREIGN KEY (`ubicacion_inicial_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `FKrs4s6kehmvpb9q908nt93w3yx` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES ('02f21467-53b2-4b49-bdc6-545ec488e600',NULL,'ESPERA_CARGA',_binary '\0',NULL,NULL,NULL,NULL,'2021-07-21 15:13:52','2021-07-30 17:00:00',NULL,NULL,'0683629e-1a58-487b-8cec-cffd8e828845',11,'09f1b0cd-5d58-4fd5-ace5-163a4d4489b6','1','a0f68db5-eb58-4922-9005-5dd7eca54f66','3a01e38b-f18a-40f2-8ea9-f5f36c5ee19e','7e9992bd-96f5-45d2-9050-ce3dba6e9a2e'),('bea493d5-5d0f-4f93-a762-db035e01694a',NULL,'ESPERA_CARGA',_binary '\0',NULL,NULL,NULL,NULL,'2021-07-21 14:28:55',NULL,NULL,NULL,'0683629e-1a58-487b-8cec-cffd8e828845',12,'09f1b0cd-5d58-4fd5-ace5-163a4d4489b6','1','d2ff6cc0-f7ff-4c0b-9274-b2a80258d86b','cf80225f-17c4-4482-95ad-265941a48a81','7e9992bd-96f5-45d2-9050-ce3dba6e9a2e'),('ce3a41a4-358b-4f83-9c65-654c7be955dd',NULL,'ESPERA_CARGA',_binary '\0',NULL,'1',NULL,NULL,'2021-07-01 14:01:21',NULL,NULL,NULL,'0683629e-1a58-487b-8cec-cffd8e828845',6,'09f1b0cd-5d58-4fd5-ace5-163a4d4489b6','1','0f41f7b7-bc46-4c10-a089-527d5c29e15a','9e199bca-2680-42e2-8bff-751b18cb46d9','8c05b13e-4cd5-45d4-8f0d-bc0858fa6ade'),('e8472dbd-1220-459d-b980-fc59b5993c2f',NULL,'ESPERA_CARGA',_binary '\0',NULL,NULL,NULL,NULL,'2021-11-05 12:48:49','2021-12-10 05:28:00',NULL,NULL,'0683629e-1a58-487b-8cec-cffd8e828845',10,'09f1b0cd-5d58-4fd5-ace5-163a4d4489b6','1','3afcce2f-b2da-47b4-a7d2-9ae4ace946c4','331c22ed-1d5f-46b7-9a66-edcb0447d937','8c05b13e-4cd5-45d4-8f0d-bc0858fa6ade'),('e8dff381-4d5f-4182-83ef-a5f8d1466910',NULL,'SIN_PLANIFICAR',_binary '\0',NULL,'1047',NULL,NULL,'2021-11-10 12:19:44',NULL,NULL,NULL,NULL,14,NULL,'1','7d40e5a2-47da-488d-b78f-75d42d27eb4b','a890598d-b520-4848-9b04-8364ae59ec6d',NULL);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje_camino`
--

DROP TABLE IF EXISTS `viaje_camino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje_camino` (
  `viaje_id` varchar(255) NOT NULL,
  `camino_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_nol60obhyl65o45x4o88fkr6e` (`camino_id`),
  KEY `FKk037o35ctpfavrnid023inysu` (`viaje_id`),
  CONSTRAINT `FKk037o35ctpfavrnid023inysu` FOREIGN KEY (`viaje_id`) REFERENCES `viaje` (`id`),
  CONSTRAINT `FKoebl1emdy0lpcgtg6xkxrphvk` FOREIGN KEY (`camino_id`) REFERENCES `way_point` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje_camino`
--

LOCK TABLES `viaje_camino` WRITE;
/*!40000 ALTER TABLE `viaje_camino` DISABLE KEYS */;
INSERT INTO `viaje_camino` VALUES ('02f21467-53b2-4b49-bdc6-545ec488e600','064ba2da-8516-4fd5-a860-0f4800778f45'),('02f21467-53b2-4b49-bdc6-545ec488e600','0b8741d9-92af-4d0f-9005-ad0962416e89'),('02f21467-53b2-4b49-bdc6-545ec488e600','0c1de9b5-53ca-4f0f-b266-51f9773583d6'),('02f21467-53b2-4b49-bdc6-545ec488e600','0cc11df4-7f02-467f-aa7b-7bf9c4fe7d70'),('02f21467-53b2-4b49-bdc6-545ec488e600','0e9bd41f-1fdc-42b8-a00a-505ff01e6965'),('02f21467-53b2-4b49-bdc6-545ec488e600','13cf4575-7176-45a2-8724-63df0f0dd760'),('02f21467-53b2-4b49-bdc6-545ec488e600','1c62431b-da08-4d55-af11-8f9f41d19152'),('02f21467-53b2-4b49-bdc6-545ec488e600','24c2d2eb-3f9b-4d3b-a69e-cb5f30604205'),('02f21467-53b2-4b49-bdc6-545ec488e600','27181f5b-3480-4246-a827-69137bcd03a3'),('02f21467-53b2-4b49-bdc6-545ec488e600','391974cf-67f6-4cc1-8834-ce7e4824c7e4'),('02f21467-53b2-4b49-bdc6-545ec488e600','3d282e3c-f724-44cf-9896-5ba57502cd64'),('02f21467-53b2-4b49-bdc6-545ec488e600','413605e2-9451-4d0a-aafa-80a103674f8b'),('02f21467-53b2-4b49-bdc6-545ec488e600','42f89ff4-55fc-4f1d-be11-cb2314647ebb'),('02f21467-53b2-4b49-bdc6-545ec488e600','43ccf441-3afb-400d-853e-46f78bce55d7'),('02f21467-53b2-4b49-bdc6-545ec488e600','45c80993-d0e9-4f5e-8260-644936f9f413'),('02f21467-53b2-4b49-bdc6-545ec488e600','46492fa2-7e76-4db4-8211-c52616af5cc7'),('02f21467-53b2-4b49-bdc6-545ec488e600','474220b0-54a3-480a-bbf8-b79fa2a79864'),('02f21467-53b2-4b49-bdc6-545ec488e600','50d7bf65-1c4c-408b-8707-d070ee96cd2d'),('02f21467-53b2-4b49-bdc6-545ec488e600','55d92b06-9588-4eeb-a07c-e061142cdba5'),('02f21467-53b2-4b49-bdc6-545ec488e600','5665a0b6-8c17-432c-9c8a-2340a8924095'),('02f21467-53b2-4b49-bdc6-545ec488e600','5702b9c6-c7c9-49c6-af49-2934ce64ae35'),('02f21467-53b2-4b49-bdc6-545ec488e600','58220cff-9270-4ef4-8126-46b788f4c3e2'),('02f21467-53b2-4b49-bdc6-545ec488e600','644f49bd-e550-4209-bc61-eb808b74cba4'),('02f21467-53b2-4b49-bdc6-545ec488e600','645e6eee-6e65-4ca7-94af-bf125afcd328'),('02f21467-53b2-4b49-bdc6-545ec488e600','654f9937-9455-425d-8eb1-43774c2d8d37'),('02f21467-53b2-4b49-bdc6-545ec488e600','66906bb0-8a66-423f-987c-b92560877f84'),('02f21467-53b2-4b49-bdc6-545ec488e600','66b1646e-7441-4c32-ad9a-964d14207adc'),('02f21467-53b2-4b49-bdc6-545ec488e600','6f11c0a4-9482-4a3f-89ee-810c344d2e69'),('02f21467-53b2-4b49-bdc6-545ec488e600','70b44c9f-4c62-4202-b67c-32e32ce0df9a'),('02f21467-53b2-4b49-bdc6-545ec488e600','716b4b44-bf17-4a89-a771-4284267686db'),('02f21467-53b2-4b49-bdc6-545ec488e600','72ce984c-9f2e-4185-a806-35f283db3823'),('02f21467-53b2-4b49-bdc6-545ec488e600','743e438d-7402-4a9a-a5c0-bbb93f6e4e4c'),('02f21467-53b2-4b49-bdc6-545ec488e600','750c55ed-b084-44d1-9210-2985cab2210a'),('02f21467-53b2-4b49-bdc6-545ec488e600','76c0fe16-c138-47ff-a57d-a30d803cdd6f'),('02f21467-53b2-4b49-bdc6-545ec488e600','78d38570-89d8-449a-807d-31f716a678d9'),('02f21467-53b2-4b49-bdc6-545ec488e600','7adf2c1a-c327-4a12-a687-51744f0f0d89'),('02f21467-53b2-4b49-bdc6-545ec488e600','81c5d462-88b7-40a7-9ddc-a8a1771fad51'),('02f21467-53b2-4b49-bdc6-545ec488e600','82258305-fdc9-4821-bab7-61cdea74535a'),('02f21467-53b2-4b49-bdc6-545ec488e600','85a78ba5-4f1f-4d97-939e-7752df966224'),('02f21467-53b2-4b49-bdc6-545ec488e600','8c15425f-ac7e-4a90-b7e9-564719a97248'),('02f21467-53b2-4b49-bdc6-545ec488e600','8ce02525-f9d2-463b-8ce1-b058f95e190c'),('02f21467-53b2-4b49-bdc6-545ec488e600','961405cf-a1a0-4a6b-8937-7f9801fb7d73'),('02f21467-53b2-4b49-bdc6-545ec488e600','9652baec-bfc9-4aba-bc17-347e52e23be9'),('02f21467-53b2-4b49-bdc6-545ec488e600','99844eec-590a-4792-9fe5-a7e8002bb38e'),('02f21467-53b2-4b49-bdc6-545ec488e600','9c6d6893-7728-454b-8217-58b3e4a04db2'),('02f21467-53b2-4b49-bdc6-545ec488e600','9c8ff6b8-7071-414b-b8f7-d1e92ab79f65'),('02f21467-53b2-4b49-bdc6-545ec488e600','9e4ff8ca-2e94-4886-a076-4be090a6d359'),('02f21467-53b2-4b49-bdc6-545ec488e600','a1310a5f-79fe-4409-bffe-38b8437b3701'),('02f21467-53b2-4b49-bdc6-545ec488e600','aa4e47a1-ad04-490a-ab0f-421d9edd6e42'),('02f21467-53b2-4b49-bdc6-545ec488e600','aabb74fb-5b58-4ece-97e8-3e5acf9c21f8'),('02f21467-53b2-4b49-bdc6-545ec488e600','b61bb10d-d58e-4189-8dc5-5ac76a8397f0'),('02f21467-53b2-4b49-bdc6-545ec488e600','bc0e67c8-c2f8-4721-9905-cabef1f0cb69'),('02f21467-53b2-4b49-bdc6-545ec488e600','c036acff-2bef-4ad1-820a-62f65e571f94'),('02f21467-53b2-4b49-bdc6-545ec488e600','c4b6fe19-afd5-4446-91c6-5f638efadad5'),('02f21467-53b2-4b49-bdc6-545ec488e600','c8442b2a-9191-47be-aa82-08d090896477'),('02f21467-53b2-4b49-bdc6-545ec488e600','d427f3e9-cb59-469f-9e99-ded995f77a2b'),('02f21467-53b2-4b49-bdc6-545ec488e600','d9367564-5b24-4e61-803f-176ee0e458e0'),('02f21467-53b2-4b49-bdc6-545ec488e600','df14c7ba-5b0f-4e02-bc06-396f4f06228f'),('02f21467-53b2-4b49-bdc6-545ec488e600','e2f391a5-fc3d-4955-bf15-75a0be847a15'),('02f21467-53b2-4b49-bdc6-545ec488e600','e4e2df40-1d60-41d2-abff-151e3dbeed77'),('02f21467-53b2-4b49-bdc6-545ec488e600','f0148e19-91d5-4b00-a4b2-2d56b393c8fb'),('02f21467-53b2-4b49-bdc6-545ec488e600','f98fc9d6-6b9b-4784-8a50-e0b137f2442a'),('02f21467-53b2-4b49-bdc6-545ec488e600','fe8105c3-294e-4874-8be8-63caf36b8abf'),('bea493d5-5d0f-4f93-a762-db035e01694a','04ed9f63-b100-48b8-988e-dba6a98a52a2'),('bea493d5-5d0f-4f93-a762-db035e01694a','08d7dd32-5c55-4785-b0d6-02ff2d077f88'),('bea493d5-5d0f-4f93-a762-db035e01694a','09885663-d233-47f6-8881-45d350f84649'),('bea493d5-5d0f-4f93-a762-db035e01694a','0db394bc-4867-4a39-9c45-db27e44d9094'),('bea493d5-5d0f-4f93-a762-db035e01694a','3324c84a-e3e3-4aab-8d3a-29958ee6da55'),('bea493d5-5d0f-4f93-a762-db035e01694a','54e9a6a0-43ed-44ea-a528-c72303ec9036'),('bea493d5-5d0f-4f93-a762-db035e01694a','615106e1-7f50-430e-a7bc-5c539bcfa3dc'),('bea493d5-5d0f-4f93-a762-db035e01694a','6f8074ff-92a8-4ff2-88dd-34715b806fdf'),('bea493d5-5d0f-4f93-a762-db035e01694a','7a5a7847-79a7-4d0a-9448-2e992d80c4dc'),('bea493d5-5d0f-4f93-a762-db035e01694a','7a837f6a-3a9d-4549-a746-662996df1e99'),('bea493d5-5d0f-4f93-a762-db035e01694a','847a552a-7e7c-47c1-a716-2fb76bec6a35'),('bea493d5-5d0f-4f93-a762-db035e01694a','8b2d29a0-8bc0-4233-9f92-5597827fd1d3'),('bea493d5-5d0f-4f93-a762-db035e01694a','cb569f88-dedf-438b-895d-a552cbc5679c'),('bea493d5-5d0f-4f93-a762-db035e01694a','d5b3fe32-ddeb-4043-b996-4a99115a789c'),('bea493d5-5d0f-4f93-a762-db035e01694a','d66d21ea-ac3e-4573-8ddb-1b038d625562'),('bea493d5-5d0f-4f93-a762-db035e01694a','e122bb9f-74f6-4e1a-8d61-b635d13705c9'),('bea493d5-5d0f-4f93-a762-db035e01694a','e9a44a66-1645-4864-888b-be4fdacc4d0e'),('bea493d5-5d0f-4f93-a762-db035e01694a','ee18033d-7098-4cc3-80ea-e13d02009c72'),('bea493d5-5d0f-4f93-a762-db035e01694a','f73c96ed-98c7-4258-b756-d4c2df66c875'),('bea493d5-5d0f-4f93-a762-db035e01694a','f9a339b0-573e-41be-a940-d44e4319db23'),('bea493d5-5d0f-4f93-a762-db035e01694a','fa80e210-18ee-4a1f-85f6-ae2f057a3ff3'),('e8472dbd-1220-459d-b980-fc59b5993c2f','059c1851-8e48-46a2-89c9-7047806f0f08'),('e8472dbd-1220-459d-b980-fc59b5993c2f','05a2fe62-4b83-4e5b-98f8-2d6f1b954735'),('e8472dbd-1220-459d-b980-fc59b5993c2f','062aa15c-7263-4af8-ad93-cb5a16d5fe6d'),('e8472dbd-1220-459d-b980-fc59b5993c2f','090a1540-ec8d-4e0e-ae36-6b5892caa648'),('e8472dbd-1220-459d-b980-fc59b5993c2f','0a7d6d6e-5ef7-4cc1-b792-738822981786'),('e8472dbd-1220-459d-b980-fc59b5993c2f','1012c481-1efe-472d-965e-4e478c607daf'),('e8472dbd-1220-459d-b980-fc59b5993c2f','118bb67b-3aba-4b02-a89b-2e6b78f54ad8'),('e8472dbd-1220-459d-b980-fc59b5993c2f','14189c8f-f009-483f-a4df-63a7ddc2038a'),('e8472dbd-1220-459d-b980-fc59b5993c2f','1505a57f-3f9a-4f82-b750-698cf421b495'),('e8472dbd-1220-459d-b980-fc59b5993c2f','186f758b-4721-4cb4-8046-3dec40ef61f3'),('e8472dbd-1220-459d-b980-fc59b5993c2f','1b0fee02-fbcc-4831-a718-11e27c357574'),('e8472dbd-1220-459d-b980-fc59b5993c2f','1e02740f-2d3d-4f85-8143-5b17ced0e619'),('e8472dbd-1220-459d-b980-fc59b5993c2f','2162fca1-138a-403d-99c0-53f3447f9a5b'),('e8472dbd-1220-459d-b980-fc59b5993c2f','22cae3b8-499b-40e4-9cb8-4174ea8b0f32'),('e8472dbd-1220-459d-b980-fc59b5993c2f','277117d6-aacf-4b04-9f6a-402b30b92cfd'),('e8472dbd-1220-459d-b980-fc59b5993c2f','2783a0d4-89a1-41e4-91f5-18effba34a3c'),('e8472dbd-1220-459d-b980-fc59b5993c2f','28b6da2c-419d-470c-a25c-c27d5ac7d7cd'),('e8472dbd-1220-459d-b980-fc59b5993c2f','2abbc5ff-efb8-48ff-bb35-d3e74e9cd140'),('e8472dbd-1220-459d-b980-fc59b5993c2f','2d11ae40-2ce8-4476-8d54-ab9811399466'),('e8472dbd-1220-459d-b980-fc59b5993c2f','2d31c1c9-1c25-477a-9af4-69b424de4b58'),('e8472dbd-1220-459d-b980-fc59b5993c2f','309feaf3-716c-49f8-97e2-8cbc68627d03'),('e8472dbd-1220-459d-b980-fc59b5993c2f','3353d153-baf1-4e53-8886-363dff5cae72'),('e8472dbd-1220-459d-b980-fc59b5993c2f','38502b46-cdc6-4022-b346-9a100a6dc1a4'),('e8472dbd-1220-459d-b980-fc59b5993c2f','3d9ee829-c7bd-4ce9-ab10-1c145f2d2bb0'),('e8472dbd-1220-459d-b980-fc59b5993c2f','3f7b90ca-362f-4d78-9874-40b10573070d'),('e8472dbd-1220-459d-b980-fc59b5993c2f','4eb51044-a9e7-4bbd-b2f3-50a1f18e2785'),('e8472dbd-1220-459d-b980-fc59b5993c2f','51f4a1f1-63f7-4b09-b1a2-42edf4cad249'),('e8472dbd-1220-459d-b980-fc59b5993c2f','5551b710-c6ad-491b-92cf-beeb4a85f731'),('e8472dbd-1220-459d-b980-fc59b5993c2f','56368ab4-48ab-4768-ac74-454fc0f273c5'),('e8472dbd-1220-459d-b980-fc59b5993c2f','5c2fab01-40e5-4b1f-be15-440d23853353'),('e8472dbd-1220-459d-b980-fc59b5993c2f','5e5659d7-aeb3-45e8-be0d-20e0a4a24eb9'),('e8472dbd-1220-459d-b980-fc59b5993c2f','5ecaccd6-9f54-4fd6-8bea-d7d27cdb4012'),('e8472dbd-1220-459d-b980-fc59b5993c2f','60eea40d-a996-4545-98fc-429515de05cf'),('e8472dbd-1220-459d-b980-fc59b5993c2f','6377b4db-b097-437c-b659-6b42b59481a8'),('e8472dbd-1220-459d-b980-fc59b5993c2f','6a286741-e216-4d60-9b02-34cecb56cbca'),('e8472dbd-1220-459d-b980-fc59b5993c2f','6a44674b-3d5c-4d48-99f1-2201a209fdb7'),('e8472dbd-1220-459d-b980-fc59b5993c2f','6b3dfb9f-a306-454d-87f8-59023eb244fc'),('e8472dbd-1220-459d-b980-fc59b5993c2f','6c05c8f0-1270-470e-8354-164b17922ceb'),('e8472dbd-1220-459d-b980-fc59b5993c2f','6c1da141-daa5-4e80-b8f7-a559e8b36cb9'),('e8472dbd-1220-459d-b980-fc59b5993c2f','6f6ca57b-a915-4c7a-8913-8aa628606208'),('e8472dbd-1220-459d-b980-fc59b5993c2f','77cb9bab-280d-4aad-9b06-aa558e96482a'),('e8472dbd-1220-459d-b980-fc59b5993c2f','784e6fce-26f2-4752-9453-428d1973e531'),('e8472dbd-1220-459d-b980-fc59b5993c2f','794f4c7e-493b-467e-bea5-311883f53e07'),('e8472dbd-1220-459d-b980-fc59b5993c2f','79c81b5b-97e5-4c51-b636-f0debfaf8985'),('e8472dbd-1220-459d-b980-fc59b5993c2f','79d14786-2e3d-4608-bed0-6e1cd753f22d'),('e8472dbd-1220-459d-b980-fc59b5993c2f','876d233e-c3ac-41ea-a333-2829bdafcb41'),('e8472dbd-1220-459d-b980-fc59b5993c2f','87712526-e6ee-4596-b8d4-eb1b85235c9f'),('e8472dbd-1220-459d-b980-fc59b5993c2f','89b8f19b-0226-4628-a597-a13b55e866fd'),('e8472dbd-1220-459d-b980-fc59b5993c2f','93888e8f-76c6-4b6e-9986-69268bc94451'),('e8472dbd-1220-459d-b980-fc59b5993c2f','94c4a077-ada3-4e6b-a061-f6960cdb0b30'),('e8472dbd-1220-459d-b980-fc59b5993c2f','9bd8e343-6ed5-4ef3-940e-5c64d2692c32'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a0d30378-a7ee-491d-8421-5fe7dfc97b02'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a2424b9e-df4c-45d7-9815-a131c7af0472'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a2d93577-9c6b-4e3e-a741-0af2dd44d9df'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a3540e40-67a2-4309-93ad-90a593d1f716'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a47a30d2-f34c-4fcc-8670-45cb93bdd2b3'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a47d4015-145b-4edf-b43e-a6d9ec221747'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a7bf2d6e-b6c6-4069-b387-d936ac384cd1'),('e8472dbd-1220-459d-b980-fc59b5993c2f','a9553c49-1f9f-49b5-9060-fb49e27e223a'),('e8472dbd-1220-459d-b980-fc59b5993c2f','acfac2a1-f6b7-4d2f-94ee-bdebb06de534'),('e8472dbd-1220-459d-b980-fc59b5993c2f','afa7d8b2-2eef-4fbe-9f89-cf547adc12b6'),('e8472dbd-1220-459d-b980-fc59b5993c2f','b0d63dce-ea15-484d-bfd1-9dd44eb74faa'),('e8472dbd-1220-459d-b980-fc59b5993c2f','b1186e67-7b1e-4cd2-9669-c14989da737d'),('e8472dbd-1220-459d-b980-fc59b5993c2f','b37b146b-389e-4fa9-af76-fa20fb819be2'),('e8472dbd-1220-459d-b980-fc59b5993c2f','b5354a92-16a0-4866-ae57-2e678ea8b8dd'),('e8472dbd-1220-459d-b980-fc59b5993c2f','b647c7ad-9b0b-45b3-a16e-d3cda2965738'),('e8472dbd-1220-459d-b980-fc59b5993c2f','bbeaa0d1-e67f-4b74-9a24-16051bfe629a'),('e8472dbd-1220-459d-b980-fc59b5993c2f','bfdfb406-87ba-49c4-9bf0-895a5b0e0b0e'),('e8472dbd-1220-459d-b980-fc59b5993c2f','c02ba6cd-6be8-4502-815d-8d690f2cf947'),('e8472dbd-1220-459d-b980-fc59b5993c2f','c62c6bb2-5efd-480a-9d4c-b072df876ca7'),('e8472dbd-1220-459d-b980-fc59b5993c2f','d9ee2ce9-1a88-4d53-9198-9ebd380be1a2'),('e8472dbd-1220-459d-b980-fc59b5993c2f','dc982ad1-7641-49b1-96d7-de39669da10c'),('e8472dbd-1220-459d-b980-fc59b5993c2f','e1129223-c4b8-487f-b32b-5f235f7e139a'),('e8472dbd-1220-459d-b980-fc59b5993c2f','e2b84701-1516-47d9-87a7-66dec2a9594f'),('e8472dbd-1220-459d-b980-fc59b5993c2f','e588df3a-66b3-4129-aeda-bb43b49adaab'),('e8472dbd-1220-459d-b980-fc59b5993c2f','e5fd147c-100a-4949-9a6d-5eea9d5f0647'),('e8472dbd-1220-459d-b980-fc59b5993c2f','e8aaa155-9d19-4ba4-9af1-9c0f82f36d02'),('e8472dbd-1220-459d-b980-fc59b5993c2f','e8f02b51-fbc3-44f2-aeee-cb59d6775607'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f1f619a1-063b-46ae-bae0-aa84b8f44bb8'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f217652f-f151-443e-a202-2e7be488fdce'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f265c5c8-0116-4129-95f7-0d565a7462ef'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f342c66a-cfd2-4db7-b9cc-b3987bab1b19'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f3d7a871-a8d7-4f3d-9aa3-eb0da7e12b71'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f7895a16-b926-44df-a7d7-66d11bac7b8f'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f92e10e3-f8ef-438e-a573-03c56d81121a'),('e8472dbd-1220-459d-b980-fc59b5993c2f','f9ef69b9-be16-4708-a5ec-46dd005b9fe1'),('e8472dbd-1220-459d-b980-fc59b5993c2f','fc20dce0-a4c4-4767-9518-dfe5accc79ea'),('e8472dbd-1220-459d-b980-fc59b5993c2f','ff4264d0-202d-4c4a-a71a-1ec5c95c2e32');
/*!40000 ALTER TABLE `viaje_camino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje_checklist`
--

DROP TABLE IF EXISTS `viaje_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje_checklist` (
  `viaje_id` varchar(255) NOT NULL,
  `checklist_id` varchar(255) NOT NULL,
  KEY `FK8g5pmykhkbssnpecrk09lyht4` (`checklist_id`),
  KEY `FK1nwocv38k9kjb5mw6su8jmfjj` (`viaje_id`),
  CONSTRAINT `FK1nwocv38k9kjb5mw6su8jmfjj` FOREIGN KEY (`viaje_id`) REFERENCES `viaje` (`id`),
  CONSTRAINT `FK8g5pmykhkbssnpecrk09lyht4` FOREIGN KEY (`checklist_id`) REFERENCES `checklist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje_checklist`
--

LOCK TABLES `viaje_checklist` WRITE;
/*!40000 ALTER TABLE `viaje_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje_personal`
--

DROP TABLE IF EXISTS `viaje_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje_personal` (
  `id` varchar(255) NOT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `estado_viaje` varchar(255) DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `internacional` bit(1) NOT NULL,
  `kms` varchar(255) DEFAULT NULL,
  `modificacion` datetime DEFAULT NULL,
  `chofer_id` varchar(255) DEFAULT NULL,
  `remolque_id` varchar(255) DEFAULT NULL,
  `transportador_id` varchar(255) DEFAULT NULL,
  `vehiculo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4wa0mp2hdpo947pe7wir3tqw6` (`chofer_id`),
  KEY `FK7t7q2pt1q5cww97yu8ts5r66d` (`remolque_id`),
  KEY `FKt5gkehsp9vuxkf6pkdqxe01ln` (`transportador_id`),
  KEY `FKca58dudq08pydqosq1rofxp0y` (`vehiculo_id`),
  CONSTRAINT `FK4wa0mp2hdpo947pe7wir3tqw6` FOREIGN KEY (`chofer_id`) REFERENCES `chofer` (`id`),
  CONSTRAINT `FK7t7q2pt1q5cww97yu8ts5r66d` FOREIGN KEY (`remolque_id`) REFERENCES `remolque` (`id`),
  CONSTRAINT `FKca58dudq08pydqosq1rofxp0y` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`id`),
  CONSTRAINT `FKt5gkehsp9vuxkf6pkdqxe01ln` FOREIGN KEY (`transportador_id`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje_personal`
--

LOCK TABLES `viaje_personal` WRITE;
/*!40000 ALTER TABLE `viaje_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje_personal_coincidencias`
--

DROP TABLE IF EXISTS `viaje_personal_coincidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje_personal_coincidencias` (
  `viaje_personal_id` varchar(255) NOT NULL,
  `coincidencias_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_shf3gne3rwit4lhar2uxyiy58` (`coincidencias_id`),
  KEY `FKbqn2t5w1xss433ijn6dbgbyji` (`viaje_personal_id`),
  CONSTRAINT `FKbqn2t5w1xss433ijn6dbgbyji` FOREIGN KEY (`viaje_personal_id`) REFERENCES `viaje_personal` (`id`),
  CONSTRAINT `FKmrfu0j2nfuhjmipnng7had8t` FOREIGN KEY (`coincidencias_id`) REFERENCES `coincidencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje_personal_coincidencias`
--

LOCK TABLES `viaje_personal_coincidencias` WRITE;
/*!40000 ALTER TABLE `viaje_personal_coincidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje_personal_coincidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje_personal_nuevo_orden_ids`
--

DROP TABLE IF EXISTS `viaje_personal_nuevo_orden_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje_personal_nuevo_orden_ids` (
  `viaje_personal_id` varchar(255) NOT NULL,
  `nuevo_orden_ids` varchar(255) DEFAULT NULL,
  KEY `FKmn8wcu0ssuid8c7f3ssj3jdrp` (`viaje_personal_id`),
  CONSTRAINT `FKmn8wcu0ssuid8c7f3ssj3jdrp` FOREIGN KEY (`viaje_personal_id`) REFERENCES `viaje_personal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje_personal_nuevo_orden_ids`
--

LOCK TABLES `viaje_personal_nuevo_orden_ids` WRITE;
/*!40000 ALTER TABLE `viaje_personal_nuevo_orden_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje_personal_nuevo_orden_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje_way_points`
--

DROP TABLE IF EXISTS `viaje_way_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje_way_points` (
  `viaje_id` varchar(255) NOT NULL,
  `way_points` varchar(255) DEFAULT NULL,
  KEY `FKih42nn8leh6t8vnxq7iybx377` (`viaje_id`),
  CONSTRAINT `FKih42nn8leh6t8vnxq7iybx377` FOREIGN KEY (`viaje_id`) REFERENCES `viaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje_way_points`
--

LOCK TABLES `viaje_way_points` WRITE;
/*!40000 ALTER TABLE `viaje_way_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje_way_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `way_point`
--

DROP TABLE IF EXISTS `way_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `way_point` (
  `id` varchar(255) NOT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `viaje_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9rob9f8hy6lvhj26j2yf92xco` (`viaje_id`),
  CONSTRAINT `FK9rob9f8hy6lvhj26j2yf92xco` FOREIGN KEY (`viaje_id`) REFERENCES `viaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `way_point`
--

LOCK TABLES `way_point` WRITE;
/*!40000 ALTER TABLE `way_point` DISABLE KEYS */;
INSERT INTO `way_point` VALUES ('04ed9f63-b100-48b8-988e-dba6a98a52a2',-32.897306,-68.8342368,7,NULL),('059c1851-8e48-46a2-89c9-7047806f0f08',-31.4342874,-64.2791908,58,NULL),('05a2fe62-4b83-4e5b-98f8-2d6f1b954735',-32.7197691,-68.5872128,33,NULL),('062aa15c-7263-4af8-ad93-cb5a16d5fe6d',-31.3997574,-64.2677721,68,NULL),('064ba2da-8516-4fd5-a860-0f4800778f45',-32.8923284,-68.8547741,4,NULL),('08d7dd32-5c55-4785-b0d6-02ff2d077f88',-32.8965789,-68.83285289999999,8,NULL),('090a1540-ec8d-4e0e-ae36-6b5892caa648',-32.8674195,-68.8130448,22,NULL),('09885663-d233-47f6-8881-45d350f84649',-33.538141,-69.0076863,12,NULL),('09e8140f-45ff-432d-a088-f988a1002fde',-32.8672329,-68.81303989999999,96,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('0a7d6d6e-5ef7-4cc1-b792-738822981786',-32.7203428,-68.5943735,31,NULL),('0b8741d9-92af-4d0f-9005-ad0962416e89',-32.8977869,-68.82871279999999,21,NULL),('0c1de9b5-53ca-4f0f-b266-51f9773583d6',-33.1434886,-65.08453589999999,52,NULL),('0cc11df4-7f02-467f-aa7b-7bf9c4fe7d70',-33.0641912,-65.62343489999999,43,NULL),('0db394bc-4867-4a39-9c45-db27e44d9094',-32.8964224,-68.8422528,5,NULL),('0e9bd41f-1fdc-42b8-a00a-505ff01e6965',-32.8929929,-68.8511469,2,NULL),('1012c481-1efe-472d-965e-4e478c607daf',-31.9504058,-65.1616997,44,NULL),('118bb67b-3aba-4b02-a89b-2e6b78f54ad8',-32.8656593,-68.83278899999999,7,NULL),('136573a5-9b40-487f-a938-dfd0edfe39ab',-31.45833619999999,-64.4249253,100,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('13cf4575-7176-45a2-8724-63df0f0dd760',-33.3015606,-66.2660829,29,NULL),('14189c8f-f009-483f-a4df-63a7ddc2038a',-32.8671965,-68.84610959999999,3,NULL),('1505a57f-3f9a-4f82-b750-698cf421b495',-32.8671965,-68.84610959999999,1,NULL),('186f758b-4721-4cb4-8046-3dec40ef61f3',-31.98916609999999,-65.1645249,41,NULL),('1b0fee02-fbcc-4831-a718-11e27c357574',-32.8685663,-68.84616179999999,4,NULL),('1c62431b-da08-4d55-af11-8f9f41d19152',-32.8739505,-68.8460924,1,NULL),('1e02740f-2d3d-4f85-8143-5b17ced0e619',-32.8664885,-68.8290478,10,NULL),('2063e512-2033-44f6-82d4-ce92082e73d5',-31.4101936,-64.1815671,109,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('2162fca1-138a-403d-99c0-53f3447f9a5b',-31.5404283,-64.4531694,48,NULL),('22528fe2-9a47-4d53-963a-a34de8fbff33',-34.6226101,-68.3746108,38,'bea493d5-5d0f-4f93-a762-db035e01694a'),('22cae3b8-499b-40e4-9cb8-4174ea8b0f32',-32.3894566,-67.01078009999999,38,NULL),('24c2d2eb-3f9b-4d3b-a69e-cb5f30604205',-32.8976298,-68.8237741,23,NULL),('26999039-188f-4f2b-ab39-7759782be5ef',-33.0370219,-65.5208313,80,'02f21467-53b2-4b49-bdc6-545ec488e600'),('27181f5b-3480-4246-a827-69137bcd03a3',-32.8919418,-68.8506793,7,NULL),('2732a18f-7a24-4703-a8f0-77d4ca8d5151',-32.8685663,-68.84616179999999,89,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('277117d6-aacf-4b04-9f6a-402b30b92cfd',-32.8215991,-68.80215489999999,25,NULL),('277e1609-8a5f-4cfe-bc3c-e58f70218d5d',-32.8692662,-68.844835,63,'02f21467-53b2-4b49-bdc6-545ec488e600'),('2783a0d4-89a1-41e4-91f5-18effba34a3c',-31.4114076,-64.1776059,79,NULL),('279ac31e-9b96-4196-83a8-cbb6f776bc2f',-33.2566529,-66.1757214,73,'02f21467-53b2-4b49-bdc6-545ec488e600'),('27b23154-3437-48d7-8351-a8b7c8a46c24',-32.89152,-68.8529542,65,'02f21467-53b2-4b49-bdc6-545ec488e600'),('28b6da2c-419d-470c-a25c-c27d5ac7d7cd',-32.8660197,-68.8288316,8,NULL),('2abbc5ff-efb8-48ff-bb35-d3e74e9cd140',-32.8669245,-68.8129828,19,NULL),('2d11ae40-2ce8-4476-8d54-ab9811399466',-31.9769367,-65.2380795,40,NULL),('2d31c1c9-1c25-477a-9af4-69b424de4b58',-31.4168159,-64.1813559,77,NULL),('2d59c1d3-9742-4d0b-a9c5-6ebfae7818c7',-32.8918158,-68.8513277,23,'bea493d5-5d0f-4f93-a762-db035e01694a'),('309feaf3-716c-49f8-97e2-8cbc68627d03',-31.410401,-64.1808803,85,NULL),('3324c84a-e3e3-4aab-8d3a-29958ee6da55',-34.6346385,-68.33907359999999,18,NULL),('3353d153-baf1-4e53-8886-363dff5cae72',-32.2133347,-67.80197439999999,37,NULL),('378ad16c-40a9-4493-bfac-cc52d3a892a9',-33.1782623,-64.98583769999999,81,'02f21467-53b2-4b49-bdc6-545ec488e600'),('38502b46-cdc6-4022-b346-9a100a6dc1a4',-31.9521763,-65.0533958,46,NULL),('3873a7cc-6acd-4238-a74c-b53dff6e4a7b',-32.89967070000001,-68.8193387,32,'bea493d5-5d0f-4f93-a762-db035e01694a'),('391974cf-67f6-4cc1-8834-ce7e4824c7e4',-33.1850447,-64.9969041,58,NULL),('3af016f6-1793-4336-aca1-a24639c9b48f',-32.8966656,-68.8409686,27,'bea493d5-5d0f-4f93-a762-db035e01694a'),('3d282e3c-f724-44cf-9896-5ba57502cd64',-33.1779868,-64.9861573,59,NULL),('3d9ee829-c7bd-4ce9-ab10-1c145f2d2bb0',-31.4115616,-64.2694523,66,NULL),('3f7b90ca-362f-4d78-9874-40b10573070d',-31.74247789999999,-65.0050904,47,NULL),('3f965ed6-9221-4f0e-a0ab-6caca3331bd8',-32.8656593,-68.83278899999999,91,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('402f6244-a342-4e25-a831-78edba4606c1',-32.8669245,-68.8129828,95,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('405fd8ab-7922-4bd6-8652-86b5b910d71b',-32.8965789,-68.83285289999999,29,'bea493d5-5d0f-4f93-a762-db035e01694a'),('413605e2-9451-4d0a-aafa-80a103674f8b',-32.8982181,-68.8238764,22,NULL),('42f89ff4-55fc-4f1d-be11-cb2314647ebb',-33.063967,-65.623965,38,NULL),('43ccf441-3afb-400d-853e-46f78bce55d7',-33.3015047,-66.26561079999999,31,NULL),('45c80993-d0e9-4f5e-8260-644936f9f413',-32.8966641,-68.8410013,12,NULL),('46492fa2-7e76-4db4-8211-c52616af5cc7',-33.4126206,-67.1189893,26,NULL),('474220b0-54a3-480a-bbf8-b79fa2a79864',-33.3015047,-66.26561079999999,30,NULL),('48cd24e6-f0a1-4e6e-80b9-16736fb2ade4',-33.0365565,-65.520556,79,'02f21467-53b2-4b49-bdc6-545ec488e600'),('49861071-02ec-487c-9b29-e00473c92d46',-32.8964224,-68.8422528,26,'bea493d5-5d0f-4f93-a762-db035e01694a'),('4d5a4c8e-802d-488f-b894-fc1208847c05',-32.8739505,-68.8460924,22,'bea493d5-5d0f-4f93-a762-db035e01694a'),('4dbbf77e-ede6-4986-9ebe-66a133248584',-32.8929929,-68.8511469,64,'02f21467-53b2-4b49-bdc6-545ec488e600'),('4e404470-64d1-42e3-8431-2b3a483b4718',-32.8919418,-68.8506793,24,'bea493d5-5d0f-4f93-a762-db035e01694a'),('4eb51044-a9e7-4bbd-b2f3-50a1f18e2785',-31.9544047,-65.1623543,42,NULL),('4ff0e72a-5841-48b1-819f-9dc1ca7b457f',-32.8976298,-68.8237741,70,'02f21467-53b2-4b49-bdc6-545ec488e600'),('501e660d-d046-4a74-8b78-c8845bc344a0',-33.1087107,-64.38499639999999,84,'02f21467-53b2-4b49-bdc6-545ec488e600'),('50d7bf65-1c4c-408b-8707-d070ee96cd2d',-33.0365565,-65.520556,46,NULL),('51f4a1f1-63f7-4b09-b1a2-42edf4cad249',-31.4172138,-64.1800339,78,NULL),('51f9ebfa-3371-41fa-a9a5-a0cbc92bf534',-33.538141,-69.0076863,33,'bea493d5-5d0f-4f93-a762-db035e01694a'),('54e9a6a0-43ed-44ea-a528-c72303ec9036',-32.89967070000001,-68.8193387,11,NULL),('5551b710-c6ad-491b-92cf-beeb4a85f731',-32.7197282,-68.595536,30,NULL),('55d92b06-9588-4eeb-a07c-e061142cdba5',-33.0640467,-65.62356199999999,39,NULL),('56368ab4-48ab-4768-ac74-454fc0f273c5',-32.8687022,-68.82901629999999,11,NULL),('5665a0b6-8c17-432c-9c8a-2340a8924095',-33.2629613,-66.1709557,33,NULL),('5702b9c6-c7c9-49c6-af49-2934ce64ae35',-33.2532174,-66.1749262,37,NULL),('58220cff-9270-4ef4-8126-46b788f4c3e2',-32.8966656,-68.8409686,13,NULL),('5c2fab01-40e5-4b1f-be15-440d23853353',-31.9541067,-65.1621863,43,NULL),('5e5659d7-aeb3-45e8-be0d-20e0a4a24eb9',-32.8672451,-68.8131728,17,NULL),('5ecaccd6-9f54-4fd6-8bea-d7d27cdb4012',-31.4564557,-64.42420729999999,52,NULL),('60eea40d-a996-4545-98fc-429515de05cf',-32.8684004,-68.8431718,5,NULL),('615106e1-7f50-430e-a7bc-5c539bcfa3dc',-34.5738874,-68.4732607,15,NULL),('625a0b52-0837-4ca9-8c69-4aa33379edc8',-31.45587029999999,-64.4214953,101,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('6377b4db-b097-437c-b659-6b42b59481a8',-31.4341562,-64.2794924,60,NULL),('644f49bd-e550-4209-bc61-eb808b74cba4',-32.8965029,-68.8409106,9,NULL),('645e6eee-6e65-4ca7-94af-bf125afcd328',-33.3035736,-66.27042039999999,28,NULL),('654f9937-9455-425d-8eb1-43774c2d8d37',-33.105535,-64.385104,62,NULL),('66906bb0-8a66-423f-987c-b92560877f84',-33.0377965,-65.5216324,50,NULL),('66b12226-758b-4159-b034-a0e9ec09eb1a',-34.5738874,-68.4732607,36,'bea493d5-5d0f-4f93-a762-db035e01694a'),('66b1646e-7441-4c32-ad9a-964d14207adc',-33.4129803,-67.1176669,27,NULL),('6a286741-e216-4d60-9b02-34cecb56cbca',-32.7193547,-68.6082682,28,NULL),('6a44674b-3d5c-4d48-99f1-2201a209fdb7',-31.5396848,-64.4530333,49,NULL),('6b3dfb9f-a306-454d-87f8-59023eb244fc',-32.7206689,-68.5962186,29,NULL),('6c05c8f0-1270-470e-8354-164b17922ceb',-31.4342874,-64.2791908,59,NULL),('6c1da141-daa5-4e80-b8f7-a559e8b36cb9',-31.434763,-64.28027949999999,56,NULL),('6f11c0a4-9482-4a3f-89ee-810c344d2e69',-33.0596465,-65.5357465,44,NULL),('6f6ca57b-a915-4c7a-8913-8aa628606208',-32.8688536,-68.82733309999999,12,NULL),('6f8074ff-92a8-4ff2-88dd-34715b806fdf',-32.8966656,-68.8409686,6,NULL),('70b44c9f-4c62-4202-b67c-32e32ce0df9a',-33.4125928,-67.12075469999999,25,NULL),('716b4b44-bf17-4a89-a771-4284267686db',-33.2566529,-66.1757214,36,NULL),('72ce984c-9f2e-4185-a806-35f283db3823',-33.2737241,-65.6169058,41,NULL),('743e438d-7402-4a9a-a5c0-bbb93f6e4e4c',-32.8976388,-68.82871279999999,20,NULL),('750c55ed-b084-44d1-9210-2985cab2210a',-32.8929783,-68.85123320000001,3,NULL),('76c0fe16-c138-47ff-a57d-a30d803cdd6f',-33.1779868,-64.9861573,54,NULL),('77cb9bab-280d-4aad-9b06-aa558e96482a',-31.3967389,-64.2521017,71,NULL),('784e6fce-26f2-4752-9453-428d1973e531',-32.8672142,-68.8126542,23,NULL),('78d38570-89d8-449a-807d-31f716a678d9',-32.8938675,-68.8402141,8,NULL),('794f4c7e-493b-467e-bea5-311883f53e07',-31.4103297,-64.1816266,82,NULL),('79c81b5b-97e5-4c51-b636-f0debfaf8985',-32.8045916,-68.77264629999999,26,NULL),('79d14786-2e3d-4608-bed0-6e1cd753f22d',-32.86633440000001,-68.8289399,9,NULL),('7a5a7847-79a7-4d0a-9448-2e992d80c4dc',-34.6226101,-68.3746108,17,NULL),('7a837f6a-3a9d-4549-a746-662996df1e99',-34.6335071,-68.3384088,19,NULL),('7adf2c1a-c327-4a12-a687-51744f0f0d89',-32.89737530000001,-68.8287129,19,NULL),('7d330e3f-5432-4fcf-974f-6dfb00956e90',-31.4353174,-64.2894921,102,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('7ec79e5f-697f-42e1-ac3f-9ed4d212e8f5',-32.8964894,-68.83197729999999,30,'bea493d5-5d0f-4f93-a762-db035e01694a'),('81c5d462-88b7-40a7-9ddc-a8a1771fad51',-33.3037777,-66.2593313,32,NULL),('82258305-fdc9-4821-bab7-61cdea74535a',-33.0365565,-65.520556,47,NULL),('847a552a-7e7c-47c1-a716-2fb76bec6a35',-32.8692662,-68.844835,0,NULL),('85562e2a-d886-4352-a6dc-6ab25ff95e55',-33.2737241,-65.6169058,75,'02f21467-53b2-4b49-bdc6-545ec488e600'),('85a78ba5-4f1f-4d97-939e-7752df966224',-33.2133592,-64.9729799,57,NULL),('876d233e-c3ac-41ea-a333-2829bdafcb41',-32.249978,-65.8069272,39,NULL),('87712526-e6ee-4596-b8d4-eb1b85235c9f',-31.4332896,-64.2808569,61,NULL),('89b8f19b-0226-4628-a597-a13b55e866fd',-31.3966151,-64.2520456,70,NULL),('8b2d29a0-8bc0-4233-9f92-5597827fd1d3',-34.6296966,-68.3834816,16,NULL),('8b2f1262-46f6-41b6-89d6-d66786bedd75',-32.8936031,-68.84152329999999,25,'bea493d5-5d0f-4f93-a762-db035e01694a'),('8c15425f-ac7e-4a90-b7e9-564719a97248',-32.8964224,-68.8422528,11,NULL),('8c98a498-76c0-49d5-8935-190dec970aa5',-32.8684004,-68.8431718,90,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('8ce02525-f9d2-463b-8ce1-b058f95e190c',-33.1782623,-64.98583769999999,55,NULL),('8d1c5b4e-b744-4d98-a69e-3afed360e840',-34.6335071,-68.3384088,40,'bea493d5-5d0f-4f93-a762-db035e01694a'),('8d4e91b8-250b-44bf-93af-b6f0b898e52b',-31.3997574,-64.2677721,105,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('8f869f9b-9178-43fc-a670-080b3b56f0a1',-33.0601328,-65.5329397,78,'02f21467-53b2-4b49-bdc6-545ec488e600'),('93888e8f-76c6-4b6e-9986-69268bc94451',-32.8664447,-68.82876550000002,14,NULL),('94892216-f873-410d-867d-a83b9614cce7',-33.2738472,-65.6168074,76,'02f21467-53b2-4b49-bdc6-545ec488e600'),('94c4a077-ada3-4e6b-a061-f6960cdb0b30',-31.4286095,-64.2790192,63,NULL),('961405cf-a1a0-4a6b-8937-7f9801fb7d73',-33.2614624,-66.1720903,35,NULL),('9652baec-bfc9-4aba-bc17-347e52e23be9',-32.8692662,-68.844835,0,NULL),('99844eec-590a-4792-9fe5-a7e8002bb38e',-33.2738472,-65.6168074,40,NULL),('999a717a-da82-4453-9a36-06e318563cde',-31.4115616,-64.2694523,104,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('9bd8e343-6ed5-4ef3-940e-5c64d2692c32',-31.3966151,-64.2520456,72,NULL),('9c6d6893-7728-454b-8217-58b3e4a04db2',-32.897148,-68.828713,17,NULL),('9c8ff6b8-7071-414b-b8f7-d1e92ab79f65',-32.8965789,-68.83285289999999,15,NULL),('9e4ff8ca-2e94-4886-a076-4be090a6d359',-32.8912377,-68.8544177,5,NULL),('9fb720d5-9a9d-470d-9f4b-cbc04d5fb967',-32.897306,-68.8342368,28,'bea493d5-5d0f-4f93-a762-db035e01694a'),('a0d30378-a7ee-491d-8421-5fe7dfc97b02',-31.3948765,-64.262982,69,NULL),('a1310a5f-79fe-4409-bffe-38b8437b3701',-33.0370219,-65.5208313,51,NULL),('a2424b9e-df4c-45d7-9815-a131c7af0472',-32.8664806,-68.8288036,15,NULL),('a2d93577-9c6b-4e3e-a741-0af2dd44d9df',-31.45833619999999,-64.4249253,51,NULL),('a3540e40-67a2-4309-93ad-90a593d1f716',-32.7198156,-68.5939903,32,NULL),('a47a30d2-f34c-4fcc-8670-45cb93bdd2b3',-31.4114748,-64.1821271,83,NULL),('a47d4015-145b-4edf-b43e-a6d9ec221747',-31.45587029999999,-64.4214953,53,NULL),('a6bed874-5a54-4022-931a-f84ae96cb4fd',-31.98916609999999,-65.1645249,98,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('a7bf2d6e-b6c6-4069-b387-d936ac384cd1',-31.4282213,-64.2781455,64,NULL),('a93f7e0f-d964-4db3-8e60-4b78d5a78fe6',-31.5396848,-64.4530333,99,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('a9553c49-1f9f-49b5-9060-fb49e27e223a',-31.4116596,-64.1814195,84,NULL),('aa4e47a1-ad04-490a-ab0f-421d9edd6e42',-32.89737530000001,-68.8287129,18,NULL),('aabb74fb-5b58-4ece-97e8-3e5acf9c21f8',-33.2620176,-66.1687999,34,NULL),('acfac2a1-f6b7-4d2f-94ee-bdebb06de534',-31.4305533,-64.2812264,62,NULL),('aee6c19a-0261-4a32-9968-bf8b9521ea1b',-32.8964224,-68.8422528,66,'02f21467-53b2-4b49-bdc6-545ec488e600'),('afa7d8b2-2eef-4fbe-9f89-cf547adc12b6',-31.4353174,-64.2894921,55,NULL),('b0d63dce-ea15-484d-bfd1-9dd44eb74faa',-31.4346932,-64.27878559999999,57,NULL),('b1186e67-7b1e-4cd2-9669-c14989da737d',-32.7169468,-68.6804283,27,NULL),('b22b7f56-8b11-41b5-9fd9-11bccc75f599',-33.1779868,-64.9861573,83,'02f21467-53b2-4b49-bdc6-545ec488e600'),('b29a233d-46e5-4011-ba94-caa02ede730c',-33.0596465,-65.5357465,77,'02f21467-53b2-4b49-bdc6-545ec488e600'),('b37b146b-389e-4fa9-af76-fa20fb819be2',-32.7211945,-68.587334,34,NULL),('b5354a92-16a0-4866-ae57-2e678ea8b8dd',-31.4101936,-64.1815671,80,NULL),('b61bb10d-d58e-4189-8dc5-5ac76a8397f0',-33.1435371,-65.0842906,53,NULL),('b647c7ad-9b0b-45b3-a16e-d3cda2965738',-32.7582452,-68.39415869999999,36,NULL),('b6c9161e-3617-4f11-82a4-058fc18fcd18',-32.8692662,-68.844835,21,'bea493d5-5d0f-4f93-a762-db035e01694a'),('b871f1ec-6371-4aec-8457-4c568df42f53',-32.8964894,-68.83197729999999,67,'02f21467-53b2-4b49-bdc6-545ec488e600'),('bbeaa0d1-e67f-4b74-9a24-16051bfe629a',-31.5396848,-64.4530333,50,NULL),('bc0e67c8-c2f8-4721-9905-cabef1f0cb69',-32.897306,-68.8342368,14,NULL),('bfdfb406-87ba-49c4-9bf0-895a5b0e0b0e',-31.4136953,-64.1830652,74,NULL),('c02ba6cd-6be8-4502-815d-8d690f2cf947',-32.8659322,-68.842413,6,NULL),('c036acff-2bef-4ad1-820a-62f65e571f94',-33.1782623,-64.98583769999999,56,NULL),('c1fab247-f30f-4eac-94a5-14901c05e386',-33.4126206,-67.1189893,71,'02f21467-53b2-4b49-bdc6-545ec488e600'),('c304f9ab-4e2f-4871-beb5-e698c4aa9a3f',-32.8669902,-68.81303179999999,94,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('c360157c-90e3-4494-b8bd-c99a96df5954',-32.2133347,-67.80197439999999,97,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('c4b6fe19-afd5-4446-91c6-5f638efadad5',-33.4552351,-67.5940841,24,NULL),('c4ee94fb-ebd7-40b6-af90-491079a695ca',-33.7651151,-69.0585964,34,'bea493d5-5d0f-4f93-a762-db035e01694a'),('c62c6bb2-5efd-480a-9d4c-b072df876ca7',-31.4101936,-64.1815671,86,NULL),('c8442b2a-9191-47be-aa82-08d090896477',-33.0601328,-65.5329397,45,NULL),('c913511c-890b-4c41-91ba-c71a2953bc9e',-32.897148,-68.828713,68,'02f21467-53b2-4b49-bdc6-545ec488e600'),('ca245f02-134a-4251-b317-6f9ddc2e2325',-34.6336532,-68.33796509999999,41,'bea493d5-5d0f-4f93-a762-db035e01694a'),('cb569f88-dedf-438b-895d-a552cbc5679c',-32.8964894,-68.83197729999999,9,NULL),('d014a5c0-5016-4c6f-b5a8-b50f1fe00082',-32.866453,-68.8271728,93,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('d427f3e9-cb59-469f-9e99-ded995f77a2b',-32.8964285,-68.8421512,10,NULL),('d5042fc5-6acc-44b1-98b5-7dcad837f081',-32.89737530000001,-68.8287129,69,'02f21467-53b2-4b49-bdc6-545ec488e600'),('d5b3fe32-ddeb-4043-b996-4a99115a789c',-32.8919418,-68.8506793,3,NULL),('d66d21ea-ac3e-4573-8ddb-1b038d625562',-34.6336532,-68.33796509999999,20,NULL),('d9367564-5b24-4e61-803f-176ee0e458e0',-32.9514966,-65.3964393,48,NULL),('d9ee2ce9-1a88-4d53-9198-9ebd380be1a2',-31.3966574,-64.2519195,73,NULL),('dc0d79cb-c661-4c2f-bbfd-7f2e7bd47e12',-31.4282213,-64.2781455,103,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('dc982ad1-7641-49b1-96d7-de39669da10c',-31.9617501,-65.09086409999999,45,NULL),('ddb35d50-f24f-4a7c-978e-25355981a8cf',-31.4137164,-64.1829958,108,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('df14c7ba-5b0f-4e02-bc06-396f4f06228f',-33.2738472,-65.6168074,42,NULL),('e1129223-c4b8-487f-b32b-5f235f7e139a',-31.4144962,-64.1803911,76,NULL),('e122bb9f-74f6-4e1a-8d61-b635d13705c9',-32.8918158,-68.8513277,2,NULL),('e2b84701-1516-47d9-87a7-66dec2a9594f',-31.4103037,-64.1816152,87,NULL),('e2f391a5-fc3d-4955-bf15-75a0be847a15',-32.8964894,-68.83197729999999,16,NULL),('e4a682d6-f31a-4bdf-9b44-8e3a68da55fe',-32.8671965,-68.84610959999999,88,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('e4e2df40-1d60-41d2-abff-151e3dbeed77',-32.89152,-68.8529542,6,NULL),('e588df3a-66b3-4129-aeda-bb43b49adaab',-32.821723,-68.8022429,24,NULL),('e5fd147c-100a-4949-9a6d-5eea9d5f0647',-32.8672451,-68.8131728,20,NULL),('e674e543-4d25-4e7d-9f24-625e6be316c9',-33.2532174,-66.1749262,74,'02f21467-53b2-4b49-bdc6-545ec488e600'),('e8aaa155-9d19-4ba4-9af1-9c0f82f36d02',-32.866453,-68.8271728,13,NULL),('e8f02b51-fbc3-44f2-aeee-cb59d6775607',-31.4560114,-64.4209982,54,NULL),('e9a44a66-1645-4864-888b-be4fdacc4d0e',-32.8936031,-68.84152329999999,4,NULL),('ec5a07ff-1f77-4806-9d4d-b0e446c4ac4c',-32.8660197,-68.8288316,92,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('ee18033d-7098-4cc3-80ea-e13d02009c72',-32.8739505,-68.8460924,1,NULL),('f0148e19-91d5-4b00-a4b2-2d56b393c8fb',-33.1091661,-64.3850042,61,NULL),('f0ff5db2-3db2-4f9a-bbe9-474c4dac93e1',-32.8977081,-68.82036169999999,31,'bea493d5-5d0f-4f93-a762-db035e01694a'),('f1f619a1-063b-46ae-bae0-aa84b8f44bb8',-32.8672329,-68.81303989999999,21,NULL),('f217652f-f151-443e-a202-2e7be488fdce',-32.758456,-68.3942424,35,NULL),('f265c5c8-0116-4129-95f7-0d565a7462ef',-31.4115817,-64.269102,67,NULL),('f342c66a-cfd2-4db7-b9cc-b3987bab1b19',-32.8669902,-68.81303179999999,18,NULL),('f3d7a871-a8d7-4f3d-9aa3-eb0da7e12b71',-31.4103037,-64.1816152,81,NULL),('f5bfe5da-f9f5-4b6c-86a6-1cf166b8ead2',-34.6346385,-68.33907359999999,39,'bea493d5-5d0f-4f93-a762-db035e01694a'),('f5c1b8ad-6772-4a1d-b0ac-907eea1a418c',-33.4129803,-67.1176669,72,'02f21467-53b2-4b49-bdc6-545ec488e600'),('f69bb884-3870-4161-823d-f4beafc419c4',-33.2133592,-64.9729799,82,'02f21467-53b2-4b49-bdc6-545ec488e600'),('f73c96ed-98c7-4258-b756-d4c2df66c875',-33.9470941,-69.077974,14,NULL),('f7895a16-b926-44df-a7d7-66d11bac7b8f',-32.8671882,-68.8459596,2,NULL),('f88969d6-c53d-4f30-b751-c986191f02ba',-34.6296966,-68.3834816,37,'bea493d5-5d0f-4f93-a762-db035e01694a'),('f92e10e3-f8ef-438e-a573-03c56d81121a',-32.8690192,-68.84626399999999,0,NULL),('f98fc9d6-6b9b-4784-8a50-e0b137f2442a',-33.1087107,-64.38499639999999,60,NULL),('f9a339b0-573e-41be-a940-d44e4319db23',-33.7651151,-69.0585964,13,NULL),('f9ef69b9-be16-4708-a5ec-46dd005b9fe1',-31.4142354,-64.2696784,65,NULL),('fa04d262-32ba-4fe0-86e8-0c0c217c93e8',-31.4136953,-64.1830652,107,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('fa80e210-18ee-4a1f-85f6-ae2f057a3ff3',-32.8977081,-68.82036169999999,10,NULL),('fc20dce0-a4c4-4767-9518-dfe5accc79ea',-32.8669933,-68.8217082,16,NULL),('fc62da04-03c1-4287-a2ff-be2a9b434b5f',-31.3966574,-64.2519195,106,'e8472dbd-1220-459d-b980-fc59b5993c2f'),('fe8105c3-294e-4874-8be8-63caf36b8abf',-32.9396557,-65.37601920000002,49,NULL),('ff1f7af4-c72c-4eb3-aef0-bd173a43aac7',-33.9470941,-69.077974,35,'bea493d5-5d0f-4f93-a762-db035e01694a'),('ff4264d0-202d-4c4a-a71a-1ec5c95c2e32',-31.4137164,-64.1829958,75,NULL);
/*!40000 ALTER TABLE `way_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mov'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 10:33:59
