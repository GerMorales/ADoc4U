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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Taquito','taquito@gmail.com','$2b$14$aCOiz3TY8AhvitebJJpfZ.pVF0fQaoTjzMOFhAaxo6DVAMo5NxA7.','$2b$14$aCOiz3TY8AhvitebJJpfZ.');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (8,'monica@gmail.com','2021-07-14','15:30:00','Neurología','Dr. Derek Shepherd','cardiopatia'),(9,'monica@gmail.com','2021-07-15','17:00:00','Neurología','Dra. Lexie Grey','cardiopatia'),(10,'monica@gmail.com','2021-07-09','18:00:00','Cardiología','Dra. Cristina Yang','cardiopatia'),(11,'monica@gmail.com','2021-07-08','15:00:00','Cardiología','Dra. Cristina Yang','cardiopatia'),(12,'monica@gmail.com','2021-07-15','15:30:00','Ortopedia','Dra. Calliope Torres','cefalea'),(13,'blacky@gmail.com','2021-07-16','10:10:00','Ortopedia','Dra. Calliope Torres','cardiopatia'),(14,'taquito@gmail.com','2021-07-09','09:30:00','Ortopedia','Dra. Calliope Torres','cefalea'),(15,'monica@gmail.com','2021-07-08','13:30:00','Neurología','Dr. Derek Shepherd','cefalea'),(16,'monica@gmail.com','2021-07-28','14:10:00','Neurología','Dra. Lexie Grey','cardiopatia'),(17,'monica@gmail.com','2021-07-15','16:28:00','Neurología','Dr. Derek Shepherd','cardiopatia');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Monica ','monica@gmail.com','$2b$14$gSwPwyxgJg04TG/VtQ4if.rxPxwqM3r2tpM7RlX182VlvYqllteQu','$2b$14$gSwPwyxgJg04TG/VtQ4if.'),(2,'Blacky','blacky@gmail.com','$2b$14$lrhoZKdL1944Xj/mOxx/pOoNgW0yfLNs2L5WRqMscBst8VxLstICa','$2b$14$lrhoZKdL1944Xj/mOxx/pO'),(4,'Benji','benji@gmail.com','$2b$14$Qzr9uipK2vWjRbXrXm490uCF6/W5xCkcN1xwEosj4MC.A0VlXf9Me','$2b$14$Qzr9uipK2vWjRbXrXm490u');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-12 18:28:51
