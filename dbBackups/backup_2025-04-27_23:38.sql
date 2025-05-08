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
INSERT INTO `events` VALUES ('10MAYO','2025-05-09','Seminario Internacional sobre \"El Rol del Físico Médico en la Radioterapia\".',1),('12ABRIL','2025-04-11','Seminario Internacional sobre \"Conservación de Alimentos por Irradiación\".',1),('22FEBRERO','2025-02-21','Seminario Internacional sobre \"Protección Radiológica en Intervencionismo\".',1),('26ABRIL','2025-04-25','Seminario Internacional sobre \"Derecho Nuclear\".',0),('28JUNIO','2025-06-28','Seminario Internacional sobre \"Funciones y Retos del Oficial de Protección Radiológica\".',0),('29MARZO','2025-03-28','Seminario Internacional sobre \"Formación y Capacitación de Operadores de Plantas Nucleares\".',1),('31MAYO','2025-05-30','Seminario Internacional sobre \"Protección Radiológica y el rol del Médico especialista en Radioterapia\".',0),('4ENERO','2025-01-01','Seminario Internacional sobre el Halcyon.',1),('8FEBRERO','2025-02-07','Seminario Internacional sobre \"Protección Radiológica y la Importancia del Tecnólogo en Radioterapia\"',1),('8MARZO','2025-03-07','Seminario Internacional sobre \"Control de Calidad en Resonancia Magnética\".',1),('IHB5M','2025-05-03','Curso de Radioprotección Aplicada para personal de Salud.',1);
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
  `time_register` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_register`
--

LOCK TABLES `events_register` WRITE;
/*!40000 ALTER TABLE `events_register` DISABLE KEYS */;
INSERT INTO `events_register` VALUES (1,'10MAYO','Raúl','Villalta','raulvillalta@gmail.com','licenciado','Físico Médico','Hosp. Domingo Luciani','VE','4122949106','Aorendizaje',NULL,NULL),(2,'26ABRIL','Luis Alfonso','Menéndez','luis.menendez1990@gmail.com','Titulo',NULL,'',NULL,'78406607','Estoy interesado en cuanto al tema debido que hasta el momento no había escuchado nada sobre derecho nuclear',NULL,NULL),(3,'26ABRIL','Raul','Recinos','raul.recinossierr@gmail.com','Lic. En producción de imágenes diagnósticas',NULL,'Centro médico zacapa',NULL,'3022-8830','',NULL,NULL),(4,'26ABRIL','Elizabeth','Rivera','liz.rivera2010@gmail.com','Maestría',NULL,'IGSS',NULL,'57044445','Conocimiento de todas las variables soy EPR',NULL,NULL),(5,'26ABRIL','Gabriela','Valencia Aguilera','gvvalencia-es@udabol.edu.bo','Magister en Derecho Constitucional',NULL,'Autoridad de Electricidad y Tecnología Nuclear',NULL,'71264184','Por el área en el que trabajo, tengo la necesidad de adquirir y fortalecer mis conocimientos en el area',NULL,NULL),(6,'26ABRIL','Angie Ximena','Lamprea Yara','Axlamprea@fucsalud.edu.co','Estudiante',NULL,'Fundación universitaria de Ciencias de la Salud FUCS',NULL,'3024203026','Nuevos conocimientos',NULL,NULL),(7,'26ABRIL','Allison Noelia','TAPIA','allisonarchi@gmail.com','Liceniatura',NULL,'Aben',NULL,'+591 60735991','',NULL,NULL),(8,'26ABRIL','Marthagraciela','Rodríguez maya','marthagracielarodriguezmaya@gmail.com','Doctora',NULL,'Particular',NULL,'56 6365 0839','Asunto relevante',NULL,NULL),(9,'26ABRIL','Liz','Peña Franco','lapf23@gmail.com','Lcda',NULL,'FACEN',NULL,'+595984962699','',NULL,NULL),(10,'10MAYO','Daniel','Canjura','dokanjura@gmail.com','licenciado','Radiología','ISSS','SV','78224030','Educación continua',NULL,NULL),(11,'10MAYO','PAOLA','ANDREA CONDORI YAVE','yave.paola021@gmail.com','licenciado','Iamgenologa','Hospital SAN ANDRES','BO','75705906','',NULL,NULL),(12,'10MAYO','Juan R.','Cruz Castaños','fisiokinecruz@gmail.com','licenciado','Rdiolologo','Hospital 9 de abril','BO','62350025','Conocer más detalles',NULL,NULL),(13,'10MAYO','Chory','Heredia matos','Herediamatos268@gmail.com','licenciado','Imagen médicas','Uasd','DO','8294759733','Para mi actualización como profesional',NULL,NULL),(14,'10MAYO','Jerry','Rivera Barco','jerryriverabarco10@gmail.com','otro','Fisico médico','Oncorad','PE','949719473','Información',NULL,NULL),(15,'10MAYO','Blanca','Mereles','bgmereles@gmail.com','licenciado','Físico medico','Universidad Nacional de Asunción','PY','982889051','Adquirir conocimientos \r\nVer criterios de países extranjeros',NULL,NULL),(16,'10MAYO','Dario','Bustos','dariobustosconcordia@gmail.com','tecnico','Técnico Radiólogo','Hospital Felipe Heras','AR','3454186685','Actualización y formación profesional',NULL,NULL),(17,'10MAYO','Mildref','Mora','mnmnphdeducacion2024@gmail.com','magister','Físico medico','HCU Dr Antonio María Pineda','VE','4245217912','',NULL,NULL),(18,'10MAYO','Roger','Portillo','Rportill77@yahoo.es','especialista','Físico médico','Minsa','NI','88064405','Actualización',NULL,NULL),(19,'10MAYO','Jean','Teodoro','fis_jean@yahoo.com.br','especialista','Físico','UOA-ACCG','otro','62984465929','Aprimoramento',NULL,NULL),(20,'10MAYO','Ricardo','Anglada','Ranglada@cne.gob.do','tecnico','Sector regulatoria gubernamental','Comisión Nacional de Energía de la República Dominicana','DO','8094056696','Me itnereza hacer un Msc en Físico Médica.',NULL,NULL),(21,'10MAYO','Celso luis','Melgarejo Arevalos','melgarejo356@gmail.com','licenciado','Lic en Radiología','Instituto de Previsión Social','PY','991313455','Uno nunca termina de aprender',NULL,NULL),(22,'10MAYO','Francisco Javier','Hernández Flores','franciscohernandez_f2010@hotmail.com','magister','Fisica Medica','Minsa','NI','83969681','Educación continua',NULL,NULL),(23,'10MAYO','Yamil','Alí Cruz','yac69.13@gmail.com','licenciado','Licenciado en Bio-Imagenología','GAMS','BO','77133334','Crecimiento profesional.',NULL,NULL),(24,'10MAYO','Estefanía Katherine Freire','Navas','sthefyfreire@gmail.com','otro','Biofísica','Hospital general privado DURÁN','EC','+59395158806','Me gustaría obtener más conocimiento',NULL,NULL),(25,'10MAYO','César Augusto López','Zapeta','dxcesarlopez1945@gmail.com','tecnico','Tecnico Radiologo','Escuela de Radiologia','GT','55415055','Me interesa para estar al dia sobre TEMAS RELACIONADOS A PROTECCION RADIOLOGICA, SOY DOCENTE PARA TECNICO',NULL,NULL),(26,'10MAYO','Yldrin Mariel','Rojas','yldrinrojas@gmail.com','licenciado','Radiologa','Radiodontica','PY','0991800060','Capacitación',NULL,NULL),(27,'26ABRIL','Katherine Gabriela','Garcia Lagod','Abogkatherinelagos585@gmail.com','Abogada',NULL,'SECRETARIA DE ENERGIA',NULL,'3243-9617','Me gusta tener conocimiento de diferentes áreas.',NULL,NULL),(28,'10MAYO','Ilda','Chica','ildachica@yahoo.es','magister','Ing Quimico','MEM','EC','0967738788','',NULL,NULL),(29,'26ABRIL','laura','Pimentel','pimentellaura48@gmail.com','Licenciatura en ciencias jurodicas',NULL,'Litigante',NULL,'70030941','Conocimiento',NULL,NULL),(30,'10MAYO','Rosio Galvez','Vasquez','rosi_gv@hotmail.com','licenciado','Tecnologo Médico','Hospital Arzobispo Loayza','PE','972575220','','2025-04-26 00:24:15',NULL),(31,'10MAYO','Maryory','Ramos Gómez','medic.hokage@hotmail.com','licenciado','Tecnólogo médico','Iren centro','PE','926216575','Estudiante física médica','2025-04-26 03:15:59',NULL),(32,'10MAYO','Cristian','Pajaro','ccpajaro@fucsalud.edu.co','otro','Estudiante','FUCS','CO','+57 3105505394','Me gustaría saber más acerca de modalidad de radioterapia ya que esta rama me gusta','2025-04-26 17:50:08',NULL),(33,'10MAYO','Cecilia','Alfaro','ceciliaalfaro536@gmail.com','especialista','Física médica','Unime','SV','60022476','Interes','2025-04-26 19:26:19',NULL);
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
  `time_register` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_register`
--

LOCK TABLES `newsletter_register` WRITE;
/*!40000 ALTER TABLE `newsletter_register` DISABLE KEYS */;
INSERT INTO `newsletter_register` VALUES (1,'Cecilia','Alonzo','Ceciliaalfaro536@gmail.com',NULL),(2,'Raul','Villalta','raulvillalta@gmail.com',NULL),(4,'William Antonio','Aristizabal Loaiza','kelgaras@outlook.com',NULL),(5,'Hillary','Bautista','hcbautista@fucsalud.edu.co',NULL),(6,'Leoreana','Marcano','leoreanasantos@gmail.com',NULL),(7,'Jhon','Doe','Jhondoe@gmail.com',NULL),(8,'Lorena','Arias','lorebea82@yahoo.com',NULL),(9,'Juan Miguel','Olalla Pilco','jmiguelolalla@gmail.com',NULL),(10,'Cristian','Pajaro','ccpajaro@fucsalud.edu.co',NULL),(11,'Duvan','Lopez lopez','duvanlolo7@gmail.com',NULL),(12,'Jessica','Acero','alejaguzman68_ecuador@hotmail.com',NULL),(13,'María Fernanda','Giménez Riveros','gimenezfernanda2311@gmail.com',NULL),(14,'GIOVANNI VICENTE','GANTE RENDON','ggante3@gmail.com',NULL),(15,'Julian Orlando','Paez Lopez','jopaezl@unal.edu.co',NULL),(16,'Úrsula','Carrera','ursula.carrera@ibama.gov.br',NULL),(17,'Carlos Raúl','Rodríguez salgado','bufetejuridicorodriguez647@gmail.com',NULL),(18,'Luis Alfonso','Menéndez','luis.menendez1990@gmail.com',NULL),(19,'Raul','Recinos','raul.recinossierr@gmail.com',NULL),(20,'Elizabeth','Rivera','liz.rivera2010@gmail.com',NULL),(21,'Gabriela','Valencia Aguilera','gvvalencia-es@udabol.edu.bo',NULL),(22,'Marthagraciela','Rodríguez maya','marthagracielarodriguezmaya@gmail.com',NULL),(23,'Liz','Peña Franco','lapf23@gmail.com',NULL),(24,'Daniel','Canjura','dokanjura@gmail.com',NULL),(25,'PAOLA','ANDREA CONDORI YAVE','yave.paola021@gmail.com',NULL),(26,'Juan R.','Cruz Castaños','fisiokinecruz@gmail.com',NULL),(27,'Chory','Heredia matos','Herediamatos268@gmail.com',NULL),(28,'Jerry','Rivera Barco','jerryriverabarco10@gmail.com',NULL),(29,'Blanca','Mereles','bgmereles@gmail.com',NULL),(30,'Dario','Bustos','dariobustosconcordia@gmail.com',NULL),(31,'Mildref','Mora','mnmnphdeducacion2024@gmail.com',NULL),(32,'Roger','Portillo','Rportill77@yahoo.es',NULL),(33,'Jean','Teodoro','fis_jean@yahoo.com.br',NULL),(34,'Ricardo','Anglada','Ranglada@cne.gob.do',NULL),(35,'Celso luis','Melgarejo Arevalos','melgarejo356@gmail.com',NULL),(36,'Francisco Javier','Hernández Flores','franciscohernandez_f2010@hotmail.com',NULL),(37,'Yamil','Alí Cruz','yac69.13@gmail.com',NULL),(38,'Estefanía Katherine Freire','Navas','sthefyfreire@gmail.com',NULL),(39,'César Augusto López','Zapeta','dxcesarlopez1945@gmail.com',NULL),(40,'Yldrin Mariel','Rojas','yldrinrojas@gmail.com',NULL),(41,'Katherine Gabriela','Garcia Lagod','Abogkatherinelagos585@gmail.com',NULL),(42,'Ilda','Chica','ildachica@yahoo.es',NULL),(43,'laura','Pimentel','pimentellaura48@gmail.com',NULL),(44,'Rosio Galvez','Vasquez','rosi_gv@hotmail.com','2025-04-26 00:24:15'),(45,'Maryory','Ramos Gómez','medic.hokage@hotmail.com','2025-04-26 03:15:59');
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

-- Dump completed on 2025-04-27 23:38:02
