-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.33-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema parking
--

CREATE DATABASE IF NOT EXISTS parking;
USE parking;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(10) unsigned NOT NULL auto_increment,
  `adminname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `picture` varchar(45) NOT NULL,
  PRIMARY KEY  (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminid`,`adminname`,`password`,`picture`) VALUES 
 (100,'Ayush Sharma','ayush','23.jpg'),
 (200,'Ravi Gupta','ravi','Ravi.jpg');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `stateid` int(10) unsigned NOT NULL,
  `cityid` int(10) unsigned NOT NULL,
  `cityname` varchar(45) NOT NULL,
  PRIMARY KEY  (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`stateid`,`cityid`,`cityname`) VALUES 
 (1,100,'Gwalior'),
 (1,101,'Indore'),
 (1,102,'Bhopal'),
 (2,103,'Lucknow'),
 (2,104,'Kanpur'),
 (2,105,'Agra'),
 (3,106,'Sonipat'),
 (3,107,'Panipat'),
 (3,108,'Rohtak'),
 (4,109,'Ahamdabad'),
 (4,110,'Ghandinagar');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


--
-- Definition of table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employeeid` int(10) unsigned NOT NULL auto_increment,
  `employeename` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `address` varchar(300) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `designation` varchar(45) NOT NULL,
  `salary` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobileno` varchar(45) NOT NULL,
  `picture` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`employeeid`,`employeename`,`gender`,`dob`,`address`,`state`,`city`,`designation`,`salary`,`email`,`mobileno`,`picture`,`password`) VALUES 
 (206,'Ayush Sharma','male','1999-11-19','48, Sirohiya Sadan,  Near Roxy Cinema\r\nKampoo Road, Lashkar','1','101','Developer','10000','ayushs136@gmail.com','9399274159','23.jpg','123'),
 (210,'Ravi Gupta','male','1998-04-01','chetakpuri','1','100','Developer','10','ravig8233@gmail.com','6261667914','Ravi.jpg','123'),
 (212,'Parag Gaikwad','male','2017-11-30','madhav ganj','2','104','Sw','10000','paraggaikwad369@gmail.com','9098020290','Parag.jpg','111');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


--
-- Definition of table `exitvehical`
--

DROP TABLE IF EXISTS `exitvehical`;
CREATE TABLE `exitvehical` (
  `transectionid` int(10) unsigned NOT NULL auto_increment,
  `vehicalid` int(10) unsigned NOT NULL,
  `exitdate` date NOT NULL,
  `exittime` time NOT NULL,
  `employeeid` varchar(45) NOT NULL,
  PRIMARY KEY  (`transectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exitvehical`
--

/*!40000 ALTER TABLE `exitvehical` DISABLE KEYS */;
INSERT INTO `exitvehical` (`transectionid`,`vehicalid`,`exitdate`,`exittime`,`employeeid`) VALUES 
 (1,111,'2018-11-15','19:06:55','206'),
 (3,1,'2018-11-17','16:24:04','206'),
 (4,3,'2018-11-17','17:49:02','206'),
 (5,4,'2018-11-20','23:08:33','210'),
 (6,5,'2018-11-20','23:11:56','210'),
 (7,6,'2018-11-20','23:18:27','210'),
 (8,10,'2018-11-20','23:41:56','210');
/*!40000 ALTER TABLE `exitvehical` ENABLE KEYS */;


--
-- Definition of table `floor`
--

DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `floorno` int(10) unsigned NOT NULL auto_increment,
  `floorname` varchar(45) NOT NULL,
  `noofspace` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`floorno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floor`
--

/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` (`floorno`,`floorname`,`noofspace`) VALUES 
 (1,'B2',10),
 (2,'B3',15),
 (3,'N3',8),
 (4,'N3`8',3);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;


--
-- Definition of table `rfid`
--

DROP TABLE IF EXISTS `rfid`;
CREATE TABLE `rfid` (
  `rfidno` varchar(45) NOT NULL,
  PRIMARY KEY  (`rfidno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfid`
--

/*!40000 ALTER TABLE `rfid` DISABLE KEYS */;
INSERT INTO `rfid` (`rfidno`) VALUES 
 ('122344jh2231');
/*!40000 ALTER TABLE `rfid` ENABLE KEYS */;


--
-- Definition of table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `stateid` int(10) unsigned NOT NULL auto_increment,
  `statename` varchar(45) NOT NULL,
  PRIMARY KEY  (`stateid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`stateid`,`statename`) VALUES 
 (0,'-select-'),
 (1,'Madhya Pradesh'),
 (2,'Uttar Pradesh'),
 (3,'Harayana'),
 (4,'Gujrat');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;


--
-- Definition of table `vehical`
--

DROP TABLE IF EXISTS `vehical`;
CREATE TABLE `vehical` (
  `vehicalid` int(10) unsigned NOT NULL auto_increment,
  `employeeid` int(10) unsigned NOT NULL,
  `rfid` varchar(12) NOT NULL,
  `registration` varchar(45) NOT NULL,
  `currentdate` date NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `hours` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  `floorno` varchar(45) NOT NULL,
  `mobileno` varchar(45) NOT NULL,
  `currenttime` time NOT NULL,
  PRIMARY KEY  (`vehicalid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehical`
--

/*!40000 ALTER TABLE `vehical` DISABLE KEYS */;
INSERT INTO `vehical` (`vehicalid`,`employeeid`,`rfid`,`registration`,`currentdate`,`amount`,`hours`,`status`,`floorno`,`mobileno`,`currenttime`) VALUES 
 (11,210,'123456789012','MP07CS1992','2018-11-20',30,1,'In','1','9131387249','11:19:48'),
 (12,210,'123456789098','MP07CS1992','2018-11-20',30,1,'In','1','9399274159','11:44:50'),
 (13,206,'121212121212','MP07SD0563','2018-11-21',30,1,'In','1','9826284150','00:38:14'),
 (14,210,'098765432123','DL53CS2212','2018-11-23',30,1,'In','1','9876543210','01:46:17');
/*!40000 ALTER TABLE `vehical` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
