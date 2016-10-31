DROP TABLE IF EXISTS `traafix`.`tf1_address`;
CREATE TABLE  `traafix`.`tf1_address` (
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

DROP TABLE IF EXISTS `traafix`.`tf1_optiongroups`;
CREATE TABLE  `traafix`.`tf1_optiongroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `traafix`.`tf1_options`;
CREATE TABLE  `traafix`.`tf1_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `groupid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_option_group_id` (`groupid`),
  CONSTRAINT `fk_optiongroup` FOREIGN KEY (`groupid`) REFERENCES `tf1_optiongroups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `traafix`.`tf1_orderdetails`;
CREATE TABLE  `traafix`.`tf1_orderdetails` (
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

DROP TABLE IF EXISTS `traafix`.`tf1_orders`;
CREATE TABLE  `traafix`.`tf1_orders` (
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

DROP TABLE IF EXISTS `traafix`.`tf1_productcategories`;
CREATE TABLE  `traafix`.`tf1_productcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `traafix`.`tf1_productoptions`;
CREATE TABLE  `traafix`.`tf1_productoptions` (
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

DROP TABLE IF EXISTS `traafix`.`tf1_products`;
CREATE TABLE  `traafix`.`tf1_products` (
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

DROP TABLE IF EXISTS `traafix`.`tf1_users`;
CREATE TABLE  `traafix`.`tf1_users` (
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