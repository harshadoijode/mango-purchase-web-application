-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.19


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema gfgc_mango
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ gfgc_mango;
USE gfgc_mango;

--
-- Table structure for table `gfgc_mango`.`adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gfgc_mango`.`adminuser`
--

/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
INSERT INTO `adminuser` (`username`,`password`) VALUES 
 ('admin','password');
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`name`) VALUES 
 ('Mango'),
 ('pickles');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`name`,`address`,`phone`,`password`,`customerid`) VALUES 
 ('ravish','shimoga','9963256958','Ravish123',7),
 ('shivu','thirthahalli','9966333669','Shivu123',8),
 ('shivu','shimoga','9999988888','Shivu@1234',9),
 ('shivu','shimoga','8858555858','Shivu@1234',10),
 ('soma','shimoga','9988556699','Soma@1234',11),
 ('kumar','shimoga','7777777777','Kumar@1234',12);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`farmer`
--

DROP TABLE IF EXISTS `farmer`;
CREATE TABLE `farmer` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `customerid` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`farmer`
--

/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
INSERT INTO `farmer` (`name`,`address`,`phone`,`password`,`customerid`,`status`) VALUES 
 ('shivu','address','9999999999','Password@123',10,'Rejected'),
 ('Arun','address','9999999999','Arun@1234',11,'Accepted'),
 ('siri','shimoga','9933999393','Siri@1234',323,'pending');
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`farmersales`
--

DROP TABLE IF EXISTS `farmersales`;
CREATE TABLE `farmersales` (
  `name` varchar(50) NOT NULL,
  `description` text,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `farmerphone` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`farmersales`
--

/*!40000 ALTER TABLE `farmersales` DISABLE KEYS */;
INSERT INTO `farmersales` (`name`,`description`,`price`,`image`,`farmerphone`,`id`) VALUES 
 ('malgova','fully ripened fruit','130','5.jpg','9999999999',1);
/*!40000 ALTER TABLE `farmersales` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `name` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `feedback` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` (`name`,`place`,`feedback`) VALUES 
 ('ravi@gmail.com',NULL,'the college is good'),
 ('ravi','shimoga','nice shop to buy'),
 ('ravi','shimgoa','nice website for herbals '),
 ('ravi','shimoga','nice shop');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`fruit`
--

DROP TABLE IF EXISTS `fruit`;
CREATE TABLE `fruit` (
  `name` varchar(50) NOT NULL,
  `description` text,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gfgc_mango`.`fruit`
--

/*!40000 ALTER TABLE `fruit` DISABLE KEYS */;
INSERT INTO `fruit` (`name`,`description`,`price`,`image`) VALUES 
 ('gira mango','looks like thin','120','3.jpg');
/*!40000 ALTER TABLE `fruit` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`username`,`password`) VALUES 
 ('admin','admin'),
 ('ravi','Ravish123'),
 ('ravi','Ravish123');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`madicine`
--

DROP TABLE IF EXISTS `madicine`;
CREATE TABLE `madicine` (
  `name` varchar(50) NOT NULL,
  `description` text,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`madicine`
--

/*!40000 ALTER TABLE `madicine` DISABLE KEYS */;
INSERT INTO `madicine` (`name`,`description`,`price`,`image`) VALUES 
 ('gira mango','looks like thin','120','3.jpg'),
 ('midi mango','for pickles','200','carousel-2.jpg');
/*!40000 ALTER TABLE `madicine` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`nursery`
--

DROP TABLE IF EXISTS `nursery`;
CREATE TABLE `nursery` (
  `locationname` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `description` text,
  `image` varchar(50) DEFAULT NULL,
  `location` text,
  PRIMARY KEY (`locationname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`nursery`
--

/*!40000 ALTER TABLE `nursery` DISABLE KEYS */;
INSERT INTO `nursery` (`locationname`,`address`,`category`,`phoneno`,`email`,`description`,`image`,`location`) VALUES 
 ('mango','shimoga','Mango','9985855858','mango@gmail.com','nice mangos','market.jpg','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d495208.6169391017!2d75.29275580091942!3d14.14683511785263!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bbbab98cc6304e9%3A0xc4568b01e7a703ae!2sNISARGA%20NURSERY%20AND%20AGRO%20ENTERPRISES!5e0!3m2!1sen!2sin!4v1659915454266!5m2!1sen!2sin\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
 ('gira mango','looks like thin','120','null','null','null','null','null');
/*!40000 ALTER TABLE `nursery` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `productname` varchar(50) DEFAULT NULL,
  `productCast` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `totalAmount` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `cardHolderName` varchar(50) DEFAULT NULL,
  `cardtype` varchar(50) DEFAULT NULL,
  `cardNum` varchar(50) DEFAULT NULL,
  `cvv` varchar(50) DEFAULT NULL,
  `orderid` int(50) NOT NULL AUTO_INCREMENT,
  `customerid` varchar(50) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`orderlist`
--

/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` (`productname`,`productCast`,`quantity`,`totalAmount`,`address`,`cardHolderName`,`cardtype`,`cardNum`,`cvv`,`orderid`,`customerid`,`status`) VALUES 
 ('Chops','150','1','150.0','dfhgdgf','mohan','credit card','4242423423423253454','434',15,'7','Delivered'),
 ('honey','200','1','200.0','fsfasf','mohan','credit card','2342343424234','232',16,'7','Delivered'),
 ('honey','200','1','200.0','fsfasf','mohan','credit card','2342343424234','232',17,'7','Delivered'),
 ('honey','200','1','200.0','fsfasf','mohan','credit card','2342343424234','232',18,'7','Delivered'),
 ('honey','200','1','200.0','gsdfgsdf','mohan','credit card','3453443424234','234',19,'7','Delivered'),
 ('dose','60','1','60.0','','ravi','debit card','12346578955847','123',20,'0','pending'),
 ('chips','100','1','100.0','sdfgsdfgsfd','ravi','credit card','342342342423','234',21,'0','Delivered'),
 ('Chops','150','1','150.0','fgdsfgsdfg','Shivu','credit card','34423423423234','233',22,'7','pending'),
 ('chips','100','1','100.0','thirthaalli','shivu','credit card','445215475887587','125',23,'0','pending'),
 ('dose','60','1','60.0','goa','Shivu','credit card','2322234543434322','323',24,'8','Delivered');
INSERT INTO `orderlist` (`productname`,`productCast`,`quantity`,`totalAmount`,`address`,`cardHolderName`,`cardtype`,`cardNum`,`cvv`,`orderid`,`customerid`,`status`) VALUES 
 ('chilly pickles','120','1','120.0','shimoga','kumar','credit card','9965255858558552','236',25,'0','pending'),
 ('chilly pickles','120','1','120.0','shimoga','kumar','credit card','9965255858558552','236',26,'0','pending'),
 ('chilly pickles','120','1','120.0','shimoga','kumar','credit card','9965255858558552','236',27,'0','pending'),
 ('slice pickles','70','1','70.0','','7777777777','credit card','12345678901234','123',28,'0','Delivered');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `category` varchar(50) DEFAULT NULL,
  `productname` varchar(50) DEFAULT NULL,
  `productprice` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`category`,`productname`,`productprice`,`quantity`,`image`,`description`,`productid`) VALUES 
 ('pickles','slice pickles','70','49','1.jpg','south favorite',11),
 ('pickles','chilly pickles','120','29','3.jpg','nice to have with coffee',16);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `productID` varchar(50) DEFAULT NULL,
  `rating` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`rating`
--

/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` (`productID`,`rating`) VALUES 
 (NULL,'3'),
 ('hp','3'),
 ('maruthi','4'),
 ('samsung','4'),
 ('dolls','4'),
 ('dolls','1'),
 ('ear rings','4');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`rawmango`
--

DROP TABLE IF EXISTS `rawmango`;
CREATE TABLE `rawmango` (
  `name` varchar(50) NOT NULL,
  `description` text,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`rawmango`
--

/*!40000 ALTER TABLE `rawmango` DISABLE KEYS */;
INSERT INTO `rawmango` (`name`,`description`,`price`,`image`) VALUES 
 ('gira mango','looks like thin','120','3.jpg'),
 ('mango','kdfsgkjdfgh','100','view.jpg');
/*!40000 ALTER TABLE `rawmango` ENABLE KEYS */;


--
-- Table structure for table `gfgc_mango`.`stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `storeid` int(11) NOT NULL AUTO_INCREMENT,
  `storename` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `storemobileno` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `venderid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`storeid`),
  UNIQUE KEY `storemobileno` (`storemobileno`),
  UNIQUE KEY `storename` (`storename`),
  UNIQUE KEY `venderid` (`venderid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gfgc_mango`.`stores`
--

/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`storeid`,`storename`,`address`,`storemobileno`,`password`,`status`,`venderid`) VALUES 
 (2,'ravish store','shimoga','1234567890','ravi','Accepted',''),
 (5,'shivu','shimoga','9958555852','shivu123','Accepted','14254'),
 (6,'arun','shimoga','0949949949','arun123','Rejected','1442');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
