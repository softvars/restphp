-- phpMyAdmin SQL Dump
-- version 0.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost /traafix
-- Generation Time:

-- Server version:
-- PHP Version:

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+05:30";

	
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `traafix`
--


-- --------------------------------------------------------

--
-- Table structure for table `tf1_options`
--

CREATE TABLE IF NOT EXISTS `tf1_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `groupid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX indx_option_group_id (groupid),
  CONSTRAINT fk_optiongroup FOREIGN KEY (groupid) REFERENCES tf1_optiongroups(id)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `options`
--

INSERT INTO `tf1_options` (`name`, `groupid`) VALUES
('red', 1),
('blue', 1),
('green', 1),
('S', 2),
('M', 2),
('L', 2),
('XL', 2),
('XXL', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tf1_address`
--

CREATE TABLE IF NOT EXISTS `tf1_address` (
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
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Table structure for table `tf1_users`
--

CREATE TABLE IF NOT EXISTS `tf1_users` (
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
  CONSTRAINT fk_user_address FOREIGN KEY (addressid) REFERENCES tf1_address(id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


--
-- Table structure for table `tf1_orders`
--

CREATE TABLE IF NOT EXISTS `tf1_orders` (
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
  INDEX indx_order_address_id (addressid),
  CONSTRAINT fk_order_user FOREIGN KEY (userid) REFERENCES tf1_users(id),
  CONSTRAINT fk_order_address FOREIGN KEY (addressid) REFERENCES tf1_address(id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `productcategories`
--

CREATE TABLE IF NOT EXISTS `tf1_productcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tf1_productcategories`
--

INSERT INTO `tf1_productcategories` (`name`) VALUES
('Running'),
('Walking'),
('HIking'),
('Track and Trail'),
('Short Sleave'),
('Long Sleave');

-- --------------------------------------------------------
--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `tf1_products` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  `cartdesc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortdesc` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longdesc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stock` float DEFAULT NULL,
  `live` tinyint(1) DEFAULT '0',
  `unlimited` tinyint(1) DEFAULT '1',
  `location` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  key `key_id_sku` (id, sku),
  CONSTRAINT fk_products_category FOREIGN KEY (categoryid) REFERENCES tf1_productcategories(id)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=991 ;

--
-- Dumping data for table `products`
--

INSERT INTO `tf1_products` (`id`, `sku`, `name`, `price`, `weight`, `cartdesc`, `shortdesc`, `longdesc`, `thumb`, `image`, `categoryid`, `createdtime`, `stock`, `live`, `unlimited`, `location`) VALUES
(3, '000-0001', 'Cotton T-Shirt', 9.99, 3, 'Light Cotton T-Shirt', 'A light cotton T-Shirt made with 100% real cotton.', 'A light cotton T-Shirt made with 100% real cotton.\r\n\r\nMade right here in the USA for over 15 years, this t-shirt is lightweight and durable.', '', '', 5, NULL, 100, 1, 0, NULL),
(4, '000-0004', 'Los Angeles', 179.99, 8, 'Track and Trail', 'A rugged track and trail athletic shoe', 'A rugged track and trail athletic shoe', '', '', 4, NULL, NULL, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tf1_orderdetails`
--

CREATE TABLE IF NOT EXISTS `tf1_orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `productid` int(12) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `sku` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX (productid, sku),
  CONSTRAINT fk_orderdetails_order FOREIGN KEY (orderid) REFERENCES tf1_orders(id),
  CONSTRAINT fk_orderdetails_product_sku FOREIGN KEY (productid, sku) REFERENCES tf1_products(id, sku)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `productoptions`
--

CREATE TABLE IF NOT EXISTS `tf1_productoptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productid` int(10) unsigned NOT NULL,
  `optionid` int(10) unsigned NOT NULL,
  `priceincrement` decimal(6,2) DEFAULT NULL,
  `groupid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT fk_productoptions_product FOREIGN KEY (productid) REFERENCES tf1_products(id),
  CONSTRAINT fk_productoptions_option FOREIGN KEY (optionid) REFERENCES tf1_options(id),
  CONSTRAINT fk_productoptions_group FOREIGN KEY (groupid) REFERENCES tf1_optiongroups(id)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `productoptions`
--

INSERT INTO `tf1_productoptions` (`productid`, `optionid`, `priceincrement`, `groupid`) VALUES
(1, 1, 0, 1),
(1, 2, 0, 1),
(1, 3, 0, 1),
(1, 4, 0, 2),
(1, 5, 0, 2),
(1, 6, 0, 2),
(1, 7, 2, 2),
(1, 8, 2, 2);

-- --------------------------------------------------------



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;