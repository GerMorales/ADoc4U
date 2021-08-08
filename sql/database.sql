CREATE DATABASE  IF NOT EXISTS `doctordb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `doctordb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: doctordb
-- ------------------------------------------------------
-- Server version	8.0.25

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
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(45) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `doctor` varchar(50) NOT NULL,
  `reason` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (8,'monica@gmail.com','2021-07-14','15:30:00','Neurología','Dr. Derek Shepherd','cardiopatia'),(9,'monica@gmail.com','2021-07-15','17:00:00','Neurología','Dra. Lexie Grey','cardiopatia'),(10,'monica@gmail.com','2021-07-09','18:00:00','Cardiología','Dra. Cristina Yang','cardiopatia'),(11,'monica@gmail.com','2021-07-08','15:00:00','Cardiología','Dra. Cristina Yang','cardiopatia'),(12,'monica@gmail.com','2021-07-15','15:30:00','Ortopedia','Dra. Calliope Torres','cefalea'),(13,'blacky@gmail.com','2021-07-16','10:10:00','Ortopedia','Dra. Calliope Torres','cardiopatia'),(14,'taquito@gmail.com','2021-07-09','09:30:00','Ortopedia','Dra. Calliope Torres','cefalea'),(15,'monica@gmail.com','2021-07-08','13:30:00','Neurología','Dr. Derek Shepherd','cefalea'),(16,'monica@gmail.com','2021-07-28','14:10:00','Neurología','Dra. Lexie Grey','cardiopatia'),(17,'monica@gmail.com','2021-07-15','16:28:00','Neurología','Dr. Derek Shepherd','cardiopatia'),(18,'gui@gui','2021-07-14','09:34:00','General','Dra. Meredith Grey','Sospecha covid'),(19,'gui@gui','2021-07-07','10:40:00','Neurología','Dr. Derek Shepherd','nada');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `address` varchar(60) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `postal` varchar(45) NOT NULL,
  `tel` int NOT NULL,
  `cel` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (1,'monica@gmail.com','2021-07-23','Santa Elena','2021-07-05','femenino','Soltera','503',22367890,78643897),(2,'monica@gmail.com','2021-07-02','Santa Elena','2021-07-14','femenino','Soltera','503',22678345,78654890),(3,'monica@gmail.com','2021-07-06','Santa Elena','2021-07-07','masculino','Soltera','503',34535,3453),(4,'monica@gmail.com','2021-07-14','Santa Elena','2021-07-21','femenino','Soltera','503',1233,123),(5,'blacky@gmail.com','2021-07-21','Santa Elena','2021-07-07','masculino','Soltero','503',2128799,987979821),(6,'taquito@gmail.com','2021-07-14','Santa Elena','2021-07-28','masculino','Soltero','503',98798,870978);
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Monica ','monica@gmail.com','$2b$14$gSwPwyxgJg04TG/VtQ4if.rxPxwqM3r2tpM7RlX182VlvYqllteQu','$2b$14$gSwPwyxgJg04TG/VtQ4if.'),(2,'Blacky','blacky@gmail.com','$2b$14$lrhoZKdL1944Xj/mOxx/pOoNgW0yfLNs2L5WRqMscBst8VxLstICa','$2b$14$lrhoZKdL1944Xj/mOxx/pO'),(3,'Benji','benji@gmail.com','$2b$14$Qzr9uipK2vWjRbXrXm490uCF6/W5xCkcN1xwEosj4MC.A0VlXf9Me','$2b$14$Qzr9uipK2vWjRbXrXm490u'),(4,'Guillermo','gui@gui','$2b$14$HWG6oR5w77nNXqmnVkP68eI67UJvvKvyJw8ud7g1zxbsy7HeRPmnW','$2b$14$HWG6oR5w77nNXqmnVkP68e'),(5,'juan','juan@juan','$2b$14$9NEqOmbYo9GyY.do2t6ZWu37RU01UzLxIp9GEMnKkmbWdRFUfDraO','$2b$14$9NEqOmbYo9GyY.do2t6ZWu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventamedicina`
--

DROP TABLE IF EXISTS `ventamedicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventamedicina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_dr` varchar(45) NOT NULL,
  `id_user` int NOT NULL,
  `id_medicina` int NOT NULL,
  `nombreMed` varchar(45) NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `estadoVenta` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventamedicina`
--

LOCK TABLES `ventamedicina` WRITE;
/*!40000 ALTER TABLE `ventamedicina` DISABLE KEYS */;
INSERT INTO `ventamedicina` VALUES (1,'taquito@gmail.com',1,1,'Acetaminofen',0.07,'A pagar'),(2,'taquito@gmail.com',1,2,'Acetosil',0.06,'A pagar'),(9,'taquito@gmail.com',1,7,'Nervitrán',0.20,'A pagar'),(70,'taquito@gmail.com',5,1,'Acetaminofen',0.07,'A pagar'),(71,'taquito@gmail.com',5,2,'Acetosil',0.06,'A pagar'),(72,'taquito@gmail.com',5,3,'Dorival',0.25,'A pagar'),(73,'taquito@gmail.com',5,4,'Azitrosil',3.65,'A pagar'),(74,'taquito@gmail.com',5,5,'Claritisil',1.06,'A pagar'),(75,'taquito@gmail.com',5,6,'Alerfín',0.13,'A pagar'),(76,'taquito@gmail.com',1,6,'Alerfín',0.13,'A pagar'),(77,'taquito@gmail.com',1,6,'Alerfín',0.13,'A pagar'),(78,'taquito@gmail.com',1,7,'Nervitrán',0.20,'A pagar'),(79,'taquito@gmail.com',1,8,'Celedexa',0.40,'A pagar'),(80,'taquito@gmail.com',1,9,'Ciproxil LS',1.06,'A pagar'),(81,'taquito@gmail.com',1,10,'Nor-gerom forte',0.25,'A pagar'),(83,'taquito@gmail.com',5,8,'Celedexa',0.40,'A pagar'),(84,'taquito@gmail.com',5,3,'Dorival',0.25,'A pagar'),(85,'taquito@gmail.com',5,7,'Nervitrán',0.20,'A pagar'),(90,'taquito@gmail.com',5,14,'Alamo 16',0.90,'A pagar'),(91,'taquito@gmail.com',1,1,'Acetaminofen',0.07,'A pagar'),(92,'taquito@gmail.com',1,4,'Azitrosil',3.65,'A pagar'),(93,'taquito@gmail.com',1,6,'Alerfín',0.13,'A pagar'),(94,'taquito@gmail.com',1,7,'Nervitrán',0.20,'A pagar'),(95,'taquito@gmail.com',1,1,'Acetaminofen',0.07,'A pagar'),(96,'taquito@gmail.com',1,4,'Azitrosil',3.65,'A pagar'),(97,'taquito@gmail.com',1,6,'Alerfín',0.13,'A pagar'),(98,'taquito@gmail.com',1,7,'Nervitrán',0.20,'A pagar'),(99,'taquito@gmail.com',1,8,'Celedexa',0.40,'A pagar'),(109,'taquito@gmail.com',1,2,'Acetosil',0.06,'A pagar'),(110,'taquito@gmail.com',1,4,'Azitrosil',3.65,'A pagar'),(111,'taquito@gmail.com',1,5,'Claritisil',1.06,'A pagar'),(112,'taquito@gmail.com',1,6,'Alerfín',0.13,'A pagar'),(113,'taquito@gmail.com',1,7,'Nervitrán',0.20,'A pagar'),(137,'taquito@gmail.com',5,1,'Acetaminofen',0.07,'A pagar'),(138,'taquito@gmail.com',5,2,'Acetosil',0.06,'A pagar'),(139,'taquito@gmail.com',1,1,'Acetaminofen',0.07,'A pagar'),(140,'taquito@gmail.com',1,2,'Acetosil',0.06,'A pagar'),(141,'taquito@gmail.com',3,1,'Acetaminofen',0.07,'A pagar'),(142,'taquito@gmail.com',3,2,'Acetosil',0.06,'A pagar');
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

-- Dump completed on 2021-08-07 14:42:01
