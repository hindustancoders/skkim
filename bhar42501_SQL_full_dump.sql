-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: bhar42501_SQL
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_audit_log`
--

DROP TABLE IF EXISTS `admin_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(60) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `details` text,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_audit_log`
--

LOCK TABLES `admin_audit_log` WRITE;
/*!40000 ALTER TABLE `admin_audit_log` DISABLE KEYS */;
INSERT INTO `admin_audit_log` VALUES (2,'1234567890','watchpay_balance_check','account=1 mch=222887002 ok=0','127.0.0.1','2026-11-19 08:49:44'),(3,'1234567890','banner_add','Test Promo Banner','127.0.0.1','2026-11-19 08:51:05'),(4,'1234567890','banner_delete','id=1 url=/banner/bharat_banner_1_70extra.jpg','127.0.0.1','2026-11-19 08:51:18'),(5,'1234567890','chat_message_delete','message_id=5','127.0.0.1','2026-11-19 08:52:54'),(6,'1234567890','export_users_csv','','127.0.0.1','2026-11-19 08:53:12'),(7,'1234567890','export_users_csv','','127.0.0.1','2026-11-19 08:53:24'),(8,'1234567890','export_users_csv','','127.0.0.1','2026-11-19 08:53:24'),(9,'admin','deposit_approve','user=22 amount=100 sid=17','127.0.0.1','2026-11-19 08:58:54'),(11,'admin','deposit_approve','user=26 amount=100 sid=28','127.0.0.1','2026-11-19 10:06:03'),(12,'1234567890','watchpay_balance_check','account=1 mch=222887002 ok=0','21.0.0.1','2026-11-19 12:48:19'),(13,'admin','deposit_approve','user=29 amount=300 sid=46','21.0.0.1','2026-11-19 13:30:31');
/*!40000 ALTER TABLE `admin_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `unohs` int NOT NULL AUTO_INCREMENT,
  `hesaru` varchar(255) NOT NULL,
  `nirvahaka_hesaru` varchar(255) NOT NULL,
  `guptapada` varchar(255) NOT NULL,
  `sthiti` smallint NOT NULL,
  `secret_key` varchar(100) DEFAULT NULL,
  `dashboard` smallint NOT NULL DEFAULT '1',
  `wingomanager` smallint NOT NULL DEFAULT '1',
  `k3manager` smallint NOT NULL DEFAULT '1',
  `5dmanager` smallint NOT NULL DEFAULT '1',
  `finance` smallint NOT NULL DEFAULT '1',
  `support` int NOT NULL DEFAULT '0',
  `managegame` smallint NOT NULL DEFAULT '1',
  `manageagent` smallint NOT NULL,
  PRIMARY KEY (`unohs`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='Admin panel login accounts (username + password + module permissions)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'1234567890','1234567890','0192023a7bbd73250516f069df18b500',1,'KT674OW6YUNQ7DHH',1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_bonus_table`
--

DROP TABLE IF EXISTS `agent_bonus_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_bonus_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 124: agent bonus queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_bonus_table`
--

LOCK TABLES `agent_bonus_table` WRITE;
/*!40000 ALTER TABLE `agent_bonus_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_bonus_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_red_envelope_recharge_table`
--

DROP TABLE IF EXISTS `agent_red_envelope_recharge_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_red_envelope_recharge_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 8: agent red-envelope recharge queue (cron credits user wallet)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_red_envelope_recharge_table`
--

LOCK TABLES `agent_red_envelope_recharge_table` WRITE;
/*!40000 ALTER TABLE `agent_red_envelope_recharge_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_red_envelope_recharge_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_salary_records`
--

DROP TABLE IF EXISTS `agent_salary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_salary_records` (
  `macau` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(500) NOT NULL DEFAULT '0',
  `totalsucrech` varchar(500) NOT NULL DEFAULT '0',
  `totalfailrech` varchar(500) NOT NULL DEFAULT '0',
  `tsruser` varchar(500) NOT NULL DEFAULT '0',
  `tfruser` varchar(500) NOT NULL DEFAULT '0',
  `totalsucbet` varchar(500) NOT NULL DEFAULT '0',
  `tsbuser` varchar(500) NOT NULL DEFAULT '0',
  `totalfailbet` varchar(500) NOT NULL DEFAULT '0',
  `tfbuser` varchar(500) NOT NULL DEFAULT '0',
  `salary` varchar(500) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`macau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Generated agent salary statements with activity stats + approval';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_salary_records`
--

LOCK TABLES `agent_salary_records` WRITE;
/*!40000 ALTER TABLE `agent_salary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_salary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `salary` int NOT NULL DEFAULT '0',
  `createdate` varchar(200) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Agent/salary assignments (user, type day/week/month, salary amount)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banned_users`
--

DROP TABLE IF EXISTS `banned_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banned_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Users banned from playing (user id + reason)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banned_users`
--

LOCK TABLES `banned_users` WRITE;
/*!40000 ALTER TABLE `banned_users` DISABLE KEYS */;
INSERT INTO `banned_users` VALUES (1,'3312','Placed bets on multiple types in the same period (Period: 20250206100020280)','2026-11-18 07:42:00'),(2,'6353','Placed bets on multiple types in the same period (Period: 20250205100020235)','2026-11-18 07:42:00'),(3,'19432','Placed bets on multiple types in the same period (Period: 20250206100020254)','2026-11-18 07:42:00'),(4,'19775','Placed bets on multiple types in the same period (Period: 20250206100020254)','2026-11-18 07:42:00'),(5,'23767','Placed bets on multiple types in the same period (Period: 20250207100030134)','2026-11-18 07:42:00'),(6,'35018','Placed bets on multiple types in the same period (Period: 20250206100030165)','2026-11-18 07:42:00'),(7,'51181','Placed bets on multiple types in the same period (Period: 20250205100020274)','2026-11-18 07:42:00'),(8,'54502','Placed bets on multiple types in the same period (Period: 20250205100020233)','2026-11-18 07:42:00'),(9,'54697','Placed bets on multiple types in the same period (Period: 20250205100020241)','2026-11-18 07:42:00'),(10,'54809','Placed bets on multiple types in the same period (Period: 20250205100020243)','2026-11-18 07:42:00'),(11,'55041','Placed bets on multiple types in the same period (Period: 20250205100020251)','2026-11-18 07:42:00'),(12,'55714','Placed bets on multiple types in the same period (Period: 20250205100020258)','2026-11-18 07:42:00'),(13,'55861','Placed bets on multiple types in the same period (Period: 20250205100020262)','2026-11-18 07:42:00'),(14,'56518','Placed bets on multiple types in the same period (Period: 20250205100020276)','2026-11-18 07:42:00'),(15,'56580','Placed bets on multiple types in the same period (Period: 20250205100020276)','2026-11-18 07:42:00'),(16,'57359','Placed bets on multiple types in the same period (Period: 20250205100020290)','2026-11-18 07:42:00'),(17,'57708','Placed bets on multiple types in the same period (Period: 20250205100020309)','2026-11-18 07:42:00'),(18,'57875','Placed bets on multiple types in the same period (Period: 20250205100020309)','2026-11-18 07:42:00'),(19,'57898','Placed bets on multiple types in the same period (Period: 20250205100020302)','2026-11-18 07:42:00'),(20,'58063','Placed bets on multiple types in the same period (Period: 20250205100020309)','2026-11-18 07:42:00'),(21,'58200','Placed bets on multiple types in the same period (Period: 20250205100020309)','2026-11-18 07:42:00'),(22,'59279','Placed bets on multiple types in the same period (Period: 20250205100020329)','2026-11-18 07:42:00'),(23,'59676','Placed bets on multiple types in the same period (Period: 20250205100020335)','2026-11-18 07:42:00'),(24,'60012','Placed bets on multiple types in the same period (Period: 20250205100020342)','2026-11-18 07:42:00'),(25,'60294','Placed bets on multiple types in the same period (Period: 20250205100020374)','2026-11-18 07:42:00'),(26,'60942','Placed bets on multiple types in the same period (Period: 20250205100020361)','2026-11-18 07:42:00'),(27,'61527','Placed bets on multiple types in the same period (Period: 20250205100020408)','2026-11-18 07:42:00'),(28,'61987','Placed bets on multiple types in the same period (Period: 20250205100020385)','2026-11-18 07:42:00'),(29,'61997','Placed bets on multiple types in the same period (Period: 20250205100020385)','2026-11-18 07:42:00'),(30,'62001','Placed bets on multiple types in the same period (Period: 20250205100020385)','2026-11-18 07:42:00'),(31,'62206','Placed bets on multiple types in the same period (Period: 20250206100020025)','2026-11-18 07:42:00'),(32,'62314','Placed bets on multiple types in the same period (Period: 20250206100020025)','2026-11-18 07:42:00'),(33,'62583','Placed bets on multiple types in the same period (Period: 20250206100020025)','2026-11-18 07:42:00'),(34,'62586','Placed bets on multiple types in the same period (Period: 20250206100020025)','2026-11-18 07:42:00'),(35,'62602','Placed bets on multiple types in the same period (Period: 20250206100020025)','2026-11-18 07:42:00'),(36,'63567','Placed bets on multiple types in the same period (Period: 20250206100020008)','2026-11-18 07:42:00'),(37,'64211','Placed bets on multiple types in the same period (Period: 20250206100020031)','2026-11-18 07:42:00'),(38,'64984','Placed bets on multiple types in the same period (Period: 20250206100020083)','2026-11-18 07:42:00'),(39,'66293','Placed bets on multiple types in the same period (Period: 20250206100020332)','2026-11-18 07:42:00'),(40,'66529','Placed bets on multiple types in the same period (Period: 20250206100020192)','2026-11-18 07:42:00'),(41,'66798','Placed bets on multiple types in the same period (Period: 20250206100020201)','2026-11-18 07:42:00'),(42,'67686','Placed bets on multiple types in the same period (Period: 20250206100020251)','2026-11-18 07:42:00'),(43,'68090','Placed bets on multiple types in the same period (Period: 20250206100020244)','2026-11-18 07:42:00'),(44,'68286','Placed bets on multiple types in the same period (Period: 20250206100020280)','2026-11-18 07:42:00'),(45,'68350','Placed bets on multiple types in the same period (Period: 20250207100020225)','2026-11-18 07:42:00'),(46,'68410','Placed bets on multiple types in the same period (Period: 20250206100020256)','2026-11-18 07:42:00'),(47,'69463','Placed bets on multiple types in the same period (Period: 20250206100030175)','2026-11-18 07:42:00'),(48,'71704','Placed bets on multiple types in the same period (Period: 20250206100020345)','2026-11-18 07:42:00'),(49,'71712','Placed bets on multiple types in the same period (Period: 20250206100020345)','2026-11-18 07:42:00'),(50,'71721','Placed bets on multiple types in the same period (Period: 20250207100020288)','2026-11-18 07:42:00'),(51,'71903','Placed bets on multiple types in the same period (Period: 20250206100030195)','2026-11-18 07:42:00'),(52,'72028','Placed bets on multiple types in the same period (Period: 20250206100030198)','2026-11-18 07:42:00'),(53,'72261','Placed bets on multiple types in the same period (Period: 20250206100020361)','2026-11-18 07:42:00'),(54,'72277','Placed bets on multiple types in the same period (Period: 20250206100020361)','2026-11-18 07:42:00'),(55,'72292','Placed bets on multiple types in the same period (Period: 20250206100020361)','2026-11-18 07:42:00'),(56,'72595','Placed bets on multiple types in the same period (Period: 20250206100020374)','2026-11-18 07:42:00'),(57,'73074','Placed bets on multiple types in the same period (Period: 20250206100030216)','2026-11-18 07:42:00'),(58,'73428','Placed bets on multiple types in the same period (Period: 20250206100030226)','2026-11-18 07:42:00'),(59,'73434','Placed bets on multiple types in the same period (Period: 20250206100030226)','2026-11-18 07:42:00'),(60,'73505','Placed bets on multiple types in the same period (Period: 20250207100020016)','2026-11-18 07:42:00'),(61,'74094','Placed bets on multiple types in the same period (Period: 20250207100030014)','2026-11-18 07:42:00'),(62,'74945','Placed bets on multiple types in the same period (Period: 20250207100020073)','2026-11-18 07:42:00'),(63,'74957','Placed bets on multiple types in the same period (Period: 20250207100020074)','2026-11-18 07:42:00'),(64,'74959','Placed bets on multiple types in the same period (Period: 20250207100020074)','2026-11-18 07:42:00'),(65,'74971','Placed bets on multiple types in the same period (Period: 20250207100020075)','2026-11-18 07:42:00'),(66,'74984','Placed bets on multiple types in the same period (Period: 20250207100020076)','2026-11-18 07:42:00'),(67,'74987','Placed bets on multiple types in the same period (Period: 20250207100020076)','2026-11-18 07:42:00'),(68,'76037','Placed bets on multiple types in the same period (Period: 20250207100020194)','2026-11-18 07:42:00'),(69,'76346','Placed bets on multiple types in the same period (Period: 20250207100030124)','2026-11-18 07:42:00'),(70,'76504','Placed bets on multiple types in the same period (Period: 20250207100020231)','2026-11-18 07:42:00'),(71,'76509','Placed bets on multiple types in the same period (Period: 20250207100020223)','2026-11-18 07:42:00'),(72,'76726','Placed bets on multiple types in the same period (Period: 20250207100030132)','2026-11-18 07:42:00'),(73,'76806','Placed bets on multiple types in the same period (Period: 20250207100030134)','2026-11-18 07:42:00'),(74,'76913','Placed bets on multiple types in the same period (Period: 20250207100020233)','2026-11-18 07:42:00'),(75,'77064','Placed bets on multiple types in the same period (Period: 20250207100030140)','2026-11-18 07:42:00'),(76,'77096','Placed bets on multiple types in the same period (Period: 20250207100020239)','2026-11-18 07:42:00'),(77,'77206','Placed bets on multiple types in the same period (Period: 20250207100020245)','2026-11-18 07:42:00'),(78,'77453','Placed bets on multiple types in the same period (Period: 20250207100020264)','2026-11-18 07:42:00'),(79,'77510','Placed bets on multiple types in the same period (Period: 20250207100020256)','2026-11-18 07:42:00'),(80,'77623','Placed bets on multiple types in the same period (Period: 20250207100030152)','2026-11-18 07:42:00'),(81,'77630','Placed bets on multiple types in the same period (Period: 20250207100030152)','2026-11-18 07:42:00'),(82,'77657','Placed bets on multiple types in the same period (Period: 20250207100020271)','2026-11-18 07:42:00'),(83,'78110','Placed bets on multiple types in the same period (Period: 20250207100030160)','2026-11-18 07:42:00'),(84,'78351','Placed bets on multiple types in the same period (Period: 20250207100020283)','2026-11-18 07:42:00');
/*!40000 ALTER TABLE `banned_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_credit_records`
--

DROP TABLE IF EXISTS `bonus_credit_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_credit_records` (
  `kani` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL,
  `serial` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `shonu` varchar(200) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`kani`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Bonus credits granted to users (red-envelope, gift, manual bonus)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_credit_records`
--

LOCK TABLES `bonus_credit_records` WRITE;
/*!40000 ALTER TABLE `bonus_credit_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_credit_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_recharge_table`
--

DROP TABLE IF EXISTS `bonus_recharge_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_recharge_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 13: bonus recharge queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_recharge_table`
--

LOCK TABLES `bonus_recharge_table` WRITE;
/*!40000 ALTER TABLE `bonus_recharge_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_recharge_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_binding_gift_table`
--

DROP TABLE IF EXISTS `card_binding_gift_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_binding_gift_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 25: card-binding gift queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_binding_gift_table`
--

LOCK TABLES `card_binding_gift_table` WRITE;
/*!40000 ALTER TABLE `card_binding_gift_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_binding_gift_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crash_bets`
--

DROP TABLE IF EXISTS `crash_bets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crash_bets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(211) NOT NULL,
  `amount` int NOT NULL,
  `status` varchar(211) NOT NULL DEFAULT 'pending',
  `winpoint` varchar(211) NOT NULL DEFAULT '0.00',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Crash/Aviator game bets per user (amount, status, win point)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crash_bets`
--

LOCK TABLES `crash_bets` WRITE;
/*!40000 ALTER TABLE `crash_bets` DISABLE KEYS */;
/*!40000 ALTER TABLE `crash_bets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crash_manual_crashpoint`
--

DROP TABLE IF EXISTS `crash_manual_crashpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crash_manual_crashpoint` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crashpoint` varchar(211) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Single-row manual crash-point control for Aviator (admin sets)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crash_manual_crashpoint`
--

LOCK TABLES `crash_manual_crashpoint` WRITE;
/*!40000 ALTER TABLE `crash_manual_crashpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `crash_manual_crashpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crash_round_history`
--

DROP TABLE IF EXISTS `crash_round_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crash_round_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(211) NOT NULL,
  `crashpoint` varchar(211) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Crash game per-round results (username, crash point)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crash_round_history`
--

LOCK TABLES `crash_round_history` WRITE;
/*!40000 ALTER TABLE `crash_round_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `crash_round_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_awards_table`
--

DROP TABLE IF EXISTS `daily_awards_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_awards_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 118: daily awards queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_awards_table`
--

LOCK TABLES `daily_awards_table` WRITE;
/*!40000 ALTER TABLE `daily_awards_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_awards_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_checkin_records`
--

DROP TABLE IF EXISTS `daily_checkin_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_checkin_records` (
  `dearlord` int NOT NULL AUTO_INCREMENT,
  `identity` int NOT NULL,
  `daysonearth` varchar(200) NOT NULL,
  `todayblessings` varchar(200) NOT NULL,
  `totalblessings` varchar(200) NOT NULL,
  `amen` varchar(200) NOT NULL,
  PRIMARY KEY (`dearlord`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Continuous daily check-in (sign-in) records per user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_checkin_records`
--

LOCK TABLES `daily_checkin_records` WRITE;
/*!40000 ALTER TABLE `daily_checkin_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_checkin_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_users`
--

DROP TABLE IF EXISTS `demo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_users` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `balakedara` int NOT NULL,
  `motta` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sthiti` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`kramasankhye`),
  KEY `idx_demo` (`balakedara`,`motta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Demo/test user accounts created from admin panel (fake balances)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_users`
--

LOCK TABLES `demo_users` WRITE;
/*!40000 ALTER TABLE `demo_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_suspensions`
--

DROP TABLE IF EXISTS `deposit_suspensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit_suspensions` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kebetiari` varchar(200) NOT NULL,
  `sthiti` int NOT NULL,
  PRIMARY KEY (`kramasankhye`),
  KEY `byabaharkarta` (`byabaharkarta`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Per-user deposit block/suspension list (checked before creating deposits)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_suspensions`
--

LOCK TABLES `deposit_suspensions` WRITE;
/*!40000 ALTER TABLE `deposit_suspensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit_suspensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `balakedara` int NOT NULL DEFAULT '0',
  `motta` varchar(200) NOT NULL DEFAULT '0',
  `dharavahi` varchar(200) NOT NULL DEFAULT '',
  `mula` varchar(200) NOT NULL,
  `payid` int NOT NULL DEFAULT '0',
  `ullekha` varchar(200) NOT NULL,
  `duravani` varchar(200) NOT NULL,
  `ekikrtapavati` varchar(200) NOT NULL,
  `dinankavannuracisi` varchar(200) NOT NULL,
  `madari` int NOT NULL DEFAULT '0',
  `pavatiaidi` int NOT NULL DEFAULT '0',
  `pay_acct_id` int NOT NULL DEFAULT '0',
  `pay_type_code` varchar(20) NOT NULL DEFAULT '',
  `sthiti` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COMMENT='Deposit requests/orders (amount, gateway, UTR, UPI used, approval status)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (3,11,'100.00','WP202611191300064756','WatchPays',2,'20000928723133','9000000007','WatchPays','2026-11-19 13:00:06',1023,2,0,'',1),(22,3,'500','WP202611191436529957','WatchPay',2,'','9000000001','WatchPay','2026-11-19 14:36:52',1023,2,1,'101',2),(33,29,'500','WPSIM202611191314438567','WatchPay',2,'GP952521','99900','WatchPay','2026-11-19 13:14:43',1023,2,1,'101',1),(34,29,'300','WPSIM202611191314438321','WatchPay',2,'','99900','WatchPay','2026-11-19 13:14:43',1023,2,1,'101',0),(35,29,'200','WPSIM202611191314437349','WatchPay',2,'GP651522','99900','WatchPay','2026-11-19 13:14:43',1023,2,1,'101',2),(36,30,'200','QPSIM202611191844436549','QwackPay',3,'QWPAYIN927518 UTR:UTRSIM397112','9990063743','QwackPay','2026-11-19 13:14:43',1024,2,1,'681551699',1),(37,29,'500','WPSIM202611191315202521','WatchPay',2,'GP435489','99900','WatchPay','2026-11-19 13:15:20',1023,2,1,'101',1),(38,29,'300','WPSIM202611191315207732','WatchPay',2,'','99900','WatchPay','2026-11-19 13:15:20',1023,2,1,'101',0),(39,29,'200','WPSIM202611191315209115','WatchPay',2,'GP994442','99900','WatchPay','2026-11-19 13:15:20',1023,2,1,'101',2),(40,31,'200','QPSIM202611191845208244','QwackPay',3,'QWPAYIN328263 UTR:UTRSIM447895','9990042593','QwackPay','2026-11-19 13:15:20',1024,2,1,'681551699',1),(41,29,'500','WPSIM202611191317147227','WatchPay',2,'GP139010','99900','WatchPay','2026-11-19 13:17:14',1023,2,1,'101',1),(42,29,'300','WPSIM202611191317146101','WatchPay',2,'','99900','WatchPay','2026-11-19 13:17:14',1023,2,1,'101',0),(43,29,'200','WPSIM202611191317142269','WatchPay',2,'GP736172','99900','WatchPay','2026-11-19 13:17:14',1023,2,1,'101',2),(44,32,'200','QPSIM202611191847143225','QwackPay',3,'QWPAYIN793381 UTR:UTRSIM600930','9990069609','QwackPay','2026-11-19 13:17:14',1024,2,1,'681551699',1),(45,29,'500','WPSIM202611191319372603','WatchPay',2,'GP695197','99900','WatchPay','2026-11-19 13:19:37',1023,2,1,'101',1),(46,29,'300','WPSIM202611191319379131','WatchPay',2,'','99900','WatchPay','2026-11-19 13:19:37',1023,2,1,'101',1),(47,29,'200','WPSIM202611191319378079','WatchPay',2,'GP260045','99900','WatchPay','2026-11-19 13:19:37',1023,2,1,'101',2),(48,33,'200','QPSIM202611191849374817','QwackPay',3,'QWPAYIN472226 UTR:UTRSIM246873','9990052785','QwackPay','2026-11-19 13:19:37',1024,2,1,'681551699',1),(49,29,'500','WP202611191851266017','WatchPay',2,'','9990012345','WatchPay','2026-11-19 18:51:26',1023,2,1,'101',2);
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_full_gift_table`
--

DROP TABLE IF EXISTS `first_full_gift_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `first_full_gift_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 14: first-full-recharge gift queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_full_gift_table`
--

LOCK TABLES `first_full_gift_table` WRITE;
/*!40000 ALTER TABLE `first_full_gift_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_full_gift_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_recharge_bonus_records`
--

DROP TABLE IF EXISTS `first_recharge_bonus_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `first_recharge_bonus_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dr` varchar(300) NOT NULL,
  `sturgis` varchar(300) NOT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='First-recharge bonus grants per user (amount + status)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_recharge_bonus_records`
--

LOCK TABLES `first_recharge_bonus_records` WRITE;
/*!40000 ALTER TABLE `first_recharge_bonus_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_recharge_bonus_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_bets_10min`
--

DROP TABLE IF EXISTS `fived_bets_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_bets_10min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` varchar(255) DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='5D lottery 10-min game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_bets_10min`
--

LOCK TABLES `fived_bets_10min` WRITE;
/*!40000 ALTER TABLE `fived_bets_10min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_bets_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_bets_1min`
--

DROP TABLE IF EXISTS `fived_bets_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_bets_1min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` varchar(255) DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='5D lottery 1-min game: individual user bets (A/B/C/D/E positions, big/small)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_bets_1min`
--

LOCK TABLES `fived_bets_1min` WRITE;
/*!40000 ALTER TABLE `fived_bets_1min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_bets_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_bets_3min`
--

DROP TABLE IF EXISTS `fived_bets_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_bets_3min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` varchar(255) DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='5D lottery 3-min game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_bets_3min`
--

LOCK TABLES `fived_bets_3min` WRITE;
/*!40000 ALTER TABLE `fived_bets_3min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_bets_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_bets_5min`
--

DROP TABLE IF EXISTS `fived_bets_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_bets_5min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` varchar(255) DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='5D lottery 5-min game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_bets_5min`
--

LOCK TABLES `fived_bets_5min` WRITE;
/*!40000 ALTER TABLE `fived_bets_5min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_bets_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_manual_result_10min`
--

DROP TABLE IF EXISTS `fived_manual_result_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_manual_result_10min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='5D lottery 10-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_manual_result_10min`
--

LOCK TABLES `fived_manual_result_10min` WRITE;
/*!40000 ALTER TABLE `fived_manual_result_10min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_manual_result_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_manual_result_1min`
--

DROP TABLE IF EXISTS `fived_manual_result_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_manual_result_1min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='5D lottery 1-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_manual_result_1min`
--

LOCK TABLES `fived_manual_result_1min` WRITE;
/*!40000 ALTER TABLE `fived_manual_result_1min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_manual_result_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_manual_result_3min`
--

DROP TABLE IF EXISTS `fived_manual_result_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_manual_result_3min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='5D lottery 3-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_manual_result_3min`
--

LOCK TABLES `fived_manual_result_3min` WRITE;
/*!40000 ALTER TABLE `fived_manual_result_3min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_manual_result_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_manual_result_5min`
--

DROP TABLE IF EXISTS `fived_manual_result_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_manual_result_5min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='5D lottery 5-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_manual_result_5min`
--

LOCK TABLES `fived_manual_result_5min` WRITE;
/*!40000 ALTER TABLE `fived_manual_result_5min` DISABLE KEYS */;
/*!40000 ALTER TABLE `fived_manual_result_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_periods_10min`
--

DROP TABLE IF EXISTS `fived_periods_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_periods_10min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='5D lottery 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_10min`
--

LOCK TABLES `fived_periods_10min` WRITE;
/*!40000 ALTER TABLE `fived_periods_10min` DISABLE KEYS */;
INSERT INTO `fived_periods_10min` VALUES (2,'20261119102040078','2026-11-19 12:50:00'),(3,'20261119102040079','2026-11-19 13:00:01'),(4,'20261119102040080','2026-11-19 13:10:00'),(5,'20261119102040081','2026-11-19 13:20:01'),(6,'20261119102040082','2026-11-19 13:30:01'),(7,'20261119102040083','2026-11-19 13:40:01'),(8,'20261119102040084','2026-11-19 13:50:01'),(9,'20261119102040085','2026-11-19 14:00:02'),(10,'20261119102040086','2026-11-19 14:10:00'),(11,'20261119102040087','2026-11-19 14:20:01'),(12,'20261119102040088','2026-11-19 14:40:00'),(13,'20261119102040089','2026-11-19 14:50:00'),(14,'20261119102040090','2026-11-19 15:00:01'),(15,'20261119102040091','2026-11-19 15:10:00'),(16,'20261119102040092','2026-11-19 15:20:01'),(17,'20261119102040093','2026-11-19 15:30:02'),(18,'20261119102040094','2026-11-19 17:50:21'),(19,'20261119102040095','2026-11-19 18:00:17'),(20,'20261119102040096','2026-11-19 18:10:11'),(21,'20261119102040097','2026-11-19 18:10:57'),(22,'20261119102040098','2026-11-19 18:20:07'),(23,'20261119102040099','2026-11-19 18:20:53'),(24,'20261119102040100','2026-11-19 18:30:03'),(25,'20261119102040101','2026-11-19 18:30:49'),(26,'20261119102040102','2026-11-19 18:40:44'),(27,'20261119102040103','2026-11-19 18:50:39'),(28,'20261119102040104','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `fived_periods_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_periods_1min`
--

DROP TABLE IF EXISTS `fived_periods_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_periods_1min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=304 DEFAULT CHARSET=latin1 COMMENT='5D lottery 1-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_1min`
--

LOCK TABLES `fived_periods_1min` WRITE;
/*!40000 ALTER TABLE `fived_periods_1min` DISABLE KEYS */;
INSERT INTO `fived_periods_1min` VALUES (12,'20261119102010752','2026-11-19 12:31:12'),(13,'20261119102010753','2026-11-19 12:33:08'),(14,'20261119102010754','2026-11-19 12:34:23'),(15,'20261119102010755','2026-11-19 12:34:55'),(16,'20261119102010756','2026-11-19 12:44:01'),(17,'20261119102010757','2026-11-19 12:45:00'),(18,'20261119102010758','2026-11-19 12:46:00'),(19,'20261119102010759','2026-11-19 12:47:00'),(20,'20261119102010760','2026-11-19 12:48:00'),(21,'20261119102010761','2026-11-19 12:49:00'),(22,'20261119102010762','2026-11-19 12:50:00'),(23,'20261119102010763','2026-11-19 12:51:00'),(24,'20261119102010764','2026-11-19 12:52:00'),(25,'20261119102010765','2026-11-19 12:53:00'),(26,'20261119102010766','2026-11-19 12:54:00'),(27,'20261119102010767','2026-11-19 12:55:00'),(28,'20261119102010768','2026-11-19 12:56:00'),(29,'20261119102010769','2026-11-19 12:57:00'),(30,'20261119102010770','2026-11-19 12:58:00'),(31,'20261119102010771','2026-11-19 12:59:00'),(32,'20261119102010772','2026-11-19 13:00:00'),(33,'20261119102010773','2026-11-19 13:01:00'),(34,'20261119102010774','2026-11-19 13:02:00'),(35,'20261119102010775','2026-11-19 13:03:00'),(36,'20261119102010776','2026-11-19 13:04:00'),(37,'20261119102010777','2026-11-19 13:05:00'),(38,'20261119102010778','2026-11-19 13:06:00'),(39,'20261119102010779','2026-11-19 13:07:00'),(40,'20261119102010780','2026-11-19 13:08:00'),(41,'20261119102010781','2026-11-19 13:09:00'),(42,'20261119102010782','2026-11-19 13:10:00'),(43,'20261119102010783','2026-11-19 13:11:00'),(44,'20261119102010784','2026-11-19 13:12:00'),(45,'20261119102010785','2026-11-19 13:13:00'),(46,'20261119102010786','2026-11-19 13:14:00'),(47,'20261119102010787','2026-11-19 13:15:00'),(48,'20261119102010788','2026-11-19 13:16:00'),(49,'20261119102010789','2026-11-19 13:17:00'),(50,'20261119102010790','2026-11-19 13:18:00'),(51,'20261119102010791','2026-11-19 13:19:00'),(52,'20261119102010792','2026-11-19 13:20:00'),(53,'20261119102010793','2026-11-19 13:21:00'),(54,'20261119102010794','2026-11-19 13:22:00'),(55,'20261119102010795','2026-11-19 13:23:00'),(56,'20261119102010796','2026-11-19 13:24:00'),(57,'20261119102010797','2026-11-19 13:25:00'),(58,'20261119102010798','2026-11-19 13:26:00'),(59,'20261119102010799','2026-11-19 13:27:00'),(60,'20261119102010800','2026-11-19 13:28:00'),(61,'20261119102010801','2026-11-19 13:29:00'),(62,'20261119102010802','2026-11-19 13:30:00'),(63,'20261119102010803','2026-11-19 13:31:00'),(64,'20261119102010804','2026-11-19 13:32:00'),(65,'20261119102010805','2026-11-19 13:33:00'),(66,'20261119102010806','2026-11-19 13:34:00'),(67,'20261119102010807','2026-11-19 13:35:00'),(68,'20261119102010808','2026-11-19 13:36:00'),(69,'20261119102010809','2026-11-19 13:37:00'),(70,'20261119102010810','2026-11-19 13:38:00'),(71,'20261119102010811','2026-11-19 13:39:00'),(72,'20261119102010812','2026-11-19 13:40:00'),(73,'20261119102010813','2026-11-19 13:41:00'),(74,'20261119102010814','2026-11-19 13:42:00'),(75,'20261119102010815','2026-11-19 13:43:00'),(76,'20261119102010816','2026-11-19 13:44:00'),(77,'20261119102010817','2026-11-19 13:45:00'),(78,'20261119102010818','2026-11-19 13:46:00'),(79,'20261119102010819','2026-11-19 13:47:00'),(80,'20261119102010820','2026-11-19 13:48:00'),(81,'20261119102010821','2026-11-19 13:49:00'),(82,'20261119102010822','2026-11-19 13:50:00'),(83,'20261119102010823','2026-11-19 13:51:00'),(84,'20261119102010824','2026-11-19 13:52:00'),(85,'20261119102010825','2026-11-19 13:53:00'),(86,'20261119102010826','2026-11-19 13:54:00'),(87,'20261119102010827','2026-11-19 13:55:00'),(88,'20261119102010828','2026-11-19 13:56:00'),(89,'20261119102010829','2026-11-19 13:57:00'),(90,'20261119102010830','2026-11-19 13:58:00'),(91,'20261119102010831','2026-11-19 13:59:00'),(92,'20261119102010832','2026-11-19 14:00:00'),(93,'20261119102010833','2026-11-19 14:01:00'),(94,'20261119102010834','2026-11-19 14:02:00'),(95,'20261119102010835','2026-11-19 14:03:00'),(96,'20261119102010836','2026-11-19 14:04:00'),(97,'20261119102010837','2026-11-19 14:05:00'),(98,'20261119102010838','2026-11-19 14:06:00'),(99,'20261119102010839','2026-11-19 14:07:00'),(100,'20261119102010840','2026-11-19 14:08:00'),(101,'20261119102010841','2026-11-19 14:09:00'),(102,'20261119102010842','2026-11-19 14:10:00'),(103,'20261119102010843','2026-11-19 14:11:00'),(104,'20261119102010844','2026-11-19 14:12:00'),(105,'20261119102010845','2026-11-19 14:13:00'),(106,'20261119102010846','2026-11-19 14:14:00'),(107,'20261119102010847','2026-11-19 14:15:00'),(108,'20261119102010848','2026-11-19 14:16:00'),(109,'20261119102010849','2026-11-19 14:17:00'),(110,'20261119102010850','2026-11-19 14:18:00'),(111,'20261119102010851','2026-11-19 14:19:00'),(112,'20261119102010852','2026-11-19 14:20:00'),(113,'20261119102010853','2026-11-19 14:21:00'),(114,'20261119102010854','2026-11-19 14:22:00'),(115,'20261119102010855','2026-11-19 14:23:00'),(116,'20261119102010856','2026-11-19 14:24:00'),(117,'20261119102010857','2026-11-19 14:25:00'),(118,'20261119102010858','2026-11-19 14:26:00'),(119,'20261119102010859','2026-11-19 14:27:00'),(120,'20261119102010860','2026-11-19 14:28:00'),(121,'20261119102010861','2026-11-19 14:29:00'),(122,'20261119102010862','2026-11-19 14:29:04'),(123,'20261119102010863','2026-11-19 14:29:11'),(124,'20261119102010864','2026-11-19 14:29:23'),(125,'20261119102010865','2026-11-19 14:30:00'),(126,'20261119102010866','2026-11-19 14:31:00'),(127,'20261119102010867','2026-11-19 14:32:00'),(128,'20261119102010868','2026-11-19 14:33:00'),(129,'20261119102010869','2026-11-19 14:34:00'),(130,'20261119102010870','2026-11-19 14:35:00'),(131,'20261119102010871','2026-11-19 14:36:00'),(132,'20261119102010872','2026-11-19 14:37:00'),(133,'20261119102010873','2026-11-19 14:38:00'),(134,'20261119102010874','2026-11-19 14:39:00'),(135,'20261119102010875','2026-11-19 14:40:00'),(136,'20261119102010876','2026-11-19 14:41:00'),(137,'20261119102010877','2026-11-19 14:42:00'),(138,'20261119102010878','2026-11-19 14:43:00'),(139,'20261119102010879','2026-11-19 14:44:00'),(140,'20261119102010880','2026-11-19 14:45:00'),(141,'20261119102010881','2026-11-19 14:46:00'),(142,'20261119102010882','2026-11-19 14:47:00'),(143,'20261119102010883','2026-11-19 14:48:00'),(144,'20261119102010884','2026-11-19 14:49:00'),(145,'20261119102010885','2026-11-19 14:50:00'),(146,'20261119102010886','2026-11-19 14:51:00'),(147,'20261119102010887','2026-11-19 14:52:00'),(148,'20261119102010888','2026-11-19 14:53:01'),(149,'20261119102010889','2026-11-19 14:54:00'),(150,'20261119102010890','2026-11-19 14:55:00'),(151,'20261119102010891','2026-11-19 14:56:00'),(152,'20261119102010892','2026-11-19 14:57:00'),(153,'20261119102010893','2026-11-19 14:58:00'),(154,'20261119102010894','2026-11-19 14:59:00'),(155,'20261119102010895','2026-11-19 15:00:00'),(156,'20261119102010896','2026-11-19 15:01:00'),(157,'20261119102010897','2026-11-19 15:02:00'),(158,'20261119102010898','2026-11-19 15:03:00'),(159,'20261119102010899','2026-11-19 15:04:00'),(160,'20261119102010900','2026-11-19 15:05:00'),(161,'20261119102010901','2026-11-19 15:06:00'),(162,'20261119102010902','2026-11-19 15:07:00'),(163,'20261119102010903','2026-11-19 15:08:01'),(164,'20261119102010904','2026-11-19 15:09:00'),(165,'20261119102010905','2026-11-19 15:10:00'),(166,'20261119102010906','2026-11-19 15:11:00'),(167,'20261119102010907','2026-11-19 15:12:00'),(168,'20261119102010908','2026-11-19 15:13:00'),(169,'20261119102010909','2026-11-19 15:14:00'),(170,'20261119102010910','2026-11-19 15:15:00'),(171,'20261119102010911','2026-11-19 15:16:00'),(172,'20261119102010912','2026-11-19 15:17:00'),(173,'20261119102010913','2026-11-19 15:18:00'),(174,'20261119102010914','2026-11-19 15:19:00'),(175,'20261119102010915','2026-11-19 15:20:00'),(176,'20261119102010916','2026-11-19 15:21:00'),(177,'20261119102010917','2026-11-19 15:22:00'),(178,'20261119102010918','2026-11-19 15:23:00'),(179,'20261119102010919','2026-11-19 15:24:00'),(180,'20261119102010920','2026-11-19 15:25:00'),(181,'20261119102010921','2026-11-19 15:26:00'),(182,'20261119102010922','2026-11-19 15:27:00'),(183,'20261119102010923','2026-11-19 15:28:00'),(184,'20261119102010924','2026-11-19 15:29:00'),(185,'20261119102010925','2026-11-19 15:30:00'),(186,'20261119102010926','2026-11-19 15:31:00'),(187,'20261119102010927','2026-11-19 15:32:00'),(188,'20261119102010928','2026-11-19 15:33:00'),(189,'20261119102010929','2026-11-19 15:34:00'),(190,'20261119102010930','2026-11-19 15:35:00'),(191,'20261119102010931','2026-11-19 15:35:03'),(192,'20261119102010932','2026-11-19 15:35:21'),(193,'20261119102010933','2026-11-19 15:35:48'),(194,'20261119102010934','2026-11-19 15:36:00'),(195,'20261119102010935','2026-11-19 15:37:00'),(196,'20261119102010936','2026-11-19 15:38:00'),(197,'20261119102010937','2026-11-19 15:38:51'),(198,'20261119102010938','2026-11-19 15:39:00'),(199,'20261119102010939','2026-11-19 17:44:13'),(200,'20261119102010940','2026-11-19 17:44:59'),(201,'20261119102010941','2026-11-19 17:45:45'),(202,'20261119102010942','2026-11-19 17:46:31'),(203,'20261119102010943','2026-11-19 17:47:17'),(204,'20261119102010944','2026-11-19 17:48:03'),(205,'20261119102010945','2026-11-19 17:48:49'),(206,'20261119102010946','2026-11-19 17:49:35'),(207,'20261119102010947','2026-11-19 17:50:20'),(208,'20261119102010948','2026-11-19 17:51:06'),(209,'20261119102010949','2026-11-19 17:51:52'),(210,'20261119102010950','2026-11-19 17:52:38'),(211,'20261119102010951','2026-11-19 17:53:24'),(212,'20261119102010952','2026-11-19 17:54:10'),(213,'20261119102010953','2026-11-19 17:54:55'),(214,'20261119102010954','2026-11-19 17:55:41'),(215,'20261119102010955','2026-11-19 17:56:27'),(216,'20261119102010956','2026-11-19 17:57:13'),(217,'20261119102010957','2026-11-19 17:57:59'),(218,'20261119102010958','2026-11-19 17:58:45'),(219,'20261119102010959','2026-11-19 17:59:30'),(220,'20261119102010960','2026-11-19 18:00:16'),(221,'20261119102010961','2026-11-19 18:01:01'),(222,'20261119102010962','2026-11-19 18:01:47'),(223,'20261119102010963','2026-11-19 18:02:33'),(224,'20261119102010964','2026-11-19 18:03:19'),(225,'20261119102010965','2026-11-19 18:04:04'),(226,'20261119102010966','2026-11-19 18:04:50'),(227,'20261119102010967','2026-11-19 18:05:36'),(228,'20261119102010968','2026-11-19 18:06:22'),(229,'20261119102010969','2026-11-19 18:07:08'),(230,'20261119102010970','2026-11-19 18:07:53'),(231,'20261119102010971','2026-11-19 18:08:39'),(232,'20261119102010972','2026-11-19 18:09:25'),(233,'20261119102010973','2026-11-19 18:10:10'),(234,'20261119102010974','2026-11-19 18:10:57'),(235,'20261119102010975','2026-11-19 18:11:43'),(236,'20261119102010976','2026-11-19 18:12:29'),(237,'20261119102010977','2026-11-19 18:13:15'),(238,'20261119102010978','2026-11-19 18:14:00'),(239,'20261119102010979','2026-11-19 18:14:46'),(240,'20261119102010980','2026-11-19 18:15:31'),(241,'20261119102010981','2026-11-19 18:16:18'),(242,'20261119102010982','2026-11-19 18:17:04'),(243,'20261119102010983','2026-11-19 18:17:49'),(244,'20261119102010984','2026-11-19 18:18:35'),(245,'20261119102010985','2026-11-19 18:19:21'),(246,'20261119102010986','2026-11-19 18:20:06'),(247,'20261119102010987','2026-11-19 18:20:53'),(248,'20261119102010988','2026-11-19 18:21:39'),(249,'20261119102010989','2026-11-19 18:22:25'),(250,'20261119102010990','2026-11-19 18:23:10'),(251,'20261119102010991','2026-11-19 18:23:56'),(252,'20261119102010992','2026-11-19 18:24:42'),(253,'20261119102010993','2026-11-19 18:25:28'),(254,'20261119102010994','2026-11-19 18:26:14'),(255,'20261119102010995','2026-11-19 18:26:59'),(256,'20261119102010996','2026-11-19 18:27:45'),(257,'20261119102010997','2026-11-19 18:28:31'),(258,'20261119102010998','2026-11-19 18:29:17'),(259,'20261119102010999','2026-11-19 18:30:02'),(260,'20261119102011000','2026-11-19 18:30:48'),(261,'20261119102011001','2026-11-19 18:31:33'),(262,'20261119102011002','2026-11-19 18:32:19'),(263,'20261119102011003','2026-11-19 18:33:05'),(264,'20261119102011004','2026-11-19 18:33:51'),(265,'20261119102011005','2026-11-19 18:34:36'),(266,'20261119102011006','2026-11-19 18:35:22'),(267,'20261119102011007','2026-11-19 18:36:08'),(268,'20261119102011008','2026-11-19 18:36:54'),(269,'20261119102011009','2026-11-19 18:37:40'),(270,'20261119102011010','2026-11-19 18:38:26'),(271,'20261119102011011','2026-11-19 18:39:11'),(272,'20261119102011012','2026-11-19 18:39:57'),(273,'20261119102011013','2026-11-19 18:40:43'),(274,'20261119102011014','2026-11-19 18:41:29'),(275,'20261119102011015','2026-11-19 18:42:15'),(276,'20261119102011016','2026-11-19 18:43:01'),(277,'20261119102011017','2026-11-19 18:43:46'),(278,'20261119102011018','2026-11-19 18:44:32'),(279,'20261119102011019','2026-11-19 18:45:18'),(280,'20261119102011020','2026-11-19 18:46:04'),(281,'20261119102011021','2026-11-19 18:46:50'),(282,'20261119102011022','2026-11-19 18:47:35'),(283,'20261119102011023','2026-11-19 18:48:21'),(284,'20261119102011024','2026-11-19 18:49:07'),(285,'20261119102011025','2026-11-19 18:49:53'),(286,'20261119102011026','2026-11-19 18:50:38'),(287,'20261119102011027','2026-11-19 18:51:25'),(288,'20261119102011028','2026-11-19 18:52:10'),(289,'20261119102011029','2026-11-19 18:52:56'),(290,'20261119102011030','2026-11-19 18:53:42'),(291,'20261119102011031','2026-11-19 18:54:27'),(292,'20261119102011032','2026-11-19 18:55:13'),(293,'20261119102011033','2026-11-19 18:55:59'),(294,'20261119102011034','2026-11-19 18:56:45'),(295,'20261119102011035','2026-11-19 18:57:31'),(296,'20261119102011036','2026-11-19 18:58:17'),(297,'20261119102011037','2026-11-19 18:59:02'),(298,'20261119102011038','2026-11-19 18:59:48'),(299,'20261119102011039','2026-11-19 19:00:34'),(300,'20261119102011040','2026-11-19 19:01:19'),(301,'20261119102011041','2026-11-19 19:02:05'),(302,'20261119102011042','2026-11-19 19:02:50'),(303,'20261119102011043','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `fived_periods_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_periods_3min`
--

DROP TABLE IF EXISTS `fived_periods_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_periods_3min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 COMMENT='5D lottery 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_3min`
--

LOCK TABLES `fived_periods_3min` WRITE;
/*!40000 ALTER TABLE `fived_periods_3min` DISABLE KEYS */;
INSERT INTO `fived_periods_3min` VALUES (7,'20261119102020252','2026-11-19 12:33:09'),(8,'20261119102020253','2026-11-19 12:45:00'),(9,'20261119102020254','2026-11-19 12:48:01'),(10,'20261119102020255','2026-11-19 12:51:01'),(11,'20261119102020256','2026-11-19 12:54:00'),(12,'20261119102020257','2026-11-19 12:57:00'),(13,'20261119102020258','2026-11-19 13:00:00'),(14,'20261119102020259','2026-11-19 13:03:00'),(15,'20261119102020260','2026-11-19 13:06:00'),(16,'20261119102020261','2026-11-19 13:09:00'),(17,'20261119102020262','2026-11-19 13:12:00'),(18,'20261119102020263','2026-11-19 13:15:01'),(19,'20261119102020264','2026-11-19 13:18:00'),(20,'20261119102020265','2026-11-19 13:21:01'),(21,'20261119102020266','2026-11-19 13:24:00'),(22,'20261119102020267','2026-11-19 13:27:01'),(23,'20261119102020268','2026-11-19 13:30:00'),(24,'20261119102020269','2026-11-19 13:33:00'),(25,'20261119102020270','2026-11-19 13:36:01'),(26,'20261119102020271','2026-11-19 13:39:00'),(27,'20261119102020272','2026-11-19 13:42:00'),(28,'20261119102020273','2026-11-19 13:45:00'),(29,'20261119102020274','2026-11-19 13:48:00'),(30,'20261119102020275','2026-11-19 13:51:01'),(31,'20261119102020276','2026-11-19 13:54:00'),(32,'20261119102020277','2026-11-19 13:57:01'),(33,'20261119102020278','2026-11-19 14:00:01'),(34,'20261119102020279','2026-11-19 14:03:00'),(35,'20261119102020280','2026-11-19 14:06:01'),(36,'20261119102020281','2026-11-19 14:09:00'),(37,'20261119102020282','2026-11-19 14:12:01'),(38,'20261119102020283','2026-11-19 14:15:00'),(39,'20261119102020284','2026-11-19 14:18:01'),(40,'20261119102020285','2026-11-19 14:21:01'),(41,'20261119102020286','2026-11-19 14:24:00'),(42,'20261119102020287','2026-11-19 14:27:01'),(43,'20261119102020288','2026-11-19 14:33:00'),(44,'20261119102020289','2026-11-19 14:36:01'),(45,'20261119102020290','2026-11-19 14:39:00'),(46,'20261119102020291','2026-11-19 14:42:00'),(47,'20261119102020292','2026-11-19 14:45:01'),(48,'20261119102020293','2026-11-19 14:48:00'),(49,'20261119102020294','2026-11-19 14:51:00'),(50,'20261119102020295','2026-11-19 14:54:00'),(51,'20261119102020296','2026-11-19 14:57:01'),(52,'20261119102020297','2026-11-19 15:00:00'),(53,'20261119102020298','2026-11-19 15:03:00'),(54,'20261119102020299','2026-11-19 15:06:00'),(55,'20261119102020300','2026-11-19 15:09:01'),(56,'20261119102020301','2026-11-19 15:12:00'),(57,'20261119102020302','2026-11-19 15:15:01'),(58,'20261119102020303','2026-11-19 15:18:01'),(59,'20261119102020304','2026-11-19 15:21:01'),(60,'20261119102020305','2026-11-19 15:24:01'),(61,'20261119102020306','2026-11-19 15:27:00'),(62,'20261119102020307','2026-11-19 15:30:01'),(63,'20261119102020308','2026-11-19 15:33:00'),(64,'20261119102020309','2026-11-19 17:45:45'),(65,'20261119102020310','2026-11-19 17:48:03'),(66,'20261119102020311','2026-11-19 17:48:49'),(67,'20261119102020312','2026-11-19 17:51:07'),(68,'20261119102020313','2026-11-19 17:51:53'),(69,'20261119102020314','2026-11-19 17:54:10'),(70,'20261119102020315','2026-11-19 17:54:56'),(71,'20261119102020316','2026-11-19 17:57:13'),(72,'20261119102020317','2026-11-19 17:57:59'),(73,'20261119102020318','2026-11-19 18:00:16'),(74,'20261119102020319','2026-11-19 18:03:19'),(75,'20261119102020320','2026-11-19 18:06:22'),(76,'20261119102020321','2026-11-19 18:09:25'),(77,'20261119102020322','2026-11-19 18:12:29'),(78,'20261119102020323','2026-11-19 18:15:32'),(79,'20261119102020324','2026-11-19 18:18:35'),(80,'20261119102020325','2026-11-19 18:21:39'),(81,'20261119102020326','2026-11-19 18:24:42'),(82,'20261119102020327','2026-11-19 18:27:45'),(83,'20261119102020328','2026-11-19 18:30:03'),(84,'20261119102020329','2026-11-19 18:30:48'),(85,'20261119102020330','2026-11-19 18:33:05'),(86,'20261119102020331','2026-11-19 18:33:51'),(87,'20261119102020332','2026-11-19 18:36:08'),(88,'20261119102020333','2026-11-19 18:36:54'),(89,'20261119102020334','2026-11-19 18:39:11'),(90,'20261119102020335','2026-11-19 18:39:57'),(91,'20261119102020336','2026-11-19 18:42:15'),(92,'20261119102020337','2026-11-19 18:45:18'),(93,'20261119102020338','2026-11-19 18:48:21'),(94,'20261119102020339','2026-11-19 18:51:25'),(95,'20261119102020340','2026-11-19 18:54:28'),(96,'20261119102020341','2026-11-19 18:57:31'),(97,'20261119102020342','2026-11-19 19:00:34'),(98,'20261119102020343','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `fived_periods_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_periods_5min`
--

DROP TABLE IF EXISTS `fived_periods_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_periods_5min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COMMENT='5D lottery 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_periods_5min`
--

LOCK TABLES `fived_periods_5min` WRITE;
/*!40000 ALTER TABLE `fived_periods_5min` DISABLE KEYS */;
INSERT INTO `fived_periods_5min` VALUES (3,'20261119102030154','2026-11-19 12:45:00'),(4,'20261119102030155','2026-11-19 12:50:00'),(5,'20261119102030156','2026-11-19 12:55:00'),(6,'20261119102030157','2026-11-19 13:00:01'),(7,'20261119102030158','2026-11-19 13:05:00'),(8,'20261119102030159','2026-11-19 13:10:00'),(9,'20261119102030160','2026-11-19 13:15:01'),(10,'20261119102030161','2026-11-19 13:20:00'),(11,'20261119102030162','2026-11-19 13:25:01'),(12,'20261119102030163','2026-11-19 13:30:00'),(13,'20261119102030164','2026-11-19 13:35:00'),(14,'20261119102030165','2026-11-19 13:40:01'),(15,'20261119102030166','2026-11-19 13:45:01'),(16,'20261119102030167','2026-11-19 13:50:01'),(17,'20261119102030168','2026-11-19 13:55:01'),(18,'20261119102030169','2026-11-19 14:00:02'),(19,'20261119102030170','2026-11-19 14:05:00'),(20,'20261119102030171','2026-11-19 14:10:00'),(21,'20261119102030172','2026-11-19 14:15:00'),(22,'20261119102030173','2026-11-19 14:20:01'),(23,'20261119102030174','2026-11-19 14:25:01'),(24,'20261119102030175','2026-11-19 14:35:00'),(25,'20261119102030176','2026-11-19 14:40:00'),(26,'20261119102030177','2026-11-19 14:45:01'),(27,'20261119102030178','2026-11-19 14:50:00'),(28,'20261119102030179','2026-11-19 14:55:01'),(29,'20261119102030180','2026-11-19 15:00:00'),(30,'20261119102030181','2026-11-19 15:05:00'),(31,'20261119102030182','2026-11-19 15:10:00'),(32,'20261119102030183','2026-11-19 15:15:01'),(33,'20261119102030184','2026-11-19 15:20:01'),(34,'20261119102030185','2026-11-19 15:25:00'),(35,'20261119102030186','2026-11-19 15:30:01'),(36,'20261119102030187','2026-11-19 15:35:00'),(37,'20261119102030188','2026-11-19 15:35:21'),(38,'20261119102030189','2026-11-19 15:35:48'),(39,'20261119102030190','2026-11-19 17:45:45'),(40,'20261119102030191','2026-11-19 17:50:20'),(41,'20261119102030192','2026-11-19 17:55:42'),(42,'20261119102030193','2026-11-19 18:00:17'),(43,'20261119102030194','2026-11-19 18:05:36'),(44,'20261119102030195','2026-11-19 18:10:11'),(45,'20261119102030196','2026-11-19 18:10:57'),(46,'20261119102030197','2026-11-19 18:15:32'),(47,'20261119102030198','2026-11-19 18:20:07'),(48,'20261119102030199','2026-11-19 18:20:53'),(49,'20261119102030200','2026-11-19 18:25:28'),(50,'20261119102030201','2026-11-19 18:30:03'),(51,'20261119102030202','2026-11-19 18:30:48'),(52,'20261119102030203','2026-11-19 18:35:22'),(53,'20261119102030204','2026-11-19 18:40:43'),(54,'20261119102030205','2026-11-19 18:45:18'),(55,'20261119102030206','2026-11-19 18:50:39'),(56,'20261119102030207','2026-11-19 18:55:14'),(57,'20261119102030208','2026-11-19 18:56:01'),(58,'20261119102030209','2026-11-19 19:00:34');
/*!40000 ALTER TABLE `fived_periods_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_results_10min`
--

DROP TABLE IF EXISTS `fived_results_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_results_10min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` varchar(255) NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COMMENT='5D lottery 10-min: published draw results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_10min`
--

LOCK TABLES `fived_results_10min` WRITE;
/*!40000 ALTER TABLE `fived_results_10min` DISABLE KEYS */;
INSERT INTO `fived_results_10min` VALUES (1,'20261119102040078','77757',33,'shonu','2026-11-19 13:00:01'),(2,'20261119102040079','55933',25,'shonu','2026-11-19 13:10:00'),(3,'20261119102040080','34969',31,'shonu','2026-11-19 13:20:01'),(4,'20261119102040081','32219',17,'shonu','2026-11-19 13:30:01'),(5,'20261119102040082','81801',18,'shonu','2026-11-19 13:40:01'),(6,'20261119102040083','00673',16,'shonu','2026-11-19 13:50:01'),(7,'20261119102040084','26907',24,'shonu','2026-11-19 14:00:02'),(8,'20261119102040085','34283',20,'shonu','2026-11-19 14:10:00'),(9,'20261119102040086','39091',22,'shonu','2026-11-19 14:20:01'),(10,'20261119102040087','29915',26,'shonu','2026-11-19 14:40:00'),(11,'20261119102040088','70839',27,'shonu','2026-11-19 14:50:00'),(12,'20261119102040089','69365',29,'shonu','2026-11-19 15:00:01'),(13,'20261119102040090','61038',18,'shonu','2026-11-19 15:10:00'),(14,'20261119102040091','73746',27,'shonu','2026-11-19 15:20:01'),(15,'20261119102040092','35236',19,'shonu','2026-11-19 15:30:02'),(16,'20261119102040093','74295',27,'shonu','2026-11-19 17:50:21'),(17,'20261119102040094','60346',19,'shonu','2026-11-19 18:00:17'),(18,'20261119102040095','28294',25,'shonu','2026-11-19 18:10:11'),(19,'20261119102040096','40871',20,'shonu','2026-11-19 18:10:57'),(20,'20261119102040097','81381',21,'shonu','2026-11-19 18:20:07'),(21,'20261119102040098','59024',20,'shonu','2026-11-19 18:20:53'),(22,'20261119102040099','12495',21,'shonu','2026-11-19 18:30:03'),(23,'20261119102040100','34722',18,'shonu','2026-11-19 18:30:49'),(24,'20261119102040101','36909',27,'shonu','2026-11-19 18:40:44'),(25,'20261119102040102','89021',20,'shonu','2026-11-19 18:50:39'),(26,'20261119102040103','84773',29,'shonu','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `fived_results_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_results_1min`
--

DROP TABLE IF EXISTS `fived_results_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_results_1min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` varchar(255) NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=latin1 COMMENT='5D lottery 1-min: published 5-digit draw results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_1min`
--

LOCK TABLES `fived_results_1min` WRITE;
/*!40000 ALTER TABLE `fived_results_1min` DISABLE KEYS */;
INSERT INTO `fived_results_1min` VALUES (11,'20261119102010752','21875',23,'shonu','2026-11-19 12:33:08'),(12,'20261119102010753','64296',27,'shonu','2026-11-19 12:34:23'),(13,'20261119102010754','91473',24,'shonu','2026-11-19 12:34:55'),(14,'20261119102010755','48997',37,'shonu','2026-11-19 12:44:01'),(15,'20261119102010756','82411',16,'shonu','2026-11-19 12:45:00'),(16,'20261119102010757','42516',18,'shonu','2026-11-19 12:46:00'),(17,'20261119102010758','56485',28,'shonu','2026-11-19 12:47:00'),(18,'20261119102010759','25523',17,'shonu','2026-11-19 12:48:00'),(19,'20261119102010760','11329',16,'shonu','2026-11-19 12:49:00'),(20,'20261119102010761','79073',26,'shonu','2026-11-19 12:50:00'),(21,'20261119102010762','65237',23,'shonu','2026-11-19 12:51:00'),(22,'20261119102010763','10667',20,'shonu','2026-11-19 12:52:00'),(23,'20261119102010764','69307',25,'shonu','2026-11-19 12:53:00'),(24,'20261119102010765','38197',28,'shonu','2026-11-19 12:54:00'),(25,'20261119102010766','38359',28,'shonu','2026-11-19 12:55:00'),(26,'20261119102010767','28106',17,'shonu','2026-11-19 12:56:00'),(27,'20261119102010768','95801',23,'shonu','2026-11-19 12:57:00'),(28,'20261119102010769','83387',29,'shonu','2026-11-19 12:58:00'),(29,'20261119102010770','39226',22,'shonu','2026-11-19 12:59:00'),(30,'20261119102010771','66211',16,'shonu','2026-11-19 13:00:00'),(31,'20261119102010772','76411',19,'shonu','2026-11-19 13:01:00'),(32,'20261119102010773','54094',22,'shonu','2026-11-19 13:02:00'),(33,'20261119102010774','56894',32,'shonu','2026-11-19 13:03:00'),(34,'20261119102010775','71961',24,'shonu','2026-11-19 13:04:00'),(35,'20261119102010776','70625',20,'shonu','2026-11-19 13:05:00'),(36,'20261119102010777','76148',26,'shonu','2026-11-19 13:06:00'),(37,'20261119102010778','84921',24,'shonu','2026-11-19 13:07:00'),(38,'20261119102010779','86391',27,'shonu','2026-11-19 13:08:00'),(39,'20261119102010780','33920',17,'shonu','2026-11-19 13:09:00'),(40,'20261119102010781','12051',9,'shonu','2026-11-19 13:10:00'),(41,'20261119102010782','05750',17,'shonu','2026-11-19 13:11:00'),(42,'20261119102010783','05357',20,'shonu','2026-11-19 13:12:00'),(43,'20261119102010784','89288',35,'shonu','2026-11-19 13:13:00'),(44,'20261119102010785','40305',12,'shonu','2026-11-19 13:14:00'),(45,'20261119102010786','21972',21,'shonu','2026-11-19 13:15:00'),(46,'20261119102010787','28503',18,'shonu','2026-11-19 13:16:00'),(47,'20261119102010788','89776',37,'shonu','2026-11-19 13:17:00'),(48,'20261119102010789','29050',16,'shonu','2026-11-19 13:18:00'),(49,'20261119102010790','95524',25,'shonu','2026-11-19 13:19:00'),(50,'20261119102010791','11729',20,'shonu','2026-11-19 13:20:00'),(51,'20261119102010792','14284',19,'shonu','2026-11-19 13:21:00'),(52,'20261119102010793','43094',20,'shonu','2026-11-19 13:22:00'),(53,'20261119102010794','43155',18,'shonu','2026-11-19 13:23:00'),(54,'20261119102010795','75161',20,'shonu','2026-11-19 13:24:00'),(55,'20261119102010796','17754',24,'shonu','2026-11-19 13:25:00'),(56,'20261119102010797','52847',26,'shonu','2026-11-19 13:26:00'),(57,'20261119102010798','55535',23,'shonu','2026-11-19 13:27:00'),(58,'20261119102010799','08508',21,'shonu','2026-11-19 13:28:00'),(59,'20261119102010800','18410',14,'shonu','2026-11-19 13:29:00'),(60,'20261119102010801','57788',35,'shonu','2026-11-19 13:30:00'),(61,'20261119102010802','85885',34,'shonu','2026-11-19 13:31:00'),(62,'20261119102010803','23533',16,'shonu','2026-11-19 13:32:00'),(63,'20261119102010804','63864',27,'shonu','2026-11-19 13:33:00'),(64,'20261119102010805','09955',28,'shonu','2026-11-19 13:34:00'),(65,'20261119102010806','40594',22,'shonu','2026-11-19 13:35:00'),(66,'20261119102010807','28139',23,'shonu','2026-11-19 13:36:00'),(67,'20261119102010808','37301',14,'shonu','2026-11-19 13:37:00'),(68,'20261119102010809','49635',27,'shonu','2026-11-19 13:38:00'),(69,'20261119102010810','20137',13,'shonu','2026-11-19 13:39:00'),(70,'20261119102010811','53849',29,'shonu','2026-11-19 13:40:00'),(71,'20261119102010812','23859',27,'shonu','2026-11-19 13:41:00'),(72,'20261119102010813','05416',16,'shonu','2026-11-19 13:42:00'),(73,'20261119102010814','10640',11,'shonu','2026-11-19 13:43:00'),(74,'20261119102010815','07076',20,'shonu','2026-11-19 13:44:00'),(75,'20261119102010816','08273',20,'shonu','2026-11-19 13:45:00'),(76,'20261119102010817','58066',25,'shonu','2026-11-19 13:46:00'),(77,'20261119102010818','74779',34,'shonu','2026-11-19 13:47:00'),(78,'20261119102010819','34337',20,'shonu','2026-11-19 13:48:00'),(79,'20261119102010820','70462',19,'shonu','2026-11-19 13:49:00'),(80,'20261119102010821','10793',20,'shonu','2026-11-19 13:50:00'),(81,'20261119102010822','51551',17,'shonu','2026-11-19 13:51:00'),(82,'20261119102010823','79931',29,'shonu','2026-11-19 13:52:00'),(83,'20261119102010824','73810',19,'shonu','2026-11-19 13:53:00'),(84,'20261119102010825','30202',7,'shonu','2026-11-19 13:54:00'),(85,'20261119102010826','88665',33,'shonu','2026-11-19 13:55:00'),(86,'20261119102010827','59592',30,'shonu','2026-11-19 13:56:00'),(87,'20261119102010828','82506',21,'shonu','2026-11-19 13:57:00'),(88,'20261119102010829','71383',22,'shonu','2026-11-19 13:58:00'),(89,'20261119102010830','69017',23,'shonu','2026-11-19 13:59:00'),(90,'20261119102010831','64251',18,'shonu','2026-11-19 14:00:00'),(91,'20261119102010832','83058',24,'shonu','2026-11-19 14:01:00'),(92,'20261119102010833','01070',8,'shonu','2026-11-19 14:02:00'),(93,'20261119102010834','92524',22,'shonu','2026-11-19 14:03:00'),(94,'20261119102010835','57670',25,'shonu','2026-11-19 14:04:00'),(95,'20261119102010836','41510',11,'shonu','2026-11-19 14:05:00'),(96,'20261119102010837','40012',7,'shonu','2026-11-19 14:06:00'),(97,'20261119102010838','52296',24,'shonu','2026-11-19 14:07:00'),(98,'20261119102010839','86280',24,'shonu','2026-11-19 14:08:00'),(99,'20261119102010840','51145',16,'shonu','2026-11-19 14:09:00'),(100,'20261119102010841','40787',26,'shonu','2026-11-19 14:10:00'),(101,'20261119102010842','70223',14,'shonu','2026-11-19 14:11:00'),(102,'20261119102010843','42226',16,'shonu','2026-11-19 14:12:00'),(103,'20261119102010844','70658',26,'shonu','2026-11-19 14:13:00'),(104,'20261119102010845','48756',30,'shonu','2026-11-19 14:14:00'),(105,'20261119102010846','89335',28,'shonu','2026-11-19 14:15:00'),(106,'20261119102010847','49008',21,'shonu','2026-11-19 14:16:00'),(107,'20261119102010848','82393',25,'shonu','2026-11-19 14:17:00'),(108,'20261119102010849','89542',28,'shonu','2026-11-19 14:18:00'),(109,'20261119102010850','61398',27,'shonu','2026-11-19 14:19:00'),(110,'20261119102010851','22766',23,'shonu','2026-11-19 14:20:00'),(111,'20261119102010852','83822',23,'shonu','2026-11-19 14:21:00'),(112,'20261119102010853','32257',19,'shonu','2026-11-19 14:22:00'),(113,'20261119102010854','93807',27,'shonu','2026-11-19 14:23:00'),(114,'20261119102010855','72751',22,'shonu','2026-11-19 14:24:00'),(115,'20261119102010856','53981',26,'shonu','2026-11-19 14:25:00'),(116,'20261119102010857','75568',31,'shonu','2026-11-19 14:26:00'),(117,'20261119102010858','08533',19,'shonu','2026-11-19 14:27:00'),(118,'20261119102010859','48798',36,'shonu','2026-11-19 14:28:00'),(119,'20261119102010860','07011',9,'shonu','2026-11-19 14:29:00'),(120,'20261119102010861','85141',19,'shonu','2026-11-19 14:29:04'),(121,'20261119102010862','52191',18,'shonu','2026-11-19 14:29:11'),(122,'20261119102010863','39774',30,'shonu','2026-11-19 14:29:23'),(123,'20261119102010864','14498',26,'shonu','2026-11-19 14:30:00'),(124,'20261119102010865','82727',26,'shonu','2026-11-19 14:31:00'),(125,'20261119102010866','89657',35,'shonu','2026-11-19 14:32:00'),(126,'20261119102010867','89109',27,'shonu','2026-11-19 14:33:00'),(127,'20261119102010868','61540',16,'shonu','2026-11-19 14:34:00'),(128,'20261119102010869','71780',23,'shonu','2026-11-19 14:35:00'),(129,'20261119102010870','57448',28,'shonu','2026-11-19 14:36:00'),(130,'20261119102010871','42914',20,'shonu','2026-11-19 14:37:00'),(131,'20261119102010872','65185',25,'shonu','2026-11-19 14:38:00'),(132,'20261119102010873','51505',16,'shonu','2026-11-19 14:39:00'),(133,'20261119102010874','68927',32,'shonu','2026-11-19 14:40:00'),(134,'20261119102010875','56998',37,'shonu','2026-11-19 14:41:00'),(135,'20261119102010876','51583',22,'shonu','2026-11-19 14:42:00'),(136,'20261119102010877','74566',28,'shonu','2026-11-19 14:43:00'),(137,'20261119102010878','28833',24,'shonu','2026-11-19 14:44:00'),(138,'20261119102010879','40648',22,'shonu','2026-11-19 14:45:00'),(139,'20261119102010880','16477',25,'shonu','2026-11-19 14:46:00'),(140,'20261119102010881','85278',30,'shonu','2026-11-19 14:47:00'),(141,'20261119102010882','01840',13,'shonu','2026-11-19 14:48:00'),(142,'20261119102010883','75856',31,'shonu','2026-11-19 14:49:00'),(143,'20261119102010884','57698',35,'shonu','2026-11-19 14:50:00'),(144,'20261119102010885','09891',27,'shonu','2026-11-19 14:51:00'),(145,'20261119102010886','00759',21,'shonu','2026-11-19 14:52:00'),(146,'20261119102010887','42175',19,'shonu','2026-11-19 14:53:01'),(147,'20261119102010888','13978',28,'shonu','2026-11-19 14:54:00'),(148,'20261119102010889','76780',28,'shonu','2026-11-19 14:55:00'),(149,'20261119102010890','78346',28,'shonu','2026-11-19 14:56:00'),(150,'20261119102010891','79686',36,'shonu','2026-11-19 14:57:00'),(151,'20261119102010892','75120',15,'shonu','2026-11-19 14:58:00'),(152,'20261119102010893','10674',18,'shonu','2026-11-19 14:59:00'),(153,'20261119102010894','60805',19,'shonu','2026-11-19 15:00:00'),(154,'20261119102010895','75802',22,'shonu','2026-11-19 15:01:00'),(155,'20261119102010896','22852',19,'shonu','2026-11-19 15:02:00'),(156,'20261119102010897','89167',31,'shonu','2026-11-19 15:03:00'),(157,'20261119102010898','68050',19,'shonu','2026-11-19 15:04:00'),(158,'20261119102010899','35840',20,'shonu','2026-11-19 15:05:00'),(159,'20261119102010900','50065',16,'shonu','2026-11-19 15:06:00'),(160,'20261119102010901','29211',15,'shonu','2026-11-19 15:07:00'),(161,'20261119102010902','52566',24,'shonu','2026-11-19 15:08:01'),(162,'20261119102010903','75669',33,'shonu','2026-11-19 15:09:00'),(163,'20261119102010904','93081',21,'shonu','2026-11-19 15:10:00'),(164,'20261119102010905','03058',16,'shonu','2026-11-19 15:11:00'),(165,'20261119102010906','63210',12,'shonu','2026-11-19 15:12:00'),(166,'20261119102010907','03780',18,'shonu','2026-11-19 15:13:00'),(167,'20261119102010908','11518',16,'shonu','2026-11-19 15:14:00'),(168,'20261119102010909','48234',21,'shonu','2026-11-19 15:15:00'),(169,'20261119102010910','86766',33,'shonu','2026-11-19 15:16:00'),(170,'20261119102010911','69275',29,'shonu','2026-11-19 15:17:00'),(171,'20261119102010912','09430',16,'shonu','2026-11-19 15:18:00'),(172,'20261119102010913','81204',15,'shonu','2026-11-19 15:19:00'),(173,'20261119102010914','35745',24,'shonu','2026-11-19 15:20:00'),(174,'20261119102010915','66570',24,'shonu','2026-11-19 15:21:00'),(175,'20261119102010916','08997',33,'shonu','2026-11-19 15:22:00'),(176,'20261119102010917','56555',26,'shonu','2026-11-19 15:23:00'),(177,'20261119102010918','23253',15,'shonu','2026-11-19 15:24:00'),(178,'20261119102010919','60924',21,'shonu','2026-11-19 15:25:00'),(179,'20261119102010920','83091',21,'shonu','2026-11-19 15:26:00'),(180,'20261119102010921','54128',20,'shonu','2026-11-19 15:27:00'),(181,'20261119102010922','75036',21,'shonu','2026-11-19 15:28:00'),(182,'20261119102010923','70554',21,'shonu','2026-11-19 15:29:00'),(183,'20261119102010924','24792',24,'shonu','2026-11-19 15:30:00'),(184,'20261119102010925','58956',33,'shonu','2026-11-19 15:31:00'),(185,'20261119102010926','02113',7,'shonu','2026-11-19 15:32:00'),(186,'20261119102010927','29155',22,'shonu','2026-11-19 15:33:00'),(187,'20261119102010928','12917',20,'shonu','2026-11-19 15:34:00'),(188,'20261119102010929','38925',27,'shonu','2026-11-19 15:35:00'),(189,'20261119102010930','65451',21,'shonu','2026-11-19 15:35:03'),(190,'20261119102010931','04419',18,'shonu','2026-11-19 15:35:21'),(191,'20261119102010932','16967',29,'shonu','2026-11-19 15:35:48'),(192,'20261119102010933','33136',16,'shonu','2026-11-19 15:36:00'),(193,'20261119102010934','53640',18,'shonu','2026-11-19 15:37:00'),(194,'20261119102010935','77653',28,'shonu','2026-11-19 15:38:00'),(195,'20261119102010936','57150',18,'shonu','2026-11-19 15:38:51'),(196,'20261119102010937','09400',13,'shonu','2026-11-19 15:39:00'),(197,'20261119102010938','09613',19,'shonu','2026-11-19 17:44:13'),(198,'20261119102010939','38049',24,'shonu','2026-11-19 17:44:59'),(199,'20261119102010940','82886',32,'shonu','2026-11-19 17:45:45'),(200,'20261119102010941','02543',14,'shonu','2026-11-19 17:46:31'),(201,'20261119102010942','93084',24,'shonu','2026-11-19 17:47:17'),(202,'20261119102010943','31984',25,'shonu','2026-11-19 17:48:03'),(203,'20261119102010944','52906',22,'shonu','2026-11-19 17:48:49'),(204,'20261119102010945','76065',24,'shonu','2026-11-19 17:49:35'),(205,'20261119102010946','06394',22,'shonu','2026-11-19 17:50:20'),(206,'20261119102010947','85004',17,'shonu','2026-11-19 17:51:06'),(207,'20261119102010948','41709',21,'shonu','2026-11-19 17:51:52'),(208,'20261119102010949','17886',30,'shonu','2026-11-19 17:52:38'),(209,'20261119102010950','33842',20,'shonu','2026-11-19 17:53:24'),(210,'20261119102010951','81742',22,'shonu','2026-11-19 17:54:10'),(211,'20261119102010952','33694',25,'shonu','2026-11-19 17:54:55'),(212,'20261119102010953','06306',15,'shonu','2026-11-19 17:55:41'),(213,'20261119102010954','07048',19,'shonu','2026-11-19 17:56:27'),(214,'20261119102010955','75450',21,'shonu','2026-11-19 17:57:13'),(215,'20261119102010956','42975',27,'shonu','2026-11-19 17:57:59'),(216,'20261119102010957','03600',9,'shonu','2026-11-19 17:58:45'),(217,'20261119102010958','44979',33,'shonu','2026-11-19 17:59:30'),(218,'20261119102010959','17871',24,'shonu','2026-11-19 18:00:16'),(219,'20261119102010960','37150',16,'shonu','2026-11-19 18:01:01'),(220,'20261119102010961','57026',20,'shonu','2026-11-19 18:01:47'),(221,'20261119102010962','82566',27,'shonu','2026-11-19 18:02:33'),(222,'20261119102010963','41881',22,'shonu','2026-11-19 18:03:19'),(223,'20261119102010964','56892',30,'shonu','2026-11-19 18:04:04'),(224,'20261119102010965','04547',20,'shonu','2026-11-19 18:04:50'),(225,'20261119102010966','86148',27,'shonu','2026-11-19 18:05:36'),(226,'20261119102010967','12688',25,'shonu','2026-11-19 18:06:22'),(227,'20261119102010968','11184',15,'shonu','2026-11-19 18:07:08'),(228,'20261119102010969','36556',25,'shonu','2026-11-19 18:07:53'),(229,'20261119102010970','96582',30,'shonu','2026-11-19 18:08:39'),(230,'20261119102010971','61560',18,'shonu','2026-11-19 18:09:25'),(231,'20261119102010972','66119',23,'shonu','2026-11-19 18:10:10'),(232,'20261119102010973','60047',17,'shonu','2026-11-19 18:10:57'),(233,'20261119102010974','89192',29,'shonu','2026-11-19 18:11:43'),(234,'20261119102010975','95173',25,'shonu','2026-11-19 18:12:29'),(235,'20261119102010976','20716',16,'shonu','2026-11-19 18:13:15'),(236,'20261119102010977','80297',26,'shonu','2026-11-19 18:14:00'),(237,'20261119102010978','77420',20,'shonu','2026-11-19 18:14:46'),(238,'20261119102010979','53090',17,'shonu','2026-11-19 18:15:31'),(239,'20261119102010980','96399',36,'shonu','2026-11-19 18:16:18'),(240,'20261119102010981','86169',30,'shonu','2026-11-19 18:17:04'),(241,'20261119102010982','41496',24,'shonu','2026-11-19 18:17:49'),(242,'20261119102010983','67762',28,'shonu','2026-11-19 18:18:35'),(243,'20261119102010984','11034',9,'shonu','2026-11-19 18:19:21'),(244,'20261119102010985','09398',29,'shonu','2026-11-19 18:20:06'),(245,'20261119102010986','30676',22,'shonu','2026-11-19 18:20:53'),(246,'20261119102010987','77944',31,'shonu','2026-11-19 18:21:39'),(247,'20261119102010988','54902',20,'shonu','2026-11-19 18:22:25'),(248,'20261119102010989','25429',22,'shonu','2026-11-19 18:23:10'),(249,'20261119102010990','46023',15,'shonu','2026-11-19 18:23:56'),(250,'20261119102010991','91449',27,'shonu','2026-11-19 18:24:42'),(251,'20261119102010992','53048',20,'shonu','2026-11-19 18:25:28'),(252,'20261119102010993','87438',30,'shonu','2026-11-19 18:26:14'),(253,'20261119102010994','24008',14,'shonu','2026-11-19 18:26:59'),(254,'20261119102010995','12284',17,'shonu','2026-11-19 18:27:45'),(255,'20261119102010996','20574',18,'shonu','2026-11-19 18:28:31'),(256,'20261119102010997','85634',26,'shonu','2026-11-19 18:29:17'),(257,'20261119102010998','27410',14,'shonu','2026-11-19 18:30:02'),(258,'20261119102010999','92626',25,'shonu','2026-11-19 18:30:48'),(259,'20261119102011000','21115',10,'shonu','2026-11-19 18:31:33'),(260,'20261119102011001','54973',28,'shonu','2026-11-19 18:32:19'),(261,'20261119102011002','41652',18,'shonu','2026-11-19 18:33:05'),(262,'20261119102011003','91776',30,'shonu','2026-11-19 18:33:51'),(263,'20261119102011004','91112',14,'shonu','2026-11-19 18:34:36'),(264,'20261119102011005','25713',18,'shonu','2026-11-19 18:35:22'),(265,'20261119102011006','66485',29,'shonu','2026-11-19 18:36:08'),(266,'20261119102011007','74938',31,'shonu','2026-11-19 18:36:54'),(267,'20261119102011008','60775',25,'shonu','2026-11-19 18:37:40'),(268,'20261119102011009','93655',28,'shonu','2026-11-19 18:38:26'),(269,'20261119102011010','16352',17,'shonu','2026-11-19 18:39:11'),(270,'20261119102011011','53277',24,'shonu','2026-11-19 18:39:57'),(271,'20261119102011012','68113',19,'shonu','2026-11-19 18:40:43'),(272,'20261119102011013','66764',29,'shonu','2026-11-19 18:41:29'),(273,'20261119102011014','46845',27,'shonu','2026-11-19 18:42:15'),(274,'20261119102011015','16849',28,'shonu','2026-11-19 18:43:01'),(275,'20261119102011016','36451',19,'shonu','2026-11-19 18:43:46'),(276,'20261119102011017','03116',11,'shonu','2026-11-19 18:44:32'),(277,'20261119102011018','26849',29,'shonu','2026-11-19 18:45:18'),(278,'20261119102011019','77204',20,'shonu','2026-11-19 18:46:04'),(279,'20261119102011020','68348',29,'shonu','2026-11-19 18:46:50'),(280,'20261119102011021','35761',22,'shonu','2026-11-19 18:47:35'),(281,'20261119102011022','69361',25,'shonu','2026-11-19 18:48:21'),(282,'20261119102011023','59431',22,'shonu','2026-11-19 18:49:07'),(283,'20261119102011024','75093',24,'shonu','2026-11-19 18:49:53'),(284,'20261119102011025','68689',37,'shonu','2026-11-19 18:50:38'),(285,'20261119102011026','84369',30,'shonu','2026-11-19 18:51:25'),(286,'20261119102011027','34528',22,'shonu','2026-11-19 18:52:10'),(287,'20261119102011028','71738',26,'shonu','2026-11-19 18:52:56'),(288,'20261119102011029','88746',33,'shonu','2026-11-19 18:53:42'),(289,'20261119102011030','73092',21,'shonu','2026-11-19 18:54:27'),(290,'20261119102011031','84639',30,'shonu','2026-11-19 18:55:13'),(291,'20261119102011032','23812',16,'shonu','2026-11-19 18:55:59'),(292,'20261119102011033','63239',23,'shonu','2026-11-19 18:56:45'),(293,'20261119102011034','40066',16,'shonu','2026-11-19 18:57:31'),(294,'20261119102011035','38560',22,'shonu','2026-11-19 18:58:17'),(295,'20261119102011036','46112',14,'shonu','2026-11-19 18:59:02'),(296,'20261119102011037','08369',26,'shonu','2026-11-19 18:59:48'),(297,'20261119102011038','34007',14,'shonu','2026-11-19 19:00:34'),(298,'20261119102011039','86245',25,'shonu','2026-11-19 19:01:19'),(299,'20261119102011040','84390',24,'shonu','2026-11-19 19:02:05'),(300,'20261119102011041','74993',32,'shonu','2026-11-19 19:02:50'),(301,'20261119102011042','44558',26,'shonu','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `fived_results_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_results_3min`
--

DROP TABLE IF EXISTS `fived_results_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_results_3min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` varchar(255) NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COMMENT='5D lottery 3-min: published draw results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_3min`
--

LOCK TABLES `fived_results_3min` WRITE;
/*!40000 ALTER TABLE `fived_results_3min` DISABLE KEYS */;
INSERT INTO `fived_results_3min` VALUES (6,'20261119102020252','15838',25,'shonu','2026-11-19 12:45:00'),(7,'20261119102020253','87267',30,'shonu','2026-11-19 12:48:01'),(8,'20261119102020254','53897',32,'shonu','2026-11-19 12:51:01'),(9,'20261119102020255','98672',32,'shonu','2026-11-19 12:54:00'),(10,'20261119102020256','78415',25,'shonu','2026-11-19 12:57:00'),(11,'20261119102020257','59727',30,'shonu','2026-11-19 13:00:00'),(12,'20261119102020258','32991',24,'shonu','2026-11-19 13:03:00'),(13,'20261119102020259','95320',19,'shonu','2026-11-19 13:06:00'),(14,'20261119102020260','22931',17,'shonu','2026-11-19 13:09:00'),(15,'20261119102020261','54164',20,'shonu','2026-11-19 13:12:00'),(16,'20261119102020262','79300',19,'shonu','2026-11-19 13:15:01'),(17,'20261119102020263','88356',30,'shonu','2026-11-19 13:18:00'),(18,'20261119102020264','38710',19,'shonu','2026-11-19 13:21:01'),(19,'20261119102020265','54155',20,'shonu','2026-11-19 13:24:00'),(20,'20261119102020266','50864',23,'shonu','2026-11-19 13:27:01'),(21,'20261119102020267','46799',35,'shonu','2026-11-19 13:30:00'),(22,'20261119102020268','29877',33,'shonu','2026-11-19 13:33:00'),(23,'20261119102020269','83871',27,'shonu','2026-11-19 13:36:01'),(24,'20261119102020270','23745',21,'shonu','2026-11-19 13:39:00'),(25,'20261119102020271','73577',29,'shonu','2026-11-19 13:42:00'),(26,'20261119102020272','10275',15,'shonu','2026-11-19 13:45:00'),(27,'20261119102020273','54920',20,'shonu','2026-11-19 13:48:00'),(28,'20261119102020274','44599',31,'shonu','2026-11-19 13:51:01'),(29,'20261119102020275','19113',15,'shonu','2026-11-19 13:54:00'),(30,'20261119102020276','91051',16,'shonu','2026-11-19 13:57:01'),(31,'20261119102020277','88606',28,'shonu','2026-11-19 14:00:01'),(32,'20261119102020278','86636',29,'shonu','2026-11-19 14:03:00'),(33,'20261119102020279','66206',20,'shonu','2026-11-19 14:06:01'),(34,'20261119102020280','59269',31,'shonu','2026-11-19 14:09:00'),(35,'20261119102020281','06839',26,'shonu','2026-11-19 14:12:01'),(36,'20261119102020282','98338',31,'shonu','2026-11-19 14:15:00'),(37,'20261119102020283','51049',19,'shonu','2026-11-19 14:18:01'),(38,'20261119102020284','79619',32,'shonu','2026-11-19 14:21:01'),(39,'20261119102020285','76534',25,'shonu','2026-11-19 14:24:00'),(40,'20261119102020286','26545',22,'shonu','2026-11-19 14:27:01'),(41,'20261119102020287','59891',32,'shonu','2026-11-19 14:33:00'),(42,'20261119102020288','70320',12,'shonu','2026-11-19 14:36:01'),(43,'20261119102020289','44442',18,'shonu','2026-11-19 14:39:00'),(44,'20261119102020290','71412',15,'shonu','2026-11-19 14:42:00'),(45,'20261119102020291','08100',9,'shonu','2026-11-19 14:45:01'),(46,'20261119102020292','03118',13,'shonu','2026-11-19 14:48:00'),(47,'20261119102020293','32296',22,'shonu','2026-11-19 14:51:00'),(48,'20261119102020294','74744',26,'shonu','2026-11-19 14:54:00'),(49,'20261119102020295','73326',21,'shonu','2026-11-19 14:57:01'),(50,'20261119102020296','26027',17,'shonu','2026-11-19 15:00:00'),(51,'20261119102020297','18128',20,'shonu','2026-11-19 15:03:00'),(52,'20261119102020298','14243',14,'shonu','2026-11-19 15:06:00'),(53,'20261119102020299','44388',27,'shonu','2026-11-19 15:09:01'),(54,'20261119102020300','48395',29,'shonu','2026-11-19 15:12:00'),(55,'20261119102020301','96298',34,'shonu','2026-11-19 15:15:01'),(56,'20261119102020302','95844',30,'shonu','2026-11-19 15:18:01'),(57,'20261119102020303','01299',21,'shonu','2026-11-19 15:21:01'),(58,'20261119102020304','81241',16,'shonu','2026-11-19 15:24:01'),(59,'20261119102020305','92405',20,'shonu','2026-11-19 15:27:00'),(60,'20261119102020306','78214',22,'shonu','2026-11-19 15:30:01'),(61,'20261119102020307','86556',30,'shonu','2026-11-19 15:33:00'),(62,'20261119102020308','91248',24,'shonu','2026-11-19 17:45:45'),(63,'20261119102020309','46883',29,'shonu','2026-11-19 17:48:03'),(64,'20261119102020310','28744',25,'shonu','2026-11-19 17:48:49'),(65,'20261119102020311','59053',22,'shonu','2026-11-19 17:51:07'),(66,'20261119102020312','29836',28,'shonu','2026-11-19 17:51:53'),(67,'20261119102020313','43437',21,'shonu','2026-11-19 17:54:10'),(68,'20261119102020314','72054',18,'shonu','2026-11-19 17:54:56'),(69,'20261119102020315','75916',28,'shonu','2026-11-19 17:57:13'),(70,'20261119102020316','16284',21,'shonu','2026-11-19 17:57:59'),(71,'20261119102020317','84808',28,'shonu','2026-11-19 18:00:16'),(72,'20261119102020318','82155',21,'shonu','2026-11-19 18:03:19'),(73,'20261119102020319','93381',24,'shonu','2026-11-19 18:06:22'),(74,'20261119102020320','11092',13,'shonu','2026-11-19 18:09:25'),(75,'20261119102020321','59703',24,'shonu','2026-11-19 18:12:29'),(76,'20261119102020322','23332',13,'shonu','2026-11-19 18:15:32'),(77,'20261119102020323','36721',19,'shonu','2026-11-19 18:18:35'),(78,'20261119102020324','29177',26,'shonu','2026-11-19 18:21:39'),(79,'20261119102020325','65078',26,'shonu','2026-11-19 18:24:42'),(80,'20261119102020326','69563',29,'shonu','2026-11-19 18:27:45'),(81,'20261119102020327','16792',25,'shonu','2026-11-19 18:30:03'),(82,'20261119102020328','43324',16,'shonu','2026-11-19 18:30:48'),(83,'20261119102020329','57403',19,'shonu','2026-11-19 18:33:05'),(84,'20261119102020330','92283',24,'shonu','2026-11-19 18:33:51'),(85,'20261119102020331','38760',24,'shonu','2026-11-19 18:36:08'),(86,'20261119102020332','51719',23,'shonu','2026-11-19 18:36:54'),(87,'20261119102020333','68789',38,'shonu','2026-11-19 18:39:11'),(88,'20261119102020334','88543',28,'shonu','2026-11-19 18:39:57'),(89,'20261119102020335','54797',32,'shonu','2026-11-19 18:42:15'),(90,'20261119102020336','41333',14,'shonu','2026-11-19 18:45:18'),(91,'20261119102020337','02766',21,'shonu','2026-11-19 18:48:21'),(92,'20261119102020338','94191',24,'shonu','2026-11-19 18:51:25'),(93,'20261119102020339','32609',20,'shonu','2026-11-19 18:54:28'),(94,'20261119102020340','07765',25,'shonu','2026-11-19 18:57:31'),(95,'20261119102020341','03495',21,'shonu','2026-11-19 19:00:34'),(96,'20261119102020342','74294',26,'shonu','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `fived_results_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fived_results_5min`
--

DROP TABLE IF EXISTS `fived_results_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fived_results_5min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` varchar(255) NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COMMENT='5D lottery 5-min: published draw results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fived_results_5min`
--

LOCK TABLES `fived_results_5min` WRITE;
/*!40000 ALTER TABLE `fived_results_5min` DISABLE KEYS */;
INSERT INTO `fived_results_5min` VALUES (2,'20261119102030154','41662',19,'shonu','2026-11-19 12:50:00'),(3,'20261119102030155','72087',24,'shonu','2026-11-19 12:55:00'),(4,'20261119102030156','06733',19,'shonu','2026-11-19 13:00:01'),(5,'20261119102030157','17120',11,'shonu','2026-11-19 13:05:00'),(6,'20261119102030158','37932',24,'shonu','2026-11-19 13:10:00'),(7,'20261119102030159','08598',30,'shonu','2026-11-19 13:15:01'),(8,'20261119102030160','27107',17,'shonu','2026-11-19 13:20:00'),(9,'20261119102030161','27705',21,'shonu','2026-11-19 13:25:01'),(10,'20261119102030162','84353',23,'shonu','2026-11-19 13:30:00'),(11,'20261119102030163','87745',31,'shonu','2026-11-19 13:35:00'),(12,'20261119102030164','47255',23,'shonu','2026-11-19 13:40:01'),(13,'20261119102030165','54776',29,'shonu','2026-11-19 13:45:01'),(14,'20261119102030166','26026',16,'shonu','2026-11-19 13:50:01'),(15,'20261119102030167','67379',32,'shonu','2026-11-19 13:55:01'),(16,'20261119102030168','25617',21,'shonu','2026-11-19 14:00:02'),(17,'20261119102030169','62149',22,'shonu','2026-11-19 14:05:00'),(18,'20261119102030170','16104',12,'shonu','2026-11-19 14:10:00'),(19,'20261119102030171','24538',22,'shonu','2026-11-19 14:15:00'),(20,'20261119102030172','94614',24,'shonu','2026-11-19 14:20:01'),(21,'20261119102030173','65558',29,'shonu','2026-11-19 14:25:01'),(22,'20261119102030174','40716',18,'shonu','2026-11-19 14:35:00'),(23,'20261119102030175','85581',27,'shonu','2026-11-19 14:40:00'),(24,'20261119102030176','90823',22,'shonu','2026-11-19 14:45:01'),(25,'20261119102030177','20718',18,'shonu','2026-11-19 14:50:00'),(26,'20261119102030178','16339',22,'shonu','2026-11-19 14:55:01'),(27,'20261119102030179','90715',22,'shonu','2026-11-19 15:00:00'),(28,'20261119102030180','04706',17,'shonu','2026-11-19 15:05:00'),(29,'20261119102030181','52674',24,'shonu','2026-11-19 15:10:00'),(30,'20261119102030182','76217',23,'shonu','2026-11-19 15:15:01'),(31,'20261119102030183','18741',21,'shonu','2026-11-19 15:20:01'),(32,'20261119102030184','21116',11,'shonu','2026-11-19 15:25:00'),(33,'20261119102030185','70332',15,'shonu','2026-11-19 15:30:01'),(34,'20261119102030186','54532',19,'shonu','2026-11-19 15:35:00'),(35,'20261119102030187','64276',25,'shonu','2026-11-19 15:35:21'),(36,'20261119102030188','51754',22,'shonu','2026-11-19 15:35:48'),(37,'20261119102030189','43664',23,'shonu','2026-11-19 17:45:45'),(38,'20261119102030190','46828',28,'shonu','2026-11-19 17:50:20'),(39,'20261119102030191','77812',25,'shonu','2026-11-19 17:55:42'),(40,'20261119102030192','86306',23,'shonu','2026-11-19 18:00:17'),(41,'20261119102030193','83842',25,'shonu','2026-11-19 18:05:36'),(42,'20261119102030194','01511',8,'shonu','2026-11-19 18:10:11'),(43,'20261119102030195','43358',23,'shonu','2026-11-19 18:10:57'),(44,'20261119102030196','77052',21,'shonu','2026-11-19 18:15:32'),(45,'20261119102030197','49349',29,'shonu','2026-11-19 18:20:07'),(46,'20261119102030198','56595',30,'shonu','2026-11-19 18:20:53'),(47,'20261119102030199','73172',20,'shonu','2026-11-19 18:25:28'),(48,'20261119102030200','28045',19,'shonu','2026-11-19 18:30:03'),(49,'20261119102030201','98752',31,'shonu','2026-11-19 18:30:48'),(50,'20261119102030202','16486',25,'shonu','2026-11-19 18:35:22'),(51,'20261119102030203','61739',26,'shonu','2026-11-19 18:40:43'),(52,'20261119102030204','17966',29,'shonu','2026-11-19 18:45:18'),(53,'20261119102030205','40228',16,'shonu','2026-11-19 18:50:39'),(54,'20261119102030206','07871',23,'shonu','2026-11-19 18:55:14'),(55,'20261119102030207','52599',30,'shonu','2026-11-19 18:56:01'),(56,'20261119102030208','54545',23,'shonu','2026-11-19 19:00:34');
/*!40000 ALTER TABLE `fived_results_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_codes`
--

DROP TABLE IF EXISTS `gift_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_codes` (
  `identite` int NOT NULL AUTO_INCREMENT,
  `enserie` varchar(200) NOT NULL,
  `utilisateurmax` varchar(200) NOT NULL,
  `prix` varchar(200) NOT NULL,
  `nombredutilisateurs` varchar(200) NOT NULL,
  `creerunrendezvous` varchar(200) NOT NULL,
  `shonu` varchar(200) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identite`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Gift/redeem codes (serial, value, max users, usage count, status)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_codes`
--

LOCK TABLES `gift_codes` WRITE;
/*!40000 ALTER TABLE `gift_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_bonus_records`
--

DROP TABLE IF EXISTS `invite_bonus_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invite_bonus_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `motta` varchar(255) NOT NULL DEFAULT '0',
  `arthur` varchar(300) NOT NULL,
  `fleck` varchar(300) NOT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Invitation/task bonus grants per user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_bonus_records`
--

LOCK TABLES `invite_bonus_records` WRITE;
/*!40000 ALTER TABLE `invite_bonus_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_bonus_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_bonus_table`
--

DROP TABLE IF EXISTS `invite_bonus_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invite_bonus_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 20: invite bonus queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_bonus_table`
--

LOCK TABLES `invite_bonus_table` WRITE;
/*!40000 ALTER TABLE `invite_bonus_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_bonus_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_bets_10min`
--

DROP TABLE IF EXISTS `k3_bets_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_bets_10min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='K3 dice game 10-min: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_bets_10min`
--

LOCK TABLES `k3_bets_10min` WRITE;
/*!40000 ALTER TABLE `k3_bets_10min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_bets_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_bets_1min`
--

DROP TABLE IF EXISTS `k3_bets_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_bets_1min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='K3 dice game 1-min: individual user bets (dice sums big/small/odd/even)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_bets_1min`
--

LOCK TABLES `k3_bets_1min` WRITE;
/*!40000 ALTER TABLE `k3_bets_1min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_bets_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_bets_3min`
--

DROP TABLE IF EXISTS `k3_bets_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_bets_3min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='K3 dice game 3-min: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_bets_3min`
--

LOCK TABLES `k3_bets_3min` WRITE;
/*!40000 ALTER TABLE `k3_bets_3min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_bets_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_bets_5min`
--

DROP TABLE IF EXISTS `k3_bets_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_bets_5min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='K3 dice game 5-min: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_bets_5min`
--

LOCK TABLES `k3_bets_5min` WRITE;
/*!40000 ALTER TABLE `k3_bets_5min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_bets_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_manual_result_10min`
--

DROP TABLE IF EXISTS `k3_manual_result_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_manual_result_10min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='K3 dice 10-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_manual_result_10min`
--

LOCK TABLES `k3_manual_result_10min` WRITE;
/*!40000 ALTER TABLE `k3_manual_result_10min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_manual_result_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_manual_result_1min`
--

DROP TABLE IF EXISTS `k3_manual_result_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_manual_result_1min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='K3 dice 1-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_manual_result_1min`
--

LOCK TABLES `k3_manual_result_1min` WRITE;
/*!40000 ALTER TABLE `k3_manual_result_1min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_manual_result_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_manual_result_3min`
--

DROP TABLE IF EXISTS `k3_manual_result_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_manual_result_3min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='K3 dice 3-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_manual_result_3min`
--

LOCK TABLES `k3_manual_result_3min` WRITE;
/*!40000 ALTER TABLE `k3_manual_result_3min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_manual_result_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_manual_result_5min`
--

DROP TABLE IF EXISTS `k3_manual_result_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_manual_result_5min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `sankhye` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='K3 dice 5-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_manual_result_5min`
--

LOCK TABLES `k3_manual_result_5min` WRITE;
/*!40000 ALTER TABLE `k3_manual_result_5min` DISABLE KEYS */;
/*!40000 ALTER TABLE `k3_manual_result_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_periods_10min`
--

DROP TABLE IF EXISTS `k3_periods_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_periods_10min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='K3 dice 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_10min`
--

LOCK TABLES `k3_periods_10min` WRITE;
/*!40000 ALTER TABLE `k3_periods_10min` DISABLE KEYS */;
INSERT INTO `k3_periods_10min` VALUES (2,'20261119101040078','2026-11-19 12:50:00'),(3,'20261119101040079','2026-11-19 13:00:01'),(4,'20261119101040080','2026-11-19 13:10:00'),(5,'20261119101040081','2026-11-19 13:20:01'),(6,'20261119101040082','2026-11-19 13:30:01'),(7,'20261119101040083','2026-11-19 13:40:01'),(8,'20261119101040084','2026-11-19 13:50:01'),(9,'20261119101040085','2026-11-19 14:00:02'),(10,'20261119101040086','2026-11-19 14:10:00'),(11,'20261119101040087','2026-11-19 14:20:01'),(12,'20261119101040088','2026-11-19 14:40:00'),(13,'20261119101040089','2026-11-19 14:50:00'),(14,'20261119101040090','2026-11-19 15:00:01'),(15,'20261119101040091','2026-11-19 15:10:00'),(16,'20261119101040092','2026-11-19 15:20:01'),(17,'20261119101040093','2026-11-19 15:30:02'),(18,'20261119101040094','2026-11-19 17:50:21'),(19,'20261119101040095','2026-11-19 18:00:17'),(20,'20261119101040096','2026-11-19 18:10:11'),(21,'20261119101040097','2026-11-19 18:10:57'),(22,'20261119101040098','2026-11-19 18:20:07'),(23,'20261119101040099','2026-11-19 18:20:53'),(24,'20261119101040100','2026-11-19 18:30:03'),(25,'20261119101040101','2026-11-19 18:30:49'),(26,'20261119101040102','2026-11-19 18:40:44'),(27,'20261119101040103','2026-11-19 18:50:39'),(28,'20261119101040104','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `k3_periods_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_periods_1min`
--

DROP TABLE IF EXISTS `k3_periods_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_periods_1min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=304 DEFAULT CHARSET=latin1 COMMENT='K3 dice 1-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_1min`
--

LOCK TABLES `k3_periods_1min` WRITE;
/*!40000 ALTER TABLE `k3_periods_1min` DISABLE KEYS */;
INSERT INTO `k3_periods_1min` VALUES (12,'20261119101010752','2026-11-19 12:31:12'),(13,'20261119101010753','2026-11-19 12:33:08'),(14,'20261119101010754','2026-11-19 12:34:23'),(15,'20261119101010755','2026-11-19 12:34:55'),(16,'20261119101010756','2026-11-19 12:44:01'),(17,'20261119101010757','2026-11-19 12:45:00'),(18,'20261119101010758','2026-11-19 12:46:00'),(19,'20261119101010759','2026-11-19 12:47:00'),(20,'20261119101010760','2026-11-19 12:48:00'),(21,'20261119101010761','2026-11-19 12:49:00'),(22,'20261119101010762','2026-11-19 12:50:00'),(23,'20261119101010763','2026-11-19 12:51:00'),(24,'20261119101010764','2026-11-19 12:52:00'),(25,'20261119101010765','2026-11-19 12:53:00'),(26,'20261119101010766','2026-11-19 12:54:00'),(27,'20261119101010767','2026-11-19 12:55:00'),(28,'20261119101010768','2026-11-19 12:56:00'),(29,'20261119101010769','2026-11-19 12:57:00'),(30,'20261119101010770','2026-11-19 12:58:00'),(31,'20261119101010771','2026-11-19 12:59:00'),(32,'20261119101010772','2026-11-19 13:00:00'),(33,'20261119101010773','2026-11-19 13:01:00'),(34,'20261119101010774','2026-11-19 13:02:00'),(35,'20261119101010775','2026-11-19 13:03:00'),(36,'20261119101010776','2026-11-19 13:04:00'),(37,'20261119101010777','2026-11-19 13:05:00'),(38,'20261119101010778','2026-11-19 13:06:00'),(39,'20261119101010779','2026-11-19 13:07:00'),(40,'20261119101010780','2026-11-19 13:08:00'),(41,'20261119101010781','2026-11-19 13:09:00'),(42,'20261119101010782','2026-11-19 13:10:00'),(43,'20261119101010783','2026-11-19 13:11:00'),(44,'20261119101010784','2026-11-19 13:12:00'),(45,'20261119101010785','2026-11-19 13:13:00'),(46,'20261119101010786','2026-11-19 13:14:00'),(47,'20261119101010787','2026-11-19 13:15:00'),(48,'20261119101010788','2026-11-19 13:16:00'),(49,'20261119101010789','2026-11-19 13:17:00'),(50,'20261119101010790','2026-11-19 13:18:00'),(51,'20261119101010791','2026-11-19 13:19:00'),(52,'20261119101010792','2026-11-19 13:20:00'),(53,'20261119101010793','2026-11-19 13:21:00'),(54,'20261119101010794','2026-11-19 13:22:00'),(55,'20261119101010795','2026-11-19 13:23:00'),(56,'20261119101010796','2026-11-19 13:24:00'),(57,'20261119101010797','2026-11-19 13:25:00'),(58,'20261119101010798','2026-11-19 13:26:00'),(59,'20261119101010799','2026-11-19 13:27:00'),(60,'20261119101010800','2026-11-19 13:28:00'),(61,'20261119101010801','2026-11-19 13:29:00'),(62,'20261119101010802','2026-11-19 13:30:00'),(63,'20261119101010803','2026-11-19 13:31:00'),(64,'20261119101010804','2026-11-19 13:32:00'),(65,'20261119101010805','2026-11-19 13:33:00'),(66,'20261119101010806','2026-11-19 13:34:00'),(67,'20261119101010807','2026-11-19 13:35:00'),(68,'20261119101010808','2026-11-19 13:36:00'),(69,'20261119101010809','2026-11-19 13:37:00'),(70,'20261119101010810','2026-11-19 13:38:00'),(71,'20261119101010811','2026-11-19 13:39:00'),(72,'20261119101010812','2026-11-19 13:40:00'),(73,'20261119101010813','2026-11-19 13:41:00'),(74,'20261119101010814','2026-11-19 13:42:00'),(75,'20261119101010815','2026-11-19 13:43:00'),(76,'20261119101010816','2026-11-19 13:44:00'),(77,'20261119101010817','2026-11-19 13:45:00'),(78,'20261119101010818','2026-11-19 13:46:00'),(79,'20261119101010819','2026-11-19 13:47:00'),(80,'20261119101010820','2026-11-19 13:48:00'),(81,'20261119101010821','2026-11-19 13:49:00'),(82,'20261119101010822','2026-11-19 13:50:01'),(83,'20261119101010823','2026-11-19 13:51:00'),(84,'20261119101010824','2026-11-19 13:52:00'),(85,'20261119101010825','2026-11-19 13:53:00'),(86,'20261119101010826','2026-11-19 13:54:00'),(87,'20261119101010827','2026-11-19 13:55:00'),(88,'20261119101010828','2026-11-19 13:56:00'),(89,'20261119101010829','2026-11-19 13:57:00'),(90,'20261119101010830','2026-11-19 13:58:00'),(91,'20261119101010831','2026-11-19 13:59:00'),(92,'20261119101010832','2026-11-19 14:00:00'),(93,'20261119101010833','2026-11-19 14:01:00'),(94,'20261119101010834','2026-11-19 14:02:00'),(95,'20261119101010835','2026-11-19 14:03:00'),(96,'20261119101010836','2026-11-19 14:04:00'),(97,'20261119101010837','2026-11-19 14:05:00'),(98,'20261119101010838','2026-11-19 14:06:00'),(99,'20261119101010839','2026-11-19 14:07:00'),(100,'20261119101010840','2026-11-19 14:08:00'),(101,'20261119101010841','2026-11-19 14:09:00'),(102,'20261119101010842','2026-11-19 14:10:00'),(103,'20261119101010843','2026-11-19 14:11:00'),(104,'20261119101010844','2026-11-19 14:12:00'),(105,'20261119101010845','2026-11-19 14:13:00'),(106,'20261119101010846','2026-11-19 14:14:00'),(107,'20261119101010847','2026-11-19 14:15:00'),(108,'20261119101010848','2026-11-19 14:16:00'),(109,'20261119101010849','2026-11-19 14:17:00'),(110,'20261119101010850','2026-11-19 14:18:00'),(111,'20261119101010851','2026-11-19 14:19:00'),(112,'20261119101010852','2026-11-19 14:20:00'),(113,'20261119101010853','2026-11-19 14:21:00'),(114,'20261119101010854','2026-11-19 14:22:00'),(115,'20261119101010855','2026-11-19 14:23:00'),(116,'20261119101010856','2026-11-19 14:24:00'),(117,'20261119101010857','2026-11-19 14:25:00'),(118,'20261119101010858','2026-11-19 14:26:00'),(119,'20261119101010859','2026-11-19 14:27:00'),(120,'20261119101010860','2026-11-19 14:28:00'),(121,'20261119101010861','2026-11-19 14:29:00'),(122,'20261119101010862','2026-11-19 14:29:04'),(123,'20261119101010863','2026-11-19 14:29:11'),(124,'20261119101010864','2026-11-19 14:29:23'),(125,'20261119101010865','2026-11-19 14:30:00'),(126,'20261119101010866','2026-11-19 14:31:00'),(127,'20261119101010867','2026-11-19 14:32:00'),(128,'20261119101010868','2026-11-19 14:33:00'),(129,'20261119101010869','2026-11-19 14:34:00'),(130,'20261119101010870','2026-11-19 14:35:00'),(131,'20261119101010871','2026-11-19 14:36:00'),(132,'20261119101010872','2026-11-19 14:37:00'),(133,'20261119101010873','2026-11-19 14:38:00'),(134,'20261119101010874','2026-11-19 14:39:00'),(135,'20261119101010875','2026-11-19 14:40:00'),(136,'20261119101010876','2026-11-19 14:41:00'),(137,'20261119101010877','2026-11-19 14:42:00'),(138,'20261119101010878','2026-11-19 14:43:00'),(139,'20261119101010879','2026-11-19 14:44:00'),(140,'20261119101010880','2026-11-19 14:45:00'),(141,'20261119101010881','2026-11-19 14:46:00'),(142,'20261119101010882','2026-11-19 14:47:00'),(143,'20261119101010883','2026-11-19 14:48:00'),(144,'20261119101010884','2026-11-19 14:49:00'),(145,'20261119101010885','2026-11-19 14:50:00'),(146,'20261119101010886','2026-11-19 14:51:00'),(147,'20261119101010887','2026-11-19 14:52:00'),(148,'20261119101010888','2026-11-19 14:53:01'),(149,'20261119101010889','2026-11-19 14:54:00'),(150,'20261119101010890','2026-11-19 14:55:00'),(151,'20261119101010891','2026-11-19 14:56:00'),(152,'20261119101010892','2026-11-19 14:57:00'),(153,'20261119101010893','2026-11-19 14:58:00'),(154,'20261119101010894','2026-11-19 14:59:00'),(155,'20261119101010895','2026-11-19 15:00:00'),(156,'20261119101010896','2026-11-19 15:01:00'),(157,'20261119101010897','2026-11-19 15:02:00'),(158,'20261119101010898','2026-11-19 15:03:00'),(159,'20261119101010899','2026-11-19 15:04:00'),(160,'20261119101010900','2026-11-19 15:05:00'),(161,'20261119101010901','2026-11-19 15:06:00'),(162,'20261119101010902','2026-11-19 15:07:00'),(163,'20261119101010903','2026-11-19 15:08:01'),(164,'20261119101010904','2026-11-19 15:09:00'),(165,'20261119101010905','2026-11-19 15:10:00'),(166,'20261119101010906','2026-11-19 15:11:00'),(167,'20261119101010907','2026-11-19 15:12:00'),(168,'20261119101010908','2026-11-19 15:13:00'),(169,'20261119101010909','2026-11-19 15:14:00'),(170,'20261119101010910','2026-11-19 15:15:00'),(171,'20261119101010911','2026-11-19 15:16:00'),(172,'20261119101010912','2026-11-19 15:17:00'),(173,'20261119101010913','2026-11-19 15:18:00'),(174,'20261119101010914','2026-11-19 15:19:00'),(175,'20261119101010915','2026-11-19 15:20:00'),(176,'20261119101010916','2026-11-19 15:21:00'),(177,'20261119101010917','2026-11-19 15:22:00'),(178,'20261119101010918','2026-11-19 15:23:00'),(179,'20261119101010919','2026-11-19 15:24:00'),(180,'20261119101010920','2026-11-19 15:25:00'),(181,'20261119101010921','2026-11-19 15:26:00'),(182,'20261119101010922','2026-11-19 15:27:00'),(183,'20261119101010923','2026-11-19 15:28:00'),(184,'20261119101010924','2026-11-19 15:29:00'),(185,'20261119101010925','2026-11-19 15:30:00'),(186,'20261119101010926','2026-11-19 15:31:00'),(187,'20261119101010927','2026-11-19 15:32:00'),(188,'20261119101010928','2026-11-19 15:33:00'),(189,'20261119101010929','2026-11-19 15:34:00'),(190,'20261119101010930','2026-11-19 15:35:00'),(191,'20261119101010931','2026-11-19 15:35:03'),(192,'20261119101010932','2026-11-19 15:35:21'),(193,'20261119101010933','2026-11-19 15:35:48'),(194,'20261119101010934','2026-11-19 15:36:00'),(195,'20261119101010935','2026-11-19 15:37:00'),(196,'20261119101010936','2026-11-19 15:38:00'),(197,'20261119101010937','2026-11-19 15:38:51'),(198,'20261119101010938','2026-11-19 15:39:00'),(199,'20261119101010939','2026-11-19 17:44:13'),(200,'20261119101010940','2026-11-19 17:44:59'),(201,'20261119101010941','2026-11-19 17:45:45'),(202,'20261119101010942','2026-11-19 17:46:31'),(203,'20261119101010943','2026-11-19 17:47:17'),(204,'20261119101010944','2026-11-19 17:48:03'),(205,'20261119101010945','2026-11-19 17:48:49'),(206,'20261119101010946','2026-11-19 17:49:35'),(207,'20261119101010947','2026-11-19 17:50:20'),(208,'20261119101010948','2026-11-19 17:51:06'),(209,'20261119101010949','2026-11-19 17:51:52'),(210,'20261119101010950','2026-11-19 17:52:38'),(211,'20261119101010951','2026-11-19 17:53:24'),(212,'20261119101010952','2026-11-19 17:54:10'),(213,'20261119101010953','2026-11-19 17:54:55'),(214,'20261119101010954','2026-11-19 17:55:41'),(215,'20261119101010955','2026-11-19 17:56:27'),(216,'20261119101010956','2026-11-19 17:57:13'),(217,'20261119101010957','2026-11-19 17:57:59'),(218,'20261119101010958','2026-11-19 17:58:45'),(219,'20261119101010959','2026-11-19 17:59:30'),(220,'20261119101010960','2026-11-19 18:00:16'),(221,'20261119101010961','2026-11-19 18:01:01'),(222,'20261119101010962','2026-11-19 18:01:47'),(223,'20261119101010963','2026-11-19 18:02:33'),(224,'20261119101010964','2026-11-19 18:03:19'),(225,'20261119101010965','2026-11-19 18:04:04'),(226,'20261119101010966','2026-11-19 18:04:50'),(227,'20261119101010967','2026-11-19 18:05:36'),(228,'20261119101010968','2026-11-19 18:06:22'),(229,'20261119101010969','2026-11-19 18:07:08'),(230,'20261119101010970','2026-11-19 18:07:53'),(231,'20261119101010971','2026-11-19 18:08:39'),(232,'20261119101010972','2026-11-19 18:09:25'),(233,'20261119101010973','2026-11-19 18:10:10'),(234,'20261119101010974','2026-11-19 18:10:57'),(235,'20261119101010975','2026-11-19 18:11:43'),(236,'20261119101010976','2026-11-19 18:12:29'),(237,'20261119101010977','2026-11-19 18:13:15'),(238,'20261119101010978','2026-11-19 18:14:00'),(239,'20261119101010979','2026-11-19 18:14:46'),(240,'20261119101010980','2026-11-19 18:15:31'),(241,'20261119101010981','2026-11-19 18:16:18'),(242,'20261119101010982','2026-11-19 18:17:04'),(243,'20261119101010983','2026-11-19 18:17:49'),(244,'20261119101010984','2026-11-19 18:18:35'),(245,'20261119101010985','2026-11-19 18:19:21'),(246,'20261119101010986','2026-11-19 18:20:07'),(247,'20261119101010987','2026-11-19 18:20:53'),(248,'20261119101010988','2026-11-19 18:21:39'),(249,'20261119101010989','2026-11-19 18:22:25'),(250,'20261119101010990','2026-11-19 18:23:10'),(251,'20261119101010991','2026-11-19 18:23:56'),(252,'20261119101010992','2026-11-19 18:24:42'),(253,'20261119101010993','2026-11-19 18:25:28'),(254,'20261119101010994','2026-11-19 18:26:14'),(255,'20261119101010995','2026-11-19 18:26:59'),(256,'20261119101010996','2026-11-19 18:27:45'),(257,'20261119101010997','2026-11-19 18:28:31'),(258,'20261119101010998','2026-11-19 18:29:17'),(259,'20261119101010999','2026-11-19 18:30:02'),(260,'20261119101011000','2026-11-19 18:30:48'),(261,'20261119101011001','2026-11-19 18:31:33'),(262,'20261119101011002','2026-11-19 18:32:19'),(263,'20261119101011003','2026-11-19 18:33:05'),(264,'20261119101011004','2026-11-19 18:33:51'),(265,'20261119101011005','2026-11-19 18:34:36'),(266,'20261119101011006','2026-11-19 18:35:22'),(267,'20261119101011007','2026-11-19 18:36:08'),(268,'20261119101011008','2026-11-19 18:36:54'),(269,'20261119101011009','2026-11-19 18:37:40'),(270,'20261119101011010','2026-11-19 18:38:26'),(271,'20261119101011011','2026-11-19 18:39:11'),(272,'20261119101011012','2026-11-19 18:39:57'),(273,'20261119101011013','2026-11-19 18:40:43'),(274,'20261119101011014','2026-11-19 18:41:29'),(275,'20261119101011015','2026-11-19 18:42:15'),(276,'20261119101011016','2026-11-19 18:43:01'),(277,'20261119101011017','2026-11-19 18:43:46'),(278,'20261119101011018','2026-11-19 18:44:32'),(279,'20261119101011019','2026-11-19 18:45:18'),(280,'20261119101011020','2026-11-19 18:46:04'),(281,'20261119101011021','2026-11-19 18:46:50'),(282,'20261119101011022','2026-11-19 18:47:35'),(283,'20261119101011023','2026-11-19 18:48:21'),(284,'20261119101011024','2026-11-19 18:49:07'),(285,'20261119101011025','2026-11-19 18:49:53'),(286,'20261119101011026','2026-11-19 18:50:38'),(287,'20261119101011027','2026-11-19 18:51:25'),(288,'20261119101011028','2026-11-19 18:52:10'),(289,'20261119101011029','2026-11-19 18:52:56'),(290,'20261119101011030','2026-11-19 18:53:42'),(291,'20261119101011031','2026-11-19 18:54:27'),(292,'20261119101011032','2026-11-19 18:55:13'),(293,'20261119101011033','2026-11-19 18:55:59'),(294,'20261119101011034','2026-11-19 18:56:45'),(295,'20261119101011035','2026-11-19 18:57:31'),(296,'20261119101011036','2026-11-19 18:58:17'),(297,'20261119101011037','2026-11-19 18:59:02'),(298,'20261119101011038','2026-11-19 18:59:48'),(299,'20261119101011039','2026-11-19 19:00:34'),(300,'20261119101011040','2026-11-19 19:01:19'),(301,'20261119101011041','2026-11-19 19:02:05'),(302,'20261119101011042','2026-11-19 19:02:50'),(303,'20261119101011043','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `k3_periods_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_periods_3min`
--

DROP TABLE IF EXISTS `k3_periods_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_periods_3min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 COMMENT='K3 dice 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_3min`
--

LOCK TABLES `k3_periods_3min` WRITE;
/*!40000 ALTER TABLE `k3_periods_3min` DISABLE KEYS */;
INSERT INTO `k3_periods_3min` VALUES (7,'20261119101020252','2026-11-19 12:33:09'),(8,'20261119101020253','2026-11-19 12:45:00'),(9,'20261119101020254','2026-11-19 12:48:01'),(10,'20261119101020255','2026-11-19 12:51:01'),(11,'20261119101020256','2026-11-19 12:54:00'),(12,'20261119101020257','2026-11-19 12:57:00'),(13,'20261119101020258','2026-11-19 13:00:00'),(14,'20261119101020259','2026-11-19 13:03:00'),(15,'20261119101020260','2026-11-19 13:06:00'),(16,'20261119101020261','2026-11-19 13:09:00'),(17,'20261119101020262','2026-11-19 13:12:00'),(18,'20261119101020263','2026-11-19 13:15:01'),(19,'20261119101020264','2026-11-19 13:18:00'),(20,'20261119101020265','2026-11-19 13:21:01'),(21,'20261119101020266','2026-11-19 13:24:00'),(22,'20261119101020267','2026-11-19 13:27:01'),(23,'20261119101020268','2026-11-19 13:30:00'),(24,'20261119101020269','2026-11-19 13:33:00'),(25,'20261119101020270','2026-11-19 13:36:01'),(26,'20261119101020271','2026-11-19 13:39:00'),(27,'20261119101020272','2026-11-19 13:42:00'),(28,'20261119101020273','2026-11-19 13:45:00'),(29,'20261119101020274','2026-11-19 13:48:00'),(30,'20261119101020275','2026-11-19 13:51:01'),(31,'20261119101020276','2026-11-19 13:54:00'),(32,'20261119101020277','2026-11-19 13:57:01'),(33,'20261119101020278','2026-11-19 14:00:01'),(34,'20261119101020279','2026-11-19 14:03:00'),(35,'20261119101020280','2026-11-19 14:06:01'),(36,'20261119101020281','2026-11-19 14:09:00'),(37,'20261119101020282','2026-11-19 14:12:01'),(38,'20261119101020283','2026-11-19 14:15:00'),(39,'20261119101020284','2026-11-19 14:18:01'),(40,'20261119101020285','2026-11-19 14:21:01'),(41,'20261119101020286','2026-11-19 14:24:00'),(42,'20261119101020287','2026-11-19 14:27:01'),(43,'20261119101020288','2026-11-19 14:33:00'),(44,'20261119101020289','2026-11-19 14:36:01'),(45,'20261119101020290','2026-11-19 14:39:00'),(46,'20261119101020291','2026-11-19 14:42:00'),(47,'20261119101020292','2026-11-19 14:45:01'),(48,'20261119101020293','2026-11-19 14:48:00'),(49,'20261119101020294','2026-11-19 14:51:00'),(50,'20261119101020295','2026-11-19 14:54:00'),(51,'20261119101020296','2026-11-19 14:57:01'),(52,'20261119101020297','2026-11-19 15:00:00'),(53,'20261119101020298','2026-11-19 15:03:00'),(54,'20261119101020299','2026-11-19 15:06:00'),(55,'20261119101020300','2026-11-19 15:09:01'),(56,'20261119101020301','2026-11-19 15:12:00'),(57,'20261119101020302','2026-11-19 15:15:01'),(58,'20261119101020303','2026-11-19 15:18:01'),(59,'20261119101020304','2026-11-19 15:21:01'),(60,'20261119101020305','2026-11-19 15:24:01'),(61,'20261119101020306','2026-11-19 15:27:00'),(62,'20261119101020307','2026-11-19 15:30:01'),(63,'20261119101020308','2026-11-19 15:33:00'),(64,'20261119101020309','2026-11-19 17:45:45'),(65,'20261119101020310','2026-11-19 17:48:03'),(66,'20261119101020311','2026-11-19 17:48:49'),(67,'20261119101020312','2026-11-19 17:51:07'),(68,'20261119101020313','2026-11-19 17:51:53'),(69,'20261119101020314','2026-11-19 17:54:10'),(70,'20261119101020315','2026-11-19 17:54:56'),(71,'20261119101020316','2026-11-19 17:57:13'),(72,'20261119101020317','2026-11-19 17:57:59'),(73,'20261119101020318','2026-11-19 18:00:16'),(74,'20261119101020319','2026-11-19 18:03:19'),(75,'20261119101020320','2026-11-19 18:06:22'),(76,'20261119101020321','2026-11-19 18:09:25'),(77,'20261119101020322','2026-11-19 18:12:29'),(78,'20261119101020323','2026-11-19 18:15:32'),(79,'20261119101020324','2026-11-19 18:18:35'),(80,'20261119101020325','2026-11-19 18:21:39'),(81,'20261119101020326','2026-11-19 18:24:42'),(82,'20261119101020327','2026-11-19 18:27:45'),(83,'20261119101020328','2026-11-19 18:30:03'),(84,'20261119101020329','2026-11-19 18:30:48'),(85,'20261119101020330','2026-11-19 18:33:05'),(86,'20261119101020331','2026-11-19 18:33:51'),(87,'20261119101020332','2026-11-19 18:36:08'),(88,'20261119101020333','2026-11-19 18:36:54'),(89,'20261119101020334','2026-11-19 18:39:11'),(90,'20261119101020335','2026-11-19 18:39:57'),(91,'20261119101020336','2026-11-19 18:42:15'),(92,'20261119101020337','2026-11-19 18:45:18'),(93,'20261119101020338','2026-11-19 18:48:21'),(94,'20261119101020339','2026-11-19 18:51:25'),(95,'20261119101020340','2026-11-19 18:54:28'),(96,'20261119101020341','2026-11-19 18:57:31'),(97,'20261119101020342','2026-11-19 19:00:34'),(98,'20261119101020343','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `k3_periods_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_periods_5min`
--

DROP TABLE IF EXISTS `k3_periods_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_periods_5min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COMMENT='K3 dice 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_periods_5min`
--

LOCK TABLES `k3_periods_5min` WRITE;
/*!40000 ALTER TABLE `k3_periods_5min` DISABLE KEYS */;
INSERT INTO `k3_periods_5min` VALUES (3,'20261119101030154','2026-11-19 12:45:00'),(4,'20261119101030155','2026-11-19 12:50:00'),(5,'20261119101030156','2026-11-19 12:55:00'),(6,'20261119101030157','2026-11-19 13:00:01'),(7,'20261119101030158','2026-11-19 13:05:00'),(8,'20261119101030159','2026-11-19 13:10:00'),(9,'20261119101030160','2026-11-19 13:15:01'),(10,'20261119101030161','2026-11-19 13:20:00'),(11,'20261119101030162','2026-11-19 13:25:01'),(12,'20261119101030163','2026-11-19 13:30:00'),(13,'20261119101030164','2026-11-19 13:35:00'),(14,'20261119101030165','2026-11-19 13:40:01'),(15,'20261119101030166','2026-11-19 13:45:01'),(16,'20261119101030167','2026-11-19 13:50:01'),(17,'20261119101030168','2026-11-19 13:55:01'),(18,'20261119101030169','2026-11-19 14:00:02'),(19,'20261119101030170','2026-11-19 14:05:00'),(20,'20261119101030171','2026-11-19 14:10:00'),(21,'20261119101030172','2026-11-19 14:15:00'),(22,'20261119101030173','2026-11-19 14:20:01'),(23,'20261119101030174','2026-11-19 14:25:01'),(24,'20261119101030175','2026-11-19 14:35:00'),(25,'20261119101030176','2026-11-19 14:40:00'),(26,'20261119101030177','2026-11-19 14:45:01'),(27,'20261119101030178','2026-11-19 14:50:00'),(28,'20261119101030179','2026-11-19 14:55:01'),(29,'20261119101030180','2026-11-19 15:00:00'),(30,'20261119101030181','2026-11-19 15:05:00'),(31,'20261119101030182','2026-11-19 15:10:00'),(32,'20261119101030183','2026-11-19 15:15:01'),(33,'20261119101030184','2026-11-19 15:20:01'),(34,'20261119101030185','2026-11-19 15:25:00'),(35,'20261119101030186','2026-11-19 15:30:01'),(36,'20261119101030187','2026-11-19 15:35:00'),(37,'20261119101030188','2026-11-19 15:35:21'),(38,'20261119101030189','2026-11-19 15:35:48'),(39,'20261119101030190','2026-11-19 17:45:45'),(40,'20261119101030191','2026-11-19 17:50:20'),(41,'20261119101030192','2026-11-19 17:55:42'),(42,'20261119101030193','2026-11-19 18:00:17'),(43,'20261119101030194','2026-11-19 18:05:36'),(44,'20261119101030195','2026-11-19 18:10:11'),(45,'20261119101030196','2026-11-19 18:10:57'),(46,'20261119101030197','2026-11-19 18:15:32'),(47,'20261119101030198','2026-11-19 18:20:07'),(48,'20261119101030199','2026-11-19 18:20:53'),(49,'20261119101030200','2026-11-19 18:25:28'),(50,'20261119101030201','2026-11-19 18:30:03'),(51,'20261119101030202','2026-11-19 18:30:48'),(52,'20261119101030203','2026-11-19 18:35:22'),(53,'20261119101030204','2026-11-19 18:40:43'),(54,'20261119101030205','2026-11-19 18:45:18'),(55,'20261119101030206','2026-11-19 18:50:39'),(56,'20261119101030207','2026-11-19 18:55:14'),(57,'20261119101030208','2026-11-19 18:56:01'),(58,'20261119101030209','2026-11-19 19:00:34');
/*!40000 ALTER TABLE `k3_periods_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_results_10min`
--

DROP TABLE IF EXISTS `k3_results_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_results_10min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COMMENT='K3 dice 10-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_10min`
--

LOCK TABLES `k3_results_10min` WRITE;
/*!40000 ALTER TABLE `k3_results_10min` DISABLE KEYS */;
INSERT INTO `k3_results_10min` VALUES (1,'20261119101040078',422,8,'shonu','2026-11-19 13:00:01'),(2,'20261119101040079',126,9,'shonu','2026-11-19 13:10:00'),(3,'20261119101040080',223,7,'shonu','2026-11-19 13:20:01'),(4,'20261119101040081',133,7,'shonu','2026-11-19 13:30:01'),(5,'20261119101040082',162,9,'shonu','2026-11-19 13:40:01'),(6,'20261119101040083',666,18,'shonu','2026-11-19 13:50:01'),(7,'20261119101040084',461,11,'shonu','2026-11-19 14:00:02'),(8,'20261119101040085',366,15,'shonu','2026-11-19 14:10:00'),(9,'20261119101040086',512,8,'shonu','2026-11-19 14:20:01'),(10,'20261119101040087',432,9,'shonu','2026-11-19 14:40:00'),(11,'20261119101040088',316,10,'shonu','2026-11-19 14:50:00'),(12,'20261119101040089',645,15,'shonu','2026-11-19 15:00:01'),(13,'20261119101040090',233,8,'shonu','2026-11-19 15:10:00'),(14,'20261119101040091',442,10,'shonu','2026-11-19 15:20:01'),(15,'20261119101040092',231,6,'shonu','2026-11-19 15:30:02'),(16,'20261119101040093',664,16,'shonu','2026-11-19 17:50:21'),(17,'20261119101040094',424,10,'shonu','2026-11-19 18:00:17'),(18,'20261119101040095',344,11,'shonu','2026-11-19 18:10:11'),(19,'20261119101040096',443,11,'shonu','2026-11-19 18:10:57'),(20,'20261119101040097',552,12,'shonu','2026-11-19 18:20:07'),(21,'20261119101040098',412,7,'shonu','2026-11-19 18:20:53'),(22,'20261119101040099',315,9,'shonu','2026-11-19 18:30:03'),(23,'20261119101040100',366,15,'shonu','2026-11-19 18:30:49'),(24,'20261119101040101',311,5,'shonu','2026-11-19 18:40:44'),(25,'20261119101040102',433,10,'shonu','2026-11-19 18:50:39'),(26,'20261119101040103',344,11,'shonu','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `k3_results_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_results_1min`
--

DROP TABLE IF EXISTS `k3_results_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_results_1min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=latin1 COMMENT='K3 dice 1-min: published results per period (3 dice, sum)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_1min`
--

LOCK TABLES `k3_results_1min` WRITE;
/*!40000 ALTER TABLE `k3_results_1min` DISABLE KEYS */;
INSERT INTO `k3_results_1min` VALUES (11,'20261119101010752',511,7,'shonu','2026-11-19 12:33:08'),(12,'20261119101010753',114,6,'shonu','2026-11-19 12:34:23'),(13,'20261119101010754',312,6,'shonu','2026-11-19 12:34:55'),(14,'20261119101010755',222,6,'shonu','2026-11-19 12:44:01'),(15,'20261119101010756',141,6,'shonu','2026-11-19 12:45:00'),(16,'20261119101010757',461,11,'shonu','2026-11-19 12:46:00'),(17,'20261119101010758',226,10,'shonu','2026-11-19 12:47:00'),(18,'20261119101010759',141,6,'shonu','2026-11-19 12:48:00'),(19,'20261119101010760',134,8,'shonu','2026-11-19 12:49:00'),(20,'20261119101010761',545,14,'shonu','2026-11-19 12:50:00'),(21,'20261119101010762',256,13,'shonu','2026-11-19 12:51:00'),(22,'20261119101010763',362,11,'shonu','2026-11-19 12:52:00'),(23,'20261119101010764',246,12,'shonu','2026-11-19 12:53:00'),(24,'20261119101010765',235,10,'shonu','2026-11-19 12:54:00'),(25,'20261119101010766',366,15,'shonu','2026-11-19 12:55:00'),(26,'20261119101010767',113,5,'shonu','2026-11-19 12:56:00'),(27,'20261119101010768',534,12,'shonu','2026-11-19 12:57:00'),(28,'20261119101010769',245,11,'shonu','2026-11-19 12:58:00'),(29,'20261119101010770',655,16,'shonu','2026-11-19 12:59:00'),(30,'20261119101010771',653,14,'shonu','2026-11-19 13:00:00'),(31,'20261119101010772',526,13,'shonu','2026-11-19 13:01:00'),(32,'20261119101010773',646,16,'shonu','2026-11-19 13:02:00'),(33,'20261119101010774',636,15,'shonu','2026-11-19 13:03:00'),(34,'20261119101010775',556,16,'shonu','2026-11-19 13:04:00'),(35,'20261119101010776',235,10,'shonu','2026-11-19 13:05:00'),(36,'20261119101010777',143,8,'shonu','2026-11-19 13:06:00'),(37,'20261119101010778',146,11,'shonu','2026-11-19 13:07:00'),(38,'20261119101010779',331,7,'shonu','2026-11-19 13:08:00'),(39,'20261119101010780',223,7,'shonu','2026-11-19 13:09:00'),(40,'20261119101010781',222,6,'shonu','2026-11-19 13:10:00'),(41,'20261119101010782',153,9,'shonu','2026-11-19 13:11:00'),(42,'20261119101010783',242,8,'shonu','2026-11-19 13:12:00'),(43,'20261119101010784',631,10,'shonu','2026-11-19 13:13:00'),(44,'20261119101010785',514,10,'shonu','2026-11-19 13:14:00'),(45,'20261119101010786',642,12,'shonu','2026-11-19 13:15:00'),(46,'20261119101010787',122,5,'shonu','2026-11-19 13:16:00'),(47,'20261119101010788',613,10,'shonu','2026-11-19 13:17:00'),(48,'20261119101010789',631,10,'shonu','2026-11-19 13:18:00'),(49,'20261119101010790',111,3,'shonu','2026-11-19 13:19:00'),(50,'20261119101010791',644,14,'shonu','2026-11-19 13:20:00'),(51,'20261119101010792',343,10,'shonu','2026-11-19 13:21:00'),(52,'20261119101010793',532,10,'shonu','2026-11-19 13:22:00'),(53,'20261119101010794',442,10,'shonu','2026-11-19 13:23:00'),(54,'20261119101010795',155,11,'shonu','2026-11-19 13:24:00'),(55,'20261119101010796',622,10,'shonu','2026-11-19 13:25:00'),(56,'20261119101010797',543,12,'shonu','2026-11-19 13:26:00'),(57,'20261119101010798',136,10,'shonu','2026-11-19 13:27:00'),(58,'20261119101010799',452,11,'shonu','2026-11-19 13:28:00'),(59,'20261119101010800',543,12,'shonu','2026-11-19 13:29:00'),(60,'20261119101010801',225,9,'shonu','2026-11-19 13:30:00'),(61,'20261119101010802',665,17,'shonu','2026-11-19 13:31:00'),(62,'20261119101010803',445,13,'shonu','2026-11-19 13:32:00'),(63,'20261119101010804',363,12,'shonu','2026-11-19 13:33:00'),(64,'20261119101010805',641,11,'shonu','2026-11-19 13:34:00'),(65,'20261119101010806',415,10,'shonu','2026-11-19 13:35:00'),(66,'20261119101010807',624,12,'shonu','2026-11-19 13:36:00'),(67,'20261119101010808',236,11,'shonu','2026-11-19 13:37:00'),(68,'20261119101010809',633,12,'shonu','2026-11-19 13:38:00'),(69,'20261119101010810',335,11,'shonu','2026-11-19 13:39:00'),(70,'20261119101010811',623,11,'shonu','2026-11-19 13:40:00'),(71,'20261119101010812',163,10,'shonu','2026-11-19 13:41:00'),(72,'20261119101010813',533,11,'shonu','2026-11-19 13:42:00'),(73,'20261119101010814',344,11,'shonu','2026-11-19 13:43:00'),(74,'20261119101010815',462,12,'shonu','2026-11-19 13:44:00'),(75,'20261119101010816',426,12,'shonu','2026-11-19 13:45:00'),(76,'20261119101010817',524,11,'shonu','2026-11-19 13:46:00'),(77,'20261119101010818',423,9,'shonu','2026-11-19 13:47:00'),(78,'20261119101010819',432,9,'shonu','2026-11-19 13:48:00'),(79,'20261119101010820',466,16,'shonu','2026-11-19 13:49:00'),(80,'20261119101010821',644,14,'shonu','2026-11-19 13:50:00'),(81,'20261119101010822',656,17,'shonu','2026-11-19 13:51:00'),(82,'20261119101010823',564,15,'shonu','2026-11-19 13:52:00'),(83,'20261119101010824',231,6,'shonu','2026-11-19 13:53:00'),(84,'20261119101010825',244,10,'shonu','2026-11-19 13:54:00'),(85,'20261119101010826',333,9,'shonu','2026-11-19 13:55:00'),(86,'20261119101010827',663,15,'shonu','2026-11-19 13:56:00'),(87,'20261119101010828',621,9,'shonu','2026-11-19 13:57:00'),(88,'20261119101010829',643,13,'shonu','2026-11-19 13:58:00'),(89,'20261119101010830',512,8,'shonu','2026-11-19 13:59:00'),(90,'20261119101010831',512,8,'shonu','2026-11-19 14:00:00'),(91,'20261119101010832',411,6,'shonu','2026-11-19 14:01:00'),(92,'20261119101010833',654,15,'shonu','2026-11-19 14:02:00'),(93,'20261119101010834',236,11,'shonu','2026-11-19 14:03:00'),(94,'20261119101010835',414,9,'shonu','2026-11-19 14:04:00'),(95,'20261119101010836',233,8,'shonu','2026-11-19 14:05:00'),(96,'20261119101010837',333,9,'shonu','2026-11-19 14:06:00'),(97,'20261119101010838',311,5,'shonu','2026-11-19 14:07:00'),(98,'20261119101010839',513,9,'shonu','2026-11-19 14:08:00'),(99,'20261119101010840',663,15,'shonu','2026-11-19 14:09:00'),(100,'20261119101010841',355,13,'shonu','2026-11-19 14:10:00'),(101,'20261119101010842',243,9,'shonu','2026-11-19 14:11:00'),(102,'20261119101010843',561,12,'shonu','2026-11-19 14:12:00'),(103,'20261119101010844',216,9,'shonu','2026-11-19 14:13:00'),(104,'20261119101010845',215,8,'shonu','2026-11-19 14:14:00'),(105,'20261119101010846',344,11,'shonu','2026-11-19 14:15:00'),(106,'20261119101010847',535,13,'shonu','2026-11-19 14:16:00'),(107,'20261119101010848',546,15,'shonu','2026-11-19 14:17:00'),(108,'20261119101010849',634,13,'shonu','2026-11-19 14:18:00'),(109,'20261119101010850',535,13,'shonu','2026-11-19 14:19:00'),(110,'20261119101010851',225,9,'shonu','2026-11-19 14:20:00'),(111,'20261119101010852',316,10,'shonu','2026-11-19 14:21:00'),(112,'20261119101010853',246,12,'shonu','2026-11-19 14:22:00'),(113,'20261119101010854',632,11,'shonu','2026-11-19 14:23:00'),(114,'20261119101010855',531,9,'shonu','2026-11-19 14:24:00'),(115,'20261119101010856',452,11,'shonu','2026-11-19 14:25:00'),(116,'20261119101010857',331,7,'shonu','2026-11-19 14:26:00'),(117,'20261119101010858',523,10,'shonu','2026-11-19 14:27:00'),(118,'20261119101010859',354,12,'shonu','2026-11-19 14:28:00'),(119,'20261119101010860',435,12,'shonu','2026-11-19 14:29:00'),(120,'20261119101010861',341,8,'shonu','2026-11-19 14:29:04'),(121,'20261119101010862',332,8,'shonu','2026-11-19 14:29:11'),(122,'20261119101010863',162,9,'shonu','2026-11-19 14:29:23'),(123,'20261119101010864',653,14,'shonu','2026-11-19 14:30:00'),(124,'20261119101010865',515,11,'shonu','2026-11-19 14:31:00'),(125,'20261119101010866',524,11,'shonu','2026-11-19 14:32:00'),(126,'20261119101010867',623,11,'shonu','2026-11-19 14:33:00'),(127,'20261119101010868',165,12,'shonu','2026-11-19 14:34:00'),(128,'20261119101010869',346,13,'shonu','2026-11-19 14:35:00'),(129,'20261119101010870',436,13,'shonu','2026-11-19 14:36:00'),(130,'20261119101010871',662,14,'shonu','2026-11-19 14:37:00'),(131,'20261119101010872',142,7,'shonu','2026-11-19 14:38:00'),(132,'20261119101010873',356,14,'shonu','2026-11-19 14:39:00'),(133,'20261119101010874',154,10,'shonu','2026-11-19 14:40:00'),(134,'20261119101010875',556,16,'shonu','2026-11-19 14:41:00'),(135,'20261119101010876',643,13,'shonu','2026-11-19 14:42:00'),(136,'20261119101010877',541,10,'shonu','2026-11-19 14:43:00'),(137,'20261119101010878',431,8,'shonu','2026-11-19 14:44:00'),(138,'20261119101010879',152,8,'shonu','2026-11-19 14:45:00'),(139,'20261119101010880',156,12,'shonu','2026-11-19 14:46:00'),(140,'20261119101010881',335,11,'shonu','2026-11-19 14:47:00'),(141,'20261119101010882',363,12,'shonu','2026-11-19 14:48:00'),(142,'20261119101010883',345,12,'shonu','2026-11-19 14:49:00'),(143,'20261119101010884',532,10,'shonu','2026-11-19 14:50:00'),(144,'20261119101010885',362,11,'shonu','2026-11-19 14:51:00'),(145,'20261119101010886',256,13,'shonu','2026-11-19 14:52:00'),(146,'20261119101010887',243,9,'shonu','2026-11-19 14:53:01'),(147,'20261119101010888',414,9,'shonu','2026-11-19 14:54:00'),(148,'20261119101010889',555,15,'shonu','2026-11-19 14:55:00'),(149,'20261119101010890',345,12,'shonu','2026-11-19 14:56:00'),(150,'20261119101010891',453,12,'shonu','2026-11-19 14:57:00'),(151,'20261119101010892',124,7,'shonu','2026-11-19 14:58:00'),(152,'20261119101010893',111,3,'shonu','2026-11-19 14:59:00'),(153,'20261119101010894',565,16,'shonu','2026-11-19 15:00:00'),(154,'20261119101010895',321,6,'shonu','2026-11-19 15:01:00'),(155,'20261119101010896',535,13,'shonu','2026-11-19 15:02:00'),(156,'20261119101010897',544,13,'shonu','2026-11-19 15:03:00'),(157,'20261119101010898',362,11,'shonu','2026-11-19 15:04:00'),(158,'20261119101010899',554,14,'shonu','2026-11-19 15:05:00'),(159,'20261119101010900',511,7,'shonu','2026-11-19 15:06:00'),(160,'20261119101010901',412,7,'shonu','2026-11-19 15:07:00'),(161,'20261119101010902',541,10,'shonu','2026-11-19 15:08:01'),(162,'20261119101010903',121,4,'shonu','2026-11-19 15:09:00'),(163,'20261119101010904',316,10,'shonu','2026-11-19 15:10:00'),(164,'20261119101010905',566,17,'shonu','2026-11-19 15:11:00'),(165,'20261119101010906',255,12,'shonu','2026-11-19 15:12:00'),(166,'20261119101010907',352,10,'shonu','2026-11-19 15:13:00'),(167,'20261119101010908',443,11,'shonu','2026-11-19 15:14:00'),(168,'20261119101010909',346,13,'shonu','2026-11-19 15:15:00'),(169,'20261119101010910',415,10,'shonu','2026-11-19 15:16:00'),(170,'20261119101010911',344,11,'shonu','2026-11-19 15:17:00'),(171,'20261119101010912',532,10,'shonu','2026-11-19 15:18:00'),(172,'20261119101010913',644,14,'shonu','2026-11-19 15:19:00'),(173,'20261119101010914',443,11,'shonu','2026-11-19 15:20:00'),(174,'20261119101010915',363,12,'shonu','2026-11-19 15:21:00'),(175,'20261119101010916',321,6,'shonu','2026-11-19 15:22:00'),(176,'20261119101010917',215,8,'shonu','2026-11-19 15:23:00'),(177,'20261119101010918',342,9,'shonu','2026-11-19 15:24:00'),(178,'20261119101010919',245,11,'shonu','2026-11-19 15:25:00'),(179,'20261119101010920',345,12,'shonu','2026-11-19 15:26:00'),(180,'20261119101010921',154,10,'shonu','2026-11-19 15:27:00'),(181,'20261119101010922',146,11,'shonu','2026-11-19 15:28:00'),(182,'20261119101010923',156,12,'shonu','2026-11-19 15:29:00'),(183,'20261119101010924',136,10,'shonu','2026-11-19 15:30:00'),(184,'20261119101010925',544,13,'shonu','2026-11-19 15:31:00'),(185,'20261119101010926',112,4,'shonu','2026-11-19 15:32:00'),(186,'20261119101010927',321,6,'shonu','2026-11-19 15:33:00'),(187,'20261119101010928',525,12,'shonu','2026-11-19 15:34:00'),(188,'20261119101010929',421,7,'shonu','2026-11-19 15:35:00'),(189,'20261119101010930',566,17,'shonu','2026-11-19 15:35:03'),(190,'20261119101010931',536,14,'shonu','2026-11-19 15:35:21'),(191,'20261119101010932',534,12,'shonu','2026-11-19 15:35:48'),(192,'20261119101010933',221,5,'shonu','2026-11-19 15:36:00'),(193,'20261119101010934',265,13,'shonu','2026-11-19 15:37:00'),(194,'20261119101010935',331,7,'shonu','2026-11-19 15:38:00'),(195,'20261119101010936',646,16,'shonu','2026-11-19 15:38:51'),(196,'20261119101010937',121,4,'shonu','2026-11-19 15:39:00'),(197,'20261119101010938',324,9,'shonu','2026-11-19 17:44:13'),(198,'20261119101010939',541,10,'shonu','2026-11-19 17:44:59'),(199,'20261119101010940',212,5,'shonu','2026-11-19 17:45:45'),(200,'20261119101010941',353,11,'shonu','2026-11-19 17:46:31'),(201,'20261119101010942',342,9,'shonu','2026-11-19 17:47:17'),(202,'20261119101010943',145,10,'shonu','2026-11-19 17:48:03'),(203,'20261119101010944',645,15,'shonu','2026-11-19 17:48:49'),(204,'20261119101010945',233,8,'shonu','2026-11-19 17:49:35'),(205,'20261119101010946',534,12,'shonu','2026-11-19 17:50:20'),(206,'20261119101010947',162,9,'shonu','2026-11-19 17:51:06'),(207,'20261119101010948',346,13,'shonu','2026-11-19 17:51:52'),(208,'20261119101010949',146,11,'shonu','2026-11-19 17:52:38'),(209,'20261119101010950',252,9,'shonu','2026-11-19 17:53:24'),(210,'20261119101010951',563,14,'shonu','2026-11-19 17:54:10'),(211,'20261119101010952',433,10,'shonu','2026-11-19 17:54:55'),(212,'20261119101010953',323,8,'shonu','2026-11-19 17:55:41'),(213,'20261119101010954',531,9,'shonu','2026-11-19 17:56:27'),(214,'20261119101010955',523,10,'shonu','2026-11-19 17:57:13'),(215,'20261119101010956',543,12,'shonu','2026-11-19 17:57:59'),(216,'20261119101010957',224,8,'shonu','2026-11-19 17:58:45'),(217,'20261119101010958',452,11,'shonu','2026-11-19 17:59:30'),(218,'20261119101010959',522,9,'shonu','2026-11-19 18:00:16'),(219,'20261119101010960',122,5,'shonu','2026-11-19 18:01:01'),(220,'20261119101010961',255,12,'shonu','2026-11-19 18:01:47'),(221,'20261119101010962',165,12,'shonu','2026-11-19 18:02:33'),(222,'20261119101010963',411,6,'shonu','2026-11-19 18:03:19'),(223,'20261119101010964',145,10,'shonu','2026-11-19 18:04:04'),(224,'20261119101010965',362,11,'shonu','2026-11-19 18:04:50'),(225,'20261119101010966',212,5,'shonu','2026-11-19 18:05:36'),(226,'20261119101010967',624,12,'shonu','2026-11-19 18:06:22'),(227,'20261119101010968',465,15,'shonu','2026-11-19 18:07:08'),(228,'20261119101010969',412,7,'shonu','2026-11-19 18:07:53'),(229,'20261119101010970',136,10,'shonu','2026-11-19 18:08:39'),(230,'20261119101010971',462,12,'shonu','2026-11-19 18:09:25'),(231,'20261119101010972',455,14,'shonu','2026-11-19 18:10:10'),(232,'20261119101010973',454,13,'shonu','2026-11-19 18:10:57'),(233,'20261119101010974',335,11,'shonu','2026-11-19 18:11:43'),(234,'20261119101010975',336,12,'shonu','2026-11-19 18:12:29'),(235,'20261119101010976',452,11,'shonu','2026-11-19 18:13:15'),(236,'20261119101010977',335,11,'shonu','2026-11-19 18:14:00'),(237,'20261119101010978',364,13,'shonu','2026-11-19 18:14:46'),(238,'20261119101010979',652,13,'shonu','2026-11-19 18:15:31'),(239,'20261119101010980',146,11,'shonu','2026-11-19 18:16:18'),(240,'20261119101010981',346,13,'shonu','2026-11-19 18:17:04'),(241,'20261119101010982',111,3,'shonu','2026-11-19 18:17:49'),(242,'20261119101010983',436,13,'shonu','2026-11-19 18:18:35'),(243,'20261119101010984',666,18,'shonu','2026-11-19 18:19:21'),(244,'20261119101010985',464,14,'shonu','2026-11-19 18:20:07'),(245,'20261119101010986',325,10,'shonu','2026-11-19 18:20:53'),(246,'20261119101010987',344,11,'shonu','2026-11-19 18:21:39'),(247,'20261119101010988',532,10,'shonu','2026-11-19 18:22:25'),(248,'20261119101010989',635,14,'shonu','2026-11-19 18:23:10'),(249,'20261119101010990',344,11,'shonu','2026-11-19 18:23:56'),(250,'20261119101010991',163,10,'shonu','2026-11-19 18:24:42'),(251,'20261119101010992',146,11,'shonu','2026-11-19 18:25:28'),(252,'20261119101010993',341,8,'shonu','2026-11-19 18:26:14'),(253,'20261119101010994',236,11,'shonu','2026-11-19 18:26:59'),(254,'20261119101010995',335,11,'shonu','2026-11-19 18:27:45'),(255,'20261119101010996',232,7,'shonu','2026-11-19 18:28:31'),(256,'20261119101010997',632,11,'shonu','2026-11-19 18:29:17'),(257,'20261119101010998',241,7,'shonu','2026-11-19 18:30:02'),(258,'20261119101010999',154,10,'shonu','2026-11-19 18:30:48'),(259,'20261119101011000',613,10,'shonu','2026-11-19 18:31:33'),(260,'20261119101011001',133,7,'shonu','2026-11-19 18:32:19'),(261,'20261119101011002',262,10,'shonu','2026-11-19 18:33:05'),(262,'20261119101011003',125,8,'shonu','2026-11-19 18:33:51'),(263,'20261119101011004',466,16,'shonu','2026-11-19 18:34:36'),(264,'20261119101011005',213,6,'shonu','2026-11-19 18:35:22'),(265,'20261119101011006',524,11,'shonu','2026-11-19 18:36:08'),(266,'20261119101011007',244,10,'shonu','2026-11-19 18:36:54'),(267,'20261119101011008',661,13,'shonu','2026-11-19 18:37:40'),(268,'20261119101011009',112,4,'shonu','2026-11-19 18:38:26'),(269,'20261119101011010',342,9,'shonu','2026-11-19 18:39:11'),(270,'20261119101011011',345,12,'shonu','2026-11-19 18:39:57'),(271,'20261119101011012',425,11,'shonu','2026-11-19 18:40:43'),(272,'20261119101011013',252,9,'shonu','2026-11-19 18:41:29'),(273,'20261119101011014',145,10,'shonu','2026-11-19 18:42:15'),(274,'20261119101011015',361,10,'shonu','2026-11-19 18:43:01'),(275,'20261119101011016',534,12,'shonu','2026-11-19 18:43:46'),(276,'20261119101011017',332,8,'shonu','2026-11-19 18:44:32'),(277,'20261119101011018',443,11,'shonu','2026-11-19 18:45:18'),(278,'20261119101011019',535,13,'shonu','2026-11-19 18:46:04'),(279,'20261119101011020',245,11,'shonu','2026-11-19 18:46:50'),(280,'20261119101011021',436,13,'shonu','2026-11-19 18:47:35'),(281,'20261119101011022',232,7,'shonu','2026-11-19 18:48:21'),(282,'20261119101011023',626,14,'shonu','2026-11-19 18:49:07'),(283,'20261119101011024',142,7,'shonu','2026-11-19 18:49:53'),(284,'20261119101011025',433,10,'shonu','2026-11-19 18:50:38'),(285,'20261119101011026',431,8,'shonu','2026-11-19 18:51:25'),(286,'20261119101011027',145,10,'shonu','2026-11-19 18:52:10'),(287,'20261119101011028',232,7,'shonu','2026-11-19 18:52:56'),(288,'20261119101011029',614,11,'shonu','2026-11-19 18:53:42'),(289,'20261119101011030',653,14,'shonu','2026-11-19 18:54:27'),(290,'20261119101011031',525,12,'shonu','2026-11-19 18:55:13'),(291,'20261119101011032',516,12,'shonu','2026-11-19 18:55:59'),(292,'20261119101011033',334,10,'shonu','2026-11-19 18:56:45'),(293,'20261119101011034',646,16,'shonu','2026-11-19 18:57:31'),(294,'20261119101011035',354,12,'shonu','2026-11-19 18:58:17'),(295,'20261119101011036',654,15,'shonu','2026-11-19 18:59:02'),(296,'20261119101011037',524,11,'shonu','2026-11-19 18:59:48'),(297,'20261119101011038',544,13,'shonu','2026-11-19 19:00:34'),(298,'20261119101011039',444,12,'shonu','2026-11-19 19:01:19'),(299,'20261119101011040',552,12,'shonu','2026-11-19 19:02:05'),(300,'20261119101011041',624,12,'shonu','2026-11-19 19:02:50'),(301,'20261119101011042',251,8,'shonu','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `k3_results_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_results_3min`
--

DROP TABLE IF EXISTS `k3_results_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_results_3min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COMMENT='K3 dice 3-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_3min`
--

LOCK TABLES `k3_results_3min` WRITE;
/*!40000 ALTER TABLE `k3_results_3min` DISABLE KEYS */;
INSERT INTO `k3_results_3min` VALUES (6,'20261119101020252',446,14,'shonu','2026-11-19 12:45:00'),(7,'20261119101020253',435,12,'shonu','2026-11-19 12:48:01'),(8,'20261119101020254',324,9,'shonu','2026-11-19 12:51:01'),(9,'20261119101020255',153,9,'shonu','2026-11-19 12:54:00'),(10,'20261119101020256',436,13,'shonu','2026-11-19 12:57:00'),(11,'20261119101020257',144,9,'shonu','2026-11-19 13:00:00'),(12,'20261119101020258',546,15,'shonu','2026-11-19 13:03:00'),(13,'20261119101020259',461,11,'shonu','2026-11-19 13:06:00'),(14,'20261119101020260',262,10,'shonu','2026-11-19 13:09:00'),(15,'20261119101020261',242,8,'shonu','2026-11-19 13:12:00'),(16,'20261119101020262',646,16,'shonu','2026-11-19 13:15:01'),(17,'20261119101020263',261,9,'shonu','2026-11-19 13:18:00'),(18,'20261119101020264',124,7,'shonu','2026-11-19 13:21:01'),(19,'20261119101020265',544,13,'shonu','2026-11-19 13:24:00'),(20,'20261119101020266',654,15,'shonu','2026-11-19 13:27:01'),(21,'20261119101020267',526,13,'shonu','2026-11-19 13:30:00'),(22,'20261119101020268',515,11,'shonu','2026-11-19 13:33:00'),(23,'20261119101020269',651,12,'shonu','2026-11-19 13:36:01'),(24,'20261119101020270',514,10,'shonu','2026-11-19 13:39:00'),(25,'20261119101020271',132,6,'shonu','2026-11-19 13:42:00'),(26,'20261119101020272',345,12,'shonu','2026-11-19 13:45:00'),(27,'20261119101020273',236,11,'shonu','2026-11-19 13:48:00'),(28,'20261119101020274',642,12,'shonu','2026-11-19 13:51:01'),(29,'20261119101020275',463,13,'shonu','2026-11-19 13:54:00'),(30,'20261119101020276',556,16,'shonu','2026-11-19 13:57:01'),(31,'20261119101020277',151,7,'shonu','2026-11-19 14:00:01'),(32,'20261119101020278',162,9,'shonu','2026-11-19 14:03:00'),(33,'20261119101020279',554,14,'shonu','2026-11-19 14:06:01'),(34,'20261119101020280',512,8,'shonu','2026-11-19 14:09:00'),(35,'20261119101020281',245,11,'shonu','2026-11-19 14:12:01'),(36,'20261119101020282',324,9,'shonu','2026-11-19 14:15:00'),(37,'20261119101020283',165,12,'shonu','2026-11-19 14:18:01'),(38,'20261119101020284',155,11,'shonu','2026-11-19 14:21:01'),(39,'20261119101020285',161,8,'shonu','2026-11-19 14:24:00'),(40,'20261119101020286',466,16,'shonu','2026-11-19 14:27:01'),(41,'20261119101020287',163,10,'shonu','2026-11-19 14:33:00'),(42,'20261119101020288',545,14,'shonu','2026-11-19 14:36:01'),(43,'20261119101020289',415,10,'shonu','2026-11-19 14:39:00'),(44,'20261119101020290',154,10,'shonu','2026-11-19 14:42:00'),(45,'20261119101020291',244,10,'shonu','2026-11-19 14:45:01'),(46,'20261119101020292',454,13,'shonu','2026-11-19 14:48:00'),(47,'20261119101020293',141,6,'shonu','2026-11-19 14:51:00'),(48,'20261119101020294',363,12,'shonu','2026-11-19 14:54:00'),(49,'20261119101020295',236,11,'shonu','2026-11-19 14:57:01'),(50,'20261119101020296',564,15,'shonu','2026-11-19 15:00:00'),(51,'20261119101020297',166,13,'shonu','2026-11-19 15:03:00'),(52,'20261119101020298',313,7,'shonu','2026-11-19 15:06:00'),(53,'20261119101020299',443,11,'shonu','2026-11-19 15:09:01'),(54,'20261119101020300',236,11,'shonu','2026-11-19 15:12:00'),(55,'20261119101020301',422,8,'shonu','2026-11-19 15:15:01'),(56,'20261119101020302',252,9,'shonu','2026-11-19 15:18:01'),(57,'20261119101020303',123,6,'shonu','2026-11-19 15:21:01'),(58,'20261119101020304',145,10,'shonu','2026-11-19 15:24:01'),(59,'20261119101020305',665,17,'shonu','2026-11-19 15:27:00'),(60,'20261119101020306',612,9,'shonu','2026-11-19 15:30:01'),(61,'20261119101020307',346,13,'shonu','2026-11-19 15:33:00'),(62,'20261119101020308',554,14,'shonu','2026-11-19 17:45:45'),(63,'20261119101020309',561,12,'shonu','2026-11-19 17:48:03'),(64,'20261119101020310',626,14,'shonu','2026-11-19 17:48:49'),(65,'20261119101020311',535,13,'shonu','2026-11-19 17:51:07'),(66,'20261119101020312',442,10,'shonu','2026-11-19 17:51:53'),(67,'20261119101020313',122,5,'shonu','2026-11-19 17:54:10'),(68,'20261119101020314',242,8,'shonu','2026-11-19 17:54:56'),(69,'20261119101020315',633,12,'shonu','2026-11-19 17:57:13'),(70,'20261119101020316',253,10,'shonu','2026-11-19 17:57:59'),(71,'20261119101020317',446,14,'shonu','2026-11-19 18:00:16'),(72,'20261119101020318',436,13,'shonu','2026-11-19 18:03:19'),(73,'20261119101020319',356,14,'shonu','2026-11-19 18:06:22'),(74,'20261119101020320',654,15,'shonu','2026-11-19 18:09:25'),(75,'20261119101020321',634,13,'shonu','2026-11-19 18:12:29'),(76,'20261119101020322',445,13,'shonu','2026-11-19 18:15:32'),(77,'20261119101020323',615,12,'shonu','2026-11-19 18:18:35'),(78,'20261119101020324',565,16,'shonu','2026-11-19 18:21:39'),(79,'20261119101020325',146,11,'shonu','2026-11-19 18:24:42'),(80,'20261119101020326',263,11,'shonu','2026-11-19 18:27:45'),(81,'20261119101020327',645,15,'shonu','2026-11-19 18:30:03'),(82,'20261119101020328',625,13,'shonu','2026-11-19 18:30:48'),(83,'20261119101020329',663,15,'shonu','2026-11-19 18:33:05'),(84,'20261119101020330',512,8,'shonu','2026-11-19 18:33:51'),(85,'20261119101020331',461,11,'shonu','2026-11-19 18:36:08'),(86,'20261119101020332',325,10,'shonu','2026-11-19 18:36:54'),(87,'20261119101020333',312,6,'shonu','2026-11-19 18:39:11'),(88,'20261119101020334',262,10,'shonu','2026-11-19 18:39:57'),(89,'20261119101020335',236,11,'shonu','2026-11-19 18:42:15'),(90,'20261119101020336',235,10,'shonu','2026-11-19 18:45:18'),(91,'20261119101020337',445,13,'shonu','2026-11-19 18:48:21'),(92,'20261119101020338',662,14,'shonu','2026-11-19 18:51:25'),(93,'20261119101020339',442,10,'shonu','2026-11-19 18:54:28'),(94,'20261119101020340',314,8,'shonu','2026-11-19 18:57:31'),(95,'20261119101020341',414,9,'shonu','2026-11-19 19:00:34'),(96,'20261119101020342',411,6,'shonu','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `k3_results_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k3_results_5min`
--

DROP TABLE IF EXISTS `k3_results_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k3_results_5min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COMMENT='K3 dice 5-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k3_results_5min`
--

LOCK TABLES `k3_results_5min` WRITE;
/*!40000 ALTER TABLE `k3_results_5min` DISABLE KEYS */;
INSERT INTO `k3_results_5min` VALUES (2,'20261119101030154',622,10,'shonu','2026-11-19 12:50:00'),(3,'20261119101030155',111,3,'shonu','2026-11-19 12:55:00'),(4,'20261119101030156',544,13,'shonu','2026-11-19 13:00:01'),(5,'20261119101030157',166,13,'shonu','2026-11-19 13:05:00'),(6,'20261119101030158',611,8,'shonu','2026-11-19 13:10:00'),(7,'20261119101030159',363,12,'shonu','2026-11-19 13:15:01'),(8,'20261119101030160',155,11,'shonu','2026-11-19 13:20:00'),(9,'20261119101030161',634,13,'shonu','2026-11-19 13:25:01'),(10,'20261119101030162',152,8,'shonu','2026-11-19 13:30:00'),(11,'20261119101030163',626,14,'shonu','2026-11-19 13:35:00'),(12,'20261119101030164',166,13,'shonu','2026-11-19 13:40:01'),(13,'20261119101030165',166,13,'shonu','2026-11-19 13:45:01'),(14,'20261119101030166',153,9,'shonu','2026-11-19 13:50:01'),(15,'20261119101030167',466,16,'shonu','2026-11-19 13:55:01'),(16,'20261119101030168',145,10,'shonu','2026-11-19 14:00:02'),(17,'20261119101030169',143,8,'shonu','2026-11-19 14:05:00'),(18,'20261119101030170',433,10,'shonu','2026-11-19 14:10:00'),(19,'20261119101030171',342,9,'shonu','2026-11-19 14:15:00'),(20,'20261119101030172',453,12,'shonu','2026-11-19 14:20:01'),(21,'20261119101030173',441,9,'shonu','2026-11-19 14:25:01'),(22,'20261119101030174',463,13,'shonu','2026-11-19 14:35:00'),(23,'20261119101030175',333,9,'shonu','2026-11-19 14:40:00'),(24,'20261119101030176',543,12,'shonu','2026-11-19 14:45:01'),(25,'20261119101030177',253,10,'shonu','2026-11-19 14:50:00'),(26,'20261119101030178',656,17,'shonu','2026-11-19 14:55:01'),(27,'20261119101030179',444,12,'shonu','2026-11-19 15:00:00'),(28,'20261119101030180',324,9,'shonu','2026-11-19 15:05:00'),(29,'20261119101030181',162,9,'shonu','2026-11-19 15:10:00'),(30,'20261119101030182',342,9,'shonu','2026-11-19 15:15:01'),(31,'20261119101030183',424,10,'shonu','2026-11-19 15:20:01'),(32,'20261119101030184',541,10,'shonu','2026-11-19 15:25:00'),(33,'20261119101030185',651,12,'shonu','2026-11-19 15:30:01'),(34,'20261119101030186',226,10,'shonu','2026-11-19 15:35:00'),(35,'20261119101030187',164,11,'shonu','2026-11-19 15:35:21'),(36,'20261119101030188',522,9,'shonu','2026-11-19 15:35:48'),(37,'20261119101030189',134,8,'shonu','2026-11-19 17:45:45'),(38,'20261119101030190',562,13,'shonu','2026-11-19 17:50:20'),(39,'20261119101030191',442,10,'shonu','2026-11-19 17:55:42'),(40,'20261119101030192',242,8,'shonu','2026-11-19 18:00:17'),(41,'20261119101030193',456,15,'shonu','2026-11-19 18:05:36'),(42,'20261119101030194',251,8,'shonu','2026-11-19 18:10:11'),(43,'20261119101030195',411,6,'shonu','2026-11-19 18:10:57'),(44,'20261119101030196',512,8,'shonu','2026-11-19 18:15:32'),(45,'20261119101030197',134,8,'shonu','2026-11-19 18:20:07'),(46,'20261119101030198',134,8,'shonu','2026-11-19 18:20:53'),(47,'20261119101030199',151,7,'shonu','2026-11-19 18:25:28'),(48,'20261119101030200',115,7,'shonu','2026-11-19 18:30:03'),(49,'20261119101030201',421,7,'shonu','2026-11-19 18:30:48'),(50,'20261119101030202',416,11,'shonu','2026-11-19 18:35:22'),(51,'20261119101030203',155,11,'shonu','2026-11-19 18:40:43'),(52,'20261119101030204',646,16,'shonu','2026-11-19 18:45:18'),(53,'20261119101030205',411,6,'shonu','2026-11-19 18:50:39'),(54,'20261119101030206',415,10,'shonu','2026-11-19 18:55:14'),(55,'20261119101030207',233,8,'shonu','2026-11-19 18:56:01'),(56,'20261119101030208',614,11,'shonu','2026-11-19 19:00:34');
/*!40000 ALTER TABLE `k3_results_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legacy_parity_game_results`
--

DROP TABLE IF EXISTS `legacy_parity_game_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legacy_parity_game_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `period` bigint NOT NULL,
  `ans` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `num` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `clo` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `res1` varchar(211) COLLATE utf8mb4_general_ci NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Legacy FastParity-style game results (stale, kept for jet API)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legacy_parity_game_results`
--

LOCK TABLES `legacy_parity_game_results` WRITE;
/*!40000 ALTER TABLE `legacy_parity_game_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `legacy_parity_game_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_mode`
--

DROP TABLE IF EXISTS `maintenance_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_mode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'inactive',
  `message` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Site maintenance-mode switch + message shown during downtime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_mode`
--

LOCK TABLES `maintenance_mode` WRITE;
/*!40000 ALTER TABLE `maintenance_mode` DISABLE KEYS */;
INSERT INTO `maintenance_mode` VALUES (1,'inactive','hi  hi');
/*!40000 ALTER TABLE `maintenance_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_fund_adjustments`
--

DROP TABLE IF EXISTS `manual_fund_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_fund_adjustments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` enum('credit','debit') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Admin manual credit/debit adjustments to user balances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_fund_adjustments`
--

LOCK TABLES `manual_fund_adjustments` WRITE;
/*!40000 ALTER TABLE `manual_fund_adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_fund_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_members_bonus_table`
--

DROP TABLE IF EXISTS `new_members_bonus_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_members_bonus_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 117: new-members bonus queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_members_bonus_table`
--

LOCK TABLES `new_members_bonus_table` WRITE;
/*!40000 ALTER TABLE `new_members_bonus_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_members_bonus_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_log`
--

DROP TABLE IF EXISTS `otp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `otp` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='One-time passwords issued per mobile (SMS verify / forgot password)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_log`
--

LOCK TABLES `otp_log` WRITE;
/*!40000 ALTER TABLE `otp_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_reward_settings`
--

DROP TABLE IF EXISTS `partner_reward_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_reward_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recharge_amount` decimal(10,2) NOT NULL,
  `bet_amount` decimal(10,2) NOT NULL,
  `reward_amount` decimal(10,2) NOT NULL,
  `type` int NOT NULL,
  `days` int NOT NULL DEFAULT '7',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_reward_settings`
--

LOCK TABLES `partner_reward_settings` WRITE;
/*!40000 ALTER TABLE `partner_reward_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_reward_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_channel_settings`
--

DROP TABLE IF EXISTS `payment_channel_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_channel_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(300) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Payment channel config + conversion rates (usdt rate, gateway toggles)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_channel_settings`
--

LOCK TABLES `payment_channel_settings` WRITE;
/*!40000 ALTER TABLE `payment_channel_settings` DISABLE KEYS */;
INSERT INTO `payment_channel_settings` VALUES (1,'manual','0',0),(2,'indianpay','0',0),(3,'usdt','93',1);
/*!40000 ALTER TABLE `payment_channel_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_settings`
--

DROP TABLE IF EXISTS `payment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_settings` (
  `suckit` int NOT NULL AUTO_INCREMENT,
  `rechargeamount` varchar(500) NOT NULL,
  `withdrawalamount` varchar(500) NOT NULL,
  `bonusamount` varchar(500) NOT NULL,
  `rechargebonus` varchar(500) NOT NULL COMMENT 'in%age',
  `level1` varchar(300) NOT NULL COMMENT 'In%age',
  `level2` varchar(300) NOT NULL COMMENT 'In%age',
  `level3` varchar(200) NOT NULL COMMENT 'In%age',
  PRIMARY KEY (`suckit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Site money settings: min deposit/withdraw, bonus %, L1/L2/L3 commission rates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_settings`
--

LOCK TABLES `payment_settings` WRITE;
/*!40000 ALTER TABLE `payment_settings` DISABLE KEYS */;
INSERT INTO `payment_settings` VALUES (1,'300','330','20','2','1.20','0.60','0.40');
/*!40000 ALTER TABLE `payment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payout_orders`
--

DROP TABLE IF EXISTS `payout_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payout_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `withdraw_id` int NOT NULL DEFAULT '0',
  `account_id` int NOT NULL DEFAULT '0',
  `gateway` varchar(20) NOT NULL DEFAULT 'watchpay',
  `user_id` int NOT NULL DEFAULT '0',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `mch_transfer_id` varchar(100) NOT NULL DEFAULT '',
  `trade_no` varchar(100) NOT NULL DEFAULT '',
  `receive_name` varchar(100) NOT NULL DEFAULT '',
  `receive_account` varchar(100) NOT NULL DEFAULT '',
  `bank_code` varchar(30) NOT NULL DEFAULT '',
  `remark_field` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT 'created',
  `resp_code` varchar(20) NOT NULL DEFAULT '',
  `error_msg` varchar(255) NOT NULL DEFAULT '',
  `api_response` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_mch_transfer` (`mch_transfer_id`),
  KEY `idx_withdraw` (`withdraw_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payout_orders`
--

LOCK TABLES `payout_orders` WRITE;
/*!40000 ALTER TABLE `payout_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `payout_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_balances`
--

DROP TABLE IF EXISTS `provider_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_balances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'users.id',
  `provider` varchar(50) DEFAULT NULL COMMENT 'third-party game provider code',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'provider wallet balance',
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Third-party game provider wallet balances per user (gyrox user list)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_balances`
--

LOCK TABLES `provider_balances` WRITE;
/*!40000 ALTER TABLE `provider_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qwackpay_accounts`
--

DROP TABLE IF EXISTS `qwackpay_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qwackpay_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) NOT NULL DEFAULT 'QwackPay Account',
  `merchant_id` varchar(50) NOT NULL DEFAULT '',
  `api_key` varchar(200) NOT NULL DEFAULT '',
  `base_url` varchar(255) NOT NULL DEFAULT 'https://qwackpay.com/api/v1',
  `payin_fee_percent` decimal(6,2) NOT NULL DEFAULT '8.00',
  `payout_fee_percent` decimal(6,2) NOT NULL DEFAULT '3.00',
  `payout_fee_flat` decimal(12,2) NOT NULL DEFAULT '6.00',
  `min_payin` decimal(12,2) NOT NULL DEFAULT '100.00',
  `max_payin` decimal(12,2) NOT NULL DEFAULT '100000.00',
  `min_payout` decimal(12,2) NOT NULL DEFAULT '100.00',
  `max_payout` decimal(12,2) NOT NULL DEFAULT '100000.00',
  `auto_payout` tinyint(1) NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qwackpay_accounts`
--

LOCK TABLES `qwackpay_accounts` WRITE;
/*!40000 ALTER TABLE `qwackpay_accounts` DISABLE KEYS */;
INSERT INTO `qwackpay_accounts` VALUES (1,'QwackPay India','681551699','9df6338d411e277fe89d52bd3ce6e264','https://qwackpay.com/api/v1',8.00,3.00,6.00,200.00,30000.00,100.00,100000.00,0,1,1,'2026-11-19 09:58:17','2026-11-19 12:55:11');
/*!40000 ALTER TABLE `qwackpay_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rebate_records`
--

DROP TABLE IF EXISTS `rebate_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rebate_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `motta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rebet` int NOT NULL DEFAULT '0',
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `lvl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Rebate (code wash) turnover records with rate and VIP level';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rebate_records`
--

LOCK TABLES `rebate_records` WRITE;
/*!40000 ALTER TABLE `rebate_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `rebate_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recharge_gift_table`
--

DROP TABLE IF EXISTS `recharge_gift_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recharge_gift_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 10: recharge gift queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recharge_gift_table`
--

LOCK TABLES `recharge_gift_table` WRITE;
/*!40000 ALTER TABLE `recharge_gift_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `recharge_gift_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_commission_records`
--

DROP TABLE IF EXISTS `referral_commission_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_commission_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `children_LotteryAmount` decimal(10,2) DEFAULT '0.00',
  `rebateAmount_Last` decimal(10,2) DEFAULT '0.00',
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_date` (`user_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Referral commission rows (L1/L2/L3 lottery + rebate amounts)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_commission_records`
--

LOCK TABLES `referral_commission_records` WRITE;
/*!40000 ALTER TABLE `referral_commission_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_commission_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_awards_table`
--

DROP TABLE IF EXISTS `return_awards_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_awards_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 115: return awards queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_awards_table`
--

LOCK TABLES `return_awards_table` WRITE;
/*!40000 ALTER TABLE `return_awards_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_awards_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_banners`
--

DROP TABLE IF EXISTS `site_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `image_url` varchar(300) NOT NULL DEFAULT '',
  `link_url` varchar(300) NOT NULL DEFAULT '',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_banners`
--

LOCK TABLES `site_banners` WRITE;
/*!40000 ALTER TABLE `site_banners` DISABLE KEYS */;
INSERT INTO `site_banners` VALUES (2,'Bharat Win Streak Bonus','/banner/bharat_banner_2_winstreak.jpg','',2,1,'2026-11-19 08:23:47'),(3,'Bharat Refer & Earn','/banner/bharat_banner_3_refer.jpg','',3,1,'2026-11-19 08:23:47'),(4,'Bharat Agent Program','/banner/bharat_banner_4_agent.jpg','',4,1,'2026-11-19 08:23:47'),(9,'Bharat 70% Extra Coin Offer','/banner/bharat_banner_1_70extra.jpg','',1,1,'2026-11-19 08:54:33');
/*!40000 ALTER TABLE `site_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_popups`
--

DROP TABLE IF EXISTS `site_popups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_popups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` text,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_popups`
--

LOCK TABLES `site_popups` WRITE;
/*!40000 ALTER TABLE `site_popups` DISABLE KEYS */;
INSERT INTO `site_popups` VALUES (1,'Welcome to BHARAT GAMES','<p>Play more, win more! Recharge now and grab your 70% extra coin bonus. Invite friends to earn more rewards.</p>',1,0,'2026-11-19 08:23:47');
/*!40000 ALTER TABLE `site_popups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spin_wheel_prizes`
--

DROP TABLE IF EXISTS `spin_wheel_prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spin_wheel_prizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prize` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spin-the-wheel (turntable) prize records per user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spin_wheel_prizes`
--

LOCK TABLES `spin_wheel_prizes` WRITE;
/*!40000 ALTER TABLE `spin_wheel_prizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spin_wheel_prizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_chat_messages`
--

DROP TABLE IF EXISTS `support_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_chat_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `sender` enum('user','admin') NOT NULL DEFAULT 'user',
  `message` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `read_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `read_by_user` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_user_time` (`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_chat_messages`
--

LOCK TABLES `support_chat_messages` WRITE;
/*!40000 ALTER TABLE `support_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_complaint_tickets`
--

DROP TABLE IF EXISTS `support_complaint_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_complaint_tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oid` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `form_id` int DEFAULT NULL,
  `prob` text COLLATE utf8mb4_general_ci,
  `deposit_order_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_amount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `utr` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_upload` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_upload` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_general_ci,
  `bank_account_number` text COLLATE utf8mb4_general_ci,
  `ifsc` text COLLATE utf8mb4_general_ci,
  `CardName` text COLLATE utf8mb4_general_ci,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='User complaint tickets by category (withdraw problem, bank change...)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_complaint_tickets`
--

LOCK TABLES `support_complaint_tickets` WRITE;
/*!40000 ALTER TABLE `support_complaint_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_complaint_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_payment_tickets`
--

DROP TABLE IF EXISTS `support_payment_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_payment_tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(255) NOT NULL,
  `account` varchar(50) NOT NULL,
  `amount_deposit` decimal(10,2) DEFAULT NULL,
  `utr_number` varchar(100) DEFAULT NULL,
  `withdrawal_order_number` varchar(100) DEFAULT NULL,
  `withdrawal_amount` decimal(10,2) DEFAULT NULL,
  `deposit_proof_path` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `reply` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `upiid` int NOT NULL,
  `screenshot_path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='User-submitted payment tickets (deposit not received etc., UTR, proof)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_payment_tickets`
--

LOCK TABLES `support_payment_tickets` WRITE;
/*!40000 ALTER TABLE `support_payment_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_payment_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_support_links`
--

DROP TABLE IF EXISTS `telegram_support_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegram_support_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(200) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Telegram support/bot links with active flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_support_links`
--

LOCK TABLES `telegram_support_links` WRITE;
/*!40000 ALTER TABLE `telegram_support_links` DISABLE KEYS */;
INSERT INTO `telegram_support_links` VALUES (1,'https://t.me/SAGAR_RAJPUT',0),(2,'https://t.me/Bharatgamespro_bot',1);
/*!40000 ALTER TABLE `telegram_support_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_userbonus`
--

DROP TABLE IF EXISTS `tracking_userbonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking_userbonus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id credited',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT 'bonus amount',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` datetime DEFAULT NULL COMMENT 'processed at',
  `remark` varchar(255) DEFAULT NULL,
  `ordernumber` varchar(100) DEFAULT NULL,
  `bonus_type` int NOT NULL DEFAULT '0' COMMENT 'activity type id',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`userkani`),
  KEY `idx_type` (`bonus_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Log of processed user bonuses (dedupe source for bonus cron)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_userbonus`
--

LOCK TABLES `tracking_userbonus` WRITE;
/*!40000 ALTER TABLE `tracking_userbonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_userbonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_ledger`
--

DROP TABLE IF EXISTS `transaction_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_ledger` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `balakedara` int NOT NULL,
  `ketebida` varchar(200) NOT NULL,
  `prakara` varchar(200) NOT NULL,
  `purba` varchar(200) NOT NULL,
  `bartaman` varchar(200) NOT NULL,
  `ayoga` varchar(255) DEFAULT NULL,
  `koduvavanu` varchar(200) DEFAULT NULL,
  `tiarikala` varchar(200) NOT NULL,
  PRIMARY KEY (`shonu`),
  KEY `idx_balakedara` (`balakedara`),
  KEY `idx_ketebida` (`ketebida`),
  KEY `idx_prakara` (`prakara`),
  KEY `idx_tiarikala` (`tiarikala`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='Transaction history with before/after balance (commission payouts etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_ledger`
--

LOCK TABLES `transaction_ledger` WRITE;
/*!40000 ALTER TABLE `transaction_ledger` DISABLE KEYS */;
INSERT INTO `transaction_ledger` VALUES (8,29,'10','LVLCOMM1','1033','1033.06','0.06','31','2026-11-19 18:45:20'),(9,3,'10','LVLCOMM2','2391','2391.02','0.018','31','2026-11-19 18:45:20'),(10,29,'10','LVLCOMM1','1533.06','1533.12','0.06','32','2026-11-19 18:47:14'),(11,3,'10','LVLCOMM2','2391.02','2391.04','0.018','32','2026-11-19 18:47:14'),(12,29,'10','LVLCOMM1','2033.12','2033.18','0.06','33','2026-11-19 18:49:37'),(13,3,'10','LVLCOMM2','2391.04','2391.06','0.018','33','2026-11-19 18:49:37');
/*!40000 ALTER TABLE `transaction_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_bets_10min`
--

DROP TABLE IF EXISTS `trx_wingo_bets_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_bets_10min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 10-min: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_bets_10min`
--

LOCK TABLES `trx_wingo_bets_10min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_bets_10min` DISABLE KEYS */;
/*!40000 ALTER TABLE `trx_wingo_bets_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_bets_1min`
--

DROP TABLE IF EXISTS `trx_wingo_bets_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_bets_1min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 1-min: individual user bets (results derived from TRON block hash)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_bets_1min`
--

LOCK TABLES `trx_wingo_bets_1min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_bets_1min` DISABLE KEYS */;
/*!40000 ALTER TABLE `trx_wingo_bets_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_bets_3min`
--

DROP TABLE IF EXISTS `trx_wingo_bets_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_bets_3min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 3-min: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_bets_3min`
--

LOCK TABLES `trx_wingo_bets_3min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_bets_3min` DISABLE KEYS */;
/*!40000 ALTER TABLE `trx_wingo_bets_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_bets_5min`
--

DROP TABLE IF EXISTS `trx_wingo_bets_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_bets_5min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 5-min: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_bets_5min`
--

LOCK TABLES `trx_wingo_bets_5min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_bets_5min` DISABLE KEYS */;
/*!40000 ALTER TABLE `trx_wingo_bets_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_periods_10min`
--

DROP TABLE IF EXISTS `trx_wingo_periods_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_periods_10min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_10min`
--

LOCK TABLES `trx_wingo_periods_10min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_10min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_10min` VALUES (1,'20261119103040077','2026-11-19 18:10:11'),(2,'20261119103040078','2026-11-19 18:10:57'),(3,'20261119103040079','2026-11-19 18:20:07'),(4,'20261119103040080','2026-11-19 18:20:54'),(5,'20261119103040081','2026-11-19 18:30:03'),(6,'20261119103040082','2026-11-19 18:30:49'),(7,'20261119103040083','2026-11-19 18:40:44'),(8,'20261119103040084','2026-11-19 18:50:39'),(9,'20261119103040085','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `trx_wingo_periods_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_periods_1min`
--

DROP TABLE IF EXISTS `trx_wingo_periods_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_periods_1min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 1-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_1min`
--

LOCK TABLES `trx_wingo_periods_1min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_1min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_1min` VALUES (1,'20261119103010735','2026-11-19 17:44:14'),(2,'20261119103010736','2026-11-19 17:44:59'),(3,'20261119103010737','2026-11-19 17:45:45'),(4,'20261119103010738','2026-11-19 17:46:31'),(5,'20261119103010739','2026-11-19 17:47:17'),(6,'20261119103010740','2026-11-19 17:48:03'),(7,'20261119103010741','2026-11-19 17:48:49'),(8,'20261119103010742','2026-11-19 17:49:35'),(9,'20261119103010743','2026-11-19 17:50:20'),(10,'20261119103010744','2026-11-19 17:51:07'),(11,'20261119103010745','2026-11-19 17:51:53'),(12,'20261119103010746','2026-11-19 17:52:39'),(13,'20261119103010747','2026-11-19 17:53:24'),(14,'20261119103010748','2026-11-19 17:54:10'),(15,'20261119103010749','2026-11-19 17:54:56'),(16,'20261119103010750','2026-11-19 17:55:42'),(17,'20261119103010751','2026-11-19 17:56:28'),(18,'20261119103010752','2026-11-19 17:57:13'),(19,'20261119103010753','2026-11-19 17:57:59'),(20,'20261119103010754','2026-11-19 17:58:45'),(21,'20261119103010755','2026-11-19 17:59:31'),(22,'20261119103010756','2026-11-19 18:00:16'),(23,'20261119103010757','2026-11-19 18:01:02'),(24,'20261119103010758','2026-11-19 18:01:47'),(25,'20261119103010759','2026-11-19 18:02:33'),(26,'20261119103010760','2026-11-19 18:03:19'),(27,'20261119103010761','2026-11-19 18:04:05'),(28,'20261119103010762','2026-11-19 18:04:50'),(29,'20261119103010763','2026-11-19 18:05:36'),(30,'20261119103010764','2026-11-19 18:06:22'),(31,'20261119103010765','2026-11-19 18:07:08'),(32,'20261119103010766','2026-11-19 18:07:53'),(33,'20261119103010767','2026-11-19 18:08:39'),(34,'20261119103010768','2026-11-19 18:09:25'),(35,'20261119103010769','2026-11-19 18:10:11'),(36,'20261119103010770','2026-11-19 18:10:57'),(37,'20261119103010771','2026-11-19 18:11:43'),(38,'20261119103010772','2026-11-19 18:12:29'),(39,'20261119103010773','2026-11-19 18:13:15'),(40,'20261119103010774','2026-11-19 18:14:00'),(41,'20261119103010775','2026-11-19 18:14:46'),(42,'20261119103010776','2026-11-19 18:15:32'),(43,'20261119103010777','2026-11-19 18:16:18'),(44,'20261119103010778','2026-11-19 18:17:04'),(45,'20261119103010779','2026-11-19 18:17:50'),(46,'20261119103010780','2026-11-19 18:18:35'),(47,'20261119103010781','2026-11-19 18:19:21'),(48,'20261119103010782','2026-11-19 18:20:07'),(49,'20261119103010783','2026-11-19 18:20:53'),(50,'20261119103010784','2026-11-19 18:21:39'),(51,'20261119103010785','2026-11-19 18:22:25'),(52,'20261119103010786','2026-11-19 18:23:11'),(53,'20261119103010787','2026-11-19 18:23:56'),(54,'20261119103010788','2026-11-19 18:24:42'),(55,'20261119103010789','2026-11-19 18:25:28'),(56,'20261119103010790','2026-11-19 18:26:14'),(57,'20261119103010791','2026-11-19 18:27:00'),(58,'20261119103010792','2026-11-19 18:27:45'),(59,'20261119103010793','2026-11-19 18:28:31'),(60,'20261119103010794','2026-11-19 18:29:17'),(61,'20261119103010795','2026-11-19 18:30:03'),(62,'20261119103010796','2026-11-19 18:30:48'),(63,'20261119103010797','2026-11-19 18:31:34'),(64,'20261119103010798','2026-11-19 18:32:19'),(65,'20261119103010799','2026-11-19 18:33:05'),(66,'20261119103010800','2026-11-19 18:33:51'),(67,'20261119103010801','2026-11-19 18:34:37'),(68,'20261119103010802','2026-11-19 18:35:22'),(69,'20261119103010803','2026-11-19 18:36:08'),(70,'20261119103010804','2026-11-19 18:36:54'),(71,'20261119103010805','2026-11-19 18:37:40'),(72,'20261119103010806','2026-11-19 18:38:26'),(73,'20261119103010807','2026-11-19 18:39:11'),(74,'20261119103010808','2026-11-19 18:39:57'),(75,'20261119103010809','2026-11-19 18:40:43'),(76,'20261119103010810','2026-11-19 18:41:30'),(77,'20261119103010811','2026-11-19 18:42:15'),(78,'20261119103010812','2026-11-19 18:43:01'),(79,'20261119103010813','2026-11-19 18:43:47'),(80,'20261119103010814','2026-11-19 18:44:32'),(81,'20261119103010815','2026-11-19 18:45:18'),(82,'20261119103010816','2026-11-19 18:46:04'),(83,'20261119103010817','2026-11-19 18:46:50'),(84,'20261119103010818','2026-11-19 18:47:36'),(85,'20261119103010819','2026-11-19 18:48:21'),(86,'20261119103010820','2026-11-19 18:49:07'),(87,'20261119103010821','2026-11-19 18:49:53'),(88,'20261119103010822','2026-11-19 18:50:39'),(89,'20261119103010823','2026-11-19 18:51:25'),(90,'20261119103010824','2026-11-19 18:52:11'),(91,'20261119103010825','2026-11-19 18:52:56'),(92,'20261119103010826','2026-11-19 18:53:42'),(93,'20261119103010827','2026-11-19 18:54:28'),(94,'20261119103010828','2026-11-19 18:55:14'),(95,'20261119103010829','2026-11-19 18:56:01'),(96,'20261119103010830','2026-11-19 18:56:45'),(97,'20261119103010831','2026-11-19 18:57:31'),(98,'20261119103010832','2026-11-19 18:58:17'),(99,'20261119103010833','2026-11-19 18:59:03'),(100,'20261119103010834','2026-11-19 18:59:48'),(101,'20261119103010835','2026-11-19 19:00:34'),(102,'20261119103010836','2026-11-19 19:01:19'),(103,'20261119103010837','2026-11-19 19:02:05'),(104,'20261119103010838','2026-11-19 19:02:51'),(105,'20261119103010839','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `trx_wingo_periods_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_periods_3min`
--

DROP TABLE IF EXISTS `trx_wingo_periods_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_periods_3min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_3min`
--

LOCK TABLES `trx_wingo_periods_3min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_3min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_3min` VALUES (1,'20261119103020247','2026-11-19 17:48:03'),(2,'20261119103020248','2026-11-19 17:48:49'),(3,'20261119103020249','2026-11-19 17:51:07'),(4,'20261119103020250','2026-11-19 17:51:53'),(5,'20261119103020251','2026-11-19 17:54:10'),(6,'20261119103020252','2026-11-19 17:54:56'),(7,'20261119103020253','2026-11-19 17:57:13'),(8,'20261119103020254','2026-11-19 17:57:59'),(9,'20261119103020255','2026-11-19 18:00:17'),(10,'20261119103020256','2026-11-19 18:03:19'),(11,'20261119103020257','2026-11-19 18:06:22'),(12,'20261119103020258','2026-11-19 18:09:25'),(13,'20261119103020259','2026-11-19 18:12:29'),(14,'20261119103020260','2026-11-19 18:15:32'),(15,'20261119103020261','2026-11-19 18:18:35'),(16,'20261119103020262','2026-11-19 18:21:39'),(17,'20261119103020263','2026-11-19 18:24:42'),(18,'20261119103020264','2026-11-19 18:27:46'),(19,'20261119103020265','2026-11-19 18:30:03'),(20,'20261119103020266','2026-11-19 18:30:48'),(21,'20261119103020267','2026-11-19 18:33:05'),(22,'20261119103020268','2026-11-19 18:33:51'),(23,'20261119103020269','2026-11-19 18:36:09'),(24,'20261119103020270','2026-11-19 18:36:55'),(25,'20261119103020271','2026-11-19 18:39:12'),(26,'20261119103020272','2026-11-19 18:39:58'),(27,'20261119103020273','2026-11-19 18:42:15'),(28,'20261119103020274','2026-11-19 18:45:18'),(29,'20261119103020275','2026-11-19 18:48:22'),(30,'20261119103020276','2026-11-19 18:51:25'),(31,'20261119103020277','2026-11-19 18:54:28'),(32,'20261119103020278','2026-11-19 18:57:31'),(33,'20261119103020279','2026-11-19 19:00:34'),(34,'20261119103020280','2026-11-19 19:03:37');
/*!40000 ALTER TABLE `trx_wingo_periods_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_periods_5min`
--

DROP TABLE IF EXISTS `trx_wingo_periods_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_periods_5min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_periods_5min`
--

LOCK TABLES `trx_wingo_periods_5min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_periods_5min` DISABLE KEYS */;
INSERT INTO `trx_wingo_periods_5min` VALUES (1,'20261119103030153','2026-11-19 18:10:11'),(2,'20261119103030154','2026-11-19 18:10:57'),(3,'20261119103030155','2026-11-19 18:15:32'),(4,'20261119103030156','2026-11-19 18:20:07'),(5,'20261119103030157','2026-11-19 18:20:53'),(6,'20261119103030158','2026-11-19 18:25:28'),(7,'20261119103030159','2026-11-19 18:30:03'),(8,'20261119103030160','2026-11-19 18:30:49'),(9,'20261119103030161','2026-11-19 18:35:23'),(10,'20261119103030162','2026-11-19 18:40:44'),(11,'20261119103030163','2026-11-19 18:45:19'),(12,'20261119103030164','2026-11-19 18:50:39'),(13,'20261119103030165','2026-11-19 18:55:14'),(14,'20261119103030166','2026-11-19 18:56:02'),(15,'20261119103030167','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `trx_wingo_periods_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_results_10min`
--

DROP TABLE IF EXISTS `trx_wingo_results_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_results_10min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `bh` varchar(255) NOT NULL DEFAULT 'wait',
  `hash` varchar(255) NOT NULL DEFAULT 'wait',
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 10-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_10min`
--

LOCK TABLES `trx_wingo_results_10min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_10min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_10min` VALUES (1,'20261119103040045',0,0,'red,violet','0','00000000040b4803aa3329f9f4eb4e784e5eb8c736e9c3c8645ad05899ab040e','uncensored','2026-11-19 13:00:01'),(2,'20261119103040046',7,7,'green','0','00000000040b48035fb4d292134b3364cc148ff9db4f586a6e177e9caca5bd7f','uncensored','2026-11-19 13:10:01'),(3,'20261119103040047',2,2,'red','0','00000000040b48035cce62ff74167e318a4f1356213e6d22ad5fdf28c49ba22b','uncensored','2026-11-19 13:20:01'),(4,'20261119103040048',7,7,'green','0','00000000040b480339997e0422c5d003991fc579e254df345d52b558c7a61e67','uncensored','2026-11-19 13:30:01'),(5,'20261119103040049',0,0,'red,violet','0','00000000040b4803d8661fa191b7729d979972ce685af096877931f4b78c0cbf','uncensored','2026-11-19 13:40:01'),(6,'20261119103040050',3,3,'green','0','00000000040b4803f5c385556e55547eae3e0f226c2f7ee24b3543f211035963','uncensored','2026-11-19 13:50:01'),(7,'20261119103040051',9,9,'green','0','00000000040b4803a7032299311bf2a7e01d0d20e6c361ceea1311504e210d69','uncensored','2026-11-19 14:00:02'),(8,'20261119103040052',2,2,'red','0','00000000040b4803f93435021baa2c17a14b747e81ee30047e2a5427692052ca','uncensored','2026-11-19 14:10:01'),(9,'20261119103040053',9,9,'green','0','00000000040b480352bf36326fd4d815ce1a8b6ee6c0a741cba946627fee779e','uncensored','2026-11-19 14:20:01'),(10,'20261119103040054',0,0,'red,violet','0','00000000040b480372134677cff664dbea5a7b2785087f81b8d1a4a8b93140bc','uncensored','2026-11-19 14:40:01'),(11,'20261119103040056',7,7,'green','0','00000000040b4803b6db31d9f307e08ef96e6035f80b27ddaeab81d4f8bdcc57','uncensored','2026-11-19 14:50:01'),(12,'20261119103040057',5,5,'green,violet','0','00000000040b4803456488942a4f98e2cd482a4553f78c3e5ac66bf8b7151765','uncensored','2026-11-19 15:00:01'),(13,'20261119103040058',0,0,'red,violet','0','00000000040b4803dfffd3d1a4a6085e35f38106c4966b5b0089c3db0d06d80d','uncensored','2026-11-19 15:10:01'),(14,'20261119103040059',8,8,'red','0','00000000040b4803524cdc92554155409778837a697ccefd19344cafbaa5e9c8','uncensored','2026-11-19 15:20:01'),(15,'20261119103040060',2,2,'red','0','00000000040b4803c80e91fcaf906ed1d6961583647157ee80715282a1a26802','uncensored','2026-11-19 15:30:02'),(16,'20261119103040061',1,1,'green','0','00000000040b4803d7f0bae0126debf7159f2c97d1c7a6a00d777ae45020afd1','uncensored','2026-11-19 17:50:21'),(17,'20261119103040075',6,6,'red','0','00000000040b480358896ac977bc3612cdc159e523af8d2ac50ea0b5982cab76','uncensored','2026-11-19 18:00:17'),(18,'20261119103040076',9,9,'green','0','00000000040b48034deee7a00e28b8b6dd713817a970a416c34085cb9584479e','uncensored','2026-11-19 18:10:11'),(19,'20261119103040077',2,2,'red','0','00000000040b4803baba9800be3379a3eadad0f8d90858aa8110faaaf8f3842a','uncensored','2026-11-19 18:10:57'),(20,'20261119103040078',2,2,'red','0','00000000040b4803c0b5c57d62e3d4b5af5d2485a4a0d3fde72f716538ca32d2','uncensored','2026-11-19 18:20:07'),(21,'20261119103040079',4,4,'red','0','00000000040b4803ea074b2a0d44e54dd5d298153cb3129c83c1083c102d6a74','uncensored','2026-11-19 18:20:54'),(22,'20261119103040080',7,7,'green','0','00000000040b48039d7d517b80e5b092ebedc4e81049560b7033305439088c7e','uncensored','2026-11-19 18:30:03'),(23,'20261119103040081',5,5,'green,violet','0','00000000040b4803182ae34a0df85a49f3260d367b7c76178865ba871ea9b6f5','uncensored','2026-11-19 18:30:49'),(24,'20261119103040082',8,8,'red','0','00000000040b48037504a8c46843ff80192756e33ac52a0d38004bc8735898be','uncensored','2026-11-19 18:40:44'),(25,'20261119103040083',7,7,'green','0','00000000040b4803ecd33527f9235c53d9b02abeaee0bcdce9c3698ad67c0997','uncensored','2026-11-19 18:50:39'),(26,'20261119103040084',6,6,'red','0','00000000040b4803bbe609b4dd7ec99134a759360842f3d0c8b5bdc30cb98506','uncensored','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `trx_wingo_results_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_results_1min`
--

DROP TABLE IF EXISTS `trx_wingo_results_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_results_1min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `bh` varchar(255) NOT NULL DEFAULT 'wait',
  `hash` varchar(255) NOT NULL DEFAULT 'wait',
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 1-min: published results (number+color+TRON block hash)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_1min`
--

LOCK TABLES `trx_wingo_results_1min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_1min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_1min` VALUES (11,'20261119103010422',7,7,'green','0','00000000040b48036433778fca2058430cf4ff6c4a6bf8e1a08739a25f696647','uncensored','2026-11-19 12:33:09'),(12,'20261119103010424',8,8,'red','0','00000000040b480335a985ee14d10bb9567aefc3032b7dd5538c5aa1477268da','uncensored','2026-11-19 12:34:24'),(13,'20261119103010425',1,1,'green','0','00000000040b480338ae74e2738291e0af143620a106207254e881bcd6ab7841','uncensored','2026-11-19 12:34:55'),(14,'20261119103010426',8,8,'red','0','00000000040b4803dcebeecc2bf078726a27a298a2d51de76a1a11d016c4578a','uncensored','2026-11-19 12:44:01'),(15,'20261119103010435',4,4,'red','0','00000000040b4803066e0af4f6d909d178bdcaa8573eae3d131a05ea0b3c8f54','uncensored','2026-11-19 12:45:00'),(16,'20261119103010436',9,9,'green','0','00000000040b480334c07db23eec325e09261ea75b8845e8c95bd8f187ab8d19','uncensored','2026-11-19 12:46:01'),(17,'20261119103010437',9,9,'green','0','00000000040b4803809643431c43160e390ece2dbaa98892f4ccbb6274909ddc','uncensored','2026-11-19 12:47:00'),(18,'20261119103010438',6,6,'red','0','00000000040b4803206c78a89d2a9386316208669a2c641ba882d370512f6ddf','uncensored','2026-11-19 12:48:01'),(19,'20261119103010439',0,0,'red,violet','0','00000000040b480335f06ee7cb6ef84d82841d884373b976b89a38b1c4bc8000','uncensored','2026-11-19 12:49:00'),(20,'20261119103010440',0,0,'red,violet','88132910','000000000540cd2ec5d248f68e021dff8b02a043875438c16b1128429dd53e0e','uncensored','2026-11-19 12:49:57'),(21,'20261119103010441',7,7,'green','0','00000000040b4803c64148540866166a3fbc84da1bdb35c7412f76000818707f','uncensored','2026-11-19 12:51:01'),(22,'20261119103010442',2,2,'red','0','00000000040b4803de530403c2ef0e588421d257d51037f976a764915544cfa2','uncensored','2026-11-19 12:52:00'),(23,'20261119103010443',8,8,'red','0','00000000040b48030a9befbc4b7a5a28dd2a597b57c03a20c43b5041f1f88b8d','uncensored','2026-11-19 12:53:01'),(24,'20261119103010444',4,4,'red','0','00000000040b48037d5421878d19ee9aef9221b95a334e0631e7a71d0c945e04','uncensored','2026-11-19 12:54:00'),(25,'20261119103010445',0,0,'red,violet','0','00000000040b4803a246c9cb4481bbc77830a701315ca8b47000cbebf41f680a','uncensored','2026-11-19 12:55:00'),(26,'20261119103010446',5,5,'green,violet','0','00000000040b48036b27d435bd678154ceefe818bbe9dce0e424e35c9f2a0c55','uncensored','2026-11-19 12:56:01'),(27,'20261119103010447',1,1,'green','88133050','000000000540cdba94683fb0536d7a207f75c67741cd6b65f80911ffe0284631','uncensored','2026-11-19 12:56:57'),(28,'20261119103010448',2,2,'red','0','00000000040b4803bc47d71b2e00e0c96117ae73ae2b8fba0159b52926e290a2','uncensored','2026-11-19 12:58:01'),(29,'20261119103010449',5,5,'green,violet','0','00000000040b4803b194d600ff4bc79b7ffe631c6555878195da4899306b5c25','uncensored','2026-11-19 12:59:00'),(30,'20261119103010450',0,0,'red,violet','0','00000000040b4803650e9e0c30099fa162b335935e15bd0df2b0a3d2530e4eb0','uncensored','2026-11-19 13:00:00'),(31,'20261119103010451',9,9,'green','0','00000000040b48032932d45b1621d1147928b2cf62d5bfc6520577b558f9cacb','uncensored','2026-11-19 13:01:01'),(32,'20261119103010452',0,0,'red,violet','88133150','000000000540ce1eeb43cce7d2ec67bb4c0fd0bb37658b21ae94546c6c70baca','uncensored','2026-11-19 13:01:57'),(33,'20261119103010453',8,8,'red','0','00000000040b4803c00e9c4a0dd4d7360089596afe3db7852996ec677eb4728d','uncensored','2026-11-19 13:03:00'),(34,'20261119103010454',6,6,'red','0','00000000040b4803b52a9d766a121bed2a286bb5d78d2bafe5f803bcbe41b3d6','uncensored','2026-11-19 13:04:00'),(35,'20261119103010455',6,6,'red','0','00000000040b48037cd4d31faaa58edfbc85685a5f0385158397b0031d2062b6','uncensored','2026-11-19 13:05:00'),(36,'20261119103010456',3,3,'green','0','00000000040b480300f18df5df0050f135399c566de459b965bd62b08598a5b3','uncensored','2026-11-19 13:06:00'),(37,'20261119103010457',8,8,'red','0','00000000040b48034046fe4a233bcd3cf30d142c82df6ba3389854843b3b2c38','uncensored','2026-11-19 13:07:01'),(38,'20261119103010458',0,0,'red,violet','0','00000000040b4803d2fe32508a667e9165415bda2133564a8c552d7c001f9520','uncensored','2026-11-19 13:08:00'),(39,'20261119103010459',6,6,'red','0','00000000040b48035113b678e3487f46a1c8270eab1689875aa4fc8d5f9c96ad','uncensored','2026-11-19 13:09:00'),(40,'20261119103010460',9,9,'green','0','00000000040b48034b3762b14ed60cb3630c423d83b47ab0e365e84136ccde69','uncensored','2026-11-19 13:10:00'),(41,'20261119103010461',2,2,'red','0','00000000040b4803fc1f46afc45cbc8cc367ed2d1ac6ea6f8d409d864346ecb2','uncensored','2026-11-19 13:11:00'),(42,'20261119103010462',1,1,'green','88133350','000000000540cee65a258546f6d51592dfaa20969b89d611c5db9e873d0fae81','uncensored','2026-11-19 13:11:57'),(43,'20261119103010463',9,9,'green','0','00000000040b48039576b5ecc7224a23e96df6f5a024382b70d2862db9dbb589','uncensored','2026-11-19 13:13:01'),(44,'20261119103010464',9,9,'green','0','00000000040b480339e1d592ac77f950362964b0844171ba70d6eca80b54fb29','uncensored','2026-11-19 13:14:00'),(45,'20261119103010465',2,2,'red','0','00000000040b4803cb5dfad9598e9349e3aaaee7c7d6a74e3a9afb05712662ee','uncensored','2026-11-19 13:15:01'),(46,'20261119103010466',5,5,'green,violet','0','00000000040b480326c8898af177d2ea12e4e440a324963e280a5d3b4c6c1be5','uncensored','2026-11-19 13:16:00'),(47,'20261119103010467',4,4,'red','0','00000000040b4803dd6ff50d86ffb46b59d969a1adb6b7503bb3984ebe01d0f4','uncensored','2026-11-19 13:17:00'),(48,'20261119103010468',6,6,'red','0','00000000040b4803b9d5feddb5426611df95453b1099230525577dc60ace6f66','uncensored','2026-11-19 13:18:00'),(49,'20261119103010469',3,3,'green','0','00000000040b48037a98e184944acfc6e08cf6a106ae96206938e23f8b6bde03','uncensored','2026-11-19 13:19:00'),(50,'20261119103010470',9,9,'green','0','00000000040b48033ca4f214af1642c49322aae64ab206f13b1d235e2756c959','uncensored','2026-11-19 13:20:00'),(51,'20261119103010471',7,7,'green','0','00000000040b48031875c89864516c5cf362e5d2dcbc98797d53c7d750d5cf27','uncensored','2026-11-19 13:21:01'),(52,'20261119103010472',7,7,'green','0','00000000040b4803224699143bac0b2f4bc4518f3047b608541aa29e1667cffe','uncensored','2026-11-19 13:22:00'),(53,'20261119103010473',0,0,'red,violet','0','00000000040b4803c993bde4b551865d7ed90be73cb92e0b0404a13809b0b8b0','uncensored','2026-11-19 13:23:01'),(54,'20261119103010474',3,3,'green','88133590','000000000540cfd6ba366df4e2ab162039515d844575760611842f3bb12fa753','uncensored','2026-11-19 13:23:57'),(55,'20261119103010475',7,7,'green','0','00000000040b4803075f3383d3f7b3fc09e15614d7056771b4db3aeca6e67d7e','uncensored','2026-11-19 13:25:01'),(56,'20261119103010476',9,9,'green','0','00000000040b4803a8e79c57b8e11cc3487bedfd2816060e8d63bde659f8489f','uncensored','2026-11-19 13:26:00'),(57,'20261119103010477',3,3,'green','0','00000000040b48038f373aad703f658c17b56e068bde42ff42f26c89a303cd53','uncensored','2026-11-19 13:27:01'),(58,'20261119103010478',9,9,'green','0','00000000040b4803bc3f96cffca284ab7d32ccb536ed5920b23746aab2d6e6b9','uncensored','2026-11-19 13:28:00'),(59,'20261119103010479',7,7,'green','0','00000000040b480351d9a85dff7683a07109fcc1904bbf841543829e70a5547e','uncensored','2026-11-19 13:29:01'),(60,'20261119103010480',9,9,'green','0','00000000040b480360867daffda6e126455e01842cbbfc67946f34eb11628ca9','uncensored','2026-11-19 13:30:00'),(61,'20261119103010481',6,6,'red','0','00000000040b480358ab6229bb63417f5cd1f050fbcfe621767b8c8a5ebf9c36','uncensored','2026-11-19 13:31:01'),(62,'20261119103010482',8,8,'red','88133750','000000000540d076d8269a83cf808014678d251240afe901af09dbe1288b0768','uncensored','2026-11-19 13:31:57'),(63,'20261119103010483',1,1,'green','0','00000000040b48037ca494a7734a99854cc4ae72e3596b835d8694ff86a46401','uncensored','2026-11-19 13:33:00'),(64,'20261119103010484',9,9,'green','88133790','000000000540d09e43ff4f63138a2cfdd4cf4203354505826984d998892ecd9c','uncensored','2026-11-19 13:33:57'),(65,'20261119103010485',1,1,'green','88133810','000000000540d0b299347b391340e8b8644d520f2eadd63f8109f77eba9401dd','uncensored','2026-11-19 13:34:57'),(66,'20261119103010486',0,0,'red,violet','0','00000000040b48036615ce23da1235bcdfb4f25ea7f66b99d692c105631a0da0','uncensored','2026-11-19 13:36:01'),(67,'20261119103010487',5,5,'green,violet','0','00000000040b4803a317e435e244a70454e8133f685860280ea8c8826c0e155c','uncensored','2026-11-19 13:37:00'),(68,'20261119103010488',9,9,'green','0','00000000040b4803dea7f014e01b3625330359860e139d7cbc89dfac1962a0c9','uncensored','2026-11-19 13:38:01'),(69,'20261119103010489',1,1,'green','0','00000000040b48035917dc9cb1e39b56cbf96091dd4895468bc4032110d36871','uncensored','2026-11-19 13:39:00'),(70,'20261119103010490',5,5,'green,violet','0','00000000040b4803960ca5c4078e95fdb5735fb33e3814db181dddfcc958d8f5','uncensored','2026-11-19 13:40:01'),(71,'20261119103010491',8,8,'red','0','00000000040b480398acae22c9235c6a3bb0f35e52c82b48029f1757c42b8aaa','uncensored','2026-11-19 13:41:01'),(72,'20261119103010492',4,4,'red','88133950','000000000540d13e3190f14f98c4fe08a4df7838a1357cf28f4b3ef6f0cf204f','uncensored','2026-11-19 13:41:57'),(73,'20261119103010493',2,2,'red','0','00000000040b4803e85a5ee966ee01c6a6625ea7b07e4a0f40630f5f690d3ec2','uncensored','2026-11-19 13:43:01'),(74,'20261119103010494',4,4,'red','88133990','000000000540d166251177eaedb2304046517c1967816c784f3e6a7f0a9c8ed4','uncensored','2026-11-19 13:43:57'),(75,'20261119103010495',5,5,'green,violet','0','00000000040b4803a9076c60c0caed2a3c4123bff7986d67b0484b5fbae7f95d','uncensored','2026-11-19 13:45:00'),(76,'20261119103010496',9,9,'green','0','00000000040b48038eb20d3e9cc2ad6f5d725ded6192e123a0cec0b6a803b9fa','uncensored','2026-11-19 13:46:00'),(77,'20261119103010497',6,6,'red','0','00000000040b480309b492cf58e334c6d0bb972381fa2f34c8080a6c976e0d76','uncensored','2026-11-19 13:47:01'),(78,'20261119103010498',1,1,'green','0','00000000040b48034677a19474c8d379b0bc819093a261cf8c48622a0348a641','uncensored','2026-11-19 13:48:00'),(79,'20261119103010499',0,0,'red,violet','0','00000000040b480363d893eff2ec52a5b438bd073e414c4c6a0b2d1ba585c110','uncensored','2026-11-19 13:49:00'),(80,'20261119103010500',2,2,'red','0','00000000040b48037badb9bf6050923d1109d3b8e03b76ee5708b2a100634732','uncensored','2026-11-19 13:50:01'),(81,'20261119103010501',4,4,'red','0','00000000040b4803f10172314cd895cd7e0931c798aad2dc31433d5d5fcd01c4','uncensored','2026-11-19 13:51:01'),(82,'20261119103010502',4,4,'red','0','00000000040b4803a6b477a5c0b702d6a2cc3c42ffde890fc5360dc173dedc4c','uncensored','2026-11-19 13:52:00'),(83,'20261119103010503',5,5,'green,violet','0','00000000040b4803799f12f91cdc675487cd4f329d8704fc48c3b4a425239d25','uncensored','2026-11-19 13:53:01'),(84,'20261119103010504',9,9,'green','0','00000000040b48036395240ab133948c2f5ec52d01963278ba668c492994d609','uncensored','2026-11-19 13:54:00'),(85,'20261119103010505',3,3,'green','0','00000000040b4803c21890ad97ca331e5443858dd0cfc5a6db6c5500cc7a6733','uncensored','2026-11-19 13:55:01'),(86,'20261119103010506',2,2,'red','0','00000000040b48031b2c25265c2add3bb296ac3536721044f3dcacf0ba03b282','uncensored','2026-11-19 13:56:00'),(87,'20261119103010507',1,1,'green','0','00000000040b4803ac35e58dd63049e203c4e975d495ee37614186b8c5b5fc01','uncensored','2026-11-19 13:57:01'),(88,'20261119103010508',1,1,'green','0','00000000040b4803de89a7a888077a305ee68031ee4c63cafdcb8c7c5a324051','uncensored','2026-11-19 13:58:00'),(89,'20261119103010509',8,8,'red','0','00000000040b48034c0f91e2ed2efe29fb7502c34e88428be58b8867ecd9bc58','uncensored','2026-11-19 13:59:00'),(90,'20261119103010510',2,2,'red','0','00000000040b480326f500ec34fb55e94a4deca199b0d17f5bfceb9ffa65f12d','uncensored','2026-11-19 14:00:01'),(91,'20261119103010511',0,0,'red,violet','0','00000000040b4803402f85400e3fd66cf5e4703c8ff9b428406a1784538f70db','uncensored','2026-11-19 14:01:00'),(92,'20261119103010512',5,5,'green,violet','0','00000000040b480367d47a0aa8e31a56ee3b35c1c51ba2568c5f6565aac179f5','uncensored','2026-11-19 14:02:00'),(93,'20261119103010513',8,8,'red','0','00000000040b480334e145b82978ca644af3fac4e977ec51fc727d1045202f48','uncensored','2026-11-19 14:03:00'),(94,'20261119103010514',4,4,'red','88134390','000000000540d2f6167af97848f3291ca3e72a9b7fd4853a33f42917b68d0e84','uncensored','2026-11-19 14:03:57'),(95,'20261119103010515',6,6,'red','0','00000000040b480319ffa42b74e26ade0e5b2c6c4f63dec292c03069d8e104c6','uncensored','2026-11-19 14:05:00'),(96,'20261119103010516',8,8,'red','0','00000000040b48030b03a7896461880be77d1ea562053d08d3b5c3a5ac662f98','uncensored','2026-11-19 14:06:01'),(97,'20261119103010517',5,5,'green,violet','0','00000000040b48038828bcd49160b4aed9187525bd13d5dca3640c4fd330a65b','uncensored','2026-11-19 14:07:01'),(98,'20261119103010518',9,9,'green','0','00000000040b48034505d0424a5a4d3cde38ea1aad403bbee3d9eb0bdf9d6f9c','uncensored','2026-11-19 14:08:00'),(99,'20261119103010519',5,5,'green,violet','0','00000000040b48033183044e7ee759ba4ff567b5f0c59308fb797b8570bae95c','uncensored','2026-11-19 14:09:00'),(100,'20261119103010520',4,4,'red','0','00000000040b4803dcfd3fb2f153ac5a56a5677fa6ce605389b4c02d37b67c84','uncensored','2026-11-19 14:10:00'),(101,'20261119103010521',7,7,'green','0','00000000040b4803ec3559476a52cb5b5a740d3039b487485e3f83f7ddc9a37b','uncensored','2026-11-19 14:11:00'),(102,'20261119103010522',2,2,'red','0','00000000040b480371ae657c1734237359679e95b56dc30b32424fbd5a3d1a62','uncensored','2026-11-19 14:12:01'),(103,'20261119103010523',5,5,'green,violet','0','00000000040b4803b6f810e60ae358f9ab96183b73e14efc67954d1c62fd0e5d','uncensored','2026-11-19 14:13:01'),(104,'20261119103010524',0,0,'red,violet','0','00000000040b480374c8815994b6f7959760c87ef6bd9549fa7b351ef5b82c90','uncensored','2026-11-19 14:14:00'),(105,'20261119103010525',3,3,'green','0','00000000040b4803049366e3ac6d26a22943464b28a277be3202e1d99c0a36f3','uncensored','2026-11-19 14:15:00'),(106,'20261119103010526',9,9,'green','0','00000000040b4803a40fff2d036efc21529415f5dfb673f929455cec1796afc9','uncensored','2026-11-19 14:16:00'),(107,'20261119103010527',4,4,'red','0','00000000040b480374a72747f0b0d9c3363d334f7bb73eae180a497b6bef04be','uncensored','2026-11-19 14:17:00'),(108,'20261119103010528',8,8,'red','0','00000000040b480375adb6a68974731a34f4cbdd05640b58599509001195978a','uncensored','2026-11-19 14:18:01'),(109,'20261119103010529',2,2,'red','0','00000000040b4803ad11b60de16eb01aed88285991e7777d5aa3a1b61838a4f2','uncensored','2026-11-19 14:19:00'),(110,'20261119103010530',7,7,'green','0','00000000040b48031cf41bda78adbcfe312d8838843215b575866bbdf2153b7c','uncensored','2026-11-19 14:20:01'),(111,'20261119103010531',4,4,'red','0','00000000040b4803d331c3b1c5a0b700d9e25e1dc2489b31a95cd8dee20b6154','uncensored','2026-11-19 14:21:01'),(112,'20261119103010532',0,0,'red,violet','0','00000000040b48039a32f84bad85f9a9fbda840f7e311ba1ebf7afe173ecadc0','uncensored','2026-11-19 14:22:00'),(113,'20261119103010533',7,7,'green','0','00000000040b48034b491a130b59beb4610201a97fbb5b738f521fa666ff8547','uncensored','2026-11-19 14:23:01'),(114,'20261119103010534',5,5,'green,violet','0','00000000040b4803b70f241d160d9e2d966f095a3e3c89ecdaf121465e2cccb5','uncensored','2026-11-19 14:24:00'),(115,'20261119103010535',1,1,'green','0','00000000040b4803908ac7c9691a9cb28a92fcc45566e97c0013781f3a516da1','uncensored','2026-11-19 14:25:01'),(116,'20261119103010536',7,7,'green','88134830','000000000540d4ae85784ca57636c46f4437a59b24af31608abe876d807dddab','uncensored','2026-11-19 14:25:57'),(117,'20261119103010537',3,3,'green','0','00000000040b48038b4f6e66269a3a61dae11ed6f15a2cc8ca2176cd7491ae73','uncensored','2026-11-19 14:27:01'),(118,'20261119103010538',7,7,'green','0','00000000040b4803101b0ea20cfa55770c6bbeb4c015710a92866c3ae7ceb4b7','uncensored','2026-11-19 14:28:00'),(119,'20261119103010539',9,9,'green','0','00000000040b480317119a86a6660c654065d9359947e046c78540701de3c39a','uncensored','2026-11-19 14:29:01'),(120,'20261119103010540',4,4,'red','0','00000000040b48038bfc04229abbaed939609f7e416b61444693bbfc7f7c0df4','uncensored','2026-11-19 14:29:04'),(121,'20261119103010541',0,0,'red,violet','0','00000000040b48038b10912096146144a35160435fdebdc06d26caf6bb5d0610','uncensored','2026-11-19 14:29:11'),(122,'20261119103010542',8,8,'red','0','00000000040b480362bee47cdbc3cdfb4083b35fdd2ae21eeee29c61ef8a8e78','uncensored','2026-11-19 14:29:24'),(123,'20261119103010543',1,1,'green','0','00000000040b4803423c428bc58702b9057a8e547e9c61232e76895653aeda1a','uncensored','2026-11-19 14:30:00'),(124,'20261119103010544',6,6,'red','0','00000000040b4803dc9aa49546b280b6eda0444a6576b3e08e889d46ca68066b','uncensored','2026-11-19 14:31:00'),(125,'20261119103010545',0,0,'red,violet','0','00000000040b4803dffbe9ebc723b276b4bb06fb4851904ee1bd9aa2c7947d20','uncensored','2026-11-19 14:32:01'),(126,'20261119103010546',0,0,'red,violet','0','00000000040b48031a356b2861239679307f49f73278bfec98e598e883f5490a','uncensored','2026-11-19 14:33:00'),(127,'20261119103010547',6,6,'red','0','00000000040b48033be2214b44c77bd409427eb6b84bc788939a094f5e556c56','uncensored','2026-11-19 14:34:00'),(128,'20261119103010548',9,9,'green','0','00000000040b4803da6e1d0f5ddc12743c1336f76becf007470935df999fc9cc','uncensored','2026-11-19 14:35:00'),(129,'20261119103010549',7,7,'green','0','00000000040b4803cafe11336a85818d7b71443e164d22f0baf0f2379ba6bf17','uncensored','2026-11-19 14:36:01'),(130,'20261119103010550',2,2,'red','0','00000000040b4803cc6c265596510b5f5396c2a02368f4b7e5a6b09acfa483c2','uncensored','2026-11-19 14:37:00'),(131,'20261119103010551',5,5,'green,violet','0','00000000040b48038975a5e9aa3e19faf92024ef56edeec6b690a8eef0d2b15a','uncensored','2026-11-19 14:38:01'),(132,'20261119103010552',2,2,'red','0','00000000040b4803e6c7af2a641326ddd42745908d27c14e97032fa79dfd492d','uncensored','2026-11-19 14:39:00'),(133,'20261119103010553',3,3,'green','0','00000000040b48035860256d8ed23cb1543ad47474357c5bbae5d6bb6b45d763','uncensored','2026-11-19 14:40:00'),(134,'20261119103010554',6,6,'red','0','00000000040b4803224af49d075f3f5b92cec93497da9159424fb6e0044b5fa6','uncensored','2026-11-19 14:41:00'),(135,'20261119103010555',4,4,'red','0','00000000040b480392a88f1ea48e176cdfbdb5fdbc293bc5d8d2f8cd31694eae','uncensored','2026-11-19 14:42:00'),(136,'20261119103010556',9,9,'green','0','00000000040b480373a027d398faae86bd1975a4342250558dcbef822a38d5c9','uncensored','2026-11-19 14:43:00'),(137,'20261119103010557',5,5,'green,violet','0','00000000040b4803699e8c0bfa41bbbdc842c1f2429a19c1d5d632f404c05a55','uncensored','2026-11-19 14:44:00'),(138,'20261119103010558',1,1,'green','0','00000000040b480388d2fae7b05316f40f596c457f34e4e3dd9ba38b00e62a1b','uncensored','2026-11-19 14:45:01'),(139,'20261119103010559',6,6,'red','0','00000000040b4803b851458f42f307bb4fbcb3edff5510fe0e32b4595a7309a6','uncensored','2026-11-19 14:46:00'),(140,'20261119103010560',4,4,'red','0','00000000040b48031d87828844aba874f8ca4ce1cd030c61e40f2399f958b3f4','uncensored','2026-11-19 14:47:01'),(141,'20261119103010561',3,3,'green','0','00000000040b48031855c8c4e3488d0b7e73ffb5542515d2b190458a42e75053','uncensored','2026-11-19 14:48:00'),(142,'20261119103010562',2,2,'red','0','00000000040b4803a7bf64ed001c4a41a273725f80164b4c9f58cad3510314b2','uncensored','2026-11-19 14:49:01'),(143,'20261119103010563',9,9,'green','0','00000000040b480329b29285d693c682322a80588c9c9d61e4c100f5d705d99d','uncensored','2026-11-19 14:50:00'),(144,'20261119103010564',6,6,'red','0','00000000040b480370fe6203eea0f6ac427af13926623e13f1ca47051473176c','uncensored','2026-11-19 14:51:00'),(145,'20261119103010565',2,2,'red','0','00000000040b480362dbcd92d5c452ee8c57f4790897bd2d967dad88709d4c2c','uncensored','2026-11-19 14:52:00'),(146,'20261119103010566',7,7,'green','0','00000000040b48036cdfc8daa1cff7993329e968424ea5d74b58cd3556c69be7','uncensored','2026-11-19 14:53:01'),(147,'20261119103010567',7,7,'green','0','00000000040b48032ed608f2cc76ab6050fd7b0860201814061b19e039515137','uncensored','2026-11-19 14:54:00'),(148,'20261119103010568',5,5,'green,violet','0','00000000040b48035b9c54f91a3052a85d43b376d6e899f255a2267fd5d84bb5','uncensored','2026-11-19 14:55:01'),(149,'20261119103010569',4,4,'red','0','00000000040b4803049f80347be955224d7e556af820d3bee1eebac0b187f034','uncensored','2026-11-19 14:56:00'),(150,'20261119103010570',6,6,'red','0','00000000040b4803ae5cf1652c8089ca22ace45b53b93a3a566b7fb036f99a6a','uncensored','2026-11-19 14:57:01'),(151,'20261119103010571',9,9,'green','88135470','000000000540d72e240981e14a5a82202957227115498f3061616168cb715b29','uncensored','2026-11-19 14:57:57'),(152,'20261119103010572',2,2,'red','0','00000000040b4803da3ddcebd3a7a8e6e0192b0c138119a2c470429883634592','uncensored','2026-11-19 14:59:01'),(153,'20261119103010573',0,0,'red,violet','0','00000000040b48037cd37c4056b3351761fc56e1b26b510897b57ec40e98f010','uncensored','2026-11-19 15:00:00'),(154,'20261119103010574',1,1,'green','0','00000000040b48037e84f7b371d8dce584f2722a083ddddbedac94fd3113421c','uncensored','2026-11-19 15:01:01'),(155,'20261119103010575',0,0,'red,violet','0','00000000040b480346fead8bae049a1802ba3fe61693da6010432a7a14a8b290','uncensored','2026-11-19 15:02:00'),(156,'20261119103010576',1,1,'green','0','00000000040b48034ce34405d2cd6f525ab10843a02e93552e90ec557f66331e','uncensored','2026-11-19 15:03:00'),(157,'20261119103010577',7,7,'green','0','00000000040b48031e25d409cb2186e6787475fb578e8279638b181fde97eb17','uncensored','2026-11-19 15:04:00'),(158,'20261119103010578',6,6,'red','0','00000000040b48033ce58d5e877583c9f42f29fd30c0920bd99714add2877e6d','uncensored','2026-11-19 15:05:00'),(159,'20261119103010579',0,0,'red,violet','0','00000000040b48030870c9274c1e932e5e50208162907d2012c780cbfb268c40','uncensored','2026-11-19 15:06:00'),(160,'20261119103010580',8,8,'red','0','00000000040b4803be5106033baa40eb6235e984508f8a74c59c0d5a93538088','uncensored','2026-11-19 15:07:00'),(161,'20261119103010581',1,1,'green','0','00000000040b48035575c509dbb2e53a27b503f3be97361f40153fe4e94c7c41','uncensored','2026-11-19 15:08:01'),(162,'20261119103010582',7,7,'green','0','00000000040b4803225eb115f0b0aa1e6d858b1f15febf1696b17ea9e96867fe','uncensored','2026-11-19 15:09:01'),(163,'20261119103010583',8,8,'red','0','00000000040b48037baee8b67a705e2605ffae3473a9dd631a8ba6d91f97b4e8','uncensored','2026-11-19 15:10:00'),(164,'20261119103010584',6,6,'red','0','00000000040b48037bc716e3500cab8e84dce4600e6f8509b102fdf787bc46fc','uncensored','2026-11-19 15:11:00'),(165,'20261119103010585',3,3,'green','0','00000000040b48039127b208b7fced6a3330bad92c6d9535defd48f43913fdfa','uncensored','2026-11-19 15:12:00'),(166,'20261119103010586',5,5,'green,violet','0','00000000040b4803708ddba673bd2ee11f18d08b53d990824efe2190a8032d5b','uncensored','2026-11-19 15:13:00'),(167,'20261119103010587',2,2,'red','0','00000000040b480327623fcfe00e6f87e2fef9f481eea3980317b8adce24922f','uncensored','2026-11-19 15:14:00'),(168,'20261119103010588',0,0,'red,violet','0','00000000040b480306a6c4bcf82c8b57dacfd1aae0df9227445636289b5f60f0','uncensored','2026-11-19 15:15:01'),(169,'20261119103010589',6,6,'red','0','00000000040b48033878aebc0d7845f454ae16ec22bfd90686114d87c8babf6e','uncensored','2026-11-19 15:16:01'),(170,'20261119103010590',0,0,'red,violet','0','00000000040b480347a607b0d835a58f751f37ae866bf3fdcb0c9a31fbc18d10','uncensored','2026-11-19 15:17:00'),(171,'20261119103010591',6,6,'red','0','00000000040b48031f6d78fd0503e378b47189fab5f22ad12729d46fdecb706c','uncensored','2026-11-19 15:18:01'),(172,'20261119103010592',2,2,'red','0','00000000040b48030b6937d022a179aef3f85390a1a11c027eedbbb5e1e61a52','uncensored','2026-11-19 15:19:00'),(173,'20261119103010593',1,1,'green','0','00000000040b480316dc60420b1e9b0b3b09949635d6077c624fe76de05c8341','uncensored','2026-11-19 15:20:01'),(174,'20261119103010594',1,1,'green','0','00000000040b4803c11175f6885a7c21a95d1096d0c3ad789a27d9d36469fa81','uncensored','2026-11-19 15:21:01'),(175,'20261119103010595',0,0,'red,violet','0','00000000040b4803307aaf82d9bf47b62b2852ce9cf6fb09ab58baa0646120cb','uncensored','2026-11-19 15:22:00'),(176,'20261119103010596',7,7,'green','0','00000000040b48034b7565a4beecc0a5fc6dc750bbefc8c8b83403a8d6fe0427','uncensored','2026-11-19 15:23:00'),(177,'20261119103010597',0,0,'red,violet','0','00000000040b48030f8b6b14a8a07ed65c78ac88609ed28e0fb2f392aff65c0f','uncensored','2026-11-19 15:24:01'),(178,'20261119103010598',3,3,'green','0','00000000040b4803736c213b3ab004ef6fe11cc6fb40229ac4e597d783340903','uncensored','2026-11-19 15:25:00'),(179,'20261119103010599',9,9,'green','0','00000000040b4803f16fba5a0818ad63b690daa3f916e9f7e94269294fb5df9e','uncensored','2026-11-19 15:26:00'),(180,'20261119103010600',9,9,'green','0','00000000040b48032d11300b4c2166a5b8ebc3d5275f043629d220d450396e9a','uncensored','2026-11-19 15:27:00'),(181,'20261119103010601',6,6,'red','0','00000000040b4803c94b63085e5c6bd08b713415dca5c830399a831f61cca9c6','uncensored','2026-11-19 15:28:00'),(182,'20261119103010602',1,1,'green','0','00000000040b4803f1c362f4f947211024f2730c394d5b98f2e6f99e2eddb11f','uncensored','2026-11-19 15:29:00'),(183,'20261119103010603',8,8,'red','0','00000000040b480359b8a5dac87b8947773a23c6a14a700ef9ae9c57c0c454f8','uncensored','2026-11-19 15:30:01'),(184,'20261119103010604',7,7,'green','0','00000000040b48030ce6d04eaf16502d386aa6110bb2410537e1171a247feaac','uncensored','2026-11-19 15:31:00'),(185,'20261119103010605',2,2,'red','0','00000000040b4803d38ee846eae2ccca1ef51587bb45a9ba9cda9217a8973202','uncensored','2026-11-19 15:32:01'),(186,'20261119103010606',9,9,'green','0','00000000040b48035cdb6393f8b3c4fbf08044d90e7ab7459fe9a1779c0ca329','uncensored','2026-11-19 15:33:00'),(187,'20261119103010607',6,6,'red','0','00000000040b4803e5c101889b9566f0d5a488b738efc56c254d68870082126c','uncensored','2026-11-19 15:34:01'),(188,'20261119103010608',7,7,'green','0','00000000040b48034d61348d8f26b79f851e28962eb2fe0fd037d9a85a0de5c7','uncensored','2026-11-19 15:35:00'),(189,'20261119103010609',6,6,'red','0','00000000040b4803364c1749cbc7e9c1e8bd093d14b9624bf917e3e805312d86','uncensored','2026-11-19 15:35:03'),(190,'20261119103010610',0,0,'red,violet','0','00000000040b4803cb8b0ca08059f7fb9d4cc40848fecedbf5febe7e4587dd0f','uncensored','2026-11-19 15:35:21'),(191,'20261119103010611',6,6,'red','0','00000000040b4803e283f3a4085e66f9325aedbb4e633e82a4728fea490233f6','uncensored','2026-11-19 15:35:48'),(192,'20261119103010612',4,4,'red','0','00000000040b4803acf8d0ed9b112fc9065e629592e5d1779de3a72506c41b44','uncensored','2026-11-19 15:36:00'),(193,'20261119103010613',7,7,'green','0','00000000040b480352ae0ed55f996e3f54c858a5b5070e9634640e3e59d2917a','uncensored','2026-11-19 15:37:01'),(194,'20261119103010614',0,0,'red,violet','0','00000000040b480380f6c3010f0a723acc603adab429fb6e992c75f719b662c0','uncensored','2026-11-19 15:38:00'),(195,'20261119103010615',9,9,'green','0','00000000040b480386ed274e78c105dc6392bab88016f6e8fdaca666b9a9ebbf','uncensored','2026-11-19 15:38:52'),(196,'20261119103010616',0,0,'red,violet','0','00000000040b480317873f6272deccc7593d28425cf26f47d6317c8b32b4ea40','uncensored','2026-11-19 15:39:00'),(197,'20261119103010617',0,0,'red,violet','0','00000000040b480326c55d3b81b319895952580272c2151ad34c842d993e80de','uncensored','2026-11-19 17:44:14'),(198,'20261119103010735',2,2,'red','0','00000000040b4803204bb1f7511615bbaa869a58c8b67faac10c535ec3a07e82','uncensored','2026-11-19 17:44:59'),(199,'20261119103010736',8,8,'red','0','00000000040b4803950d45d1e3e6a8055e35651be7775719dd3df38be96d38a8','uncensored','2026-11-19 17:45:45'),(200,'20261119103010737',8,8,'red','0','00000000040b48031f4a82b7a354afdfcaf8536b205fc0a4573631479392e2f8','uncensored','2026-11-19 17:46:31'),(201,'20261119103010738',4,4,'red','0','00000000040b48031c464dd667cbd87c0af2c7192a2c3463240b42d860d7294c','uncensored','2026-11-19 17:47:17'),(202,'20261119103010739',3,3,'green','0','00000000040b480303c490ba93f0556175c5dc4639813482224cd8713259a53c','uncensored','2026-11-19 17:48:03'),(203,'20261119103010740',2,2,'red','0','00000000040b4803e5d2e5dcaa5023be5425320e4902857a5dfff9428c99782d','uncensored','2026-11-19 17:48:49'),(204,'20261119103010741',1,1,'green','0','00000000040b4803eb4d1e874acdf159b63d5de412c1f9c4b554dd95a971dd81','uncensored','2026-11-19 17:49:35'),(205,'20261119103010742',0,0,'red,violet','0','00000000040b48039d06740ad0dd7e8089ce62196ecd414f1434576578d575f0','uncensored','2026-11-19 17:50:20'),(206,'20261119103010743',2,2,'red','0','00000000040b4803591c6f972c3c42eac3734a291599160942cc0f913f14d2ee','uncensored','2026-11-19 17:51:07'),(207,'20261119103010744',2,2,'red','0','00000000040b4803080861e1a0cafdd5c7b818cd9e68c3b6a635f21d50ddfe72','uncensored','2026-11-19 17:51:53'),(208,'20261119103010745',3,3,'green','0','00000000040b4803266de6aea9eb6a1250aa4b8ff6bf260e88e6b3db65ce403e','uncensored','2026-11-19 17:52:39'),(209,'20261119103010746',0,0,'red,violet','0','00000000040b4803e99aaad416a88be92a140ee19c9d2ffebd6c9546c232130b','uncensored','2026-11-19 17:53:24'),(210,'20261119103010747',8,8,'red','0','00000000040b48035cec28faca68e331ccf0f6c4cbdb52f94083f8b7c0ac57f8','uncensored','2026-11-19 17:54:10'),(211,'20261119103010748',3,3,'green','0','00000000040b480308a32384561444ffa1161ffa482fbfa01df94475a07513b3','uncensored','2026-11-19 17:54:56'),(212,'20261119103010749',2,2,'red','0','00000000040b4803f41b576d8631350753ae105f13c21cd379273156f05fa92f','uncensored','2026-11-19 17:55:42'),(213,'20261119103010750',0,0,'red,violet','0','00000000040b48033554d180b4bac598c8f7e88fa161a26cd488f31587f9f0cb','uncensored','2026-11-19 17:56:28'),(214,'20261119103010751',6,6,'red','0','00000000040b48035becd6b9903c74f5e3158322bb2d9216cec172c11a2814a6','uncensored','2026-11-19 17:57:13'),(215,'20261119103010752',6,6,'red','0','00000000040b4803c5e9fcef5473b95fd1ac12152d13da45bfa9900dded05826','uncensored','2026-11-19 17:57:59'),(216,'20261119103010753',0,0,'red,violet','0','00000000040b4803c60ced27947581caa5b4f32515bde18e13fda3596f31d30f','uncensored','2026-11-19 17:58:45'),(217,'20261119103010754',2,2,'red','0','00000000040b48039b1ff1b846dd9dd07147e671da9fcb14656a12abf3690132','uncensored','2026-11-19 17:59:31'),(218,'20261119103010755',6,6,'red','0','00000000040b4803b34dc0f35d54678cc02d40c71de2033579472cb089044126','uncensored','2026-11-19 18:00:16'),(219,'20261119103010756',1,1,'green','0','00000000040b48035c7e8e2f876bd8f8a78456366bf488a9e1c5359ef7a75a71','uncensored','2026-11-19 18:01:02'),(220,'20261119103010757',7,7,'green','0','00000000040b4803ace8355379ffbd10db70fc516855cdae7b6c58f7c19f0927','uncensored','2026-11-19 18:01:47'),(221,'20261119103010758',4,4,'red','0','00000000040b480377b4abf76a9d25014d0e1ee8e2dd257c8cfc5f1ab99a624f','uncensored','2026-11-19 18:02:33'),(222,'20261119103010759',0,0,'red,violet','0','00000000040b480362755d1da0dd646e27833d9155fbfaac2f8240dec04d6e90','uncensored','2026-11-19 18:03:19'),(223,'20261119103010760',2,2,'red','0','00000000040b48031cd7b328b31ebcaac77d824ceb3954b8b8484d0085832972','uncensored','2026-11-19 18:04:05'),(224,'20261119103010761',6,6,'red','0','00000000040b48034e256ce4006a48d0a9ecb6bcb0f2b7acc19b60165e6f5ef6','uncensored','2026-11-19 18:04:50'),(225,'20261119103010762',1,1,'green','0','00000000040b4803bcae84f37ce9bde3369500efb8321f2b272d717893853f1d','uncensored','2026-11-19 18:05:36'),(226,'20261119103010763',0,0,'red,violet','0','00000000040b4803dfd0aa42317d626bed35d934dae9d87cae4c79b0d0a3ee40','uncensored','2026-11-19 18:06:22'),(227,'20261119103010764',8,8,'red','0','00000000040b48033ae2930556ccfe2dbea388c79054f76130053bfe323b3998','uncensored','2026-11-19 18:07:08'),(228,'20261119103010765',6,6,'red','0','00000000040b4803992ef84c0597566eb70ca7222bd62ab9faa4506ad6aee9f6','uncensored','2026-11-19 18:07:53'),(229,'20261119103010766',0,0,'red,violet','0','00000000040b48032ef2721998dab4e6183c1dbf2a7f9c7b4a2af65d9e769b80','uncensored','2026-11-19 18:08:39'),(230,'20261119103010767',6,6,'red','0','00000000040b4803e739cdf6c1402235e00e1bc9b45665cbbe0a332b98b74c26','uncensored','2026-11-19 18:09:25'),(231,'20261119103010768',4,4,'red','0','00000000040b4803f1f9553b5fd28c13a475c9090019e782f9ca83d1c3185f74','uncensored','2026-11-19 18:10:11'),(232,'20261119103010769',4,4,'red','0','00000000040b4803bd5e29eae0d01dd263c9a78c0f9c5184b13a4100d17a94c4','uncensored','2026-11-19 18:10:57'),(233,'20261119103010770',9,9,'green','0','00000000040b4803f4e3c00d94fccb545aa6b23d482da1c6f47e8f701524eb9d','uncensored','2026-11-19 18:11:43'),(234,'20261119103010771',3,3,'green','0','00000000040b4803529eab33a8874acc4488423b7902089e68c7fa25b5550f63','uncensored','2026-11-19 18:12:29'),(235,'20261119103010772',7,7,'green','0','00000000040b4803b8e7688f6e0fb9ff0fc272b46831d8e52bad70082f319bf7','uncensored','2026-11-19 18:13:15'),(236,'20261119103010773',1,1,'green','0','00000000040b48037bdc96fc948657d5c8b51313c224e45813a03d337ceed81c','uncensored','2026-11-19 18:14:00'),(237,'20261119103010774',6,6,'red','0','00000000040b4803b8ce1e8716899e9af579e3d480d795308f0c9a63d93447e6','uncensored','2026-11-19 18:14:46'),(238,'20261119103010775',5,5,'green,violet','0','00000000040b4803d030661808174e3b99d7b5dcddae36410b28e755f2ae5b45','uncensored','2026-11-19 18:15:32'),(239,'20261119103010776',3,3,'green','0','00000000040b4803f71c4440747822d267de0ecdb8f924fe07b9ea05cdc66563','uncensored','2026-11-19 18:16:18'),(240,'20261119103010777',0,0,'red,violet','0','00000000040b4803396a66bacf78037aadffd81d0d43d646d41fdc699fa53c30','uncensored','2026-11-19 18:17:04'),(241,'20261119103010778',9,9,'green','0','00000000040b4803dba53c1ff836cd8cbc6bd1a1e52f2c296426fd48a737dfd9','uncensored','2026-11-19 18:17:50'),(242,'20261119103010779',0,0,'red,violet','0','00000000040b4803d93a8e1a6f78c7a0e426f1e29c37017f2fd1bd096d4cf040','uncensored','2026-11-19 18:18:35'),(243,'20261119103010780',5,5,'green,violet','0','00000000040b4803b835ff08b92efbee78b6133023655a3fd991e8ba00c6a5ff','uncensored','2026-11-19 18:19:21'),(244,'20261119103010781',2,2,'red','0','00000000040b4803cfc0b5f18eeba932aad172d8f2ab113f151118274a392acd','uncensored','2026-11-19 18:20:07'),(245,'20261119103010782',4,4,'red','0','00000000040b48030bd9d55d29994558af1d893dc2f91d7c6bfb1e06249f214a','uncensored','2026-11-19 18:20:53'),(246,'20261119103010783',7,7,'green','0','00000000040b4803bc3b0cdccd1b96c7e693ac100d2ca1b511155c1c473e9bc7','uncensored','2026-11-19 18:21:39'),(247,'20261119103010784',8,8,'red','0','00000000040b48039bf40151ccdb1f40f3036fb15f79452f433edd7891fb3938','uncensored','2026-11-19 18:22:25'),(248,'20261119103010785',9,9,'green','0','00000000040b48030a6362329d6012976a2c07db64dc47d173758172aa81fb9a','uncensored','2026-11-19 18:23:11'),(249,'20261119103010786',5,5,'green,violet','0','00000000040b480315a9ea1be07057f41301e1de7dc5f22944cac4c1d402d455','uncensored','2026-11-19 18:23:56'),(250,'20261119103010787',9,9,'green','0','00000000040b4803f074a154f4e7b2bdb230530209c1b0057f2d8c6ed54f959c','uncensored','2026-11-19 18:24:42'),(251,'20261119103010788',3,3,'green','0','00000000040b4803fdeb7e81d9c1b240f8e26c7e47b0c4b434f196607ee66e3c','uncensored','2026-11-19 18:25:28'),(252,'20261119103010789',7,7,'green','0','00000000040b4803bf6468543a92bdaf48a4aa37491b44b7b6b76df762bfa7ec','uncensored','2026-11-19 18:26:14'),(253,'20261119103010790',7,7,'green','0','00000000040b480326d9e293fea0a3662d270b1f3d8c33ef88168be43927aaaf','uncensored','2026-11-19 18:27:00'),(254,'20261119103010791',5,5,'green,violet','0','00000000040b4803a99019f020842283980804c452d7cdf9bb5b215e878e435c','uncensored','2026-11-19 18:27:45'),(255,'20261119103010792',5,5,'green,violet','0','00000000040b48035be32fc0304882348b00ed29f4951e6fcc0b296b7dc99ff5','uncensored','2026-11-19 18:28:31'),(256,'20261119103010793',0,0,'red,violet','0','00000000040b480324a05fdce5fcf9e097b5947c9ea04750ad835d8dcf3fe810','uncensored','2026-11-19 18:29:17'),(257,'20261119103010794',2,2,'red','0','00000000040b4803615cb3dbe56a3d52b1f6a3319205828aed893a1e7fd0cf92','uncensored','2026-11-19 18:30:03'),(258,'20261119103010795',8,8,'red','0','00000000040b4803bf94c0c5423dfd90d70c934213ae99c8f6d35f38cf88d8dd','uncensored','2026-11-19 18:30:48'),(259,'20261119103010796',0,0,'red,violet','0','00000000040b4803de4779abb96af150db84bd6e779f01ebebc18f2214e60960','uncensored','2026-11-19 18:31:34'),(260,'20261119103010797',6,6,'red','0','00000000040b48034411096f190021ece8fd0022ab90d07112e9cd944662e426','uncensored','2026-11-19 18:32:19'),(261,'20261119103010798',5,5,'green,violet','0','00000000040b4803d884c72dfc95eebc16e939ec93eb6d6cd9aa6addcb12655c','uncensored','2026-11-19 18:33:05'),(262,'20261119103010799',1,1,'green','0','00000000040b48030e47dd528fb6a3e5b5c07a2ecc0b63f7f86624193de080a1','uncensored','2026-11-19 18:33:51'),(263,'20261119103010800',9,9,'green','0','00000000040b4803ccd0978b2465487cf2e78bb67ee49f254a9479f266f15f9e','uncensored','2026-11-19 18:34:37'),(264,'20261119103010801',5,5,'green,violet','0','00000000040b4803ad44d106bc7496d5b38a7cd9b6934fa32785914224d96a5b','uncensored','2026-11-19 18:35:22'),(265,'20261119103010802',0,0,'red,violet','0','00000000040b4803b5267f9ad09fb7cc9bf2cb0dab16fcb1e44da96206bc4ff0','uncensored','2026-11-19 18:36:08'),(266,'20261119103010803',8,8,'red','0','00000000040b4803c63334146ad4621b00112b2e7446fdb3522ea5cccfc12a48','uncensored','2026-11-19 18:36:54'),(267,'20261119103010804',9,9,'green','0','00000000040b480339e206ac1b64f8e820488731b150bfd1e69115442811be09','uncensored','2026-11-19 18:37:40'),(268,'20261119103010805',5,5,'green,violet','0','00000000040b4803a089faf0eb2201ca07e47b1fd312295f18dff68ba5ec565a','uncensored','2026-11-19 18:38:26'),(269,'20261119103010806',5,5,'green,violet','0','00000000040b4803ce4e156cf948aa19eab6d26d8191a723ec081e26966a93e5','uncensored','2026-11-19 18:39:11'),(270,'20261119103010807',9,9,'green','0','00000000040b4803f00e863ac009f575337d0fc49a0693bab6b2e66e70d04ec9','uncensored','2026-11-19 18:39:57'),(271,'20261119103010808',5,5,'green,violet','0','00000000040b4803148d56cbb8bcf354f90f8ee8b37aabc807dba96c1f5142b5','uncensored','2026-11-19 18:40:43'),(272,'20261119103010809',1,1,'green','0','00000000040b480372c1c3857f91f68855b5f9eda44a14cf727ac096e09e0d1c','uncensored','2026-11-19 18:41:30'),(273,'20261119103010810',8,8,'red','0','00000000040b48038a65fc51cbbc76851dcf089ad2c6acea7bf304df7a5ccb38','uncensored','2026-11-19 18:42:15'),(274,'20261119103010811',4,4,'red','0','00000000040b4803e7c6adcbeac641e1a509cf44b13921a8bbaa0590562765c4','uncensored','2026-11-19 18:43:01'),(275,'20261119103010812',5,5,'green,violet','0','00000000040b480331b4611d603aeb4a282d447d69e71ae04773b06254ae42e5','uncensored','2026-11-19 18:43:47'),(276,'20261119103010813',7,7,'green','0','00000000040b480393d43954b135049c40eee4d440abd67bfbfecb1f96585f87','uncensored','2026-11-19 18:44:32'),(277,'20261119103010814',7,7,'green','0','00000000040b48031cd72f97396ff068e95c14ad9c4c44989ddb5ca3b3e19497','uncensored','2026-11-19 18:45:18'),(278,'20261119103010815',3,3,'green','0','00000000040b4803e4a31f54679596f408ff7a153b74856a00852127a97c0593','uncensored','2026-11-19 18:46:04'),(279,'20261119103010816',8,8,'red','0','00000000040b48036f1c9f589c0a8047f045ac330ee34e6e56e863cb3970018d','uncensored','2026-11-19 18:46:50'),(280,'20261119103010817',7,7,'green','0','00000000040b4803d6ded6872d4566cd34006385b8aad06989df2d6838e8647d','uncensored','2026-11-19 18:47:36'),(281,'20261119103010818',7,7,'green','0','00000000040b48038aa478dc374686ca6984338dce76fd6589b120a0ec623d17','uncensored','2026-11-19 18:48:21'),(282,'20261119103010819',7,7,'green','0','00000000040b48035b9d97a3b07ac734e177746a9837b94020437c4f1b23717a','uncensored','2026-11-19 18:49:07'),(283,'20261119103010820',0,0,'red,violet','0','00000000040b4803f68ef2ccb4c00be290368f9344f32de1194a736e97f4d10a','uncensored','2026-11-19 18:49:53'),(284,'20261119103010821',3,3,'green','0','00000000040b4803bd2cda33f52347f9d8a103329e492b4705a55ba9b2a7f6e3','uncensored','2026-11-19 18:50:39'),(285,'20261119103010822',6,6,'red','0','00000000040b4803f2613ffa980a8489e436acbe29f6ef1e01ca09f5ad89e6cb','uncensored','2026-11-19 18:51:25'),(286,'20261119103010823',2,2,'red','0','00000000040b4803f162f3e6ae6976b55354e966de2d1247b739279b7f452ecf','uncensored','2026-11-19 18:52:11'),(287,'20261119103010824',8,8,'red','0','00000000040b4803869f49715c6da9937dc0d849b92718fe4eb5765aba1408bc','uncensored','2026-11-19 18:52:56'),(288,'20261119103010825',7,7,'green','0','00000000040b48033328a9f4b6766d9e8b52079f661088756e74977bf20b3f97','uncensored','2026-11-19 18:53:42'),(289,'20261119103010826',8,8,'red','0','00000000040b4803bffd93fe1891529d6c88bfead30c4e363b24e861bf4a2cd8','uncensored','2026-11-19 18:54:28'),(290,'20261119103010827',9,9,'green','0','00000000040b4803dacbbcaa89c3aa07719d02bc6ecff3324730d0834ec67b89','uncensored','2026-11-19 18:55:14'),(291,'20261119103010828',2,2,'red','0','00000000040b48031a256b55722c30f5145fa4f10bbf8effad6822272fd441c2','uncensored','2026-11-19 18:56:01'),(292,'20261119103010829',9,9,'green','0','00000000040b480359791cfa0611efa75e82f4e7718f36eae93331a7e6d50439','uncensored','2026-11-19 18:56:45'),(293,'20261119103010830',9,9,'green','0','00000000040b4803b17c99daf06e97eec2f362c21b140bad2a4203b4faf149fc','uncensored','2026-11-19 18:57:31'),(294,'20261119103010831',5,5,'green,violet','0','00000000040b48037586bff3ff54be6e7d628ff10c7f6361139e3040cf16ec5c','uncensored','2026-11-19 18:58:17'),(295,'20261119103010832',6,6,'red','0','00000000040b4803a18aa432287ecd4071c1bb6ce8da3b6e3656460b561eb66b','uncensored','2026-11-19 18:59:03'),(296,'20261119103010833',9,9,'green','0','00000000040b48038ae84aa74a7eae9dc730244ea911ffb95e92b4f115a012a9','uncensored','2026-11-19 18:59:48'),(297,'20261119103010834',8,8,'red','0','00000000040b4803883f40bfb999f31247193ce14a30f8ee6d7d925f2fcb058f','uncensored','2026-11-19 19:00:34'),(298,'20261119103010835',5,5,'green,violet','0','00000000040b4803782383aae63ebdbd2af53895dc4a81ad1603d27e813ef695','uncensored','2026-11-19 19:01:19'),(299,'20261119103010836',1,1,'green','0','00000000040b480326ba253abc1d2f8d976015eecde62189fff79d04be2e761c','uncensored','2026-11-19 19:02:05'),(300,'20261119103010837',6,6,'red','0','00000000040b480311458d23e7c7fa268cdfd79560246f7c0e99da433cfae686','uncensored','2026-11-19 19:02:51'),(301,'20261119103010838',4,4,'red','0','00000000040b4803ca7c2c8f724a22f1ad819f06fd265527a2dcb1bfa7f3ad4d','uncensored','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `trx_wingo_results_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_results_3min`
--

DROP TABLE IF EXISTS `trx_wingo_results_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_results_3min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `bh` varchar(255) NOT NULL DEFAULT 'wait',
  `hash` varchar(255) NOT NULL DEFAULT 'wait',
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 3-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_3min`
--

LOCK TABLES `trx_wingo_results_3min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_3min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_3min` VALUES (6,'20261119103020142',6,6,'red','0','00000000040b4803d7032af30701202fff1cc324bdf14832895875c55bcf6626','uncensored','2026-11-19 12:45:00'),(7,'20261119103020146',4,4,'red','0','00000000040b4803c1f4b939f3df1b95d8584cfa098e8b39dd69efed887451a4','uncensored','2026-11-19 12:48:01'),(8,'20261119103020147',9,9,'green','0','00000000040b4803ead4324152f24a923c30330dc914dcc4b0074604a97d99ac','uncensored','2026-11-19 12:51:01'),(9,'20261119103020148',5,5,'green,violet','88132990','000000000540cd7ecb8a2bf21034ffd842d5ef461ca3e445166e332611cc5efa','uncensored','2026-11-19 12:53:57'),(10,'20261119103020149',5,5,'green,violet','0','00000000040b4803a359812bb0d69dbde2ee4d19228f4b4a9fe1f238f077c85b','uncensored','2026-11-19 12:57:00'),(11,'20261119103020150',2,2,'red','0','00000000040b480381982a2fd280729ff7f900baf5225a1b38c2e00565a77fa2','uncensored','2026-11-19 13:00:01'),(12,'20261119103020151',1,1,'green','0','00000000040b4803263b9ba4495248fe6e1bd98e3f82cc52d5ec62a8d748b51a','uncensored','2026-11-19 13:03:01'),(13,'20261119103020152',4,4,'red','0','00000000040b480390d98c36fbb95b46f61bb9651260f36b73f8bb602a37a284','uncensored','2026-11-19 13:06:00'),(14,'20261119103020153',8,8,'red','0','00000000040b4803337bdb98b56ac45996ebe5813f53cf3ea0ba7bab8303488c','uncensored','2026-11-19 13:09:01'),(15,'20261119103020154',6,6,'red','0','00000000040b480329257ce68d7fde72fc13f679022e3ed9cf83c71e8318686d','uncensored','2026-11-19 13:12:00'),(16,'20261119103020155',6,6,'red','0','00000000040b480394c53a0e7995e3a0dcbaa31ee7dbfa833e4b7a1986426b6d','uncensored','2026-11-19 13:15:01'),(17,'20261119103020156',8,8,'red','0','00000000040b4803c8065bc4305ba596b6fc60c6750857c69475fb96023a78ab','uncensored','2026-11-19 13:18:01'),(18,'20261119103020157',5,5,'green,violet','0','00000000040b4803e4a5712718ff85bf274eb52516df9304052f94a72a17c235','uncensored','2026-11-19 13:21:01'),(19,'20261119103020158',3,3,'green','0','00000000040b4803366a7197c666e5db4db9fe00ff3536d7e344b681668b54a3','uncensored','2026-11-19 13:24:00'),(20,'20261119103020159',3,3,'green','0','00000000040b48032a51ea7beae52c785199ec1d7419ab1c265c73926e142943','uncensored','2026-11-19 13:27:01'),(21,'20261119103020160',9,9,'green','88133710','000000000540d04efcec09b83367aef2b47e2ad78fda66739274981399b6fdc9','uncensored','2026-11-19 13:29:57'),(22,'20261119103020161',7,7,'green','0','00000000040b48037aa78643465eed4310c994811f0da1e0692fa53da9f83677','uncensored','2026-11-19 13:33:01'),(23,'20261119103020162',8,8,'red','0','00000000040b4803638c0ad0e917526381bc395fb2f2b50165bf0fc5c594d838','uncensored','2026-11-19 13:36:01'),(24,'20261119103020163',1,1,'green','0','00000000040b48039be69dfab5511127cf0ec460a7f3d65e9c6031e71886ac1e','uncensored','2026-11-19 13:39:00'),(25,'20261119103020164',5,5,'green,violet','0','00000000040b48037720c02e32a3de1f4b5c04046d1d65e40794a66ce580f105','uncensored','2026-11-19 13:42:00'),(26,'20261119103020165',3,3,'green','0','00000000040b48033021b2747ef5170e0cd81ef2c1805ee8dbb39d4ef85015a3','uncensored','2026-11-19 13:45:01'),(27,'20261119103020166',0,0,'red,violet','88134070','000000000540d1b6c4a93ba9b7c17a7138902ca3c0a5b4557628d5abc932c840','uncensored','2026-11-19 13:47:57'),(28,'20261119103020167',3,3,'green','0','00000000040b4803ff991c76bea7ce510066048f0b33382b20a66da12f25e063','uncensored','2026-11-19 13:51:01'),(29,'20261119103020168',3,3,'green','0','00000000040b48039164bfa6e2b55cf8494aeb119ba77c3d7b6ea4ef641c873d','uncensored','2026-11-19 13:54:00'),(30,'20261119103020169',4,4,'red','0','00000000040b480380e20aa78cc810313fad7c788372353b1f813c58770bf04f','uncensored','2026-11-19 13:57:01'),(31,'20261119103020170',1,1,'green','0','00000000040b4803d76985f531ee971e11ebf9abe00162af5dd620d1e48397e1','uncensored','2026-11-19 14:00:02'),(32,'20261119103020171',5,5,'green,violet','0','00000000040b480393d346e1ef0721280073f794f245c80e8ea7da426d88caa5','uncensored','2026-11-19 14:03:00'),(33,'20261119103020172',6,6,'red','0','00000000040b480321969b233173b422c4a5aa6abd9cdda83d8a08820e9b1a6b','uncensored','2026-11-19 14:06:01'),(34,'20261119103020173',8,8,'red','0','00000000040b4803c3a3c39144a4bce102843b0a1c3db45961b21d81676cb218','uncensored','2026-11-19 14:09:01'),(35,'20261119103020174',8,8,'red','0','00000000040b48036baa46631bc82c5968cadbb6b5f880128c0d676b666f2d8b','uncensored','2026-11-19 14:12:01'),(36,'20261119103020175',9,9,'green','0','00000000040b4803fd42c9944cfb5d51f34ee810c882bc2bba4a98e1658c449b','uncensored','2026-11-19 14:15:00'),(37,'20261119103020176',5,5,'green,violet','0','00000000040b480379346a8a8ce750fb9c5d1eeef1f3eda405b0f1f2f83043b5','uncensored','2026-11-19 14:18:01'),(38,'20261119103020177',8,8,'red','0','00000000040b4803420b6249a12799cf72f3acc6948a1e5c53c4f4cc6090a38b','uncensored','2026-11-19 14:21:01'),(39,'20261119103020178',7,7,'green','0','00000000040b4803f2c24a8c8f70fc76857658b4b38006cd4c8fca93cdb60ec7','uncensored','2026-11-19 14:24:00'),(40,'20261119103020179',3,3,'green','0','00000000040b4803a940e6a790295299ea8eeb203a4134612bd89bf9e9125cb3','uncensored','2026-11-19 14:27:01'),(41,'20261119103020180',1,1,'green','0','00000000040b48031a7239b4e8d3fddac1318416f996844958b88629e07ae81f','uncensored','2026-11-19 14:33:00'),(42,'20261119103020182',1,1,'green','0','00000000040b4803c760e8a2b6e93cd6a77f2367fa276e4e8e972aaa2db719c1','uncensored','2026-11-19 14:36:01'),(43,'20261119103020183',6,6,'red','0','00000000040b4803bdaaec5b26e69fc1e3d55f44b6cc467db5e1479f2959b96c','uncensored','2026-11-19 14:39:01'),(44,'20261119103020184',1,1,'green','0','00000000040b4803823536a169d05cc7643ce6ef7534799149c549e374fb02e1','uncensored','2026-11-19 14:42:01'),(45,'20261119103020185',9,9,'green','0','00000000040b480383307c4dcca5cedf1a01aeed7ea8118c76d78f67990af329','uncensored','2026-11-19 14:45:01'),(46,'20261119103020186',4,4,'red','0','00000000040b480331650573ce8c1f6f26acd21724d7fe33e160940522b5bb64','uncensored','2026-11-19 14:48:00'),(47,'20261119103020187',0,0,'red,violet','0','00000000040b4803b3059cb2c83a333f3738b05ffbec93e3dad4e8813585b240','uncensored','2026-11-19 14:51:00'),(48,'20261119103020188',0,0,'red,violet','0','00000000040b48035f534124fd360064639a7d0783e15bb29e51936d3339060d','uncensored','2026-11-19 14:54:00'),(49,'20261119103020189',9,9,'green','0','00000000040b48032c755c9ffc78c86f4df5c5345a9ce935f54cc5e3ce6f7c59','uncensored','2026-11-19 14:57:01'),(50,'20261119103020190',8,8,'red','88135510','000000000540d7563d78f890a12fea4c1a2b6dde7efa0f34c611f178c8acedc8','uncensored','2026-11-19 14:59:57'),(51,'20261119103020191',1,1,'green','0','00000000040b480393da19b5e0b22ac7ec46015a43ed202958edbee4e426611f','uncensored','2026-11-19 15:03:01'),(52,'20261119103020192',2,2,'red','88135630','000000000540d7ce09154e701a6ccfbc6fc7b5f3ec4a0850053023eadfbec2ac','uncensored','2026-11-19 15:05:57'),(53,'20261119103020193',5,5,'green,violet','0','00000000040b48036fcb32fb80b5f53958043d6c57ea20b424692f2b1cc696e5','uncensored','2026-11-19 15:09:01'),(54,'20261119103020194',5,5,'green,violet','0','00000000040b480314aa91bc1bf563cdeac9e89a8bb6e2fc07c0d023961e5cfd','uncensored','2026-11-19 15:12:01'),(55,'20261119103020195',7,7,'green','0','00000000040b48034346fcf0aee7288221ac3bddd79d9ecbd4ddafeac872427a','uncensored','2026-11-19 15:15:01'),(56,'20261119103020196',9,9,'green','0','00000000040b4803c0378cb4502ec7d625aca9d2e9bda2d8781b397d805b1a9a','uncensored','2026-11-19 15:18:01'),(57,'20261119103020197',1,1,'green','0','00000000040b4803f2b73add0c3f98e2c97e43be39e37e3b805119a6b21f61ca','uncensored','2026-11-19 15:21:01'),(58,'20261119103020198',3,3,'green','0','00000000040b4803cd946503080ac3c72415edf0874cea4a47dd293746e9ded3','uncensored','2026-11-19 15:24:01'),(59,'20261119103020199',1,1,'green','0','00000000040b4803809e1c4aba506dc58a6b4c02b8db7bc3226aadd95381baa1','uncensored','2026-11-19 15:27:01'),(60,'20261119103020200',6,6,'red','0','00000000040b480319dcfd036a24cad2eff14d1610d6390d4f18ddb411f16e6e','uncensored','2026-11-19 15:30:01'),(61,'20261119103020201',1,1,'green','0','00000000040b48035f38ce9ee871ec13c6afce6da98864a8ef245f62195e8681','uncensored','2026-11-19 15:33:00'),(62,'20261119103020202',9,9,'green','0','00000000040b480352bd2828d3dace56dc9d6e7170fc620ef2ff745bad9f2b9c','uncensored','2026-11-19 17:45:45'),(63,'20261119103020246',0,0,'red,violet','0','00000000040b480387db613f06b13dd30b9932b56a5854cb329c73947354300a','uncensored','2026-11-19 17:48:03'),(64,'20261119103020247',1,1,'green','0','00000000040b4803970903911d682d1509ab4f09afb90fb999091b15f57b9401','uncensored','2026-11-19 17:48:49'),(65,'20261119103020248',4,4,'red','0','00000000040b48034b7f8f6511e49ab37bece4ad19d06a38161edf4bd1220e4e','uncensored','2026-11-19 17:51:07'),(66,'20261119103020249',1,1,'green','0','00000000040b480377b01a1c089703d91f6ad9408f1392cd2050ad39ce67b431','uncensored','2026-11-19 17:51:53'),(67,'20261119103020250',3,3,'green','0','00000000040b4803ebfc2dfae962dec557d610a3962803f46c01d316925a5dd3','uncensored','2026-11-19 17:54:10'),(68,'20261119103020251',9,9,'green','0','00000000040b4803b20fb031b3d472daa4f133857b1ac55409f6a6db7c1317c9','uncensored','2026-11-19 17:54:56'),(69,'20261119103020252',7,7,'green','0','00000000040b480336714d45003fce18dff85675810109ecd939dd7606b3b27e','uncensored','2026-11-19 17:57:13'),(70,'20261119103020253',6,6,'red','0','00000000040b480301e373dd3c0397b7daa6ac558b5fe98145930199bf9906cd','uncensored','2026-11-19 17:57:59'),(71,'20261119103020254',5,5,'green,violet','0','00000000040b4803e1e54a7f2108da641f1291b496ad0482ae35a9359552f5ae','uncensored','2026-11-19 18:00:17'),(72,'20261119103020255',0,0,'red,violet','0','00000000040b4803bf669ebbb5833e69840e873bc9524e1723026d958497960d','uncensored','2026-11-19 18:03:19'),(73,'20261119103020256',7,7,'green','0','00000000040b48033bfc7ec235536427efd15267fedbb3864b35bf7364808257','uncensored','2026-11-19 18:06:22'),(74,'20261119103020257',2,2,'red','0','00000000040b4803947aa56b1b99ad88da5bf9d17a6ff7257f95e0d78b3d97f2','uncensored','2026-11-19 18:09:25'),(75,'20261119103020258',0,0,'red,violet','0','00000000040b4803252ff73e5c183620341c25953eabf63776e095997de3250e','uncensored','2026-11-19 18:12:29'),(76,'20261119103020259',3,3,'green','0','00000000040b48037519a3a11869ae32cfdc99f17bd280a37554cc3d9b0b53ba','uncensored','2026-11-19 18:15:32'),(77,'20261119103020260',2,2,'red','0','00000000040b4803839eb3600474e09605f1bcbf5d89953434e028f95e92a02f','uncensored','2026-11-19 18:18:35'),(78,'20261119103020261',8,8,'red','0','00000000040b4803bcc5e5f55f36a835d7cf40b77b266d6b7962551170e2c7d8','uncensored','2026-11-19 18:21:39'),(79,'20261119103020262',7,7,'green','0','00000000040b4803deac80839e500c9c5d9827c2fb4f35ffbaf4076e4736d377','uncensored','2026-11-19 18:24:42'),(80,'20261119103020263',5,5,'green,violet','0','00000000040b480364cc31739bb5a39f38e66e5d363337b33d985c820685aa45','uncensored','2026-11-19 18:27:46'),(81,'20261119103020264',6,6,'red','0','00000000040b48033690797edd2bd3bd9a0e7647267df0bdf013d77ccbff2df6','uncensored','2026-11-19 18:30:03'),(82,'20261119103020265',0,0,'red,violet','0','00000000040b4803956c6552d66a1bd7d9a6079272a6a5dee0e78570968cd220','uncensored','2026-11-19 18:30:48'),(83,'20261119103020266',6,6,'red','0','00000000040b4803ecd32a7b6b7a47f04f9fe506913140704a0018af45ca97e6','uncensored','2026-11-19 18:33:05'),(84,'20261119103020267',5,5,'green,violet','0','00000000040b480313b6a6cbd470a96b6c68f122f9d34e12a256b9e465693ae5','uncensored','2026-11-19 18:33:51'),(85,'20261119103020268',7,7,'green','0','00000000040b4803560a2007d5104bd2c47076a731156d5edcde41963f471e77','uncensored','2026-11-19 18:36:09'),(86,'20261119103020269',3,3,'green','0','00000000040b4803b3e0d22711ff07700e94c129743e051c9a3e67b8895528d3','uncensored','2026-11-19 18:36:55'),(87,'20261119103020270',1,1,'green','0','00000000040b480368f721010539c738a508b1876e0d8bebb74881dbddfa961e','uncensored','2026-11-19 18:39:12'),(88,'20261119103020271',8,8,'red','0','00000000040b4803cbeae9a2948c02f25b8a6e2442408afa766df77a6d8fdfcc','uncensored','2026-11-19 18:39:58'),(89,'20261119103020272',6,6,'red','0','00000000040b480328197ab84d3e65a0fc3a4a487caf75c1f79f93253f396d6c','uncensored','2026-11-19 18:42:15'),(90,'20261119103020273',4,4,'red','0','00000000040b4803162d5a7eca49982508cb27da6ed9009ca849dc5899bd9694','uncensored','2026-11-19 18:45:18'),(91,'20261119103020274',0,0,'red,violet','0','00000000040b4803702f317c610b83ef35806e0ec99ac660f1550eea02d208d0','uncensored','2026-11-19 18:48:22'),(92,'20261119103020275',3,3,'green','0','00000000040b4803b4e8108035e1304d694cf67d7c0f826aff23ed705408e43e','uncensored','2026-11-19 18:51:25'),(93,'20261119103020276',3,3,'green','0','00000000040b48036047309e81931505245c199df012225fb9784a0161bb9b53','uncensored','2026-11-19 18:54:28'),(94,'20261119103020277',0,0,'red,violet','88140259','000000000540e9e388af1c0b1714eb9a5eeb5c3d039ded7055dc23e56cee10be','uncensored','2026-11-19 18:57:30'),(95,'20261119103020278',4,4,'red','0','00000000040b480334c147b417d9045a952ff503cb4378959d4d59967ce09314','uncensored','2026-11-19 19:00:34'),(96,'20261119103020279',1,1,'green','0','00000000040b4803edecb8ce9763e39368db54b84f6b1a5d5683ef8843e21ddf','uncensored','2026-11-19 19:03:37');
/*!40000 ALTER TABLE `trx_wingo_results_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trx_wingo_results_5min`
--

DROP TABLE IF EXISTS `trx_wingo_results_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_wingo_results_5min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `bh` varchar(255) NOT NULL DEFAULT 'wait',
  `hash` varchar(255) NOT NULL DEFAULT 'wait',
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COMMENT='TRX WinGo 5-min: published results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trx_wingo_results_5min`
--

LOCK TABLES `trx_wingo_results_5min` WRITE;
/*!40000 ALTER TABLE `trx_wingo_results_5min` DISABLE KEYS */;
INSERT INTO `trx_wingo_results_5min` VALUES (2,'20261119103030088',0,0,'red,violet','88132910','000000000540cd2ec5d248f68e021dff8b02a043875438c16b1128429dd53e0e','uncensored','2026-11-19 12:49:57'),(3,'20261119103030089',9,9,'green','0','00000000040b4803ed17b0f6f280acaf84653d0e9a24ea75a58488b2786b3cd9','uncensored','2026-11-19 12:55:00'),(4,'20261119103030090',5,5,'green,violet','0','00000000040b4803ec1e115619fe47e1e28c714337c72196266fed4d8886465e','uncensored','2026-11-19 13:00:01'),(5,'20261119103030091',8,8,'red','0','00000000040b4803c577f6ecdf6de6adfc067e081e53f423c0fe64f2d39e878d','uncensored','2026-11-19 13:05:01'),(6,'20261119103030092',4,4,'red','88133310','000000000540cebed5b2ac94ce0f0514e21de6188769ad2006ad9322de2d6184','uncensored','2026-11-19 13:09:57'),(7,'20261119103030093',1,1,'green','0','00000000040b4803a7d7b3c33c71b2053e5c9d12310b8330687a442ff4b893f1','uncensored','2026-11-19 13:15:01'),(8,'20261119103030094',1,1,'green','0','00000000040b4803a925cf3c0237c657165708cee49434f35a4c7ddd1a43ea81','uncensored','2026-11-19 13:20:01'),(9,'20261119103030095',4,4,'red','0','00000000040b4803105a6366a96d3117c68644bf7c86ee4c16bf61a2ddfa2744','uncensored','2026-11-19 13:25:01'),(10,'20261119103030096',7,7,'green','0','00000000040b4803a8169f5d364db88cee0a8aaab50b935773d2590cf778b457','uncensored','2026-11-19 13:30:01'),(11,'20261119103030097',1,1,'green','0','00000000040b4803403ccba5b397111b18230cabc72aee42dacf71127eb1c21e','uncensored','2026-11-19 13:35:00'),(12,'20261119103030098',4,4,'red','0','00000000040b48035fe5bf4e60e2c30b18dc50f58048f674b5c4f6c3d15ee44a','uncensored','2026-11-19 13:40:01'),(13,'20261119103030099',3,3,'green','0','00000000040b4803dddeec8498b8f74bf18a4f54a2bc883cfbddc86a09e6fab3','uncensored','2026-11-19 13:45:01'),(14,'20261119103030100',4,4,'red','0','00000000040b4803cfe4457f44a2826a175dc67f4295b5938b9f452d7a5d0034','uncensored','2026-11-19 13:50:01'),(15,'20261119103030101',9,9,'green','0','00000000040b4803e70777758522c7ecc0d3ac7556421adf278d00fa57107a9d','uncensored','2026-11-19 13:55:01'),(16,'20261119103030102',9,9,'green','0','00000000040b4803cd4eff8b038892c921fbd067b274db305539c25f4cbad3c9','uncensored','2026-11-19 14:00:02'),(17,'20261119103030103',9,9,'green','0','00000000040b480395ddc3f3fedeae08aa6cdb29f199c8c72f0893442e9049bc','uncensored','2026-11-19 14:05:00'),(18,'20261119103030104',5,5,'green,violet','0','00000000040b480307ee63e4bcf3e60eb091b528310412e4bfe4da108dc575db','uncensored','2026-11-19 14:10:00'),(19,'20261119103030105',0,0,'red,violet','0','00000000040b4803404947a4f15846c09093f24acf437c9ae74786cd54f0c0b0','uncensored','2026-11-19 14:15:01'),(20,'20261119103030106',6,6,'red','0','00000000040b48031e586480426edeb10046f7515ad05abfb9c3ebe6e28606cf','uncensored','2026-11-19 14:20:01'),(21,'20261119103030107',7,7,'green','0','00000000040b48037af92cda035b88176443757683fd9620e30bc62ae3e21997','uncensored','2026-11-19 14:25:01'),(22,'20261119103030108',7,7,'green','88135008','000000000540d560f4a24dda545aaa95ad620a9b4aa7bcba0668c81c0c942d57','uncensored','2026-11-19 14:34:51'),(23,'20261119103030110',7,7,'green','0','00000000040b48038ef4a668ff0e37f9d6d992d2437c067445b0acc667f0057e','uncensored','2026-11-19 14:40:00'),(24,'20261119103030111',0,0,'red,violet','0','00000000040b48037ee2363bea70a998cfeb39a4465579ad2e67112c2cff120e','uncensored','2026-11-19 14:45:01'),(25,'20261119103030112',3,3,'green','0','00000000040b48037401b0a300e01288b5b69d9519f5e26cb4a3f5ac4d822a3d','uncensored','2026-11-19 14:50:00'),(26,'20261119103030113',6,6,'red','0','00000000040b4803223c5b51a53edf221d1839caa2c4739f268e53ccb69a376d','uncensored','2026-11-19 14:55:01'),(27,'20261119103030114',0,0,'red,violet','0','00000000040b480346832975fc1ce80ac57a4bf53645982cc2c42306187570de','uncensored','2026-11-19 15:00:01'),(28,'20261119103030115',3,3,'green','0','00000000040b48032dd03b55507714c1477dadb066bef301ed9b75a3bfa45643','uncensored','2026-11-19 15:05:01'),(29,'20261119103030116',4,4,'red','0','00000000040b480345f9fa3ab7b32f08cf0d2fdee613744aaf87e8e0ff72d34e','uncensored','2026-11-19 15:10:00'),(30,'20261119103030117',9,9,'green','0','00000000040b48034ef18046b6596830bdc4b557a2f8babd0fa627676619badf','uncensored','2026-11-19 15:15:01'),(31,'20261119103030118',8,8,'red','0','00000000040b4803d5f1bc767dfb65b4ad85487041f1151997fa6b094ee1d8b8','uncensored','2026-11-19 15:20:01'),(32,'20261119103030119',3,3,'green','0','00000000040b48037135837c861a5c22c46a7c31878a7c9cee57ad1275352e73','uncensored','2026-11-19 15:25:01'),(33,'20261119103030120',5,5,'green,violet','0','00000000040b4803259683cd2895eecdaeba213ca326fa823b7d0c89d6078155','uncensored','2026-11-19 15:30:02'),(34,'20261119103030121',8,8,'red','88136210','000000000540da12e035129aedeeff9de978e8f8e4bd065db4b4e978a0ef1158','uncensored','2026-11-19 15:34:57'),(35,'20261119103030122',4,4,'red','0','00000000040b48036a73561d2053f19e9d2d17fed1fd4bff1f669b210e194194','uncensored','2026-11-19 15:35:21'),(36,'20261119103030123',8,8,'red','0','00000000040b4803d01079863c8eaa5c761220561b3e6f4bb18ade13947e8ced','uncensored','2026-11-19 15:35:49'),(37,'20261119103030124',8,8,'red','0','00000000040b48031c52bcacf88cf778adb52397b9fafb4a4392ff32a3eff828','uncensored','2026-11-19 17:45:46'),(38,'20261119103030148',2,2,'red','0','00000000040b4803fc246924a22ff430814413b5407cf210d7e62464a4eee662','uncensored','2026-11-19 17:50:21'),(39,'20261119103030149',7,7,'green','0','00000000040b48034804fd764c0607f1e6e7e400534244fbcdb2696186bfd627','uncensored','2026-11-19 17:55:42'),(40,'20261119103030150',4,4,'red','0','00000000040b4803c32be1a5f232f01ad3df1a04bad7eac3260de4e0f69764fb','uncensored','2026-11-19 18:00:17'),(41,'20261119103030151',3,3,'green','0','00000000040b48036169653ff49a3f0638b0d87b922a9734437627e4bb67763a','uncensored','2026-11-19 18:05:36'),(42,'20261119103030152',4,4,'red','0','00000000040b480379abe4f8663709679d84595d9405166d0c3ba7f57caf43c4','uncensored','2026-11-19 18:10:11'),(43,'20261119103030153',2,2,'red','0','00000000040b4803678cab91830e992e42c2277466050693697c95847edac4f2','uncensored','2026-11-19 18:10:57'),(44,'20261119103030154',9,9,'green','0','00000000040b48032f49e80edd65ec31821399f7e6eca6c3f72c9b3fe8b28789','uncensored','2026-11-19 18:15:32'),(45,'20261119103030155',8,8,'red','0','00000000040b48039b46c3e9d8dc8449acb2016adaafe1d93ea2530e4e1de538','uncensored','2026-11-19 18:20:07'),(46,'20261119103030156',5,5,'green,violet','0','00000000040b4803e0a35575ab52e337feb8c244435814aa9a54895d4a554f5c','uncensored','2026-11-19 18:20:53'),(47,'20261119103030157',8,8,'red','0','00000000040b48035abf0edf02b6cb0956e2fa881fdb63a598316e8e65d4e748','uncensored','2026-11-19 18:25:28'),(48,'20261119103030158',6,6,'red','0','00000000040b48031caac98b7a8edb1b19eb16cce7eaef4d239087a19d6becfe','uncensored','2026-11-19 18:30:03'),(49,'20261119103030159',1,1,'green','0','00000000040b4803c3bf2aa92d4210964f3bdcdf9544b49b34f9b581afe8311d','uncensored','2026-11-19 18:30:49'),(50,'20261119103030160',7,7,'green','0','00000000040b4803f164ba4fae8e4c7c07d29e8591f911b5e06c5be834910197','uncensored','2026-11-19 18:35:23'),(51,'20261119103030161',5,5,'green,violet','0','00000000040b48032bc58e0ffc05b17b96392f9dcda17585b5975a68097fd5bb','uncensored','2026-11-19 18:40:44'),(52,'20261119103030162',4,4,'red','0','00000000040b4803cd22f3368fec0f3739dde0702a5142fcaf937eb8aa6db4bd','uncensored','2026-11-19 18:45:19'),(53,'20261119103030163',4,4,'red','0','00000000040b48037bf001328a9d4ca4efeff00254cabe785b72f80879b363d4','uncensored','2026-11-19 18:50:39'),(54,'20261119103030164',1,1,'green','0','00000000040b48037ecd9eabb4fad7110639818869b21bcd979fd7952071bdc1','uncensored','2026-11-19 18:55:14'),(55,'20261119103030165',6,6,'red','0','00000000040b48037a3ba99dc3d75e8f65fb6ba61067ab96321342294e4c96c6','uncensored','2026-11-19 18:56:02'),(56,'20261119103030166',7,7,'green','0','00000000040b48031446a1be6d6f28345268334cfea91b4e045e4e2f7e7fad57','uncensored','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `trx_wingo_results_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upi_payment_addresses`
--

DROP TABLE IF EXISTS `upi_payment_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upi_payment_addresses` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `maulya` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Admin-managed UPI IDs shown on deposit page (active flag)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upi_payment_addresses`
--

LOCK TABLES `upi_payment_addresses` WRITE;
/*!40000 ALTER TABLE `upi_payment_addresses` DISABLE KEYS */;
INSERT INTO `upi_payment_addresses` VALUES (1,'paytm.slay6s3@pty',0),(2,'mann335512@axl',0),(3,'',0),(4,'',0),(5,'jjagdishkumarsolanki97@ibl',1),(6,'',0);
/*!40000 ALTER TABLE `upi_payment_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upi_qr_images`
--

DROP TABLE IF EXISTS `upi_qr_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upi_qr_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(300) NOT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='Active UPI QR-code image filenames for the deposit page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upi_qr_images`
--

LOCK TABLES `upi_qr_images` WRITE;
/*!40000 ALTER TABLE `upi_qr_images` DISABLE KEYS */;
INSERT INTO `upi_qr_images` VALUES (17,'IMG-20250214-WA0002~2.jpg',0,'0000-00-00 00:00:00'),(18,'Screenshot_20261027_181234.jpg',1,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `upi_qr_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usdt_qr_images`
--

DROP TABLE IF EXISTS `usdt_qr_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usdt_qr_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(300) NOT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='Active USDT QR-code image filenames for the deposit page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usdt_qr_images`
--

LOCK TABLES `usdt_qr_images` WRITE;
/*!40000 ALTER TABLE `usdt_qr_images` DISABLE KEYS */;
INSERT INTO `usdt_qr_images` VALUES (23,'IMG-20241004-WA0005.jpg',1,'2024-10-04 16:49:31'),(24,'usdtbg.jpg',1,'2024-10-04 17:01:20');
/*!40000 ALTER TABLE `usdt_qr_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usdt_wallet_addresses`
--

DROP TABLE IF EXISTS `usdt_wallet_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usdt_wallet_addresses` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `maulya` varchar(300) NOT NULL,
  `sthiti` smallint NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Admin-managed TRC20/USDT wallet addresses for deposits';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usdt_wallet_addresses`
--

LOCK TABLES `usdt_wallet_addresses` WRITE;
/*!40000 ALTER TABLE `usdt_wallet_addresses` DISABLE KEYS */;
INSERT INTO `usdt_wallet_addresses` VALUES (13,'TP797gFnzpsTQNGH7QDo8c2bRsbQ4pKeaq',1),(14,'TYxE4dDBNynbNXktuTd8XqJiCwbiVVfXxA',1);
/*!40000 ALTER TABLE `usdt_wallet_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bankcards`
--

DROP TABLE IF EXISTS `user_bankcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bankcards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `account` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`account`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='User bank-card list (legacy wallet API + user views)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bankcards`
--

LOCK TABLES `user_bankcards` WRITE;
/*!40000 ALTER TABLE `user_bankcards` DISABLE KEYS */;
INSERT INTO `user_bankcards` VALUES (1,14,'1234567890','TEST USER',1,'2026-11-19 14:13:55'),(2,15,'1234567890','TEST USER',1,'2026-11-19 14:14:08');
/*!40000 ALTER TABLE `user_bankcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Per-user notification messages (payment callbacks, announcements)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES (2,3,'Login Notification',0,'2026-11-19 12:28:29'),(3,4,'Login Notification',0,'2026-11-19 12:28:29'),(4,3,'Login Notification',0,'2026-11-19 12:29:30'),(5,4,'Login Notification',0,'2026-11-19 12:29:30'),(6,3,'Login Notification',0,'2026-11-19 12:30:05'),(7,5,'Login Notification',0,'2026-11-19 12:30:05'),(8,3,'Login Notification',0,'2026-11-19 12:30:28'),(9,7,'Login Notification',0,'2026-11-19 12:30:28'),(10,3,'Login Notification',0,'2026-11-19 12:31:07'),(11,9,'Login Notification',0,'2026-11-19 12:31:08'),(12,3,'Login Notification',0,'2026-11-19 12:33:08'),(13,3,'Login Notification',0,'2026-11-19 12:34:23'),(14,3,'Login Notification',0,'2026-11-19 12:34:55'),(15,3,'Login Notification',0,'2026-11-19 12:38:12'),(16,3,'Login Notification',0,'2026-11-19 12:43:03'),(17,3,'Login Notification',0,'2026-11-19 12:45:33'),(18,3,'Login Notification',0,'2026-11-19 12:58:29'),(19,10,'Login Notification',0,'2026-11-19 12:58:29'),(20,11,'Login Notification',0,'2026-11-19 13:03:41'),(21,3,'Login Notification',0,'2026-11-19 13:05:25'),(22,12,'Login Notification',0,'2026-11-19 13:05:25'),(23,3,'Login Notification',0,'2026-11-19 13:13:16'),(34,3,'Login Notification',0,'2026-11-19 14:22:18'),(35,3,'Support Chat',0,'2026-11-19 14:22:49'),(36,3,'Support Chat',0,'2026-11-19 14:22:54'),(37,3,'Login Notification',0,'2026-11-19 14:23:22'),(38,3,'Login Notification',0,'2026-11-19 14:24:10'),(39,3,'Support Chat',0,'2026-11-19 14:26:40'),(46,3,'Login Notification',0,'2026-11-19 15:34:59'),(47,24,'Login Notification',0,'2026-11-19 15:34:59'),(48,3,'Login Notification',0,'2026-11-19 15:35:03'),(49,11,'Login Notification',0,'2026-11-19 15:35:11'),(50,3,'Login Notification',0,'2026-11-19 15:35:21'),(51,3,'Login Notification',0,'2026-11-19 15:35:48'),(55,3,'Login Notification',0,'2026-11-19 15:36:34'),(56,3,'Login Notification',0,'2026-11-19 15:36:50'),(57,28,'Login Notification',0,'2026-11-19 15:36:50'),(58,3,'Login Notification',0,'2026-11-19 15:36:50'),(59,3,'Login Notification',0,'2026-11-19 15:38:14'),(60,29,'Login Notification',0,'2026-11-19 17:50:29'),(61,29,'Login Notification',0,'2026-11-19 18:10:01'),(62,29,'Login Notification',0,'2026-11-19 18:16:17'),(63,29,'Login Notification',0,'2026-11-19 18:26:13'),(65,29,'Login Notification',0,'2026-11-19 18:27:10'),(66,29,'Login Notification',0,'2026-11-19 18:44:43'),(67,30,'Login Notification',0,'2026-11-19 18:44:43'),(68,29,'Recharge Arrival',0,'2026-11-19 18:44:43'),(69,30,'Recharge Arrival',0,'2026-11-19 18:44:43'),(70,29,'Login Notification',0,'2026-11-19 18:45:20'),(71,31,'Login Notification',0,'2026-11-19 18:45:20'),(72,29,'Recharge Arrival',0,'2026-11-19 18:45:20'),(73,31,'Recharge Arrival',0,'2026-11-19 18:45:20'),(74,29,'Login Notification',0,'2026-11-19 18:45:28'),(75,29,'Login Notification',0,'2026-11-19 18:45:39'),(76,29,'Login Notification',0,'2026-11-19 18:47:14'),(77,32,'Login Notification',0,'2026-11-19 18:47:14'),(78,29,'Recharge Arrival',0,'2026-11-19 18:47:14'),(79,32,'Recharge Arrival',0,'2026-11-19 18:47:14'),(80,29,'Login Notification',0,'2026-11-19 18:49:37'),(81,33,'Login Notification',0,'2026-11-19 18:49:37'),(82,29,'Recharge Arrival',0,'2026-11-19 18:49:37'),(83,33,'Recharge Arrival',0,'2026-11-19 18:49:37'),(84,29,'Login Notification',0,'2026-11-19 18:50:34');
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vip_levels`
--

DROP TABLE IF EXISTS `user_vip_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_vip_levels` (
  `macau` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(500) NOT NULL,
  `expe` varchar(500) NOT NULL,
  `lvl` varchar(500) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`macau`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Per-user VIP level + experience points (updated on betting)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vip_levels`
--

LOCK TABLES `user_vip_levels` WRITE;
/*!40000 ALTER TABLE `user_vip_levels` DISABLE KEYS */;
INSERT INTO `user_vip_levels` VALUES (2,'3','61','0','2026-11-19 15:35:48'),(3,'31','10','0','2026-11-19 18:45:20'),(4,'32','10','0','2026-11-19 18:47:14'),(5,'33','10','0','2026-11-19 18:49:37');
/*!40000 ALTER TABLE `user_vip_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wallets`
--

DROP TABLE IF EXISTS `user_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_wallets` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `balakedara` int NOT NULL,
  `motta` varchar(500) NOT NULL,
  `rebet` varchar(255) NOT NULL DEFAULT '0',
  `spin` int NOT NULL DEFAULT '0',
  `bonus` varchar(255) NOT NULL DEFAULT '21',
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `idx_shonu_kaichila` (`balakedara`,`motta`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COMMENT='Real-money wallet per user (balance, rebet, spin, bonus coins)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wallets`
--

LOCK TABLES `user_wallets` WRITE;
/*!40000 ALTER TABLE `user_wallets` DISABLE KEYS */;
INSERT INTO `user_wallets` VALUES (3,3,'2391.06','61',0,'33','2026-11-19 13:19:37'),(4,4,'33','0',0,'33','2026-11-19 12:28:29'),(5,5,'33','0',0,'33','2026-11-19 12:30:05'),(6,6,'33','0',0,'33','2026-11-19 12:30:15'),(7,7,'33','0',0,'33','2026-11-19 12:30:28'),(8,8,'33','0',0,'33','2026-11-19 12:30:46'),(9,9,'33','0',0,'33','2026-11-19 12:31:08'),(10,10,'33','0',0,'33','2026-11-19 12:58:29'),(11,11,'23','0',0,'33','2026-11-19 07:33:41'),(12,12,'33','0',0,'33','2026-11-19 13:05:25'),(29,28,'33','0',0,'33','2026-11-19 15:36:50'),(25,24,'33','0',0,'33','2026-11-19 15:34:59'),(28,27,'33','0',0,'33','2026-11-19 15:36:34'),(30,29,'2333','0',0,'33','2026-11-19 13:30:31'),(31,30,'233','0',0,'33','2026-11-19 13:14:43'),(32,31,'223','10',0,'33','2026-11-19 13:15:20'),(33,32,'223','10',0,'33','2026-11-19 13:17:14'),(34,33,'103','10',0,'33','2026-11-19 13:19:37');
/*!40000 ALTER TABLE `user_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_withdraw_accounts`
--

DROP TABLE IF EXISTS `user_withdraw_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_withdraw_accounts` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `khatesankhye` varchar(200) NOT NULL,
  `khatakrama` int NOT NULL,
  `phalanubhavi` varchar(200) NOT NULL,
  `kodprakara` int NOT NULL,
  `daka` varchar(200) NOT NULL,
  `kod` varchar(200) NOT NULL,
  `khatehesaru` varchar(200) NOT NULL,
  `duravani` varchar(200) NOT NULL,
  `sthiti` int NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='User payout accounts for withdrawals (bank/UPI/USDT details)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_withdraw_accounts`
--

LOCK TABLES `user_withdraw_accounts` WRITE;
/*!40000 ALTER TABLE `user_withdraw_accounts` DISABLE KEYS */;
INSERT INTO `user_withdraw_accounts` VALUES (2,32,'23952015081',6,'Test User',1,'test@test.com','HDFC0001234','','9990069609',1),(3,33,'85588952584',6,'Test User',1,'test@test.com','HDFC0001234','','9990052785',1);
/*!40000 ALTER TABLE `user_withdraw_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(300) NOT NULL,
  `code` varchar(255) NOT NULL,
  `code1` varchar(255) DEFAULT NULL,
  `code2` varchar(255) DEFAULT NULL,
  `code3` varchar(255) DEFAULT NULL,
  `code4` varchar(255) DEFAULT NULL,
  `code5` varchar(255) DEFAULT NULL,
  `owncode` varchar(255) NOT NULL,
  `privacy` varchar(50) NOT NULL,
  `status` smallint NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL,
  `ishonup` varchar(255) DEFAULT NULL,
  `pwd` varchar(300) DEFAULT NULL,
  `shonullgnt` varchar(255) DEFAULT NULL,
  `shonupwderr` int NOT NULL DEFAULT '0',
  `akshinak` varchar(25500) DEFAULT NULL,
  `tnegaresunohs` varchar(255) DEFAULT NULL,
  `codechorkamukala` varchar(255) DEFAULT NULL,
  `kramasankhye` int NOT NULL,
  `balakedara` int NOT NULL,
  `motta` int NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_prta` (`id`,`mobile`,`owncode`,`createdate`),
  KEY `idx_prtb` (`code`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COMMENT='Main user accounts: mobile/email/password/referral code/status/login attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'9000000001','','181609b02b28507502a3afeb2a802525','',NULL,NULL,NULL,NULL,NULL,'SEED01','on',1,'2026-11-19 06:56:50',NULL,'127.0.0.1',NULL,'2026-11-19 15:38:14',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMiLCJtb2JpbGUiOiI5MDAwMDAwMDAxIiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE2OTI5NCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJST09UMDAxIn0.Uib8ydtxWvlSGKhZYWMmnHfgMw0gkuvB1uRGJNF7kr8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/158.0.0.0 Safari/537.36','MemberROOT001',0,0,0,'2026-11-19 06:56:50'),(4,'9000000002','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','785051000004','on',1,'2026-11-19 12:28:29','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:29:30',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQiLCJtb2JpbGUiOiI5MDAwMDAwMDAyIiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1Nzk3MCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJRMVMzTVlMQSJ9.FPlFdmC4uVD7GEtK-oYaRnU3_gd7cQF9mLg8p7RXLw4','','MemberQ1S3MYLA',0,0,0,'2026-11-19 06:58:29'),(5,'9000012526','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','030858000005','on',1,'2026-11-19 12:30:05','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:05',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjUiLCJtb2JpbGUiOiI5MDAwMDEyNTI2Iiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1ODAwNSwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJDUjlTQTZKTyJ9.XJx2nhGW_wEWUdPBWKywl7CGqUyvhigXkCb-msyYU74','','MemberCR9SA6JO',0,0,0,'2026-11-19 07:00:05'),(6,'9000028510','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','138097000006','on',1,'2026-11-19 12:30:15','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:15',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwibW9iaWxlIjoiOTAwMDAyODUxMCIsInN0YXR1cyI6MSwiZXhwaXJlIjoxNzk1MTU4MDE1LCJpc2hvbnVwIjoiMTI3LjAuMC4xIiwiY29kZWNob3JrYW11a2FsYSI6Ik1lbWJlckNSTjg2QUVNIn0.QhWIWjVEqyOQK6iQGAO9LbGoUWIFZ4hHxDt4ehFlVps','curl/8.14.1','MemberCRN86AEM',0,0,0,'2026-11-19 07:00:15'),(7,'9000019265','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','157320000007','on',1,'2026-11-19 12:30:28','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:28',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjciLCJtb2JpbGUiOiI5MDAwMDE5MjY1Iiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1ODAyOCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJEQ0ozS0xHNSJ9.lr4P7bOhI82f1bUsZW21P2kmg3JPCVXTh2dY5Y5Hdto','','MemberDCJ3KLG5',0,0,0,'2026-11-19 07:00:28'),(8,'9000013128','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','297529000008','on',1,'2026-11-19 12:30:46','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:30:46',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwibW9iaWxlIjoiOTAwMDAxMzEyOCIsInN0YXR1cyI6MSwiZXhwaXJlIjoxNzk1MTU4MDQ2LCJpc2hvbnVwIjoiMTI3LjAuMC4xIiwiY29kZWNob3JrYW11a2FsYSI6Ik1lbWJlcjdYRllIQzFFIn0.uwwaJIsOqQEPWlwrzstlAnErmR8aUeWA7U2PjDRLFtU','','Member7XFYHC1E',0,0,0,'2026-11-19 07:00:46'),(9,'9000011654','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','743733000009','on',1,'2026-11-19 12:31:08','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:31:08',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkiLCJtb2JpbGUiOiI5MDAwMDExNjU0Iiwic3RhdHVzIjoiMSIsImV4cGlyZSI6MTc5NTE1ODA2OCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJUTFc2MElWTiJ9.Ac8mUIPFHkASCBWfRLTOiiVce12tfILHFOLzrDudwMA','','MemberTLW60IVN',0,0,0,'2026-11-19 07:01:08'),(10,'9000015143','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','436138000010','on',1,'2026-11-19 12:58:29','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 12:58:29',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwIiwibW9iaWxlIjoiOTAwMDAxNTE0MyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNTk3MDksImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyMkNCRFM3WlkifQ.l0tuVhAgYH4qyZOfMg2mBfioddmLIbu9Gg0Ic-z_aHo','','Member2CBDS7ZY',0,0,0,'2026-11-19 07:28:29'),(11,'9000000007','','d431c238300ff37beb433ce7e1ba8ebb','SEED01','','','','','','100416000011','on',1,'2026-11-19 12:58:37','127.0.0.1','127.0.0.1','User2026x','2026-11-19 15:35:11',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjExIiwibW9iaWxlIjoiOTAwMDAwMDAwNyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjkxMTEsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyMVRVWEdMN1kifQ.jcxHC1ZufA-j403pRteiHb6Xm07stizTSis9XyRcsaw','','Member1TUXGL7Y',0,0,0,'2026-11-19 07:28:37'),(12,'9000010086','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','014944000012','on',1,'2026-11-19 13:05:25','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 13:05:25',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEyIiwibW9iaWxlIjoiOTAwMDAxMDA4NiIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjAxMjUsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyTzJNRzZVVEQifQ.Wsnj_heiB6rV-i6wbhWEZYuckQKgZgXMnfQ4u24Opb0','','MemberO2MG6UTD',0,0,0,'2026-11-19 07:35:25'),(24,'9000015627','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','106182000013','on',1,'2026-11-19 15:34:59','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 15:34:59',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjI0IiwibW9iaWxlIjoiOTAwMDAxNTYyNyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjkwOTksImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyNjhXTUNSR1MifQ.benyvkz2TO85UCeYTMHbqv07oqvnTSU7wGI6byaS-ZY','','Member68WMCRGS',0,0,0,'2026-11-19 10:04:59'),(28,'9000014538','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','855092000028','on',1,'2026-11-19 15:36:50','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 15:36:50',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjI4IiwibW9iaWxlIjoiOTAwMDAxNDUzOCIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxNjkyMTAsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyMEhDRE02S1MifQ.TZxnBz_hBiAsFzZKcHfU6yqSyn2KBoQtXv2Lj-_k1ZE','','Member0HCDM6KS',0,0,0,'2026-11-19 10:06:50'),(27,'9000013497','','52b19d638e8eb9872e3c147af9fb0eb8','SEED01','','','','','','508190000025','on',1,'2026-11-19 15:36:34','127.0.0.1','127.0.0.1','Test@2026','2026-11-19 15:36:34',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsIm1vYmlsZSI6IjkwMDAwMTM0OTciLCJzdGF0dXMiOjEsImV4cGlyZSI6MTc5NTE2OTE5NCwiaXNob251cCI6IjEyNy4wLjAuMSIsImNvZGVjaG9ya2FtdWthbGEiOiJNZW1iZXJMQ1oyRjFHTSJ9.WYM1y2DStnj1-MXdU8bVYEiqLBJ4ny6ftpGRyut2lzw','','MemberLCZ2F1GM',0,0,0,'2026-11-19 10:06:34'),(29,'9990012345','','662af1cd1976f09a9f8cecc868ccc0a2','SEED01','','','','','','379747000029','on',1,'2026-11-19 17:46:43','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:50:34',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjI5IiwibW9iaWxlIjoiOTk5MDAxMjM0NSIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA4MzQsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyWVhSNjFDSk0ifQ.eUgJ4TiIitbJNj6V4C80jaXBPi-kiignAnZP3322Hqk','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/158.0.0.0 Safari/537.36','MemberYXR61CJM',0,0,0,'2026-11-19 12:16:43'),(30,'9990063743','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','959940000030','on',1,'2026-11-19 18:44:43','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:44:43',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMwIiwibW9iaWxlIjoiOTk5MDA2Mzc0MyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA0ODMsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyWk5TSjZYN0sifQ.E8JdTDJ2Dc5Gje7u8GBPiXXIpTzMIqdxiJpupgWibAA','','MemberZNSJ6X7K',0,0,0,'2026-11-19 13:14:43'),(31,'9990042593','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','137535000031','on',1,'2026-11-19 18:45:20','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:45:20',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMxIiwibW9iaWxlIjoiOTk5MDA0MjU5MyIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA1MjAsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyTEY3WjJUVk0ifQ.etWt5tRCGXxv7xJnZPXcoRESO-e_fST37vUMDiYV-ho','','MemberLF7Z2TVM',0,0,0,'2026-11-19 13:15:20'),(32,'9990069609','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','923617000032','on',1,'2026-11-19 18:47:14','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:47:14',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMyIiwibW9iaWxlIjoiOTk5MDA2OTYwOSIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA2MzQsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyRDFHSVRGSzYifQ.yLcUjXVJRWR00dTfCu_yDTsHxRqajq_fQB-s8kp77tI','','MemberD1GITFK6',0,0,0,'2026-11-19 13:17:14'),(33,'9990052785','','662af1cd1976f09a9f8cecc868ccc0a2','379747000029','SEED01','','','','','806446000033','on',1,'2026-11-19 18:49:37','127.0.0.1','127.0.0.1','Test12345','2026-11-19 18:49:37',1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMzIiwibW9iaWxlIjoiOTk5MDA1Mjc4NSIsInN0YXR1cyI6IjEiLCJleHBpcmUiOjE3OTUxODA3NzcsImlzaG9udXAiOiIxMjcuMC4wLjEiLCJjb2RlY2hvcmthbXVrYWxhIjoiTWVtYmVyNU9SMlhBUUcifQ.ki5ITJjekB5J4XRqqgPqiqvjaycMBrEnpaJaPCDUsEU','','Member5OR2XAQG',0,0,0,'2026-11-19 13:19:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip_reward_claims`
--

DROP TABLE IF EXISTS `vip_reward_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vip_reward_claims` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` tinyint NOT NULL,
  `motta` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `lvl` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='VIP milestone reward claims (level, amount, status)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip_reward_claims`
--

LOCK TABLES `vip_reward_claims` WRITE;
/*!40000 ALTER TABLE `vip_reward_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `vip_reward_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchpay_accounts`
--

DROP TABLE IF EXISTS `watchpay_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchpay_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) NOT NULL DEFAULT 'WatchPay Account',
  `mch_id` varchar(50) NOT NULL DEFAULT '',
  `payin_key` varchar(100) NOT NULL DEFAULT '',
  `payout_key` varchar(100) NOT NULL DEFAULT '',
  `payin_url` varchar(255) NOT NULL DEFAULT 'https://api.watchglb.com/pay/web',
  `payout_url` varchar(255) NOT NULL DEFAULT 'https://api.watchglb.com/pay/transfer',
  `payout_query_url` varchar(255) NOT NULL DEFAULT 'https://api.watchglb.com/query/transfer',
  `balance_query_url` varchar(255) NOT NULL DEFAULT 'https://api.watchglb.com/query/balance',
  `pay_type` varchar(20) NOT NULL DEFAULT '101',
  `bank_code_payout` varchar(30) NOT NULL DEFAULT '',
  `payin_fee_percent` decimal(6,2) NOT NULL DEFAULT '0.00',
  `payout_fee_percent` decimal(6,2) NOT NULL DEFAULT '0.00',
  `min_payin` decimal(12,2) NOT NULL DEFAULT '100.00',
  `max_payin` decimal(12,2) NOT NULL DEFAULT '50000.00',
  `min_payout` decimal(12,2) NOT NULL DEFAULT '110.00',
  `max_payout` decimal(12,2) NOT NULL DEFAULT '50000.00',
  `auto_payout` tinyint(1) NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchpay_accounts`
--

LOCK TABLES `watchpay_accounts` WRITE;
/*!40000 ALTER TABLE `watchpay_accounts` DISABLE KEYS */;
INSERT INTO `watchpay_accounts` VALUES (1,'WatchPay India UPI','222887002','8979d78b437948f18c14628ff1ad5f41','ZGZY3REWQJLAWRCRTHWQVGWYPMD878KQ','https://api.wataiglobal.com/pay/web','https://api.wataiglobal.com/pay/transfer','https://api.wataiglobal.com/query/transfer','https://api.wataiglobal.com/query/balance','101','IDPT0001',11.00,4.00,100.00,50000.00,110.00,50000.00,0,0,1,'2026-11-19 08:23:47','2026-11-19 08:23:47');
/*!40000 ALTER TABLE `watchpay_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekly_awards_table`
--

DROP TABLE IF EXISTS `weekly_awards_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weekly_awards_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userkani` int NOT NULL COMMENT 'user id to credit',
  `price` decimal(13,2) NOT NULL DEFAULT '0.00',
  `serial` varchar(100) DEFAULT NULL,
  `shonu` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proc` (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bonus type 107: weekly awards queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekly_awards_table`
--

LOCK TABLES `weekly_awards_table` WRITE;
/*!40000 ALTER TABLE `weekly_awards_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `weekly_awards_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_bets_10min`
--

DROP TABLE IF EXISTS `wingo_bets_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_bets_10min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='WinGo 10-min game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_bets_10min`
--

LOCK TABLES `wingo_bets_10min` WRITE;
/*!40000 ALTER TABLE `wingo_bets_10min` DISABLE KEYS */;
/*!40000 ALTER TABLE `wingo_bets_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_bets_1min`
--

DROP TABLE IF EXISTS `wingo_bets_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_bets_1min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='WinGo 1-min game: individual user bets (color/number/amount per period)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_bets_1min`
--

LOCK TABLES `wingo_bets_1min` WRITE;
/*!40000 ALTER TABLE `wingo_bets_1min` DISABLE KEYS */;
INSERT INTO `wingo_bets_1min` VALUES (2,3,'20261119100010752','1','13','10','1',10,'perte',9.8,0,27840,'2026-11-19 12:33:08'),(3,3,'20261119100010753','1','5','10','1',10,'perte',9.8,0,86250,'2026-11-19 12:34:23'),(4,3,'20261119100010754','1','5','10','1',10,'gagner',88.2,5,99495,'2026-11-19 12:34:55'),(5,3,'20261119100010930','1','13','10','1',10,'perte',9.8,0,76820,'2026-11-19 15:35:03'),(6,3,'20261119100010931','1','13','10','1',10,'perte',9.8,0,85950,'2026-11-19 15:35:21'),(7,3,'20261119100010932','1','5','10','1',10,'gagner',88.2,5,77625,'2026-11-19 15:35:48');
/*!40000 ALTER TABLE `wingo_bets_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_bets_30sec`
--

DROP TABLE IF EXISTS `wingo_bets_30sec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_bets_30sec` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='WinGo 30-second game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_bets_30sec`
--

LOCK TABLES `wingo_bets_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_bets_30sec` DISABLE KEYS */;
INSERT INTO `wingo_bets_30sec` VALUES (2,3,'20261119100041534','0','11','1','1',1,'perte',0.98,0,63530,'2026-11-19 12:47:00'),(3,31,'20261119100042254','1','0','10','1',10,'perte',9.8,1,13691,'2026-11-19 18:45:49'),(4,32,'20261119100042258','1','0','10','1',10,'perte',9.8,1,57531,'2026-11-19 18:47:20'),(5,33,'20261119100042259','1','0','10','1',10,'perte',9.8,NULL,NULL,'2026-11-19 18:49:37');
/*!40000 ALTER TABLE `wingo_bets_30sec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_bets_3min`
--

DROP TABLE IF EXISTS `wingo_bets_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_bets_3min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='WinGo 3-min game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_bets_3min`
--

LOCK TABLES `wingo_bets_3min` WRITE;
/*!40000 ALTER TABLE `wingo_bets_3min` DISABLE KEYS */;
/*!40000 ALTER TABLE `wingo_bets_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_bets_5min`
--

DROP TABLE IF EXISTS `wingo_bets_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_bets_5min` (
  `parichaya` int NOT NULL AUTO_INCREMENT,
  `byabaharkarta` int NOT NULL,
  `kalaparichaya` varchar(255) NOT NULL,
  `prakar` varchar(100) NOT NULL,
  `ojana` varchar(100) NOT NULL,
  `menge` varchar(100) DEFAULT NULL,
  `wettanzahl` varchar(100) DEFAULT NULL,
  `ketebida` float NOT NULL,
  `phalaphala` varchar(255) NOT NULL DEFAULT 'perte',
  `sesabida` float NOT NULL,
  `ergebnis` int DEFAULT NULL,
  `zufallig` int DEFAULT NULL,
  `tiarikala` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`parichaya`),
  KEY `idx_parichaya` (`parichaya`),
  KEY `idx_byabaharkarta` (`byabaharkarta`),
  KEY `idx_kalaparichaya` (`kalaparichaya`),
  KEY `idx_prakar` (`prakar`),
  KEY `idx_ojana` (`ojana`),
  KEY `idx_ketebida` (`ketebida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='WinGo 5-min game: individual user bets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_bets_5min`
--

LOCK TABLES `wingo_bets_5min` WRITE;
/*!40000 ALTER TABLE `wingo_bets_5min` DISABLE KEYS */;
/*!40000 ALTER TABLE `wingo_bets_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_manual_result_10min`
--

DROP TABLE IF EXISTS `wingo_manual_result_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_manual_result_10min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `banna` varchar(300) NOT NULL,
  `maulya` varchar(300) NOT NULL,
  `sankhye` int NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='WinGo 10-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_10min`
--

LOCK TABLES `wingo_manual_result_10min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_10min` DISABLE KEYS */;
/*!40000 ALTER TABLE `wingo_manual_result_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_manual_result_1min`
--

DROP TABLE IF EXISTS `wingo_manual_result_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_manual_result_1min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `banna` varchar(300) NOT NULL,
  `maulya` varchar(300) NOT NULL,
  `sankhye` int NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='WinGo 1-min: admin-forced result override (sthiti=1 forces winning number)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_1min`
--

LOCK TABLES `wingo_manual_result_1min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_1min` DISABLE KEYS */;
INSERT INTO `wingo_manual_result_1min` VALUES (1,'green,violet','x',5,0,'2026-11-19 07:04:55'),(2,'green,violet','x',5,0,'2026-11-19 10:05:48');
/*!40000 ALTER TABLE `wingo_manual_result_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_manual_result_30sec`
--

DROP TABLE IF EXISTS `wingo_manual_result_30sec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_manual_result_30sec` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `banna` varchar(300) NOT NULL,
  `maulya` varchar(300) NOT NULL,
  `sankhye` int NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='WinGo 30-sec: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_30sec`
--

LOCK TABLES `wingo_manual_result_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_30sec` DISABLE KEYS */;
/*!40000 ALTER TABLE `wingo_manual_result_30sec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_manual_result_3min`
--

DROP TABLE IF EXISTS `wingo_manual_result_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_manual_result_3min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `banna` varchar(300) NOT NULL,
  `maulya` varchar(300) NOT NULL,
  `sankhye` int NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='WinGo 3-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_3min`
--

LOCK TABLES `wingo_manual_result_3min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_3min` DISABLE KEYS */;
/*!40000 ALTER TABLE `wingo_manual_result_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_manual_result_5min`
--

DROP TABLE IF EXISTS `wingo_manual_result_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_manual_result_5min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `banna` varchar(300) NOT NULL,
  `maulya` varchar(300) NOT NULL,
  `sankhye` int NOT NULL,
  `sthiti` smallint NOT NULL,
  `dinankavannuracisi` datetime NOT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='WinGo 5-min: admin-forced result override';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_manual_result_5min`
--

LOCK TABLES `wingo_manual_result_5min` WRITE;
/*!40000 ALTER TABLE `wingo_manual_result_5min` DISABLE KEYS */;
/*!40000 ALTER TABLE `wingo_manual_result_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_periods_10min`
--

DROP TABLE IF EXISTS `wingo_periods_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_periods_10min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='WinGo 10-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_10min`
--

LOCK TABLES `wingo_periods_10min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_10min` DISABLE KEYS */;
INSERT INTO `wingo_periods_10min` VALUES (2,'20261119100051540','2026-11-19 12:50:00'),(3,'20261119100051541','2026-11-19 13:00:01'),(4,'20261119100051542','2026-11-19 13:10:00'),(5,'20261119100051543','2026-11-19 13:20:01'),(6,'20261119100051544','2026-11-19 13:30:01'),(7,'20261119100051545','2026-11-19 13:40:01'),(8,'20261119100051546','2026-11-19 13:50:01'),(9,'20261119100051547','2026-11-19 14:00:02'),(10,'20261119100051548','2026-11-19 14:10:00'),(11,'20261119100051549','2026-11-19 14:20:01'),(12,'20261119100051550','2026-11-19 14:40:00'),(13,'20261119100051551','2026-11-19 14:50:00'),(14,'20261119100051552','2026-11-19 15:00:01'),(15,'20261119100051553','2026-11-19 15:10:00'),(16,'20261119100051554','2026-11-19 15:20:01'),(17,'20261119100051555','2026-11-19 15:30:02'),(18,'20261119100051556','2026-11-19 17:50:21'),(19,'20261119100051557','2026-11-19 18:00:17'),(20,'20261119100051558','2026-11-19 18:10:11'),(21,'20261119100051559','2026-11-19 18:10:57'),(22,'20261119100051560','2026-11-19 18:20:07'),(23,'20261119100051561','2026-11-19 18:20:53'),(24,'20261119100051562','2026-11-19 18:30:03'),(25,'20261119100051563','2026-11-19 18:30:49'),(26,'20261119100051564','2026-11-19 18:40:44'),(27,'20261119100051565','2026-11-19 18:50:39'),(28,'20261119100051566','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `wingo_periods_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_periods_1min`
--

DROP TABLE IF EXISTS `wingo_periods_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_periods_1min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=304 DEFAULT CHARSET=latin1 COMMENT='WinGo 1-min: period/round registry (one row per round, regenerated daily by cron)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_1min`
--

LOCK TABLES `wingo_periods_1min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_1min` DISABLE KEYS */;
INSERT INTO `wingo_periods_1min` VALUES (12,'20261119100010752','2026-11-19 12:31:12'),(13,'20261119100010753','2026-11-19 12:33:08'),(14,'20261119100010754','2026-11-19 12:34:23'),(15,'20261119100010755','2026-11-19 12:34:55'),(16,'20261119100010756','2026-11-19 12:44:01'),(17,'20261119100010757','2026-11-19 12:45:00'),(18,'20261119100010758','2026-11-19 12:46:00'),(19,'20261119100010759','2026-11-19 12:47:00'),(20,'20261119100010760','2026-11-19 12:48:00'),(21,'20261119100010761','2026-11-19 12:49:00'),(22,'20261119100010762','2026-11-19 12:50:00'),(23,'20261119100010763','2026-11-19 12:51:00'),(24,'20261119100010764','2026-11-19 12:52:00'),(25,'20261119100010765','2026-11-19 12:53:00'),(26,'20261119100010766','2026-11-19 12:54:00'),(27,'20261119100010767','2026-11-19 12:55:00'),(28,'20261119100010768','2026-11-19 12:56:00'),(29,'20261119100010769','2026-11-19 12:57:00'),(30,'20261119100010770','2026-11-19 12:58:00'),(31,'20261119100010771','2026-11-19 12:59:00'),(32,'20261119100010772','2026-11-19 13:00:00'),(33,'20261119100010773','2026-11-19 13:01:00'),(34,'20261119100010774','2026-11-19 13:02:00'),(35,'20261119100010775','2026-11-19 13:03:00'),(36,'20261119100010776','2026-11-19 13:04:00'),(37,'20261119100010777','2026-11-19 13:05:00'),(38,'20261119100010778','2026-11-19 13:06:00'),(39,'20261119100010779','2026-11-19 13:07:00'),(40,'20261119100010780','2026-11-19 13:08:00'),(41,'20261119100010781','2026-11-19 13:09:00'),(42,'20261119100010782','2026-11-19 13:10:00'),(43,'20261119100010783','2026-11-19 13:11:00'),(44,'20261119100010784','2026-11-19 13:12:00'),(45,'20261119100010785','2026-11-19 13:13:00'),(46,'20261119100010786','2026-11-19 13:14:00'),(47,'20261119100010787','2026-11-19 13:15:00'),(48,'20261119100010788','2026-11-19 13:16:00'),(49,'20261119100010789','2026-11-19 13:17:00'),(50,'20261119100010790','2026-11-19 13:18:00'),(51,'20261119100010791','2026-11-19 13:19:00'),(52,'20261119100010792','2026-11-19 13:20:00'),(53,'20261119100010793','2026-11-19 13:21:00'),(54,'20261119100010794','2026-11-19 13:22:00'),(55,'20261119100010795','2026-11-19 13:23:00'),(56,'20261119100010796','2026-11-19 13:24:00'),(57,'20261119100010797','2026-11-19 13:25:00'),(58,'20261119100010798','2026-11-19 13:26:00'),(59,'20261119100010799','2026-11-19 13:27:00'),(60,'20261119100010800','2026-11-19 13:28:00'),(61,'20261119100010801','2026-11-19 13:29:00'),(62,'20261119100010802','2026-11-19 13:30:00'),(63,'20261119100010803','2026-11-19 13:31:00'),(64,'20261119100010804','2026-11-19 13:32:00'),(65,'20261119100010805','2026-11-19 13:33:00'),(66,'20261119100010806','2026-11-19 13:34:00'),(67,'20261119100010807','2026-11-19 13:35:00'),(68,'20261119100010808','2026-11-19 13:36:00'),(69,'20261119100010809','2026-11-19 13:37:00'),(70,'20261119100010810','2026-11-19 13:38:00'),(71,'20261119100010811','2026-11-19 13:39:00'),(72,'20261119100010812','2026-11-19 13:40:00'),(73,'20261119100010813','2026-11-19 13:41:00'),(74,'20261119100010814','2026-11-19 13:42:00'),(75,'20261119100010815','2026-11-19 13:43:00'),(76,'20261119100010816','2026-11-19 13:44:00'),(77,'20261119100010817','2026-11-19 13:45:00'),(78,'20261119100010818','2026-11-19 13:46:00'),(79,'20261119100010819','2026-11-19 13:47:00'),(80,'20261119100010820','2026-11-19 13:48:00'),(81,'20261119100010821','2026-11-19 13:49:00'),(82,'20261119100010822','2026-11-19 13:50:00'),(83,'20261119100010823','2026-11-19 13:51:00'),(84,'20261119100010824','2026-11-19 13:52:00'),(85,'20261119100010825','2026-11-19 13:53:00'),(86,'20261119100010826','2026-11-19 13:54:00'),(87,'20261119100010827','2026-11-19 13:55:00'),(88,'20261119100010828','2026-11-19 13:56:00'),(89,'20261119100010829','2026-11-19 13:57:00'),(90,'20261119100010830','2026-11-19 13:58:00'),(91,'20261119100010831','2026-11-19 13:59:00'),(92,'20261119100010832','2026-11-19 14:00:00'),(93,'20261119100010833','2026-11-19 14:01:00'),(94,'20261119100010834','2026-11-19 14:02:00'),(95,'20261119100010835','2026-11-19 14:03:00'),(96,'20261119100010836','2026-11-19 14:04:00'),(97,'20261119100010837','2026-11-19 14:05:00'),(98,'20261119100010838','2026-11-19 14:06:00'),(99,'20261119100010839','2026-11-19 14:07:00'),(100,'20261119100010840','2026-11-19 14:08:00'),(101,'20261119100010841','2026-11-19 14:09:00'),(102,'20261119100010842','2026-11-19 14:10:00'),(103,'20261119100010843','2026-11-19 14:11:00'),(104,'20261119100010844','2026-11-19 14:12:00'),(105,'20261119100010845','2026-11-19 14:13:00'),(106,'20261119100010846','2026-11-19 14:14:00'),(107,'20261119100010847','2026-11-19 14:15:00'),(108,'20261119100010848','2026-11-19 14:16:00'),(109,'20261119100010849','2026-11-19 14:17:00'),(110,'20261119100010850','2026-11-19 14:18:00'),(111,'20261119100010851','2026-11-19 14:19:00'),(112,'20261119100010852','2026-11-19 14:20:00'),(113,'20261119100010853','2026-11-19 14:21:00'),(114,'20261119100010854','2026-11-19 14:22:00'),(115,'20261119100010855','2026-11-19 14:23:00'),(116,'20261119100010856','2026-11-19 14:24:00'),(117,'20261119100010857','2026-11-19 14:25:00'),(118,'20261119100010858','2026-11-19 14:26:00'),(119,'20261119100010859','2026-11-19 14:27:00'),(120,'20261119100010860','2026-11-19 14:28:00'),(121,'20261119100010861','2026-11-19 14:29:00'),(122,'20261119100010862','2026-11-19 14:29:04'),(123,'20261119100010863','2026-11-19 14:29:11'),(124,'20261119100010864','2026-11-19 14:29:23'),(125,'20261119100010865','2026-11-19 14:30:00'),(126,'20261119100010866','2026-11-19 14:31:00'),(127,'20261119100010867','2026-11-19 14:32:00'),(128,'20261119100010868','2026-11-19 14:33:00'),(129,'20261119100010869','2026-11-19 14:34:00'),(130,'20261119100010870','2026-11-19 14:35:00'),(131,'20261119100010871','2026-11-19 14:36:00'),(132,'20261119100010872','2026-11-19 14:37:00'),(133,'20261119100010873','2026-11-19 14:38:00'),(134,'20261119100010874','2026-11-19 14:39:00'),(135,'20261119100010875','2026-11-19 14:40:00'),(136,'20261119100010876','2026-11-19 14:41:00'),(137,'20261119100010877','2026-11-19 14:42:00'),(138,'20261119100010878','2026-11-19 14:43:00'),(139,'20261119100010879','2026-11-19 14:44:00'),(140,'20261119100010880','2026-11-19 14:45:00'),(141,'20261119100010881','2026-11-19 14:46:00'),(142,'20261119100010882','2026-11-19 14:47:00'),(143,'20261119100010883','2026-11-19 14:48:00'),(144,'20261119100010884','2026-11-19 14:49:00'),(145,'20261119100010885','2026-11-19 14:50:00'),(146,'20261119100010886','2026-11-19 14:51:00'),(147,'20261119100010887','2026-11-19 14:52:00'),(148,'20261119100010888','2026-11-19 14:53:01'),(149,'20261119100010889','2026-11-19 14:54:00'),(150,'20261119100010890','2026-11-19 14:55:00'),(151,'20261119100010891','2026-11-19 14:56:00'),(152,'20261119100010892','2026-11-19 14:57:00'),(153,'20261119100010893','2026-11-19 14:58:00'),(154,'20261119100010894','2026-11-19 14:59:00'),(155,'20261119100010895','2026-11-19 15:00:00'),(156,'20261119100010896','2026-11-19 15:01:00'),(157,'20261119100010897','2026-11-19 15:02:00'),(158,'20261119100010898','2026-11-19 15:03:00'),(159,'20261119100010899','2026-11-19 15:04:00'),(160,'20261119100010900','2026-11-19 15:05:00'),(161,'20261119100010901','2026-11-19 15:06:00'),(162,'20261119100010902','2026-11-19 15:07:00'),(163,'20261119100010903','2026-11-19 15:08:01'),(164,'20261119100010904','2026-11-19 15:09:00'),(165,'20261119100010905','2026-11-19 15:10:00'),(166,'20261119100010906','2026-11-19 15:11:00'),(167,'20261119100010907','2026-11-19 15:12:00'),(168,'20261119100010908','2026-11-19 15:13:00'),(169,'20261119100010909','2026-11-19 15:14:00'),(170,'20261119100010910','2026-11-19 15:15:00'),(171,'20261119100010911','2026-11-19 15:16:00'),(172,'20261119100010912','2026-11-19 15:17:00'),(173,'20261119100010913','2026-11-19 15:18:00'),(174,'20261119100010914','2026-11-19 15:19:00'),(175,'20261119100010915','2026-11-19 15:20:00'),(176,'20261119100010916','2026-11-19 15:21:00'),(177,'20261119100010917','2026-11-19 15:22:00'),(178,'20261119100010918','2026-11-19 15:23:00'),(179,'20261119100010919','2026-11-19 15:24:00'),(180,'20261119100010920','2026-11-19 15:25:00'),(181,'20261119100010921','2026-11-19 15:26:00'),(182,'20261119100010922','2026-11-19 15:27:00'),(183,'20261119100010923','2026-11-19 15:28:00'),(184,'20261119100010924','2026-11-19 15:29:00'),(185,'20261119100010925','2026-11-19 15:30:00'),(186,'20261119100010926','2026-11-19 15:31:00'),(187,'20261119100010927','2026-11-19 15:32:00'),(188,'20261119100010928','2026-11-19 15:33:00'),(189,'20261119100010929','2026-11-19 15:34:00'),(190,'20261119100010930','2026-11-19 15:35:00'),(191,'20261119100010931','2026-11-19 15:35:03'),(192,'20261119100010932','2026-11-19 15:35:21'),(193,'20261119100010933','2026-11-19 15:35:48'),(194,'20261119100010934','2026-11-19 15:36:00'),(195,'20261119100010935','2026-11-19 15:37:00'),(196,'20261119100010936','2026-11-19 15:38:00'),(197,'20261119100010937','2026-11-19 15:38:51'),(198,'20261119100010938','2026-11-19 15:39:00'),(199,'20261119100010939','2026-11-19 17:44:13'),(200,'20261119100010940','2026-11-19 17:44:59'),(201,'20261119100010941','2026-11-19 17:45:45'),(202,'20261119100010942','2026-11-19 17:46:31'),(203,'20261119100010943','2026-11-19 17:47:17'),(204,'20261119100010944','2026-11-19 17:48:03'),(205,'20261119100010945','2026-11-19 17:48:49'),(206,'20261119100010946','2026-11-19 17:49:35'),(207,'20261119100010947','2026-11-19 17:50:20'),(208,'20261119100010948','2026-11-19 17:51:06'),(209,'20261119100010949','2026-11-19 17:51:52'),(210,'20261119100010950','2026-11-19 17:52:38'),(211,'20261119100010951','2026-11-19 17:53:24'),(212,'20261119100010952','2026-11-19 17:54:10'),(213,'20261119100010953','2026-11-19 17:54:55'),(214,'20261119100010954','2026-11-19 17:55:41'),(215,'20261119100010955','2026-11-19 17:56:27'),(216,'20261119100010956','2026-11-19 17:57:13'),(217,'20261119100010957','2026-11-19 17:57:59'),(218,'20261119100010958','2026-11-19 17:58:45'),(219,'20261119100010959','2026-11-19 17:59:30'),(220,'20261119100010960','2026-11-19 18:00:16'),(221,'20261119100010961','2026-11-19 18:01:01'),(222,'20261119100010962','2026-11-19 18:01:47'),(223,'20261119100010963','2026-11-19 18:02:33'),(224,'20261119100010964','2026-11-19 18:03:19'),(225,'20261119100010965','2026-11-19 18:04:04'),(226,'20261119100010966','2026-11-19 18:04:50'),(227,'20261119100010967','2026-11-19 18:05:36'),(228,'20261119100010968','2026-11-19 18:06:22'),(229,'20261119100010969','2026-11-19 18:07:08'),(230,'20261119100010970','2026-11-19 18:07:53'),(231,'20261119100010971','2026-11-19 18:08:39'),(232,'20261119100010972','2026-11-19 18:09:25'),(233,'20261119100010973','2026-11-19 18:10:10'),(234,'20261119100010974','2026-11-19 18:10:57'),(235,'20261119100010975','2026-11-19 18:11:43'),(236,'20261119100010976','2026-11-19 18:12:29'),(237,'20261119100010977','2026-11-19 18:13:15'),(238,'20261119100010978','2026-11-19 18:14:00'),(239,'20261119100010979','2026-11-19 18:14:46'),(240,'20261119100010980','2026-11-19 18:15:31'),(241,'20261119100010981','2026-11-19 18:16:18'),(242,'20261119100010982','2026-11-19 18:17:04'),(243,'20261119100010983','2026-11-19 18:17:49'),(244,'20261119100010984','2026-11-19 18:18:35'),(245,'20261119100010985','2026-11-19 18:19:21'),(246,'20261119100010986','2026-11-19 18:20:06'),(247,'20261119100010987','2026-11-19 18:20:53'),(248,'20261119100010988','2026-11-19 18:21:39'),(249,'20261119100010989','2026-11-19 18:22:25'),(250,'20261119100010990','2026-11-19 18:23:10'),(251,'20261119100010991','2026-11-19 18:23:56'),(252,'20261119100010992','2026-11-19 18:24:42'),(253,'20261119100010993','2026-11-19 18:25:28'),(254,'20261119100010994','2026-11-19 18:26:14'),(255,'20261119100010995','2026-11-19 18:26:59'),(256,'20261119100010996','2026-11-19 18:27:45'),(257,'20261119100010997','2026-11-19 18:28:31'),(258,'20261119100010998','2026-11-19 18:29:17'),(259,'20261119100010999','2026-11-19 18:30:02'),(260,'20261119100011000','2026-11-19 18:30:48'),(261,'20261119100011001','2026-11-19 18:31:33'),(262,'20261119100011002','2026-11-19 18:32:19'),(263,'20261119100011003','2026-11-19 18:33:05'),(264,'20261119100011004','2026-11-19 18:33:51'),(265,'20261119100011005','2026-11-19 18:34:36'),(266,'20261119100011006','2026-11-19 18:35:22'),(267,'20261119100011007','2026-11-19 18:36:08'),(268,'20261119100011008','2026-11-19 18:36:54'),(269,'20261119100011009','2026-11-19 18:37:40'),(270,'20261119100011010','2026-11-19 18:38:26'),(271,'20261119100011011','2026-11-19 18:39:11'),(272,'20261119100011012','2026-11-19 18:39:57'),(273,'20261119100011013','2026-11-19 18:40:43'),(274,'20261119100011014','2026-11-19 18:41:29'),(275,'20261119100011015','2026-11-19 18:42:15'),(276,'20261119100011016','2026-11-19 18:43:01'),(277,'20261119100011017','2026-11-19 18:43:46'),(278,'20261119100011018','2026-11-19 18:44:32'),(279,'20261119100011019','2026-11-19 18:45:18'),(280,'20261119100011020','2026-11-19 18:46:04'),(281,'20261119100011021','2026-11-19 18:46:50'),(282,'20261119100011022','2026-11-19 18:47:35'),(283,'20261119100011023','2026-11-19 18:48:21'),(284,'20261119100011024','2026-11-19 18:49:07'),(285,'20261119100011025','2026-11-19 18:49:53'),(286,'20261119100011026','2026-11-19 18:50:38'),(287,'20261119100011027','2026-11-19 18:51:25'),(288,'20261119100011028','2026-11-19 18:52:10'),(289,'20261119100011029','2026-11-19 18:52:56'),(290,'20261119100011030','2026-11-19 18:53:42'),(291,'20261119100011031','2026-11-19 18:54:27'),(292,'20261119100011032','2026-11-19 18:55:13'),(293,'20261119100011033','2026-11-19 18:55:59'),(294,'20261119100011034','2026-11-19 18:56:45'),(295,'20261119100011035','2026-11-19 18:57:31'),(296,'20261119100011036','2026-11-19 18:58:17'),(297,'20261119100011037','2026-11-19 18:59:02'),(298,'20261119100011038','2026-11-19 18:59:48'),(299,'20261119100011039','2026-11-19 19:00:34'),(300,'20261119100011040','2026-11-19 19:01:19'),(301,'20261119100011041','2026-11-19 19:02:05'),(302,'20261119100011042','2026-11-19 19:02:50'),(303,'20261119100011043','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `wingo_periods_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_periods_30sec`
--

DROP TABLE IF EXISTS `wingo_periods_30sec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_periods_30sec` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=568 DEFAULT CHARSET=latin1 COMMENT='WinGo 30-sec: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_30sec`
--

LOCK TABLES `wingo_periods_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_periods_30sec` DISABLE KEYS */;
INSERT INTO `wingo_periods_30sec` VALUES (1,'20261119100041503','2026-11-19 12:31:12'),(2,'20261119100041504','2026-11-19 12:31:42'),(3,'20261119100041505','2026-11-19 12:33:09'),(4,'20261119100041506','2026-11-19 12:33:39'),(5,'20261119100041507','2026-11-19 12:34:24'),(6,'20261119100041508','2026-11-19 12:34:54'),(7,'20261119100041529','2026-11-19 12:44:01'),(8,'20261119100041530','2026-11-19 12:44:31'),(9,'20261119100041531','2026-11-19 12:45:00'),(10,'20261119100041532','2026-11-19 12:45:30'),(11,'20261119100041533','2026-11-19 12:46:01'),(12,'20261119100041534','2026-11-19 12:46:31'),(13,'20261119100041535','2026-11-19 12:47:00'),(14,'20261119100041536','2026-11-19 12:47:30'),(15,'20261119100041537','2026-11-19 12:48:01'),(16,'20261119100041538','2026-11-19 12:48:30'),(17,'20261119100041539','2026-11-19 12:49:00'),(18,'20261119100041540','2026-11-19 12:49:30'),(19,'20261119100041541','2026-11-19 12:50:00'),(20,'20261119100041542','2026-11-19 12:50:30'),(21,'20261119100041543','2026-11-19 12:51:01'),(22,'20261119100041544','2026-11-19 12:51:31'),(23,'20261119100041545','2026-11-19 12:52:00'),(24,'20261119100041546','2026-11-19 12:52:30'),(25,'20261119100041547','2026-11-19 12:53:01'),(26,'20261119100041548','2026-11-19 12:53:31'),(27,'20261119100041549','2026-11-19 12:54:00'),(28,'20261119100041550','2026-11-19 12:54:31'),(29,'20261119100041551','2026-11-19 12:55:00'),(30,'20261119100041552','2026-11-19 12:55:30'),(31,'20261119100041553','2026-11-19 12:56:01'),(32,'20261119100041554','2026-11-19 12:56:31'),(33,'20261119100041555','2026-11-19 12:57:00'),(34,'20261119100041556','2026-11-19 12:57:30'),(35,'20261119100041557','2026-11-19 12:58:01'),(36,'20261119100041558','2026-11-19 12:58:31'),(37,'20261119100041559','2026-11-19 12:59:00'),(38,'20261119100041560','2026-11-19 12:59:30'),(39,'20261119100041561','2026-11-19 13:00:00'),(40,'20261119100041562','2026-11-19 13:00:30'),(41,'20261119100041563','2026-11-19 13:01:01'),(42,'20261119100041564','2026-11-19 13:01:31'),(43,'20261119100041565','2026-11-19 13:02:00'),(44,'20261119100041566','2026-11-19 13:02:30'),(45,'20261119100041567','2026-11-19 13:03:00'),(46,'20261119100041568','2026-11-19 13:03:31'),(47,'20261119100041569','2026-11-19 13:04:00'),(48,'20261119100041570','2026-11-19 13:04:30'),(49,'20261119100041571','2026-11-19 13:05:00'),(50,'20261119100041572','2026-11-19 13:05:31'),(51,'20261119100041573','2026-11-19 13:06:00'),(52,'20261119100041574','2026-11-19 13:06:30'),(53,'20261119100041575','2026-11-19 13:07:01'),(54,'20261119100041576','2026-11-19 13:07:31'),(55,'20261119100041577','2026-11-19 13:08:00'),(56,'20261119100041578','2026-11-19 13:08:30'),(57,'20261119100041579','2026-11-19 13:09:00'),(58,'20261119100041580','2026-11-19 13:09:31'),(59,'20261119100041581','2026-11-19 13:10:00'),(60,'20261119100041582','2026-11-19 13:10:30'),(61,'20261119100041583','2026-11-19 13:11:01'),(62,'20261119100041584','2026-11-19 13:11:31'),(63,'20261119100041585','2026-11-19 13:12:00'),(64,'20261119100041586','2026-11-19 13:12:30'),(65,'20261119100041587','2026-11-19 13:13:01'),(66,'20261119100041588','2026-11-19 13:13:31'),(67,'20261119100041589','2026-11-19 13:14:00'),(68,'20261119100041590','2026-11-19 13:14:30'),(69,'20261119100041591','2026-11-19 13:15:01'),(70,'20261119100041592','2026-11-19 13:15:31'),(71,'20261119100041593','2026-11-19 13:16:01'),(72,'20261119100041594','2026-11-19 13:16:31'),(73,'20261119100041595','2026-11-19 13:17:00'),(74,'20261119100041596','2026-11-19 13:17:30'),(75,'20261119100041597','2026-11-19 13:18:00'),(76,'20261119100041598','2026-11-19 13:18:31'),(77,'20261119100041599','2026-11-19 13:19:00'),(78,'20261119100041600','2026-11-19 13:19:30'),(79,'20261119100041601','2026-11-19 13:20:00'),(80,'20261119100041602','2026-11-19 13:20:30'),(81,'20261119100041603','2026-11-19 13:21:01'),(82,'20261119100041604','2026-11-19 13:21:31'),(83,'20261119100041605','2026-11-19 13:22:00'),(84,'20261119100041606','2026-11-19 13:22:30'),(85,'20261119100041607','2026-11-19 13:23:01'),(86,'20261119100041608','2026-11-19 13:23:31'),(87,'20261119100041609','2026-11-19 13:24:00'),(88,'20261119100041610','2026-11-19 13:24:30'),(89,'20261119100041611','2026-11-19 13:25:01'),(90,'20261119100041612','2026-11-19 13:25:31'),(91,'20261119100041613','2026-11-19 13:26:00'),(92,'20261119100041614','2026-11-19 13:26:30'),(93,'20261119100041615','2026-11-19 13:27:01'),(94,'20261119100041616','2026-11-19 13:27:31'),(95,'20261119100041617','2026-11-19 13:28:00'),(96,'20261119100041618','2026-11-19 13:28:30'),(97,'20261119100041619','2026-11-19 13:29:01'),(98,'20261119100041620','2026-11-19 13:29:31'),(99,'20261119100041621','2026-11-19 13:30:00'),(100,'20261119100041622','2026-11-19 13:30:30'),(101,'20261119100041623','2026-11-19 13:31:01'),(102,'20261119100041624','2026-11-19 13:31:31'),(103,'20261119100041625','2026-11-19 13:32:00'),(104,'20261119100041626','2026-11-19 13:32:30'),(105,'20261119100041627','2026-11-19 13:33:00'),(106,'20261119100041628','2026-11-19 13:33:31'),(107,'20261119100041629','2026-11-19 13:34:00'),(108,'20261119100041630','2026-11-19 13:34:30'),(109,'20261119100041631','2026-11-19 13:35:00'),(110,'20261119100041632','2026-11-19 13:35:30'),(111,'20261119100041633','2026-11-19 13:36:01'),(112,'20261119100041634','2026-11-19 13:36:31'),(113,'20261119100041635','2026-11-19 13:37:00'),(114,'20261119100041636','2026-11-19 13:37:30'),(115,'20261119100041637','2026-11-19 13:38:01'),(116,'20261119100041638','2026-11-19 13:38:31'),(117,'20261119100041639','2026-11-19 13:39:00'),(118,'20261119100041640','2026-11-19 13:39:30'),(119,'20261119100041641','2026-11-19 13:40:01'),(120,'20261119100041642','2026-11-19 13:40:31'),(121,'20261119100041643','2026-11-19 13:41:01'),(122,'20261119100041644','2026-11-19 13:41:31'),(123,'20261119100041645','2026-11-19 13:42:00'),(124,'20261119100041646','2026-11-19 13:42:30'),(125,'20261119100041647','2026-11-19 13:43:01'),(126,'20261119100041648','2026-11-19 13:43:31'),(127,'20261119100041649','2026-11-19 13:44:00'),(128,'20261119100041650','2026-11-19 13:44:30'),(129,'20261119100041651','2026-11-19 13:45:00'),(130,'20261119100041652','2026-11-19 13:45:31'),(131,'20261119100041653','2026-11-19 13:46:00'),(132,'20261119100041654','2026-11-19 13:46:30'),(133,'20261119100041655','2026-11-19 13:47:01'),(134,'20261119100041656','2026-11-19 13:47:31'),(135,'20261119100041657','2026-11-19 13:48:00'),(136,'20261119100041658','2026-11-19 13:48:30'),(137,'20261119100041659','2026-11-19 13:49:00'),(138,'20261119100041660','2026-11-19 13:49:30'),(139,'20261119100041661','2026-11-19 13:50:01'),(140,'20261119100041662','2026-11-19 13:50:31'),(141,'20261119100041663','2026-11-19 13:51:01'),(142,'20261119100041664','2026-11-19 13:51:31'),(143,'20261119100041665','2026-11-19 13:52:00'),(144,'20261119100041666','2026-11-19 13:52:30'),(145,'20261119100041667','2026-11-19 13:53:01'),(146,'20261119100041668','2026-11-19 13:53:31'),(147,'20261119100041669','2026-11-19 13:54:00'),(148,'20261119100041670','2026-11-19 13:54:30'),(149,'20261119100041671','2026-11-19 13:55:01'),(150,'20261119100041672','2026-11-19 13:55:31'),(151,'20261119100041673','2026-11-19 13:56:00'),(152,'20261119100041674','2026-11-19 13:56:30'),(153,'20261119100041675','2026-11-19 13:57:01'),(154,'20261119100041676','2026-11-19 13:57:31'),(155,'20261119100041677','2026-11-19 13:58:00'),(156,'20261119100041678','2026-11-19 13:58:30'),(157,'20261119100041679','2026-11-19 13:59:00'),(158,'20261119100041680','2026-11-19 13:59:30'),(159,'20261119100041681','2026-11-19 14:00:01'),(160,'20261119100041682','2026-11-19 14:00:31'),(161,'20261119100041683','2026-11-19 14:01:00'),(162,'20261119100041684','2026-11-19 14:01:31'),(163,'20261119100041685','2026-11-19 14:02:00'),(164,'20261119100041686','2026-11-19 14:02:30'),(165,'20261119100041687','2026-11-19 14:03:00'),(166,'20261119100041688','2026-11-19 14:03:30'),(167,'20261119100041689','2026-11-19 14:04:01'),(168,'20261119100041690','2026-11-19 14:04:31'),(169,'20261119100041691','2026-11-19 14:05:00'),(170,'20261119100041692','2026-11-19 14:05:30'),(171,'20261119100041693','2026-11-19 14:06:01'),(172,'20261119100041694','2026-11-19 14:06:30'),(173,'20261119100041695','2026-11-19 14:07:01'),(174,'20261119100041696','2026-11-19 14:07:31'),(175,'20261119100041697','2026-11-19 14:08:00'),(176,'20261119100041698','2026-11-19 14:08:30'),(177,'20261119100041699','2026-11-19 14:09:00'),(178,'20261119100041700','2026-11-19 14:09:31'),(179,'20261119100041701','2026-11-19 14:10:00'),(180,'20261119100041702','2026-11-19 14:10:31'),(181,'20261119100041703','2026-11-19 14:11:00'),(182,'20261119100041704','2026-11-19 14:11:30'),(183,'20261119100041705','2026-11-19 14:12:01'),(184,'20261119100041706','2026-11-19 14:12:30'),(185,'20261119100041707','2026-11-19 14:13:01'),(186,'20261119100041708','2026-11-19 14:13:31'),(187,'20261119100041709','2026-11-19 14:14:00'),(188,'20261119100041710','2026-11-19 14:14:30'),(189,'20261119100041711','2026-11-19 14:15:00'),(190,'20261119100041712','2026-11-19 14:15:31'),(191,'20261119100041713','2026-11-19 14:16:00'),(192,'20261119100041714','2026-11-19 14:16:30'),(193,'20261119100041715','2026-11-19 14:17:00'),(194,'20261119100041716','2026-11-19 14:17:30'),(195,'20261119100041717','2026-11-19 14:18:01'),(196,'20261119100041718','2026-11-19 14:18:31'),(197,'20261119100041719','2026-11-19 14:19:00'),(198,'20261119100041720','2026-11-19 14:19:30'),(199,'20261119100041721','2026-11-19 14:20:01'),(200,'20261119100041722','2026-11-19 14:20:31'),(201,'20261119100041723','2026-11-19 14:21:01'),(202,'20261119100041724','2026-11-19 14:21:31'),(203,'20261119100041725','2026-11-19 14:22:00'),(204,'20261119100041726','2026-11-19 14:22:30'),(205,'20261119100041727','2026-11-19 14:23:01'),(206,'20261119100041728','2026-11-19 14:23:31'),(207,'20261119100041729','2026-11-19 14:24:00'),(208,'20261119100041730','2026-11-19 14:24:30'),(209,'20261119100041731','2026-11-19 14:25:01'),(210,'20261119100041732','2026-11-19 14:25:31'),(211,'20261119100041733','2026-11-19 14:26:00'),(212,'20261119100041734','2026-11-19 14:26:30'),(213,'20261119100041735','2026-11-19 14:27:01'),(214,'20261119100041736','2026-11-19 14:27:31'),(215,'20261119100041737','2026-11-19 14:28:00'),(216,'20261119100041738','2026-11-19 14:28:30'),(217,'20261119100041739','2026-11-19 14:29:01'),(218,'20261119100041740','2026-11-19 14:29:24'),(219,'20261119100041741','2026-11-19 14:29:54'),(220,'20261119100041742','2026-11-19 14:31:00'),(221,'20261119100041743','2026-11-19 14:31:30'),(222,'20261119100041744','2026-11-19 14:32:01'),(223,'20261119100041745','2026-11-19 14:32:31'),(224,'20261119100041746','2026-11-19 14:33:00'),(225,'20261119100041747','2026-11-19 14:33:30'),(226,'20261119100041748','2026-11-19 14:34:00'),(227,'20261119100041749','2026-11-19 14:34:30'),(228,'20261119100041750','2026-11-19 14:35:00'),(229,'20261119100041751','2026-11-19 14:35:30'),(230,'20261119100041752','2026-11-19 14:36:01'),(231,'20261119100041753','2026-11-19 14:36:31'),(232,'20261119100041754','2026-11-19 14:37:00'),(233,'20261119100041755','2026-11-19 14:37:30'),(234,'20261119100041756','2026-11-19 14:38:01'),(235,'20261119100041757','2026-11-19 14:38:31'),(236,'20261119100041758','2026-11-19 14:39:00'),(237,'20261119100041759','2026-11-19 14:39:31'),(238,'20261119100041760','2026-11-19 14:40:00'),(239,'20261119100041761','2026-11-19 14:40:31'),(240,'20261119100041762','2026-11-19 14:41:00'),(241,'20261119100041763','2026-11-19 14:41:30'),(242,'20261119100041764','2026-11-19 14:42:00'),(243,'20261119100041765','2026-11-19 14:42:31'),(244,'20261119100041766','2026-11-19 14:43:00'),(245,'20261119100041767','2026-11-19 14:43:30'),(246,'20261119100041768','2026-11-19 14:44:00'),(247,'20261119100041769','2026-11-19 14:44:30'),(248,'20261119100041770','2026-11-19 14:45:01'),(249,'20261119100041771','2026-11-19 14:45:31'),(250,'20261119100041772','2026-11-19 14:46:00'),(251,'20261119100041773','2026-11-19 14:46:30'),(252,'20261119100041774','2026-11-19 14:47:01'),(253,'20261119100041775','2026-11-19 14:47:31'),(254,'20261119100041776','2026-11-19 14:48:00'),(255,'20261119100041777','2026-11-19 14:48:30'),(256,'20261119100041778','2026-11-19 14:49:01'),(257,'20261119100041779','2026-11-19 14:49:31'),(258,'20261119100041780','2026-11-19 14:50:00'),(259,'20261119100041781','2026-11-19 14:50:31'),(260,'20261119100041782','2026-11-19 14:51:00'),(261,'20261119100041783','2026-11-19 14:51:30'),(262,'20261119100041784','2026-11-19 14:52:00'),(263,'20261119100041785','2026-11-19 14:52:30'),(264,'20261119100041786','2026-11-19 14:53:01'),(265,'20261119100041787','2026-11-19 14:53:31'),(266,'20261119100041788','2026-11-19 14:54:00'),(267,'20261119100041789','2026-11-19 14:54:30'),(268,'20261119100041790','2026-11-19 14:55:01'),(269,'20261119100041791','2026-11-19 14:55:31'),(270,'20261119100041792','2026-11-19 14:56:00'),(271,'20261119100041793','2026-11-19 14:56:30'),(272,'20261119100041794','2026-11-19 14:57:01'),(273,'20261119100041795','2026-11-19 14:57:31'),(274,'20261119100041796','2026-11-19 14:58:00'),(275,'20261119100041797','2026-11-19 14:58:30'),(276,'20261119100041798','2026-11-19 14:59:01'),(277,'20261119100041799','2026-11-19 14:59:31'),(278,'20261119100041800','2026-11-19 15:00:00'),(279,'20261119100041801','2026-11-19 15:00:30'),(280,'20261119100041802','2026-11-19 15:01:01'),(281,'20261119100041803','2026-11-19 15:01:31'),(282,'20261119100041804','2026-11-19 15:02:00'),(283,'20261119100041805','2026-11-19 15:02:30'),(284,'20261119100041806','2026-11-19 15:03:00'),(285,'20261119100041807','2026-11-19 15:03:31'),(286,'20261119100041808','2026-11-19 15:04:00'),(287,'20261119100041809','2026-11-19 15:04:30'),(288,'20261119100041810','2026-11-19 15:05:00'),(289,'20261119100041811','2026-11-19 15:05:31'),(290,'20261119100041812','2026-11-19 15:06:00'),(291,'20261119100041813','2026-11-19 15:06:30'),(292,'20261119100041814','2026-11-19 15:07:00'),(293,'20261119100041815','2026-11-19 15:07:30'),(294,'20261119100041816','2026-11-19 15:08:01'),(295,'20261119100041817','2026-11-19 15:08:31'),(296,'20261119100041818','2026-11-19 15:09:01'),(297,'20261119100041819','2026-11-19 15:09:31'),(298,'20261119100041820','2026-11-19 15:10:00'),(299,'20261119100041821','2026-11-19 15:10:31'),(300,'20261119100041822','2026-11-19 15:11:00'),(301,'20261119100041823','2026-11-19 15:11:30'),(302,'20261119100041824','2026-11-19 15:12:00'),(303,'20261119100041825','2026-11-19 15:12:31'),(304,'20261119100041826','2026-11-19 15:13:00'),(305,'20261119100041827','2026-11-19 15:13:30'),(306,'20261119100041828','2026-11-19 15:14:00'),(307,'20261119100041829','2026-11-19 15:14:30'),(308,'20261119100041830','2026-11-19 15:15:01'),(309,'20261119100041831','2026-11-19 15:15:31'),(310,'20261119100041832','2026-11-19 15:16:01'),(311,'20261119100041833','2026-11-19 15:16:31'),(312,'20261119100041834','2026-11-19 15:17:00'),(313,'20261119100041835','2026-11-19 15:17:30'),(314,'20261119100041836','2026-11-19 15:18:01'),(315,'20261119100041837','2026-11-19 15:18:31'),(316,'20261119100041838','2026-11-19 15:19:00'),(317,'20261119100041839','2026-11-19 15:19:30'),(318,'20261119100041840','2026-11-19 15:20:01'),(319,'20261119100041841','2026-11-19 15:20:31'),(320,'20261119100041842','2026-11-19 15:21:01'),(321,'20261119100041843','2026-11-19 15:21:31'),(322,'20261119100041844','2026-11-19 15:22:00'),(323,'20261119100041845','2026-11-19 15:22:30'),(324,'20261119100041846','2026-11-19 15:23:00'),(325,'20261119100041847','2026-11-19 15:23:30'),(326,'20261119100041848','2026-11-19 15:24:01'),(327,'20261119100041849','2026-11-19 15:24:31'),(328,'20261119100041850','2026-11-19 15:25:00'),(329,'20261119100041851','2026-11-19 15:25:31'),(330,'20261119100041852','2026-11-19 15:26:00'),(331,'20261119100041853','2026-11-19 15:26:30'),(332,'20261119100041854','2026-11-19 15:27:00'),(333,'20261119100041855','2026-11-19 15:27:31'),(334,'20261119100041856','2026-11-19 15:28:00'),(335,'20261119100041857','2026-11-19 15:28:30'),(336,'20261119100041858','2026-11-19 15:29:00'),(337,'20261119100041859','2026-11-19 15:29:30'),(338,'20261119100041860','2026-11-19 15:30:01'),(339,'20261119100041861','2026-11-19 15:30:31'),(340,'20261119100041862','2026-11-19 15:31:00'),(341,'20261119100041863','2026-11-19 15:31:30'),(342,'20261119100041864','2026-11-19 15:32:01'),(343,'20261119100041865','2026-11-19 15:32:31'),(344,'20261119100041866','2026-11-19 15:33:00'),(345,'20261119100041867','2026-11-19 15:33:30'),(346,'20261119100041868','2026-11-19 15:34:01'),(347,'20261119100041869','2026-11-19 15:34:31'),(348,'20261119100041870','2026-11-19 15:35:00'),(349,'20261119100041871','2026-11-19 15:35:21'),(350,'20261119100041872','2026-11-19 15:35:48'),(351,'20261119100041873','2026-11-19 15:36:19'),(352,'20261119100041874','2026-11-19 15:37:01'),(353,'20261119100041875','2026-11-19 15:37:31'),(354,'20261119100041876','2026-11-19 15:38:00'),(355,'20261119100041877','2026-11-19 15:38:30'),(356,'20261119100041878','2026-11-19 15:38:52'),(357,'20261119100041879','2026-11-19 15:39:22'),(358,'20261119100042129','2026-11-19 17:44:14'),(359,'20261119100042130','2026-11-19 17:44:44'),(360,'20261119100042131','2026-11-19 17:44:59'),(361,'20261119100042132','2026-11-19 17:45:29'),(362,'20261119100042133','2026-11-19 17:45:45'),(363,'20261119100042134','2026-11-19 17:46:16'),(364,'20261119100042135','2026-11-19 17:46:31'),(365,'20261119100042136','2026-11-19 17:47:01'),(366,'20261119100042137','2026-11-19 17:47:17'),(367,'20261119100042138','2026-11-19 17:47:47'),(368,'20261119100042139','2026-11-19 17:48:03'),(369,'20261119100042140','2026-11-19 17:48:33'),(370,'20261119100042141','2026-11-19 17:48:49'),(371,'20261119100042142','2026-11-19 17:49:19'),(372,'20261119100042143','2026-11-19 17:49:35'),(373,'20261119100042144','2026-11-19 17:50:05'),(374,'20261119100042145','2026-11-19 17:50:20'),(375,'20261119100042146','2026-11-19 17:50:51'),(376,'20261119100042147','2026-11-19 17:51:07'),(377,'20261119100042148','2026-11-19 17:51:37'),(378,'20261119100042144','2026-11-19 17:51:53'),(379,'20261119100042145','2026-11-19 17:52:23'),(380,'20261119100042146','2026-11-19 17:52:39'),(381,'20261119100042147','2026-11-19 17:53:09'),(382,'20261119100042148','2026-11-19 17:53:24'),(383,'20261119100042149','2026-11-19 17:53:54'),(384,'20261119100042150','2026-11-19 17:54:10'),(385,'20261119100042151','2026-11-19 17:54:40'),(386,'20261119100042152','2026-11-19 17:54:56'),(387,'20261119100042153','2026-11-19 17:55:26'),(388,'20261119100042154','2026-11-19 17:55:42'),(389,'20261119100042155','2026-11-19 17:56:12'),(390,'20261119100042156','2026-11-19 17:56:28'),(391,'20261119100042157','2026-11-19 17:56:58'),(392,'20261119100042158','2026-11-19 17:57:13'),(393,'20261119100042159','2026-11-19 17:57:43'),(394,'20261119100042160','2026-11-19 17:57:59'),(395,'20261119100042161','2026-11-19 17:58:29'),(396,'20261119100042162','2026-11-19 17:58:45'),(397,'20261119100042163','2026-11-19 17:59:15'),(398,'20261119100042164','2026-11-19 17:59:31'),(399,'20261119100042165','2026-11-19 18:00:01'),(400,'20261119100042161','2026-11-19 18:00:16'),(401,'20261119100042162','2026-11-19 18:00:46'),(402,'20261119100042163','2026-11-19 18:01:02'),(403,'20261119100042164','2026-11-19 18:01:32'),(404,'20261119100042165','2026-11-19 18:01:47'),(405,'20261119100042166','2026-11-19 18:02:17'),(406,'20261119100042167','2026-11-19 18:02:33'),(407,'20261119100042168','2026-11-19 18:03:03'),(408,'20261119100042169','2026-11-19 18:03:19'),(409,'20261119100042170','2026-11-19 18:03:49'),(410,'20261119100042171','2026-11-19 18:04:05'),(411,'20261119100042172','2026-11-19 18:04:35'),(412,'20261119100042173','2026-11-19 18:04:50'),(413,'20261119100042174','2026-11-19 18:05:20'),(414,'20261119100042175','2026-11-19 18:05:36'),(415,'20261119100042176','2026-11-19 18:06:06'),(416,'20261119100042177','2026-11-19 18:06:22'),(417,'20261119100042178','2026-11-19 18:06:52'),(418,'20261119100042179','2026-11-19 18:07:08'),(419,'20261119100042180','2026-11-19 18:07:38'),(420,'20261119100042176','2026-11-19 18:07:53'),(421,'20261119100042177','2026-11-19 18:08:23'),(422,'20261119100042178','2026-11-19 18:08:39'),(423,'20261119100042179','2026-11-19 18:09:09'),(424,'20261119100042180','2026-11-19 18:09:25'),(425,'20261119100042181','2026-11-19 18:09:55'),(426,'20261119100042182','2026-11-19 18:10:11'),(427,'20261119100042183','2026-11-19 18:10:41'),(428,'20261119100042184','2026-11-19 18:10:57'),(429,'20261119100042185','2026-11-19 18:11:27'),(430,'20261119100042186','2026-11-19 18:11:43'),(431,'20261119100042187','2026-11-19 18:12:13'),(432,'20261119100042188','2026-11-19 18:12:29'),(433,'20261119100042189','2026-11-19 18:12:59'),(434,'20261119100042190','2026-11-19 18:13:15'),(435,'20261119100042191','2026-11-19 18:13:45'),(436,'20261119100042192','2026-11-19 18:14:00'),(437,'20261119100042193','2026-11-19 18:14:30'),(438,'20261119100042194','2026-11-19 18:14:46'),(439,'20261119100042195','2026-11-19 18:15:16'),(440,'20261119100042196','2026-11-19 18:15:32'),(441,'20261119100042197','2026-11-19 18:16:02'),(442,'20261119100042193','2026-11-19 18:16:18'),(443,'20261119100042194','2026-11-19 18:16:48'),(444,'20261119100042195','2026-11-19 18:17:04'),(445,'20261119100042196','2026-11-19 18:17:34'),(446,'20261119100042197','2026-11-19 18:17:50'),(447,'20261119100042198','2026-11-19 18:18:20'),(448,'20261119100042199','2026-11-19 18:18:35'),(449,'20261119100042200','2026-11-19 18:19:05'),(450,'20261119100042201','2026-11-19 18:19:21'),(451,'20261119100042202','2026-11-19 18:19:51'),(452,'20261119100042203','2026-11-19 18:20:07'),(453,'20261119100042204','2026-11-19 18:20:37'),(454,'20261119100042205','2026-11-19 18:20:53'),(455,'20261119100042206','2026-11-19 18:21:24'),(456,'20261119100042207','2026-11-19 18:21:39'),(457,'20261119100042208','2026-11-19 18:22:09'),(458,'20261119100042209','2026-11-19 18:22:25'),(459,'20261119100042210','2026-11-19 18:22:55'),(460,'20261119100042211','2026-11-19 18:23:11'),(461,'20261119100042212','2026-11-19 18:23:41'),(462,'20261119100042208','2026-11-19 18:23:56'),(463,'20261119100042209','2026-11-19 18:24:26'),(464,'20261119100042210','2026-11-19 18:24:42'),(465,'20261119100042211','2026-11-19 18:25:12'),(466,'20261119100042212','2026-11-19 18:25:28'),(467,'20261119100042213','2026-11-19 18:25:58'),(468,'20261119100042214','2026-11-19 18:26:14'),(469,'20261119100042215','2026-11-19 18:26:44'),(470,'20261119100042216','2026-11-19 18:27:00'),(471,'20261119100042217','2026-11-19 18:27:30'),(472,'20261119100042218','2026-11-19 18:27:45'),(473,'20261119100042219','2026-11-19 18:28:16'),(474,'20261119100042220','2026-11-19 18:28:31'),(475,'20261119100042221','2026-11-19 18:29:01'),(476,'20261119100042222','2026-11-19 18:29:17'),(477,'20261119100042223','2026-11-19 18:29:47'),(478,'20261119100042224','2026-11-19 18:30:03'),(479,'20261119100042225','2026-11-19 18:30:32'),(480,'20261119100042226','2026-11-19 18:30:48'),(481,'20261119100042227','2026-11-19 18:31:18'),(482,'20261119100042228','2026-11-19 18:31:34'),(483,'20261119100042229','2026-11-19 18:32:04'),(484,'20261119100042225','2026-11-19 18:32:19'),(485,'20261119100042226','2026-11-19 18:32:49'),(486,'20261119100042227','2026-11-19 18:33:05'),(487,'20261119100042228','2026-11-19 18:33:35'),(488,'20261119100042229','2026-11-19 18:33:51'),(489,'20261119100042230','2026-11-19 18:34:21'),(490,'20261119100042231','2026-11-19 18:34:37'),(491,'20261119100042232','2026-11-19 18:35:07'),(492,'20261119100042233','2026-11-19 18:35:22'),(493,'20261119100042234','2026-11-19 18:35:53'),(494,'20261119100042235','2026-11-19 18:36:08'),(495,'20261119100042236','2026-11-19 18:36:39'),(496,'20261119100042237','2026-11-19 18:36:54'),(497,'20261119100042238','2026-11-19 18:37:25'),(498,'20261119100042239','2026-11-19 18:37:40'),(499,'20261119100042240','2026-11-19 18:38:10'),(500,'20261119100042241','2026-11-19 18:38:26'),(501,'20261119100042242','2026-11-19 18:38:56'),(502,'20261119100042243','2026-11-19 18:39:11'),(503,'20261119100042244','2026-11-19 18:39:42'),(504,'20261119100042240','2026-11-19 18:39:57'),(505,'20261119100042241','2026-11-19 18:40:28'),(506,'20261119100042242','2026-11-19 18:40:43'),(507,'20261119100042243','2026-11-19 18:41:14'),(508,'20261119100042244','2026-11-19 18:41:30'),(509,'20261119100042245','2026-11-19 18:42:00'),(510,'20261119100042246','2026-11-19 18:42:15'),(511,'20261119100042247','2026-11-19 18:42:45'),(512,'20261119100042248','2026-11-19 18:43:01'),(513,'20261119100042249','2026-11-19 18:43:31'),(514,'20261119100042250','2026-11-19 18:43:47'),(515,'20261119100042251','2026-11-19 18:44:17'),(516,'20261119100042252','2026-11-19 18:44:32'),(517,'20261119100042253','2026-11-19 18:45:02'),(518,'20261119100042254','2026-11-19 18:45:18'),(519,'20261119100042255','2026-11-19 18:45:49'),(520,'20261119100042256','2026-11-19 18:46:04'),(521,'20261119100042257','2026-11-19 18:46:34'),(522,'20261119100042258','2026-11-19 18:46:50'),(523,'20261119100042259','2026-11-19 18:47:20'),(524,'20261119100042260','2026-11-19 18:47:36'),(525,'20261119100042261','2026-11-19 18:48:06'),(526,'20261119100042257','2026-11-19 18:48:21'),(527,'20261119100042258','2026-11-19 18:48:52'),(528,'20261119100042259','2026-11-19 18:49:07'),(529,'20261119100042260','2026-11-19 18:49:37'),(530,'20261119100042261','2026-11-19 18:49:53'),(531,'20261119100042262','2026-11-19 18:50:23'),(532,'20261119100042263','2026-11-19 18:50:39'),(533,'20261119100042264','2026-11-19 18:51:09'),(534,'20261119100042265','2026-11-19 18:51:25'),(535,'20261119100042266','2026-11-19 18:51:55'),(536,'20261119100042267','2026-11-19 18:52:11'),(537,'20261119100042268','2026-11-19 18:52:41'),(538,'20261119100042269','2026-11-19 18:52:56'),(539,'20261119100042270','2026-11-19 18:53:26'),(540,'20261119100042271','2026-11-19 18:53:42'),(541,'20261119100042272','2026-11-19 18:54:12'),(542,'20261119100042273','2026-11-19 18:54:28'),(543,'20261119100042274','2026-11-19 18:54:58'),(544,'20261119100042275','2026-11-19 18:55:14'),(545,'20261119100042276','2026-11-19 18:55:44'),(546,'20261119100042277','2026-11-19 18:56:01'),(547,'20261119100042278','2026-11-19 18:56:30'),(548,'20261119100042274','2026-11-19 18:56:45'),(549,'20261119100042275','2026-11-19 18:57:15'),(550,'20261119100042276','2026-11-19 18:57:31'),(551,'20261119100042277','2026-11-19 18:58:01'),(552,'20261119100042278','2026-11-19 18:58:17'),(553,'20261119100042279','2026-11-19 18:58:47'),(554,'20261119100042280','2026-11-19 18:59:03'),(555,'20261119100042281','2026-11-19 18:59:33'),(556,'20261119100042282','2026-11-19 18:59:48'),(557,'20261119100042283','2026-11-19 19:00:18'),(558,'20261119100042284','2026-11-19 19:00:34'),(559,'20261119100042285','2026-11-19 19:01:04'),(560,'20261119100042286','2026-11-19 19:01:19'),(561,'20261119100042287','2026-11-19 19:01:49'),(562,'20261119100042288','2026-11-19 19:02:05'),(563,'20261119100042289','2026-11-19 19:02:35'),(564,'20261119100042290','2026-11-19 19:02:51'),(565,'20261119100042291','2026-11-19 19:03:21'),(566,'20261119100042292','2026-11-19 19:03:36'),(567,'20261119100042293','2026-11-19 19:04:07');
/*!40000 ALTER TABLE `wingo_periods_30sec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_periods_3min`
--

DROP TABLE IF EXISTS `wingo_periods_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_periods_3min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 COMMENT='WinGo 3-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_3min`
--

LOCK TABLES `wingo_periods_3min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_3min` DISABLE KEYS */;
INSERT INTO `wingo_periods_3min` VALUES (7,'20261119100020252','2026-11-19 12:33:09'),(8,'20261119100020253','2026-11-19 12:45:00'),(9,'20261119100020254','2026-11-19 12:48:01'),(10,'20261119100020255','2026-11-19 12:51:01'),(11,'20261119100020256','2026-11-19 12:54:00'),(12,'20261119100020257','2026-11-19 12:57:00'),(13,'20261119100020258','2026-11-19 13:00:00'),(14,'20261119100020259','2026-11-19 13:03:00'),(15,'20261119100020260','2026-11-19 13:06:00'),(16,'20261119100020261','2026-11-19 13:09:00'),(17,'20261119100020262','2026-11-19 13:12:00'),(18,'20261119100020263','2026-11-19 13:15:01'),(19,'20261119100020264','2026-11-19 13:18:00'),(20,'20261119100020265','2026-11-19 13:21:01'),(21,'20261119100020266','2026-11-19 13:24:00'),(22,'20261119100020267','2026-11-19 13:27:01'),(23,'20261119100020268','2026-11-19 13:30:00'),(24,'20261119100020269','2026-11-19 13:33:00'),(25,'20261119100020270','2026-11-19 13:36:01'),(26,'20261119100020271','2026-11-19 13:39:00'),(27,'20261119100020272','2026-11-19 13:42:00'),(28,'20261119100020273','2026-11-19 13:45:00'),(29,'20261119100020274','2026-11-19 13:48:00'),(30,'20261119100020275','2026-11-19 13:51:01'),(31,'20261119100020276','2026-11-19 13:54:00'),(32,'20261119100020277','2026-11-19 13:57:01'),(33,'20261119100020278','2026-11-19 14:00:01'),(34,'20261119100020279','2026-11-19 14:03:00'),(35,'20261119100020280','2026-11-19 14:06:01'),(36,'20261119100020281','2026-11-19 14:09:00'),(37,'20261119100020282','2026-11-19 14:12:01'),(38,'20261119100020283','2026-11-19 14:15:00'),(39,'20261119100020284','2026-11-19 14:18:01'),(40,'20261119100020285','2026-11-19 14:21:01'),(41,'20261119100020286','2026-11-19 14:24:00'),(42,'20261119100020287','2026-11-19 14:27:01'),(43,'20261119100020288','2026-11-19 14:33:00'),(44,'20261119100020289','2026-11-19 14:36:01'),(45,'20261119100020290','2026-11-19 14:39:00'),(46,'20261119100020291','2026-11-19 14:42:00'),(47,'20261119100020292','2026-11-19 14:45:01'),(48,'20261119100020293','2026-11-19 14:48:00'),(49,'20261119100020294','2026-11-19 14:51:00'),(50,'20261119100020295','2026-11-19 14:54:00'),(51,'20261119100020296','2026-11-19 14:57:01'),(52,'20261119100020297','2026-11-19 15:00:00'),(53,'20261119100020298','2026-11-19 15:03:00'),(54,'20261119100020299','2026-11-19 15:06:00'),(55,'20261119100020300','2026-11-19 15:09:01'),(56,'20261119100020301','2026-11-19 15:12:00'),(57,'20261119100020302','2026-11-19 15:15:01'),(58,'20261119100020303','2026-11-19 15:18:01'),(59,'20261119100020304','2026-11-19 15:21:01'),(60,'20261119100020305','2026-11-19 15:24:01'),(61,'20261119100020306','2026-11-19 15:27:00'),(62,'20261119100020307','2026-11-19 15:30:01'),(63,'20261119100020308','2026-11-19 15:33:00'),(64,'20261119100020309','2026-11-19 17:45:45'),(65,'20261119100020310','2026-11-19 17:48:03'),(66,'20261119100020311','2026-11-19 17:48:49'),(67,'20261119100020312','2026-11-19 17:51:07'),(68,'20261119100020313','2026-11-19 17:51:53'),(69,'20261119100020314','2026-11-19 17:54:10'),(70,'20261119100020315','2026-11-19 17:54:56'),(71,'20261119100020316','2026-11-19 17:57:13'),(72,'20261119100020317','2026-11-19 17:57:59'),(73,'20261119100020318','2026-11-19 18:00:16'),(74,'20261119100020319','2026-11-19 18:03:19'),(75,'20261119100020320','2026-11-19 18:06:22'),(76,'20261119100020321','2026-11-19 18:09:25'),(77,'20261119100020322','2026-11-19 18:12:29'),(78,'20261119100020323','2026-11-19 18:15:32'),(79,'20261119100020324','2026-11-19 18:18:35'),(80,'20261119100020325','2026-11-19 18:21:39'),(81,'20261119100020326','2026-11-19 18:24:42'),(82,'20261119100020327','2026-11-19 18:27:45'),(83,'20261119100020328','2026-11-19 18:30:03'),(84,'20261119100020329','2026-11-19 18:30:48'),(85,'20261119100020330','2026-11-19 18:33:05'),(86,'20261119100020331','2026-11-19 18:33:51'),(87,'20261119100020332','2026-11-19 18:36:08'),(88,'20261119100020333','2026-11-19 18:36:54'),(89,'20261119100020334','2026-11-19 18:39:11'),(90,'20261119100020335','2026-11-19 18:39:57'),(91,'20261119100020336','2026-11-19 18:42:15'),(92,'20261119100020337','2026-11-19 18:45:18'),(93,'20261119100020338','2026-11-19 18:48:21'),(94,'20261119100020339','2026-11-19 18:51:25'),(95,'20261119100020340','2026-11-19 18:54:28'),(96,'20261119100020341','2026-11-19 18:57:31'),(97,'20261119100020342','2026-11-19 19:00:34'),(98,'20261119100020343','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `wingo_periods_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_periods_5min`
--

DROP TABLE IF EXISTS `wingo_periods_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_periods_5min` (
  `kramasankhye` int NOT NULL AUTO_INCREMENT,
  `atadaaidi` varchar(500) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kramasankhye`),
  KEY `kramasankhye_atadaaidi` (`atadaaidi`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COMMENT='WinGo 5-min: period/round registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_periods_5min`
--

LOCK TABLES `wingo_periods_5min` WRITE;
/*!40000 ALTER TABLE `wingo_periods_5min` DISABLE KEYS */;
INSERT INTO `wingo_periods_5min` VALUES (3,'20261119100030154','2026-11-19 12:45:00'),(4,'20261119100030155','2026-11-19 12:50:00'),(5,'20261119100030156','2026-11-19 12:55:00'),(6,'20261119100030157','2026-11-19 13:00:01'),(7,'20261119100030158','2026-11-19 13:05:00'),(8,'20261119100030159','2026-11-19 13:10:00'),(9,'20261119100030160','2026-11-19 13:15:01'),(10,'20261119100030161','2026-11-19 13:20:00'),(11,'20261119100030162','2026-11-19 13:25:01'),(12,'20261119100030163','2026-11-19 13:30:00'),(13,'20261119100030164','2026-11-19 13:35:00'),(14,'20261119100030165','2026-11-19 13:40:01'),(15,'20261119100030166','2026-11-19 13:45:01'),(16,'20261119100030167','2026-11-19 13:50:01'),(17,'20261119100030168','2026-11-19 13:55:01'),(18,'20261119100030169','2026-11-19 14:00:02'),(19,'20261119100030170','2026-11-19 14:05:00'),(20,'20261119100030171','2026-11-19 14:10:00'),(21,'20261119100030172','2026-11-19 14:15:00'),(22,'20261119100030173','2026-11-19 14:20:01'),(23,'20261119100030174','2026-11-19 14:25:01'),(24,'20261119100030175','2026-11-19 14:35:00'),(25,'20261119100030176','2026-11-19 14:40:00'),(26,'20261119100030177','2026-11-19 14:45:01'),(27,'20261119100030178','2026-11-19 14:50:00'),(28,'20261119100030179','2026-11-19 14:55:01'),(29,'20261119100030180','2026-11-19 15:00:00'),(30,'20261119100030181','2026-11-19 15:05:00'),(31,'20261119100030182','2026-11-19 15:10:00'),(32,'20261119100030183','2026-11-19 15:15:01'),(33,'20261119100030184','2026-11-19 15:20:01'),(34,'20261119100030185','2026-11-19 15:25:00'),(35,'20261119100030186','2026-11-19 15:30:01'),(36,'20261119100030187','2026-11-19 15:35:00'),(37,'20261119100030188','2026-11-19 15:35:21'),(38,'20261119100030189','2026-11-19 15:35:48'),(39,'20261119100030190','2026-11-19 17:45:45'),(40,'20261119100030191','2026-11-19 17:50:20'),(41,'20261119100030192','2026-11-19 17:55:42'),(42,'20261119100030193','2026-11-19 18:00:17'),(43,'20261119100030194','2026-11-19 18:05:36'),(44,'20261119100030195','2026-11-19 18:10:11'),(45,'20261119100030196','2026-11-19 18:10:57'),(46,'20261119100030197','2026-11-19 18:15:32'),(47,'20261119100030198','2026-11-19 18:20:07'),(48,'20261119100030199','2026-11-19 18:20:53'),(49,'20261119100030200','2026-11-19 18:25:28'),(50,'20261119100030201','2026-11-19 18:30:03'),(51,'20261119100030202','2026-11-19 18:30:48'),(52,'20261119100030203','2026-11-19 18:35:22'),(53,'20261119100030204','2026-11-19 18:40:43'),(54,'20261119100030205','2026-11-19 18:45:18'),(55,'20261119100030206','2026-11-19 18:50:39'),(56,'20261119100030207','2026-11-19 18:55:14'),(57,'20261119100030208','2026-11-19 18:56:01'),(58,'20261119100030209','2026-11-19 19:00:34');
/*!40000 ALTER TABLE `wingo_periods_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_results_10min`
--

DROP TABLE IF EXISTS `wingo_results_10min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_results_10min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COMMENT='WinGo 10-min: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_10min`
--

LOCK TABLES `wingo_results_10min` WRITE;
/*!40000 ALTER TABLE `wingo_results_10min` DISABLE KEYS */;
INSERT INTO `wingo_results_10min` VALUES (1,'20261119100051540',32825,5,'green,violet','shonu','2026-11-19 13:00:01'),(2,'20261119100051541',86373,3,'green','shonu','2026-11-19 13:10:00'),(3,'20261119100051542',88933,3,'green','shonu','2026-11-19 13:20:01'),(4,'20261119100051543',68883,3,'green','shonu','2026-11-19 13:30:01'),(5,'20261119100051544',27916,6,'red','shonu','2026-11-19 13:40:01'),(6,'20261119100051545',17959,9,'green','shonu','2026-11-19 13:50:01'),(7,'20261119100051546',33494,4,'red','shonu','2026-11-19 14:00:02'),(8,'20261119100051547',34885,5,'green,violet','shonu','2026-11-19 14:10:00'),(9,'20261119100051548',55739,9,'green','shonu','2026-11-19 14:20:01'),(10,'20261119100051549',17321,1,'green','shonu','2026-11-19 14:40:00'),(11,'20261119100051550',99932,2,'red','shonu','2026-11-19 14:50:00'),(12,'20261119100051551',17849,9,'green','shonu','2026-11-19 15:00:01'),(13,'20261119100051552',85246,6,'red','shonu','2026-11-19 15:10:00'),(14,'20261119100051553',47581,1,'green','shonu','2026-11-19 15:20:01'),(15,'20261119100051554',99937,7,'green','shonu','2026-11-19 15:30:02'),(16,'20261119100051555',19334,4,'red','shonu','2026-11-19 17:50:21'),(17,'20261119100051556',56725,5,'green,violet','shonu','2026-11-19 18:00:17'),(18,'20261119100051557',61486,6,'red','shonu','2026-11-19 18:10:11'),(19,'20261119100051558',26839,9,'green','shonu','2026-11-19 18:10:57'),(20,'20261119100051559',34232,2,'red','shonu','2026-11-19 18:20:07'),(21,'20261119100051560',44947,7,'green','shonu','2026-11-19 18:20:53'),(22,'20261119100051561',14975,5,'green,violet','shonu','2026-11-19 18:30:03'),(23,'20261119100051562',16510,0,'red,violet','shonu','2026-11-19 18:30:49'),(24,'20261119100051563',69369,9,'green','shonu','2026-11-19 18:40:44'),(25,'20261119100051564',43479,9,'green','shonu','2026-11-19 18:50:39'),(26,'20261119100051565',83611,1,'green','shonu','2026-11-19 19:00:35');
/*!40000 ALTER TABLE `wingo_results_10min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_results_1min`
--

DROP TABLE IF EXISTS `wingo_results_1min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_results_1min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=latin1 COMMENT='WinGo 1-min: published results per period (winning number + color)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_1min`
--

LOCK TABLES `wingo_results_1min` WRITE;
/*!40000 ALTER TABLE `wingo_results_1min` DISABLE KEYS */;
INSERT INTO `wingo_results_1min` VALUES (11,'20261119100010752',27840,0,'red,violet','uncensored','2026-11-19 12:33:08'),(12,'20261119100010753',86250,0,'red,violet','uncensored','2026-11-19 12:34:23'),(13,'20261119100010754',99495,5,'green,violet','uncensored','2026-11-19 12:34:55'),(14,'20261119100010755',72212,2,'red','shonu','2026-11-19 12:44:01'),(15,'20261119100010756',19221,1,'green','shonu','2026-11-19 12:45:00'),(16,'20261119100010757',15959,9,'green','shonu','2026-11-19 12:46:00'),(17,'20261119100010758',92556,6,'red','shonu','2026-11-19 12:47:00'),(18,'20261119100010759',75885,5,'green,violet','shonu','2026-11-19 12:48:00'),(19,'20261119100010760',91254,4,'red','shonu','2026-11-19 12:49:00'),(20,'20261119100010761',45872,2,'red','shonu','2026-11-19 12:50:00'),(21,'20261119100010762',43628,8,'red','shonu','2026-11-19 12:51:00'),(22,'20261119100010763',12620,0,'red,violet','shonu','2026-11-19 12:52:00'),(23,'20261119100010764',14195,5,'green,violet','shonu','2026-11-19 12:53:00'),(24,'20261119100010765',92954,4,'red','shonu','2026-11-19 12:54:00'),(25,'20261119100010766',16361,1,'green','shonu','2026-11-19 12:55:00'),(26,'20261119100010767',26395,5,'green,violet','shonu','2026-11-19 12:56:00'),(27,'20261119100010768',91558,8,'red','shonu','2026-11-19 12:57:00'),(28,'20261119100010769',98188,8,'red','shonu','2026-11-19 12:58:00'),(29,'20261119100010770',79882,2,'red','shonu','2026-11-19 12:59:00'),(30,'20261119100010771',75651,1,'green','shonu','2026-11-19 13:00:00'),(31,'20261119100010772',13256,6,'red','shonu','2026-11-19 13:01:00'),(32,'20261119100010773',43581,1,'green','shonu','2026-11-19 13:02:00'),(33,'20261119100010774',68523,3,'green','shonu','2026-11-19 13:03:00'),(34,'20261119100010775',52692,2,'red','shonu','2026-11-19 13:04:00'),(35,'20261119100010776',83430,0,'red,violet','shonu','2026-11-19 13:05:00'),(36,'20261119100010777',15163,3,'green','shonu','2026-11-19 13:06:00'),(37,'20261119100010778',54557,7,'green','shonu','2026-11-19 13:07:00'),(38,'20261119100010779',67834,4,'red','shonu','2026-11-19 13:08:00'),(39,'20261119100010780',88111,1,'green','shonu','2026-11-19 13:09:00'),(40,'20261119100010781',96483,3,'green','shonu','2026-11-19 13:10:00'),(41,'20261119100010782',28212,2,'red','shonu','2026-11-19 13:11:00'),(42,'20261119100010783',63799,9,'green','shonu','2026-11-19 13:12:00'),(43,'20261119100010784',25115,5,'green,violet','shonu','2026-11-19 13:13:00'),(44,'20261119100010785',79533,3,'green','shonu','2026-11-19 13:14:00'),(45,'20261119100010786',93583,3,'green','shonu','2026-11-19 13:15:00'),(46,'20261119100010787',37943,3,'green','shonu','2026-11-19 13:16:00'),(47,'20261119100010788',48999,9,'green','shonu','2026-11-19 13:17:00'),(48,'20261119100010789',59216,6,'red','shonu','2026-11-19 13:18:00'),(49,'20261119100010790',64452,2,'red','shonu','2026-11-19 13:19:00'),(50,'20261119100010791',71819,9,'green','shonu','2026-11-19 13:20:00'),(51,'20261119100010792',62695,5,'green,violet','shonu','2026-11-19 13:21:00'),(52,'20261119100010793',77810,0,'red,violet','shonu','2026-11-19 13:22:00'),(53,'20261119100010794',85384,4,'red','shonu','2026-11-19 13:23:00'),(54,'20261119100010795',23392,2,'red','shonu','2026-11-19 13:24:00'),(55,'20261119100010796',72253,3,'green','shonu','2026-11-19 13:25:00'),(56,'20261119100010797',25944,4,'red','shonu','2026-11-19 13:26:00'),(57,'20261119100010798',43666,6,'red','shonu','2026-11-19 13:27:00'),(58,'20261119100010799',45388,8,'red','shonu','2026-11-19 13:28:00'),(59,'20261119100010800',91568,8,'red','shonu','2026-11-19 13:29:00'),(60,'20261119100010801',93287,7,'green','shonu','2026-11-19 13:30:00'),(61,'20261119100010802',65694,4,'red','shonu','2026-11-19 13:31:00'),(62,'20261119100010803',64284,4,'red','shonu','2026-11-19 13:32:00'),(63,'20261119100010804',21256,6,'red','shonu','2026-11-19 13:33:00'),(64,'20261119100010805',34112,2,'red','shonu','2026-11-19 13:34:00'),(65,'20261119100010806',63798,8,'red','shonu','2026-11-19 13:35:00'),(66,'20261119100010807',82635,5,'green,violet','shonu','2026-11-19 13:36:00'),(67,'20261119100010808',42982,2,'red','shonu','2026-11-19 13:37:00'),(68,'20261119100010809',97554,4,'red','shonu','2026-11-19 13:38:00'),(69,'20261119100010810',69253,3,'green','shonu','2026-11-19 13:39:00'),(70,'20261119100010811',51744,4,'red','shonu','2026-11-19 13:40:00'),(71,'20261119100010812',94718,8,'red','shonu','2026-11-19 13:41:00'),(72,'20261119100010813',28782,2,'red','shonu','2026-11-19 13:42:00'),(73,'20261119100010814',77853,3,'green','shonu','2026-11-19 13:43:00'),(74,'20261119100010815',49127,7,'green','shonu','2026-11-19 13:44:00'),(75,'20261119100010816',29569,9,'green','shonu','2026-11-19 13:45:00'),(76,'20261119100010817',62768,8,'red','shonu','2026-11-19 13:46:00'),(77,'20261119100010818',53745,5,'green,violet','shonu','2026-11-19 13:47:00'),(78,'20261119100010819',94761,1,'green','shonu','2026-11-19 13:48:00'),(79,'20261119100010820',32917,7,'green','shonu','2026-11-19 13:49:00'),(80,'20261119100010821',36282,2,'red','shonu','2026-11-19 13:50:00'),(81,'20261119100010822',27511,1,'green','shonu','2026-11-19 13:51:00'),(82,'20261119100010823',13420,0,'red,violet','shonu','2026-11-19 13:52:00'),(83,'20261119100010824',53323,3,'green','shonu','2026-11-19 13:53:00'),(84,'20261119100010825',27570,0,'red,violet','shonu','2026-11-19 13:54:00'),(85,'20261119100010826',87278,8,'red','shonu','2026-11-19 13:55:00'),(86,'20261119100010827',75793,3,'green','shonu','2026-11-19 13:56:00'),(87,'20261119100010828',24266,6,'red','shonu','2026-11-19 13:57:00'),(88,'20261119100010829',39898,8,'red','shonu','2026-11-19 13:58:00'),(89,'20261119100010830',28532,2,'red','shonu','2026-11-19 13:59:00'),(90,'20261119100010831',77391,1,'green','shonu','2026-11-19 14:00:00'),(91,'20261119100010832',34797,7,'green','shonu','2026-11-19 14:01:00'),(92,'20261119100010833',22935,5,'green,violet','shonu','2026-11-19 14:02:00'),(93,'20261119100010834',26629,9,'green','shonu','2026-11-19 14:03:00'),(94,'20261119100010835',58751,1,'green','shonu','2026-11-19 14:04:00'),(95,'20261119100010836',27235,5,'green,violet','shonu','2026-11-19 14:05:00'),(96,'20261119100010837',11457,7,'green','shonu','2026-11-19 14:06:00'),(97,'20261119100010838',83870,0,'red,violet','shonu','2026-11-19 14:07:00'),(98,'20261119100010839',28426,6,'red','shonu','2026-11-19 14:08:00'),(99,'20261119100010840',94191,1,'green','shonu','2026-11-19 14:09:00'),(100,'20261119100010841',19274,4,'red','shonu','2026-11-19 14:10:00'),(101,'20261119100010842',21588,8,'red','shonu','2026-11-19 14:11:00'),(102,'20261119100010843',87443,3,'green','shonu','2026-11-19 14:12:00'),(103,'20261119100010844',36592,2,'red','shonu','2026-11-19 14:13:00'),(104,'20261119100010845',98668,8,'red','shonu','2026-11-19 14:14:00'),(105,'20261119100010846',89797,7,'green','shonu','2026-11-19 14:15:00'),(106,'20261119100010847',78665,5,'green,violet','shonu','2026-11-19 14:16:00'),(107,'20261119100010848',83630,0,'red,violet','shonu','2026-11-19 14:17:00'),(108,'20261119100010849',12355,5,'green,violet','shonu','2026-11-19 14:18:00'),(109,'20261119100010850',45729,9,'green','shonu','2026-11-19 14:19:00'),(110,'20261119100010851',67478,8,'red','shonu','2026-11-19 14:20:00'),(111,'20261119100010852',14238,8,'red','shonu','2026-11-19 14:21:00'),(112,'20261119100010853',88852,2,'red','shonu','2026-11-19 14:22:00'),(113,'20261119100010854',56927,7,'green','shonu','2026-11-19 14:23:00'),(114,'20261119100010855',28767,7,'green','shonu','2026-11-19 14:24:00'),(115,'20261119100010856',24139,9,'green','shonu','2026-11-19 14:25:00'),(116,'20261119100010857',14482,2,'red','shonu','2026-11-19 14:26:00'),(117,'20261119100010858',87376,6,'red','shonu','2026-11-19 14:27:00'),(118,'20261119100010859',66675,5,'green,violet','shonu','2026-11-19 14:28:00'),(119,'20261119100010860',84129,9,'green','shonu','2026-11-19 14:29:00'),(120,'20261119100010861',55665,5,'green,violet','shonu','2026-11-19 14:29:04'),(121,'20261119100010862',65215,5,'green,violet','shonu','2026-11-19 14:29:11'),(122,'20261119100010863',39672,2,'red','shonu','2026-11-19 14:29:23'),(123,'20261119100010864',36612,2,'red','shonu','2026-11-19 14:30:00'),(124,'20261119100010865',54768,8,'red','shonu','2026-11-19 14:31:00'),(125,'20261119100010866',37864,4,'red','shonu','2026-11-19 14:32:00'),(126,'20261119100010867',47556,6,'red','shonu','2026-11-19 14:33:00'),(127,'20261119100010868',89334,4,'red','shonu','2026-11-19 14:34:00'),(128,'20261119100010869',49875,5,'green,violet','shonu','2026-11-19 14:35:00'),(129,'20261119100010870',32945,5,'green,violet','shonu','2026-11-19 14:36:00'),(130,'20261119100010871',61480,0,'red,violet','shonu','2026-11-19 14:37:00'),(131,'20261119100010872',22651,1,'green','shonu','2026-11-19 14:38:00'),(132,'20261119100010873',59912,2,'red','shonu','2026-11-19 14:39:00'),(133,'20261119100010874',68419,9,'green','shonu','2026-11-19 14:40:00'),(134,'20261119100010875',52745,5,'green,violet','shonu','2026-11-19 14:41:00'),(135,'20261119100010876',55740,0,'red,violet','shonu','2026-11-19 14:42:00'),(136,'20261119100010877',23111,1,'green','shonu','2026-11-19 14:43:00'),(137,'20261119100010878',95329,9,'green','shonu','2026-11-19 14:44:00'),(138,'20261119100010879',18639,9,'green','shonu','2026-11-19 14:45:00'),(139,'20261119100010880',56867,7,'green','shonu','2026-11-19 14:46:00'),(140,'20261119100010881',41971,1,'green','shonu','2026-11-19 14:47:00'),(141,'20261119100010882',71555,5,'green,violet','shonu','2026-11-19 14:48:00'),(142,'20261119100010883',35566,6,'red','shonu','2026-11-19 14:49:00'),(143,'20261119100010884',49583,3,'green','shonu','2026-11-19 14:50:00'),(144,'20261119100010885',14354,4,'red','shonu','2026-11-19 14:51:00'),(145,'20261119100010886',15577,7,'green','shonu','2026-11-19 14:52:00'),(146,'20261119100010887',63865,5,'green,violet','shonu','2026-11-19 14:53:01'),(147,'20261119100010888',54233,3,'green','shonu','2026-11-19 14:54:00'),(148,'20261119100010889',93489,9,'green','shonu','2026-11-19 14:55:00'),(149,'20261119100010890',73242,2,'red','shonu','2026-11-19 14:56:00'),(150,'20261119100010891',42888,8,'red','shonu','2026-11-19 14:57:00'),(151,'20261119100010892',47927,7,'green','shonu','2026-11-19 14:58:00'),(152,'20261119100010893',89348,8,'red','shonu','2026-11-19 14:59:00'),(153,'20261119100010894',85695,5,'green,violet','shonu','2026-11-19 15:00:00'),(154,'20261119100010895',35954,4,'red','shonu','2026-11-19 15:01:00'),(155,'20261119100010896',32878,8,'red','shonu','2026-11-19 15:02:00'),(156,'20261119100010897',45941,1,'green','shonu','2026-11-19 15:03:00'),(157,'20261119100010898',68571,1,'green','shonu','2026-11-19 15:04:00'),(158,'20261119100010899',75913,3,'green','shonu','2026-11-19 15:05:00'),(159,'20261119100010900',58198,8,'red','shonu','2026-11-19 15:06:00'),(160,'20261119100010901',31516,6,'red','shonu','2026-11-19 15:07:00'),(161,'20261119100010902',95424,4,'red','shonu','2026-11-19 15:08:01'),(162,'20261119100010903',91544,4,'red','shonu','2026-11-19 15:09:00'),(163,'20261119100010904',47298,8,'red','shonu','2026-11-19 15:10:00'),(164,'20261119100010905',51816,6,'red','shonu','2026-11-19 15:11:00'),(165,'20261119100010906',16122,2,'red','shonu','2026-11-19 15:12:00'),(166,'20261119100010907',33652,2,'red','shonu','2026-11-19 15:13:00'),(167,'20261119100010908',53878,8,'red','shonu','2026-11-19 15:14:00'),(168,'20261119100010909',92897,7,'green','shonu','2026-11-19 15:15:00'),(169,'20261119100010910',69977,7,'green','shonu','2026-11-19 15:16:00'),(170,'20261119100010911',76188,8,'red','shonu','2026-11-19 15:17:00'),(171,'20261119100010912',83539,9,'green','shonu','2026-11-19 15:18:00'),(172,'20261119100010913',35680,0,'red,violet','shonu','2026-11-19 15:19:00'),(173,'20261119100010914',94484,4,'red','shonu','2026-11-19 15:20:00'),(174,'20261119100010915',97447,7,'green','shonu','2026-11-19 15:21:00'),(175,'20261119100010916',81396,6,'red','shonu','2026-11-19 15:22:00'),(176,'20261119100010917',71212,2,'red','shonu','2026-11-19 15:23:00'),(177,'20261119100010918',18797,7,'green','shonu','2026-11-19 15:24:00'),(178,'20261119100010919',27173,3,'green','shonu','2026-11-19 15:25:00'),(179,'20261119100010920',52845,5,'green,violet','shonu','2026-11-19 15:26:00'),(180,'20261119100010921',38737,7,'green','shonu','2026-11-19 15:27:00'),(181,'20261119100010922',82634,4,'red','shonu','2026-11-19 15:28:00'),(182,'20261119100010923',27247,7,'green','shonu','2026-11-19 15:29:00'),(183,'20261119100010924',43495,5,'green,violet','shonu','2026-11-19 15:30:00'),(184,'20261119100010925',39473,3,'green','shonu','2026-11-19 15:31:00'),(185,'20261119100010926',16673,3,'green','shonu','2026-11-19 15:32:00'),(186,'20261119100010927',36572,2,'red','shonu','2026-11-19 15:33:00'),(187,'20261119100010928',28772,2,'red','shonu','2026-11-19 15:34:00'),(188,'20261119100010929',31957,7,'green','shonu','2026-11-19 15:35:00'),(189,'20261119100010930',76820,0,'red,violet','uncensored','2026-11-19 15:35:03'),(190,'20261119100010931',85950,0,'red,violet','uncensored','2026-11-19 15:35:21'),(191,'20261119100010932',77625,5,'green,violet','uncensored','2026-11-19 15:35:48'),(192,'20261119100010933',89978,8,'red','shonu','2026-11-19 15:36:00'),(193,'20261119100010934',62499,9,'green','shonu','2026-11-19 15:37:00'),(194,'20261119100010935',44289,9,'green','shonu','2026-11-19 15:38:00'),(195,'20261119100010936',76243,3,'green','shonu','2026-11-19 15:38:51'),(196,'20261119100010937',62371,1,'green','shonu','2026-11-19 15:39:00'),(197,'20261119100010938',71465,5,'green,violet','shonu','2026-11-19 17:44:13'),(198,'20261119100010939',41729,9,'green','shonu','2026-11-19 17:44:59'),(199,'20261119100010940',53441,1,'green','shonu','2026-11-19 17:45:45'),(200,'20261119100010941',57727,7,'green','shonu','2026-11-19 17:46:31'),(201,'20261119100010942',71430,0,'red,violet','shonu','2026-11-19 17:47:17'),(202,'20261119100010943',54110,0,'red,violet','shonu','2026-11-19 17:48:03'),(203,'20261119100010944',69773,3,'green','shonu','2026-11-19 17:48:49'),(204,'20261119100010945',59390,0,'red,violet','shonu','2026-11-19 17:49:35'),(205,'20261119100010946',93153,3,'green','shonu','2026-11-19 17:50:20'),(206,'20261119100010947',74321,1,'green','shonu','2026-11-19 17:51:06'),(207,'20261119100010948',19748,8,'red','shonu','2026-11-19 17:51:52'),(208,'20261119100010949',89893,3,'green','shonu','2026-11-19 17:52:38'),(209,'20261119100010950',47918,8,'red','shonu','2026-11-19 17:53:24'),(210,'20261119100010951',92796,6,'red','shonu','2026-11-19 17:54:10'),(211,'20261119100010952',73463,3,'green','shonu','2026-11-19 17:54:55'),(212,'20261119100010953',84770,0,'red,violet','shonu','2026-11-19 17:55:41'),(213,'20261119100010954',35246,6,'red','shonu','2026-11-19 17:56:27'),(214,'20261119100010955',81393,3,'green','shonu','2026-11-19 17:57:13'),(215,'20261119100010956',99353,3,'green','shonu','2026-11-19 17:57:59'),(216,'20261119100010957',67358,8,'red','shonu','2026-11-19 17:58:45'),(217,'20261119100010958',35633,3,'green','shonu','2026-11-19 17:59:30'),(218,'20261119100010959',27159,9,'green','shonu','2026-11-19 18:00:16'),(219,'20261119100010960',83854,4,'red','shonu','2026-11-19 18:01:01'),(220,'20261119100010961',41317,7,'green','shonu','2026-11-19 18:01:47'),(221,'20261119100010962',23994,4,'red','shonu','2026-11-19 18:02:33'),(222,'20261119100010963',58137,7,'green','shonu','2026-11-19 18:03:19'),(223,'20261119100010964',68958,8,'red','shonu','2026-11-19 18:04:04'),(224,'20261119100010965',81469,9,'green','shonu','2026-11-19 18:04:50'),(225,'20261119100010966',25161,1,'green','shonu','2026-11-19 18:05:36'),(226,'20261119100010967',82535,5,'green,violet','shonu','2026-11-19 18:06:22'),(227,'20261119100010968',61499,9,'green','shonu','2026-11-19 18:07:08'),(228,'20261119100010969',28592,2,'red','shonu','2026-11-19 18:07:53'),(229,'20261119100010970',46742,2,'red','shonu','2026-11-19 18:08:39'),(230,'20261119100010971',39835,5,'green,violet','shonu','2026-11-19 18:09:25'),(231,'20261119100010972',34567,7,'green','shonu','2026-11-19 18:10:10'),(232,'20261119100010973',77121,1,'green','shonu','2026-11-19 18:10:57'),(233,'20261119100010974',11998,8,'red','shonu','2026-11-19 18:11:43'),(234,'20261119100010975',26681,1,'green','shonu','2026-11-19 18:12:29'),(235,'20261119100010976',49819,9,'green','shonu','2026-11-19 18:13:15'),(236,'20261119100010977',12966,6,'red','shonu','2026-11-19 18:14:00'),(237,'20261119100010978',18614,4,'red','shonu','2026-11-19 18:14:46'),(238,'20261119100010979',62440,0,'red,violet','shonu','2026-11-19 18:15:31'),(239,'20261119100010980',65554,4,'red','shonu','2026-11-19 18:16:18'),(240,'20261119100010981',49591,1,'green','shonu','2026-11-19 18:17:04'),(241,'20261119100010982',65579,9,'green','shonu','2026-11-19 18:17:49'),(242,'20261119100010983',97698,8,'red','shonu','2026-11-19 18:18:35'),(243,'20261119100010984',77321,1,'green','shonu','2026-11-19 18:19:21'),(244,'20261119100010985',33325,5,'green,violet','shonu','2026-11-19 18:20:06'),(245,'20261119100010986',27446,6,'red','shonu','2026-11-19 18:20:53'),(246,'20261119100010987',76121,1,'green','shonu','2026-11-19 18:21:39'),(247,'20261119100010988',74541,1,'green','shonu','2026-11-19 18:22:25'),(248,'20261119100010989',15378,8,'red','shonu','2026-11-19 18:23:10'),(249,'20261119100010990',14344,4,'red','shonu','2026-11-19 18:23:56'),(250,'20261119100010991',56989,9,'green','shonu','2026-11-19 18:24:42'),(251,'20261119100010992',28323,3,'green','shonu','2026-11-19 18:25:28'),(252,'20261119100010993',47440,0,'red,violet','shonu','2026-11-19 18:26:14'),(253,'20261119100010994',42750,0,'red,violet','shonu','2026-11-19 18:26:59'),(254,'20261119100010995',64233,3,'green','shonu','2026-11-19 18:27:45'),(255,'20261119100010996',45287,7,'green','shonu','2026-11-19 18:28:31'),(256,'20261119100010997',76210,0,'red,violet','shonu','2026-11-19 18:29:17'),(257,'20261119100010998',87366,6,'red','shonu','2026-11-19 18:30:02'),(258,'20261119100010999',36627,7,'green','shonu','2026-11-19 18:30:48'),(259,'20261119100011000',76387,7,'green','shonu','2026-11-19 18:31:33'),(260,'20261119100011001',19872,2,'red','shonu','2026-11-19 18:32:19'),(261,'20261119100011002',12861,1,'green','shonu','2026-11-19 18:33:05'),(262,'20261119100011003',34927,7,'green','shonu','2026-11-19 18:33:51'),(263,'20261119100011004',62914,4,'red','shonu','2026-11-19 18:34:36'),(264,'20261119100011005',95677,7,'green','shonu','2026-11-19 18:35:22'),(265,'20261119100011006',46274,4,'red','shonu','2026-11-19 18:36:08'),(266,'20261119100011007',79131,1,'green','shonu','2026-11-19 18:36:54'),(267,'20261119100011008',73999,9,'green','shonu','2026-11-19 18:37:40'),(268,'20261119100011009',29154,4,'red','shonu','2026-11-19 18:38:26'),(269,'20261119100011010',82617,7,'green','shonu','2026-11-19 18:39:11'),(270,'20261119100011011',57471,1,'green','shonu','2026-11-19 18:39:57'),(271,'20261119100011012',52285,5,'green,violet','shonu','2026-11-19 18:40:43'),(272,'20261119100011013',43680,0,'red,violet','shonu','2026-11-19 18:41:29'),(273,'20261119100011014',87356,6,'red','shonu','2026-11-19 18:42:15'),(274,'20261119100011015',59413,3,'green','shonu','2026-11-19 18:43:01'),(275,'20261119100011016',94431,1,'green','shonu','2026-11-19 18:43:46'),(276,'20261119100011017',73621,1,'green','shonu','2026-11-19 18:44:32'),(277,'20261119100011018',25890,0,'red,violet','shonu','2026-11-19 18:45:18'),(278,'20261119100011019',21815,5,'green,violet','shonu','2026-11-19 18:46:04'),(279,'20261119100011020',79254,4,'red','shonu','2026-11-19 18:46:50'),(280,'20261119100011021',11779,9,'green','shonu','2026-11-19 18:47:35'),(281,'20261119100011022',43720,0,'red,violet','shonu','2026-11-19 18:48:21'),(282,'20261119100011023',39281,1,'green','shonu','2026-11-19 18:49:07'),(283,'20261119100011024',52116,6,'red','shonu','2026-11-19 18:49:53'),(284,'20261119100011025',37970,0,'red,violet','shonu','2026-11-19 18:50:38'),(285,'20261119100011026',64798,8,'red','shonu','2026-11-19 18:51:25'),(286,'20261119100011027',49537,7,'green','shonu','2026-11-19 18:52:10'),(287,'20261119100011028',71657,7,'green','shonu','2026-11-19 18:52:56'),(288,'20261119100011029',72855,5,'green,violet','shonu','2026-11-19 18:53:42'),(289,'20261119100011030',62539,9,'green','shonu','2026-11-19 18:54:27'),(290,'20261119100011031',86756,6,'red','shonu','2026-11-19 18:55:13'),(291,'20261119100011032',69478,8,'red','shonu','2026-11-19 18:55:59'),(292,'20261119100011033',42192,2,'red','shonu','2026-11-19 18:56:45'),(293,'20261119100011034',47985,5,'green,violet','shonu','2026-11-19 18:57:31'),(294,'20261119100011035',16943,3,'green','shonu','2026-11-19 18:58:17'),(295,'20261119100011036',91767,7,'green','shonu','2026-11-19 18:59:02'),(296,'20261119100011037',96939,9,'green','shonu','2026-11-19 18:59:48'),(297,'20261119100011038',98323,3,'green','shonu','2026-11-19 19:00:34'),(298,'20261119100011039',94158,8,'red','shonu','2026-11-19 19:01:19'),(299,'20261119100011040',73995,5,'green,violet','shonu','2026-11-19 19:02:05'),(300,'20261119100011041',73822,2,'red','shonu','2026-11-19 19:02:50'),(301,'20261119100011042',11546,6,'red','shonu','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `wingo_results_1min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_results_30sec`
--

DROP TABLE IF EXISTS `wingo_results_30sec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_results_30sec` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=543 DEFAULT CHARSET=latin1 COMMENT='WinGo 30-sec: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_30sec`
--

LOCK TABLES `wingo_results_30sec` WRITE;
/*!40000 ALTER TABLE `wingo_results_30sec` DISABLE KEYS */;
INSERT INTO `wingo_results_30sec` VALUES (22,'20261119100041503',52471,1,'green','shonu','2026-11-19 12:31:42'),(23,'20261119100041504',45938,8,'red','shonu','2026-11-19 12:33:09'),(24,'20261119100041505',67354,4,'red','shonu','2026-11-19 12:33:39'),(25,'20261119100041506',44889,9,'green','shonu','2026-11-19 12:34:24'),(26,'20261119100041507',86871,1,'green','shonu','2026-11-19 12:34:54'),(27,'20261119100041508',75230,0,'red,violet','shonu','2026-11-19 12:34:55'),(28,'20261119100041529',59740,0,'red,violet','shonu','2026-11-19 12:44:31'),(29,'20261119100041530',31786,6,'red','shonu','2026-11-19 12:45:00'),(30,'20261119100041531',23635,5,'green,violet','shonu','2026-11-19 12:45:30'),(31,'20261119100041532',17340,0,'red,violet','shonu','2026-11-19 12:46:01'),(32,'20261119100041533',62310,0,'red,violet','shonu','2026-11-19 12:46:31'),(33,'20261119100041534',63530,0,'red,violet','uncensored','2026-11-19 12:47:00'),(34,'20261119100041535',72251,1,'green','shonu','2026-11-19 12:47:30'),(35,'20261119100041536',46858,8,'red','shonu','2026-11-19 12:47:42'),(36,'20261119100041537',71454,4,'red','shonu','2026-11-19 12:48:30'),(37,'20261119100041538',42728,8,'red','shonu','2026-11-19 12:49:00'),(38,'20261119100041539',93789,9,'green','shonu','2026-11-19 12:49:30'),(39,'20261119100041540',35169,9,'green','shonu','2026-11-19 12:50:00'),(40,'20261119100041541',81359,9,'green','shonu','2026-11-19 12:50:30'),(41,'20261119100041542',39662,2,'red','shonu','2026-11-19 12:51:01'),(42,'20261119100041543',75639,9,'green','shonu','2026-11-19 12:51:31'),(43,'20261119100041544',26680,0,'red,violet','shonu','2026-11-19 12:52:00'),(44,'20261119100041545',46522,2,'red','shonu','2026-11-19 12:52:30'),(45,'20261119100041546',91670,0,'red,violet','shonu','2026-11-19 12:53:01'),(46,'20261119100041547',21769,9,'green','shonu','2026-11-19 12:53:31'),(47,'20261119100041548',92375,5,'green,violet','shonu','2026-11-19 12:54:00'),(48,'20261119100041549',38283,3,'green','shonu','2026-11-19 12:54:31'),(49,'20261119100041550',48793,3,'green','shonu','2026-11-19 12:55:00'),(50,'20261119100041551',77795,5,'green,violet','shonu','2026-11-19 12:55:30'),(51,'20261119100041552',79472,2,'red','shonu','2026-11-19 12:56:01'),(52,'20261119100041553',11451,1,'green','shonu','2026-11-19 12:56:31'),(53,'20261119100041554',54674,4,'red','shonu','2026-11-19 12:57:00'),(54,'20261119100041555',66840,0,'red,violet','shonu','2026-11-19 12:57:30'),(55,'20261119100041556',97389,9,'green','shonu','2026-11-19 12:58:01'),(56,'20261119100041557',74152,2,'red','shonu','2026-11-19 12:58:31'),(57,'20261119100041558',97984,4,'red','shonu','2026-11-19 12:59:00'),(58,'20261119100041559',37234,4,'red','shonu','2026-11-19 12:59:30'),(59,'20261119100041560',92667,7,'green','shonu','2026-11-19 13:00:00'),(60,'20261119100041561',35991,1,'green','shonu','2026-11-19 13:00:30'),(61,'20261119100041562',32349,9,'green','shonu','2026-11-19 13:01:01'),(62,'20261119100041563',46480,0,'red,violet','shonu','2026-11-19 13:01:31'),(63,'20261119100041564',77693,3,'green','shonu','2026-11-19 13:02:00'),(64,'20261119100041565',16415,5,'green,violet','shonu','2026-11-19 13:02:30'),(65,'20261119100041566',25746,6,'red','shonu','2026-11-19 13:03:00'),(66,'20261119100041567',92697,7,'green','shonu','2026-11-19 13:03:31'),(67,'20261119100041568',94767,7,'green','shonu','2026-11-19 13:04:00'),(68,'20261119100041569',45180,0,'red,violet','shonu','2026-11-19 13:04:30'),(69,'20261119100041570',43213,3,'green','shonu','2026-11-19 13:05:00'),(70,'20261119100041571',56474,4,'red','shonu','2026-11-19 13:05:31'),(71,'20261119100041572',82875,5,'green,violet','shonu','2026-11-19 13:06:00'),(72,'20261119100041573',93885,5,'green,violet','shonu','2026-11-19 13:06:30'),(73,'20261119100041574',49622,2,'red','shonu','2026-11-19 13:07:01'),(74,'20261119100041575',39215,5,'green,violet','shonu','2026-11-19 13:07:31'),(75,'20261119100041576',78183,3,'green','shonu','2026-11-19 13:08:00'),(76,'20261119100041577',86296,6,'red','shonu','2026-11-19 13:08:30'),(77,'20261119100041578',23133,3,'green','shonu','2026-11-19 13:09:00'),(78,'20261119100041579',26966,6,'red','shonu','2026-11-19 13:09:31'),(79,'20261119100041580',49276,6,'red','shonu','2026-11-19 13:10:00'),(80,'20261119100041581',56843,3,'green','shonu','2026-11-19 13:10:30'),(81,'20261119100041582',35171,1,'green','shonu','2026-11-19 13:11:01'),(82,'20261119100041583',39682,2,'red','shonu','2026-11-19 13:11:31'),(83,'20261119100041584',42539,9,'green','shonu','2026-11-19 13:12:00'),(84,'20261119100041585',65811,1,'green','shonu','2026-11-19 13:12:30'),(85,'20261119100041586',49150,0,'red,violet','shonu','2026-11-19 13:13:01'),(86,'20261119100041587',55921,1,'green','shonu','2026-11-19 13:13:31'),(87,'20261119100041588',63115,5,'green,violet','shonu','2026-11-19 13:14:00'),(88,'20261119100041589',29611,1,'green','shonu','2026-11-19 13:14:30'),(89,'20261119100041590',92641,1,'green','shonu','2026-11-19 13:15:01'),(90,'20261119100041591',78477,7,'green','shonu','2026-11-19 13:15:31'),(91,'20261119100041592',91146,6,'red','shonu','2026-11-19 13:16:01'),(92,'20261119100041593',54454,4,'red','shonu','2026-11-19 13:16:31'),(93,'20261119100041594',31329,9,'green','shonu','2026-11-19 13:17:00'),(94,'20261119100041595',23545,5,'green,violet','shonu','2026-11-19 13:17:30'),(95,'20261119100041596',13517,7,'green','shonu','2026-11-19 13:18:00'),(96,'20261119100041597',32482,2,'red','shonu','2026-11-19 13:18:31'),(97,'20261119100041598',83376,6,'red','shonu','2026-11-19 13:19:00'),(98,'20261119100041599',33567,7,'green','shonu','2026-11-19 13:19:30'),(99,'20261119100041600',59551,1,'green','shonu','2026-11-19 13:20:00'),(100,'20261119100041601',33467,7,'green','shonu','2026-11-19 13:20:30'),(101,'20261119100041602',23897,7,'green','shonu','2026-11-19 13:21:01'),(102,'20261119100041603',86817,7,'green','shonu','2026-11-19 13:21:31'),(103,'20261119100041604',39416,6,'red','shonu','2026-11-19 13:22:00'),(104,'20261119100041605',38260,0,'red,violet','shonu','2026-11-19 13:22:30'),(105,'20261119100041606',66871,1,'green','shonu','2026-11-19 13:23:01'),(106,'20261119100041607',68637,7,'green','shonu','2026-11-19 13:23:31'),(107,'20261119100041608',78771,1,'green','shonu','2026-11-19 13:24:00'),(108,'20261119100041609',92768,8,'red','shonu','2026-11-19 13:24:30'),(109,'20261119100041610',44171,1,'green','shonu','2026-11-19 13:25:01'),(110,'20261119100041611',43625,5,'green,violet','shonu','2026-11-19 13:25:31'),(111,'20261119100041612',19257,7,'green','shonu','2026-11-19 13:26:00'),(112,'20261119100041613',64474,4,'red','shonu','2026-11-19 13:26:30'),(113,'20261119100041614',63180,0,'red,violet','shonu','2026-11-19 13:27:01'),(114,'20261119100041615',27988,8,'red','shonu','2026-11-19 13:27:31'),(115,'20261119100041616',18311,1,'green','shonu','2026-11-19 13:28:00'),(116,'20261119100041617',21921,1,'green','shonu','2026-11-19 13:28:30'),(117,'20261119100041618',87831,1,'green','shonu','2026-11-19 13:29:01'),(118,'20261119100041619',52826,6,'red','shonu','2026-11-19 13:29:31'),(119,'20261119100041620',75236,6,'red','shonu','2026-11-19 13:30:00'),(120,'20261119100041621',78895,5,'green,violet','shonu','2026-11-19 13:30:30'),(121,'20261119100041622',37384,4,'red','shonu','2026-11-19 13:31:01'),(122,'20261119100041623',38632,2,'red','shonu','2026-11-19 13:31:31'),(123,'20261119100041624',55178,8,'red','shonu','2026-11-19 13:32:00'),(124,'20261119100041625',43143,3,'green','shonu','2026-11-19 13:32:30'),(125,'20261119100041626',99829,9,'green','shonu','2026-11-19 13:33:00'),(126,'20261119100041627',61525,5,'green,violet','shonu','2026-11-19 13:33:31'),(127,'20261119100041628',29267,7,'green','shonu','2026-11-19 13:34:00'),(128,'20261119100041629',17977,7,'green','shonu','2026-11-19 13:34:30'),(129,'20261119100041630',65852,2,'red','shonu','2026-11-19 13:35:00'),(130,'20261119100041631',18166,6,'red','shonu','2026-11-19 13:35:30'),(131,'20261119100041632',73174,4,'red','shonu','2026-11-19 13:36:01'),(132,'20261119100041633',53290,0,'red,violet','shonu','2026-11-19 13:36:31'),(133,'20261119100041634',84530,0,'red,violet','shonu','2026-11-19 13:37:00'),(134,'20261119100041635',92635,5,'green,violet','shonu','2026-11-19 13:37:30'),(135,'20261119100041636',22249,9,'green','shonu','2026-11-19 13:38:01'),(136,'20261119100041637',47888,8,'red','shonu','2026-11-19 13:38:31'),(137,'20261119100041638',75281,1,'green','shonu','2026-11-19 13:39:00'),(138,'20261119100041639',25122,2,'red','shonu','2026-11-19 13:39:30'),(139,'20261119100041640',37693,3,'green','shonu','2026-11-19 13:40:01'),(140,'20261119100041641',34624,4,'red','shonu','2026-11-19 13:40:31'),(141,'20261119100041642',22956,6,'red','shonu','2026-11-19 13:41:01'),(142,'20261119100041643',15420,0,'red,violet','shonu','2026-11-19 13:41:31'),(143,'20261119100041644',44650,0,'red,violet','shonu','2026-11-19 13:42:00'),(144,'20261119100041645',38237,7,'green','shonu','2026-11-19 13:42:30'),(145,'20261119100041646',72868,8,'red','shonu','2026-11-19 13:43:01'),(146,'20261119100041647',59139,9,'green','shonu','2026-11-19 13:43:31'),(147,'20261119100041648',92996,6,'red','shonu','2026-11-19 13:44:00'),(148,'20261119100041649',95384,4,'red','shonu','2026-11-19 13:44:30'),(149,'20261119100041650',98686,6,'red','shonu','2026-11-19 13:45:00'),(150,'20261119100041651',49190,0,'red,violet','shonu','2026-11-19 13:45:31'),(151,'20261119100041652',13912,2,'red','shonu','2026-11-19 13:46:00'),(152,'20261119100041653',26624,4,'red','shonu','2026-11-19 13:46:30'),(153,'20261119100041654',76123,3,'green','shonu','2026-11-19 13:47:01'),(154,'20261119100041655',39726,6,'red','shonu','2026-11-19 13:47:31'),(155,'20261119100041656',99721,1,'green','shonu','2026-11-19 13:48:00'),(156,'20261119100041657',91166,6,'red','shonu','2026-11-19 13:48:30'),(157,'20261119100041658',79956,6,'red','shonu','2026-11-19 13:49:00'),(158,'20261119100041659',11544,4,'red','shonu','2026-11-19 13:49:30'),(159,'20261119100041660',89658,8,'red','shonu','2026-11-19 13:50:01'),(160,'20261119100041661',67842,2,'red','shonu','2026-11-19 13:50:31'),(161,'20261119100041662',77299,9,'green','shonu','2026-11-19 13:51:01'),(162,'20261119100041663',42581,1,'green','shonu','2026-11-19 13:51:31'),(163,'20261119100041664',62410,0,'red,violet','shonu','2026-11-19 13:52:00'),(164,'20261119100041665',47287,7,'green','shonu','2026-11-19 13:52:30'),(165,'20261119100041666',16698,8,'red','shonu','2026-11-19 13:53:01'),(166,'20261119100041667',87486,6,'red','shonu','2026-11-19 13:53:31'),(167,'20261119100041668',45493,3,'green','shonu','2026-11-19 13:54:00'),(168,'20261119100041669',96722,2,'red','shonu','2026-11-19 13:54:30'),(169,'20261119100041670',75565,5,'green,violet','shonu','2026-11-19 13:55:01'),(170,'20261119100041671',81296,6,'red','shonu','2026-11-19 13:55:31'),(171,'20261119100041672',12146,6,'red','shonu','2026-11-19 13:56:00'),(172,'20261119100041673',12726,6,'red','shonu','2026-11-19 13:56:30'),(173,'20261119100041674',13190,0,'red,violet','shonu','2026-11-19 13:57:01'),(174,'20261119100041675',18961,1,'green','shonu','2026-11-19 13:57:31'),(175,'20261119100041676',56279,9,'green','shonu','2026-11-19 13:58:00'),(176,'20261119100041677',26348,8,'red','shonu','2026-11-19 13:58:30'),(177,'20261119100041678',49753,3,'green','shonu','2026-11-19 13:59:00'),(178,'20261119100041679',81165,5,'green,violet','shonu','2026-11-19 13:59:30'),(179,'20261119100041680',49443,3,'green','shonu','2026-11-19 14:00:01'),(180,'20261119100041681',85959,9,'green','shonu','2026-11-19 14:00:31'),(181,'20261119100041682',53518,8,'red','shonu','2026-11-19 14:01:00'),(182,'20261119100041683',44195,5,'green,violet','shonu','2026-11-19 14:01:31'),(183,'20261119100041684',48431,1,'green','shonu','2026-11-19 14:02:00'),(184,'20261119100041685',18831,1,'green','shonu','2026-11-19 14:02:30'),(185,'20261119100041686',97170,0,'red,violet','shonu','2026-11-19 14:03:00'),(186,'20261119100041687',14984,4,'red','shonu','2026-11-19 14:03:30'),(187,'20261119100041688',67237,7,'green','shonu','2026-11-19 14:04:01'),(188,'20261119100041689',26312,2,'red','shonu','2026-11-19 14:04:31'),(189,'20261119100041690',79445,5,'green,violet','shonu','2026-11-19 14:05:00'),(190,'20261119100041691',99716,6,'red','shonu','2026-11-19 14:05:30'),(191,'20261119100041692',64625,5,'green,violet','shonu','2026-11-19 14:06:01'),(192,'20261119100041693',22223,3,'green','shonu','2026-11-19 14:06:30'),(193,'20261119100041694',32347,7,'green','shonu','2026-11-19 14:07:01'),(194,'20261119100041695',88957,7,'green','shonu','2026-11-19 14:07:31'),(195,'20261119100041696',19945,5,'green,violet','shonu','2026-11-19 14:08:00'),(196,'20261119100041697',71393,3,'green','shonu','2026-11-19 14:08:30'),(197,'20261119100041698',63486,6,'red','shonu','2026-11-19 14:09:00'),(198,'20261119100041699',12311,1,'green','shonu','2026-11-19 14:09:31'),(199,'20261119100041700',31164,4,'red','shonu','2026-11-19 14:10:00'),(200,'20261119100041701',94819,9,'green','shonu','2026-11-19 14:10:31'),(201,'20261119100041702',55488,8,'red','shonu','2026-11-19 14:11:00'),(202,'20261119100041703',81123,3,'green','shonu','2026-11-19 14:11:30'),(203,'20261119100041704',64865,5,'green,violet','shonu','2026-11-19 14:12:01'),(204,'20261119100041705',16130,0,'red,violet','shonu','2026-11-19 14:12:30'),(205,'20261119100041706',99469,9,'green','shonu','2026-11-19 14:13:01'),(206,'20261119100041707',21781,1,'green','shonu','2026-11-19 14:13:31'),(207,'20261119100041708',54650,0,'red,violet','shonu','2026-11-19 14:14:00'),(208,'20261119100041709',84663,3,'green','shonu','2026-11-19 14:14:30'),(209,'20261119100041710',17628,8,'red','shonu','2026-11-19 14:15:00'),(210,'20261119100041711',97712,2,'red','shonu','2026-11-19 14:15:31'),(211,'20261119100041712',44293,3,'green','shonu','2026-11-19 14:16:00'),(212,'20261119100041713',74869,9,'green','shonu','2026-11-19 14:16:30'),(213,'20261119100041714',92662,2,'red','shonu','2026-11-19 14:17:00'),(214,'20261119100041715',35630,0,'red,violet','shonu','2026-11-19 14:17:30'),(215,'20261119100041716',31915,5,'green,violet','shonu','2026-11-19 14:18:01'),(216,'20261119100041717',97142,2,'red','shonu','2026-11-19 14:18:31'),(217,'20261119100041718',12217,7,'green','shonu','2026-11-19 14:19:00'),(218,'20261119100041719',98116,6,'red','shonu','2026-11-19 14:19:30'),(219,'20261119100041720',33429,9,'green','shonu','2026-11-19 14:20:01'),(220,'20261119100041721',41912,2,'red','shonu','2026-11-19 14:20:31'),(221,'20261119100041722',27944,4,'red','shonu','2026-11-19 14:21:01'),(222,'20261119100041723',81118,8,'red','shonu','2026-11-19 14:21:31'),(223,'20261119100041724',21774,4,'red','shonu','2026-11-19 14:22:00'),(224,'20261119100041725',85410,0,'red,violet','shonu','2026-11-19 14:22:30'),(225,'20261119100041726',62674,4,'red','shonu','2026-11-19 14:23:01'),(226,'20261119100041727',34511,1,'green','shonu','2026-11-19 14:23:31'),(227,'20261119100041728',37716,6,'red','shonu','2026-11-19 14:24:00'),(228,'20261119100041729',29813,3,'green','shonu','2026-11-19 14:24:30'),(229,'20261119100041730',77170,0,'red,violet','shonu','2026-11-19 14:25:01'),(230,'20261119100041731',28449,9,'green','shonu','2026-11-19 14:25:31'),(231,'20261119100041732',76490,0,'red,violet','shonu','2026-11-19 14:26:00'),(232,'20261119100041733',37892,2,'red','shonu','2026-11-19 14:26:30'),(233,'20261119100041734',59270,0,'red,violet','shonu','2026-11-19 14:27:01'),(234,'20261119100041735',39148,8,'red','shonu','2026-11-19 14:27:31'),(235,'20261119100041736',66981,1,'green','shonu','2026-11-19 14:28:00'),(236,'20261119100041737',81347,7,'green','shonu','2026-11-19 14:28:30'),(237,'20261119100041738',18864,4,'red','shonu','2026-11-19 14:29:01'),(238,'20261119100041739',68285,5,'green,violet','shonu','2026-11-19 14:29:04'),(239,'20261119100041740',91311,1,'green','shonu','2026-11-19 14:29:31'),(240,'20261119100041741',82598,8,'red','shonu','2026-11-19 14:30:00'),(241,'20261119100041742',14971,1,'green','shonu','2026-11-19 14:31:30'),(242,'20261119100041743',11333,3,'green','shonu','2026-11-19 14:32:01'),(243,'20261119100041744',26538,8,'red','shonu','2026-11-19 14:32:31'),(244,'20261119100041745',83928,8,'red','shonu','2026-11-19 14:33:00'),(245,'20261119100041746',35156,6,'red','shonu','2026-11-19 14:33:30'),(246,'20261119100041747',51927,7,'green','shonu','2026-11-19 14:34:00'),(247,'20261119100041748',74572,2,'red','shonu','2026-11-19 14:34:30'),(248,'20261119100041749',75944,4,'red','shonu','2026-11-19 14:35:00'),(249,'20261119100041750',35433,3,'green','shonu','2026-11-19 14:35:30'),(250,'20261119100041751',25955,5,'green,violet','shonu','2026-11-19 14:36:01'),(251,'20261119100041752',36334,4,'red','shonu','2026-11-19 14:36:31'),(252,'20261119100041753',37848,8,'red','shonu','2026-11-19 14:37:00'),(253,'20261119100041754',79770,0,'red,violet','shonu','2026-11-19 14:37:30'),(254,'20261119100041755',83514,4,'red','shonu','2026-11-19 14:38:01'),(255,'20261119100041756',42512,2,'red','shonu','2026-11-19 14:38:31'),(256,'20261119100041757',68229,9,'green','shonu','2026-11-19 14:39:00'),(257,'20261119100041758',41550,0,'red,violet','shonu','2026-11-19 14:39:31'),(258,'20261119100041759',22397,7,'green','shonu','2026-11-19 14:40:00'),(259,'20261119100041760',56444,4,'red','shonu','2026-11-19 14:40:31'),(260,'20261119100041761',47743,3,'green','shonu','2026-11-19 14:41:00'),(261,'20261119100041762',82127,7,'green','shonu','2026-11-19 14:41:30'),(262,'20261119100041763',97224,4,'red','shonu','2026-11-19 14:42:00'),(263,'20261119100041764',55244,4,'red','shonu','2026-11-19 14:42:31'),(264,'20261119100041765',82160,0,'red,violet','shonu','2026-11-19 14:43:00'),(265,'20261119100041766',47425,5,'green,violet','shonu','2026-11-19 14:43:30'),(266,'20261119100041767',51581,1,'green','shonu','2026-11-19 14:44:00'),(267,'20261119100041768',77670,0,'red,violet','shonu','2026-11-19 14:44:30'),(268,'20261119100041769',17222,2,'red','shonu','2026-11-19 14:45:01'),(269,'20261119100041770',52854,4,'red','shonu','2026-11-19 14:45:31'),(270,'20261119100041771',33965,5,'green,violet','shonu','2026-11-19 14:46:00'),(271,'20261119100041772',52357,7,'green','shonu','2026-11-19 14:46:30'),(272,'20261119100041773',17670,0,'red,violet','shonu','2026-11-19 14:47:01'),(273,'20261119100041774',32546,6,'red','shonu','2026-11-19 14:47:31'),(274,'20261119100041775',25274,4,'red','shonu','2026-11-19 14:48:00'),(275,'20261119100041776',23841,1,'green','shonu','2026-11-19 14:48:30'),(276,'20261119100041777',98691,1,'green','shonu','2026-11-19 14:49:01'),(277,'20261119100041778',69670,0,'red,violet','shonu','2026-11-19 14:49:31'),(278,'20261119100041779',91629,9,'green','shonu','2026-11-19 14:50:00'),(279,'20261119100041780',24141,1,'green','shonu','2026-11-19 14:50:31'),(280,'20261119100041781',56818,8,'red','shonu','2026-11-19 14:51:00'),(281,'20261119100041782',91873,3,'green','shonu','2026-11-19 14:51:30'),(282,'20261119100041783',93123,3,'green','shonu','2026-11-19 14:52:00'),(283,'20261119100041784',92543,3,'green','shonu','2026-11-19 14:52:30'),(284,'20261119100041785',83536,6,'red','shonu','2026-11-19 14:53:01'),(285,'20261119100041786',76921,1,'green','shonu','2026-11-19 14:53:31'),(286,'20261119100041787',31162,2,'red','shonu','2026-11-19 14:54:00'),(287,'20261119100041788',56428,8,'red','shonu','2026-11-19 14:54:30'),(288,'20261119100041789',87423,3,'green','shonu','2026-11-19 14:55:01'),(289,'20261119100041790',41576,6,'red','shonu','2026-11-19 14:55:31'),(290,'20261119100041791',65990,0,'red,violet','shonu','2026-11-19 14:56:00'),(291,'20261119100041792',44468,8,'red','shonu','2026-11-19 14:56:30'),(292,'20261119100041793',62722,2,'red','shonu','2026-11-19 14:57:01'),(293,'20261119100041794',26354,4,'red','shonu','2026-11-19 14:57:31'),(294,'20261119100041795',68319,9,'green','shonu','2026-11-19 14:58:00'),(295,'20261119100041796',92365,5,'green,violet','shonu','2026-11-19 14:58:30'),(296,'20261119100041797',75633,3,'green','shonu','2026-11-19 14:59:01'),(297,'20261119100041798',28912,2,'red','shonu','2026-11-19 14:59:31'),(298,'20261119100041799',85143,3,'green','shonu','2026-11-19 15:00:00'),(299,'20261119100041800',95325,5,'green,violet','shonu','2026-11-19 15:00:30'),(300,'20261119100041801',43897,7,'green','shonu','2026-11-19 15:01:01'),(301,'20261119100041802',42938,8,'red','shonu','2026-11-19 15:01:31'),(302,'20261119100041803',46858,8,'red','shonu','2026-11-19 15:02:00'),(303,'20261119100041804',86879,9,'green','shonu','2026-11-19 15:02:30'),(304,'20261119100041805',54423,3,'green','shonu','2026-11-19 15:03:00'),(305,'20261119100041806',55596,6,'red','shonu','2026-11-19 15:03:31'),(306,'20261119100041807',31467,7,'green','shonu','2026-11-19 15:04:00'),(307,'20261119100041808',84582,2,'red','shonu','2026-11-19 15:04:30'),(308,'20261119100041809',95558,8,'red','shonu','2026-11-19 15:05:00'),(309,'20261119100041810',22181,1,'green','shonu','2026-11-19 15:05:31'),(310,'20261119100041811',17290,0,'red,violet','shonu','2026-11-19 15:06:00'),(311,'20261119100041812',86880,0,'red,violet','shonu','2026-11-19 15:06:30'),(312,'20261119100041813',77378,8,'red','shonu','2026-11-19 15:07:00'),(313,'20261119100041814',47677,7,'green','shonu','2026-11-19 15:07:30'),(314,'20261119100041815',34150,0,'red,violet','shonu','2026-11-19 15:08:01'),(315,'20261119100041816',42729,9,'green','shonu','2026-11-19 15:08:31'),(316,'20261119100041817',55856,6,'red','shonu','2026-11-19 15:09:01'),(317,'20261119100041818',79881,1,'green','shonu','2026-11-19 15:09:31'),(318,'20261119100041819',17857,7,'green','shonu','2026-11-19 15:10:00'),(319,'20261119100041820',47791,1,'green','shonu','2026-11-19 15:10:31'),(320,'20261119100041821',72147,7,'green','shonu','2026-11-19 15:11:00'),(321,'20261119100041822',97359,9,'green','shonu','2026-11-19 15:11:30'),(322,'20261119100041823',73115,5,'green,violet','shonu','2026-11-19 15:12:00'),(323,'20261119100041824',33924,4,'red','shonu','2026-11-19 15:12:31'),(324,'20261119100041825',47327,7,'green','shonu','2026-11-19 15:13:00'),(325,'20261119100041826',62613,3,'green','shonu','2026-11-19 15:13:30'),(326,'20261119100041827',88794,4,'red','shonu','2026-11-19 15:14:00'),(327,'20261119100041828',62650,0,'red,violet','shonu','2026-11-19 15:14:30'),(328,'20261119100041829',77256,6,'red','shonu','2026-11-19 15:15:01'),(329,'20261119100041830',21828,8,'red','shonu','2026-11-19 15:15:31'),(330,'20261119100041831',63134,4,'red','shonu','2026-11-19 15:16:01'),(331,'20261119100041832',55967,7,'green','shonu','2026-11-19 15:16:31'),(332,'20261119100041833',91234,4,'red','shonu','2026-11-19 15:17:00'),(333,'20261119100041834',93391,1,'green','shonu','2026-11-19 15:17:30'),(334,'20261119100041835',54780,0,'red,violet','shonu','2026-11-19 15:18:01'),(335,'20261119100041836',88120,0,'red,violet','shonu','2026-11-19 15:18:31'),(336,'20261119100041837',36384,4,'red','shonu','2026-11-19 15:19:00'),(337,'20261119100041838',41248,8,'red','shonu','2026-11-19 15:19:30'),(338,'20261119100041839',61961,1,'green','shonu','2026-11-19 15:20:01'),(339,'20261119100041840',18848,8,'red','shonu','2026-11-19 15:20:31'),(340,'20261119100041841',44863,3,'green','shonu','2026-11-19 15:21:01'),(341,'20261119100041842',41541,1,'green','shonu','2026-11-19 15:21:31'),(342,'20261119100041843',69974,4,'red','shonu','2026-11-19 15:22:00'),(343,'20261119100041844',56983,3,'green','shonu','2026-11-19 15:22:30'),(344,'20261119100041845',52884,4,'red','shonu','2026-11-19 15:23:00'),(345,'20261119100041846',56684,4,'red','shonu','2026-11-19 15:23:30'),(346,'20261119100041847',47723,3,'green','shonu','2026-11-19 15:24:01'),(347,'20261119100041848',27365,5,'green,violet','shonu','2026-11-19 15:24:31'),(348,'20261119100041849',75977,7,'green','shonu','2026-11-19 15:25:00'),(349,'20261119100041850',61561,1,'green','shonu','2026-11-19 15:25:31'),(350,'20261119100041851',79899,9,'green','shonu','2026-11-19 15:26:00'),(351,'20261119100041852',99897,7,'green','shonu','2026-11-19 15:26:30'),(352,'20261119100041853',65656,6,'red','shonu','2026-11-19 15:27:00'),(353,'20261119100041854',35867,7,'green','shonu','2026-11-19 15:27:31'),(354,'20261119100041855',56840,0,'red,violet','shonu','2026-11-19 15:28:00'),(355,'20261119100041856',94226,6,'red','shonu','2026-11-19 15:28:30'),(356,'20261119100041857',19324,4,'red','shonu','2026-11-19 15:29:00'),(357,'20261119100041858',57334,4,'red','shonu','2026-11-19 15:29:30'),(358,'20261119100041859',18846,6,'red','shonu','2026-11-19 15:30:01'),(359,'20261119100041860',75918,8,'red','shonu','2026-11-19 15:30:31'),(360,'20261119100041861',24611,1,'green','shonu','2026-11-19 15:31:00'),(361,'20261119100041862',82632,2,'red','shonu','2026-11-19 15:31:30'),(362,'20261119100041863',43753,3,'green','shonu','2026-11-19 15:32:01'),(363,'20261119100041864',73371,1,'green','shonu','2026-11-19 15:32:31'),(364,'20261119100041865',53536,6,'red','shonu','2026-11-19 15:33:00'),(365,'20261119100041866',41824,4,'red','shonu','2026-11-19 15:33:30'),(366,'20261119100041867',15712,2,'red','shonu','2026-11-19 15:34:01'),(367,'20261119100041868',18746,6,'red','shonu','2026-11-19 15:34:31'),(368,'20261119100041869',72570,0,'red,violet','shonu','2026-11-19 15:35:00'),(369,'20261119100041870',96587,7,'green','shonu','2026-11-19 15:35:03'),(370,'20261119100041871',32475,5,'green,violet','shonu','2026-11-19 15:35:30'),(371,'20261119100041872',67487,7,'green','shonu','2026-11-19 15:35:51'),(372,'20261119100041873',84929,9,'green','shonu','2026-11-19 15:37:01'),(373,'20261119100041874',91712,2,'red','shonu','2026-11-19 15:37:31'),(374,'20261119100041875',77159,9,'green','shonu','2026-11-19 15:38:00'),(375,'20261119100041876',71914,4,'red','shonu','2026-11-19 15:38:30'),(376,'20261119100041877',25814,4,'red','shonu','2026-11-19 15:38:52'),(377,'20261119100041878',51113,3,'green','shonu','2026-11-19 15:39:00'),(378,'20261119100041879',91773,3,'green','shonu','2026-11-19 17:44:14'),(379,'20261119100042129',58347,7,'green','shonu','2026-11-19 17:44:44'),(380,'20261119100042130',82887,7,'green','shonu','2026-11-19 17:44:59'),(381,'20261119100042131',83435,5,'green,violet','shonu','2026-11-19 17:45:29'),(382,'20261119100042132',41568,8,'red','shonu','2026-11-19 17:45:45'),(383,'20261119100042133',38158,8,'red','shonu','2026-11-19 17:46:16'),(384,'20261119100042134',84190,0,'red,violet','shonu','2026-11-19 17:46:31'),(385,'20261119100042135',64964,4,'red','shonu','2026-11-19 17:47:01'),(386,'20261119100042136',29861,1,'green','shonu','2026-11-19 17:47:17'),(387,'20261119100042137',56359,9,'green','shonu','2026-11-19 17:47:47'),(388,'20261119100042138',36442,2,'red','shonu','2026-11-19 17:48:03'),(389,'20261119100042139',62152,2,'red','shonu','2026-11-19 17:48:33'),(390,'20261119100042140',64993,3,'green','shonu','2026-11-19 17:48:49'),(391,'20261119100042141',32573,3,'green','shonu','2026-11-19 17:49:19'),(392,'20261119100042142',81416,6,'red','shonu','2026-11-19 17:49:35'),(393,'20261119100042143',88793,3,'green','shonu','2026-11-19 17:50:05'),(394,'20261119100042144',95957,7,'green','shonu','2026-11-19 17:50:20'),(395,'20261119100042145',16821,1,'green','shonu','2026-11-19 17:50:51'),(396,'20261119100042146',52825,5,'green,violet','shonu','2026-11-19 17:51:07'),(397,'20261119100042147',12289,9,'green','shonu','2026-11-19 17:51:37'),(398,'20261119100042148',16972,2,'red','shonu','2026-11-19 17:51:53'),(399,'20261119100042149',64514,4,'red','shonu','2026-11-19 17:54:10'),(400,'20261119100042150',15114,4,'red','shonu','2026-11-19 17:54:40'),(401,'20261119100042151',69438,8,'red','shonu','2026-11-19 17:54:56'),(402,'20261119100042152',29654,4,'red','shonu','2026-11-19 17:55:26'),(403,'20261119100042153',12411,1,'green','shonu','2026-11-19 17:55:42'),(404,'20261119100042154',25838,8,'red','shonu','2026-11-19 17:56:12'),(405,'20261119100042155',27782,2,'red','shonu','2026-11-19 17:56:28'),(406,'20261119100042156',33911,1,'green','shonu','2026-11-19 17:56:58'),(407,'20261119100042157',83963,3,'green','shonu','2026-11-19 17:57:13'),(408,'20261119100042158',78285,5,'green,violet','shonu','2026-11-19 17:57:43'),(409,'20261119100042159',14233,3,'green','shonu','2026-11-19 17:57:59'),(410,'20261119100042160',63233,3,'green','shonu','2026-11-19 17:58:29'),(411,'20261119100042161',71973,3,'green','shonu','2026-11-19 17:58:45'),(412,'20261119100042162',65643,3,'green','shonu','2026-11-19 17:59:15'),(413,'20261119100042163',42584,4,'red','shonu','2026-11-19 17:59:31'),(414,'20261119100042164',99329,9,'green','shonu','2026-11-19 18:00:01'),(415,'20261119100042165',54651,1,'green','shonu','2026-11-19 18:00:16'),(416,'20261119100042166',89938,8,'red','shonu','2026-11-19 18:02:33'),(417,'20261119100042167',51533,3,'green','shonu','2026-11-19 18:03:03'),(418,'20261119100042168',54751,1,'green','shonu','2026-11-19 18:03:19'),(419,'20261119100042169',11564,4,'red','shonu','2026-11-19 18:03:49'),(420,'20261119100042170',83998,8,'red','shonu','2026-11-19 18:04:05'),(421,'20261119100042171',14526,6,'red','shonu','2026-11-19 18:04:35'),(422,'20261119100042172',11519,9,'green','shonu','2026-11-19 18:04:50'),(423,'20261119100042173',86940,0,'red,violet','shonu','2026-11-19 18:05:20'),(424,'20261119100042174',14287,7,'green','shonu','2026-11-19 18:05:36'),(425,'20261119100042175',51751,1,'green','shonu','2026-11-19 18:06:06'),(426,'20261119100042176',32862,2,'red','shonu','2026-11-19 18:06:22'),(427,'20261119100042177',11338,8,'red','shonu','2026-11-19 18:06:52'),(428,'20261119100042178',12254,4,'red','shonu','2026-11-19 18:07:08'),(429,'20261119100042179',19864,4,'red','shonu','2026-11-19 18:07:38'),(430,'20261119100042180',89971,1,'green','shonu','2026-11-19 18:07:53'),(431,'20261119100042181',42479,9,'green','shonu','2026-11-19 18:10:11'),(432,'20261119100042182',34839,9,'green','shonu','2026-11-19 18:10:41'),(433,'20261119100042183',99891,1,'green','shonu','2026-11-19 18:10:57'),(434,'20261119100042184',43878,8,'red','shonu','2026-11-19 18:11:27'),(435,'20261119100042185',89393,3,'green','shonu','2026-11-19 18:11:43'),(436,'20261119100042186',58227,7,'green','shonu','2026-11-19 18:12:13'),(437,'20261119100042187',12479,9,'green','shonu','2026-11-19 18:12:29'),(438,'20261119100042188',32194,4,'red','shonu','2026-11-19 18:12:59'),(439,'20261119100042189',16227,7,'green','shonu','2026-11-19 18:13:15'),(440,'20261119100042190',32927,7,'green','shonu','2026-11-19 18:13:45'),(441,'20261119100042191',57496,6,'red','shonu','2026-11-19 18:14:00'),(442,'20261119100042192',33974,4,'red','shonu','2026-11-19 18:14:30'),(443,'20261119100042193',74262,2,'red','shonu','2026-11-19 18:14:46'),(444,'20261119100042194',93755,5,'green,violet','shonu','2026-11-19 18:15:16'),(445,'20261119100042195',71847,7,'green','shonu','2026-11-19 18:15:32'),(446,'20261119100042196',75280,0,'red,violet','shonu','2026-11-19 18:16:02'),(447,'20261119100042197',28275,5,'green,violet','shonu','2026-11-19 18:16:18'),(448,'20261119100042198',16886,6,'red','shonu','2026-11-19 18:18:35'),(449,'20261119100042199',97166,6,'red','shonu','2026-11-19 18:19:05'),(450,'20261119100042200',63793,3,'green','shonu','2026-11-19 18:19:21'),(451,'20261119100042201',66455,5,'green,violet','shonu','2026-11-19 18:19:51'),(452,'20261119100042202',98669,9,'green','shonu','2026-11-19 18:20:07'),(453,'20261119100042203',49879,9,'green','shonu','2026-11-19 18:20:37'),(454,'20261119100042204',99993,3,'green','shonu','2026-11-19 18:20:53'),(455,'20261119100042205',71594,4,'red','shonu','2026-11-19 18:21:24'),(456,'20261119100042206',53394,4,'red','shonu','2026-11-19 18:21:39'),(457,'20261119100042207',66418,8,'red','shonu','2026-11-19 18:22:09'),(458,'20261119100042208',59542,2,'red','shonu','2026-11-19 18:22:25'),(459,'20261119100042209',65541,1,'green','shonu','2026-11-19 18:22:55'),(460,'20261119100042210',59266,6,'red','shonu','2026-11-19 18:23:11'),(461,'20261119100042211',71659,9,'green','shonu','2026-11-19 18:23:41'),(462,'20261119100042212',51817,7,'green','shonu','2026-11-19 18:23:56'),(463,'20261119100042213',63898,8,'red','shonu','2026-11-19 18:26:14'),(464,'20261119100042214',78832,2,'red','shonu','2026-11-19 18:26:44'),(465,'20261119100042215',95874,4,'red','shonu','2026-11-19 18:27:00'),(466,'20261119100042216',75134,4,'red','shonu','2026-11-19 18:27:30'),(467,'20261119100042217',31153,3,'green','shonu','2026-11-19 18:27:45'),(468,'20261119100042218',65644,4,'red','shonu','2026-11-19 18:28:16'),(469,'20261119100042219',46960,0,'red,violet','shonu','2026-11-19 18:28:31'),(470,'20261119100042220',16924,4,'red','shonu','2026-11-19 18:29:01'),(471,'20261119100042221',15866,6,'red','shonu','2026-11-19 18:29:17'),(472,'20261119100042222',64386,6,'red','shonu','2026-11-19 18:29:47'),(473,'20261119100042223',54416,6,'red','shonu','2026-11-19 18:30:03'),(474,'20261119100042224',16610,0,'red,violet','shonu','2026-11-19 18:30:32'),(475,'20261119100042225',33110,0,'red,violet','shonu','2026-11-19 18:30:48'),(476,'20261119100042226',45877,7,'green','shonu','2026-11-19 18:31:18'),(477,'20261119100042227',46236,6,'red','shonu','2026-11-19 18:31:34'),(478,'20261119100042228',72764,4,'red','shonu','2026-11-19 18:32:04'),(479,'20261119100042229',81360,0,'red,violet','shonu','2026-11-19 18:32:19'),(480,'20261119100042230',29192,2,'red','shonu','2026-11-19 18:34:37'),(481,'20261119100042231',98168,8,'red','shonu','2026-11-19 18:35:07'),(482,'20261119100042232',14169,9,'green','shonu','2026-11-19 18:35:22'),(483,'20261119100042233',71476,6,'red','shonu','2026-11-19 18:35:53'),(484,'20261119100042234',69737,7,'green','shonu','2026-11-19 18:36:08'),(485,'20261119100042235',89370,0,'red,violet','shonu','2026-11-19 18:36:39'),(486,'20261119100042236',58561,1,'green','shonu','2026-11-19 18:36:54'),(487,'20261119100042237',14226,6,'red','shonu','2026-11-19 18:37:25'),(488,'20261119100042238',28514,4,'red','shonu','2026-11-19 18:37:40'),(489,'20261119100042239',87696,6,'red','shonu','2026-11-19 18:38:10'),(490,'20261119100042240',44143,3,'green','shonu','2026-11-19 18:38:26'),(491,'20261119100042241',11621,1,'green','shonu','2026-11-19 18:38:56'),(492,'20261119100042242',53719,9,'green','shonu','2026-11-19 18:39:11'),(493,'20261119100042243',77498,8,'red','shonu','2026-11-19 18:39:42'),(494,'20261119100042244',73463,3,'green','shonu','2026-11-19 18:39:57'),(495,'20261119100042245',57875,5,'green,violet','shonu','2026-11-19 18:42:15'),(496,'20261119100042246',85287,7,'green','shonu','2026-11-19 18:42:45'),(497,'20261119100042247',73477,7,'green','shonu','2026-11-19 18:43:01'),(498,'20261119100042248',29438,8,'red','shonu','2026-11-19 18:43:31'),(499,'20261119100042249',76775,5,'green,violet','shonu','2026-11-19 18:43:47'),(500,'20261119100042250',65866,6,'red','shonu','2026-11-19 18:44:17'),(501,'20261119100042251',87461,1,'green','shonu','2026-11-19 18:44:32'),(502,'20261119100042252',69932,2,'red','shonu','2026-11-19 18:45:02'),(503,'20261119100042253',41558,8,'red','shonu','2026-11-19 18:45:18'),(504,'20261119100042254',13691,1,'green','uncensored','2026-11-19 18:45:49'),(505,'20261119100042255',28371,1,'green','uncensored','2026-11-19 18:46:04'),(506,'20261119100042256',47911,1,'green','uncensored','2026-11-19 18:46:34'),(507,'20261119100042257',69741,1,'green','uncensored','2026-11-19 18:46:50'),(508,'20261119100042258',57531,1,'green','uncensored','2026-11-19 18:47:20'),(509,'20261119100042259',55575,5,'green,violet','shonu','2026-11-19 18:47:36'),(510,'20261119100042260',83626,6,'red','shonu','2026-11-19 18:48:06'),(511,'20261119100042261',29779,9,'green','shonu','2026-11-19 18:48:21'),(512,'20261119100042262',72489,9,'green','shonu','2026-11-19 18:50:39'),(513,'20261119100042263',43837,7,'green','shonu','2026-11-19 18:51:09'),(514,'20261119100042264',87962,2,'red','shonu','2026-11-19 18:51:25'),(515,'20261119100042265',75582,2,'red','shonu','2026-11-19 18:51:55'),(516,'20261119100042266',68976,6,'red','shonu','2026-11-19 18:52:11'),(517,'20261119100042267',87576,6,'red','shonu','2026-11-19 18:52:41'),(518,'20261119100042268',21444,4,'red','shonu','2026-11-19 18:52:56'),(519,'20261119100042269',71633,3,'green','shonu','2026-11-19 18:53:26'),(520,'20261119100042270',58633,3,'green','shonu','2026-11-19 18:53:42'),(521,'20261119100042271',58195,5,'green,violet','shonu','2026-11-19 18:54:12'),(522,'20261119100042272',65890,0,'red,violet','shonu','2026-11-19 18:54:28'),(523,'20261119100042273',86698,8,'red','shonu','2026-11-19 18:54:58'),(524,'20261119100042274',71196,6,'red','shonu','2026-11-19 18:55:14'),(525,'20261119100042275',48442,2,'red','shonu','2026-11-19 18:55:44'),(526,'20261119100042276',41796,6,'red','shonu','2026-11-19 18:56:01'),(527,'20261119100042277',43166,6,'red','shonu','2026-11-19 18:56:30'),(528,'20261119100042278',89663,3,'green','shonu','2026-11-19 18:56:45'),(529,'20261119100042279',57687,7,'green','shonu','2026-11-19 18:59:03'),(530,'20261119100042280',41142,2,'red','shonu','2026-11-19 18:59:33'),(531,'20261119100042281',18354,4,'red','shonu','2026-11-19 18:59:48'),(532,'20261119100042282',11860,0,'red,violet','shonu','2026-11-19 19:00:18'),(533,'20261119100042283',65572,2,'red','shonu','2026-11-19 19:00:34'),(534,'20261119100042284',73574,4,'red','shonu','2026-11-19 19:01:04'),(535,'20261119100042285',86515,5,'green,violet','shonu','2026-11-19 19:01:19'),(536,'20261119100042286',46529,9,'green','shonu','2026-11-19 19:01:49'),(537,'20261119100042287',75173,3,'green','shonu','2026-11-19 19:02:05'),(538,'20261119100042288',47144,4,'red','shonu','2026-11-19 19:02:35'),(539,'20261119100042289',86245,5,'green,violet','shonu','2026-11-19 19:02:51'),(540,'20261119100042290',18196,6,'red','shonu','2026-11-19 19:03:21'),(541,'20261119100042291',12360,0,'red,violet','shonu','2026-11-19 19:03:36'),(542,'20261119100042292',49961,1,'green','shonu','2026-11-19 19:04:07');
/*!40000 ALTER TABLE `wingo_results_30sec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_results_3min`
--

DROP TABLE IF EXISTS `wingo_results_3min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_results_3min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COMMENT='WinGo 3-min: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_3min`
--

LOCK TABLES `wingo_results_3min` WRITE;
/*!40000 ALTER TABLE `wingo_results_3min` DISABLE KEYS */;
INSERT INTO `wingo_results_3min` VALUES (6,'20261119100020252',53379,9,'green','shonu','2026-11-19 12:45:00'),(7,'20261119100020253',51466,6,'red','shonu','2026-11-19 12:48:01'),(8,'20261119100020254',16886,6,'red','shonu','2026-11-19 12:51:01'),(9,'20261119100020255',83834,4,'red','shonu','2026-11-19 12:54:00'),(10,'20261119100020256',33126,6,'red','shonu','2026-11-19 12:57:00'),(11,'20261119100020257',41479,9,'green','shonu','2026-11-19 13:00:00'),(12,'20261119100020258',82131,1,'green','shonu','2026-11-19 13:03:00'),(13,'20261119100020259',34220,0,'red,violet','shonu','2026-11-19 13:06:00'),(14,'20261119100020260',24311,1,'green','shonu','2026-11-19 13:09:00'),(15,'20261119100020261',97469,9,'green','shonu','2026-11-19 13:12:00'),(16,'20261119100020262',41411,1,'green','shonu','2026-11-19 13:15:01'),(17,'20261119100020263',64287,7,'green','shonu','2026-11-19 13:18:00'),(18,'20261119100020264',81547,7,'green','shonu','2026-11-19 13:21:01'),(19,'20261119100020265',76339,9,'green','shonu','2026-11-19 13:24:00'),(20,'20261119100020266',67464,4,'red','shonu','2026-11-19 13:27:01'),(21,'20261119100020267',56514,4,'red','shonu','2026-11-19 13:30:00'),(22,'20261119100020268',68351,1,'green','shonu','2026-11-19 13:33:00'),(23,'20261119100020269',84921,1,'green','shonu','2026-11-19 13:36:01'),(24,'20261119100020270',51313,3,'green','shonu','2026-11-19 13:39:00'),(25,'20261119100020271',69924,4,'red','shonu','2026-11-19 13:42:00'),(26,'20261119100020272',51141,1,'green','shonu','2026-11-19 13:45:00'),(27,'20261119100020273',23412,2,'red','shonu','2026-11-19 13:48:00'),(28,'20261119100020274',65879,9,'green','shonu','2026-11-19 13:51:01'),(29,'20261119100020275',74319,9,'green','shonu','2026-11-19 13:54:00'),(30,'20261119100020276',14124,4,'red','shonu','2026-11-19 13:57:01'),(31,'20261119100020277',13282,2,'red','shonu','2026-11-19 14:00:01'),(32,'20261119100020278',59442,2,'red','shonu','2026-11-19 14:03:00'),(33,'20261119100020279',76230,0,'red,violet','shonu','2026-11-19 14:06:01'),(34,'20261119100020280',27338,8,'red','shonu','2026-11-19 14:09:00'),(35,'20261119100020281',98471,1,'green','shonu','2026-11-19 14:12:01'),(36,'20261119100020282',69576,6,'red','shonu','2026-11-19 14:15:00'),(37,'20261119100020283',34993,3,'green','shonu','2026-11-19 14:18:01'),(38,'20261119100020284',75345,5,'green,violet','shonu','2026-11-19 14:21:01'),(39,'20261119100020285',89292,2,'red','shonu','2026-11-19 14:24:00'),(40,'20261119100020286',51339,9,'green','shonu','2026-11-19 14:27:01'),(41,'20261119100020287',26648,8,'red','shonu','2026-11-19 14:33:00'),(42,'20261119100020288',72546,6,'red','shonu','2026-11-19 14:36:01'),(43,'20261119100020289',37847,7,'green','shonu','2026-11-19 14:39:00'),(44,'20261119100020290',35588,8,'red','shonu','2026-11-19 14:42:00'),(45,'20261119100020291',96545,5,'green,violet','shonu','2026-11-19 14:45:01'),(46,'20261119100020292',97977,7,'green','shonu','2026-11-19 14:48:00'),(47,'20261119100020293',66386,6,'red','shonu','2026-11-19 14:51:00'),(48,'20261119100020294',58932,2,'red','shonu','2026-11-19 14:54:00'),(49,'20261119100020295',11187,7,'green','shonu','2026-11-19 14:57:01'),(50,'20261119100020296',54933,3,'green','shonu','2026-11-19 15:00:00'),(51,'20261119100020297',39450,0,'red,violet','shonu','2026-11-19 15:03:00'),(52,'20261119100020298',41645,5,'green,violet','shonu','2026-11-19 15:06:00'),(53,'20261119100020299',78128,8,'red','shonu','2026-11-19 15:09:01'),(54,'20261119100020300',49518,8,'red','shonu','2026-11-19 15:12:00'),(55,'20261119100020301',47563,3,'green','shonu','2026-11-19 15:15:01'),(56,'20261119100020302',98718,8,'red','shonu','2026-11-19 15:18:01'),(57,'20261119100020303',39267,7,'green','shonu','2026-11-19 15:21:01'),(58,'20261119100020304',19430,0,'red,violet','shonu','2026-11-19 15:24:01'),(59,'20261119100020305',82584,4,'red','shonu','2026-11-19 15:27:00'),(60,'20261119100020306',73223,3,'green','shonu','2026-11-19 15:30:01'),(61,'20261119100020307',88928,8,'red','shonu','2026-11-19 15:33:00'),(62,'20261119100020308',51296,6,'red','shonu','2026-11-19 17:45:45'),(63,'20261119100020309',31440,0,'red,violet','shonu','2026-11-19 17:48:03'),(64,'20261119100020310',99774,4,'red','shonu','2026-11-19 17:48:49'),(65,'20261119100020311',74523,3,'green','shonu','2026-11-19 17:51:07'),(66,'20261119100020312',41866,6,'red','shonu','2026-11-19 17:51:53'),(67,'20261119100020313',94630,0,'red,violet','shonu','2026-11-19 17:54:10'),(68,'20261119100020314',71957,7,'green','shonu','2026-11-19 17:54:56'),(69,'20261119100020315',16644,4,'red','shonu','2026-11-19 17:57:13'),(70,'20261119100020316',11613,3,'green','shonu','2026-11-19 17:57:59'),(71,'20261119100020317',53260,0,'red,violet','shonu','2026-11-19 18:00:16'),(72,'20261119100020318',19340,0,'red,violet','shonu','2026-11-19 18:03:19'),(73,'20261119100020319',17622,2,'red','shonu','2026-11-19 18:06:22'),(74,'20261119100020320',85465,5,'green,violet','shonu','2026-11-19 18:09:25'),(75,'20261119100020321',54730,0,'red,violet','shonu','2026-11-19 18:12:29'),(76,'20261119100020322',62356,6,'red','shonu','2026-11-19 18:15:32'),(77,'20261119100020323',92459,9,'green','shonu','2026-11-19 18:18:35'),(78,'20261119100020324',94825,5,'green,violet','shonu','2026-11-19 18:21:39'),(79,'20261119100020325',34423,3,'green','shonu','2026-11-19 18:24:42'),(80,'20261119100020326',58165,5,'green,violet','shonu','2026-11-19 18:27:45'),(81,'20261119100020327',85344,4,'red','shonu','2026-11-19 18:30:03'),(82,'20261119100020328',44576,6,'red','shonu','2026-11-19 18:30:48'),(83,'20261119100020329',38786,6,'red','shonu','2026-11-19 18:33:05'),(84,'20261119100020330',85312,2,'red','shonu','2026-11-19 18:33:51'),(85,'20261119100020331',72265,5,'green,violet','shonu','2026-11-19 18:36:08'),(86,'20261119100020332',21793,3,'green','shonu','2026-11-19 18:36:54'),(87,'20261119100020333',32747,7,'green','shonu','2026-11-19 18:39:11'),(88,'20261119100020334',14871,1,'green','shonu','2026-11-19 18:39:57'),(89,'20261119100020335',77343,3,'green','shonu','2026-11-19 18:42:15'),(90,'20261119100020336',97559,9,'green','shonu','2026-11-19 18:45:18'),(91,'20261119100020337',29735,5,'green,violet','shonu','2026-11-19 18:48:21'),(92,'20261119100020338',81827,7,'green','shonu','2026-11-19 18:51:25'),(93,'20261119100020339',53843,3,'green','shonu','2026-11-19 18:54:28'),(94,'20261119100020340',91327,7,'green','shonu','2026-11-19 18:57:31'),(95,'20261119100020341',36921,1,'green','shonu','2026-11-19 19:00:34'),(96,'20261119100020342',99368,8,'red','shonu','2026-11-19 19:03:36');
/*!40000 ALTER TABLE `wingo_results_3min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wingo_results_5min`
--

DROP TABLE IF EXISTS `wingo_results_5min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wingo_results_5min` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `kalaparichaya` varchar(300) NOT NULL,
  `bele` float NOT NULL,
  `phalitansa` int NOT NULL,
  `banna` varchar(100) NOT NULL,
  `phalitansadaprakara` varchar(50) NOT NULL,
  `dinankavannuracisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shonu`),
  KEY `idx_shonu` (`shonu`),
  KEY `idx_kalaparichaya` (`kalaparichaya`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COMMENT='WinGo 5-min: published results per period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wingo_results_5min`
--

LOCK TABLES `wingo_results_5min` WRITE;
/*!40000 ALTER TABLE `wingo_results_5min` DISABLE KEYS */;
INSERT INTO `wingo_results_5min` VALUES (2,'20261119100030154',59433,3,'green','shonu','2026-11-19 12:50:00'),(3,'20261119100030155',47223,3,'green','shonu','2026-11-19 12:55:00'),(4,'20261119100030156',98362,2,'red','shonu','2026-11-19 13:00:01'),(5,'20261119100030157',97166,6,'red','shonu','2026-11-19 13:05:00'),(6,'20261119100030158',61318,8,'red','shonu','2026-11-19 13:10:00'),(7,'20261119100030159',43551,1,'green','shonu','2026-11-19 13:15:01'),(8,'20261119100030160',42694,4,'red','shonu','2026-11-19 13:20:00'),(9,'20261119100030161',96257,7,'green','shonu','2026-11-19 13:25:01'),(10,'20261119100030162',68963,3,'green','shonu','2026-11-19 13:30:00'),(11,'20261119100030163',24935,5,'green,violet','shonu','2026-11-19 13:35:00'),(12,'20261119100030164',81231,1,'green','shonu','2026-11-19 13:40:01'),(13,'20261119100030165',83383,3,'green','shonu','2026-11-19 13:45:01'),(14,'20261119100030166',38664,4,'red','shonu','2026-11-19 13:50:01'),(15,'20261119100030167',81756,6,'red','shonu','2026-11-19 13:55:01'),(16,'20261119100030168',65524,4,'red','shonu','2026-11-19 14:00:02'),(17,'20261119100030169',52120,0,'red,violet','shonu','2026-11-19 14:05:00'),(18,'20261119100030170',68594,4,'red','shonu','2026-11-19 14:10:00'),(19,'20261119100030171',91673,3,'green','shonu','2026-11-19 14:15:00'),(20,'20261119100030172',26650,0,'red,violet','shonu','2026-11-19 14:20:01'),(21,'20261119100030173',59826,6,'red','shonu','2026-11-19 14:25:01'),(22,'20261119100030174',73274,4,'red','shonu','2026-11-19 14:35:00'),(23,'20261119100030175',33155,5,'green,violet','shonu','2026-11-19 14:40:00'),(24,'20261119100030176',74940,0,'red,violet','shonu','2026-11-19 14:45:01'),(25,'20261119100030177',67374,4,'red','shonu','2026-11-19 14:50:00'),(26,'20261119100030178',96749,9,'green','shonu','2026-11-19 14:55:01'),(27,'20261119100030179',18160,0,'red,violet','shonu','2026-11-19 15:00:00'),(28,'20261119100030180',45938,8,'red','shonu','2026-11-19 15:05:00'),(29,'20261119100030181',33470,0,'red,violet','shonu','2026-11-19 15:10:00'),(30,'20261119100030182',34567,7,'green','shonu','2026-11-19 15:15:01'),(31,'20261119100030183',38124,4,'red','shonu','2026-11-19 15:20:01'),(32,'20261119100030184',68790,0,'red,violet','shonu','2026-11-19 15:25:00'),(33,'20261119100030185',56280,0,'red,violet','shonu','2026-11-19 15:30:01'),(34,'20261119100030186',58195,5,'green,violet','shonu','2026-11-19 15:35:00'),(35,'20261119100030187',95576,6,'red','shonu','2026-11-19 15:35:21'),(36,'20261119100030188',66236,6,'red','shonu','2026-11-19 15:35:48'),(37,'20261119100030189',99973,3,'green','shonu','2026-11-19 17:45:45'),(38,'20261119100030190',37650,0,'red,violet','shonu','2026-11-19 17:50:20'),(39,'20261119100030191',54846,6,'red','shonu','2026-11-19 17:55:42'),(40,'20261119100030192',93276,6,'red','shonu','2026-11-19 18:00:17'),(41,'20261119100030193',91243,3,'green','shonu','2026-11-19 18:05:36'),(42,'20261119100030194',42421,1,'green','shonu','2026-11-19 18:10:11'),(43,'20261119100030195',76147,7,'green','shonu','2026-11-19 18:10:57'),(44,'20261119100030196',46587,7,'green','shonu','2026-11-19 18:15:32'),(45,'20261119100030197',77394,4,'red','shonu','2026-11-19 18:20:07'),(46,'20261119100030198',18992,2,'red','shonu','2026-11-19 18:20:53'),(47,'20261119100030199',13956,6,'red','shonu','2026-11-19 18:25:28'),(48,'20261119100030200',72169,9,'green','shonu','2026-11-19 18:30:03'),(49,'20261119100030201',43483,3,'green','shonu','2026-11-19 18:30:48'),(50,'20261119100030202',74590,0,'red,violet','shonu','2026-11-19 18:35:22'),(51,'20261119100030203',17978,8,'red','shonu','2026-11-19 18:40:43'),(52,'20261119100030204',24522,2,'red','shonu','2026-11-19 18:45:18'),(53,'20261119100030205',19240,0,'red,violet','shonu','2026-11-19 18:50:39'),(54,'20261119100030206',28862,2,'red','shonu','2026-11-19 18:55:14'),(55,'20261119100030207',89118,8,'red','shonu','2026-11-19 18:56:01'),(56,'20261119100030208',35720,0,'red,violet','shonu','2026-11-19 19:00:34');
/*!40000 ALTER TABLE `wingo_results_5min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_requests`
--

DROP TABLE IF EXISTS `withdraw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_requests` (
  `shonu` int NOT NULL AUTO_INCREMENT,
  `balakedara` int NOT NULL DEFAULT '0',
  `motta` varchar(200) NOT NULL DEFAULT '0',
  `dharavahi` varchar(200) NOT NULL,
  `khateshonu` varchar(200) NOT NULL DEFAULT '0',
  `dinankavannuracisi` varchar(200) NOT NULL,
  `madari` int NOT NULL DEFAULT '0',
  `tike` varchar(200) NOT NULL DEFAULT 'Applied',
  `sthiti` int NOT NULL DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shonu`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='Withdrawal requests (order no, account ref, amount, review status)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_requests`
--

LOCK TABLES `withdraw_requests` WRITE;
/*!40000 ALTER TABLE `withdraw_requests` DISABLE KEYS */;
INSERT INTO `withdraw_requests` VALUES (2,11,'110','W2026111917950736218682','1','2026-11-19 13:03:41',0,'Applied',0,NULL),(21,33,'120','W2026111917950943774696','3','2026-11-19 18:49:37',20,'Applied',0,NULL);
/*!40000 ALTER TABLE `withdraw_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bhar42501_SQL'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-19 13:34:13
