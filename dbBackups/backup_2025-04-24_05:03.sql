-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: aspr.mysql.pythonanywhere-services.com    Database: aspr$aspr
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Current Database: `aspr$aspr`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `aspr$aspr` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `aspr$aspr`;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` varchar(15) NOT NULL,
  `limit_date` date DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('10MAYO','2025-05-09','Seminario Internacional sobre \"El Rol del Físico Médico en la Radioterapia\".',1),('12ABRIL','2025-04-11','Seminario Internacional sobre \"Conservación de Alimentos por Irradiación\".',1),('22FEBRERO','2025-02-21','Seminario Internacional sobre \"Protección Radiológica en Intervencionismo\".',1),('26ABRIL','2025-04-25','Seminario Internacional sobre \"Derecho Nuclear\".',1),('28JUNIO','2025-06-28','Seminario Internacional sobre \"Funciones y Retos del Oficial de Protección Radiológica\".',0),('29MARZO','2025-03-28','Seminario Internacional sobre \"Formación y Capacitación de Operadores de Plantas Nucleares\".',1),('31MAYO','2025-05-30','Seminario Internacional sobre \"Protección Radiológica y el rol del Médico especialista en Radioterapia\".',0),('4ENERO','2025-01-01','Seminario Internacional sobre el Halcyon.',1),('8FEBRERO','2025-02-07','Seminario Internacional sobre \"Protección Radiológica y la Importancia del Tecnólogo en Radioterapia\"',1),('8MARZO','2025-03-07','Seminario Internacional sobre \"Control de Calidad en Resonancia Magnética\".',1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_register`
--

DROP TABLE IF EXISTS `events_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_register` (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `event_id` varchar(10) DEFAULT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `tlf` varchar(20) DEFAULT NULL,
  `motives` text,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_register`
--

LOCK TABLES `events_register` WRITE;
/*!40000 ALTER TABLE `events_register` DISABLE KEYS */;
INSERT INTO `events_register` VALUES (1,'10MAYO','Raúl','Villalta','raulvillalta@gmail.com','licenciado','Físico Médico','Hosp. Domingo Luciani','VE','4122949106','Aorendizaje'),(2,'26ABRIL','Luis Alfonso','Menéndez','luis.menendez1990@gmail.com','Titulo',NULL,'',NULL,'78406607','Estoy interesado en cuanto al tema debido que hasta el momento no había escuchado nada sobre derecho nuclear');
/*!40000 ALTER TABLE `events_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_register_old`
--

DROP TABLE IF EXISTS `events_register_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_register_old` (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `inputs` text,
  `event_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_register_old`
--

LOCK TABLES `events_register_old` WRITE;
/*!40000 ALTER TABLE `events_register_old` DISABLE KEYS */;
INSERT INTO `events_register_old` VALUES (1,'Cecilia','Alonzo','Ceciliaalfaro536@gmail.com','Doctora|50378845155|Unime|Jefe|Educación','26ABRIL'),(2,'Raul','Villalta','raulvillalta@gmail.com','Lcdo. Física|584122949106|Hosp. Domingo Luciani|Físico Médico|','26ABRIL'),(3,'Jessica','Gonzalez','jkg24en@hotmail.com','Licda en radiologia e imagenes|77477722|Cnrt|Prof en radiologia|Ampliar conocimientos','26ABRIL'),(4,'William Antonio','Aristizabal Loaiza','kelgaras@outlook.com','Tecnólogo en radiología|3007483936|La cardio|Tecnólogo|Aprender, instruirse y tener mejores conocimientos cada día.','26ABRIL'),(5,'Hillary','Bautista','hcbautista@fucsalud.edu.co','Estudiante|3138345059|Fucs|Radiologia|','26ABRIL'),(6,'Leoreana','Marcano','leoreanasantos@gmail.com','Maestría en física médica|04248897718|||','26ABRIL'),(8,'Lorena','Arias','lorebea82@yahoo.com','Licenciada en ciencias jurídicas|72613071|FGR|Auxiliar fiscal|','26ABRIL'),(9,'Juan Miguel','Olalla Pilco','jmiguelolalla@gmail.com','Maestría|+593999796645|Nuclearmed|OSR|Conocer los fundamentos del Derecho Nuclear','26ABRIL'),(10,'Cristian','Pajaro','ccpajaro@fucsalud.edu.co','Estudiante|+57 3105505394|FUCS|Estudiante|Quisiera aprender más sobre otras ramas relacionadas a la la radiología','26ABRIL'),(11,'Duvan','Lopez lopez','duvanlolo7@gmail.com','Tecnologo en radiología|3112227898|Hospital|Radiologo|Capacitarnos','26ABRIL'),(12,'Jessica','Acero','alejaguzman68_ecuador@hotmail.com','Lic. Radiología|0984707962|Servisalud|Radiologia|Tener mayor conocimiento en el ámbito','26ABRIL'),(13,'María Fernanda','Giménez Riveros','gimenezfernanda2311@gmail.com','Licenciatura|+595 973 200 206|||Aprender','26ABRIL'),(14,'GIOVANNI VICENTE','GANTE RENDON','ggante3@gmail.com','Lic. Radiologia e Imagen|7471092443|HGRAA|Radiologia|Aprender y actualizar sobre protección Radiologica','26ABRIL'),(15,'Julian Orlando','Paez Lopez','jopaezl@unal.edu.co','Maestría física médica|+57 3222066473|Instituto Nacional de Cancerologia|Físico médico- Protección Radiológica|Estoy interesado en conocer desde una óptica internacional lo relacionado con derecho nuclear y las diferentes formas en que se implementa y sus retos. Esto en razón de mis funciones como OPR de la institución en la que trabajo.','26ABRIL'),(16,'Úrsula','Carrera','ursula.carrera@ibama.gov.br','Biologa|55 61 981038004|Ibama|Analista de Medio Ambiente|Trabajo con solicitudes de permiso para generacion de energía.','26ABRIL'),(17,'Carlos Raúl','Rodríguez salgado','bufetejuridicorodriguez647@gmail.com','Abogado|50488946255|SEN|Asesor legal|Ampliar los conocimientos legales','26ABRIL');
/*!40000 ALTER TABLE `events_register_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_register`
--

DROP TABLE IF EXISTS `newsletter_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_register` (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_register`
--

LOCK TABLES `newsletter_register` WRITE;
/*!40000 ALTER TABLE `newsletter_register` DISABLE KEYS */;
INSERT INTO `newsletter_register` VALUES (1,'Cecilia','Alonzo','Ceciliaalfaro536@gmail.com'),(2,'Raul','Villalta','raulvillalta@gmail.com'),(4,'William Antonio','Aristizabal Loaiza','kelgaras@outlook.com'),(5,'Hillary','Bautista','hcbautista@fucsalud.edu.co'),(6,'Leoreana','Marcano','leoreanasantos@gmail.com'),(7,'Jhon','Doe','Jhondoe@gmail.com'),(8,'Lorena','Arias','lorebea82@yahoo.com'),(9,'Juan Miguel','Olalla Pilco','jmiguelolalla@gmail.com'),(10,'Cristian','Pajaro','ccpajaro@fucsalud.edu.co'),(11,'Duvan','Lopez lopez','duvanlolo7@gmail.com'),(12,'Jessica','Acero','alejaguzman68_ecuador@hotmail.com'),(13,'María Fernanda','Giménez Riveros','gimenezfernanda2311@gmail.com'),(14,'GIOVANNI VICENTE','GANTE RENDON','ggante3@gmail.com'),(15,'Julian Orlando','Paez Lopez','jopaezl@unal.edu.co'),(16,'Úrsula','Carrera','ursula.carrera@ibama.gov.br'),(17,'Carlos Raúl','Rodríguez salgado','bufetejuridicorodriguez647@gmail.com'),(18,'Luis Alfonso','Menéndez','luis.menendez1990@gmail.com');
/*!40000 ALTER TABLE `newsletter_register` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24  5:03:32
