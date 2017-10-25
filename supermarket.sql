CREATE DATABASE  IF NOT EXISTS `supermarket` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `supermarket`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: supermarket
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `Category_ID` int(11) NOT NULL,
  `Category_Name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'fruit'),(2,'vegetable');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `Item_ID` int(11) NOT NULL,
  `Item_Name` varchar(60) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Selling_Price` double DEFAULT NULL,
  `Inventory_Qty` double DEFAULT NULL,
  `Location` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Item_ID`),
  KEY `fk_Category_ID_idx` (`Category_ID`),
  CONSTRAINT `fk_Category_ID` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (1,'apple',1,20,498,'A2B1'),(2,'orange',1,20,495,'A2B2'),(3,'carrot',2,20,497,'B2D3');
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_Method`
--

DROP TABLE IF EXISTS `Payment_Method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment_Method` (
  `PaymentMethod_ID` int(11) NOT NULL,
  `Description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_Method`
--

LOCK TABLES `Payment_Method` WRITE;
/*!40000 ALTER TABLE `Payment_Method` DISABLE KEYS */;
INSERT INTO `Payment_Method` VALUES (1,'cash'),(2,'octopus'),(3,'credit card');
/*!40000 ALTER TABLE `Payment_Method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales_Item`
--

DROP TABLE IF EXISTS `Sales_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sales_Item` (
  `SalesMemo_ID` int(11) NOT NULL,
  `Item_ID` int(11) NOT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  PRIMARY KEY (`SalesMemo_ID`,`Item_ID`),
  KEY `fk_Item_ID_idx` (`Item_ID`),
  CONSTRAINT `fk_Item_ID` FOREIGN KEY (`Item_ID`) REFERENCES `Item` (`Item_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SalesMemo_ID` FOREIGN KEY (`SalesMemo_ID`) REFERENCES `Sales_Memo` (`SalesMemo_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales_Item`
--

LOCK TABLES `Sales_Item` WRITE;
/*!40000 ALTER TABLE `Sales_Item` DISABLE KEYS */;
INSERT INTO `Sales_Item` VALUES (1,1,20,2),(1,2,20,5),(2,3,20,3);
/*!40000 ALTER TABLE `Sales_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales_Memo`
--

DROP TABLE IF EXISTS `Sales_Memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sales_Memo` (
  `SalesMemo_ID` int(11) NOT NULL,
  `Store_ID` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `PaymentMethod_ID` int(11) DEFAULT NULL,
  `Total_Amount` double DEFAULT NULL,
  `Staff_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SalesMemo_ID`),
  KEY `fk_Staff_ID_idx` (`Staff_ID`),
  KEY `fk_PaymentMethod_ID_idx` (`PaymentMethod_ID`),
  CONSTRAINT `fk_PaymentMethod_ID` FOREIGN KEY (`PaymentMethod_ID`) REFERENCES `Payment_Method` (`PaymentMethod_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Staff_ID` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales_Memo`
--

LOCK TABLES `Sales_Memo` WRITE;
/*!40000 ALTER TABLE `Sales_Memo` DISABLE KEYS */;
INSERT INTO `Sales_Memo` VALUES (1,1,'2017-03-27 16:10:19',2,140,1),(2,1,'2017-03-27 16:10:44',1,60,1);
/*!40000 ALTER TABLE `Sales_Memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `Staff_ID` int(11) NOT NULL,
  `Password` varchar(60) DEFAULT NULL,
  `Staff_Name` varchar(60) DEFAULT NULL,
  `Store_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'123456','admin',1);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-27 16:21:31
