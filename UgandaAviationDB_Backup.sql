-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ugandaaviationdb
-- ------------------------------------------------------
-- Server version	9.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '0c8e476e-4b05-11f1-8559-9c2dcd6b2595:1-5952';

--
-- Table structure for table `economic_impact`
--

DROP TABLE IF EXISTS `economic_impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economic_impact` (
  `ImpactID` int NOT NULL AUTO_INCREMENT,
  `RouteID` int DEFAULT NULL,
  `Est_Annual_Tourism_Revenue_USD` decimal(12,2) DEFAULT NULL,
  `Est_Cargo_Trade_Value_USD` decimal(12,2) DEFAULT NULL,
  `GDP_Multiplier_Factor` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`ImpactID`),
  KEY `RouteID` (`RouteID`),
  CONSTRAINT `economic_impact_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economic_impact`
--

LOCK TABLES `economic_impact` WRITE;
/*!40000 ALTER TABLE `economic_impact` DISABLE KEYS */;
INSERT INTO `economic_impact` VALUES (1,1,45000000.00,12000000.00,2.10),(2,2,25000000.00,85000000.00,2.10),(3,3,15000000.00,30000000.00,2.10),(4,4,18000000.00,14000000.00,2.10);
/*!40000 ALTER TABLE `economic_impact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet`
--

DROP TABLE IF EXISTS `fleet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet` (
  `AircraftID` int NOT NULL AUTO_INCREMENT,
  `Manufacturer` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Estimated_Cost_USD` decimal(12,2) DEFAULT NULL,
  `Annual_Operating_Cost_USD` decimal(12,2) DEFAULT NULL,
  `Annual_Expected_Revenue_USD` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`AircraftID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet`
--

LOCK TABLES `fleet` WRITE;
/*!40000 ALTER TABLE `fleet` DISABLE KEYS */;
INSERT INTO `fleet` VALUES (1,'Boeing','787 Dreamliner','Passenger',294,'On Order (2026 Deal)',145000000.00,18000000.00,22000000.00),(2,'Boeing','737 MAX','Passenger',180,'On Order (2026 Deal)',95000000.00,10000000.00,13500000.00),(3,'Boeing','767-300BCCF','Cargo',50,'On Order (2026 Deal)',80000000.00,12000000.00,16000000.00),(4,'Boeing','737-800BCF','Cargo',22,'On Order (2026 Deal)',45000000.00,6000000.00,8500000.00);
/*!40000 ALTER TABLE `fleet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `RouteID` int NOT NULL AUTO_INCREMENT,
  `Destination_City` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Distance_KM` int DEFAULT NULL,
  `Route_Type` varchar(20) DEFAULT NULL,
  `Target_Launch_Year` int DEFAULT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'London-Gatwick','United Kingdom',6030,'International',2026),(2,'Guangzhou','China',8400,'International',2027),(3,'Jeddah','Saudi Arabia',2900,'Regional',2026),(4,'Cape Town','South Africa',4300,'Regional',2026);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-13 10:38:25
