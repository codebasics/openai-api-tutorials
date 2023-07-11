CREATE DATABASE  IF NOT EXISTS `atliq_college_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atliq_college_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: atliq_college_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `student_name` varchar(100) NOT NULL,
  `semester` int NOT NULL,
  `total_fees` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `pending` decimal(10,2) NOT NULL,
  PRIMARY KEY (`student_name`,`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES ('Bill Gates',2,6000.00,6000.00,0.00),('Elon Musk',3,7000.00,2000.00,5000.00),('Jack Ma',4,8000.00,4000.00,4000.00),('Jeff Bezos',3,7000.00,4000.00,3000.00),('Larry Page',3,7000.00,6000.00,1000.00),('Lauki Lal',1,5000.00,2500.00,2500.00),('Mark Zuckerberg',3,7000.00,5000.00,2000.00),('Michael Dell',4,8000.00,6000.00,2000.00),('Peter Pandey',1,5000.00,3000.00,2000.00),('Robert Downey',2,6000.00,4000.00,2000.00),('Sachin Tendulkar',2,6000.00,2000.00,4000.00),('Satya Nadella',4,8000.00,3000.00,5000.00),('Sergey Brin',4,8000.00,2000.00,6000.00),('Steve Jobs',2,6000.00,5000.00,1000.00),('Sundar Pichai',4,8000.00,5000.00,3000.00),('Thor Hathodawala',1,5000.00,3500.00,1500.00),('Tim Cook',3,7000.00,3000.00,4000.00),('Tom Cruise',2,6000.00,3000.00,3000.00),('Virat Kohli',1,5000.00,4000.00,1000.00),('Wanda Mishra',1,5000.00,2000.00,3000.00);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `student_name` varchar(100) NOT NULL,
  `semester` int NOT NULL,
  `gpa` decimal(3,2) NOT NULL,
  PRIMARY KEY (`student_name`,`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES ('Bill Gates',2,3.00),('Elon Musk',3,2.70),('Jack Ma',4,3.30),('Jeff Bezos',3,2.50),('Larry Page',3,2.90),('Lauki Lal',1,3.60),('Mark Zuckerberg',3,2.80),('Michael Dell',4,3.50),('Peter Pandey',1,3.70),('Robert Downey',2,3.40),('Sachin Tendulkar',2,3.20),('Satya Nadella',4,3.20),('Sergey Brin',4,3.10),('Steve Jobs',2,3.10),('Sundar Pichai',4,3.40),('Thor Hathodawala',1,3.80),('Tim Cook',3,2.60),('Tom Cruise',2,3.30),('Virat Kohli',1,3.90),('Wanda Mishra',1,3.50);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06 18:16:04
