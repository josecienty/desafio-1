-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: idesa
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `caracteristica` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,'Lugar Confortable','2023-11-08 20:49:58','2023-11-08 20:49:58'),(2,'Vista Plena','2023-11-08 20:49:58','2023-11-08 20:49:58'),(3,'Prueba','2023-11-08 22:53:30','2023-11-08 22:53:30');
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `lat` double(13,8) NOT NULL,
  `lng` double(13,8) NOT NULL,
  `departamento_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ciudades_departamento_id_foreign` (`departamento_id`),
  CONSTRAINT `ciudades_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Asunción','asuncion',-25.28348800,-57.60221100,1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(2,'Arroyito','arroyito',-23.26663700,-56.45074200,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(3,'Azotey','azotey',-23.31815800,-56.48845900,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(4,'Belén','belen',-23.46955400,-57.26189600,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(5,'Concepción','concepcion',-23.41844200,-57.43363600,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(6,'Horqueta','horqueta',-23.34706100,-57.05346100,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(7,'Loreto','loreto',-23.27600200,-57.32545800,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(8,'Paso Barreto','paso-barreto',-23.05015400,-57.12199200,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(9,'San Alfredo','san-alfredo',-22.88174800,-57.40008800,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(10,'San Carlos del Apa','san-carlos-del-apa',-22.24537000,-57.28880900,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(11,'San Lázaro','san-lazaro',-22.10587900,-57.96277300,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(12,'Sargento José Félix López','sargento-jose-felix-lopez',-22.37704300,-56.91505900,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(13,'Yby Yaú','yby-yau',-22.96586900,-56.54297300,2,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(14,'Antequera','antequera',-24.08642600,-57.20134400,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(15,'Capiibary','capiibary',-24.73494100,-56.01997400,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(16,'Choré','chore',-24.18584900,-56.58143500,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(17,'General Elizardo Aquino','general-elizardo-aquino',-24.44546900,-56.89922300,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(18,'General Isidoro Resquín','general-isidoro-resquin',-24.06443100,-56.44942800,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(19,'Guayaibí','guayaibi',-24.52971100,-56.40741400,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(20,'Itacurubí del Rosario','itacurubi-del-rosario',-24.53322200,-56.82081700,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(21,'Liberación','liberacion',-24.19177800,-56.43445000,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(22,'Lima','lima',-23.88538600,-56.48026200,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(23,'Nueva Germania','nueva-germania',-23.91253700,-56.70262800,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(24,'San Estanislao','san-estanislao',-24.66632100,-56.44775400,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(25,'San Pablo','san-pablo',-24.10535400,-56.86617900,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(26,'San Pedro','san-pedro',-24.08886100,-57.07534800,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(27,'Santa Rosa del Aguaray','santa-rosa-del-aguaray',-23.82773900,-56.52122600,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(28,'San Vicente Pancholo','san-vicente-pancholo',-24.00317800,-56.13275800,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(29,'Tacuatí','tacuati',-23.45832500,-56.73781900,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(30,'Unión','union',-24.80870700,-56.52113900,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(31,'25 de Diciembre','25-de-diciembre',-24.81240700,-56.72687500,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(32,'Villa del Rosario','villa-del-rosario',-24.42159400,-57.11701900,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(33,'Yataity del Norte','yataity-del-norte',-24.84625400,-56.35471300,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(34,'Yrybucuá','yrybucua',-24.48039100,-56.08567700,3,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(35,'Altos','altos',-25.26161600,-57.24979900,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(36,'Arroyos y Esteros','arroyos-y-esteros',-25.05434500,-57.09714900,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(37,'Atyrá','atyra',-25.28067200,-57.17396700,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(38,'Caacupé','caacupe',-25.38543100,-57.14000800,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(39,'Caraguatay','caraguatay',-25.23856200,-56.82618100,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(40,'Emboscada','emboscada',-25.12355400,-57.34910700,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(41,'Eusebio Ayala','eusebio-ayala',-25.38216400,-56.96185800,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(42,'Isla Pucú','isla-pucu',-25.31027800,-56.90012500,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(43,'Itacurubí de la Cordillera','itacurubi-de-la-cordillera',-25.46170000,-56.85336800,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(44,'Juan de Mena','juan-de-mena',-24.95458500,-56.76376100,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(45,'Loma Grande','loma-grande',-25.17787400,-57.23136700,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(46,'Mbocayaty del Yhaguy','mbocayaty-del-yhaguy',-25.34300800,-56.72729400,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(47,'Nueva Colombia','nueva-colombia',-25.18626300,-57.30503100,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(48,'Piribebuy','piribebuy',-25.46319700,-57.04180400,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(49,'Primero de Marzo','primero-de-marzo',-25.15324800,-56.92859900,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(50,'San Bernardino','san-bernardino',-25.30414200,-57.29250900,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(51,'San José Obrero','san-jose-obrero',-25.17700000,-56.91626100,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(52,'Santa Elena','santa-elena',-25.41393500,-56.79730000,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(53,'Tobatí','tobati',-25.26335100,-57.08430600,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(54,'Valenzuela','valenzuela',-25.59309600,-56.87117800,4,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(55,'Borja','borja',-25.95167800,-56.49566900,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(56,'Troche','troche',-25.61629600,-56.27441900,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(57,'Coronel Martínez','coronel-martinez',-25.75914100,-56.61662600,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(58,'Dr. Bottrell','dr-bottrell',-25.61478900,-56.33972500,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(59,'Félix Pérez Cardozo','felix-perez-cardozo',-25.74445200,-56.52463700,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(60,'Garay','garay',-25.96761300,-56.18532700,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(61,'Independencia','independencia',-25.68956600,-56.26969800,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(62,'Itapé','itape',-25.85121000,-56.61242000,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(63,'Iturbe','iturbe',-26.05568300,-56.48506900,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(64,'Fassardi','fassardi',-25.97855100,-56.12290600,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(65,'Mbocayaty','mbocayaty',-25.71566700,-56.40865800,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(66,'Natalicio Talavera','natalicio-talavera',-25.65497000,-56.30894400,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(67,'Ñumí','numi',-25.95090400,-56.32900700,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(68,'Paso Yobai','paso-yobai',-25.72270400,-55.99765800,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(69,'San Salvador','san-salvador',-25.93894200,-56.47253800,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(70,'Tebicuary','tebicuary',-25.77160400,-56.65041600,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(71,'Villarrica','villarrica',-25.78206500,-56.44608100,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(72,'Yataity','yataity',-25.68766600,-56.46762400,5,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(73,'Caaguazú','caaguazu',-25.46596000,-56.01941600,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(74,'Carayaó','carayao',-25.19885400,-56.39827300,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(75,'Coronel Oviedo','coronel-oviedo',-25.45076200,-56.44323600,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(76,'Doctor Cecilio Báez','doctor-cecilio-baez',-25.07077000,-56.24244500,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(77,'Doctor J. Eulogio Estigarribia','doctor-j-eulogio-estigarribia',-25.37395400,-55.70292300,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(78,'Doctor Juan Manuel Frutos','doctor-juan-manuel-frutos',-25.38361800,-55.82955800,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(79,'José Domingo Ocampos','jose-domingo-ocampos',-25.41040700,-55.43005900,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(80,'La Pastora','la-pastora',-25.24286400,-56.53620300,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(81,'Mcal. Francisco S. López','mcal-francisco-s-lopez',-25.23970700,-55.07532100,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(82,'Nueva Londres','nueva-londres',-25.40517400,-56.54890500,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(83,'Raúl Arsenio Oviedo','raul-arsenio-oviedo',-25.19569900,-55.60387700,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(84,'Repatriación','repatriacion',-25.53760100,-55.99137100,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(85,'R. I. Tres Corrales','r-i-tres-corrales',-25.33985500,-56.19154300,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(86,'San Joaquín','san-joaquin',-25.02827100,-56.04505700,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(87,'San José de los Arroyos','san-jose-de-los-arroyos',-25.53194700,-56.73193900,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(88,'Santa Rosa del Mbutuy','santa-rosa-del-mbutuy',-24.97740200,-56.30960900,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(89,'Simón Bolívar','simon-bolivar',-25.05250800,-56.32593900,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(90,'Tres de Febrero','tres-de-febrero',-25.24820600,-55.77776000,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(91,'Vaquería','vaqueria',-25.00066300,-55.82159800,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(92,'Yhú','yhu',-25.05786300,-55.92176200,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(93,'Tembiaporá','tembiapora',-25.32680400,-55.37811100,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(94,'Nueva Toledo','nueva-toledo',-24.97170300,-55.62040900,6,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(95,'Abaí','abai',-26.03769500,-55.94768300,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(96,'Buena Vista','buena-vista',-26.18494100,-56.08243700,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(97,'Caazapá','caazapa',-26.19532700,-56.36844700,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(98,'Doctor Moisés S. Bertoni','doctor-moises-s-bertoni',-26.35745800,-56.48682800,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(99,'Fulgencio Yegros','fulgencio-yegros',-26.45547400,-56.40408800,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(100,'General Higinio Morínigo','general-higinio-morinigo',-26.02566600,-56.08492600,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(101,'Maciel','maciel',-26.18255300,-56.47264500,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(102,'San Juan Nepomuceno','san-juan-nepomuceno',-26.11074400,-55.93802700,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(103,'Tavaí','tavai',-26.16799400,-55.67303600,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(104,'Tres de Mayo','tres-de-mayo',-26.48037100,-56.09627900,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(105,'Yuty','yuty',-26.61507000,-56.24951700,7,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(106,'Alto Verá','alto-vera',-26.75212500,-55.76776000,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(107,'Bella Vista Sur','bella-vista-sur',-27.05481600,-55.56881600,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(108,'Cambyretá','cambyreta',-27.35927200,-55.76307700,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(109,'Capitán Meza','capitan-meza',-26.83070700,-55.33916700,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(110,'Capitán Miranda','capitan-miranda',-27.21866500,-55.80189300,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(111,'Carlos Antonio López','carlos-antonio-lopez',-26.39910300,-54.75736000,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(112,'Carmen del Paraná','carmen-del-parana',-27.22115700,-56.15197500,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(113,'Coronel Bogado','coronel-bogado',-27.16207200,-56.24074100,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(114,'Edelira','edelira',-26.76770100,-55.27876100,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(115,'Encarnación','encarnacion',-27.33378200,-55.86573500,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(116,'Fram','fram',-27.09603700,-56.01731300,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(117,'General Artigas','general-artigas',-26.93479100,-56.22174000,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(118,'General Delgado','general-delgado',-27.09101400,-56.52498000,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(119,'Hohenau','hohenau',-27.08243300,-55.64819800,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(120,'Itapúa Poty','itapua-poty',-26.63021600,-55.52018100,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(121,'Jesús','jesus',-27.05629500,-55.74252600,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(122,'La Paz','la-paz',-26.99046500,-55.89079900,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(123,'José Leandro Oviedo','jose-leandro-oviedo',-26.74415400,-56.27931100,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(124,'Mayor Otaño','mayor-otano',-26.35059200,-54.72328900,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(125,'Natalio','natalio',-26.75645400,-55.13851400,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(126,'Nueva Alborada','nueva-alborada',-27.26824800,-55.69250800,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(127,'Obligado','obligado',-27.05705900,-55.63038800,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(128,'Pirapó','pirapo',-26.85807800,-55.54444200,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(129,'San Cosme y Damián','san-cosme-y-damian',-27.31702100,-56.33204900,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(130,'San Juan del Paraná','san-juan-del-parana',-27.29958800,-55.95603000,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(131,'San Pedro del Paraná','san-pedro-del-parana',-26.83335700,-56.20626900,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(132,'San Rafael del Paraná','san-rafael-del-parana',-26.65489900,-54.93378600,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(133,'Tomás Romero Pereira','tomas-romero-pereira',-26.48324300,-55.25000400,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(134,'Trinidad','trinidad',-27.12934700,-55.70566200,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(135,'Yatytay','yatytay',-26.67472700,-55.08587800,8,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(136,'Ayolas','ayolas',-27.38430300,-56.82502200,9,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(137,'San Ignacio','san-ignacio',-26.88708900,-57.02573800,9,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(138,'San Juan Bautista','san-juan-bautista',-26.66912600,-57.14302600,9,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(139,'San Miguel','san-miguel',-26.53597600,-57.04026500,9,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(140,'San Patricio','san-patricio',-26.97603800,-56.82759400,9,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(141,'Santa María','santa-maria',-26.78404200,-56.94355500,9,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(142,'Santa Rosa','santa-rosa',-26.88731700,-56.85042900,9,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(143,'Santiago','santiago',-27.14142700,-56.76451700,9,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(144,'Villa Florida','villa-florida',-26.40978200,-57.12088100,9,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(145,'Yabebyry','yabebyry',-27.37879800,-57.16536300,9,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(146,'Acahay','acahay',-25.91300600,-57.11298500,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(147,'Caapucú','caapucu',-26.23335800,-57.18147700,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(148,'Carapeguá','carapegua',-25.76704200,-57.24310400,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(149,'Escobar','escobar',-25.64369200,-57.03573700,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(150,'Gral. Bernardino Caballero','gral-bernardino-caballero',-25.69370600,-56.86253100,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(151,'La Colmena','la-colmena',-25.88575100,-56.84139500,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(152,'María Antonia','maria-antonia',-26.43209100,-56.90525200,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(153,'Mbuyapey','mbuyapey',-26.22078900,-56.75648700,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(154,'Paraguarí','paraguari',-25.62170800,-57.15025400,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(155,'Pirayú','pirayu',-25.48543000,-57.23550800,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(156,'Quiindy','quiindy',-25.97480700,-57.23372700,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(157,'Quyquyhó','quyquyho',-26.23072000,-56.98771500,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(158,'San Roque González de Santa Cruz','san-roque-gonzalez-de-santa-cruz',-25.87814400,-57.28919500,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(159,'Sapucai','sapucai',-25.66554800,-56.95707300,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(160,'Tebicuarymí','tebicuarymi',-25.91466600,-56.67606400,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(161,'Yaguarón','yaguaron',-25.56327100,-57.28614800,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(162,'Ybycuí','ybycui',-26.01947600,-57.01706900,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(163,'Ybytymí','ybytymi',-25.75825100,-56.80277100,10,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(164,'Ciudad del Este','ciudad-del-este',-25.50417300,-54.66177700,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(165,'Doctor Juan León Mallorquín','doctor-juan-leon-mallorquin',-25.43082600,-55.25333500,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(166,'Doctor Raúl Peña','doctor-raul-pena',-26.15649700,-55.27238800,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(167,'Domingo Martínez de Irala','domingo-martinez-de-irala',-25.84440900,-54.67234900,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(168,'Hernandarias','hernandarias',-25.40826400,-54.64273500,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(169,'Iruña','iruna',-26.11097600,-55.05618100,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(170,'Itakyry','itakyry',-24.98403500,-55.15035900,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(171,'Juan Emilio O Leary','juan-emilio-o-leary',-25.42265400,-55.37233800,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(172,'Los Cedrales','los-cedrales',-25.65588000,-54.71974700,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(173,'Mbaracayú','mbaracayu',-25.02868300,-54.82308600,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(174,'Minga Guazú','minga-guazu',-25.50713600,-54.83218100,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(175,'Minga Porá','minga-pora',-24.87529200,-54.93312100,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(176,'Naranjal','naranjal',-25.97324600,-55.18784500,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(177,'Ñacunday','nacunday',-26.01616000,-54.69313900,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(178,'Presidente Franco','presidente-franco',-25.56521400,-54.61484200,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(179,'San Alberto','san-alberto',-24.97434800,-54.91642700,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(180,'San Cristóbal','san-cristobal',-25.89206300,-55.46778200,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(181,'Santa Fe del Paraná','santa-fe-del-parana',-25.22321900,-54.70290200,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(182,'Santa Rita','santa-rita',-25.79312700,-55.08512100,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(183,'Santa Rosa del Monday','santa-rosa-del-monday',-25.81426200,-54.90404600,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(184,'Tavapy','tavapy',-25.66151200,-54.99309000,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(185,'Yguazú','yguazu',-25.44523300,-55.09381300,11,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(186,'Areguá','aregua',-25.29963300,-57.41286600,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(187,'Capiatá','capiata',-25.35549700,-57.44222500,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(188,'Fernando de la Mora','fernando-de-la-mora',-25.32794700,-57.54672400,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(189,'Guarambaré','guarambare',-25.49378100,-57.45501600,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(190,'Itá','ita',-25.50484400,-57.36545300,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(191,'Itauguá','itaugua',-25.39367200,-57.35358900,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(192,'Julián Augusto Saldívar','julian-augusto-saldivar',-25.44422000,-57.43920400,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(193,'Lambaré','lambare',-25.34324100,-57.62199700,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(194,'Limpio','limpio',-25.16674300,-57.47116000,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(195,'Luque','luque',-25.26950600,-57.49059700,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(196,'Mariano Roque Alonso','mariano-roque-alonso',-25.20070300,-57.52305000,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(197,'Ñemby','nemby',-25.39400800,-57.54488500,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(198,'Nueva Italia','nueva-italia',-25.61158500,-57.46673400,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(199,'San Antonio','san-antonio',-25.41105500,-57.55140400,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(200,'San Lorenzo','san-lorenzo',-25.34398000,-57.50918600,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(201,'Villa Elisa','villa-elisa',-25.37230800,-57.58320200,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(202,'Villeta','villeta',-25.50814100,-57.56399900,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(203,'Ypacaraí','ypacarai',-25.40364300,-57.28879200,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(204,'Ypané','ypane',-25.46459600,-57.50810700,12,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(205,'Alberdi','alberdi',-26.18900300,-58.13965900,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(206,'Cerrito','cerrito',-27.33414500,-57.63878300,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(207,'Desmochados','desmochados',-27.12069700,-58.09177600,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(208,'General José Eduvigis Díaz','general-jose-eduvigis-diaz',-27.20227300,-58.36791500,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(209,'Guazú Cuá','guazu-cua',-26.88161700,-57.96902000,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(210,'Humaitá','humaita',-27.06623300,-58.50522300,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(211,'Isla Umbú','isla-umbu',-26.98260600,-58.27101200,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(212,'Laureles','laureles',-27.24823800,-57.46027700,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(213,'Mayor José J. Martínez','mayor-jose-j-martinez',-27.14667900,-58.22910800,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(214,'Paso de Patria','paso-de-patria',-27.24448000,-58.54728000,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(215,'Pilar','pilar',-26.86144900,-58.30129200,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(216,'San Juan Bautista del Ñeembucú','san-juan-bautista-del-neembucu',-26.67093800,-57.90071500,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(217,'Tacuaras','tacuaras',-26.81901500,-57.98217100,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(218,'Villa Franca','villa-franca',-26.31498000,-58.14742600,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(219,'Villa Oliva','villa-oliva',-26.01643700,-57.85775900,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(220,'Villalbín','villalbin',-27.13853800,-57.93048300,13,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(221,'Bella Vista Norte','bella-vista-norte',-22.12275900,-56.51474900,14,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(222,'Capitán Bado','capitan-bado',-23.26936500,-55.53772300,14,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(223,'Pedro Juan Caballero','pedro-juan-caballero',-22.55213900,-55.73254300,14,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(224,'Zanja Pytá','zanja-pyta',-22.62922200,-55.62936900,14,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(225,'Karapaí','karapai',-23.59859800,-55.98624200,14,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(226,'Corpus Christi','corpus-christi',-24.07959500,-54.93932300,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(227,'Curuguaty','curuguaty',-24.47144500,-55.69278700,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(228,'General Francisco Caballero Álvarez','general-francisco-caballero-alvarez',-24.09985100,-54.78393700,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(229,'Itanará','itanara',-23.75212500,-55.46489700,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(230,'Katueté','katuete',-24.24864500,-54.75972200,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(231,'La Paloma','la-paloma',-24.13167400,-54.61196400,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(232,'Maracaná','maracana',-24.34434800,-55.78970200,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(233,'Nueva Esperanza','nueva-esperanza',-24.52868500,-54.84366000,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(234,'Salto del Guairá','salto-del-guaira',-24.06728800,-54.30634300,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(235,'Villa Ygatimí','villa-ygatimi',-24.12392000,-55.64377800,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(236,'Yasy Cañy','yasy-cany',-24.52486800,-55.87779500,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(237,'Yby Pytá','yby-pyta',-24.34178100,-55.38296000,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(238,'Ybyrarobaná','ybyrarobana',-24.23340000,-55.11716000,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(239,'Ypejhú','ypejhu',-23.88913900,-55.44096700,15,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(240,'Benjamín Aceval','benjamin-aceval',-24.95887900,-57.54810500,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(241,'Doctor José Falcón','doctor-jose-falcon',-25.25765600,-57.71396700,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(242,'General José María Bruguez','general-jose-maria-bruguez',-23.89930200,-58.26507500,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(243,'Nanawa','nanawa',-25.30252500,-57.68188100,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(244,'Puerto Pinasco','puerto-pinasco',-22.64542300,-57.84084000,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(245,'Teniente Primero Manuel Irala Fernández','teniente-primero-manuel-irala-fernandez',-23.67813800,-58.46832200,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(246,'Teniente Esteban Martínez','teniente-esteban-martinez',-24.08333700,-59.80287600,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(247,'Villa Hayes','villa-hayes',-25.09068300,-57.53030700,16,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(248,'Filadelfia','filadelfia',-22.35288700,-60.03306300,17,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(249,'Loma Plata','loma-plata',-22.38205000,-59.83524500,17,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(250,'Mariscal José Félix Estigarribia','mariscal-jose-felix-estigarribia',-22.03003900,-60.60017200,17,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(251,'Bahía Negra','bahia-negra',-20.22877600,-58.16887400,18,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(252,'Capitán Carmelo Peralta','capitan-carmelo-peralta',-21.67296100,-57.91761500,18,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(253,'Fuerte Olimpo','fuerte-olimpo',-21.03820200,-57.87305800,18,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(254,'Puerto Casado','puerto-casado',-22.28449000,-57.93919100,18,'2023-11-08 20:48:29','2023-11-08 20:48:29');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Capital','capital',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(2,'Concepción','concepcion',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(3,'San Pedro','san-pedro',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(4,'Cordillera','cordillera',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(5,'Guairá','guaira',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(6,'Caaguazú','caaguazu',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(7,'Caazapá','caazapa',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(8,'Itapúa','itapua',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(9,'Misiones','misiones',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(10,'Paraguarí','paraguari',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(11,'Alto Paraná','alto-parana',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(12,'Central','central',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(13,'Ñeembucú','neembucu',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(14,'Amambay','amambay',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(15,'Canindeyú','canindeyu',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(16,'Presidente Hayes','presidente-hayes',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(17,'Boquerón','boqueron',1,'2023-11-08 20:48:28','2023-11-08 20:48:28'),(18,'Alto Paraguay','alto-paraguay',1,'2023-11-08 20:48:28','2023-11-08 20:48:28');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
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
-- Table structure for table `manzanas`
--

DROP TABLE IF EXISTS `manzanas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manzanas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `ciudad_id` bigint(20) unsigned NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manzanas_ciudad_id_foreign` (`ciudad_id`),
  CONSTRAINT `manzanas_ciudad_id_foreign` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manzanas`
--

LOCK TABLES `manzanas` WRITE;
/*!40000 ALTER TABLE `manzanas` DISABLE KEYS */;
INSERT INTO `manzanas` VALUES (1,'Manzana 1',5,0,'2023-11-08 20:49:58','2023-11-08 20:49:58'),(2,'Titulo',60,0,'2023-11-08 22:53:30','2023-11-08 22:53:30');
/*!40000 ALTER TABLE `manzanas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_11_08_133541_create_departamentos_table',1),(6,'2023_11_08_133547_create_ciudades_table',1),(7,'2023_11_08_141723_create_propiedades_estados_table',1),(8,'2023_11_08_141824_create_caracteristicas_table',1),(9,'2023_11_08_145515_create_manzanas_table',1),(10,'2023_11_08_146644_create_propiedades_table',1),(11,'2023_11_08_146829_create_propiedades_caracteristicas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'login-token','2039aab1cc5ee48957e8ba4da7507c26f6dff413202787a0b245326cd2117809','[\"*\"]','2023-11-08 23:36:01',NULL,'2023-11-08 20:48:58','2023-11-08 23:36:01'),(2,'App\\Models\\User',1,'login-token','47b5b029c8507a446c03a668664219e67d018e73e57d05f46e8243468b7c9993','[\"*\"]',NULL,NULL,'2023-11-08 23:01:25','2023-11-08 23:01:25');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `cuota_desde` int(11) NOT NULL,
  `superficie` int(11) NOT NULL,
  `longitud` decimal(10,7) NOT NULL,
  `latitud` decimal(10,7) NOT NULL,
  `manzana_id` bigint(20) unsigned NOT NULL,
  `propiedad_estado_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propiedades_manzana_id_foreign` (`manzana_id`),
  KEY `propiedades_propiedad_estado_id_foreign` (`propiedad_estado_id`),
  CONSTRAINT `propiedades_manzana_id_foreign` FOREIGN KEY (`manzana_id`) REFERENCES `manzanas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `propiedades_propiedad_estado_id_foreign` FOREIGN KEY (`propiedad_estado_id`) REFERENCES `propiedades_estados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (1,'Lomas de plata',200000,1203,-59.0000000,-12.5034000,1,1,'2023-11-08 20:49:58','2023-11-08 20:49:58');
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades_caracteristicas`
--

DROP TABLE IF EXISTS `propiedades_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades_caracteristicas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `propiedad_id` bigint(20) unsigned NOT NULL,
  `caracteristica_id` bigint(20) unsigned NOT NULL,
  `orden` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propiedades_caracteristicas_propiedad_id_foreign` (`propiedad_id`),
  KEY `propiedades_caracteristicas_caracteristica_id_foreign` (`caracteristica_id`),
  CONSTRAINT `propiedades_caracteristicas_caracteristica_id_foreign` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `propiedades_caracteristicas_propiedad_id_foreign` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades_caracteristicas`
--

LOCK TABLES `propiedades_caracteristicas` WRITE;
/*!40000 ALTER TABLE `propiedades_caracteristicas` DISABLE KEYS */;
INSERT INTO `propiedades_caracteristicas` VALUES (1,1,1,1,'2023-11-08 20:49:58','2023-11-08 20:49:58'),(2,1,2,2,'2023-11-08 20:49:58','2023-11-08 20:49:58');
/*!40000 ALTER TABLE `propiedades_caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades_estados`
--

DROP TABLE IF EXISTS `propiedades_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades_estados` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `orden` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades_estados`
--

LOCK TABLES `propiedades_estados` WRITE;
/*!40000 ALTER TABLE `propiedades_estados` DISABLE KEYS */;
INSERT INTO `propiedades_estados` VALUES (1,'Disponible',1,1,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(2,'Reserva Vendedor',2,1,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(3,'Reservado',3,1,'2023-11-08 20:48:29','2023-11-08 20:48:29'),(4,'Vendido',4,1,'2023-11-08 20:48:29','2023-11-08 20:48:29');
/*!40000 ALTER TABLE `propiedades_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrador','admin@idesa.com.py','2023-11-08 20:48:29','$2y$12$7x2.Vdo9TQ7CEYzT7HzDA.azT1rbknZr/W0USS0hMOPblm.VMsgRC',NULL,'2023-11-08 20:48:29','2023-11-08 20:48:29');
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

-- Dump completed on 2023-11-08 18:17:29
