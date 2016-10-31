-- MySQL dump 10.16  Distrib 10.1.13-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: traafix
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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
-- Table structure for table `tf1_address`
--

DROP TABLE IF EXISTS `tf1_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `landmark` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_address`
--

LOCK TABLES `tf1_address` WRITE;
/*!40000 ALTER TABLE `tf1_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tf1_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_optiongroups`
--

DROP TABLE IF EXISTS `tf1_optiongroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_optiongroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_optiongroups`
--

LOCK TABLES `tf1_optiongroups` WRITE;
/*!40000 ALTER TABLE `tf1_optiongroups` DISABLE KEYS */;
INSERT INTO `tf1_optiongroups` VALUES (1,'color'),(2,'size');
/*!40000 ALTER TABLE `tf1_optiongroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_options`
--

DROP TABLE IF EXISTS `tf1_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `groupid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_option_group_id` (`groupid`),
  CONSTRAINT `fk_optiongroup` FOREIGN KEY (`groupid`) REFERENCES `tf1_optiongroups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_options`
--

LOCK TABLES `tf1_options` WRITE;
/*!40000 ALTER TABLE `tf1_options` DISABLE KEYS */;
INSERT INTO `tf1_options` VALUES (1,'red',1),(2,'blue',1),(3,'green',1),(4,'S',2),(5,'M',2),(6,'L',2),(7,'XL',2),(8,'XXL',2);
/*!40000 ALTER TABLE `tf1_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_orderdetails`
--

DROP TABLE IF EXISTS `tf1_orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `productid` int(12) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `sku` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_orderdetails_product_sku` (`productid`,`sku`),
  KEY `fk_orderdetails_order` (`orderid`),
  CONSTRAINT `fk_orderdetails_order` FOREIGN KEY (`orderid`) REFERENCES `tf1_orders` (`id`),
  CONSTRAINT `fk_orderdetails_product_sku` FOREIGN KEY (`productid`, `sku`) REFERENCES `tf1_products` (`id`, `sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_orderdetails`
--

LOCK TABLES `tf1_orderdetails` WRITE;
/*!40000 ALTER TABLE `tf1_orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tf1_orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_orders`
--

DROP TABLE IF EXISTS `tf1_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `addressid` int(11) NOT NULL,
  `shippingprice` decimal(4,2) NOT NULL,
  `tax` decimal(4,2) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statuscode` int(11) NOT NULL,
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `courier` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackingnumber` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_order_address_id` (`addressid`),
  KEY `fk_order_user` (`userid`),
  CONSTRAINT `fk_order_address` FOREIGN KEY (`addressid`) REFERENCES `tf1_address` (`id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`userid`) REFERENCES `tf1_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_orders`
--

LOCK TABLES `tf1_orders` WRITE;
/*!40000 ALTER TABLE `tf1_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tf1_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_productcategories`
--

DROP TABLE IF EXISTS `tf1_productcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_productcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_productcategories`
--

LOCK TABLES `tf1_productcategories` WRITE;
/*!40000 ALTER TABLE `tf1_productcategories` DISABLE KEYS */;
INSERT INTO `tf1_productcategories` VALUES (1,'Running'),(2,'Walking'),(3,'HIking'),(4,'Track and Trail'),(5,'Short Sleave'),(6,'Long Sleave');
/*!40000 ALTER TABLE `tf1_productcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_productoptions`
--

DROP TABLE IF EXISTS `tf1_productoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_productoptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productid` int(12) NOT NULL,
  `optionid` int(11) NOT NULL,
  `priceincrement` decimal(6,2) DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productoptions_product` (`productid`),
  KEY `fk_productoptions_option` (`optionid`),
  KEY `fk_productoptions_group` (`groupid`),
  CONSTRAINT `fk_productoptions_group` FOREIGN KEY (`groupid`) REFERENCES `tf1_optiongroups` (`id`),
  CONSTRAINT `fk_productoptions_option` FOREIGN KEY (`optionid`) REFERENCES `tf1_options` (`id`),
  CONSTRAINT `fk_productoptions_product` FOREIGN KEY (`productid`) REFERENCES `tf1_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_productoptions`
--

LOCK TABLES `tf1_productoptions` WRITE;
/*!40000 ALTER TABLE `tf1_productoptions` DISABLE KEYS */;
INSERT INTO `tf1_productoptions` VALUES (1,1,1,0.00,1),(2,1,2,0.00,1),(3,1,3,0.00,1),(4,1,4,0.00,2),(5,1,5,0.00,2),(6,1,6,0.00,2),(7,1,7,2.00,2),(8,1,8,2.00,2);
/*!40000 ALTER TABLE `tf1_productoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_products`
--

DROP TABLE IF EXISTS `tf1_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_products` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  `cartdesc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortdesc` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longdesc` text COLLATE utf8_unicode_ci,
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stock` float DEFAULT NULL,
  `live` tinyint(1) DEFAULT '0',
  `unlimited` tinyint(1) DEFAULT '1',
  `location` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_category` (`categoryid`),
  KEY `key_id_sku` (`id`,`sku`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`categoryid`) REFERENCES `tf1_productcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_products`
--

LOCK TABLES `tf1_products` WRITE;
/*!40000 ALTER TABLE `tf1_products` DISABLE KEYS */;
INSERT INTO `tf1_products` VALUES (1,'000-0001','Cotton T-Shirt',9.99,3.00,'Light Cotton T-Shirt','A light cotton T-Shirt made with 100% real cotton.','A light cotton T-Shirt made with 100% real cotton.\r\n\r\nMade right here in the USA for over 15 years, this t-shirt is lightweight and durable.','','',5,'2013-06-12 19:30:50',100,1,0,NULL),(2,'000-0004','Los Angeles',179.99,8.00,'Track and Trail','A rugged track and trail athletic shoe','A rugged track and trail athletic shoe','','',4,'2013-07-25 13:34:36',NULL,0,1,NULL);
/*!40000 ALTER TABLE `tf1_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf1_users`
--

DROP TABLE IF EXISTS `tf1_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf1_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registrationdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verificationcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  `emailverified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_user_address` (`addressid`),
  CONSTRAINT `fk_user_address` FOREIGN KEY (`addressid`) REFERENCES `tf1_address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf1_users`
--

LOCK TABLES `tf1_users` WRITE;
/*!40000 ALTER TABLE `tf1_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tf1_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-20 20:42:09
