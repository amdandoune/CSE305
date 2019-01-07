-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: cse305
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `OrderNum` varchar(100) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `SID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderNum`),
  KEY `SID` (`SID`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `ShoppingCart` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('354c8b5e7ecc991b779631de237c','Bobby','Lee','dfadf@adfadsfa','1231231231','5467Main Street, Queens NY, 12312',29),('e4e09f0350b3ca868b9b3cdfda73','Billy','Kong','billyk142@gmail.com','9172130509','54 Dreyer Avenue, Staten Island NY, 10314',28);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Billy Kong','Admin'),(2,'Abderrahman Dandoune','Admin'),(3,'Xiaocheng Ji','Admin');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `InventoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  `TotalQuantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`InventoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1,'Water',300),(2,'Juice',294),(3,'Soda',290);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `ArticleID` varchar(100) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Price` decimal(6,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Seller` varchar(100) DEFAULT NULL,
  `InventoryId` int(11) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `InventoryId` (`InventoryId`),
  CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`InventoryId`) REFERENCES `Inventory` (`InventoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES ('J-01','Orange Juice',1.00,96,'Minute Maid',2,'Juice'),('J-02','Apple Juice',1.00,99,'Minute Maid',2,'Juice'),('J-03','Grape Juice',1.50,99,'Minute Maid',2,'Juice'),('SD-01','Coca-Cola Bottle',1.50,100,'Coca Cola',3,'Soda'),('SD-02','Pepsi Bottle',1.50,100,'Pepsi',3,'Soda'),('SD-03','Fanta Orange',1.50,90,'Fanta',3,'Soda'),('WTR-01','Bottled Water',1.00,100,'Poland Springs',1,'Water'),('WTR-02','Purified Bottled Water',1.50,100,'Aquafina',1,'Water'),('WTR-03','Smart Water',2.00,100,'Glaceau',1,'Water');
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `CardNum` varchar(20) DEFAULT NULL,
  `CVCode` varchar(3) DEFAULT NULL,
  `Expiration` varchar(10) DEFAULT NULL,
  `BillingAddress` varchar(100) DEFAULT NULL,
  `PaymentTotal` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (6,'Billy Kong','5262191086713020','187','01/21','54 Dreyer Avenue, Staten Island NY, 10314',30.00),(7,'Bob Lee','1231231231231231','312','/','3232 Main, Staten Island NY, 10314',15.50);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review` (
  `ReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `ArticleID` varchar(100) DEFAULT NULL,
  `Nickname` varchar(100) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Review` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `ArticleID` (`ArticleID`),
  CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`ArticleID`) REFERENCES `Item` (`ArticleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (1,'WTR-01','John',5,'very good water'),(2,'J-01','killer',4,'good juice at unbeatable price');
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipping`
--

DROP TABLE IF EXISTS `Shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shipping` (
  `ShippingID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Fees` decimal(4,2) DEFAULT NULL,
  `Carrier` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ShippingID`),
  KEY `OrderNum` (`OrderNum`),
  CONSTRAINT `Shipping_ibfk_1` FOREIGN KEY (`OrderNum`) REFERENCES `Customer` (`OrderNum`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipping`
--

LOCK TABLES `Shipping` WRITE;
/*!40000 ALTER TABLE `Shipping` DISABLE KEYS */;
INSERT INTO `Shipping` VALUES (9,'e4e09f0350b3ca868b9b3cdfda73','54 Dreyer Avenue, Staten Island NY, 10314','express',12.00,'UPS'),(10,'354c8b5e7ecc991b779631de237c','5467Main Street, Queens NY, 12312','express',12.00,'UPS');
/*!40000 ALTER TABLE `Shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShoppingCart`
--

DROP TABLE IF EXISTS `ShoppingCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShoppingCart` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNum` varchar(100) DEFAULT NULL,
  `TotalSum` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OrderNum` (`OrderNum`),
  CONSTRAINT `ShoppingCart_ibfk_1` FOREIGN KEY (`OrderNum`) REFERENCES `Customer` (`OrderNum`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShoppingCart`
--

LOCK TABLES `ShoppingCart` WRITE;
/*!40000 ALTER TABLE `ShoppingCart` DISABLE KEYS */;
INSERT INTO `ShoppingCart` VALUES (28,'e4e09f0350b3ca868b9b3cdfda73',30.00),(29,'354c8b5e7ecc991b779631de237c',15.50);
/*!40000 ALTER TABLE `ShoppingCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShoppingCartItem`
--

DROP TABLE IF EXISTS `ShoppingCartItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShoppingCartItem` (
  `SID` int(11) NOT NULL,
  `ArticleID` varchar(100) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`SID`,`ArticleID`),
  CONSTRAINT `ShoppingCartItem_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `ShoppingCart` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShoppingCartItem`
--

LOCK TABLES `ShoppingCartItem` WRITE;
/*!40000 ALTER TABLE `ShoppingCartItem` DISABLE KEYS */;
INSERT INTO `ShoppingCartItem` VALUES (28,'J-01',3,3.00),(28,'SD-03',10,15.00),(29,'J-01',1,1.00),(29,'J-02',1,1.00),(29,'J-03',1,1.50);
/*!40000 ALTER TABLE `ShoppingCartItem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04 16:48:05
