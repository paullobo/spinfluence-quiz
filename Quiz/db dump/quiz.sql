CREATE DATABASE  IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `quiz`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: quiz
-- ------------------------------------------------------
-- Server version	5.6.41-log

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
-- Table structure for table `tbl_ansmaster`
--

DROP TABLE IF EXISTS `tbl_ansmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ansmaster` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `ans` varchar(255) DEFAULT NULL,
  `correct` tinyint(4) DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `createddt` datetime DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  `modifieddt` datetime DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ansmaster`
--

LOCK TABLES `tbl_ansmaster` WRITE;
/*!40000 ALTER TABLE `tbl_ansmaster` DISABLE KEYS */;
INSERT INTO `tbl_ansmaster` VALUES (1,1,'A','Oxygen',0,'paul',NULL,NULL,NULL),(2,1,'B','Hydrogen sulphide',1,'paul',NULL,NULL,NULL),(3,1,'C','Carbon dioxide',0,'paul',NULL,NULL,NULL),(4,1,'D','Nitrogen',0,'paul',NULL,NULL,NULL),(5,2,'A','Phosphorous',0,'paul',NULL,NULL,NULL),(6,2,'B','Bromine',1,'paul',NULL,NULL,NULL),(7,2,'C','Chlorine',0,'paul',NULL,NULL,NULL),(8,2,'D','Helium',0,'paul',NULL,NULL,NULL),(9,3,'A','Copper',0,'paul',NULL,NULL,NULL),(10,3,'B','Magnesium',1,'paul',NULL,NULL,NULL),(11,3,'C','Iron',0,'paul',NULL,NULL,NULL),(12,3,'D','Calcium',0,'paul',NULL,NULL,NULL),(13,4,'A','Graphite',1,'paul',NULL,NULL,NULL),(14,4,'B','Silicon',0,'paul',NULL,NULL,NULL),(15,4,'C','Charcoal',0,'paul',NULL,NULL,NULL),(16,4,'D','Phosphorous',0,'paul',NULL,NULL,NULL),(17,5,'A','Tin',0,'paul',NULL,NULL,NULL),(18,5,'B','Mercury',1,'paul',NULL,NULL,NULL),(19,5,'C','Lead',0,'paul',NULL,NULL,NULL),(20,5,'D','Zinc',0,'paul',NULL,NULL,NULL),(21,6,'A','Arsenous oxide',1,'paul',NULL,NULL,NULL),(22,6,'B','Potassium carbonate',0,'paul',NULL,NULL,NULL),(23,6,'C','Soda ash',0,'paul',NULL,NULL,NULL),(24,6,'D','Feldspar',0,'paul',NULL,NULL,NULL),(25,7,'A','Natural rubber',1,'paul',NULL,NULL,NULL),(26,7,'B','Starch',0,'paul',NULL,NULL,NULL),(27,7,'C','Cellulose',0,'paul',NULL,NULL,NULL),(28,7,'D','None of these',0,'paul',NULL,NULL,NULL),(29,8,'A','Paint',0,'paul',NULL,NULL,NULL),(30,8,'B','Paper',1,'paul',NULL,NULL,NULL),(31,8,'C','Ink',0,'paul',NULL,NULL,NULL),(32,8,'D','Gun Powder',0,'paul',NULL,NULL,NULL),(33,9,'A','Cellulose',1,'paul',NULL,NULL,NULL),(34,9,'B','Pectin',0,'paul',NULL,NULL,NULL),(35,9,'C','Glucose',0,'paul',NULL,NULL,NULL),(36,9,'D','Amylase',0,'paul',NULL,NULL,NULL),(37,10,'A','Musical instruments',0,'paul',NULL,NULL,NULL),(38,10,'B','Food industry',0,'paul',NULL,NULL,NULL),(39,10,'C','Weaving',0,'paul',NULL,NULL,NULL),(40,10,'D','Communication',1,'paul',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_ansmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_employee` (
  `eid` int(11) NOT NULL,
  `user` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employee`
--

LOCK TABLES `tbl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` VALUES (1,'admin','1234');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_quesmaster`
--

DROP TABLE IF EXISTS `tbl_quesmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_quesmaster` (
  `qid` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `ques` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `createddt` datetime DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  `modifieddt` datetime DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_quesmaster`
--

LOCK TABLES `tbl_quesmaster` WRITE;
/*!40000 ALTER TABLE `tbl_quesmaster` DISABLE KEYS */;
INSERT INTO `tbl_quesmaster` VALUES (1,'Question 1','Brass gets discoloured in air because of the presence of which of the following gases in air?',1,'paul',NULL,NULL,NULL),(2,'Question 2','Which of the following is a non metal that remains liquid at room temperature?',1,'paul',NULL,NULL,NULL),(3,'Question 3','Chlorophyll is a naturally occurring chelate compound in which central metal is',1,'paul',NULL,NULL,NULL),(4,'Question 4','Which of the following is used in pencils?',1,'paul',NULL,NULL,NULL),(5,'Question 5','Which of the following metals forms an amalgam with other metals?',1,'paul',NULL,NULL,NULL),(6,'Question 6','Which of the following is used for removing air bubbles from glass during its manufacture?',1,'paul',NULL,NULL,NULL),(7,'Question 7','Which of the following is a protein?',1,'paul',NULL,NULL,NULL),(8,'Question 8','Wood is the main raw material for the manufacture of',1,'paul',NULL,NULL,NULL),(9,'Question 9','Rayon is chemically',1,'paul',NULL,NULL,NULL),(10,'Question 10','Optic fibres are mainly used for which of the following?',1,'paul',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_quesmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_students`
--

DROP TABLE IF EXISTS `tbl_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_students` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `createddt` datetime DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_students`
--

LOCK TABLES `tbl_students` WRITE;
/*!40000 ALTER TABLE `tbl_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userans`
--

DROP TABLE IF EXISTS `tbl_userans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_userans` (
  `uaid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `createddt` datetime DEFAULT NULL,
  PRIMARY KEY (`uaid`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userans`
--

LOCK TABLES `tbl_userans` WRITE;
/*!40000 ALTER TABLE `tbl_userans` DISABLE KEYS */;
INSERT INTO `tbl_userans` VALUES (89,17,1,2,'2018-10-15 18:59:05'),(90,17,2,7,'2018-10-15 18:59:05'),(91,17,3,11,'2018-10-15 18:59:05'),(92,17,4,13,'2018-10-15 18:59:05'),(93,17,5,18,'2018-10-15 18:59:05'),(94,17,6,22,'2018-10-15 18:59:05'),(95,17,7,27,'2018-10-15 18:59:05'),(96,17,8,30,'2018-10-15 18:59:05'),(97,17,9,35,'2018-10-15 18:59:05'),(98,17,10,40,'2018-10-15 18:59:05'),(99,18,1,1,'2018-10-15 19:02:46'),(100,18,2,6,'2018-10-15 19:02:46'),(101,18,3,10,'2018-10-15 19:02:46'),(102,18,4,15,'2018-10-15 19:02:46'),(103,18,5,17,'2018-10-15 19:02:46'),(104,18,6,23,'2018-10-15 19:02:46'),(105,18,7,25,'2018-10-15 19:02:46'),(106,18,8,30,'2018-10-15 19:02:46'),(107,18,9,35,'2018-10-15 19:02:46'),(108,18,10,40,'2018-10-15 19:02:46'),(109,19,1,2,'2018-10-15 19:03:37'),(110,19,2,5,'2018-10-15 19:03:37'),(111,19,3,9,'2018-10-15 19:03:37'),(112,19,4,13,'2018-10-15 19:03:37'),(113,19,5,17,'2018-10-15 19:03:37'),(114,19,6,21,'2018-10-15 19:03:37'),(115,19,7,25,'2018-10-15 19:03:37'),(116,19,8,29,'2018-10-15 19:03:37'),(117,19,9,33,'2018-10-15 19:03:37'),(118,19,10,37,'2018-10-15 19:03:37'),(121,20,1,2,'2018-10-15 19:16:03'),(122,20,2,5,'2018-10-15 19:16:03'),(123,20,3,9,'2018-10-15 19:16:03'),(124,20,4,13,'2018-10-15 19:16:03'),(125,20,5,17,'2018-10-15 19:16:03'),(126,20,6,21,'2018-10-15 19:16:03'),(127,20,7,25,'2018-10-15 19:16:03'),(128,20,8,29,'2018-10-15 19:16:03'),(129,20,9,33,'2018-10-15 19:16:03'),(130,20,10,37,'2018-10-15 19:16:03'),(131,22,1,4,'2018-10-15 19:23:28'),(132,22,2,8,'2018-10-15 19:23:28'),(133,22,3,12,'2018-10-15 19:23:28'),(134,22,4,16,'2018-10-15 19:23:28'),(135,22,5,20,'2018-10-15 19:23:28'),(136,22,6,24,'2018-10-15 19:23:28'),(137,22,7,28,'2018-10-15 19:23:28'),(138,22,8,32,'2018-10-15 19:23:28'),(139,22,9,36,'2018-10-15 19:23:28'),(140,22,10,40,'2018-10-15 19:23:28'),(141,23,1,3,'2018-10-15 19:24:10'),(142,23,2,7,'2018-10-15 19:24:10'),(143,23,3,10,'2018-10-15 19:24:10'),(144,23,4,16,'2018-10-15 19:24:10'),(145,23,5,19,'2018-10-15 19:24:10'),(146,23,6,21,'2018-10-15 19:24:10'),(147,23,7,26,'2018-10-15 19:24:10'),(148,23,8,32,'2018-10-15 19:24:10'),(149,23,9,33,'2018-10-15 19:24:10'),(150,23,10,39,'2018-10-15 19:24:10'),(151,26,1,1,'2018-10-15 20:57:09'),(152,26,2,6,'2018-10-15 20:57:09'),(153,26,3,11,'2018-10-15 20:57:09'),(154,26,4,16,'2018-10-15 20:57:09'),(155,26,5,17,'2018-10-15 20:57:09'),(156,26,6,22,'2018-10-15 20:57:09'),(157,26,7,27,'2018-10-15 20:57:09'),(158,26,8,32,'2018-10-15 20:57:09'),(159,26,9,33,'2018-10-15 20:57:09'),(160,26,10,38,'2018-10-15 20:57:09'),(161,27,1,3,'2018-10-15 21:01:31'),(162,27,2,5,'2018-10-15 21:01:31'),(163,27,3,10,'2018-10-15 21:01:31'),(164,27,4,15,'2018-10-15 21:01:31'),(165,27,5,18,'2018-10-15 21:01:31'),(166,27,6,23,'2018-10-15 21:01:31'),(167,27,7,26,'2018-10-15 21:01:31'),(168,27,8,31,'2018-10-15 21:01:31'),(169,27,9,34,'2018-10-15 21:01:31'),(170,27,10,39,'2018-10-15 21:01:31'),(171,28,1,2,'2018-10-15 21:04:56'),(172,28,2,6,'2018-10-15 21:04:56'),(173,28,3,10,'2018-10-15 21:04:56'),(174,28,4,13,'2018-10-15 21:04:56'),(175,28,5,18,'2018-10-15 21:04:56'),(176,28,6,21,'2018-10-15 21:04:56'),(177,28,7,25,'2018-10-15 21:04:56'),(178,28,8,30,'2018-10-15 21:04:56'),(179,28,9,33,'2018-10-15 21:04:56'),(180,28,10,40,'2018-10-15 21:04:56'),(181,31,1,1,'2018-10-15 23:07:20'),(182,31,2,6,'2018-10-15 23:07:20'),(183,31,3,11,'2018-10-15 23:07:20'),(184,31,4,16,'2018-10-15 23:07:20'),(185,31,5,17,'2018-10-15 23:07:20'),(186,31,6,22,'2018-10-15 23:07:20'),(187,31,7,27,'2018-10-15 23:07:20'),(188,31,8,31,'2018-10-15 23:07:20'),(189,31,9,35,'2018-10-15 23:07:20'),(190,31,10,40,'2018-10-15 23:07:20');
/*!40000 ALTER TABLE `tbl_userans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quiz'
--

--
-- Dumping routines for database 'quiz'
--
/*!50003 DROP PROCEDURE IF EXISTS `usp_checkStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_checkStudent`(
IN email varchar(45)
)
BEGIN
	
		IF EXISTS (SELECT cid FROM `cemix`.`tbl_students` as s WHERE s.sname=sname)THEN
			SELECT 'Student Email Address already used|0|';
        ELSE			
			SELECT 'Student Registered |1|';
        END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getAnswers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getAnswers`()
BEGIN

	SELECT * FROM quiz.tbl_ansmaster;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getQuestions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getQuestions`()
BEGIN

	SELECT * FROM quiz.tbl_quesmaster;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getResult`(
IN sid int
)
BEGIN
	
     SELECT 
		 ua.uaid,
		 ua.sid,
         q.title as titleq,
		 ua.qid,
		 q.ques,
		 ua.aid,
		 a.ans,
		 a.title as titlea,
		 a.correct,
         ua.createddt
		 
		 FROM quiz.tbl_userans as ua
		 
		 LEFT OUTER JOIN quiz.tbl_ansmaster as a
		 ON ua.aid=a.aid
		 
		 LEFT OUTER JOIN quiz.tbl_quesmaster as q
		 ON ua.qid=q.qid
		 
		 WHERE ua.sid=sid;
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getResults`(

)
BEGIN
	
     SELECT 
		 ua.uaid,
		 ua.sid,
         q.title as titleq,
		 ua.qid,
		 q.ques,
		 ua.aid,
		 a.ans,
		 a.title as titlea,
		 a.correct,
         ua.createddt
		 
		 FROM quiz.tbl_userans as ua
		 
		 LEFT OUTER JOIN quiz.tbl_ansmaster as a
		 ON ua.aid=a.aid
		 
		 LEFT OUTER JOIN quiz.tbl_quesmaster as q
		 ON ua.qid=q.qid;
		 
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getStudents`()
BEGIN

	SELECT * FROM quiz.tbl_students;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Login`(
IN user varchar(45),
IN pass varchar(45)

)
BEGIN


		IF EXISTS (SELECT e.eid FROM `quiz`.`tbl_employee` as e WHERE e.user=user AND e.pass=pass)THEN
			SELECT 'Success|1',(SELECT e.eid FROM `quiz`.`tbl_employee` as e WHERE e.user=user AND e.pass=pass);
        ELSE
			SELECT 'Username/Password Invalid !|0',0;
        END IF;

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_setStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_setStudent`(
IN sname varchar(45),
IN email varchar(45),
IN gender boolean,
IN contactno bigint(11),
IN createddt datetime
)
BEGIN


		IF EXISTS (SELECT sname FROM `quiz`.`tbl_students` as s WHERE s.email=email)THEN
			SELECT 'Student Email-ID already exists|0' ,0;
        ELSE
			INSERT INTO `quiz`.`tbl_students` (`sid`, `sname`, `email`, `gender`,`contactno`, `createddt`) 
            VALUES (0, sname, email, gender,contactno, createddt);
			SELECT 'Registered !|1',  s.sid FROM `quiz`.`tbl_students` as s WHERE s.sname=sname;
        END IF;

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_submitAns` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_submitAns`(
IN uaid int,
IN sid int,
IN qid int,
IN aid int,
IN createddt datetime
)
BEGIN
			IF EXISTS (SELECT uaid FROM `quiz`.`tbl_userans` as ua WHERE ua.qid=qid AND ua.sid=sid)THEN
			SELECT 'Answers already Submitted !|0' ,0;
            
            ELSE
            
			INSERT INTO `quiz`.`tbl_userans` (`uaid`, `sid`, `qid`, `aid`,`createddt`) 
            VALUES (uaid, sid, qid, aid, createddt);
			SELECT 'Answers Submitted |1',  ua.sid FROM `quiz`.`tbl_userans` as ua WHERE ua.sid=sid AND ua.qid=qid;
			END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-15 23:48:12
