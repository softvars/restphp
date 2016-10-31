
CREATE TABLE IF NOT EXISTS `tf1_orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `productid` int(12) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `sku` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX indx_orderdetails_product_sku (productid, sku),
  CONSTRAINT fk_orderdetails_order FOREIGN KEY (orderid) REFERENCES tf1_orders(id),
  CONSTRAINT fk_orderdetails_product_sku FOREIGN KEY (productid, sku) REFERENCES tf1_products(id, sku)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `productoptions`
--

CREATE TABLE IF NOT EXISTS `tf1_productoptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productid` int(12) NOT NULL,
  `optionid` int(11)  NOT NULL,
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
