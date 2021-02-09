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
-- Create schema mysql
--

CREATE DATABASE IF NOT EXISTS mysql;
USE mysql;

--
-- Definition of table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
CREATE TABLE `columns_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Column_name` char(64) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';

--
-- Dumping data for table `columns_priv`
--

/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;


--
-- Definition of table `db`
--

DROP TABLE IF EXISTS `db`;
CREATE TABLE `db` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';

--
-- Dumping data for table `db`
--

/*!40000 ALTER TABLE `db` DISABLE KEYS */;
/*!40000 ALTER TABLE `db` ENABLE KEYS */;


--
-- Definition of table `func`
--

DROP TABLE IF EXISTS `func`;
CREATE TABLE `func` (
  `name` char(64) collate utf8_bin NOT NULL default '',
  `ret` tinyint(1) NOT NULL default '0',
  `dl` char(128) collate utf8_bin NOT NULL default '',
  `type` enum('function','aggregate') character set utf8 NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';

--
-- Dumping data for table `func`
--

/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;


--
-- Definition of table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned default NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';

--
-- Dumping data for table `help_category`
--

/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` (`help_category_id`,`name`,`parent_category_id`,`url`) VALUES 
 (1,'Geographic',0,''),
 (2,'Polygon properties',30,''),
 (3,'WKT',30,''),
 (4,'Numeric Functions',34,''),
 (5,'MBR',30,''),
 (6,'Control flow functions',34,''),
 (7,'Transactions',31,''),
 (8,'Account Management',31,''),
 (9,'Point properties',30,''),
 (10,'Encryption Functions',34,''),
 (11,'LineString properties',30,''),
 (12,'Logical operators',34,''),
 (13,'Miscellaneous Functions',34,''),
 (14,'Functions and Modifiers for Use with GROUP BY',31,''),
 (15,'Information Functions',34,''),
 (16,'Storage Engines',31,''),
 (17,'Comparison operators',34,''),
 (18,'Bit Functions',34,''),
 (19,'Table Maintenance',31,''),
 (20,'Data Types',31,''),
 (21,'Triggers',31,''),
 (22,'Geometry constructors',30,''),
 (23,'GeometryCollection properties',1,''),
 (24,'Administration',31,''),
 (25,'Data Manipulation',31,''),
 (26,'Geometry relations',30,''),
 (27,'Language Structure',31,''),
 (28,'Date and Time Functions',34,''),
 (29,'WKB',30,''),
 (30,'Geographic Features',31,''),
 (31,'Contents',0,''),
 (32,'Geometry properties',30,''),
 (33,'String Functions',34,''),
 (34,'Functions',31,''),
 (35,'Stored Routines',31,''),
 (36,'Data Definition',31,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;


--
-- Definition of table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY  (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';

--
-- Dumping data for table `help_keyword`
--

/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` (`help_keyword_id`,`name`) VALUES 
 (0,'JOIN'),
 (1,'REPEAT'),
 (2,'SERIALIZABLE'),
 (3,'REPLACE'),
 (4,'RETURNS'),
 (5,'MASTER_SSL_CA'),
 (6,'NCHAR'),
 (7,'COLUMNS'),
 (8,'WORK'),
 (9,'DATETIME'),
 (10,'MODE'),
 (11,'OPEN'),
 (12,'INTEGER'),
 (13,'ESCAPE'),
 (14,'VALUE'),
 (15,'GEOMETRYCOLLECTIONFROMWKB'),
 (16,'SQL_BIG_RESULT'),
 (17,'DROP'),
 (18,'EVENTS'),
 (19,'MONTH'),
 (20,'INFO'),
 (21,'DUPLICATE'),
 (22,'REPLICATION'),
 (23,'INNODB'),
 (24,'YEAR_MONTH'),
 (25,'SUBJECT'),
 (26,'PREPARE'),
 (27,'LOCK'),
 (28,'NDB'),
 (29,'CHECK'),
 (30,'FULL'),
 (31,'INT4'),
 (32,'BY'),
 (33,'NO'),
 (34,'MINUTE'),
 (35,'DATA'),
 (36,'DAY'),
 (37,'SHARE'),
 (38,'REAL'),
 (39,'SEPARATOR'),
 (40,'DELETE'),
 (41,'ON'),
 (42,'CONNECTION'),
 (43,'CLOSE'),
 (44,'X509'),
 (45,'USE'),
 (46,'WHERE'),
 (47,'PRIVILEGES'),
 (48,'SPATIAL'),
 (49,'SUPER'),
 (50,'SQL_BUFFER_RESULT'),
 (51,'IGNORE'),
 (52,'QUICK'),
 (53,'SIGNED'),
 (54,'SECURITY'),
 (55,'POLYGONFROMWKB'),
 (56,'NDBCLUSTER'),
 (57,'FALSE'),
 (58,'LEVEL'),
 (59,'FORCE'),
 (60,'BINARY'),
 (61,'TO'),
 (62,'CHANGE'),
 (63,'HOUR_MINUTE'),
 (64,'UPDATE'),
 (65,'INTO'),
 (66,'FEDERATED'),
 (67,'VARYING'),
 (68,'HOUR_SECOND'),
 (69,'VARIABLE'),
 (70,'ROLLBACK'),
 (71,'PROCEDURE'),
 (72,'RTREE'),
 (73,'TIMESTAMP'),
 (74,'IMPORT'),
 (75,'AGAINST'),
 (76,'CHECKSUM'),
 (77,'COUNT'),
 (78,'LONGBINARY'),
 (79,'THEN'),
 (80,'INSERT'),
 (81,'HANDLER'),
 (82,'ENGINES'),
 (83,'DAY_SECOND'),
 (84,'EXISTS'),
 (85,'MUTEX'),
 (86,'RELEASE'),
 (87,'BOOLEAN'),
 (88,'MOD'),
 (89,'DEFAULT'),
 (90,'TYPE'),
 (91,'NO_WRITE_TO_BINLOG'),
 (92,'RESET'),
 (93,'DO'),
 (94,'ITERATE'),
 (95,'BIGINT'),
 (96,'SET'),
 (97,'ISSUER'),
 (98,'DATE'),
 (99,'STATUS'),
 (100,'FULLTEXT'),
 (101,'COMMENT'),
 (102,'MASTER_CONNECT_RETRY'),
 (103,'INNER'),
 (104,'STOP'),
 (105,'MASTER_LOG_FILE'),
 (106,'MRG_MYISAM'),
 (107,'PRECISION'),
 (108,'REQUIRE'),
 (109,'TRAILING'),
 (110,'LONG'),
 (111,'OPTION'),
 (112,'ELSE'),
 (113,'DEALLOCATE'),
 (114,'IO_THREAD'),
 (115,'CASE'),
 (116,'CIPHER'),
 (117,'CONTINUE'),
 (118,'FROM'),
 (119,'READ'),
 (120,'LEFT'),
 (121,'ELSEIF'),
 (122,'MINUTE_SECOND'),
 (123,'COMPACT'),
 (124,'DEC'),
 (125,'FOR'),
 (126,'WARNINGS'),
 (127,'MIN_ROWS'),
 (128,'STRING'),
 (129,'CONDITION'),
 (130,'FUNCTION'),
 (131,'ENCLOSED'),
 (132,'AGGREGATE'),
 (133,'FIELDS'),
 (134,'INT3'),
 (135,'ARCHIVE'),
 (136,'ADD'),
 (137,'AVG_ROW_LENGTH'),
 (138,'FLOAT4'),
 (139,'VIEW'),
 (140,'REPEATABLE'),
 (141,'INFILE'),
 (142,'ORDER'),
 (143,'USING'),
 (144,'MIDDLEINT'),
 (145,'GRANT'),
 (146,'UNSIGNED'),
 (147,'DECIMAL'),
 (148,'GEOMETRYFROMTEXT'),
 (149,'INDEXES'),
 (150,'FOREIGN'),
 (151,'CACHE'),
 (152,'HOSTS'),
 (153,'COMMIT'),
 (154,'SCHEMAS'),
 (155,'LEADING'),
 (156,'SNAPSHOT'),
 (157,'DECLARE'),
 (158,'LOAD'),
 (159,'SQL_CACHE'),
 (160,'CONVERT'),
 (161,'DYNAMIC'),
 (162,'POLYGONFROMTEXT'),
 (163,'COLLATE'),
 (164,'BYTE'),
 (165,'LINESTRINGFROMWKB'),
 (166,'GLOBAL'),
 (167,'BERKELEYDB'),
 (168,'WHEN'),
 (169,'HAVING'),
 (170,'AS'),
 (171,'STARTING'),
 (172,'RELOAD'),
 (173,'AUTOCOMMIT'),
 (174,'REVOKE'),
 (175,'GRANTS'),
 (176,'OUTER'),
 (177,'FLOOR'),
 (178,'WITH'),
 (179,'STD'),
 (180,'AFTER'),
 (181,'CSV'),
 (182,'DISABLE'),
 (183,'OUTFILE'),
 (184,'LOW_PRIORITY'),
 (185,'FILE'),
 (186,'BDB'),
 (187,'SCHEMA'),
 (188,'SONAME'),
 (189,'POW'),
 (190,'MULTIPOINTFROMWKB'),
 (191,'INDEX'),
 (192,'MULTIPOINTFROMTEXT'),
 (193,'BACKUP'),
 (194,'MULTILINESTRINGFROMWKB'),
 (195,'EXTENDED'),
 (196,'CROSS'),
 (197,'NATIONAL'),
 (198,'GROUP'),
 (199,'UNDO'),
 (200,'ZEROFILL'),
 (201,'CLIENT'),
 (202,'MASTER_PASSWORD'),
 (203,'RELAY_LOG_FILE'),
 (204,'TRUE'),
 (205,'CHARACTER'),
 (206,'MASTER_USER'),
 (207,'ENGINE'),
 (208,'TABLE'),
 (209,'INSERT_METHOD'),
 (210,'CASCADE'),
 (211,'RELAY_LOG_POS'),
 (212,'SQL_CALC_FOUND_ROWS'),
 (213,'MYISAM'),
 (214,'LEAVE'),
 (215,'MODIFY'),
 (216,'MATCH'),
 (217,'MASTER_LOG_POS'),
 (218,'DESC'),
 (219,'DISTINCTROW'),
 (220,'TIME'),
 (221,'NUMERIC'),
 (222,'EXPANSION'),
 (223,'CURSOR'),
 (224,'GEOMETRYCOLLECTIONFROMTEXT'),
 (225,'CHAIN'),
 (226,'FLUSH'),
 (227,'CREATE'),
 (228,'ISAM'),
 (229,'MAX_UPDATES_PER_HOUR'),
 (230,'INT2'),
 (231,'PROCESSLIST'),
 (232,'LOGS'),
 (233,'HEAP'),
 (234,'SOUNDS'),
 (235,'BETWEEN'),
 (236,'MULTILINESTRINGFROMTEXT'),
 (237,'PACK_KEYS'),
 (238,'CALL'),
 (239,'FAST'),
 (240,'VALUES'),
 (241,'LOOP'),
 (242,'VARCHARACTER'),
 (243,'BEFORE'),
 (244,'SHOW'),
 (245,'REDUNDANT'),
 (246,'ALL'),
 (247,'USER_RESOURCES'),
 (248,'PARTIAL'),
 (249,'BINLOG'),
 (250,'END'),
 (251,'SECOND'),
 (252,'AND'),
 (253,'FLOAT8'),
 (254,'PREV'),
 (255,'HOUR'),
 (256,'SELECT'),
 (257,'DATABASES'),
 (258,'OR'),
 (259,'IDENTIFIED'),
 (260,'MASTER_SSL_CIPHER'),
 (261,'SQL_SLAVE_SKIP_COUNTER'),
 (262,'BOTH'),
 (263,'BOOL'),
 (264,'YEAR'),
 (265,'MASTER_PORT'),
 (266,'CONCURRENT'),
 (267,'HELP'),
 (268,'UNIQUE'),
 (269,'TRIGGERS'),
 (270,'PROCESS'),
 (271,'CONSISTENT'),
 (272,'MASTER_SSL'),
 (273,'DATE_ADD'),
 (274,'MAX_CONNECTIONS_PER_HOUR'),
 (275,'LIKE'),
 (276,'FETCH'),
 (277,'IN'),
 (278,'COLUMN'),
 (279,'DUMPFILE'),
 (280,'USAGE'),
 (281,'EXECUTE'),
 (282,'MEMORY'),
 (283,'CEIL'),
 (284,'QUERY'),
 (285,'MASTER_HOST'),
 (286,'LINES'),
 (287,'SQL_THREAD'),
 (288,'MAX_QUERIES_PER_HOUR'),
 (289,'MULTIPOLYGONFROMWKB'),
 (290,'MASTER_SSL_CERT'),
 (291,'DAY_MINUTE'),
 (292,'TRANSACTION'),
 (293,'DATE_SUB'),
 (294,'GEOMETRYFROMWKB'),
 (295,'RENAME'),
 (296,'INT1'),
 (297,'ALTER'),
 (298,'MAX_ROWS'),
 (299,'RIGHT'),
 (300,'STRAIGHT_JOIN'),
 (301,'NATURAL'),
 (302,'VARIABLES'),
 (303,'ESCAPED'),
 (304,'SHA1'),
 (305,'PASSWORD'),
 (306,'CHAR'),
 (307,'OFFSET'),
 (308,'NEXT'),
 (309,'SQL_LOG_BIN'),
 (310,'ERRORS'),
 (311,'TEMPORARY'),
 (312,'COMMITTED'),
 (313,'SQL_SMALL_RESULT'),
 (314,'UPGRADE'),
 (315,'DELAY_KEY_WRITE'),
 (316,'BEGIN'),
 (317,'MEDIUM'),
 (318,'INTERVAL'),
 (319,'SSL'),
 (320,'DAY_HOUR'),
 (321,'REFERENCES'),
 (322,'AES_ENCRYPT'),
 (323,'STORAGE'),
 (324,'ISOLATION'),
 (325,'INT8'),
 (326,'RESTRICT'),
 (327,'LINESTRINGFROMTEXT'),
 (328,'UNCOMMITTED'),
 (329,'IS'),
 (330,'NOT'),
 (331,'ANALYSE'),
 (332,'DES_KEY_FILE'),
 (333,'COMPRESSED'),
 (334,'START'),
 (335,'IF'),
 (336,'SAVEPOINT'),
 (337,'PRIMARY'),
 (338,'INNOBASE'),
 (339,'LAST'),
 (340,'EXIT'),
 (341,'KEYS'),
 (342,'LIMIT'),
 (343,'KEY'),
 (344,'MERGE'),
 (345,'UNTIL'),
 (346,'SQL_NO_CACHE'),
 (347,'DELAYED'),
 (348,'CONSTRAINT'),
 (349,'SERIAL'),
 (350,'ACTION'),
 (351,'WRITE'),
 (352,'SESSION'),
 (353,'DATABASE'),
 (354,'NULL'),
 (355,'USE_FRM'),
 (356,'SLAVE'),
 (357,'TERMINATED'),
 (358,'ASC'),
 (359,'ENABLE'),
 (360,'OPTIONALLY'),
 (361,'DIRECTORY'),
 (362,'WHILE'),
 (363,'MAX_USER_CONNECTIONS'),
 (364,'DISTINCT'),
 (365,'LOCAL'),
 (366,'MASTER_SSL_KEY'),
 (367,'NONE'),
 (368,'TABLES'),
 (369,'<>'),
 (370,'RLIKE'),
 (371,'TRIGGER'),
 (372,'COLLATION'),
 (373,'SHUTDOWN'),
 (374,'HIGH_PRIORITY'),
 (375,'BTREE'),
 (376,'FIRST'),
 (377,'TYPES'),
 (378,'MASTER'),
 (379,'FIXED'),
 (380,'MULTIPOLYGONFROMTEXT'),
 (381,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;


--
-- Definition of table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';

--
-- Dumping data for table `help_relation`
--

/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` (`help_topic_id`,`help_keyword_id`) VALUES 
 (327,0),
 (207,1),
 (408,2),
 (388,3),
 (188,4),
 (168,5),
 (393,6),
 (17,7),
 (318,7),
 (126,8),
 (347,9),
 (73,10),
 (327,10),
 (12,11),
 (88,11),
 (114,11),
 (318,11),
 (188,12),
 (456,12),
 (350,13),
 (217,14),
 (90,15),
 (327,16),
 (25,17),
 (72,17),
 (169,17),
 (212,17),
 (237,17),
 (249,17),
 (374,17),
 (382,17),
 (423,17),
 (104,18),
 (346,19),
 (234,20),
 (86,21),
 (180,22),
 (318,23),
 (369,23),
 (428,23),
 (346,24),
 (180,25),
 (28,26),
 (212,26),
 (327,27),
 (428,28),
 (428,29),
 (17,30),
 (267,30),
 (318,30),
 (413,30),
 (428,30),
 (456,31),
 (41,32),
 (69,32),
 (180,32),
 (327,32),
 (333,32),
 (388,32),
 (423,32),
 (428,32),
 (428,33),
 (432,33),
 (346,34),
 (99,35),
 (388,35),
 (428,35),
 (346,36),
 (327,37),
 (188,38),
 (286,38),
 (333,39),
 (428,40),
 (432,40),
 (0,41),
 (432,41),
 (428,42),
 (44,43),
 (88,43),
 (180,44),
 (0,45),
 (41,46),
 (69,46),
 (88,46),
 (173,47),
 (180,47),
 (223,47),
 (190,48),
 (423,48),
 (180,49),
 (327,50),
 (0,51),
 (69,51),
 (86,51),
 (327,51),
 (388,51),
 (423,51),
 (41,52),
 (383,52),
 (426,52),
 (347,53),
 (180,54),
 (75,55),
 (441,55),
 (428,56),
 (355,57),
 (408,58),
 (0,59),
 (31,60),
 (347,60),
 (168,61),
 (420,61),
 (424,61),
 (168,62),
 (423,62),
 (346,63),
 (86,64),
 (327,64),
 (432,64),
 (36,65),
 (86,65),
 (276,65),
 (327,65),
 (428,66),
 (231,67),
 (346,68),
 (111,69),
 (126,70),
 (420,70),
 (13,71),
 (166,71),
 (273,71),
 (300,71),
 (318,71),
 (327,71),
 (382,71),
 (402,71),
 (190,72),
 (81,73),
 (170,73),
 (388,74),
 (73,75),
 (428,76),
 (56,77),
 (301,77),
 (396,77),
 (259,78),
 (23,79),
 (70,79),
 (385,79),
 (86,80),
 (174,80),
 (445,80),
 (285,81),
 (254,82),
 (318,82),
 (346,83),
 (25,84),
 (135,84),
 (249,84),
 (255,85),
 (318,85),
 (126,86),
 (19,87),
 (73,87),
 (94,88),
 (155,88),
 (86,89),
 (178,89),
 (217,89),
 (423,89),
 (428,89),
 (423,90),
 (428,90),
 (96,91),
 (299,91),
 (426,91),
 (430,91),
 (30,92),
 (131,92),
 (238,92),
 (452,93),
 (106,94),
 (199,95),
 (36,96),
 (69,96),
 (119,96),
 (126,96),
 (164,96),
 (191,96),
 (305,96),
 (423,96),
 (428,96),
 (432,96),
 (450,96),
 (180,97),
 (112,98),
 (236,98),
 (346,98),
 (347,98),
 (48,99),
 (117,99),
 (193,99),
 (201,99),
 (255,99),
 (300,99),
 (318,99),
 (337,99),
 (369,99),
 (190,100),
 (423,100),
 (428,100),
 (428,101),
 (168,102),
 (0,103),
 (45,104),
 (168,105),
 (428,106),
 (286,107),
 (180,108),
 (416,109),
 (259,110),
 (180,111),
 (70,112),
 (385,112),
 (212,113),
 (45,114),
 (297,114),
 (70,115),
 (385,115),
 (180,116),
 (285,117),
 (41,118),
 (99,118),
 (104,118),
 (318,118),
 (327,118),
 (332,118),
 (416,118),
 (29,119),
 (88,119),
 (408,119),
 (0,120),
 (23,121),
 (346,122),
 (428,123),
 (187,124),
 (161,125),
 (285,125),
 (318,125),
 (327,125),
 (386,125),
 (301,126),
 (318,126),
 (428,127),
 (188,128),
 (161,129),
 (13,130),
 (188,130),
 (273,130),
 (300,130),
 (318,130),
 (374,130),
 (382,130),
 (402,130),
 (388,131),
 (188,132),
 (318,133),
 (388,133),
 (226,134),
 (428,135),
 (50,136),
 (423,136),
 (423,137),
 (428,137),
 (149,138),
 (25,139),
 (139,139),
 (408,140),
 (388,141),
 (41,142),
 (69,142),
 (327,142),
 (333,142),
 (423,142),
 (0,143),
 (41,143),
 (71,143),
 (226,144),
 (180,145),
 (19,146),
 (110,146),
 (149,146),
 (187,146),
 (286,146),
 (347,146),
 (456,146),
 (136,147),
 (188,147),
 (379,148),
 (318,149),
 (423,150),
 (428,150),
 (432,150),
 (84,151),
 (131,151),
 (276,151),
 (125,152),
 (318,152),
 (126,153),
 (140,154),
 (318,154),
 (416,155),
 (126,156),
 (161,157),
 (178,157),
 (285,157),
 (386,157),
 (99,158),
 (276,158),
 (332,158),
 (388,158),
 (327,159),
 (347,160),
 (428,161),
 (364,162),
 (428,163),
 (425,164),
 (412,165),
 (111,166),
 (117,166),
 (164,166),
 (321,166),
 (408,166),
 (428,167),
 (70,168),
 (385,168),
 (327,169),
 (0,170),
 (29,170),
 (327,170),
 (388,171),
 (180,172),
 (126,173),
 (223,174),
 (172,175),
 (318,175),
 (0,176),
 (199,177),
 (73,178),
 (180,178),
 (375,179),
 (423,180),
 (388,181),
 (428,181),
 (423,182),
 (327,183),
 (29,184),
 (36,184),
 (41,184),
 (69,184),
 (86,184),
 (388,184),
 (180,185),
 (146,186),
 (428,186),
 (135,187),
 (169,187),
 (191,187),
 (281,187),
 (318,187),
 (188,188),
 (442,189),
 (422,190),
 (0,191),
 (50,191),
 (72,191),
 (84,191),
 (190,191),
 (276,191),
 (280,191),
 (318,191),
 (423,191),
 (428,191),
 (390,192),
 (329,193),
 (245,194),
 (426,195),
 (0,196),
 (231,197),
 (393,197),
 (327,198),
 (285,199),
 (19,200),
 (110,200),
 (149,200),
 (187,200),
 (286,200),
 (456,200),
 (180,201),
 (168,202),
 (168,203),
 (355,204),
 (191,205),
 (231,205),
 (305,205),
 (393,205),
 (428,205),
 (168,206),
 (318,207),
 (337,207),
 (423,207),
 (428,207),
 (50,208),
 (193,208),
 (249,208),
 (250,208),
 (318,208),
 (329,208),
 (332,208),
 (428,209),
 (25,210),
 (249,210),
 (428,210),
 (432,210),
 (168,211),
 (327,212),
 (428,213),
 (282,214),
 (423,215),
 (73,216),
 (168,217),
 (302,218),
 (327,218),
 (333,218),
 (327,219),
 (287,220),
 (345,220),
 (347,220),
 (187,221),
 (73,222),
 (386,223),
 (220,224),
 (126,225),
 (131,226),
 (13,227),
 (16,227),
 (50,227),
 (135,227),
 (188,227),
 (190,227),
 (250,227),
 (273,227),
 (281,227),
 (318,227),
 (428,227),
 (428,228),
 (180,229),
 (208,230),
 (318,231),
 (413,231),
 (31,232),
 (146,232),
 (318,232),
 (337,232),
 (428,233),
 (348,234),
 (127,235),
 (89,236),
 (428,237),
 (310,238),
 (383,239),
 (36,240),
 (315,241),
 (231,242),
 (424,243),
 (13,244),
 (17,244),
 (20,244),
 (31,244),
 (48,244),
 (56,244),
 (104,244),
 (114,244),
 (117,244),
 (125,244),
 (140,244),
 (146,244),
 (172,244),
 (173,244),
 (193,244),
 (201,244),
 (250,244),
 (254,244),
 (255,244),
 (267,244),
 (280,244),
 (281,244),
 (300,244),
 (301,244),
 (305,244),
 (321,244),
 (337,244),
 (369,244),
 (413,244),
 (448,244),
 (428,245),
 (180,246),
 (223,246),
 (277,246),
 (327,246),
 (299,247),
 (428,248),
 (104,249),
 (23,250),
 (70,250),
 (207,250),
 (298,250),
 (315,250),
 (385,250),
 (452,250),
 (346,251),
 (127,252),
 (288,252),
 (286,253),
 (88,254),
 (346,255),
 (36,256),
 (230,256),
 (234,256),
 (140,257),
 (318,257),
 (121,258),
 (180,259),
 (168,260),
 (164,261),
 (416,262),
 (19,263),
 (92,263),
 (346,264),
 (168,265),
 (388,266),
 (101,267),
 (360,267),
 (423,268),
 (20,269),
 (180,270),
 (126,271),
 (168,272),
 (346,273),
 (180,274),
 (318,275),
 (348,275),
 (353,276),
 (73,277),
 (104,277),
 (327,277),
 (423,278),
 (327,279),
 (180,280),
 (71,281),
 (180,281),
 (327,282),
 (409,283),
 (73,284),
 (131,284),
 (168,285),
 (388,286),
 (45,287),
 (297,287),
 (180,288),
 (105,289),
 (168,290),
 (346,291),
 (126,292),
 (408,292),
 (346,293),
 (124,294),
 (423,295),
 (19,296),
 (50,297),
 (139,297),
 (180,297),
 (402,297),
 (423,297),
 (428,298),
 (0,299),
 (0,300),
 (327,300),
 (0,301),
 (318,302),
 (321,302),
 (388,303),
 (258,304),
 (180,305),
 (347,306),
 (425,306),
 (327,307),
 (88,308),
 (450,309),
 (56,310),
 (318,310),
 (249,311),
 (408,312),
 (327,313),
 (383,314),
 (428,315),
 (126,316),
 (298,316),
 (383,317),
 (346,318),
 (180,319),
 (346,320),
 (180,321),
 (428,321),
 (432,321),
 (453,322),
 (254,323),
 (408,324),
 (110,325),
 (25,326),
 (249,326),
 (432,326),
 (47,327),
 (408,328),
 (340,329),
 (135,330),
 (284,330),
 (166,331),
 (299,332),
 (428,333),
 (126,334),
 (297,334),
 (23,335),
 (25,335),
 (135,335),
 (169,335),
 (249,335),
 (439,335),
 (420,336),
 (423,337),
 (428,338),
 (88,339),
 (285,340),
 (280,341),
 (318,341),
 (423,341),
 (41,342),
 (69,342),
 (88,342),
 (104,342),
 (327,342),
 (50,343),
 (86,343),
 (423,343),
 (428,343),
 (432,343),
 (428,344),
 (207,345),
 (327,346),
 (36,347),
 (86,347),
 (445,347),
 (423,348),
 (428,348),
 (217,349),
 (428,349),
 (428,350),
 (432,350),
 (29,351),
 (111,352),
 (117,352),
 (321,352),
 (408,352),
 (135,353),
 (169,353),
 (281,353),
 (318,353),
 (340,354),
 (432,354),
 (426,355),
 (30,356),
 (45,356),
 (125,356),
 (201,356),
 (297,356),
 (388,357),
 (327,358),
 (333,358),
 (423,359),
 (388,360),
 (428,361),
 (452,362),
 (180,363),
 (262,364),
 (277,364),
 (327,364),
 (333,364),
 (354,364),
 (396,364),
 (436,364),
 (29,365),
 (96,365),
 (299,365),
 (388,365),
 (426,365),
 (430,365),
 (168,366),
 (180,367),
 (29,368),
 (114,368),
 (267,368),
 (318,368),
 (451,369),
 (22,370),
 (16,371),
 (237,371),
 (448,372),
 (180,373),
 (86,374),
 (327,374),
 (190,375),
 (88,376),
 (423,376),
 (428,376),
 (318,377),
 (31,378),
 (48,378),
 (99,378),
 (168,378),
 (238,378),
 (332,378),
 (187,379),
 (428,379),
 (179,380),
 (428,381);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;


--
-- Definition of table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';

--
-- Dumping data for table `help_topic`
--

/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (0,'JOIN',25,'MySQL supports the following JOIN syntaxes for the table_references\npart of SELECT statements and multiple-table DELETE and UPDATE\nstatements:\n\ntable_references:\n    table_reference [, table_reference] ...\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [[AS] alias]\n        [{USE|IGNORE|FORCE} INDEX (key_list)]\n  | ( table_references )\n  | { OJ table_reference LEFT OUTER JOIN table_reference\n        ON conditional_expr }\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON condition\n  | table_reference LEFT [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [LEFT [OUTER]] JOIN table_factor\n  | table_reference RIGHT [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [RIGHT [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nA table reference is also known as a join expression.\n\nThe syntax of table_factor is extended in comparison with the SQL\nStandard. The latter accepts only table_reference, not a list of them\ninside a pair of parentheses.\n\nThis is a conservative extension if we consider each comma in a list of\ntable_reference items as equivalent to an inner join. For example:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nIn MySQL, CROSS JOIN is a syntactic equivalent to INNER JOIN (they can\nreplace each other). In standard SQL, they are not equivalent. INNER\nJOIN is used with an ON clause, CROSS JOIN is used otherwise.\n\nIn versions of MySQL prior to 5.0.1, parentheses in table_references\nwere just omitted and all join operations were grouped to the left. In\ngeneral, parentheses can be ignored in join expressions containing only\ninner join operations. As of 5.0.1, nested joins are allowed (see\nhttp://dev.mysql.com/doc/refman/5.0/en/nested-joins.html).\n\nFurther changes in join processing were made in 5.0.12 to make MySQL\nmore compliant with standard SQL. These charges are described later in\nthis section.\n','SELECT table1.* FROM table1\n  LEFT JOIN table2 ON table1.id=table2.id\n  WHERE table2.id IS NULL;\n','join'),
 (1,'HEX',33,'Syntax:\nHEX(N_or_S)\n\nIf N_or_S is a number, returns a string representation of the\nhexadecimal value of N, where N is a longlong (BIGINT) number. This is\nequivalent to CONV(N,10,16).\n\nIf N_or_S is a string, returns a hexadecimal string representation of\nN_or_S where each character in N_or_S is converted to two hexadecimal\ndigits.\n','mysql> SELECT HEX(255);\n        -> \'FF\'\nmysql> SELECT 0x616263;\n        -> \'abc\'\nmysql> SELECT HEX(\'abc\');\n        -> 616263\n','string-functions'),
 (2,'REPLACE',33,'Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n','mysql> SELECT REPLACE(\'www.mysql.com\', \'w\', \'Ww\');\n        -> \'WwWwWw.mysql.com\'\n','string-functions'),
 (3,'CONTAINS',26,'Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2.\n','','functions-that-test-spatial-relationships-between-geometries'),
 (4,'SRID',32,'SRID(g)\n\nReturns an integer indicating the Spatial Reference System ID for the\ngeometry value g.\n\nIn MySQL, the SRID value is just an integer associated with the\ngeometry value. All calculations are done assuming Euclidean (planar)\ngeometry.\n','mysql> SELECT SRID(GeomFromText(\'LineString(1 1,2 2)\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'LineString(1 1,2 2)\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n','general-geometry-property-functions'),
 (5,'CURRENT_TIMESTAMP',28,'Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n','','date-and-time-functions'),
 (6,'VARIANCE',14,'Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. This is an extension\nto standard SQL. As of MySQL 5.0.3, the standard SQL function VAR_POP()\ncan be used instead.\n\nVARIANCE() returns NULL if there were no matching rows.\n','','group-by-functions'),
 (7,'VAR_SAMP',14,'Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one. This function was added in MySQL 5.0.3.\n\nVAR_SAMP() returns NULL if there were no matching rows.\n','','group-by-functions'),
 (8,'CONCAT',33,'Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are non-binary strings,\nthe result is a non-binary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent binary string form; if you want to avoid that, you\ncan use an explicit type cast, as in this example:\n\nSELECT CONCAT(CAST(int_col AS CHAR), char_col);\n\nCONCAT() returns NULL if any argument is NULL.\n','mysql> SELECT CONCAT(\'My\', \'S\', \'QL\');\n        -> \'MySQL\'\nmysql> SELECT CONCAT(\'My\', NULL, \'QL\');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> \'14.3\'\n','string-functions'),
 (9,'GEOMETRY HIERARCHY',30,'Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnon-instantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n','','gis-geometry-class-hierarchy'),
 (10,'CHAR FUNCTION',33,'Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nAs of MySQL 5.0.15, CHAR() arguments larger than 255 are converted into\nmultiple result bytes. For example, CHAR(256) is equivalent to\nCHAR(1,0), and CHAR(256*256) is equivalent to CHAR(1,0,0):\n\nmysql> SELECT HEX(CHAR(1,0)), HEX(CHAR(256));\n+----------------+----------------+\n| HEX(CHAR(1,0)) | HEX(CHAR(256)) |\n+----------------+----------------+\n| 0100           | 0100           |\n+----------------+----------------+\nmysql> SELECT HEX(CHAR(1,0,0)), HEX(CHAR(256*256));\n+------------------+--------------------+\n| HEX(CHAR(1,0,0)) | HEX(CHAR(256*256)) |\n+------------------+--------------------+\n| 010000           | 010000             |\n+------------------+--------------------+\n\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nmysql> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));\n+---------------------+--------------------------------+\n| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |\n+---------------------+--------------------------------+\n| binary              | utf8                           |\n+---------------------+--------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nBefore MySQL 5.0.15, CHAR() returns a string in the connection\ncharacter set and the USING clause is unavailable. In addition, each\nargument is interpreted modulo 256, so CHAR(256) and CHAR(256*256) both\nare equivalent to CHAR(0).\n','mysql> SELECT CHAR(77,121,83,81,\'76\');\n        -> \'MySQL\'\nmysql> SELECT CHAR(77,77.3,\'77.3\');\n        -> \'MMM\'\n','string-functions'),
 (11,'DATETIME',20,'DATETIME\n\nA date and time combination. The supported range is \'1000-01-01\n00:00:00\' to \'9999-12-31 23:59:59\'. MySQL displays DATETIME values in\n\'YYYY-MM-DD HH:MM:SS\' format, but allows you to assign values to\nDATETIME columns using either strings or numbers.\n','','date-and-time-type-overview'),
 (12,'OPEN',35,'Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor.\n','','open'),
 (13,'SHOW CREATE PROCEDURE',25,'Syntax:\nSHOW CREATE {PROCEDURE | FUNCTION} sp_name\n\nThis statement is a MySQL extension. Similar to SHOW CREATE TABLE, it\nreturns the exact string that can be used to re-create the named\nroutine.\n','mysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n       Function: hello\n       sql_mode:\nCreate Function: CREATE FUNCTION `test`.`hello`(s CHAR(20)) RETURNS CHAR(50)\n                 RETURN CONCAT(\'Hello, \',s,\'!\')\n','show-create-procedure'),
 (14,'INTEGER',20,'INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n','','numeric-type-overview'),
 (15,'LOWER',33,'Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n','mysql> SELECT LOWER(\'QUADRATICALLY\');\n        -> \'quadratically\'\n','string-functions'),
 (16,'CREATE TRIGGER',21,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name trigger_time trigger_event\n    ON tbl_name FOR EACH ROW trigger_stmt\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. CREATE TRIGGER was added in\nMySQL 5.0.2. Currently, its use requires the SUPER privilege.\n\nThe trigger becomes associated with the table named tbl_name, which\nmust refer to a permanent table. You cannot associate a trigger with a\nTEMPORARY table or a view.\n\nWhen the trigger is activated, the DEFINER clause determines the\nprivileges that apply, as described later in this section.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after the statement that\nactivated it.\n\ntrigger_event indicates the kind of statement that activates the\ntrigger. The trigger_event can be one of the following:\n\no INSERT: The trigger is activated whenever a new row is inserted into\n  the table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger is activated whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger is activated whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements. However,\n  DROP TABLE and TRUNCATE statements on the table do not activate this\n  trigger, because they do not use DELETE. See [HELP TRUNCATE TABLE].\n','','create-trigger'),
 (17,'SHOW COLUMNS',25,'Syntax:\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [LIKE \'pattern\']\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views as of MySQL 5.0.1.\n\nIf the data types differ from what you expect them to be based on your\nCREATE TABLE statement, note that MySQL sometimes changes data types\nwhen you create or alter a table. The conditions for which this occurs\nare described in\nhttp://dev.mysql.com/doc/refman/5.0/en/silent-column-changes.html.\n\nThe FULL keyword causes the output to include the privileges you have\nas well as any per-column comments for each column.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nmysql> SHOW COLUMNS FROM mytable FROM mydb;\nmysql> SHOW COLUMNS FROM mydb.mytable;\n\nSHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table\'s\ncolumns with the mysqlshow db_name tbl_name command.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee [HELP DESCRIBE].\n','','show-columns'),
 (18,'MONTH',28,'Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 0 to 12.\n','mysql> SELECT MONTH(\'1998-02-03\');\n        -> 2\n','date-and-time-functions'),
 (19,'TINYINT',20,'TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n','','numeric-type-overview'),
 (20,'SHOW TRIGGERS',25,'Syntax:\nSHOW TRIGGERS [FROM db_name] [LIKE expr]\n\nSHOW TRIGGERS lists the triggers currently defined on the MySQL server.\nThis statement requires the SUPER privilege. It was implemented in\nMySQL 5.0.10.\n\nFor the trigger ins_sum as defined in\nhttp://dev.mysql.com/doc/refman/5.0/en/using-triggers.html, the output\nof this statement is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n  Trigger: ins_sum\n    Event: INSERT\n    Table: account\nStatement: SET @sum = @sum + NEW.amount\n   Timing: BEFORE\n  Created: NULL\n sql_mode:\n  Definer: myname@localhost\n','','show-triggers'),
 (21,'MASTER_POS_WAIT',13,'Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n','','miscellaneous-functions'),
 (22,'REGEXP',33,'Syntax:\nexpr REGEXP pat expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression. The syntax for\nregular expressions is discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/regexp.html. Returns 1 if expr\nmatches pat; otherwise it returns 0. If either expr or pat is NULL, the\nresult is NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nNote: Because MySQL uses the C escape syntax in strings (for example,\n`\\n\' to represent the newline character), you must double any `\\\' that\nyou use in your REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n','mysql> SELECT \'Monty!\' REGEXP \'m%y%%\';\n        -> 0\nmysql> SELECT \'Monty!\' REGEXP \'.*\';\n        -> 1\nmysql> SELECT \'new*\\n*line\' REGEXP \'new\\\\*.\\\\*line\';\n        -> 1\nmysql> SELECT \'a\' REGEXP \'A\', \'a\' REGEXP BINARY \'A\';\n        -> 1  0\nmysql> SELECT \'a\' REGEXP \'^[a-d]\';\n        -> 1\n','string-comparison-functions'),
 (23,'IF STATEMENT',35,'Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nIF implements a basic conditional construct. If the search_condition\nevaluates to true, the corresponding SQL statement list is executed. If\nno search_condition matches, the statement list in the ELSE clause is\nexecuted. Each statement_list consists of one or more statements.\n\nNote: There is also an IF() function, which differs from the IF\nstatement described here. See [HELP CASE function].\n','','if-statement'),
 (24,'^',18,'Syntax:\n^\n\nBitwise XOR:\n','mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8\n','bit-functions'),
 (25,'DROP VIEW',36,'Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view. If any of the views named in the argument list do not\nexist, MySQL returns an error indicating by name which non-existing\nviews it was unable to drop, but it also drops all of the views in the\nlist that do exist.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon\'t exist. When this clause is given, a NOTE is generated for each\nnon-existent view. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n','','drop-view'),
 (26,'WITHIN',26,'Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2.\n','','functions-that-test-spatial-relationships-between-geometries'),
 (27,'WEEK',28,'Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() allows you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n','mysql> SELECT WEEK(\'1998-02-20\');\n        -> 7\nmysql> SELECT WEEK(\'1998-02-20\',0);\n        -> 7\nmysql> SELECT WEEK(\'1998-02-20\',1);\n        -> 8\nmysql> SELECT WEEK(\'1998-12-31\',1);\n        -> 53\n','date-and-time-functions'),
 (28,'PREPARE',25,'Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a statement and assigns it a name,\nstmt_name, by which to refer to the statement later. Statement names\nare not case sensitive. preparable_stmt is either a string literal or a\nuser variable that contains the text of the statement. The text must\nrepresent a single SQL statement, not multiple statements. Within the\nstatement, `?\' characters can be used as parameter markers to indicate\nwhere data values are to be bound to the query later when you execute\nit. The `?\' characters should not be enclosed within quotes, even if\nyou intend to bind them to string values. Parameter markers can be used\nonly where data values should appear, not for SQL keywords,\nidentifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nThe scope of a prepared statement is the client session within which it\nis created. Other clients cannot see it.\n','','sqlps'),
 (29,'LOCK',7,'Syntax:\nLOCK TABLES\n    tbl_name [AS alias] {READ [LOCAL] | [LOW_PRIORITY] WRITE}\n    [, tbl_name [AS alias] {READ [LOCAL] | [LOW_PRIORITY] WRITE}] ...\nUNLOCK TABLES\n\nLOCK TABLES locks base tables (but not views) for the current thread.\nIf any of the tables are locked by other threads, it blocks until all\nlocks can be acquired. UNLOCK TABLES releases any locks held by the\ncurrent thread. All tables that are locked by the current thread are\nimplicitly unlocked when the thread issues another LOCK TABLES, or when\nthe connection to the server is closed.\n\nA table lock protects only against inappropriate reads or writes by\nother clients. The client holding the lock, even a read lock, can\nperform table-level operations such as DROP TABLE. Truncate operations\nare not transaction-safe, so an error occurs if the client attempts one\nduring an active transaction or while holding a table lock.\n','','lock-tables'),
 (30,'RESET SLAVE',25,'Syntax:\nRESET SLAVE\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster\'s binary logs. This statement is meant to be used for a clean\nstart: It deletes the master.info and relay-log.info files, all the\nrelay logs, and starts a new relay log.\n\nNote: All relay logs are deleted, even if they have not been completely\nexecuted by the slave SQL thread. (This is a condition likely to exist\non a replication slave if you have issued a STOP SLAVE statement or if\nthe slave is highly loaded.)\n\nConnection information stored in the master.info file is immediately\nreset using any values specified in the corresponding startup options.\nThis information includes values such as master host, master port,\nmaster user, and master password. If the slave SQL thread was in the\nmiddle of replicating temporary tables when it was stopped, and RESET\nSLAVE is issued, these replicated temporary tables are deleted on the\nslave.\n','','reset-slave'),
 (31,'SHOW BINARY LOGS',25,'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE MASTER LOGS], that shows\nhow to determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n','','show-binary-logs'),
 (32,'POLYGON',22,'Polygon(ls1,ls2,...)\n\nConstructs a WKB Polygon value from a number of WKB LineString\narguments. If any argument does not represent the WKB of a LinearRing\n(that is, not a closed and simple LineString) the return value is NULL.\n','','gis-mysql-specific-functions'),
 (33,'MINUTE',28,'Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n','mysql> SELECT MINUTE(\'98-02-03 10:05:03\');\n        -> 5\n','date-and-time-functions'),
 (34,'DAY',28,'Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n','','date-and-time-functions'),
 (35,'MID',33,'Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n','','string-functions'),
 (36,'REPLACE INTO',25,'Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See [HELP\nINSERT].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. For another MySQL extension to standard SQL ---\nthat either inserts or updates --- see\nhttp://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html.\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index, using a\nREPLACE statement makes no sense. It becomes equivalent to INSERT,\nbecause there is no index to be used to determine whether a new row\nduplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n','','replace'),
 (37,'UUID',13,'Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to\n\"DCE 1.1: Remote Procedure Call\" (Appendix A) CAE (Common Applications\nEnvironment) Specifications published by The Open Group in October 1997\n(Document Number C706,\nhttp://www.opengroup.org/public/pubs/catalog/c706.htm).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers\nthat are not connected to each other.\n\nA UUID is a 128-bit number represented by a string of five hexadecimal\nnumbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:\n\no The first three numbers are generated from a timestamp.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host computer has no Ethernet\n  card, or we do not know how to find the hardware address of an\n  interface on your operating system). In this case, spatial uniqueness\n  cannot be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  Currently, the MAC address of an interface is taken into account only\n  on FreeBSD and Linux. On other operating systems, MySQL uses a\n  randomly generated 48-bit number.\n','mysql> SELECT UUID();\n        -> \'6ccd780c-baba-1026-9564-0040f4311e29\'\n','miscellaneous-functions'),
 (38,'LINESTRING',22,'LineString(pt1,pt2,...)\n\nConstructs a WKB LineString value from a number of WKB Point arguments.\nIf any argument is not a WKB Point, the return value is NULL. If the\nnumber of Point arguments is less than two, the return value is NULL.\n','','gis-mysql-specific-functions'),
 (39,'SLEEP',13,'Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part given in microseconds. This\nfunction was added in MySQL 5.0.12.\n','','miscellaneous-functions'),
 (40,'CONNECTION_ID',15,'Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n','mysql> SELECT CONNECTION_ID();\n        -> 23786\n','information-functions'),
 (41,'DELETE',25,'Syntax:\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nOr:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nFor the single-table syntax, the DELETE statement deletes rows from\ntbl_name and returns the number of rows deleted. The WHERE clause, if\ngiven, specifies the conditions that identify which rows to delete.\nWith no WHERE clause, all rows are deleted. If the ORDER BY clause is\nspecified, the rows are deleted in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be deleted.\n\nFor the multiple-table syntax, DELETE deletes from each tbl_name the\nrows that satisfy the conditions. In this case, ORDER BY and LIMIT\ncannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in [HELP SELECT].\n\nAs stated, a DELETE statement with no WHERE clause deletes all rows. A\nfaster way to do this, when you do not want to know the number of\ndeleted rows, is to use TRUNCATE TABLE. See [HELP TRUNCATE TABLE].\n','','delete'),
 (42,'ROUND',4,'Syntax:\nROUND(X), ROUND(X,D)\n\nReturns the argument X, rounded to the nearest integer. With two\narguments, returns X rounded to D decimal places. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n','mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20\n','mathematical-functions'),
 (43,'NULLIF',6,'Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n','mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1\n','control-flow-functions'),
 (44,'CLOSE',35,'Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor.\n\nIf not closed explicitly, a cursor is closed at the end of the compound\nstatement in which it was declared.\n','','close'),
 (45,'STOP SLAVE',25,'Syntax:\nSTOP SLAVE [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n','','stop-slave'),
 (46,'TIMEDIFF',28,'Syntax:\nTIMEDIFF(expr1,expr2)\n\nTIMEDIFF() returns expr1 - expr2 expressed as a time value. expr1 and\nexpr2 are time or date-and-time expressions, but both must be of the\nsame type.\n','mysql> SELECT TIMEDIFF(\'2000:01:01 00:00:00\',\n    ->                 \'2000:01:01 00:00:00.000001\');\n        -> \'-00:00:00.000001\'\nmysql> SELECT TIMEDIFF(\'1997-12-31 23:59:59.000001\',\n    ->                 \'1997-12-30 01:01:01.000002\');\n        -> \'46:58:57.999999\'\n','date-and-time-functions'),
 (47,'LINEFROMTEXT',3,'LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])\n\nConstructs a LINESTRING value using its WKT representation and SRID.\n','','gis-wkt-functions'),
 (48,'SHOW MASTER STATUS',25,'Syntax:\nSHOW MASTER STATUS\n\nProvides status information about the binary log files of the master.\nExample:\n\nmysql > SHOW MASTER STATUS;\n+---------------+----------+--------------+------------------+\n| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |\n+---------------+----------+--------------+------------------+\n| mysql-bin.003 | 73       | test         | manual,mysql     |\n+---------------+----------+--------------+------------------+\n','','show-master-status'),
 (49,'ADDTIME',28,'Syntax:\nADDTIME(expr1,expr2)\n\nADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time\nor datetime expression, and expr2 is a time expression.\n','mysql> SELECT ADDTIME(\'1997-12-31 23:59:59.999999\',\n    ->                \'1 1:1:1.000002\');\n        -> \'1998-01-02 01:01:01.000001\'\nmysql> SELECT ADDTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'03:00:01.999997\'\n','date-and-time-functions'),
 (50,'SPATIAL',30,'MySQL can create spatial indexes using syntax similar to that for\ncreating regular indexes, but extended with the SPATIAL keyword.\nCurrently, spatial columns that are indexed must be declared NOT NULL.\nThe following examples demonstrate how to create spatial indexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g));\n\no With ALTER TABLE:\n\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE SPATIAL INDEX sp_index ON geom (g);\n\nFor MyISAM tables, SPATIAL INDEX creates an R-tree index. For other\nstorage engines that support spatial indexing, SPATIAL INDEX creates a\nB-tree index. A B-tree index on spatial values will be useful for\nexact-value lookups, but not for range scans.\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX sp_index ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n','','creating-spatial-indexes'),
 (51,'TIMESTAMPDIFF',28,'Syntax:\nTIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)\n\nReturns the integer difference between the date or datetime expressions\ndatetime_expr1 and datetime_expr2. The unit for the result is given by\nthe unit argument. The legal values for unit are the same as those\nlisted in the description of the TIMESTAMPADD() function.\n','mysql> SELECT TIMESTAMPDIFF(MONTH,\'2003-02-01\',\'2003-05-01\');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,\'2002-05-01\',\'2001-01-01\');\n        -> -1\n','date-and-time-functions'),
 (52,'UPPER',33,'Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n','mysql> SELECT UPPER(\'Hej\');\n        -> \'HEJ\'\n','string-functions'),
 (53,'FROM_UNIXTIME',28,'Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n\'YYYY-MM-DD HH:MM:SS\' or YYYYMMDDHHMMSS format, depending on whether\nthe function is used in a string or numeric context. unix_timestamp is\nan internal timestamp value such as is produced by the UNIX_TIMESTAMP()\nfunction.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n','mysql> SELECT FROM_UNIXTIME(875996580);\n        -> \'1997-10-04 22:23:00\'\nmysql> SELECT FROM_UNIXTIME(875996580) + 0;\n        -> 19971004222300\nmysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'%Y %D %M %h:%i:%s %x\');\n        -> \'2003 6th August 06:22:58 2003\'\n','date-and-time-functions'),
 (54,'MEDIUMBLOB',20,'MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 - 1) bytes.\n','','string-type-overview'),
 (55,'IFNULL',6,'Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2. IFNULL() returns a numeric or string value, depending on the\ncontext in which it is used.\n','mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,\'yes\');\n        -> \'yes\'\n','control-flow-functions'),
 (56,'SHOW ERRORS',25,'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nThis statement is similar to SHOW WARNINGS, except that instead of\ndisplaying errors, warnings, and notes, it displays only errors.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\n[HELP SELECT].\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n','','show-errors'),
 (57,'LEAST',17,'Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If the return value is used in an INTEGER context or all arguments\n  are integer-valued, they are compared as integers.\n\no If the return value is used in a REAL context or all arguments are\n  real-valued, they are compared as reals.\n\no If any argument is a case-sensitive string, the arguments are\n  compared as case-sensitive strings.\n\no In all other cases, the arguments are compared as case-insensitive\n  strings.\n\nBefore MySQL 5.0.13, LEAST() returns NULL only if all arguments are\nNULL. As of 5.0.13, it returns NULL if any argument is NULL.\n','mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(\'B\',\'A\',\'C\');\n        -> \'A\'\n','comparison-operators'),
 (58,'=',17,'=\n\nEqual:\n','mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT \'0\' = 0;\n        -> 1\nmysql> SELECT \'0.0\' = 0;\n        -> 1\nmysql> SELECT \'0.01\' = 0;\n        -> 0\nmysql> SELECT \'.01\' = 0.01;\n        -> 1\n','comparison-operators'),
 (59,'REVERSE',33,'Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n','mysql> SELECT REVERSE(\'abc\');\n        -> \'cba\'\n','string-functions'),
 (60,'ISNULL',17,'Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n','mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1\n','comparison-operators'),
 (61,'BINARY',20,'BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than non-binary character strings.\n','','string-type-overview'),
 (62,'BLOB DATA TYPE',20,'A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See\nhttp://dev.mysql.com/doc/refman/5.0/en/storage-requirements.html. No\nlettercase conversion for TEXT or BLOB columns takes place during\nstorage or retrieval.\n','','blob'),
 (63,'BOUNDARY',32,'Boundary(g)\n\nReturns a geometry that is the closure of the combinatorial boundary of\nthe geometry value g.\n','','general-geometry-property-functions'),
 (64,'CREATE USER',8,'Syntax:\nCREATE USER user [IDENTIFIED BY [PASSWORD] \'password\']\n    [, user [IDENTIFIED BY [PASSWORD] \'password\']] ...\n\nThe CREATE USER statement was added in MySQL 5.0.2. This statement\ncreates new MySQL accounts. To use it, you must have the global CREATE\nUSER privilege or the INSERT privilege for the mysql database. For each\naccount, CREATE USER creates a new record in the mysql.user table that\nhas no privileges. An error occurs if the account already exists. Each\naccount is named using the same format as for the GRANT statement; for\nexample, \'jeffrey\'@\'localhost\'. If you specify only the username part\nof the account name, a hostname part of \'%\' is used. For additional\ninformation about specifying account names, see [HELP GRANT].\n\nThe account can be given a password with the optional IDENTIFIED BY\nclause. The user value and the password are given the same way as for\nthe GRANT statement. In particular, to specify the password in plain\ntext, omit the PASSWORD keyword. To specify the password as the hashed\nvalue as returned by the PASSWORD() function, include the PASSWORD\nkeyword. See [HELP GRANT].\n','','create-user'),
 (65,'POINT',22,'Point(x,y)\n\nConstructs a WKB Point using its coordinates.\n','','gis-mysql-specific-functions'),
 (66,'CURRENT_USER',15,'Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the username and hostname combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. As of MySQL 5.0.10, within a stored\nroutine that is defined with the SQL SECURITY DEFINER characteristic,\nCURRENT_USER() returns the creator of the routine. The return value is\na string in the utf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'@\'localhost\' to\ndatabase \'mysql\'\nmysql> SELECT CURRENT_USER();\n        -> \'@localhost\'\n','information-functions'),
 (67,'LCASE',33,'Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n','','string-functions'),
 (68,'<=',17,'Syntax:\n<=\n\nLess than or equal:\n','mysql> SELECT 0.1 <= 2;\n        -> 1\n','comparison-operators'),
 (69,'UPDATE',25,'Syntax:\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] tbl_name\n    SET col_name1=expr1 [, col_name2=expr2 ...]\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET col_name1=expr1 [, col_name2=expr2 ...]\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in tbl_name with new values. The SET clause indicates\nwhich columns to modify and the values they should be given. The WHERE\nclause, if given, specifies the conditions that identify which rows to\nupdate. With no WHERE clause, all rows are updated. If the ORDER BY\nclause is specified, the rows are updated in the order that is\nspecified. The LIMIT clause places a limit on the number of rows that\ncan be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. In this case, ORDER BY\nand LIMIT cannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. It is specified as described in [HELP SELECT].\n\nThe UPDATE statement supports the following modifiers:\n\no If you use the LOW_PRIORITY keyword, execution of the UPDATE is\n  delayed until no other clients are reading from the table.\n\no If you use the IGNORE keyword, the update statement does not abort\n  even if errors occur during the update. Rows for which duplicate-key\n  conflicts occur are not updated. Rows for which columns are updated\n  to values that would cause data conversion errors are updated to the\n  closest valid values instead.\n','','update'),
 (70,'CASE STATEMENT',35,'Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored routines implements a complex conditional\nconstruct. If a search_condition evaluates to true, the corresponding\nSQL statement list is executed. If no search condition matches, the\nstatement list in the ELSE clause is executed. Each statement_list\nconsists of one or more statements.\n\nNote: The syntax of the CASE statement shown here for use inside stored\nroutines differs slightly from that of the SQL CASE expression\ndescribed in [HELP CASE function]. The CASE statement cannot have an\nELSE NULL clause, and it is terminated with END CASE instead of END.\n','','case-statement'),
 (71,'EXECUTE STATEMENT',25,'Syntax:\nEXECUTE stmt_name [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement, you execute it with an EXECUTE statement\nthat refers to the prepared statement name. If the prepared statement\ncontains any parameter markers, you must supply a USING clause that\nlists user variables containing the values to be bound to the\nparameters. Parameter values can be supplied only by user variables,\nand the USING clause must name exactly as many variables as the number\nof parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n','','sqlps'),
 (72,'DROP INDEX',36,'Syntax:\nDROP INDEX index_name ON tbl_name\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [HELP ALTER TABLE].\n','','drop-index'),
 (73,'MATCH AGAINST',33,'Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nsearch_modifier: { IN BOOLEAN MODE | WITH QUERY EXPANSION }\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with MyISAM tables, and can be\n  created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large datasets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a literal string, not a variable or a column name. There\nare three types of full-text searches:\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Common words such as \"some\" or\n  \"then\" are stopwords and do not match if present in the search\n  string. The IN BOOLEAN MODE modifier specifies a boolean search. For\n  more information, see\n  http://dev.mysql.com/doc/refman/5.0/en/fulltext-boolean.html.\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators. The stopword list applies. In addition, words that are\n  present in more than 50% of the rows are considered common and do not\n  match. Full-text searches are natural language searches if no\n  modifier is given.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The WITH QUERY\n  EXPANSION modifier specifies a query expansion search. For more\n  information, see\n  http://dev.mysql.com/doc/refman/5.0/en/fulltext-query-expansion.html.\n','mysql> SELECT id, body, MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\') AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\');\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n','fulltext-search'),
 (74,'ABS',4,'Syntax:\nABS(X)\n\nReturns the absolute value of X.\n','mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32\n','mathematical-functions'),
 (75,'POLYFROMWKB',29,'PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])\n\nConstructs a POLYGON value using its WKB representation and SRID.\n','','gis-wkb-functions'),
 (76,'NOT LIKE',33,'Syntax:\nexpr NOT LIKE pat [ESCAPE \'escape_char\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'escape_char\']).\n','','string-comparison-functions'),
 (77,'SPACE',33,'Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n','mysql> SELECT SPACE(6);\n        -> \'      \'\n','string-functions'),
 (78,'MBR DEFINITION',5,'Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n','((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n','gis-class-geometry'),
 (79,'GEOMETRYCOLLECTION',22,'GeometryCollection(g1,g2,...)\n\nConstructs a WKB GeometryCollection. If any argument is not a\nwell-formed WKB representation of a geometry, the return value is NULL.\n','','gis-mysql-specific-functions'),
 (80,'*',4,'Syntax:\n*\n\nMultiplication:\n','mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nmysql> SELECT 18014398509481984*18014398509481984;\n        -> 0\n','arithmetic-functions'),
 (81,'TIMESTAMP',20,'TIMESTAMP\n\nA timestamp. The range is \'1970-01-01 00:00:01\' UTC to partway through\nthe year 2037. TIMESTAMP values are stored as the number of seconds\nsince the epoch (\'1970-01-01 00:00:00\' UTC). A TIMESTAMP cannot\nrepresent the value \'1970-01-01 00:00:00\' because that is equivalent to\n0 seconds from the epoch and the value 0 is reserved for representing\n\'0000-00-00 00:00:00\', the \"zero\" TIMESTAMP value.\n\nA TIMESTAMP column is useful for recording the date and time of an\nINSERT or UPDATE operation. By default, the first TIMESTAMP column in a\ntable is automatically set to the date and time of the most recent\noperation if you do not assign it a value yourself. You can also set\nany TIMESTAMP column to the current date and time by assigning it a\nNULL value. Variations on automatic initialization and update\nproperties are described in\nhttp://dev.mysql.com/doc/refman/5.0/en/timestamp-4-1.html.\n\nA TIMESTAMP value is returned as a string in the format \'YYYY-MM-DD\nHH:MM:SS\' with a display width fixed at 19 characters. To obtain the\nvalue as a number, you should add +0 to the timestamp column.\n\nNote: The TIMESTAMP format that was used prior to MySQL 4.1 is not\nsupported in MySQL 5.0; see MySQL 3.23, 4.0, 4.1 Reference Manual for\ninformation regarding the old format.\n','','date-and-time-type-overview'),
 (82,'DES_DECRYPT',10,'Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nNote that this function works only if MySQL has been configured with\nSSL support. See\nhttp://dev.mysql.com/doc/refman/5.0/en/secure-connections.html.\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n','','encryption-functions'),
 (83,'ENDPOINT',11,'EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n','linestring-property-functions'),
 (84,'CACHE INDEX',25,'Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n','','cache-index'),
 (85,'COMPRESS',10,'Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n','mysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(\'\'));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(\'a\'));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',16)));\n        -> 15\n','encryption-functions'),
 (86,'INSERT',25,'Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT ... SELECT is discussed\nfurther in [HELP INSERT SELECT].\n','','insert'),
 (87,'COUNT',14,'Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values in the rows retrieved\nby a SELECT statement. The result is a BIGINT value.\n\nCOUNT() returns 0 if there were no matching rows.\n','mysql> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;\n','group-by-functions'),
 (88,'HANDLER',25,'Syntax:\nHANDLER tbl_name OPEN [ AS alias ]\nHANDLER tbl_name READ index_name { = | >= | <= | < } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for MyISAM and InnoDB tables.\n','','handler'),
 (89,'MLINEFROMTEXT',3,'MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])\n\nConstructs a MULTILINESTRING value using its WKT representation and\nSRID.\n','','gis-wkt-functions'),
 (90,'GEOMCOLLFROMWKB',29,'GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and\nSRID.\n','','gis-wkb-functions'),
 (91,'RENAME TABLE',36,'Syntax:\nRENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.\n\nThe rename operation is done atomically, which means that no other\nthread can access any of the tables while the rename is running. For\nexample, if you have an existing table old_table, you can create\nanother table new_table that has the same structure but is empty, and\nthen replace the existing table with the empty one as follows (assuming\nthat backup_table does not already exist):\n','CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;\n','rename-table'),
 (92,'BOOLEAN',20,'BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Non-zero values are considered true:\n\nmysql> SELECT IF(0, \'true\', \'false\');\n+------------------------+\n| IF(0, \'true\', \'false\') |\n+------------------------+\n| false                  |\n+------------------------+\n\nmysql> SELECT IF(1, \'true\', \'false\');\n+------------------------+\n| IF(1, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nmysql> SELECT IF(2, \'true\', \'false\');\n+------------------------+\n| IF(2, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nHowever, the values TRUE and FALSE are merely aliases for 1 and 0,\nrespectively, as shown here:\n\nmysql> SELECT IF(0 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(0 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| true                           |\n+--------------------------------+\n\nmysql> SELECT IF(1 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(1 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| true                          |\n+-------------------------------+\n\nmysql> SELECT IF(2 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(2 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| false                         |\n+-------------------------------+\n\nmysql> SELECT IF(2 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(2 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| false                          |\n+--------------------------------+\n\nThe last two statements display the results shown because 2 is equal to\nneither 1 nor 0.\n\nWe intend to implement full boolean type handling, in accordance with\nstandard SQL, in a future MySQL release.\n','','numeric-type-overview'),
 (93,'DEFAULT',13,'Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. Starting with MySQL\n5.0.2, an error results if the column has no default value.\n','mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n','miscellaneous-functions'),
 (94,'MOD',4,'Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n','mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2\n','mathematical-functions'),
 (95,'TINYTEXT',20,'TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 255 (28 - 1) characters.\n','','string-type-overview'),
 (96,'OPTIMIZE TABLE',19,'Syntax:\nOPTIMIZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE should be used if you have deleted a large part of a\ntable or if you have made many changes to a table with variable-length\nrows (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns).\nDeleted rows are maintained in a linked list and subsequent INSERT\noperations reuse old row positions. You can use OPTIMIZE TABLE to\nreclaim the unused space and to defragment the data file.\n\nThis statement requires SELECT and INSERT privileges for the table.\n','','optimize-table'),
 (97,'DECODE',10,'Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n','','encryption-functions'),
 (98,'<=>',17,'Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n','mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n','comparison-operators'),
 (99,'LOAD DATA FROM MASTER',25,'Syntax:\nLOAD DATA FROM MASTER\n\nThis feature is deprecated. We recommend not using it anymore. It is\nsubject to removal in a future version of MySQL.\n\nSince the current implementation of LOAD DATA FROM MASTER and LOAD\nTABLE FROM MASTER is very limited, these statements are deprecated in\nversions 4.1 of MySQL and above. We will introduce a more advanced\ntechnique (called \"online backup\") in a future version. That technique\nwill have the additional advantage of working with more storage\nengines.\n\nFor MySQL 5.1 and earlier, the recommended alternative solution to\nusing LOAD DATA FROM MASTER or LOAD TABLE FROM MASTER is using\nmysqldump or mysqlhotcopy. The latter requires Perl and two Perl\nmodules (DBI and DBD:mysql) and works for MyISAM and ARCHIVE tables\nonly. With mysqldump, you can create SQL dumps on the master and pipe\n(or copy) these to a mysql client on the slave. This has the advantage\nof working for all storage engines, but can be quite slow, since it\nworks using SELECT.\n\nThis statement takes a snapshot of the master and copies it to the\nslave. It updates the values of MASTER_LOG_FILE and MASTER_LOG_POS so\nthat the slave starts replicating from the correct position. Any table\nand database exclusion rules specified with the --replicate-*-do-* and\n--replicate-*-ignore-* options are honored. --replicate-rewrite-db is\nnot taken into account because a user could use this option to set up a\nnon-unique mapping such as --replicate-rewrite-db=\"db1->db3\" and\n--replicate-rewrite-db=\"db2->db3\", which would confuse the slave when\nloading tables from the master.\n\nUse of this statement is subject to the following conditions:\n\no It works only for MyISAM tables. Attempting to load a non-MyISAM\n  table results in the following error:\n\nERROR 1189 (08S01): Net error reading from master\n\no It acquires a global read lock on the master while taking the\n  snapshot, which prevents updates on the master during the load\n  operation.\n\nIf you are loading large tables, you might have to increase the values\nof net_read_timeout and net_write_timeout on both the master and slave\nservers. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\nNote that LOAD DATA FROM MASTER does not copy any tables from the mysql\ndatabase. This makes it easy to have different users and privileges on\nthe master and the slave.\n\nTo use LOAD DATA FROM MASTER, the replication account that is used to\nconnect to the master must have the RELOAD and SUPER privileges on the\nmaster and the SELECT privilege for all master tables you want to load.\nAll master tables for which the user does not have the SELECT privilege\nare ignored by LOAD DATA FROM MASTER. This is because the master hides\nthem from the user: LOAD DATA FROM MASTER calls SHOW DATABASES to know\nthe master databases to load, but SHOW DATABASES returns only databases\nfor which the user has some privilege. See [HELP SHOW DATABASES]. On\nthe slave side, the user that issues LOAD DATA FROM MASTER must have\nprivileges for dropping and creating the databases and tables that are\ncopied.\n','','load-data-from-master'),
 (100,'RESET',25,'Syntax:\nRESET reset_option [, reset_option] ...\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n','','reset'),
 (101,'HELP STATEMENT',24,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nmanual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttp://dev.mysql.com/doc/refman/5.0/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not case\nsensitive.\n','','help'),
 (102,'GET_LOCK',13,'Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error occurred\n(such as running out of memory or the thread was killed with mysqladmin\nkill). If you have a lock obtained with GET_LOCK(), it is released when\nyou execute RELEASE_LOCK(), execute a new GET_LOCK(), or your\nconnection terminates (either normally or abnormally). Locks obtained\nwith GET_LOCK() do not interact with transactions. That is, committing\na transaction does not release any such locks obtained during the\ntransaction.\n\nThis function can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked by one client, GET_LOCK() blocks any request by another\nclient for a lock with the same name. This allows clients that agree on\na given lock name to use the name to perform cooperative advisory\nlocking. But be aware that it also allows a client that is not among\nthe set of cooperating clients to lock a name, either inadvertently or\ndeliberately, and thus prevent any of the cooperating clients from\nlocking that name. One way to reduce the likelihood of this is to use\nlock names that are database-specific or application-specific. For\nexample, use lock names of the form db_name.str or app_name.str.\n','mysql> SELECT GET_LOCK(\'lock1\',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT GET_LOCK(\'lock2\',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock1\');\n        -> NULL\n','miscellaneous-functions');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (103,'UCASE',33,'Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n','','string-functions'),
 (104,'SHOW BINLOG EVENTS',25,'Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed.\n','','show-binlog-events'),
 (105,'MPOLYFROMWKB',29,'MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])\n\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n','','gis-wkb-functions'),
 (106,'ITERATE',35,'Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means \"do the loop again.\"\n','CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND\n','iterate-statement'),
 (107,'DO',25,'Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n','','do'),
 (108,'CURTIME',28,'Syntax:\nCURTIME()\n\nReturns the current time as a value in \'HH:MM:SS\' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext.\n','mysql> SELECT CURTIME();\n        -> \'23:50:26\'\nmysql> SELECT CURTIME() + 0;\n        -> 235026\n','date-and-time-functions'),
 (109,'CHAR_LENGTH',33,'Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmulti-byte character counts as a single character. This means that for\na string containing five two-byte characters, LENGTH() returns 10,\nwhereas CHAR_LENGTH() returns 5.\n','','string-functions'),
 (110,'BIGINT',20,'BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n','','numeric-type-overview'),
 (111,'SET',25,'Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | [@@global. | @@session. | @@]system_var_name = expr\n\nThe SET statement assigns values to different types of variables that\naffect the operation of the server or your client. Older versions of\nMySQL employed SET OPTION, but this syntax is deprecated in favor of\nSET without OPTION.\n','','set-option'),
 (112,'DATE',20,'DATE\n\nA date. The supported range is \'1000-01-01\' to \'9999-12-31\'. MySQL\ndisplays DATE values in \'YYYY-MM-DD\' format, but allows you to assign\nvalues to DATE columns using either strings or numbers.\n','','date-and-time-type-overview'),
 (113,'CONV',33,'Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If to_base is\na negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n','mysql> SELECT CONV(\'a\',16,2);\n        -> \'1010\'\nmysql> SELECT CONV(\'6E\',18,8);\n        -> \'172\'\nmysql> SELECT CONV(-17,10,-18);\n        -> \'-H\'\nmysql> SELECT CONV(10+\'10\'+\'10\'+0xa,10,10);\n        -> \'40\'\n','string-functions'),
 (114,'SHOW OPEN TABLES',25,'Syntax:\nSHOW OPEN TABLES [FROM db_name] [LIKE \'pattern\']\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttp://dev.mysql.com/doc/refman/5.0/en/table-cache.html.\n','','show-open-tables'),
 (115,'EXTRACT',28,'Syntax:\nEXTRACT(unit FROM date)\n\nThe EXTRACT() function uses the same kinds of unit specifiers as\nDATE_ADD() or DATE_SUB(), but extracts parts from the date rather than\nperforming date arithmetic.\n','mysql> SELECT EXTRACT(YEAR FROM \'1999-07-02\');\n       -> 1999\nmysql> SELECT EXTRACT(YEAR_MONTH FROM \'1999-07-02 01:02:03\');\n       -> 199907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM \'1999-07-02 01:02:03\');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'2003-01-02 10:30:00.00123\');\n        -> 123\n','date-and-time-functions'),
 (116,'ENCRYPT',10,'Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument should be a string with at least two\ncharacters. If no salt argument is given, a random value is used.\n','mysql> SELECT ENCRYPT(\'hello\');\n        -> \'VxuFAJXVARROc\'\n','encryption-functions'),
 (117,'SHOW STATUS',25,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS [LIKE \'pattern\']\n\nSHOW STATUS provides server status information. This information also\ncan be obtained using the mysqladmin extended-status command.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nThe GLOBAL and SESSION options are new in MySQL 5.0.2. With the GLOBAL\nmodifier, SHOW STATUS displays the status values for all connections to\nMySQL. With SESSION, it displays the status values for the current\nconnection. If no modifier is present, the default is SESSION. LOCAL is\na synonym for SESSION.\n\nSome status variables have only a global value. For these, you get the\nsame value for both GLOBAL and SESSION.\n\nNote: Before MySQL 5.0.2, SHOW STATUS returned global status values.\nBecause the default as of 5.0.2 is to return session values, this is\nincompatible with previous versions. To issue a SHOW STATUS statement\nthat will retrieve global status values for all versions of MySQL,\nwrite it like this:\n\nSHOW /*!50002 GLOBAL */ STATUS;\n','','show-status'),
 (118,'OLD_PASSWORD',10,'Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added to MySQL when the implementation of PASSWORD()\nwas changed to improve security. OLD_PASSWORD() returns the value of\nthe old (pre-4.1) implementation of PASSWORD() as a binary string, and\nis intended to permit you to reset passwords for any pre-4.1 clients\nthat need to connect to your version 5.0 MySQL server without locking\nthem out. See\nhttp://dev.mysql.com/doc/refman/5.0/en/password-hashing.html.\n','','encryption-functions'),
 (119,'SET VARIABLE',35,'Syntax:\nSET var_name = expr [, var_name = expr] ...\n\nThe SET statement in stored routines is an extended version of the\ngeneral SET statement. Referenced variables may be ones declared inside\na routine, or global system variables.\n\nThe SET statement in stored routines is implemented as part of the\npre-existing SET syntax. This allows an extended syntax of SET a=x,\nb=y, ... where different variable types (locally declared variables and\nglobal and session server variables) can be mixed. This also allows\ncombinations of local variables and some options that make sense only\nfor system variables; in that case, the options are recognized but\nignored.\n','','set-statement'),
 (120,'FORMAT',33,'Syntax:\nFORMAT(X,D)\n\nFormats the number X to a format like \'#,###,###.##\', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part.\n','mysql> SELECT FORMAT(12332.123456, 4);\n        -> \'12,332.1235\'\nmysql> SELECT FORMAT(12332.1,4);\n        -> \'12,332.1000\'\nmysql> SELECT FORMAT(12332.2,0);\n        -> \'12,332\'\n','string-functions'),
 (121,'||',12,'Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is non-zero, and 0 otherwise. With a NULL operand, the result\nis 1 if the other operand is non-zero, and NULL otherwise. If both\noperands are NULL, the result is NULL.\n','mysql> SELECT 1 || 1;\n        -> 1\nmysql> SELECT 1 || 0;\n        -> 1\nmysql> SELECT 0 || 0;\n        -> 0\nmysql> SELECT 0 || NULL;\n        -> NULL\nmysql> SELECT 1 || NULL;\n        -> 1\n','logical-operators'),
 (122,'BIT_LENGTH',33,'Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n','mysql> SELECT BIT_LENGTH(\'text\');\n        -> 32\n','string-functions'),
 (123,'EXTERIORRING',2,'ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n','polygon-property-functions'),
 (124,'GEOMFROMWKB',29,'GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n','','gis-wkb-functions'),
 (125,'SHOW SLAVE HOSTS',25,'Syntax:\n          SHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster. Only slaves started with the --report-host=slave_name option\nare visible in this list.\n\nThe list is displayed on any server (not just the master server). The\noutput looks like this: mysql> SHOW SLAVE HOSTS;\n+------------+-----------+------+-----------+ | Server_id | Host | Port\n| Master_id | +------------+-----------+------+-----------+ | 192168010\n| iconnect2 | 3306 | 192168011 | | 1921680101 | athena | 3306 |\n192168011 | +------------+-----------+------+-----------+ Server_id:\nThe unique server ID of the slave server, as configured in the server\'s\noption file, or on the command line with --server-id=value . Host: The\nhost name of the slave server, as configured in the server\'s option\nfile, or on the command line with --report-host=value. Note that this\ncan differ from the machine name as configured in the operating system.\nPort: The port the slave server is listening on. Master_id: The unique\nserver ID of the master server that the slave server is replicating\nfrom. Some MySQL versions report another variable, Rpl_recovery_rank.\nThis variable was never used, and was eventually removed.\n','','show-slave-hosts'),
 (126,'START TRANSACTION',7,'Syntax:\nSTART TRANSACTION | BEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET AUTOCOMMIT = {0 | 1}\n\nThe START TRANSACTION and BEGIN statement begin a new transaction.\nCOMMIT commits the current transaction, making its changes permanent.\nROLLBACK rolls back the current transaction, canceling its changes. The\nSET AUTOCOMMIT statement disables or enables the default autocommit\nmode for the current connection.\n\nBeginning with MySQL 5.0.3, the optional WORK keyword is supported for\nCOMMIT and RELEASE, as are the CHAIN and RELEASE clauses. CHAIN and\nRELEASE can be used for additional control over transaction completion.\nThe value of the completion_type system variable determines the default\ncompletion behavior. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The RELEASE clause causes the\nserver to disconnect the current client connection after terminating\nthe current transaction. Including the NO keyword suppresses CHAIN or\nRELEASE completion, which can be useful if the completion_type system\nvariable is set to cause chaining or release completion by default.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk.\n\nIf you are using a transaction-safe storage engine (such as InnoDB,\nBDB, or NDB Cluster), you can disable autocommit mode with the\nfollowing statement:\n\nSET AUTOCOMMIT=0;\n\nAfter disabling autocommit mode by setting the AUTOCOMMIT variable to\nzero, you must use COMMIT to store your changes to disk or ROLLBACK if\nyou want to ignore the changes you have made since the beginning of\nyour transaction.\n\nTo disable autocommit mode for a single series of statements, use the\nSTART TRANSACTION statement:\n','START TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n','commit'),
 (127,'BETWEEN AND',17,'Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in\nhttp://dev.mysql.com/doc/refman/5.0/en/type-conversion.html, but\napplied to all the three arguments.\n','mysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT \'b\' BETWEEN \'a\' AND \'c\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'3\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'x-3\';\n        -> 0\n','comparison-operators'),
 (128,'MULTIPOLYGON',22,'MultiPolygon(poly1,poly2,...)\n\nConstructs a WKB MultiPolygon value from a set of WKB Polygon\narguments. If any argument is not a WKB Polygon, the return value is\nNULL.\n','','gis-mysql-specific-functions'),
 (129,'TIME_FORMAT',28,'Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, and seconds. Other\nspecifiers produce a NULL value or 0.\n','mysql> SELECT TIME_FORMAT(\'100:00:00\', \'%H %k %h %I %l\');\n        -> \'100 100 04 04 4\'\n','date-and-time-functions'),
 (130,'LEFT',33,'Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str, or NULL if any\nargument is NULL.\n','mysql> SELECT LEFT(\'foobarbar\', 5);\n        -> \'fooba\'\n','string-functions'),
 (131,'FLUSH QUERY CACHE',24,'You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n','','query-cache-status-and-maintenance'),
 (132,'SET DATA TYPE',20,'SET(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values \'value1\', \'value2\', ... A SET\ncolumn can have a maximum of 64 members. SET values are represented\ninternally as integers.\n','','string-type-overview'),
 (133,'RAND',4,'Syntax:\nRAND(), RAND(N)\n\nReturns a random floating-point value v between 0 and 1 inclusive (that\nis, in the range 0 <= v <= 1.0). If an integer argument N is specified,\nit is used as the seed value, which produces a repeatable sequence of\ncolumn values.\n','mysql> SELECT RAND();\n        -> 0.9233482386203\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND();\n        -> 0.63553050033332\nmysql> SELECT RAND();\n        -> 0.70100469486881\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\n','mathematical-functions'),
 (134,'RPAD',33,'Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n','mysql> SELECT RPAD(\'hi\',5,\'?\');\n        -> \'hi???\'\nmysql> SELECT RPAD(\'hi\',1,\'?\');\n        -> \'h\'\n','string-functions'),
 (135,'CREATE DATABASE',36,'Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification [create_specification] ...]\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name\n\nCREATE DATABASE creates a database with the given name. To use this\nstatement, you need the CREATE privilege for the database. CREATE\nSCHEMA is a synonym for CREATE DATABASE as of MySQL 5.0.2.\n','','create-database'),
 (136,'DEC',20,'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n','','numeric-type-overview'),
 (137,'VAR_POP',14,'Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. This function was added in MySQL 5.0.3. Before 5.0.3,\nyou can use VARIANCE(), which is equivalent but is not standard SQL.\n\nVAR_POP() returns NULL if there were no matching rows.\n','','group-by-functions'),
 (138,'ELT',33,'Syntax:\nELT(N,str1,str2,str3,...)\n\nReturns str1 if N = 1, str2 if N = 2, and so on. Returns NULL if N is\nless than 1 or greater than the number of arguments. ELT() is the\ncomplement of FIELD().\n','mysql> SELECT ELT(1, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'ej\'\nmysql> SELECT ELT(4, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'foo\'\n','string-functions'),
 (139,'ALTER VIEW',36,'Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of an existing view. The syntax\nis similar to that for CREATE VIEW. See [HELP CREATE VIEW]. This\nstatement requires the CREATE VIEW and DROP privileges for the view,\nand some privilege for each column referred to in the SELECT statement.\n','','alter-view'),
 (140,'SHOW DATABASES',25,'Syntax:\nSHOW {DATABASES | SCHEMAS} [LIKE \'pattern\']\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES as of MySQL 5.0.2.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n','','show-databases'),
 (141,'~',18,'Syntax:\n~\n\nInvert all bits.\n','mysql> SELECT 5 & ~1;\n        -> 4\n','bit-functions'),
 (142,'TEXT',20,'TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 65,535 (216 - 1) characters.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n','','string-type-overview'),
 (143,'CONCAT_WS',33,'Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n','mysql> SELECT CONCAT_WS(\',\',\'First name\',\'Second name\',\'Last Name\');\n        -> \'First name,Second name,Last Name\'\nmysql> SELECT CONCAT_WS(\',\',\'First name\',NULL,\'Last Name\');\n        -> \'First name,Last Name\'\n','string-functions'),
 (144,'ROW_COUNT',15,'Syntax:\nROW_COUNT()\n\nROW_COUNT() returns the number of rows updated, inserted, or deleted by\nthe preceding statement. This is the same as the row count that the\nmysql client displays and the value from the mysql_affected_rows() C\nAPI function.\n','mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n','information-functions'),
 (145,'ASIN',4,'Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n','mysql> SELECT ASIN(0.2);\n        -> 0.20135792079033\nmysql> SELECT ASIN(\'foo\');\n\n+-------------+\n| ASIN(\'foo\') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: \'foo\' |\n+---------+------+-----------------------------------------+\n','mathematical-functions'),
 (146,'SHOW LOGS',25,'Syntax:\nSHOW [BDB] LOGS\n\nIn MySQL 5.0, this is a deprecated synonym for SHOW ENGINE BDB LOGS.\nSee [HELP SHOW ENGINE].\n','','show-logs'),
 (147,'SIGN',4,'Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n','mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1\n','mathematical-functions'),
 (148,'SEC_TO_TIME',28,'Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a value in \'HH:MM:SS\' or HHMMSS format, depending on whether the\nfunction is used in a string or numeric context.\n','mysql> SELECT SEC_TO_TIME(2378);\n        -> \'00:39:38\'\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n','date-and-time-functions'),
 (149,'FLOAT',20,'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Allowable values are\n-3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits allowed by the hardware. A single-precision floating-point\nnumber is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\nhttp://dev.mysql.com/doc/refman/5.0/en/no-matching-rows.html.\n','','numeric-type-overview'),
 (150,'LOCATE',33,'Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str.\n','mysql> SELECT LOCATE(\'bar\', \'foobarbar\');\n        -> 4\nmysql> SELECT LOCATE(\'xbar\', \'foobar\');\n        -> 0\nmysql> SELECT LOCATE(\'bar\', \'foobarbar\', 5);\n        -> 7\n','string-functions'),
 (151,'CHARSET',15,'Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n','mysql> SELECT CHARSET(\'abc\');\n        -> \'latin1\'\nmysql> SELECT CHARSET(CONVERT(\'abc\' USING utf8));\n        -> \'utf8\'\nmysql> SELECT CHARSET(USER());\n        -> \'utf8\'\n','information-functions'),
 (152,'SUBDATE',28,'Syntax:\nSUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL unit\nargument, see the discussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT SUBDATE(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\n\nThe second form allows the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nmysql> SELECT SUBDATE(\'1998-01-02 12:00:00\', 31);\n        -> \'1997-12-02 12:00:00\'\n','','date-and-time-functions'),
 (153,'DAYOFYEAR',28,'Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n','mysql> SELECT DAYOFYEAR(\'1998-02-03\');\n        -> 34\n','date-and-time-functions'),
 (154,'LONGTEXT',20,'LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\ncharacters. The maximum effective (permitted) length of LONGTEXT\ncolumns depends on the configured maximum packet size in the\nclient/server protocol and available memory.\n','','string-type-overview'),
 (155,'%',4,'Syntax:\nN % M\n\nModulo operation. Returns the remainder of N divided by M. For more\ninformation, see the description for the MOD() function in [HELP ABS].\n','','arithmetic-functions'),
 (156,'DISJOINT',26,'Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n','','functions-that-test-spatial-relationships-between-geometries'),
 (157,'KILL',25,'Syntax:\nKILL [CONNECTION | QUERY] thread_id\n\nEach connection to mysqld runs in a separate thread. You can see which\nthreads are running with the SHOW PROCESSLIST statement and kill a\nthread with the KILL thread_id statement.\n\nIn MySQL 5.0.0, KILL allows the optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given thread_id.\n\no KILL QUERY terminates the statement that the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\nNote: You cannot use KILL with the Embedded MySQL Server library,\nbecause the embedded server merely runs inside the threads of the host\napplication. It does not create any connection threads of its own.\n','','kill'),
 (158,'ASTEXT',3,'AsText(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n','mysql> SET @g = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n','functions-to-convert-geometries-between-formats'),
 (159,'LPAD',33,'Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n','mysql> SELECT LPAD(\'hi\',4,\'??\');\n        -> \'??hi\'\nmysql> SELECT LPAD(\'hi\',1,\'??\');\n        -> \'h\'\n','string-functions'),
 (160,'RESTORE TABLE',19,'Syntax:\nRESTORE TABLE tbl_name [, tbl_name] ... FROM \'/path/to/backup/directory\'\n\nRESTORE TABLE restores the table or tables from a backup that was made\nwith BACKUP TABLE. The directory should be specified as a full\npathname.\n\nExisting tables are not overwritten; if you try to restore over an\nexisting table, an error occurs. Just as for BACKUP TABLE, RESTORE\nTABLE currently works only for MyISAM tables. Restored tables are not\nreplicated from master to slave.\n\nThe backup for each table consists of its .frm format file and .MYD\ndata file. The restore operation restores those files, and then uses\nthem to rebuild the .MYI index file. Restoring takes longer than\nbacking up due to the need to rebuild the indexes. The more indexes the\ntable has, the longer it takes.\n','','restore-table'),
 (161,'DECLARE CONDITION',35,'Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | mysql_error_code\n\nThis statement specifies conditions that need specific handling. It\nassociates a name with a specified error condition. The name can\nsubsequently be used in a DECLARE HANDLER statement. See [HELP DECLARE\nHANDLER].\n\nA condition_value can be an SQLSTATE value or a MySQL error code.\n','','declare-conditions'),
 (162,'OVERLAPS',26,'Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n','','functions-that-test-spatial-relationships-between-geometries'),
 (163,'NUMGEOMETRIES',23,'NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n','geometrycollection-property-functions'),
 (164,'SET GLOBAL SQL_SLAVE_SKIP_COUNTER',25,'Syntax:\nSET GLOBAL SQL_SLAVE_SKIP_COUNTER = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave thread is not running.\nOtherwise, it produces an error.\n','','set-global-sql-slave-skip-counter'),
 (165,'MONTHNAME',28,'Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date. As of MySQL 5.0.25, the\nlanguage used for the name is controlled by the value of the\nlc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.0/en/locale-support.html).\n','mysql> SELECT MONTHNAME(\'1998-02-05\');\n        -> \'February\'\n','date-and-time-functions'),
 (166,'PROCEDURE ANALYSE',34,'Syntax:\nanalyse([max_elements[,max_memory]])\n\nThis procedure is defined in the sql/sql_analyse.cc file. It examines\nthe result from a query and returns an analysis of the results that\nsuggests optimal data types for each column. To obtain this analysis,\nappend PROCEDURE ANALYSE to the end of a SELECT statement:\n\nSELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])\n\nFor example:\n\nSELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);\n\nThe results show some statistics for the values returned by the query,\nand propose an optimal data type for the columns. This can be helpful\nfor checking your existing tables, or after importing new data. You may\nneed to try different settings for the arguments so that PROCEDURE\nANALYSE() does not suggest the ENUM data type when it is not\nappropriate.\n\nThe arguments are optional and are used as follows:\n\no max_elements (default 256) is the maximum number of distinct values\n  that analyse notices per column. This is used by analyse to check\n  whether the optimal data type should be of type ENUM.\n\no max_memory (default 8192) is the maximum amount of memory that\n  analyse should allocate per column while trying to find all distinct\n  values.\n','','procedure-analyse'),
 (167,'MBREQUAL',5,'MBREqual(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n','','relations-on-geometry-mbr'),
 (168,'CHANGE MASTER TO',25,'Syntax:\nCHANGE MASTER TO master_def [, master_def] ...\n\nmaster_def:\n    MASTER_HOST = \'host_name\'\n  | MASTER_USER = \'user_name\'\n  | MASTER_PASSWORD = \'password\'\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = count\n  | MASTER_LOG_FILE = \'master_log_name\'\n  | MASTER_LOG_POS = master_log_pos\n  | RELAY_LOG_FILE = \'relay_log_name\'\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = \'ca_file_name\'\n  | MASTER_SSL_CAPATH = \'ca_directory_name\'\n  | MASTER_SSL_CERT = \'cert_file_name\'\n  | MASTER_SSL_KEY = \'key_file_name\'\n  | MASTER_SSL_CIPHER = \'cipher_list\'\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to and communicating with the master server. It also updates\nthe contents of the master.info and relay-log.info files.\n\nMASTER_USER, MASTER_PASSWORD, MASTER_SSL, MASTER_SSL_CA,\nMASTER_SSL_CAPATH, MASTER_SSL_CERT, MASTER_SSL_KEY, and\nMASTER_SSL_CIPHER provide information to the slave about how to connect\nto its master.\n\nThe SSL options (MASTER_SSL, MASTER_SSL_CA, MASTER_SSL_CAPATH,\nMASTER_SSL_CERT, MASTER_SSL_KEY, and MASTER_SSL_CIPHER) can be changed\neven on slaves that are compiled without SSL support. They are saved to\nthe master.info file, but are ignored unless you use a server that has\nSSL support enabled.\n\nIf you don\'t specify a given parameter, it keeps its old value, except\nas indicated in the following discussion. For example, if the password\nto connect to your MySQL master has changed, you just need to issue\nthese statements to tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=\'new3cret\';\nSTART SLAVE; -- if you want to restart replication\n\nThere is no need to specify the parameters that do not change (host,\nport, user, and so forth).\n\nMASTER_HOST and MASTER_PORT are the hostname (or IP address) of the\nmaster host and its TCP/IP port. Note that if MASTER_HOST is equal to\nlocalhost, then, like in other parts of MySQL, the port number might be\nignored (if Unix socket files can be used, for example).\n\nIf you specify MASTER_HOST or MASTER_PORT, the slave assumes that the\nmaster server is different from before (even if you specify a host or\nport value that is the same as the current value.) In this case, the\nold values for the master binary log name and position are considered\nno longer applicable, so if you do not specify MASTER_LOG_FILE and\nMASTER_LOG_POS in the statement, MASTER_LOG_FILE=\'\' and\nMASTER_LOG_POS=4 are silently appended to it.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. If you specify either of them, you cannot specify\nRELAY_LOG_FILE or RELAY_LOG_POS. If neither of MASTER_LOG_FILE or\nMASTER_LOG_POS are specified, the slave uses the last coordinates of\nthe slave SQL thread before CHANGE MASTER was issued. This ensures that\nthere is no discontinuity in replication, even if the slave SQL thread\nwas late compared to the slave I/O thread, when you merely want to\nchange, say, the password to use.\n\nCHANGE MASTER deletes all relay log files and starts a new one, unless\nyou specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay logs\nare kept; the relay_log_purge global variable is set silently to 0.\n\nCHANGE MASTER is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the log and the offset\ncorresponding to it. After loading the snapshot into the slave, you can\nrun CHANGE MASTER TO MASTER_LOG_FILE=\'log_name_on_master\',\nMASTER_LOG_POS=log_offset_on_master on the slave.\n\nThe following example changes the master and master\'s binary log\ncoordinates. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=\'master2.mycompany.com\',\n  MASTER_USER=\'replication\',\n  MASTER_PASSWORD=\'bigs3cret\',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=\'master2-bin.001\',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay logs that you want it to execute\nagain for some reason. To do this, the master need not be reachable.\nYou need only use CHANGE MASTER TO and start the SQL thread (START\nSLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=\'slave-relay-bin.006\',\n  RELAY_LOG_POS=4025;\n','','change-master-to'),
 (169,'DROP DATABASE',36,'Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE as of MySQL 5.0.2.\n\nImportant: When a database is dropped, user privileges on the database\nare not automatically dropped. See [HELP GRANT].\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n','','drop-database'),
 (170,'TIMESTAMP FUNCTION',28,'Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr1,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr1 and\nreturns the result as a datetime value.\n','mysql> SELECT TIMESTAMP(\'2003-12-31\');\n        -> \'2003-12-31 00:00:00\'\nmysql> SELECT TIMESTAMP(\'2003-12-31 12:00:00\',\'12:00:00\');\n        -> \'2004-01-01 00:00:00\'\n','date-and-time-functions'),
 (171,'CHARACTER_LENGTH',33,'Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n','','string-functions'),
 (172,'SHOW GRANTS',25,'Syntax:\nSHOW GRANTS [FOR user]\n\nThis statement lists the GRANT statement or statements that must be\nissued to duplicate the privileges that are granted to a MySQL user\naccount. The account is named using the same format as for the GRANT\nstatement; for example, \'jeffrey\'@\'localhost\'. If you specify only the\nusername part of the account name, a hostname part of \'%\' is used. For\nadditional information about specifying account names, see [HELP\nGRANT].\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT ALL PRIVILEGES ON *.* TO \'root\'@\'localhost\' WITH GRANT OPTION |\n+---------------------------------------------------------------------+\n\nTo list the privileges granted to the account that you are using to\nconnect to the server, you can use any of the following statements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nAs of MySQL 5.0.24, if SHOW GRANTS FOR CURRENT_USER (or any of the\nequivalent syntaxes) is used in DEFINER context, such as within a\nstored procedure that is defined with SQL SECURITY DEFINER), the grants\ndisplayed are those of the definer and not the invoker.\n','','show-grants'),
 (173,'SHOW PRIVILEGES',25,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n','','show-privileges'),
 (174,'INSERT FUNCTION',33,'Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos is len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n','mysql> SELECT INSERT(\'Quadratic\', 3, 4, \'What\');\n        -> \'QuWhattic\'\nmysql> SELECT INSERT(\'Quadratic\', -1, 4, \'What\');\n        -> \'Quadratic\'\nmysql> SELECT INSERT(\'Quadratic\', 3, 100, \'What\');\n        -> \'QuWhat\'\n','string-functions'),
 (175,'CRC32',4,'Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n','mysql> SELECT CRC32(\'MySQL\');\n        -> 3259397556\nmysql> SELECT CRC32(\'mysql\');\n        -> 2501908538\n','mathematical-functions'),
 (176,'XOR',12,'Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is non-zero,\notherwise 0 is returned.\n','mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1\n','logical-operators'),
 (177,'STARTPOINT',11,'StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n','linestring-property-functions'),
 (178,'DECLARE VARIABLE',35,'Syntax:\nDECLARE var_name[,...] type [DEFAULT value]\n\nThis statement is used to declare local variables. To provide a default\nvalue for the variable, include a DEFAULT clause. The value can be\nspecified as an expression; it need not be a constant. If the DEFAULT\nclause is missing, the initial value is NULL.\n\nLocal variables are treated like routine parameters with respect to\ndata type and overflow checking. See [HELP CREATE PROCEDURE].\n\nThe scope of a local variable is within the BEGIN ... END block where\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n','','declare-local-variables'),
 (179,'MPOLYFROMTEXT',3,'MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])\n\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n','','gis-wkt-functions'),
 (180,'GRANT',8,'Syntax:\nGRANT priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON [object_type] {tbl_name | * | *.* | db_name.*}\n    TO user [IDENTIFIED BY [PASSWORD] \'password\']\n        [, user [IDENTIFIED BY [PASSWORD] \'password\']] ...\n    [REQUIRE\n        NONE |\n        [{SSL| X509}]\n        [CIPHER \'cipher\' [AND]]\n        [ISSUER \'issuer\' [AND]]\n        [SUBJECT \'subject\']]\n    [WITH with_option [with_option] ...]\n\nobject_type =\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n\nwith_option =\n    GRANT OPTION\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n\nThe GRANT statement enables system administrators to create MySQL user\naccounts and to grant rights to from accounts. To use GRANT, you must\nhave the GRANT OPTION privilege, and you must have the privileges that\nyou are granting. The REVOKE statement is related and enables\nadministrators to remove account privileges. See [HELP REVOKE].\n\nMySQL account information is stored in the tables of the mysql\ndatabase. This database and the access control system are discussed\nextensively in [HELP FLUSH QUERY CACHE], which you should consult for\nadditional details.\n\nImportant: Some releases of MySQL introduce changes to the structure of\nthe grant tables to add new privileges or features. Whenever you update\nto a new version of MySQL, you should update your grant tables to make\nsure that they have the current structure so that you can take\nadvantage of any new capabilities. See\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-upgrade.html.\n\nIf the grant tables hold privilege rows that contain mixed-case\ndatabase or table names and the lower_case_table_names system variable\nis set to a non-zero value, REVOKE cannot be used to revoke these\nprivileges. It will be necessary to manipulate the grant tables\ndirectly. (GRANT will not create such rows when lower_case_table_names\nis set, but such rows might have been created prior to setting the\nvariable.)\n\nPrivileges can be granted at several levels:\n\no Global level\n\n  Global privileges apply to all databases on a given server. These\n  privileges are stored in the mysql.user table. GRANT ALL ON *.* and\n  REVOKE ALL ON *.* grant and revoke only global privileges.\n\no Database level\n\n  Database privileges apply to all objects in a given database. These\n  privileges are stored in the mysql.db and mysql.host tables. GRANT\n  ALL ON db_name.* and REVOKE ALL ON db_name.* grant and revoke only\n  database privileges.\n\no Table level\n\n  Table privileges apply to all columns in a given table. These\n  privileges are stored in the mysql.tables_priv table. GRANT ALL ON\n  db_name.tbl_name and REVOKE ALL ON db_name.tbl_name grant and revoke\n  only table privileges.\n\no Column level\n\n  Column privileges apply to single columns in a given table. These\n  privileges are stored in the mysql.columns_priv table. When using\n  REVOKE, you must specify the same columns that were granted.\n\no Routine level\n\n  The CREATE ROUTINE, ALTER ROUTINE, EXECUTE, and GRANT privileges\n  apply to stored routines (functions and procedures). They can be\n  granted at the global and database levels. Also, except for CREATE\n  ROUTINE, these privileges can be granted at the routine level for\n  individual routines and are stored in the mysql.procs_priv table.\n\nThe object_type clause was added in MySQL 5.0.6. It should be specified\nas TABLE, FUNCTION, or PROCEDURE when the following object is a table,\na stored function, or a stored procedure.\n','','grant'),
 (181,'MBRINTERSECTS',5,'MBRIntersects(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n','','relations-on-geometry-mbr'),
 (182,'BIT_OR',14,'Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n','','group-by-functions'),
 (183,'YEARWEEK',28,'Syntax:\nYEARWEEK(date), YEARWEEK(date,mode)\n\nReturns year and week for a date. The mode argument works exactly like\nthe mode argument to WEEK(). The year in the result may be different\nfrom the year in the date argument for the first and the last week of\nthe year.\n','mysql> SELECT YEARWEEK(\'1987-01-01\');\n        -> 198653\n','date-and-time-functions'),
 (184,'NOT BETWEEN',17,'Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n','','comparison-operators'),
 (185,'LOG10',4,'Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n','mysql> SELECT LOG10(2);\n        -> 0.30102999566398\nmysql> SELECT LOG10(100);\n        -> 2\nmysql> SELECT LOG10(-100);\n        -> NULL\n','mathematical-functions'),
 (186,'SQRT',4,'Syntax:\nSQRT(X)\n\nReturns the square root of a non-negative number X.\n','mysql> SELECT SQRT(4);\n        -> 2\nmysql> SELECT SQRT(20);\n        -> 4.4721359549996\nmysql> SELECT SQRT(-16);\n        -> NULL        \n','mathematical-functions'),
 (187,'DECIMAL',20,'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nFor MySQL 5.0.3 and above:\n\nA packed \"exact\" fixed-point number. M is the total number of digits\n(the precision) and D is the number of digits after the decimal point\n(the scale). The decimal point and (for negative numbers) the `-\' sign\nare not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65 (64\nfrom 5.0.3 to 5.0.5). The maximum number of supported decimals (D) is\n30. If D is omitted, the default is 0. If M is omitted, the default is\n10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nBefore MySQL 5.0.3:\n\nAn unpacked fixed-point number. Behaves like a CHAR column; \"unpacked\"\nmeans the number is stored as a string, using one character for each\ndigit of the value. M is the total number of digits and D is the number\nof digits after the decimal point. The decimal point and (for negative\nnumbers) the `-\' sign are not counted in M, although space for them is\nreserved. If D is 0, values have no decimal point or fractional part.\nThe maximum range of DECIMAL values is the same as for DOUBLE, but the\nactual range for a given DECIMAL column may be constrained by the\nchoice of M and D. If D is omitted, the default is 0. If M is omitted,\nthe default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n','','numeric-type-overview'),
 (188,'CREATE FUNCTION',34,'Syntax:\nCREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. As of MySQL 5.0.3, DECIMAL is a legal value\nafter RETURNS, but currently DECIMAL functions return string values and\nshould be written like STRING functions.\n\nshared_library_name is the basename of the shared object file that\ncontains the code that implements the function. The file must be\nlocated in a directory that is searched by your system\'s dynamic\nlinker.\n\nTo create a function, you must have the INSERT and privilege for the\nmysql database. This is necessary because CREATE FUNCTION adds a row to\nthe mysql.func system table that records the function\'s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-upgrade.html.\n','','create-function'),
 (189,'GEOMETRYN',23,'GeometryN(gc,N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n','geometrycollection-property-functions'),
 (190,'CREATE INDEX',36,'Syntax:\nCREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [index_type]\n    ON tbl_name (index_col_name,...)\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [HELP ALTER TABLE]. For more information about indexes, see\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-indexes.html.\n','','create-index'),
 (191,'ALTER DATABASE',36,'Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification [alter_specification] ...\n\nalter_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE as of\nMySQL 5.0.2.\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation.\nhttp://dev.mysql.com/doc/refman/5.0/en/charset.html, discusses\ncharacter set and collation names.\n\nThe database name can be omitted, in which case the statement applies\nto the default database.\n','','alter-database'),
 (192,'<<',18,'Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n','mysql> SELECT 1 << 2;\n        -> 4\n','bit-functions'),
 (193,'SHOW TABLE STATUS',25,'Syntax:\nSHOW TABLE STATUS [FROM db_name] [LIKE \'pattern\']\n\nSHOW TABLE STATUS works likes SHOW TABLE, but provides a lot of\ninformation about each table. You can also get this list using the\nmysqlshow --status db_name command.\n','','show-table-status'),
 (194,'MD5',10,'Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a binary string of 32 hex digits, or NULL if the argument\nwas NULL. The return value can, for example, be used as a hash key.\n','mysql> SELECT MD5(\'testing\');\n        -> \'ae2b1fca515949e5d54fb22b8ed95575\'\n','encryption-functions'),
 (195,'<',17,'Syntax:\n<\n\nLess than:\n','mysql> SELECT 2 < 2;\n        -> 0\n','comparison-operators'),
 (196,'UNIX_TIMESTAMP',28,'Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n\'1970-01-01 00:00:00\' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since \'1970-01-01 00:00:00\' UTC. date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format YYMMDD or\nYYYYMMDD. The server interprets date as a value in the current time\nzone and converts it to an internal value in UTC. Clients can set their\ntime zone as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/time-zone-support.html.\n','mysql> SELECT UNIX_TIMESTAMP();\n        -> 882226357\nmysql> SELECT UNIX_TIMESTAMP(\'1997-10-04 22:23:00\');\n        -> 875996580\n','date-and-time-functions'),
 (197,'DAYOFMONTH',28,'Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 0 to 31.\n','mysql> SELECT DAYOFMONTH(\'1998-02-03\');\n        -> 3\n','date-and-time-functions'),
 (198,'ASCII',33,'Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for characters with numeric values from 0 to 255.\n','mysql> SELECT ASCII(\'2\');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(\'dx\');\n        -> 100\n','string-functions'),
 (199,'DIV',4,'Syntax:\nDIV\n\nInteger division. Similar to FLOOR(), but is safe with BIGINT values.\n','mysql> SELECT 5 DIV 2;\n        -> 2\n','arithmetic-functions'),
 (200,'RENAME USER',8,'Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the UPDATE privilege\nfor the mysql database. An error occurs if any old account does not\nexist or any new account exists. Each account is named using the same\nformat as for the GRANT statement; for example, \'jeffrey\'@\'localhost\'.\nIf you specify only the username part of the account name, a hostname\npart of \'%\' is used. For additional information about specifying\naccount names, see [HELP GRANT].\n','','rename-user'),
 (201,'SHOW SLAVE STATUS',25,'Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. If you issue this statement using the mysql client,\nyou can use a \\G statement terminator rather than a semicolon to obtain\na more readable vertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n       Slave_IO_State: Waiting for master to send event\n          Master_Host: localhost\n          Master_User: root\n          Master_Port: 3306\n        Connect_Retry: 3\n      Master_Log_File: gbichot-bin.005\n  Read_Master_Log_Pos: 79\n       Relay_Log_File: gbichot-relay-bin.005\n        Relay_Log_Pos: 548\nRelay_Master_Log_File: gbichot-bin.005\n     Slave_IO_Running: Yes\n    Slave_SQL_Running: Yes\n      Replicate_Do_DB:\n  Replicate_Ignore_DB:\n           Last_Errno: 0\n           Last_Error:\n         Skip_Counter: 0\n  Exec_Master_Log_Pos: 79\n      Relay_Log_Space: 552\n      Until_Condition: None\n       Until_Log_File:\n        Until_Log_Pos: 0\n   Master_SSL_Allowed: No\n   Master_SSL_CA_File:\n   Master_SSL_CA_Path:\n      Master_SSL_Cert:\n    Master_SSL_Cipher:\n       Master_SSL_Key:\nSeconds_Behind_Master: 8\n','','show-slave-status'),
 (202,'GEOMETRY',30,'MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Currently,\nspatial columns are supported for MyISAM, InnoDB, NDB, BDB, and ARCHIVE\ntables. (Support for storage engines other than MyISAM was added in\nMySQL 5.0.16.) See also the annotations about spatial indexes under\n[HELP SPATIAL].\n','CREATE TABLE geom (g GEOMETRY);\n','creating-spatial-columns'),
 (203,'NUMPOINTS',11,'NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n','linestring-property-functions'),
 (204,'&',18,'Syntax:\n&\n\nBitwise AND:\n','mysql> SELECT 29 & 15;\n        -> 13\n','bit-functions'),
 (205,'LOCALTIMESTAMP',28,'Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n','','date-and-time-functions'),
 (206,'ADDDATE',28,'Syntax:\nADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL unit argument,\nsee the discussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1998-02-02\'\nmysql> SELECT ADDDATE(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1998-02-02\'\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n','mysql> SELECT ADDDATE(\'1998-01-02\', 31);\n        -> \'1998-02-02\'\n','date-and-time-functions'),
 (207,'REPEAT LOOP',35,'Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition is true. Thus, a REPEAT always enters the loop at\nleast once. statement_list consists of one or more statements.\n\nA REPEAT statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT SET @x = @x + 1; UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n','repeat-statement'),
 (208,'SMALLINT',20,'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n','','numeric-type-overview'),
 (209,'DOUBLE PRECISION',20,'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n','','numeric-type-overview'),
 (210,'ORD',33,'Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code x 256)\n+ (3rd byte code x 2562) ...\n\nIf the leftmost character is not a multi-byte character, ORD() returns\nthe same value as the ASCII() function.\n','mysql> SELECT ORD(\'2\');\n        -> 50\n','string-functions'),
 (211,'ENVELOPE',32,'Envelope(g)\n\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n','mysql> SELECT AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n','general-geometry-property-functions'),
 (212,'DEALLOCATE PREPARE',25,'Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement, use the DEALLOCATE PREPARE\nstatement. Attempting to execute a prepared statement after\ndeallocating it results in an error.\n\nIf you terminate a client session without deallocating a previously\nprepared statement, the server deallocates it automatically.\n','','sqlps'),
 (213,'IS_FREE_LOCK',13,'Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n','','miscellaneous-functions'),
 (214,'TOUCHES',26,'Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n','','functions-that-test-spatial-relationships-between-geometries'),
 (215,'INET_ATON',13,'Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of a network address as a string,\nreturns an integer that represents the numeric value of the address.\nAddresses may be 4- or 8-byte addresses.\n','mysql> SELECT INET_ATON(\'209.207.224.40\');\n        -> 3520061480\n','miscellaneous-functions'),
 (216,'UNCOMPRESS',10,'Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n','mysql> SELECT UNCOMPRESS(COMPRESS(\'any string\'));\n        -> \'any string\'\nmysql> SELECT UNCOMPRESS(\'any string\');\n        -> NULL\n','encryption-functions'),
 (217,'AUTO_INCREMENT',20,'The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n','CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n );\n\nINSERT INTO animals (name) VALUES \n    (\'dog\'),(\'cat\'),(\'penguin\'),\n    (\'lax\'),(\'whale\'),(\'ostrich\');\n\nSELECT * FROM animals;\n','example-auto-increment'),
 (218,'ISSIMPLE',32,'IsSimple(g)\n\nCurrently, this function is a placeholder and should not be used. If\nimplemented, its behavior will be as described in the next paragraph.\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and -1 if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See [HELP Geometry\nhierarchy].)\n','','general-geometry-property-functions'),
 (219,'- BINARY',4,'Syntax:\n-\n\nSubtraction:\n','mysql> SELECT 3-5;\n        -> -2\n','arithmetic-functions');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (220,'GEOMCOLLFROMTEXT',3,'GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and\nSRID.\n','','gis-wkt-functions'),
 (221,'WKT DEFINITION',3,'The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form.\n','','gis-wkt-format'),
 (222,'CURRENT_TIME',28,'Syntax:\nCURRENT_TIME, CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n','','date-and-time-functions'),
 (223,'REVOKE',8,'Syntax:\nREVOKE priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON [object_type] {tbl_name | * | *.* | db_name.*}\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts. To use REVOKE, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nEach account is named using the same format as for the GRANT statement;\nfor example, \'jeffrey\'@\'localhost\'. If you specify only the username\npart of the account name, a hostname part of \'%\' is used. For\nadditional information about specifying account names, see [HELP\nGRANT].\n\nFor details on the levels at which privileges exist, the allowable\npriv_type values, and the syntax for specifying users and passwords,\nsee [HELP GRANT]\n','','revoke'),
 (224,'LAST_INSERT_ID',15,'Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nLAST_INSERT_ID() (with no argument) returns the first automatically\ngenerated value that was set for an AUTO_INCREMENT column by the most\nrecently executed INSERT or UPDATE statement to affect such a column.\nFor example, after inserting a row that generates an AUTO_INCREMENT\nvalue, you can get the value like this:\n\nmysql> SELECT LAST_INSERT_ID();\n        -> 195\n\nThe currently executing statement does not affect the value of\nLAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value\nwith one statement, and then refer to LAST_INSERT_ID() in a\nmultiple-row INSERT statement that inserts rows into a table with its\nown AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain\nstable in the second statement; its value for the second and later rows\nis not affected by the earlier row insertions. (However, if you mix\nreferences to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is\nundefined.)\n\nIf the previous statement returned an error, the value of\nLAST_INSERT_ID() is undefined. For transactional tables, if the\nstatement is rolled back due to an error, the value of LAST_INSERT_ID()\nis left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()\nis not restored to that before the transaction; it remains as it was at\nthe point of the ROLLBACK.\n\nWithin the body of a stored routine (procedure or function) or a\ntrigger, the value of LAST_INSERT_ID() changes the same way as for\nstatements executed outside the body of these kinds of objects. The\neffect of a stored routine or trigger upon the value of\nLAST_INSERT_ID() that is seen by following statements depends on the\nkind of routine:\n\no If a stored procedure executes statements that change the value of\n  LAST_INSERT_ID(), the changed value will be seen by statements that\n  follow the procedure call.\n\no For stored functions and triggers that change the value, the value is\n  restored when the function or trigger ends, so following statements\n  will not see a changed value.\n','','information-functions'),
 (225,'LAST_DAY',28,'Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n','mysql> SELECT LAST_DAY(\'2003-02-05\');\n        -> \'2003-02-28\'\nmysql> SELECT LAST_DAY(\'2004-02-05\');\n        -> \'2004-02-29\'\nmysql> SELECT LAST_DAY(\'2004-01-01 01:01:01\');\n        -> \'2004-01-31\'\nmysql> SELECT LAST_DAY(\'2003-03-32\');\n        -> NULL\n','date-and-time-functions'),
 (226,'MEDIUMINT',20,'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n','','numeric-type-overview'),
 (227,'FLOOR',4,'Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n','mysql> SELECT FLOOR(1.23);\n        -> 1\nmysql> SELECT FLOOR(-1.23);\n        -> -2\n','mathematical-functions'),
 (228,'RTRIM',33,'Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n','mysql> SELECT RTRIM(\'barbar   \');\n        -> \'barbar\'\n','string-functions'),
 (229,'DEGREES',4,'Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n','mysql> SELECT DEGREES(PI());\n        -> 180\nmysql> SELECT DEGREES(PI() / 2);\n        -> 90\n','mathematical-functions'),
 (230,'EXPLAIN',25,'Syntax:\nEXPLAIN tbl_name\n\nOr:\n\nEXPLAIN [EXTENDED] SELECT select_options\n\nThe EXPLAIN statement can be used either as a synonym for DESCRIBE or\nas a way to obtain information about how MySQL executes a SELECT\nstatement:\n\no EXPLAIN tbl_name is synonymous with DESCRIBE tbl_name or SHOW COLUMNS\n  FROM tbl_name.\n\no When you precede a SELECT statement with the keyword EXPLAIN, MySQL\n  displays information from the optimizer about the query execution\n  plan. That is, MySQL explains how it would process the SELECT,\n  including information about how tables are joined and in which order.\n','','explain'),
 (231,'VARCHAR',20,'[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA variable-length string. M represents the maximum column length. In\nMySQL 5.0, the range of M is 0 to 255 before MySQL 5.0.3, and 0 to\n65,535 in MySQL 5.0.3 and later. (The actual maximum length of a\nVARCHAR in MySQL 5.0 is determined by the maximum row size and the\ncharacter set you use. The maximum effective column length starting\nwith MySQL 5.0.3 is subject to a row size of 65,532 bytes.)\n\nNote: Before 5.0.3, trailing spaces were removed when VARCHAR values\nwere stored, which differs from the standard SQL specification.\n\nPrior to MySQL 5.0.3, a VARCHAR column with a length specification\ngreater than 255 was converted to the smallest TEXT type that could\nhold values of the given length. For example, VARCHAR(500) was\nconverted to TEXT, and VARCHAR(200000) was converted to MEDIUMTEXT.\nThis was a compatibility feature. However, this conversion affected\ntrailing-space removal.\n\nVARCHAR is shorthand for CHARACTER VARYING.\n\nVARCHAR values are stored using as many characters as are needed, plus\none byte to record the length (two bytes for columns that are declared\nwith a length longer than 255).\n','','string-type-overview'),
 (232,'UNHEX',33,'Syntax:\n\nUNHEX(str)\n\nPerforms the inverse operation of HEX(str). That is, it interprets each\npair of hexadecimal digits in the argument as a number and converts it\nto the character represented by the number. The resulting characters\nare returned as a binary string.\n','mysql> SELECT UNHEX(\'4D7953514C\');\n        -> \'MySQL\'\nmysql> SELECT 0x4D7953514C;\n        -> \'MySQL\'\nmysql> SELECT UNHEX(HEX(\'string\'));\n        -> \'string\'\nmysql> SELECT HEX(UNHEX(\'1267\'));\n        -> \'1267\'\n','string-functions'),
 (233,'- UNARY',4,'Syntax:\n-\n\nUnary minus. This operator changes the sign of the argument.\n','mysql> SELECT - 2;\n        -> -2\n','arithmetic-functions'),
 (234,'SELECT INTO',35,'Syntax:\nSELECT col_name[,...] INTO var_name[,...] table_expr\n\nThis SELECT syntax stores selected columns directly into variables.\nTherefore, only a single row may be retrieved.\n','SELECT id,data INTO x,y FROM test.t1 LIMIT 1;\n','select-into-statement'),
 (235,'COS',4,'Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n','mysql> SELECT COS(PI());\n        -> -1\n','mathematical-functions'),
 (236,'DATE FUNCTION',28,'Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n','mysql> SELECT DATE(\'2003-12-31 01:02:03\');\n        -> \'2003-12-31\'\n','date-and-time-functions'),
 (237,'DROP TRIGGER',21,'Syntax:\nDROP TRIGGER [IF EXISTS] [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER was added in MySQL 5.0.2. Its use requires the\nSUPER privilege.\n\nUse IF EXISTS to prevent an error from occurring for a trigger that\ndoes not exist. A NOTE is generated for a non-existent trigger when\nusing IF EXISTS. See [HELP SHOW WARNINGS]. The IF EXISTS clause was\nadded in MySQL 5.0.32.\n','','drop-trigger'),
 (238,'RESET MASTER',25,'Syntax:\nRESET MASTER\n\nDeletes all binary logs listed in the index file, resets the binary log\nindex file to be empty, and creates a new binary log file.\n','','reset-master'),
 (239,'TAN',4,'Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n','mysql> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nmysql> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n','mathematical-functions'),
 (240,'PI',4,'Syntax:\nPI()\n\nReturns the value of π (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n','mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n','mathematical-functions'),
 (241,'WEEKOFYEAR',28,'Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n','mysql> SELECT WEEKOFYEAR(\'1998-02-20\');\n        -> 8\n','date-and-time-functions'),
 (242,'/',4,'Syntax:\n/\n\nDivision:\n','mysql> SELECT 3/5;\n        -> 0.60\n','arithmetic-functions'),
 (243,'STDDEV_SAMP',14,'Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP(). This function was added in MySQL 5.0.3.\n\nSTDDEV_SAMP() returns NULL if there were no matching rows.\n','','group-by-functions'),
 (244,'SCHEMA',15,'Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE(). It was added in MySQL 5.0.2.\n','','information-functions'),
 (245,'MLINEFROMWKB',29,'MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])\n\nConstructs a MULTILINESTRING value using its WKB representation and\nSRID.\n','','gis-wkb-functions'),
 (246,'LOG2',4,'Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n','mysql> SELECT LOG2(65536);\n        -> 16\nmysql> SELECT LOG2(-100);\n        -> NULL\n','mathematical-functions'),
 (247,'SUBTIME',28,'Syntax:\nSUBTIME(expr1,expr2)\n\nSUBTIME() returns expr1 - expr2 expressed as a value in the same format\nas expr1. expr1 is a time or datetime expression, and expr2 is a time\nexpression.\n','mysql> SELECT SUBTIME(\'1997-12-31 23:59:59.999999\',\'1 1:1:1.000002\');\n        -> \'1997-12-30 22:58:58.999997\'\nmysql> SELECT SUBTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'-00:59:59.999999\'\n','date-and-time-functions'),
 (248,'UNCOMPRESSED_LENGTH',10,'Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n','mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'a\',30)));\n        -> 30\n','encryption-functions'),
 (249,'DROP TABLE',36,'Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table. All table data and the table definition are removed, so\nbe careful with this statement! If any of the tables named in the\nargument list do not exist, MySQL returns an error indicating by name\nwhich non-existing tables it was unable to drop, but it also drops all\nof the tables in the list that do exist.\n\nImportant: When a table is dropped, user privileges on the table are\nnot automatically dropped. See [HELP GRANT].\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. A NOTE is generated for each non-existent table when using IF\nEXISTS. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE are allowed to make porting easier. In MySQL 5.0,\nthey do nothing.\n\nNote: DROP TABLE automatically commits the current active transaction,\nunless you use the TEMPORARY keyword.\n','','drop-table'),
 (250,'SHOW CREATE TABLE',25,'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the given table. As of\nMySQL 5.0.1, this statement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the SQL_QUOTE_SHOW_CREATE option. See [HELP SET].\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE t (\n  id INT(11) default NULL auto_increment,\n  s char(60) default NULL,\n  PRIMARY KEY (id)\n) ENGINE=MyISAM\n','show-create-table'),
 (251,'DUAL',25,'You are allowed to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nmysql> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for the convenience of people who require that all\nSELECT statements should have FROM and possibly other clauses. MySQL\nmay ignore the clauses. MySQL does not require FROM DUAL if no tables\nare referenced.\n','','select'),
 (252,'INSTR',33,'Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n','mysql> SELECT INSTR(\'foobarbar\', \'bar\');\n        -> 4\nmysql> SELECT INSTR(\'xbar\', \'foobar\');\n        -> 0\n','string-functions'),
 (253,'NOW',28,'Syntax:\nNOW()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n','mysql> SELECT NOW();\n        -> \'1997-12-15 23:50:26\'\nmysql> SELECT NOW() + 0;\n        -> 19971215235026\n','date-and-time-functions'),
 (254,'SHOW ENGINES',25,'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is. SHOW TABLE\nTYPES is a deprecated synonym.\n','','show-engines'),
 (255,'SHOW MUTEX STATUS',25,'Syntax:\nSHOW MUTEX STATUS\n\nSHOW MUTEX STATUS displays InnoDB mutex statistics. The output fields\nare:\n\no Mutex\n\n  The mutex name. The name indicates the mutex purpose. For example,\n  the log_sys mutex is used by the InnoDB logging subsystem and\n  indicates how intensive logging activity is. The buf_pool mutex\n  protects the InnoDB buffer pool.\n\no Module\n\n  The source file where the mutex is implemented.\n\no Count indicates how many times the mutex was requested.\n\no Spin_waits indicates how many times the spinlock had to run.\n\no Spin_rounds indicates the number of spinlock rounds. (spin_rounds\n  divided by spin_waits provides the average round count.)\n\no OS_waits indicates the number of operating system waits. This occurs\n  when the spinlock did not work (the mutex was not locked during the\n  spinlock and it was necessary to yield to the operating system and\n  wait).\n\no OS_yields indicates the number of times that a thread trying to lock\n  a mutex gave up its timeslice and yielded to the operating system (on\n  the presumption that allowing other threads to run will free the\n  mutex so that it can be locked).\n\no OS_waits_time os_wait_times indicates the amount of time (in ms)\n  spent in operating system waits, if the timed_mutexes system variable\n  is 1 (ON). If timed_mutexes is 0 (OFF), timing is disabled, so\n  OS_waits_time is 0. timed_mutexes is off by default.\n\nInformation from this statement can be used to diagnose system\nproblems. For example, large values of spin_waits and spin_rounds may\nindicate scalability problems.\n\nSHOW MUTEX STATUS was added in MySQL 5.0.3. In MySQL 5.1, SHOW MUTEX\nSTATUS is renamed to SHOW ENGINE INNODB MUTEX. The latter statement\ndisplays similar information but in a somewhat different output format.\n','','show-mutex-status'),
 (256,'>=',17,'Syntax:\n>=\n\nGreater than or equal:\n','mysql> SELECT 2 >= 2;\n        -> 1\n','comparison-operators'),
 (257,'EXP',4,'Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X.\n','mysql> SELECT EXP(2);\n        -> 7.3890560989307\nmysql> SELECT EXP(-2);\n        -> 0.13533528323661\nmysql> SELECT EXP(0);\n        -> 1\n','mathematical-functions'),
 (258,'SHA',10,'Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a binary\nstring of 40 hex digits, or NULL if the argument was NULL. One of the\npossible uses for this function is as a hash key. You can also use it\nas a cryptographic function for storing passwords. SHA() is synonymous\nwith SHA1().\n','mysql> SELECT SHA1(\'abc\');\n        -> \'a9993e364706816aba3e25717850c26c9cd0d89d\'\n','encryption-functions'),
 (259,'LONGBLOB',20,'LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\nbytes. The maximum effective (permitted) length of LONGBLOB columns\ndepends on the configured maximum packet size in the client/server\nprotocol and available memory.\n','','string-type-overview'),
 (260,'POINTN',11,'PointN(ls,N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n','linestring-property-functions'),
 (261,'YEAR DATA TYPE',20,'YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. In four-digit format, the allowable values are 1901 to 2155,\nand 0000. In two-digit format, the allowable values are 70 to 69,\nrepresenting years from 1970 to 2069. MySQL displays YEAR values in\nYYYY format, but allows you to assign values to YEAR columns using\neither strings or numbers.\n','','date-and-time-type-overview'),
 (262,'SUM',14,'Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used in MySQL 5.0 to sum only the\ndistinct values of expr.\n\nSUM() returns NULL if there were no matching rows.\n','','group-by-functions'),
 (263,'OCT',33,'Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n','mysql> SELECT OCT(12);\n        -> \'14\'\n','string-functions'),
 (264,'SYSDATE',28,'Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n\nAs of MySQL 5.0.13, SYSDATE() returns the time at which it executes.\nThis differs from the behavior for NOW(), which returns a constant time\nthat indicates the time at which the statement began to execute.\n(Within a stored routine or trigger, NOW() returns the time at which\nthe routine or triggering statement began to execute.)\n\nmysql> SELECT NOW(), SLEEP(2), NOW();\n+---------------------+----------+---------------------+\n| NOW()               | SLEEP(2) | NOW()               |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |\n+---------------------+----------+---------------------+\n\nmysql> SELECT SYSDATE(), SLEEP(2), SYSDATE();\n+---------------------+----------+---------------------+\n| SYSDATE()           | SLEEP(2) | SYSDATE()           |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |\n+---------------------+----------+---------------------+\n\nIn addition, the SET TIMESTAMP statement affects the value returned by\nNOW() but not by SYSDATE(). This means that timestamp settings in the\nbinary log have no effect on invocations of SYSDATE().\n\nBecause SYSDATE() can return different values even within the same\nstatement, and is not affected by SET TIMESTAMP, it is\nnon-deterministic and therefore unsafe for replication. If that is a\nproblem, you can start the server with the --sysdate-is-now option to\ncause SYSDATE() to be an alias for NOW().\n','','date-and-time-functions'),
 (265,'ASBINARY',29,'AsBinary(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n','SELECT AsBinary(g) FROM geom;\n','functions-to-convert-geometries-between-formats'),
 (266,'REPEAT FUNCTION',33,'Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n','mysql> SELECT REPEAT(\'MySQL\', 3);\n        -> \'MySQLMySQLMySQL\'\n','string-functions'),
 (267,'SHOW TABLES',25,'Syntax:\nSHOW [FULL] TABLES [FROM db_name] [LIKE \'pattern\']\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command.\n\nBefore MySQL 5.0.1, the output from SHOW TABLES contains a single\ncolumn of table names. Beginning with MySQL 5.0.1, this statement also\nlists any views in the database. As of MySQL 5.0.2, the FULL modifier\nis supported such that SHOW FULL TABLES displays a second output\ncolumn. Values for the second column are BASE TABLE for a table and\nVIEW for a view.\n\nNote: If you have no privileges for a table, the table does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n','','show-tables'),
 (268,'MAKEDATE',28,'Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n','mysql> SELECT MAKEDATE(2001,31), MAKEDATE(2001,32);\n        -> \'2001-01-31\', \'2001-02-01\'\nmysql> SELECT MAKEDATE(2001,365), MAKEDATE(2004,365);\n        -> \'2001-12-31\', \'2004-12-30\'\nmysql> SELECT MAKEDATE(2001,0);\n        -> NULL\n','date-and-time-functions'),
 (269,'BINARY OPERATOR',33,'Syntax:\nBINARY\n\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by\nbyte rather than character by character. This causes the comparison to\nbe case sensitive even if the column isn\'t defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n','mysql> SELECT \'a\' = \'A\';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'A\';\n        -> 0\nmysql> SELECT \'a\' = \'a \';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'a \';\n        -> 0\n','cast-functions'),
 (270,'MBROVERLAPS',5,'MBROverlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap.\n','','relations-on-geometry-mbr'),
 (271,'SOUNDEX',33,'Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All non-alphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n\nImportant: When using SOUNDEX(), you should be aware of the following\nlimitations:\n\no This function, as currently implemented, is intended to work well\n  with strings that are in the English language only. Strings in other\n  languages may not produce reliable results.\n\no This function is not guaranteed to provide consistent results with\n  strings that use multi-byte character sets, including utf-8.\n\n  We hope to remove these limitations in a future release. See\n  Bug#22638 (http://bugs.mysql.com/22638) for more information.\n','mysql> SELECT SOUNDEX(\'Hello\');\n        -> \'H400\'\nmysql> SELECT SOUNDEX(\'Quadratically\');\n        -> \'Q36324\'\n','string-functions'),
 (272,'MBRTOUCHES',5,'MBRTouches(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch.\n','','relations-on-geometry-mbr'),
 (273,'CREATE PROCEDURE',35,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n    \nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n    \nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n  | COMMENT \'string\'\n\nroutine_body:\n    Valid SQL procedure statement\n\nThese statements create stored routines. As of MySQL 5.0.3, to use\nthem, it is necessary to have the CREATE ROUTINE privilege. If binary\nlogging is enabled, these statements might may also require the SUPER\nprivilege, as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-procedure-logging.html.\nMySQL automatically grants the ALTER ROUTINE and EXECUTE privileges to\nthe routine creator.\n\nBy default, the routine is associated with the default database. To\nassociate the routine explicitly with a given database, specify the\nname as db_name.sp_name when you create it.\n\nIf the routine name is the same as the name of a built-in SQL function,\nyou must use a space between the name and the following parenthesis\nwhen defining the routine, or a syntax error occurs. This is also true\nwhen you invoke the routine later. For this reason, we suggest that it\nis better to avoid re-using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. it is always allowable to have spaces after a routine name,\nregardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused.\n\nEach parameter can be declared to use any valid data type, except that\nthe COLLATE attribute cannot be used.\n\nEach parameter is an IN parameter by default. To specify otherwise for\na parameter, use the keyword OUT or INOUT before the parameter name.\n\nNote: Specifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. (FUNCTION parameters are always regarded as IN parameters.)\n\nAn IN parameter passes a value into a procedure. The procedure might\nmodify the value, but the modification is not visible to the caller\nwhen the procedure returns. An OUT parameter passes a value from the\nprocedure back to the caller. Its initial value is NULL within the\nprocedure, and its value is visible to the caller when the procedure\nreturns. An INOUT parameter is initialized by the caller, can be\nmodified by the procedure, and any change made by the procedure is\nvisible to the caller when the procedure returns.\n\nFor each OUT or INOUT parameter, pass a user-defined variable so that\nyou can obtain its value when the procedure returns. (For an example,\nsee [HELP CALL].) If you are calling the procedure from within another\nstored procedure or function, you can also pass a routine parameter or\nlocal routine variable as an IN or INOUT parameter.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement. If the RETURN\nstatement returns a value of a different type, the value is coerced to\nthe proper type. For example, if a function specifies an ENUM or SET\nvalue in the RETURNS clause, but the RETURN statement returns an\ninteger, the value returned from the function is the string for the\ncorresponding ENUM member of set of SET members.\n\nThe routine_body consists of a valid SQL procedure statement. This can\nbe a simple statement such as SELECT or INSERT, or it can be a compound\nstatement written using BEGIN and END. Compound statement syntax is\ndescribed in [HELP BEGIN END]. Compound statements can contain\ndeclarations, loops, and other control structure statements. The syntax\nfor these statements is described later in this chapter. See, for\nexample, http://dev.mysql.com/doc/refman/5.0/en/declare.html, and [HELP\nIF statement]. Some statements are not allowed in stored routines; see\nhttp://dev.mysql.com/doc/refman/5.0/en/routine-restrictions.html.\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter ;\n\nmysql> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n','create-procedure'),
 (274,'INSERT SELECT',25,'Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom one or many tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n','','insert-select'),
 (275,'VARBINARY',20,'VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than non-binary character strings.\n','','string-type-overview'),
 (276,'LOAD INDEX',25,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise. LOAD INDEX INTO\nCACHE is used only for MyISAM tables.\n\nThe IGNORE LEAVES modifier causes only blocks for the non-leaf nodes of\nthe index to be preloaded.\n','','load-index'),
 (277,'UNION',25,'Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n','','union'),
 (278,'TO_DAYS',28,'Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n','mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(\'1997-10-07\');\n        -> 729669\n','date-and-time-functions'),
 (279,'NOT REGEXP',33,'Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n','','string-comparison-functions'),
 (280,'SHOW INDEX',25,'Syntax:\nSHOW INDEX FROM tbl_name [FROM db_name]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC.\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nSHOW KEYS is a synonym for SHOW INDEX. You can also list a table\'s\nindexes with the mysqlshow -k db_name tbl_name command.\n','','show-index'),
 (281,'SHOW CREATE DATABASE',25,'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} db_name\n\nShows the CREATE DATABASE statement that creates the given database.\nSHOW CREATE SCHEMA is a synonym for SHOW CREATE DATABASE as of MySQL\n5.0.2.\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n','show-create-database'),
 (282,'LEAVE',35,'Syntax:\nLEAVE label\n\nThis statement is used to exit any labeled flow control construct. It\ncan be used within BEGIN ... END or loop constructs (LOOP, REPEAT,\nWHILE).\n','','leave-statement'),
 (283,'NOT IN',17,'Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n','','comparison-operators'),
 (284,'!',12,'Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnon-zero, and NOT NULL returns NULL.\n','mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1\n','logical-operators'),
 (285,'DECLARE HANDLER',35,'Syntax:\nDECLARE handler_type HANDLER FOR condition_value[,...] statement\n\nhandler_type:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n  | mysql_error_code\n\nThe DECLARE ... HANDLER statement specifies handlers that each may deal\nwith one or more conditions. If one of these conditions occurs, the\nspecified statement is executed. statement can be a simple statement\n(for example, SET var_name = value), or it can be a compound statement\nwritten using BEGIN and END (see [HELP BEGIN END]).\n\nFor a CONTINUE handler, execution of the current routine continues\nafter execution of the handler statement. For an EXIT handler,\nexecution terminates for the BEGIN ... END compound statement in which\nthe handler is declared. (This is true even if the condition occurs in\nan inner block.) The UNDO handler type statement is not yet supported.\n\nIf a condition occurs for which no handler has been declared, the\ndefault action is EXIT.\n\nA condition_value can be any of the following values:\n\no An SQLSTATE value or a MySQL error code.\n\no A condition name previously specified with DECLARE ... CONDITION. See\n  [HELP DECLARE CONDITION].\n\no SQLWARNING is shorthand for all SQLSTATE codes that begin with 01.\n\no NOT FOUND is shorthand for all SQLSTATE codes that begin with 02.\n\no SQLEXCEPTION is shorthand for all SQLSTATE codes not caught by\n  SQLWARNING or NOT FOUND.\n','mysql> CREATE TABLE test.t (s1 int,primary key (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE \'23000\' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL handlerdemo()//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n','declare-handlers'),
 (286,'DOUBLE',20,'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Allowable\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits allowed by the hardware. A double-precision floating-point\nnumber is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n','','numeric-type-overview'),
 (287,'TIME',20,'TIME\n\nA time. The range is \'-838:59:59\' to \'838:59:59\'. MySQL displays TIME\nvalues in \'HH:MM:SS\' format, but allows you to assign values to TIME\ncolumns using either strings or numbers.\n','','date-and-time-type-overview'),
 (288,'&&',12,'Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are non-zero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n','mysql> SELECT 1 && 1;\n        -> 1\nmysql> SELECT 1 && 0;\n        -> 0\nmysql> SELECT 1 && NULL;\n        -> NULL\nmysql> SELECT 0 && NULL;\n        -> 0\nmysql> SELECT NULL && 0;\n        -> 0\n','logical-operators'),
 (289,'X',9,'X(p)\n\nReturns the X-coordinate value for the point p as a double-precision\nnumber.\n','mysql> SET @pt = \'Point(56.7 53.34)\';\nmysql> SELECT X(GeomFromText(@pt));\n+----------------------+\n| X(GeomFromText(@pt)) |\n+----------------------+\n|                 56.7 |\n+----------------------+\n','point-property-functions'),
 (290,'FOUND_ROWS',15,'Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n','mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();\n','information-functions'),
 (291,'SYSTEM_USER',15,'Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n','','information-functions'),
 (292,'CROSSES',26,'Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n','','functions-that-test-spatial-relationships-between-geometries'),
 (293,'TRUNCATE TABLE',25,'Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. Logically, this is\nequivalent to a DELETE statement that deletes all rows, but there are\npractical differences under some circumstances.\n\nFor InnoDB before version 5.0.3, TRUNCATE TABLE is mapped to DELETE, so\nthere is no difference. Starting with MySQL 5.0.3, fast TRUNCATE TABLE\nis available. However, the operation is still mapped to DELETE if there\nare foreign key constraints that reference the table. (When fast\ntruncate is used, it resets any AUTO_INCREMENT counter. From MySQL\n5.0.13 on, the AUTO_INCREMENT counter is reset by TRUNCATE TABLE,\nregardless of whether there is a foreign key constraint.)\n\nFor other storage engines, TRUNCATE TABLE differs from DELETE in the\nfollowing ways in MySQL 5.0:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one.\n\no Truncate operations are not transaction-safe; an error occurs when\n  attempting one in the course of an active transaction or active table\n  lock.\n\no The number of deleted rows is not returned.\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no The table handler does not remember the last used AUTO_INCREMENT\n  value, but starts counting from the beginning. This is true even for\n  MyISAM and InnoDB, which normally do not reuse sequence values.\n\nSince truncation of a table does not make any use of DELETE, the\nTRUNCATE statement does not invoke ON DELETE triggers.\n\nTRUNCATE TABLE is an Oracle SQL extension adopted in MySQL.\n','','truncate'),
 (294,'BIT_XOR',14,'Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n','','group-by-functions'),
 (295,'CURRENT_DATE',28,'Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n','','date-and-time-functions'),
 (296,'AREA',2,'Area(poly)\n\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n','mysql> SET @poly = \'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n','polygon-property-functions'),
 (297,'START SLAVE',25,'Syntax:\nSTART SLAVE [thread_type [, thread_type] ... ]\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = \'log_name\', MASTER_LOG_POS = log_pos\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = \'log_name\', RELAY_LOG_POS = log_pos\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no thread_type options starts both of the slave\nthreads. The I/O thread reads queries from the master server and stores\nthem in the relay log. The SQL thread reads the relay log and executes\nthe queries. START SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary logs, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave\'s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n','','start-slave'),
 (298,'BEGIN END',35,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored routines and triggers. A compound statement can\ncontain multiple statements, enclosed by the BEGIN and END keywords.\nstatement_list represents a list of one or more statements. Each\nstatement within statement_list must be terminated by a semicolon (;)\nstatement delimiter. Note that statement_list is optional, which means\nthat the empty compound statement (BEGIN END) is legal.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. This is handled\nin the mysql command-line client with the delimiter command. Changing\nthe ; end-of-statement delimiter (for example, to //) allows ; to be\nused in a routine body. For an example, see [HELP CREATE PROCEDURE].\n\nA compound statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n','','begin-end'),
 (299,'FLUSH',25,'Syntax:\nFLUSH [LOCAL | NO_WRITE_TO_BINLOG] flush_option [, flush_option] ...\n\nThe FLUSH statement clears or reloads various internal caches used by\nMySQL. To execute FLUSH, you must have the RELOAD privilege.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET].\n','','flush'),
 (300,'SHOW PROCEDURE STATUS',25,'Syntax:\nSHOW {PROCEDURE | FUNCTION} STATUS [LIKE \'pattern\']\n\nThis statement is a MySQL extension. It returns characteristics of\nroutines, such as the database, name, type, creator, and creation and\nmodification dates. If no pattern is specified, the information for all\nstored procedures or all stored functions is listed, depending on which\nstatement you use.\n','mysql> SHOW FUNCTION STATUS LIKE \'hello\'\\G\n*************************** 1. row ***************************\n           Db: test\n         Name: hello\n         Type: FUNCTION\n      Definer: testuser@localhost\n     Modified: 2004-08-03 15:29:37\n      Created: 2004-08-03 15:29:37\nSecurity_type: DEFINER\n      Comment:\n','show-procedure-status'),
 (301,'SHOW WARNINGS',25,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS shows the error, warning, and note messages that resulted\nfrom the last statement that generated messages, or nothing if the last\nstatement that used a table generated no messages. A related statement,\nSHOW ERRORS, shows only the errors. See [HELP SHOW ERRORS].\n\nThe list of messages is reset for each new statement that uses a table.\n\nThe SHOW COUNT(*) WARNINGS statement displays the total number of\nerrors, warnings, and notes. You can also retrieve this number from the\nwarning_count variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nThe value of warning_count might be greater than the number of messages\ndisplayed by SHOW WARNINGS if the max_error_count system variable is\nset so low that not all messages are stored. An example shown later in\nthis section demonstrates how this can happen.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\n[HELP SELECT].\n','','show-warnings'),
 (302,'DESCRIBE',24,'Syntax:\n{DESCRIBE | DESC} tbl_name [col_name | wild]\n\nDESCRIBE provides information about the columns in a table. It is a\nshortcut for SHOW COLUMNS FROM. As of MySQL 5.0.1, these statements\nalso display information for views. (See [HELP SHOW COLUMNS].)\n','','describe'),
 (303,'DROP USER',8,'Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the DELETE privilege\nfor the mysql database. Each account is named using the same format as\nfor the GRANT statement; for example, \'jeffrey\'@\'localhost\'. If you\nspecify only the username part of the account name, a hostname part of\n\'%\' is used. For additional information about specifying account names,\nsee [HELP GRANT].\n\nDROP USER as present in MySQL 5.0.0 removes only accounts that have no\nprivileges. In MySQL 5.0.2, it was modified to remove account\nprivileges as well. This means that the procedure for removing an\naccount depends on your version of MySQL.\n\nAs of MySQL 5.0.2, you can remove an account and its privileges as\nfollows:\n\nDROP USER user;\n\nThe statement removes privilege rows for the account from all grant\ntables.\n','','drop-user'),
 (304,'STDDEV_POP',14,'Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). This function was added in MySQL 5.0.3. Before 5.0.3, you\ncan use STD() or STDDEV(), which are equivalent but not standard SQL.\n\nSTDDEV_POP() returns NULL if there were no matching rows.\n','','group-by-functions'),
 (305,'SHOW CHARACTER SET',25,'Syntax:\nSHOW CHARACTER SET [LIKE \'pattern\']\n\nThe SHOW CHARACTER SET statement shows all available character sets. It\ntakes an optional LIKE clause that indicates which character set names\nto match. For example:\n\nmysql> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n','','show-character-set'),
 (306,'SUBSTRING',33,'Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n','mysql> SELECT SUBSTRING(\'Quadratically\',5);\n        -> \'ratically\'\nmysql> SELECT SUBSTRING(\'foobarbar\' FROM 4);\n        -> \'barbar\'\nmysql> SELECT SUBSTRING(\'Quadratically\',5,6);\n        -> \'ratica\'        \nmysql> SELECT SUBSTRING(\'Sakila\', -3);\n        -> \'ila\'        \nmysql> SELECT SUBSTRING(\'Sakila\', -5, 3);\n        -> \'aki\'\nmysql> SELECT SUBSTRING(\'Sakila\' FROM -4 FOR 2);\n        -> \'ki\'\n','string-functions'),
 (307,'ISEMPTY',32,'IsEmpty(g)\n\nReturns 1 if the geometry value g is the empty geometry, 0 if it is not\nempty, and -1 if the argument is NULL. If the geometry is empty, it\nrepresents the empty point set.\n','','general-geometry-property-functions'),
 (308,'LTRIM',33,'Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n','mysql> SELECT LTRIM(\'  barbar\');\n        -> \'barbar\'\n','string-functions'),
 (309,'INTERSECTS',26,'Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n','','functions-that-test-spatial-relationships-between-geometries'),
 (310,'CALL',35,'Syntax:\nCALL sp_name([parameter[,...]])\nCALL sp_name[()]\n\nThe CALL statement invokes a procedure that was defined previously with\nCREATE PROCEDURE.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. It also \"returns\" the number of\nrows affected, which a client program can obtain at the SQL level by\ncalling the ROW_COUNT() function and from C by calling the\nmysql_affected_rows() C API function.\n\nAs of MySQL 5.1.13, stored procedures that take no arguments now can be\ninvoked without parentheses. That is, CALL p() and CALL p are\nequivalent.\n','','call'),
 (311,'MBRDISJOINT',5,'MBRDisjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n','','relations-on-geometry-mbr'),
 (312,'VALUES',13,'Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in INSERT ... ON DUPLICATE KEY UPDATE\nstatements and returns NULL otherwise.\nhttp://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html.\n','mysql> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n','miscellaneous-functions'),
 (313,'SUBSTRING_INDEX',33,'Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n','mysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', 2);\n        -> \'www.mysql\'\nmysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', -2);\n        -> \'mysql.com\'\n','string-functions'),
 (314,'ENCODE',10,'Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. To decrypt the result, use\nDECODE().\n\nThe result is a binary string of the same length as str.\n\nThe strength of the encryption is based on how good the random\ngenerator is. It should suffice for short strings.\n','','encryption-functions'),
 (315,'LOOP',35,'Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements. The\nstatements within the loop are repeated until the loop is exited;\nusually this is accomplished with a LEAVE statement.\n\nA LOOP statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n','','loop-statement'),
 (316,'TRUNCATE',4,'Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n','mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100\nmysql> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n','mathematical-functions'),
 (317,'TIMESTAMPADD',28,'Syntax:\nTIMESTAMPADD(unit,interval,datetime_expr)\n\nAdds the integer expression interval to the date or datetime expression\ndatetime_expr. The unit for interval is given by the unit argument,\nwhich should be one of the following values: FRAC_SECOND, SECOND,\nMINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or YEAR.\n\nThe unit value may be specified using one of keywords as shown, or with\na prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.\n','mysql> SELECT TIMESTAMPADD(MINUTE,1,\'2003-01-02\');\n        -> \'2003-01-02 00:01:00\'\nmysql> SELECT TIMESTAMPADD(WEEK,1,\'2003-01-02\');\n        -> \'2003-01-09\'\n','date-and-time-functions'),
 (318,'SHOW',25,'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [LIKE \'pattern\']\nSHOW CREATE DATABASE db_name\nSHOW CREATE FUNCTION funcname\nSHOW CREATE PROCEDURE procname\nSHOW CREATE TABLE tbl_name\nSHOW DATABASES [LIKE \'pattern\']\nSHOW ENGINE engine_name {LOGS | STATUS }\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW FUNCTION STATUS [LIKE \'pattern\']\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW INNODB STATUS\nSHOW PROCEDURE STATUS [LIKE \'pattern\']\nSHOW [BDB] LOGS\nSHOW MUTEX STATUS\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW [GLOBAL | SESSION] STATUS [LIKE \'pattern\']\nSHOW TABLE STATUS [FROM db_name] [LIKE \'pattern\']\nSHOW [OPEN] TABLES [FROM db_name] [LIKE \'pattern\']\nSHOW TRIGGERS\nSHOW [GLOBAL | SESSION] VARIABLES [LIKE \'pattern\']\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nThe SHOW statement also has forms that provide information about\nreplication master and slave servers and are described in [HELP PURGE\nMASTER LOGS]:\n\nSHOW BINARY LOGS\nSHOW BINLOG EVENTS\nSHOW MASTER STATUS\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL `%\' and `_\'\nwildcard characters. The pattern is useful for restricting statement\noutput to matching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n','','show'),
 (319,'GREATEST',17,'Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n','mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(\'B\',\'A\',\'C\');\n        -> \'C\'\n','comparison-operators'),
 (320,'OCTETLENGTH',33,'Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n','','string-functions'),
 (321,'SHOW VARIABLES',25,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES [LIKE \'pattern\']\n\nSHOW VARIABLES shows the values of MySQL system variables. This\ninformation also can be obtained using the mysqladmin variables\ncommand.\n\nWith the GLOBAL modifier, SHOW VARIABLES displays the values that are\nused for new connections to MySQL. With SESSION, it displays the values\nthat are in effect for the current connection. If no modifier is\npresent, the default is SESSION. LOCAL is a synonym for SESSION.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the `%\'\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because `_\' is a wildcard that matches\nany single character, you should escape it as `\\_\' to match it\nliterally. In practice, this is rarely necessary.\n','','show-variables'),
 (322,'BIT_AND',14,'Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n','','group-by-functions'),
 (323,'SECOND',28,'Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n','mysql> SELECT SECOND(\'10:05:03\');\n        -> 3\n','date-and-time-functions'),
 (324,'ATAN2',4,'Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n','mysql> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n','mathematical-functions'),
 (325,'MBRCONTAINS',5,'MBRContains(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\ncontains the Minimum Bounding Rectangle of g2.\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Point(1 1)\');\nmysql> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+\n','relations-on-geometry-mbr'),
 (326,'HOUR',28,'Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n','mysql> SELECT HOUR(\'10:05:03\');\n        -> 10\nmysql> SELECT HOUR(\'272:59:59\');\n        -> 272\n','date-and-time-functions'),
 (327,'SELECT',25,'Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr, ...\n    [FROM table_references\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE \'file_name\' export_options\n      | INTO DUMPFILE \'file_name\'\n      | INTO @var_name [, @var_name]]\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [HELP UNION], and\nhttp://dev.mysql.com/doc/refman/5.0/en/subqueries.html.\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [HELP JOIN].\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE clause, you can use any of the functions and operators\n  that MySQL supports, except for aggregate (summary) functions. See\n  [HELP =].\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n','','select'),
 (328,'COT',4,'Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n','mysql> SELECT COT(12);\n        -> -1.5726734063977\nmysql> SELECT COT(0);\n        -> NULL\n','mathematical-functions'),
 (329,'BACKUP TABLE',19,'Syntax:\nBACKUP TABLE tbl_name [, tbl_name] ... TO \'/path/to/backup/directory\'\n\nNote: This statement is deprecated. We are working on a better\nreplacement for it that will provide online backup capabilities. In the\nmeantime, the mysqlhotcopy script can be used instead.\n\nBACKUP TABLE copies to the backup directory the minimum number of table\nfiles needed to restore the table, after flushing any buffered changes\nto disk. The statement works only for MyISAM tables. It copies the .frm\ndefinition and .MYD data files. The .MYI index file can be rebuilt from\nthose two files. The directory should be specified as a full pathname.\nTo restore the table, use RESTORE TABLE.\n','','backup-table'),
 (330,'LOAD_FILE',33,'Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full pathname to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nAs of MySQL 5.0.19, the character_set_filesystem system variable\ncontrols interpretation of filenames that are given as literal strings.\n','mysql> UPDATE t\n            SET blob_col=LOAD_FILE(\'/tmp/picture\')\n            WHERE id=1;\n','string-functions'),
 (331,'POINTFROMTEXT',3,'PointFromText(wkt[,srid])\n\nConstructs a POINT value using its WKT representation and SRID.\n','','gis-wkt-functions'),
 (332,'LOAD TABLE FROM MASTER',25,'Syntax:\nLOAD TABLE tbl_name FROM MASTER\n\nThis feature is deprecated. We recommend not using it anymore. It is\nsubject to removal in a future version of MySQL.\n\nSince the current implementation of LOAD DATA FROM MASTER and LOAD\nTABLE FROM MASTER is very limited, these statements are deprecated in\nversions 4.1 of MySQL and above. We will introduce a more advanced\ntechnique (called \"online backup\") in a future version. That technique\nwill have the additional advantage of working with more storage\nengines.\n\nFor MySQL 5.1 and earlier, the recommended alternative solution to\nusing LOAD DATA FROM MASTER or LOAD TABLE FROM MASTER is using\nmysqldump or mysqlhotcopy. The latter requires Perl and two Perl\nmodules (DBI and DBD:mysql) and works for MyISAM and ARCHIVE tables\nonly. With mysqldump, you can create SQL dumps on the master and pipe\n(or copy) these to a mysql client on the slave. This has the advantage\nof working for all storage engines, but can be quite slow, since it\nworks using SELECT.\n\nTransfers a copy of the table from the master to the slave. This\nstatement is implemented mainly debugging LOAD DATA FROM MASTER\noperations. To use LOAD TABLE, the account used for connecting to the\nmaster server must have the RELOAD and SUPER privileges on the master\nand the SELECT privilege for the master table to load. On the slave\nside, the user that issues LOAD TABLE FROM MASTER must have privileges\nfor dropping and creating the table.\n\nThe conditions for LOAD DATA FROM MASTER apply here as well. For\nexample, LOAD TABLE FROM MASTER works only for MyISAM tables. The\ntimeout notes for LOAD DATA FROM MASTER apply as well.\n','','load-table-from-master'),
 (333,'GROUP_CONCAT',14,'Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n','mysql> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;\n','group-by-functions');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (334,'DATE_FORMAT',28,'Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n','mysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\', \'%W %M %Y\');\n        -> \'Saturday October 1997\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\', \'%H:%i:%s\');\n        -> \'22:23:00\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n                          \'%D %y %a %d %m %b %j\');\n        -> \'4th 97 Sat 04 10 Oct 277\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n                          \'%H %k %I %r %T %S %w\');\n        -> \'22 22 10 10:23:00 PM 22:23:00 00 6\'\nmysql> SELECT DATE_FORMAT(\'1999-01-01\', \'%X %V\');\n        -> \'1998 52\'\nmysql> SELECT DATE_FORMAT(\'2006-06-00\', \'%d\');\n        -> \'00\'\n','date-and-time-functions'),
 (335,'BENCHMARK',15,'Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n','mysql> SELECT BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\'));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)\n','information-functions'),
 (336,'YEAR',28,'Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n\"zero\" date.\n','mysql> SELECT YEAR(\'98-02-03\');\n        -> 1998\n','date-and-time-functions'),
 (337,'SHOW ENGINE',25,'Syntax:\nSHOW ENGINE engine_name {LOGS | STATUS }\n\nSHOW ENGINE displays log or status information about a storage engine.\nThe following statements currently are supported:\n\nSHOW ENGINE BDB LOGS\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE NDB STATUS\n','','show-engine'),
 (338,'NAME_CONST',13,'Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name.\n\nmysql> SELECT NAME_CONST(\'myname\', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n','','miscellaneous-functions'),
 (339,'RELEASE_LOCK',13,'Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [HELP\nDO].\n','','miscellaneous-functions'),
 (340,'IS NULL',17,'Syntax:\nIS NULL, IS NOT NULL\n\nTests whether a value is or is not NULL.\n','mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\nmysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n','comparison-operators'),
 (341,'CONVERT_TZ',28,'Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/time-zone-support.html. This\nfunction returns NULL if the arguments are invalid.\n','mysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'GMT\',\'MET\');\n        -> \'2004-01-01 13:00:00\'\nmysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'+00:00\',\'+10:00\');\n        -> \'2004-01-01 22:00:00\'\n','date-and-time-functions'),
 (342,'TIME_TO_SEC',28,'Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n','mysql> SELECT TIME_TO_SEC(\'22:23:00\');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(\'00:39:38\');\n        -> 2378\n','date-and-time-functions'),
 (343,'WEEKDAY',28,'Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n','mysql> SELECT WEEKDAY(\'1998-02-03 22:23:00\');\n        -> 1\nmysql> SELECT WEEKDAY(\'1997-11-05\');\n        -> 2\n','date-and-time-functions'),
 (344,'EXPORT_SET',33,'Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every reset bit, you get an off string. Bits in\nbits are examined from right to left (from low-order to high-order\nbits). Strings are added to the result from left to right, separated by\nthe separator string (the default being the comma character `,\'). The\nnumber of bits examined is given by number_of_bits (defaults to 64).\n','mysql> SELECT EXPORT_SET(5,\'Y\',\'N\',\',\',4);\n        -> \'Y,N,Y,N\'\nmysql> SELECT EXPORT_SET(6,\'1\',\'0\',\',\',10);\n        -> \'0,1,1,0,0,0,0,0,0,0\'\n','string-functions'),
 (345,'TIME FUNCTION',28,'Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n','mysql> SELECT TIME(\'2003-12-31 01:02:03\');\n        -> \'01:02:03\'\nmysql> SELECT TIME(\'2003-12-31 01:02:03.000123\');\n        -> \'01:02:03.000123\'\n','date-and-time-functions'),
 (346,'DATE_ADD',28,'Syntax:\nDATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)\n\nThese functions perform date arithmetic. date is a DATETIME or DATE\nvalue specifying the starting date. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a `-\' for negative intervals. unit\nis a keyword indicating the units in which the expression should be\ninterpreted.\n','mysql> SELECT \'1997-12-31 23:59:59\' + INTERVAL 1 SECOND;\n        -> \'1998-01-01 00:00:00\'\nmysql> SELECT INTERVAL 1 DAY + \'1997-12-31\';\n        -> \'1998-01-01\'\nmysql> SELECT \'1998-01-01\' - INTERVAL 1 SECOND;\n        -> \'1997-12-31 23:59:59\'\nmysql> SELECT DATE_ADD(\'1997-12-31 23:59:59\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'1998-01-01 00:00:00\'\nmysql> SELECT DATE_ADD(\'1997-12-31 23:59:59\',\n    ->                 INTERVAL 1 DAY);\n        -> \'1998-01-01 23:59:59\'\nmysql> SELECT DATE_ADD(\'1997-12-31 23:59:59\',\n    ->                 INTERVAL \'1:1\' MINUTE_SECOND);\n        -> \'1998-01-01 00:01:00\'\nmysql> SELECT DATE_SUB(\'1998-01-01 00:00:00\',\n    ->                 INTERVAL \'1 1:1:1\' DAY_SECOND);\n        -> \'1997-12-30 22:58:59\'\nmysql> SELECT DATE_ADD(\'1998-01-01 00:00:00\',\n    ->                 INTERVAL \'-1 10\' DAY_HOUR);\n        -> \'1997-12-30 14:00:00\'\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT DATE_ADD(\'1992-12-31 23:59:59.000002\',\n    ->            INTERVAL \'1.999999\' SECOND_MICROSECOND);\n        -> \'1993-01-01 00:00:01.000001\'\n','date-and-time-functions'),
 (347,'CAST',33,'Syntax:\nCAST(expr AS type), CONVERT(expr,type), CONVERT(expr USING\ntranscoding_name)\n\nThe CAST() and CONVERT() functions take a value of one type and produce\na value of another type.\n\nThe type can be one of the following values:\n\no BINARY[(N)]\n\no CHAR[(N)]\n\no DATE\n\no DATETIME\n\no DECIMAL\n\no SIGNED [INTEGER]\n\no TIME\n\no UNSIGNED [INTEGER]\n\nBINARY produces a string with the BINARY data type. See\nhttp://dev.mysql.com/doc/refman/5.0/en/binary-varbinary.html for a\ndescription of how this affects comparisons. If the optional length N\nis given, BINARY(N) causes the cast to use no more than N bytes of the\nargument. As of MySQL 5.0.17, values shorter than N bytes are padded\nwith 0x00 bytes to a length of N.\n\nCHAR(N) causes the cast to use no more than N characters of the\nargument.\n\nThe DECIMAL type is available as of MySQL 5.0.8.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax. The\nnon-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets. In MySQL, transcoding names are the same as the\ncorresponding character set names. For example, this statement converts\nthe string \'abc\' in the default character set to the corresponding\nstring in the utf8 character set:\n\nSELECT CONVERT(\'abc\' USING utf8);\n','SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);\n','cast-functions'),
 (348,'SOUNDS LIKE',33,'Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n','','string-functions'),
 (349,'PERIOD_DIFF',28,'Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n','mysql> SELECT PERIOD_DIFF(9802,199703);\n        -> 11\n','date-and-time-functions'),
 (350,'LIKE',33,'Syntax:\nexpr LIKE pat [ESCAPE \'escape_char\']\n\nPattern matching using SQL simple regular expression comparison.\nReturns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the\nresult is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n','mysql> SELECT \'David!\' LIKE \'David_\';\n        -> 1\nmysql> SELECT \'David!\' LIKE \'%D%v%\';\n        -> 1\n','string-comparison-functions'),
 (351,'MULTIPOINT',22,'MultiPoint(pt1,pt2,...)\n\nConstructs a WKB MultiPoint value using WKB Point arguments. If any\nargument is not a WKB Point, the return value is NULL.\n','','gis-mysql-specific-functions'),
 (352,'>>',18,'Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n','mysql> SELECT 4 >> 2;\n        -> 1\n','bit-functions'),
 (353,'FETCH',35,'Syntax:\nFETCH cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row (if a row exists) using the\nspecified open cursor, and advances the cursor pointer.\n\nIf no more rows are available, a No Data condition occurs with SQLSTATE\nvalue 02000. To detect this condition, you can set up a handler for it.\nAn example is shown in [HELP DECLARE CURSOR].\n','','fetch'),
 (354,'AVG',14,'Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used as\nof MySQL 5.0.3 to return the average of the distinct values of expr.\n\nAVG() returns NULL if there were no matching rows.\n','mysql> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','group-by-functions'),
 (355,'TRUE FALSE',27,'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nmysql> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n','','boolean-values'),
 (356,'MBRWITHIN',5,'MBRWithin(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\nis within the Minimum Bounding Rectangle of g2.\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Polygon((0 0,0 5,5 5,5 0,0 0))\');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n','relations-on-geometry-mbr'),
 (357,'IN',17,'Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in\nhttp://dev.mysql.com/doc/refman/5.0/en/type-conversion.html, but\napplied to all the arguments.\n','mysql> SELECT 2 IN (0,3,5,7);\n        -> 0\nmysql> SELECT \'wefwf\' IN (\'wee\',\'wefwf\',\'weg\');\n        -> 1\n','comparison-operators'),
 (358,'QUOTE',33,'Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotes and with each instance of single quote (`\'\'),\nbackslash (`\\\'), ASCII NUL, and Control-Z preceded by a backslash. If\nthe argument is NULL, the return value is the word \"NULL\" without\nenclosing single quotes.\n','mysql> SELECT QUOTE(\'Don\\\'t!\');\n        -> \'Don\\\'t!\'\nmysql> SELECT QUOTE(NULL);\n        -> NULL\n','string-functions'),
 (359,'SESSION_USER',15,'Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n','','information-functions'),
 (360,'HELP COMMAND',24,'Syntax:\nmysql> help search_string\n\nIf you provide an argument to the help command, mysql uses it as a\nsearch string to access server-side help from the contents of the MySQL\nReference Manual. The proper operation of this command requires that\nthe help tables in the mysql database be initialized with help topic\ninformation (see\nhttp://dev.mysql.com/doc/refman/5.0/en/server-side-help-support.html).\n\nIf there is no match for the search string, the search fails:\n\nmysql> help me\n\nNothing found\nPlease try to run \'help contents\' for a list of all accessible topics\n\nUse help contents to see a list of the help categories:\n\nmysql> help contents\nYou asked for help about help category: \"Contents\"\nFor more information, type \'help <item>\', where <item> is one of the\nfollowing categories:\n   Account Management\n   Administration\n   Data Definition\n   Data Manipulation\n   Data Types\n   Functions\n   Functions and Modifiers for Use with GROUP BY\n   Geographic Features\n   Language Structure\n   Storage Engines\n   Stored Routines\n   Table Maintenance\n   Transactions\n   Triggers\n\nIf the search string matches multiple items, mysql shows a list of\nmatching topics:\n\nmysql> help logs\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following topics:\n   SHOW\n   SHOW BINARY LOGS\n   SHOW ENGINE\n   SHOW LOGS\n\nUse a topic as the search string to see the help entry for that topic:\n\nmysql> help show binary logs\nName: \'SHOW BINARY LOGS\'\nDescription:\nSyntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-master-logs], that shows how\nto determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n','','mysql-server-side-help'),
 (361,'QUARTER',28,'Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n','mysql> SELECT QUARTER(\'98-04-01\');\n        -> 2\n','date-and-time-functions'),
 (362,'POSITION',33,'Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n','','string-functions'),
 (363,'IS_USED_LOCK',13,'Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client that holds the lock.\nOtherwise, it returns NULL.\n','','miscellaneous-functions'),
 (364,'POLYFROMTEXT',3,'PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])\n\nConstructs a POLYGON value using its WKT representation and SRID.\n','','gis-wkt-functions'),
 (365,'DES_ENCRYPT',10,'Syntax:\nDES_ENCRYPT(str[,{key_num|key_str}])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n','key_num des_key_str\n','encryption-functions'),
 (366,'LENGTH',33,'Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multi-byte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five two-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n','mysql> SELECT LENGTH(\'text\');\n        -> 4\n','string-functions'),
 (367,'STR_TO_DATE',28,'Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts.\n\nThe date, time, or datetime values contained in str should be given in\nthe format indicated by format. For the specifiers that can be used in\nformat, see the DATE_FORMAT() function description. If str contains an\nillegal date, time, or datetime value, STR_TO_DATE() returns NULL.\nStarting from MySQL 5.0.3, an illegal value also produces a warning.\n','','date-and-time-functions'),
 (368,'Y',9,'Y(p)\n\nReturns the Y-coordinate value for the point p as a double-precision\nnumber.\n','mysql> SET @pt = \'Point(56.7 53.34)\';\nmysql> SELECT Y(GeomFromText(@pt));\n+----------------------+\n| Y(GeomFromText(@pt)) |\n+----------------------+\n|                53.34 |\n+----------------------+\n','point-property-functions'),
 (369,'SHOW INNODB STATUS',25,'Syntax:\nSHOW INNODB STATUS\n\nIn MySQL 5.0, this is a deprecated synonym for SHOW ENGINE INNODB\nSTATUS. See [HELP SHOW ENGINE].\n','','show-innodb-status'),
 (370,'CHECKSUM TABLE',19,'Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]\n\nCHECKSUM TABLE reports a table checksum.\n\nWith QUICK, the live table checksum is reported if it is available, or\nNULL otherwise. This is very fast. A live checksum is enabled by\nspecifying the CHECKSUM=1 table option when you create the table;\ncurrently, this is supported only for MyISAM tables. See [HELP CREATE\nTABLE].\n\nWith EXTENDED, the entire table is read row by row and the checksum is\ncalculated. This can be very slow for large tables.\n\nIf neither QUICK nor EXTENDED is specified, MySQL returns a live\nchecksum if the table storage engine supports it and scans the table\notherwise.\n\nFor a non-existent table, CHECKSUM TABLE returns NULL and, as of MySQL\n5.0.3, generates a warning.\n\nThe checksum value depends on the table row format. If the row format\nchanges, the checksum will change. For example, the storage format for\nVARCHAR changed between MySQL 4.1 and 5.0, so if a 4.1 table is\nupgraded to MySQL 5.0, the checksum value may change.\n','','checksum-table'),
 (371,'NUMINTERIORRINGS',2,'NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n','polygon-property-functions'),
 (372,'INTERIORRINGN',2,'InteriorRingN(poly,N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n','polygon-property-functions'),
 (373,'UTC_TIME',28,'Syntax:\nUTC_TIME, UTC_TIME()\n\nReturns the current UTC time as a value in \'HH:MM:SS\' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext.\n','mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'18:07:53\', 180753\n','date-and-time-functions'),
 (374,'DROP FUNCTION',34,'Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function\'s name, type, and\nshared library name.\n','','drop-function'),
 (375,'STDDEV',14,'Syntax:\nSTD(expr) STDDEV(expr)\n\nReturns the population standard deviation of expr. This is an extension\nto standard SQL. The STDDEV() form of this function is provided for\ncompatibility with Oracle. As of MySQL 5.0.3, the standard SQL function\nSTDDEV_POP() can be used instead.\n\nThese functions return NULL if there were no matching rows.\n','','group-by-functions'),
 (376,'DATE_SUB',28,'Syntax:\nDATE_SUB(date,INTERVAL expr unit)\n\nSee DATE_ADD().\n','','date-and-time-functions'),
 (377,'PERIOD_ADD',28,'Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n','mysql> SELECT PERIOD_ADD(9801,2);\n        -> 199803\n','date-and-time-functions'),
 (378,'|',18,'Syntax:\n|\n\nBitwise OR:\n','mysql> SELECT 29 | 15;\n        -> 31\n','bit-functions'),
 (379,'GEOMFROMTEXT',3,'GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n','','gis-wkt-functions'),
 (380,'RIGHT',33,'Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str, or NULL if\nany argument is NULL.\n','mysql> SELECT RIGHT(\'foobarbar\', 4);\n        -> \'rbar\'\n','string-functions'),
 (381,'DATEDIFF',28,'Syntax:\nDATEDIFF(expr1,expr2)\n\nDATEDIFF() returns expr1 - expr2 expressed as a value in days from one\ndate to the other. expr1 and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n','mysql> SELECT DATEDIFF(\'1997-12-31 23:59:59\',\'1997-12-30\');\n        -> 1\nmysql> SELECT DATEDIFF(\'1997-11-30 23:59:59\',\'1997-12-31\');\n        -> -31\n','date-and-time-functions'),
 (382,'DROP PROCEDURE',35,'Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. As of MySQL 5.0.3,\nyou must have the ALTER ROUTINE privilege for the routine. (That\nprivilege is granted automatically to the routine creator.)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n','','drop-procedure'),
 (383,'CHECK TABLE',19,'Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}\n\nCHECK TABLE checks a table or tables for errors. CHECK TABLE works for\nMyISAM, InnoDB, and (as of MySQL 5.0.16) ARCHIVE tables. For MyISAM\ntables, the key statistics are updated as well.\n\nAs of MySQL 5.0.2, CHECK TABLE can also check views for problems, such\nas tables that are referenced in the view definition that no longer\nexist.\n','','check-table'),
 (384,'BIN',33,'Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n','mysql> SELECT BIN(12);\n        -> \'1100\'\n','string-functions'),
 (385,'CASE FUNCTION',6,'Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first version returns the result where value=compare_value. The\nsecond version returns the result for the first condition that is true.\nIf there was no matching result value, the result after ELSE is\nreturned, or NULL if there is no ELSE part.\n','mysql> SELECT CASE 1 WHEN 1 THEN \'one\'\n    ->     WHEN 2 THEN \'two\' ELSE \'more\' END;\n        -> \'one\'\nmysql> SELECT CASE WHEN 1>0 THEN \'true\' ELSE \'false\' END;\n        -> \'true\'\nmysql> SELECT CASE BINARY \'B\'\n    ->     WHEN \'a\' THEN 1 WHEN \'b\' THEN 2 END;\n        -> NULL\n','control-flow-functions'),
 (386,'DECLARE CURSOR',35,'Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor. Multiple cursors may be declared in a\nroutine, but each cursor in a given block must have a unique name.\n\nThe SELECT statement cannot have an INTO clause.\n','','declare-cursors'),
 (387,'MULTILINESTRING',22,'MultiLineString(ls1,ls2,...)\n\nConstructs a WKB MultiLineString value using WKB LineString arguments.\nIf any argument is not a WKB LineString, the return value is NULL.\n','','gis-mysql-specific-functions'),
 (388,'LOAD DATA',25,'Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [FIELDS\n        [TERMINATED BY \'string\']\n        [[OPTIONALLY] ENCLOSED BY \'char\']\n        [ESCAPED BY \'char\']\n    ]\n    [LINES\n        [STARTING BY \'string\']\n        [TERMINATED BY \'string\']\n    ]\n    [IGNORE number LINES]\n    [(col_name_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. The filename must be given as a literal string.\n\nLOAD DATA INFILE is the complement of SELECT ... INTO OUTFILE. (See\n[HELP SELECT].) To write data from a table to a file, use SELECT ...\nINTO OUTFILE. To read the file back into a table, use LOAD DATA INFILE.\nThe syntax of the FIELDS and LINES clauses is the same for both\nstatements. Both clauses are optional, but FIELDS must precede LINES if\nboth are specified.\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see\nhttp://dev.mysql.com/doc/refman/5.0/en/insert-speed.html.\n\nThe character set indicated by the character_set_database system\nvariable is used to interpret the information in the file. SET NAMES\nand the setting of character_set_client do not affect interpretation of\ninput.\n\nNote that it is currently not possible to load data files that use the\nucs2 character set.\n\nAs of MySQL 5.0.19, the character_set_filesystem system variable\ncontrols the interpretation of the filename.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See http://dev.mysql.com/doc/refman/5.0/en/mysqlimport.html.\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table.\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. Using this option affects the performance of\nLOAD DATA a bit, even if no other thread is using the table at the same\ntime.\n\nThe LOCAL keyword, if specified, is interpreted with respect to the\nclient end of the connection:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  pathname to specify its exact location. If given as a relative\n  pathname, the name is interpreted relative to the directory in which\n  the client program was started.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the filename is an absolute pathname, the server uses it as\n    given.\n\n  o If the filename is a relative pathname with one or more leading\n    components, the server searches for the file relative to the\n    server\'s data directory.\n\n  o If a filename with no leading components is given, the server looks\n    for the file in the database directory of the default database.\n\nNote that, in the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server\'s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE \'data.txt\' INTO TABLE db2.my_table;\n\nWindows pathnames are specified using forward slashes rather than\nbackslashes. If you do use backslashes, you must double them.\n\nFor security reasons, when reading text files located on the server,\nthe files must either reside in the database directory or be readable\nby all. Also, to use LOAD DATA INFILE on server files, you must have\nthe FILE privilege. See\nhttp://dev.mysql.com/doc/refman/5.0/en/privileges-provided.html.\n','','load-data'),
 (389,'LOCALTIME',28,'Syntax:\nLOCALTIME, LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n','','date-and-time-functions'),
 (390,'MPOINTFROMTEXT',3,'MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])\n\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n','','gis-wkt-functions'),
 (391,'BLOB',20,'BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 - 1) bytes.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n','','string-type-overview'),
 (392,'PASSWORD',10,'Syntax:\nPASSWORD(str)\n\nCalculates and returns a password string from the plaintext password\nstr and returns a binary string, or NULL if the argument was NULL. This\nis the function that is used for encrypting MySQL passwords for storage\nin the Password column of the user grant table.\n','mysql> SELECT PASSWORD(\'badpwd\');\n        -> \'*AAB3E285149C0135D51A520E1940DD3263DC008C\'\n','encryption-functions'),
 (393,'CHAR',20,'[NATIONAL] CHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length. The range\nof M is 0 to 255 characters.\n\nNote: Trailing spaces are removed when CHAR values are retrieved.\n\nBefore MySQL 5.0.3, a CHAR column with a length specification greater\nthan 255 is converted to the smallest TEXT type that can hold values of\nthe given length. For example, CHAR(500) is converted to TEXT, and\nCHAR(200000) is converted to MEDIUMTEXT. This is a compatibility\nfeature. However, this conversion causes the column to become a\nvariable-length column, and also affects trailing-space removal.\n\nIn MySQL 5.0.3 and later, if you attempt to set the length of a CHAR\ngreater than 255, the CREATE TABLE or ALTER TABLE statement in which\nthis is done fails with an error:\n\nmysql> CREATE TABLE c1 (col1 INT, col2 CHAR(500));\nERROR 1074 (42000): Column length too big for column \'col\' (max = 255);\nuse BLOB or TEXT instead\nmysql> SHOW CREATE TABLE c1;\nERROR 1146 (42S02): Table \'test.c1\' doesn\'t exist\n','','string-type-overview'),
 (394,'UTC_DATE',28,'Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in \'YYYY-MM-DD\' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n','mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'2003-08-14\', 20030814\n','date-and-time-functions'),
 (395,'DIMENSION',32,'Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe -1, 0, 1, or 2. The meaning of these values is given in [HELP MBR\ndefinition].\n','mysql> SELECT Dimension(GeomFromText(\'LineString(1 1,2 2)\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'LineString(1 1,2 2)\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n','general-geometry-property-functions'),
 (396,'COUNT DISTINCT',14,'Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of different non-NULL values.\n\nCOUNT(DISTINCT) returns 0 if there were no matching rows.\n','mysql> SELECT COUNT(DISTINCT results) FROM student;\n','group-by-functions'),
 (397,'BIT',20,'BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nThis data type was added in MySQL 5.0.3 for MyISAM, and extended in\n5.0.5 to MEMORY, InnoDB, and BDB. Before 5.0.3, BIT is a synonym for\nTINYINT(1).\n','','numeric-type-overview'),
 (398,'EQUALS',26,'Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n','','functions-that-test-spatial-relationships-between-geometries'),
 (399,'SHOW CREATE VIEW',25,'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows a CREATE VIEW statement that creates the given\nview.\n','','show-create-view'),
 (400,'INTERVAL',17,'Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n','mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n','comparison-operators'),
 (401,'FROM_DAYS',28,'Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n','mysql> SELECT FROM_DAYS(729669);\n        -> \'1997-10-07\'\n','date-and-time-functions'),
 (402,'ALTER PROCEDURE',35,'Syntax:\nALTER {PROCEDURE | FUNCTION} sp_name [characteristic ...]\n\ncharacteristic:\n    { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n  | COMMENT \'string\'\n\nThis statement can be used to change the characteristics of a stored\nprocedure or function. As of MySQL 5.0.3, you must have the ALTER\nROUTINE privilege for the routine. (That privilege is granted\nautomatically to the routine creator.) If binary logging is enabled,\nthis statement might also require the SUPER privilege, as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-procedure-logging.html.\n\nMore than one change may be specified in an ALTER PROCEDURE or ALTER\nFUNCTION statement.\n','','alter-procedure'),
 (403,'BIT_COUNT',18,'Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N.\n','mysql> SELECT BIT_COUNT(29), BIT_COUNT(b\'101010\');\n        -> 4, 3\n','bit-functions'),
 (404,'UTC_TIMESTAMP',28,'Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP()\n\nReturns the current UTC date and time as a value in \'YYYY-MM-DD\nHH:MM:SS\' or YYYYMMDDHHMMSS format, depending on whether the function\nis used in a string or numeric context.\n','mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'2003-08-14 18:08:04\', 20030814180804\n','date-and-time-functions'),
 (405,'+',4,'Syntax:\n+\n\nAddition:\n','mysql> SELECT 3+5;\n        -> 8\n','arithmetic-functions'),
 (406,'INET_NTOA',13,'Syntax:\nINET_NTOA(expr)\n\nGiven a numeric network address (4 or 8 byte), returns the dotted-quad\nrepresentation of the address as a string.\n','mysql> SELECT INET_NTOA(3520061480);\n        -> \'209.207.224.40\'\n','miscellaneous-functions'),
 (407,'ACOS',4,'Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n','mysql> SELECT ACOS(1);\n        -> 0\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.5707963267949\n','mathematical-functions'),
 (408,'ISOLATION',7,'Syntax:\nSET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n{ READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE }\n\nThis statement sets the transaction isolation level for the next\ntransaction, globally, or for the current session.\n\nThe default behavior of SET TRANSACTION is to set the isolation level\nfor the next (not yet started) transaction. If you use the GLOBAL\nkeyword, the statement sets the default transaction level globally for\nall new connections created from that point on. Existing connections\nare unaffected. You need the SUPER privilege to do this. Using the\nSESSION keyword sets the default transaction level for all future\ntransactions performed on the current connection.\n\nFor descriptions of each InnoDB transaction isolation level, see\nhttp://dev.mysql.com/doc/refman/5.0/en/innodb-transaction-isolation.htm\nl. InnoDB supports each of these levels in MySQL 5.0. The default level\nis REPEATABLE READ.\n\nTo set the initial default global isolation level for mysqld, use the\n--transaction-isolation option. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-options.html.\n','','set-transaction'),
 (409,'CEILING',4,'Syntax:\nCEILING(X), CEIL(X)\n\nReturns the smallest integer value not less than X.\n','mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEIL(-1.23);\n        -> -1\n','mathematical-functions'),
 (410,'SIN',4,'Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n','mysql> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nmysql> SELECT ROUND(SIN(PI()));\n        -> 0\n','mathematical-functions'),
 (411,'DAYOFWEEK',28,'Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n','mysql> SELECT DAYOFWEEK(\'1998-02-03\');\n        -> 3\n','date-and-time-functions'),
 (412,'LINEFROMWKB',29,'LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])\n\nConstructs a LINESTRING value using its WKB representation and SRID.\n','','gis-wkb-functions'),
 (413,'SHOW PROCESSLIST',25,'Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information using the mysqladmin processlist command. If you have\nthe PROCESS privilege, you can see all threads. Otherwise, you can see\nonly your own threads (that is, threads associated with the MySQL\naccount that you are using). See [HELP KILL]. If you do not use the\nFULL keyword, only the first 100 characters of each statement are shown\nin the Info field.\n','','show-processlist'),
 (414,'GEOMETRYTYPE',32,'GeometryType(g)\n\nReturns as a string the name of the geometry type of which the geometry\ninstance g is a member. The name corresponds to one of the instantiable\nGeometry subclasses.\n','mysql> SELECT GeometryType(GeomFromText(\'POINT(1 1)\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'POINT(1 1)\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n','general-geometry-property-functions'),
 (415,'CREATE VIEW',36,'Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement creates a new view, or replaces an existing one if the\nOR REPLACE clause is given. The select_statement is a SELECT statement\nthat provides the definition of the view. The statement can select from\nbase tables or other views.\n\nThis statement requires the CREATE VIEW privilege for the view, and\nsome privilege for each column selected by the SELECT statement. For\ncolumns used elsewhere in the SELECT statement you must have the SELECT\nprivilege. If the OR REPLACE clause is present, you must also have the\nDROP privilege for the view.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it.\n\nmysql> CREATE VIEW test.v AS SELECT * FROM t;\n\nBase tables and views share the same namespace within a database, so a\ndatabase cannot contain a base table and a view that have the same\nname.\n\nViews must have unique column names with no duplicates, just like base\ntables. By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names. To define explicit names\nfor the view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers. The number of names in column_list\nmust be the same as the number of columns retrieved by the SELECT\nstatement.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions,\nconstant values, operators, and so forth.\n\nUnqualified table or view names in the SELECT statement are interpreted\nwith respect to the default database. A view can refer to tables or\nviews in other databases by qualifying the table or view name with the\nproper database name.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables. The following\nexample defines a view that selects two columns from another table, as\nwell as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system or user variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Within a stored routine, the definition cannot refer to routine\n  parameters or local variables.\n\no Any table or view referred to in the definition must exist. However,\n  after a view has been created, it is possible to drop a table or view\n  that the definition refers to. In this case, use of the view results\n  in an error. To check a view definition for problems of this kind,\n  use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no The tables named in the view definition must already exist.\n\no You cannot associate a trigger with a view.\n\nORDER BY is allowed in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nIf you create a view and then change the query processing environment\nby changing system variables, that may affect the results that you get\nfrom the view:\n\nmysql> CREATE VIEW v AS SELECT CHARSET(CHAR(65)), COLLATION(CHAR(65));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SET NAMES \'latin1\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT * FROM v;\n+-------------------+---------------------+\n| CHARSET(CHAR(65)) | COLLATION(CHAR(65)) |\n+-------------------+---------------------+\n| latin1            | latin1_swedish_ci   |\n+-------------------+---------------------+\n1 row in set (0.00 sec)\n\nmysql> SET NAMES \'utf8\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT * FROM v;\n+-------------------+---------------------+\n| CHARSET(CHAR(65)) | COLLATION(CHAR(65)) |\n+-------------------+---------------------+\n| utf8              | utf8_general_ci     |\n+-------------------+---------------------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at view invocation time. They were\naddded in MySQL 5.0.13, but have no effect until MySQL 5.0.16.\n\nCURRENT_USER also can be given as CURRENT_USER().\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine creator. This also\naffects a view defined within such a routine, if the view definition\ncontains a DEFINER value of CURRENT_USER.\n\nThe default DEFINER value is the user who executes the CREATE VIEW\nstatement. (This is the same as DEFINER = CURRENT_USER.) If a user\nvalue is given, it should be a MySQL account in \'user_name\'@\'host_name\'\nformat (the same format used in the GRANT statement). The user_name and\nhost_name values both are required.\n\nIf you specify the DEFINER clause, you cannot set the value to any user\nbut your own unless you have the SUPER privilege. These rules determine\nthe legal DEFINER user values:\n\no If you do not have the SUPER privilege, the only legal user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  legal account name. If the account does not actually exist, a warning\n  is generated.\n\nThe SQL SECURITY characteristic determines which MySQL account to use\nwhen checking access privileges for the view when the view is executed.\nThe legal characteristic values are DEFINER and INVOKER. These indicate\nthat the view must be executable by the user who defined it or invoked\nit, respectively. The default SQL SECURITY value is DEFINER.\n\nAs of MySQL 5.0.16 (when the DEFINER and SQL SECURITY clauses were\nimplemented), view privileges are checked like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to a stored function, only the\n  privileges needed to invoke the function can be checked. The\n  privileges required when the function runs can be checked only as it\n  executes: For different invocations of the function, different\n  execution paths within the function might be taken.\n\no At view execution time, privileges for objects accessed by the view\n  are checked against the privileges held by the view creator or\n  invoker, depending on whether the SQL SECURITY characteristic is\n  DEFINER or INVOKER, respectively.\n\no If view execution causes execution of a stored function, privilege\n  checking for statements executed within the function depend on\n  whether the function is defined with a SQL SECURITY characteristic of\n  DEFINER or INVOKER. If the security characteristic is DEFINER, the\n  function runs with the privileges of its creator. If the\n  characteristic is INVOKER, the function runs with the privileges\n  determined by the view\'s SQL SECURITY characteristic.\n\nPrior to MySQL 5.0.16 (before the DEFINER and SQL SECURITY clauses were\nimplemented), privileges required for objects used in a view are\nchecked at view creation time.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges need to be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the function\nf() and the view v.\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY INVOKER.\n\nIf you invoke a view that was created before MySQL 5.0.13, it is\ntreated as though it was created with a SQL SECURITY DEFINER clause and\nwith a DEFINER value that is the same as your account. However, because\nthe actual definer is unknown, MySQL issues a warning. To make the\nwarning go away, it is sufficient to re-create the view so that the\nview definition includes a DEFINER clause.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL.\nALGORITHM takes three values: MERGE, TEMPTABLE, or UNDEFINED. The\ndefault algorithm is UNDEFINED if no ALGORITHM clause is present. The\nalgorithm affects how MySQL processes the view.\n\nFor MERGE, the text of a statement that refers to the view and the view\ndefinition are merged such that parts of the view definition replace\ncorresponding parts of the statement.\n\nFor TEMPTABLE, the results from the view are retrieved into a temporary\ntable, which then is used to execute the statement.\n\nFor UNDEFINED, MySQL chooses which algorithm to use. It prefers MERGE\nover TEMPTABLE if possible, because MERGE is usually more efficient and\nbecause a view cannot be updatable if a temporary table is used.\n\nA reason to choose TEMPTABLE explicitly is that locks can be released\non underlying tables after the temporary table has been created and\nbefore it is used to finish processing the statement. This might result\nin quicker lock release than the MERGE algorithm so that other clients\nthat use the view are not blocked as long.\n\nA view algorithm can be UNDEFINED for three reasons:\n\no No ALGORITHM clause is present in the CREATE VIEW statement.\n\no The CREATE VIEW statement has an explicit ALGORITHM = UNDEFINED\n  clause.\n\no ALGORITHM = MERGE is specified for a view that can be processed only\n  with a temporary table. In this case, MySQL generates a warning and\n  sets the algorithm to UNDEFINED.\n\nAs mentioned earlier, MERGE is handled by merging corresponding parts\nof a view definition into the statement that refers to the view. The\nfollowing examples briefly illustrate how the MERGE algorithm works.\nThe examples assume that there is a view v_merge that has this\ndefinition:\n\nCREATE ALGORITHM = MERGE VIEW v_merge (vc1, vc2) AS\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 1: Suppose that we issue this statement:\n\nSELECT * FROM v_merge;\n\nMySQL handles the statement as follows:\n\no v_merge becomes t\n\no * becomes vc1, vc2, which corresponds to c1, c2\n\no The view WHERE clause is added\n\nThe resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 2: Suppose that we issue this statement:\n\nSELECT * FROM v_merge WHERE vc1 < 100;\n\nThis statement is handled similarly to the previous one, except that\nvc1 < 100 becomes c1 < 100 and the view WHERE clause is added to the\nstatement WHERE clause using an AND connective (and parentheses are\nadded to make sure the parts of the clause are executed with correct\nprecedence). The resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE (c3 > 100) AND (c1 < 100);\n\nEffectively, the statement to be executed has a WHERE clause of this\nform:\n\nWHERE (select WHERE) AND (view WHERE)\n\nThe MERGE algorithm requires a one-to-one relationship between the rows\nin the view and the rows in the underlying table. If this relationship\ndoes not hold, a temporary table must be used instead. Lack of a\none-to-one relationship occurs if the view contains any of a number of\nconstructs:\n\no Aggregate functions (SUM(), MIN(), MAX(), COUNT(), and so forth)\n\no DISTINCT\n\no GROUP BY\n\no HAVING\n\no UNION or UNION ALL\n\no Subquery in the select list\n\no Refers only to literal values (in this case, there is no underlying\n  table)\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to-one\nrelationship between the rows in the view and the rows in the\nunderlying table. There are also certain other constructs that make a\nview non-updatable. To be more specific, a view is not updatable if it\ncontains any of the following:\n\no Aggregate functions (SUM(), MIN(), MAX(), COUNT(), and so forth)\n\no DISTINCT\n\no GROUP BY\n\no HAVING\n\no UNION or UNION ALL\n\no Subquery in the select list\n\no Join\n\no Non-updatable view in the FROM clause\n\no A subquery in the WHERE clause that refers to a table in the FROM\n  clause\n\no Refers only to literal values (in this case, there is no underlying\n  table to update)\n\no ALGORITHM = TEMPTABLE (use of a temporary table always makes a view\n  non-updatable)\n\nWith respect to insertability (being updatable with INSERT statements),\nan updatable view is insertable if it also satisfies these additional\nrequirements for the view columns:\n\no There must be no duplicate view column names.\n\no The view must contain all columns in the base table that do not have\n  a default value.\n\no The view columns must be simple column references and not derived\n  columns. A derived column is one that is not a simple column\n  reference but is derived from an expression. These are examples of\n  derived columns:\n\n3.14159\ncol1 + 3\nUPPER(col2)\ncol3 / col4\n(subquery)\n\nA view that has a mix of simple column references and derived columns\nis not insertable, but it can be updatable if you update only those\ncolumns that are not derived. Consider this view:\n\nCREATE VIEW v AS SELECT col1, 1 AS col2 FROM t;\n\nThis view is not insertable because col2 is derived from an expression.\nBut it is updatable if the update does not try to update col2. This\nupdate is allowable:\n\nUPDATE v SET col1 = 0;\n\nThis update is not allowable because it attempts to update a derived\ncolumn:\n\nUPDATE v SET col2 = 0;\n\nIt is sometimes possible for a multiple-table view to be updatable,\nassuming that it can be processed with the MERGE algorithm. For this to\nwork, the view must use an inner join (not an outer join or a UNION).\nAlso, only a single table in the view definition can be updated, so the\nSET clause must name only columns from one of the tables in the view.\nViews that use UNION ALL are disallowed even though they might be\ntheoretically updatable, because the implementation uses temporary\ntables to process them.\n\nFor a multiple-table updatable view, INSERT can work if it inserts into\na single table. DELETE is not supported.\n\nINSERT DELAYED is not supported for views.\n\nIf a table contains an AUTO_INCREMENT column, inserting into an\ninsertable view on the table that does not include the AUTO_INCREMENT\ncolumn does not change the value of LAST_INSERT_ID(), because the side\neffects of inserting default values into columns not part of the view\nshould not be visible.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n','','create-view'),
 (416,'TRIM',33,'Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n','mysql> SELECT TRIM(\'  bar   \');\n        -> \'bar\'\nmysql> SELECT TRIM(LEADING \'x\' FROM \'xxxbarxxx\');\n        -> \'barxxx\'\nmysql> SELECT TRIM(BOTH \'x\' FROM \'xxxbarxxx\');\n        -> \'bar\'\nmysql> SELECT TRIM(TRAILING \'xyz\' FROM \'barxxyz\');\n        -> \'barx\'\n','string-functions'),
 (417,'IS',17,'Syntax:\nIS boolean_value, IS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n','mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\nmysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n','comparison-operators'),
 (418,'GET_FORMAT',28,'Syntax:\nGET_FORMAT(DATE|TIME|DATETIME, \'EUR\'|\'USA\'|\'JIS\'|\'ISO\'|\'INTERNAL\')\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n','mysql> SELECT DATE_FORMAT(\'2003-10-03\',GET_FORMAT(DATE,\'EUR\'));\n        -> \'03.10.2003\'\nmysql> SELECT STR_TO_DATE(\'10.31.2003\',GET_FORMAT(DATE,\'USA\'));\n        -> \'2003-10-31\'\n','date-and-time-functions'),
 (419,'TINYBLOB',20,'TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 - 1) bytes.\n','','string-type-overview'),
 (420,'SAVEPOINT',7,'Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO SAVEPOINT identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT and ROLLBACK TO SAVEPOINT.\nStarting from MySQL 5.0.3, RELEASE SAVEPOINT and the optional WORK\nkeyword for ROLLBACK are supported as well.\n','','savepoints'),
 (421,'USER',15,'Syntax:\nUSER()\n\nReturns the current MySQL username and hostname as a string in the utf8\ncharacter set.\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\n','information-functions'),
 (422,'MPOINTFROMWKB',29,'MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])\n\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n','','gis-wkb-functions'),
 (423,'ALTER TABLE',36,'Syntax:\nALTER [IGNORE] TABLE tbl_name\n    alter_specification [, alter_specification] ...\n\nalter_specification:\n    ADD [COLUMN] column_definition [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (column_definition,...)\n  | ADD {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        PRIMARY KEY [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX|KEY] [index_name] [index_type] (index_col_name,...)\n  | ADD [FULLTEXT|SPATIAL] [INDEX|KEY] [index_name] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        [reference_definition]\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name column_definition\n        [FIRST|AFTER col_name]\n  | MODIFY [COLUMN] column_definition [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP {INDEX|KEY} index_name\n  | DROP FOREIGN KEY fk_symbol\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO] new_tbl_name\n  | ORDER BY col_name\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET charset_name [COLLATE collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n  | table_option ...\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nALTER TABLE enables you to change the structure of an existing table.\nFor example, you can add or delete columns, create or destroy indexes,\nchange the type of existing columns, or rename columns or the table\nitself. You can also change the comment for the table and type of the\ntable.\n','','alter-table'),
 (424,'PURGE MASTER LOGS',25,'Syntax:\nPURGE {MASTER | BINARY} LOGS TO \'log_name\'\nPURGE {MASTER | BINARY} LOGS BEFORE \'date\'\n\nDeletes all the binary logs listed in the log index prior to the\nspecified log or date. The logs also are removed from the list recorded\nin the log index file, so that the given log becomes the first.\n','PURGE MASTER LOGS TO \'mysql-bin.010\';\nPURGE MASTER LOGS BEFORE \'2003-04-02 22:46:26\';\n','purge-master-logs'),
 (425,'CHAR BYTE',20,'The CHAR BYTE data type is an alias for the BINARY data type. This is a\ncompatibility feature.\n','','string-type-overview'),
 (426,'REPAIR TABLE',19,'Syntax:\nREPAIR [LOCAL | NO_WRITE_TO_BINLOG] TABLE\n    tbl_name [, tbl_name] ... [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table. By default, it has the\nsame effect as myisamchk --recover tbl_name. REPAIR TABLE works for\nMyISAM and for ARCHIVE tables. See\nhttp://dev.mysql.com/doc/refman/5.0/en/myisam-storage-engine.html, and\nhttp://dev.mysql.com/doc/refman/5.0/en/archive-storage-engine.html.\n\nThis statement requires SELECT and INSERT privileges for the table.\n','','repair-table'),
 (427,'MERGE',36,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See\nhttp://dev.mysql.com/doc/refman/5.0/en/myisampack.html. Differences in\ntable options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','merge-storage-engine'),
 (428,'CREATE TABLE',36,'Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    (create_definition,...)\n    [table_option ...]\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_option ...]\n    select_statement\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    { LIKE old_tbl_name | (LIKE old_tbl_name) }\n\ncreate_definition:\n    column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]\n      [index_name] [index_type] (index_col_name,...)\n  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n      [index_name] (index_col_name,...) [reference_definition]\n  | CHECK (expr)\n\ncolumn_definition:\n    col_name data_type [NOT NULL | NULL] [DEFAULT default_value]\n      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n      [COMMENT \'string\'] [reference_definition]\n\ndata_type:\n    BIT[(length)]\n  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL(length,decimals) [UNSIGNED] [ZEROFILL]\n  | NUMERIC(length,decimals) [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | VARCHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | BINARY(length)\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | TEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | MEDIUMTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | LONGTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | ENUM(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | SET(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nreference_definition:\n    REFERENCES tbl_name [(index_col_name,...)]\n      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n      [ON DELETE reference_option]\n      [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\ntable_option:\n    {ENGINE|TYPE} [=] engine_name\n  | AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET charset_name\n  | CHECKSUM [=] {0 | 1}\n  | COLLATE collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | DATA DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | INDEX DIRECTORY [=] \'absolute path to directory\'\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | UNION [=] (tbl_name[,tbl_name]...)\n\nselect_statement:\n    [IGNORE | REPLACE] [AS] SELECT ...   (Some legal select statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nRules for allowable table names are given in\nhttp://dev.mysql.com/doc/refman/5.0/en/identifiers.html. By default,\nthe table is created in the default database. An error occurs if the\ntable exists, if there is no default database, or if the database does\nnot exist.\n','','create-table'),
 (429,'>',17,'Syntax:\n>\n\nGreater than:\n','mysql> SELECT 2 > 2;\n        -> 0\n','comparison-operators');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (430,'ANALYZE TABLE',19,'Syntax:\nANALYZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...\n\nANALYZE TABLE analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock for MyISAM\nand BDB. For InnoDB the table is locked with a write lock. This\nstatement works with MyISAM, BDB, and InnoDB tables. For MyISAM tables,\nthis statement is equivalent to using myisamchk --analyze.\n\nFor more information on how the analysis works withinInnoDB, see\nhttp://dev.mysql.com/doc/refman/5.0/en/innodb-restrictions.html.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than\na constant.\n\nThis statement requires SELECT and INSERT privileges for the table.\n','','analyze-table'),
 (431,'MICROSECOND',28,'Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n','mysql> SELECT MICROSECOND(\'12:00:00.123456\');\n        -> 123456\nmysql> SELECT MICROSECOND(\'1997-12-31 23:59:59.000010\');\n        -> 10\n','date-and-time-functions'),
 (432,'CONSTRAINT',36,'InnoDB also supports foreign key constraints. The syntax for a foreign\nkey constraint definition in InnoDB looks like this:\n\n[CONSTRAINT symbol] FOREIGN KEY [id] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name, ...)\n    [ON DELETE {RESTRICT | CASCADE | SET NULL | NO ACTION}]\n    [ON UPDATE {RESTRICT | CASCADE | SET NULL | NO ACTION}]\n','CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,\n                      price DECIMAL,\n                      PRIMARY KEY(category, id)) ENGINE=INNODB;\nCREATE TABLE customer (id INT NOT NULL,\n                       PRIMARY KEY (id)) ENGINE=INNODB;\nCREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,\n                            product_category INT NOT NULL,\n                            product_id INT NOT NULL,\n                            customer_id INT NOT NULL,\n                            PRIMARY KEY(no),\n                            INDEX (product_category, product_id),\n                            FOREIGN KEY (product_category, product_id)\n                              REFERENCES product(category, id)\n                              ON UPDATE CASCADE ON DELETE RESTRICT,\n                            INDEX (customer_id),\n                            FOREIGN KEY (customer_id)\n                              REFERENCES customer(id)) ENGINE=INNODB;\n','innodb-foreign-key-constraints'),
 (433,'FIELD',33,'Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n','mysql> SELECT FIELD(\'ej\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 2\nmysql> SELECT FIELD(\'fo\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 0\n','string-functions'),
 (434,'MAKETIME',28,'Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n','mysql> SELECT MAKETIME(12,15,30);\n        -> \'12:15:30\'\n','date-and-time-functions'),
 (435,'CURDATE',28,'Syntax:\nCURDATE()\n\nReturns the current date as a value in \'YYYY-MM-DD\' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n','mysql> SELECT CURDATE();\n        -> \'1997-12-15\'\nmysql> SELECT CURDATE() + 0;\n        -> 19971215\n','date-and-time-functions'),
 (436,'MIN MAX',14,'Syntax:\nMIN([DISTINCT] expr), MAX([DISTINCT] expr)\n\nReturns the minimum or maximum value of expr. MIN() and MAX() may take\na string argument; in such cases they return the minimum or maximum\nstring value. See\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the minimum or maximum of the distinct\nvalues of expr, however, this produces the same result as omitting\nDISTINCT.\n\nMIN() and MAX() return NULL if there were no matching rows.\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','group-by-functions'),
 (437,'SET PASSWORD',8,'Syntax:\nSET PASSWORD [FOR user] = PASSWORD(\'some password\')\n\nThe SET PASSWORD statement assigns a password to an existing MySQL user\naccount.\n\nWith no FOR clause, this statement sets the password for the current\nuser. Any client that has connected to the server using a non-anonymous\naccount can change the password for that account.\n\nWith a FOR clause, this statement sets the password for a specific\naccount on the current server host. Only clients that have the UPDATE\nprivilege for the mysql database can do this. The user value should be\ngiven in user_name@host_name format, where user_name and host_name are\nexactly as they are listed in the User and Host columns of the\nmysql.user table entry. For example, if you had an entry with User and\nHost column values of \'bob\' and \'%.loc.gov\', you would write the\nstatement like this:\n\nSET PASSWORD FOR \'bob\'@\'%.loc.gov\' = PASSWORD(\'newpass\');\n','','set-password'),
 (438,'ENUM',20,'ENUM(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values \'value1\', \'value2\', ..., NULL or the special \'\'\nerror value. An ENUM column can have a maximum of 65,535 distinct\nvalues. ENUM values are represented internally as integers.\n','','string-type-overview'),
 (439,'IF FUNCTION',6,'Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns\nexpr2; otherwise it returns expr3. IF() returns a numeric or string\nvalue, depending on the context in which it is used.\n','mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,\'yes\',\'no\');\n        -> \'yes\'\nmysql> SELECT IF(STRCMP(\'test\',\'test1\'),\'no\',\'yes\');\n        -> \'no\'\n','control-flow-functions'),
 (440,'DATABASE',15,'Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n','mysql> SELECT DATABASE();\n        -> \'test\'\n','information-functions'),
 (441,'POINTFROMWKB',29,'PointFromWKB(wkb[,srid])\n\nConstructs a POINT value using its WKB representation and SRID.\n','','gis-wkb-functions'),
 (442,'POWER',4,'Syntax:\nPOW(X,Y), POWER(X,Y)\n\nReturns the value of X raised to the power of Y.\n','mysql> SELECT POW(2,2);\n        -> 4\nmysql> SELECT POW(2,-2);\n        -> 0.25\n','mathematical-functions'),
 (443,'ATAN',4,'Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n','mysql> SELECT ATAN(2);\n        -> 1.1071487177941\nmysql> SELECT ATAN(-2);\n        -> -1.1071487177941\n','mathematical-functions'),
 (444,'STRCMP',33,'Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n','mysql> SELECT STRCMP(\'text\', \'text2\');\n        -> -1\nmysql> SELECT STRCMP(\'text2\', \'text\');\n        -> 1\nmysql> SELECT STRCMP(\'text\', \'text\');\n        -> 0\n','string-comparison-functions'),
 (445,'INSERT DELAYED',25,'Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that is very useful if you have clients that cannot or\nneed not wait for the INSERT to complete. This is a common situation\nwhen you use MySQL for logging and you also periodically run SELECT and\nUPDATE statements that take a long time to complete.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use\nby any other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts from many\nclients are bundled together and written in one block. This is much\nfaster than performing many separate inserts.\n\nNote that INSERT DELAYED is slower than a normal INSERT if the table is\nnot otherwise in use. There is also the additional overhead for the\nserver to handle a separate thread for each table for which there are\ndelayed rows. This means that you should use INSERT DELAYED only when\nyou are really sure that you need it.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, and ARCHIVE tables.\n  See\n  http://dev.mysql.com/doc/refman/5.0/en/myisam-storage-engine.html,\n  http://dev.mysql.com/doc/refman/5.0/en/memory-storage-engine.html,\n  and\n  http://dev.mysql.com/doc/refman/5.0/en/archive-storage-engine.html.\n\n  For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT ... SELECT or\n  INSERT ... ON DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no DELAYED is ignored on slave replication servers because it could\n  cause the slave to have different data than the master.\n\no Pending INSERT DELAYED statements are lost if a table is write locked\n  and ALTER TABLE is used to modify the table structure.\n\no INSERT DELAYED is not supported for views.\n','','insert-delayed'),
 (446,'MEDIUMTEXT',20,'MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 16,777,215 (224 - 1) characters.\n','','string-type-overview'),
 (447,'LN',4,'Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\n','mysql> SELECT LN(2);\n        -> 0.69314718055995\nmysql> SELECT LN(-2);\n        -> NULL\n','mathematical-functions'),
 (448,'SHOW COLLATION',25,'Syntax:\nSHOW COLLATION [LIKE \'pattern\']\n\nThe output from SHOW COLLATION includes all available character sets.\nIt takes an optional LIKE clause whose pattern indicates which\ncollation names to match. For example:\n\nmysql> SHOW COLLATION LIKE \'latin1%\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         |          |       0 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |\n| latin1_danish_ci  | latin1  | 15 |         |          |       0 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       0 |\n| latin1_general_ci | latin1  | 48 |         |          |       0 |\n| latin1_general_cs | latin1  | 49 |         |          |       0 |\n| latin1_spanish_ci | latin1  | 94 |         |          |       0 |\n+-------------------+---------+----+---------+----------+---------+\n','','show-collation'),
 (449,'LOG',4,'Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X.\n','mysql> SELECT LOG(2);\n        -> 0.69314718055995\nmysql> SELECT LOG(-2);\n        -> NULL\n','mathematical-functions'),
 (450,'SET SQL_LOG_BIN',25,'Syntax:\nSET SQL_LOG_BIN = {0|1}\n\nDisables or enables binary logging for the current connection\n(SQL_LOG_BIN is a session variable) if the client has the SUPER\nprivilege. The statement is refused with an error if the client does\nnot have that privilege.\n','','set-sql-log-bin'),
 (451,'!=',17,'Syntax:\n<>, !=\n\nNot equal:\n','mysql> SELECT \'.01\' <> \'0.01\';\n        -> 1\nmysql> SELECT .01 <> \'0.01\';\n        -> 0\nmysql> SELECT \'zapp\' <> \'zappp\';\n        -> 1\n','comparison-operators'),
 (452,'WHILE',35,'Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition is true. statement_list consists of one or more\nstatements.\n\nA WHILE statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n','CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND\n','while-statement'),
 (453,'AES_DECRYPT',10,'Syntax:\nAES_ENCRYPT(str,key_str), AES_DECRYPT(crypt_str,key_str)\n\nThese functions allow encryption and decryption of data using the\nofficial AES (Advanced Encryption Standard) algorithm, previously known\nas \"Rijndael.\" Encoding with a 128-bit key length is used, but you can\nextend it up to 256 bits by modifying the source. We chose 128 bits\nbecause it is much faster and it is secure enough for most purposes.\n\nAES_ENCRYPT() encrypts a string and returns a binary string.\nAES_DECRYPT() decrypts the encrypted string and returns the original\nstring. The input arguments may be any length. If either argument is\nNULL, the result of this function is also NULL.\n\nBecause AES is a block-level algorithm, padding is used to encode\nuneven length strings and so the result string length may be calculated\nusing this formula:\n\n16 x (trunc(string_length / 16) + 1)\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nYou can use the AES functions to store data in an encrypted form by\nmodifying your queries:\n','INSERT INTO t VALUES (1,AES_ENCRYPT(\'text\',\'password\'));\n','encryption-functions'),
 (454,'DAYNAME',28,'Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date. As of MySQL 5.0.25, the\nlanguage used for the name is controlled by the value of the\nlc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.0/en/locale-support.html).\n','mysql> SELECT DAYNAME(\'1998-02-05\');\n        -> \'Thursday\'\n','date-and-time-functions'),
 (455,'COERCIBILITY',15,'Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n','mysql> SELECT COERCIBILITY(\'abc\' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(\'abc\');\n        -> 4\n','information-functions'),
 (456,'INT',20,'INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n','','numeric-type-overview'),
 (457,'GLENGTH',11,'GLength(ls)\n\nReturns as a double-precision number the length of the LineString value\nls in its associated spatial reference.\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+\n','linestring-property-functions'),
 (458,'RADIANS',4,'Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nπ radians equals 180 degrees.)\n','mysql> SELECT RADIANS(90);\n        -> 1.5707963267949\n','mathematical-functions'),
 (459,'COLLATION',15,'Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n','mysql> SELECT COLLATION(\'abc\');\n        -> \'latin1_swedish_ci\'\nmysql> SELECT COLLATION(_utf8\'abc\');\n        -> \'utf8_general_ci\'\n','information-functions'),
 (460,'COALESCE',17,'Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n','mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n','comparison-operators'),
 (461,'VERSION',15,'Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set.\n','mysql> SELECT VERSION();\n        -> \'5.0.30-standard\'\n','information-functions'),
 (462,'MAKE_SET',33,'Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by `,\'\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n','mysql> SELECT MAKE_SET(1,\'a\',\'b\',\'c\');\n        -> \'a\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',\'world\');\n        -> \'hello,world\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',NULL,\'world\');\n        -> \'hello\'\nmysql> SELECT MAKE_SET(0,\'a\',\'b\',\'c\');\n        -> \'\'\n','string-functions'),
 (463,'FIND_IN_SET',33,'Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by `,\' characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (`,\') character.\n','mysql> SELECT FIND_IN_SET(\'b\',\'a,b,c,d\');\n        -> 2\n','string-functions');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;


--
-- Definition of table `host`
--

DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';

--
-- Dumping data for table `host`
--

/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;


--
-- Definition of table `proc`
--

DROP TABLE IF EXISTS `proc`;
CREATE TABLE `proc` (
  `db` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  `name` char(64) NOT NULL default '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL default '',
  `language` enum('SQL') NOT NULL default 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL default 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL default 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL default 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` char(64) NOT NULL default '',
  `body` longblob NOT NULL,
  `definer` char(77) character set utf8 collate utf8_bin NOT NULL default '',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE') NOT NULL default '',
  `comment` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';

--
-- Dumping data for table `proc`
--

/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
INSERT INTO `proc` (`db`,`name`,`type`,`specific_name`,`language`,`sql_data_access`,`is_deterministic`,`security_type`,`param_list`,`returns`,`body`,`definer`,`created`,`modified`,`sql_mode`,`comment`) VALUES 
 (0x746172676574,'insertrecord','PROCEDURE','insertrecord','SQL','CONTAINS_SQL','NO','DEFINER',0x696E2070726F64756374696420696E74656765722C20696E2070726F647563746E616D652076617263686172283235292C20696E207261746520646563696D616C2836292C20696E2073746F636B20646563696D616C2836292C20696E20707572636861736564617465206461746520,'',0x424547494E0D0A20202020696E7365727420696E746F2070726F64756374732076616C7565732870726F6475637469642C2070726F647563746E616D652C20726174652C2073746F636B2C20707572636861736564617465293B0D0A454E44,0x726F6F74406C6F63616C686F7374,'2018-08-18 18:33:07','2018-08-18 18:33:07','STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER',''),
 (0x746563686D6168696E647261,'insertrecords','PROCEDURE','insertrecords','SQL','CONTAINS_SQL','NO','DEFINER','','',0x424547494E0D0A20200D0A454E44,0x726F6F74406C6F63616C686F7374,'2018-09-01 16:25:51','2018-09-01 16:25:51','STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER','');
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;


--
-- Definition of table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
CREATE TABLE `procs_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Routine_name` char(64) collate utf8_bin NOT NULL default '',
  `Routine_type` enum('FUNCTION','PROCEDURE') collate utf8_bin NOT NULL,
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Proc_priv` set('Execute','Alter Routine','Grant') character set utf8 NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';

--
-- Dumping data for table `procs_priv`
--

/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;


--
-- Definition of table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
CREATE TABLE `tables_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view') character set utf8 NOT NULL default '',
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';

--
-- Dumping data for table `tables_priv`
--

/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;


--
-- Definition of table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL auto_increment,
  `Use_leap_seconds` enum('Y','N') NOT NULL default 'N',
  PRIMARY KEY  (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';

--
-- Dumping data for table `time_zone`
--

/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;


--
-- Definition of table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY  (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';

--
-- Dumping data for table `time_zone_leap_second`
--

/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;


--
-- Definition of table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';

--
-- Dumping data for table `time_zone_name`
--

/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;


--
-- Definition of table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';

--
-- Dumping data for table `time_zone_transition`
--

/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;


--
-- Definition of table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL default '0',
  `Is_DST` tinyint(3) unsigned NOT NULL default '0',
  `Abbreviation` char(8) NOT NULL default '',
  PRIMARY KEY  (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';

--
-- Dumping data for table `time_zone_transition_type`
--

/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Password` char(41) character set latin1 collate latin1_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Reload_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Shutdown_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Process_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `File_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_db_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Super_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_slave_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_client_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_user_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') character set utf8 NOT NULL default '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL default '0',
  `max_updates` int(11) unsigned NOT NULL default '0',
  `max_connections` int(11) unsigned NOT NULL default '0',
  `max_user_connections` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`Host`,`User`,`Password`,`Select_priv`,`Insert_priv`,`Update_priv`,`Delete_priv`,`Create_priv`,`Drop_priv`,`Reload_priv`,`Shutdown_priv`,`Process_priv`,`File_priv`,`Grant_priv`,`References_priv`,`Index_priv`,`Alter_priv`,`Show_db_priv`,`Super_priv`,`Create_tmp_table_priv`,`Lock_tables_priv`,`Execute_priv`,`Repl_slave_priv`,`Repl_client_priv`,`Create_view_priv`,`Show_view_priv`,`Create_routine_priv`,`Alter_routine_priv`,`Create_user_priv`,`ssl_type`,`ssl_cipher`,`x509_issuer`,`x509_subject`,`max_questions`,`max_updates`,`max_connections`,`max_user_connections`) VALUES 
 (0x6C6F63616C686F7374,0x726F6F74,0x2A32334145383039444441434146393641463046443738454430344236413236354530354141323537,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),
 (0x25,0x726F6F74,0x2A32334145383039444441434146393641463046443738454430344236413236354530354141323537,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','N','N','N','N','','','','',0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `User` varchar(16) collate utf8_bin NOT NULL,
  `Full_name` varchar(60) collate utf8_bin default NULL,
  `Description` varchar(255) collate utf8_bin default NULL,
  `Email` varchar(80) collate utf8_bin default NULL,
  `Contact_information` text collate utf8_bin,
  `Icon` blob,
  PRIMARY KEY  (`User`),
  KEY `user_info_Full_name` (`Full_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Stores additional user information';

--
-- Dumping data for table `user_info`
--

/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

--
-- Create schema techmahindra
--

CREATE DATABASE IF NOT EXISTS techmahindra;
USE techmahindra;

--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `userid` int(11) NOT NULL,
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `gender` varchar(42) default NULL,
  `dob` date default NULL,
  `email` varchar(30) default NULL,
  `phone` int(11) default NULL,
  `city` varchar(40) default NULL,
  `password` varchar(50) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`userid`,`firstname`,`lastname`,`gender`,`dob`,`email`,`phone`,`city`,`password`) VALUES 
 (100,'AYUSH','SHARMA','MALE','1999-11-19','ayyu',2255,'GWALIOR','PPOP'),
 (300,'ravi','GUPTA','MALE','2000-09-05','ravi',2580,'DELHI','77'),
 (400,'JATIN','SHARMA','MALE','1991-02-03','GAIG',2255,'MUMBAI','2580'),
 (500,'urja','nagre','male','1990-09-09','HJDA',2558,'GWALIOR','2558');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

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
 (14,210,'098765432123','DL53CS2212','2018-11-23',30,1,'In','1','9876543210','01:46:17'),
 (15,206,'122344002231','Mp09cd3343','2019-07-10',30,1,'In','1','9399274159','01:06:29');
/*!40000 ALTER TABLE `vehical` ENABLE KEYS */;

--
-- Create schema target
--

CREATE DATABASE IF NOT EXISTS target;
USE target;

--
-- Definition of table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `productid` int(11) NOT NULL,
  `productname` varchar(25) default NULL,
  `rate` decimal(6,0) default NULL,
  `stock` decimal(6,0) default NULL,
  `purchasedate` date default NULL,
  PRIMARY KEY  (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`productid`,`productname`,`rate`,`stock`,`purchasedate`) VALUES 
 (52,'sjamp','2','100','2018-08-08'),
 (100,'DOVE','20','100','2018-09-09'),
 (200,'LUX','20','100','2018-01-01'),
 (800,'fsd','1','1','2018-01-02');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

--
-- Create schema jsptest
--

CREATE DATABASE IF NOT EXISTS jsptest;
USE jsptest;

--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`email`,`password`) VALUES 
 ('ayushs136@gmail.com','123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Create schema techmahindra
--

CREATE DATABASE IF NOT EXISTS techmahindra;
USE techmahindra;

--
-- Definition of procedure `insertrecords`
--

DROP PROCEDURE IF EXISTS `insertrecords`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertrecords`()
BEGIN
  
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;
--
-- Create schema target
--

CREATE DATABASE IF NOT EXISTS target;
USE target;

--
-- Definition of procedure `insertrecord`
--

DROP PROCEDURE IF EXISTS `insertrecord`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertrecord`(in productid integer, in productname varchar(25), in rate decimal(6), in stock decimal(6), in purchasedate date )
BEGIN
    insert into products values(productid, productname, rate, stock, purchasedate);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
