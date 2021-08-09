CREATE DATABASE  IF NOT EXISTS `heroku_83c89d7d77e295e` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_83c89d7d77e295e`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: us-cdbr-east-04.cleardb.com    Database: heroku_83c89d7d77e295e
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(45) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Taquito','taquito@gmail.com','$2b$14$aCOiz3TY8AhvitebJJpfZ.pVF0fQaoTjzMOFhAaxo6DVAMo5NxA7.','$2b$14$aCOiz3TY8AhvitebJJpfZ.'),(2,'Balbino','balbino@gmail.com','$2b$14$oMHH9.Xqw3nUHlgU6C9pYuPuiSyeycU/NXEXcMs7zhpWbnTjzy0Je','$2b$14$oMHH9.Xqw3nUHlgU6C9pYu');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `doctor` varchar(50) NOT NULL,
  `reason` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (5,'ger@ger','2021-08-11','14:58:00','Cardiología','Dr. Preston Burke','123'),(15,'gui@gui','2021-08-11','13:41:00','General','Dra. Meredith Grey','Lele culito'),(25,'monica@gmail.com','2021-08-17','14:30:00','Trauma','Dr. Owen Hunt','Fractura'),(35,'idegoa79@hotmail.es','2021-08-10','14:30:00','Ortopedia','Dra. Calliope Torres','Dolor en la zona tibial'),(45,'aaron@gmail.com','2021-08-10','10:47:00','General','Dra. Meredith Grey','Dolor de cabeza'),(55,'aaron@gmail.com','2021-08-11','09:00:00','General','Dra. Meredith Grey','Fractura en el dedo');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `address` varchar(60) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `postal` varchar(45) NOT NULL,
  `tel` int(11) NOT NULL,
  `cel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (5,'ger@ger','2021-08-13','ger','2021-07-01','masculino','soltero','12345',12,23),(15,'andres.hercules@gmail.com','2021-08-08','Senda 14','2000-07-04','masculino','soltero','1150',22297692,74869837),(25,'aaron@gmail.com','2021-08-08','Calle Los Alpes','2013-01-09','masculino','soltero','00001',7589,9809),(35,'aaron@gmail.com','2021-08-08','Calle Los Alpes','2013-01-09','masculino','soltero','00001',7589,9809);
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'ger','ger@ger','$2b$14$Dy6F5cTpQ1FrftVdZlhspOm5/FlVOkj0JbBXpQObSwREX2cJNwLW6','$2b$14$Dy6F5cTpQ1FrftVdZlhspO'),(15,'rodrigo','rodrigo@esen.com','$2b$14$HSFNTEe2GcPMhzHGG7aFT.2V650vz9uOllFWYl/vPPaCyrC9vjoV2','$2b$14$HSFNTEe2GcPMhzHGG7aFT.'),(25,'Guillermo','gui@gui','$2b$14$1Sjq1khcnz9hW3TIsGsshewxnIRnckIHJzijQVQ4FhlVW5575H/pK','$2b$14$1Sjq1khcnz9hW3TIsGsshe'),(35,'Monica','monica@gmail.com','$2b$14$jXxVx9BSvOH7xaTj1LAC9uzsZ6qAwJKOjCAFZf5EtydbaCO/QmvYi','$2b$14$jXxVx9BSvOH7xaTj1LAC9u'),(45,'Andres Hercules','andres.hercules@gmail.com','$2b$14$iXqynOS.sSdnRJ1jo5xkkuhsZNlWUYWSg7GNQuPhfgvZNpmSEjP66','$2b$14$iXqynOS.sSdnRJ1jo5xkku'),(55,'Diego ','idegoa79@hotmail.es','$2b$14$/bcv5erPtBeGFtbXAeyT9uLoKT4J9MCsBS67bKrhOBufIew8vIWNq','$2b$14$/bcv5erPtBeGFtbXAeyT9u'),(65,'Fausto','Cornejo','$2b$14$.YtPp5PrJDuifYSIvrMYve0tKEJDJlV0FaNKS/B5iaGGiaHHLsJS6','$2b$14$.YtPp5PrJDuifYSIvrMYve'),(75,'aaron','aaron@gmail.com','$2b$14$bR11ObRc6iS8uB6o/eY4EeOztJaAV41vQuPVjRq.A3Lqz7nKqS/Vq','$2b$14$bR11ObRc6iS8uB6o/eY4Ee');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventamedicina`
--

DROP TABLE IF EXISTS `ventamedicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventamedicina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_dr` varchar(45) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_medicina` int(11) NOT NULL,
  `nombreMed` varchar(45) NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `estadoVenta` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventamedicina`
--

LOCK TABLES `ventamedicina` WRITE;
/*!40000 ALTER TABLE `ventamedicina` DISABLE KEYS */;
INSERT INTO `ventamedicina` VALUES (5,'taquito@gmail.com',35,1,'Acetaminofen',0.07,'A pagar'),(15,'taquito@gmail.com',35,6,'Alerfín',0.13,'A pagar'),(25,'taquito@gmail.com',35,7,'Nervitrán',0.20,'A pagar'),(35,'taquito@gmail.com',35,11,'Calsil Plus',0.18,'A pagar'),(45,'balbino@gmail.com',35,1,'Acetaminofen',0.07,'A pagar'),(55,'balbino@gmail.com',35,5,'Claritisil',1.06,'A pagar'),(65,'balbino@gmail.com',35,9,'Ciproxil LS',1.06,'A pagar'),(75,'balbino@gmail.com',35,1,'Acetaminofen',0.07,'A pagar'),(85,'balbino@gmail.com',5,1,'Acetaminofen',0.07,'A pagar'),(95,'balbino@gmail.com',5,3,'Dorival',0.25,'A pagar'),(105,'balbino@gmail.com',35,8,'Celedexa',0.40,'A pagar'),(115,'balbino@gmail.com',35,10,'Nor-gerom forte',0.25,'A pagar'),(125,'balbino@gmail.com',35,12,'Propal 10',0.08,'A pagar'),(135,'balbino@gmail.com',35,13,'Tavalam 160/5',0.90,'A pagar'),(145,'balbino@gmail.com',35,1,'Acetaminofen',0.07,'A pagar'),(155,'balbino@gmail.com',75,1,'Acetaminofen',0.07,'A pagar');
/*!40000 ALTER TABLE `ventamedicina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-09 10:01:43
