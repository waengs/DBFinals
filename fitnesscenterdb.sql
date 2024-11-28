-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fitnesscenterdb
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `Id` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Schedule` varchar(100) DEFAULT NULL,
  `TrainerId` int NOT NULL,
  `RoomNumber` varchar(20) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `TrainerId` (`TrainerId`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`TrainerId`) REFERENCES `trainer` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `classes_chk_1` CHECK ((`Capacity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Yoga Class','Monday, 6 PM',1,'Room 101',20);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolledin`
--

DROP TABLE IF EXISTS `enrolledin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolledin` (
  `MembershipId` int NOT NULL,
  `ClassId` int NOT NULL,
  PRIMARY KEY (`MembershipId`,`ClassId`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `enrolledin_ibfk_1` FOREIGN KEY (`MembershipId`) REFERENCES `membership` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `enrolledin_ibfk_2` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolledin`
--

LOCK TABLES `enrolledin` WRITE;
/*!40000 ALTER TABLE `enrolledin` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrolledin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `Id` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `TheCondition` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Treadmill','Cardio',1200.00,'2022-01-15','Good');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `Id` int NOT NULL,
  `EquipmentId` int NOT NULL,
  `MaintenanceDate` date NOT NULL,
  `MaintenanceType` varchar(50) DEFAULT NULL,
  `TechnicianName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `EquipmentId` (`EquipmentId`),
  CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`EquipmentId`) REFERENCES `equipment` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `Id` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `MonthlyFee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `membership_chk_1` CHECK ((`MonthlyFee` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotional`
--

DROP TABLE IF EXISTS `promotional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotional` (
  `Id` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `DiscountPercentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotional`
--

LOCK TABLES `promotional` WRITE;
/*!40000 ALTER TABLE `promotional` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotional_classes`
--

DROP TABLE IF EXISTS `promotional_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotional_classes` (
  `PromotionalId` int NOT NULL,
  `ClassId` int NOT NULL,
  PRIMARY KEY (`PromotionalId`,`ClassId`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `promotional_classes_ibfk_1` FOREIGN KEY (`PromotionalId`) REFERENCES `promotional` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `promotional_classes_ibfk_2` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotional_classes`
--

LOCK TABLES `promotional_classes` WRITE;
/*!40000 ALTER TABLE `promotional_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotional_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotional_membership`
--

DROP TABLE IF EXISTS `promotional_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotional_membership` (
  `PromotionalId` int NOT NULL,
  `MembershipId` int NOT NULL,
  PRIMARY KEY (`PromotionalId`,`MembershipId`),
  KEY `MembershipId` (`MembershipId`),
  CONSTRAINT `promotional_membership_ibfk_1` FOREIGN KEY (`PromotionalId`) REFERENCES `promotional` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `promotional_membership_ibfk_2` FOREIGN KEY (`MembershipId`) REFERENCES `membership` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotional_membership`
--

LOCK TABLES `promotional_membership` WRITE;
/*!40000 ALTER TABLE `promotional_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotional_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `Id` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Specialty` varchar(50) DEFAULT NULL,
  `YearsOfExperience` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `trainer_chk_1` CHECK ((`YearsOfExperience` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,'Alice Johnson','Yoga',5,'alice@example.com');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 19:23:58
